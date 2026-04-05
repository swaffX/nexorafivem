local QBCore = exports['qb-core']:GetCoreObject()
local currentMusicId = nil
local isPlaying = false
local isPaused = false -- Yeni: Pause durumu
local currentVolume = Config.DefaultVolume
local currentDistance = Config.MaxDistance
local playlist = {}
local currentIndex = 0
local musicHistory = {} -- Müzik geçmişi
local activeFilters = {} -- Aktif filtreler
local historyLoaded = false -- Geçmiş yüklendi mi?

-- Filtre sistemi değişkenleri
local filterChain = {} -- Aktif filtre zinciri
local baseVolume = Config.DefaultVolume -- Orijinal ses seviyesi
local currentFilteredVolume = Config.DefaultVolume -- Filtreli ses seviyesi
local isTransitioning = false -- Geçiş animasyonu aktif mi?

-- Oyuncu spawn olduğunda geçmişi yükle
RegisterNetEvent('QBCore:Client:OnPlayerLoaded', function()
    TriggerServerEvent('swx_speaker:server:loadHistory')
end)

-- Geçmişi al
RegisterNetEvent('swx_speaker:client:receiveHistory', function(history)
    musicHistory = history
    historyLoaded = true
    
    -- Debug: Gelen geçmişi detaylı logla
    print('[SWX Speaker] Müzik geçmişi yüklendi: ' .. #musicHistory .. ' şarkı')
    for i, song in ipairs(musicHistory) do
        print(string.format('[SWX Speaker] Şarkı %d: Title="%s" | URL="%s"', 
            i, song.title or 'NIL', song.url or 'NIL'))
    end
end)

-- K tuşu ile menü aç
RegisterCommand('speaker', function()
    local ped = PlayerPedId()
    local vehicle = GetVehiclePedIsIn(ped, false)
    
    if vehicle == 0 then
        QBCore.Functions.Notify('Araçta değilsin!', 'error')
        return
    end
    
    local seat = GetPedInVehicleSeat(vehicle, -1)
    if seat ~= ped then
        QBCore.Functions.Notify('Sürücü koltuğunda değilsin!', 'error')
        return
    end
    
    OpenSpeakerMenu()
end, false)

RegisterKeyMapping('speaker', 'Hoparlör Etkileşimi', 'keyboard', Config.OpenKey)

function OpenSpeakerMenu()
    lib.registerContext({
        id = 'speaker_menu',
        title = 'Hoparlör etkileşimi',
        options = {
            {
                title = 'Müzik çal',
                description = 'Youtube videoları ve çalma listeleri destekleniyor.',
                icon = 'play',
                onSelect = function()
                    PlayMusicDialog()
                end
            },
            {
                title = 'Müzik sıraya al',
                description = 'Bir şarkıyı sıraya ekle.',
                icon = 'list',
                onSelect = function()
                    AddToQueueDialog()
                end
            },
            {
                title = 'Sonraki şarkı',
                description = 'Sıradaki sonraki şarkıyı çal.',
                icon = 'forward',
                disabled = #playlist == 0,
                onSelect = function()
                    PlayNextSong()
                end
            },
            {
                title = isPaused and 'Müziği devam ettir' or 'Müziği duraklat',
                description = isPaused and 'Müziği yeniden başlat' or 'Mevcut şarkıyı duraklat',
                icon = isPaused and 'play' or 'pause',
                disabled = not isPlaying and not isPaused,
                onSelect = function()
                    TogglePause()
                end
            },
            {
                title = 'Ses seviyesini/aralığını değiştir',
                description = 'Müzik sesini veya aralığını ayarla.',
                icon = 'volume-up',
                onSelect = function()
                    VolumeRangeDialog()
                end
            },
            {
                title = 'Hoparlörü tut',
                description = 'Hoparlörü taşı.',
                icon = 'hand',
                onSelect = function()
                    QBCore.Functions.Notify('Taşınabilir hoparlör özelliği yakında!', 'info')
                end
            },
            {
                title = 'Hoparlörü yerden al',
                description = 'Hoparlörü yerden al.',
                icon = 'trash',
                onSelect = function()
                    QBCore.Functions.Notify('Taşınabilir hoparlör özelliği yakında!', 'info')
                end
            },
            {
                title = 'Diğer',
                description = 'Sırayı yönet, müzik geçmişi, filtreler.',
                icon = 'cog',
                onSelect = function()
                    OtherMenu()
                end
            }
        }
    })
    
    lib.showContext('speaker_menu')
end

function PlayMusicDialog()
    local input = lib.inputDialog('Müzik Çal', {
        {
            type = 'input',
            label = 'YouTube URL',
            description = 'YouTube video veya playlist URL\'si girin',
            required = true,
            icon = 'link'
        },
        {
            type = 'input',
            label = 'Şarkı Adı (Opsiyonel)',
            description = 'Şarkı adını girin',
            icon = 'music'
        }
    })
    
    if input then
        local url = input[1]
        local title = input[2] or 'Bilinmeyen Şarkı'
        PlayMusic(url, title)
    end
end

function AddToQueueDialog()
    local input = lib.inputDialog('Sıraya Ekle', {
        {
            type = 'input',
            label = 'YouTube URL',
            description = 'Sıraya eklenecek şarkı URL\'si',
            required = true,
            icon = 'link'
        },
        {
            type = 'input',
            label = 'Şarkı Adı (Opsiyonel)',
            description = 'Şarkı adını girin',
            icon = 'music'
        }
    })
    
    if input then
        table.insert(playlist, {
            url = input[1],
            title = input[2] or 'Bilinmeyen Şarkı'
        })
        QBCore.Functions.Notify('Şarkı sıraya eklendi! (' .. #playlist .. ' şarkı)', 'success')
    end
end

function PlayMusic(url, title)
    if currentMusicId then
        exports.xsound:Destroy(currentMusicId)
    end
    
    currentMusicId = "speaker_" .. GetPlayerServerId(PlayerId()) .. "_" .. math.random(1000, 9999)
    
    local ped = PlayerPedId()
    local vehicle = GetVehiclePedIsIn(ped, false)
    
    if vehicle ~= 0 and DoesEntityExist(vehicle) then
        local coords = GetEntityCoords(vehicle)
        
        exports.xsound:PlayUrlPos(currentMusicId, url, currentVolume, coords, false)
        exports.xsound:Distance(currentMusicId, currentDistance)
        
        -- Bass kontrolü xsound'da desteklenmiyor, kaldırıldı
        
        isPlaying = true
        isPaused = false -- Yeni müzik başladı, pause durumunu sıfırla
        
        -- Geçmişe ekle (local) - FiveM uyumlu timestamp
        local timestamp = GetGameTimer() -- Milisaniye cinsinden
        table.insert(musicHistory, 1, {
            url = url,
            title = title or 'Bilinmeyen Şarkı',
            timestamp = timestamp
        })
        
        -- Geçmişi 50 ile sınırla (local)
        if #musicHistory > 50 then
            table.remove(musicHistory, #musicHistory)
        end
        
        -- Server'a kaydet (kalıcı)
        TriggerServerEvent('swx_speaker:server:addToHistory', url, title or 'Bilinmeyen Şarkı')
        
        -- Base volume'u güncelle
        baseVolume = currentVolume
        currentFilteredVolume = currentVolume
        
        -- Aktif filtreleri uygula (eğer varsa) - Smooth transition ile
        if filterChain and next(filterChain) ~= nil then
            CreateThread(function()
                Wait(1500) -- Şarkı yüklenmesini bekle
                RecalculateFilterChain()
            end)
        end
        
        CreateThread(function()
            while isPlaying and DoesEntityExist(vehicle) do
                local newCoords = GetEntityCoords(vehicle)
                exports.xsound:Position(currentMusicId, newCoords)
                Wait(500)
            end
        end)
        
        QBCore.Functions.Notify('Müzik çalıyor!', 'success')
    end
end

function PlayNextSong()
    if #playlist == 0 then
        QBCore.Functions.Notify('Playlist boş!', 'error')
        return
    end
    
    currentIndex = currentIndex + 1
    if currentIndex > #playlist then
        currentIndex = 1
    end
    
    local song = playlist[currentIndex]
    PlayMusic(song.url, song.title)
    QBCore.Functions.Notify('Çalıyor: ' .. song.title, 'info')
end

function TogglePause()
    if not currentMusicId then return end
    
    if isPaused then
        -- Duraklatılmış, devam ettir
        exports.xsound:Resume(currentMusicId)
        isPaused = false
        isPlaying = true
        QBCore.Functions.Notify('Müzik devam ediyor', 'success')
    else
        -- Çalıyor, duraklat
        exports.xsound:Pause(currentMusicId)
        isPaused = true
        isPlaying = false
        QBCore.Functions.Notify('Müzik duraklatıldı', 'info')
    end
end

function VolumeRangeDialog()
    local input = lib.inputDialog('Ses seviyesini/aralığını değiştir', {
        {
            type = 'slider',
            label = 'Ses seviyesi (0.10-1.5)',
            min = 10,
            max = 150,
            default = math.floor(currentVolume * 100),
            required = true
        },
        {
            type = 'slider',
            label = 'Müzik aralığı (1.0-75.0)',
            min = 10,
            max = 750,
            default = math.floor(currentDistance * 10),
            required = true
        }
    })
    
    if input then
        currentVolume = input[1] / 100
        currentDistance = input[2] / 10
        
        -- Base volume'u güncelle
        baseVolume = currentVolume
        
        if currentMusicId then
            exports.xsound:Distance(currentMusicId, currentDistance)
            
            -- Filtreler varsa yeniden hesapla, yoksa direkt ayarla
            if filterChain and next(filterChain) ~= nil then
                RecalculateFilterChain()
            else
                exports.xsound:setVolume(currentMusicId, currentVolume)
            end
        end
        
        QBCore.Functions.Notify('Ses: ' .. string.format("%.2f", currentVolume) .. ' | Mesafe: ' .. string.format("%.1f", currentDistance) .. 'm', 'success')
    end
end

function OtherMenu()
    lib.registerContext({
        id = 'other_menu',
        title = 'Diğer',
        menu = 'speaker_menu',
        options = {
            {
                title = 'Sırayı yönet',
                description = 'Hemen çal, çıkar, vb.',
                icon = 'bars',
                onSelect = function()
                    ManageQueueMenu()
                end
            },
            {
                title = 'Müzik geçmişi',
                description = 'Müzik geçmişi, favoriler.',
                icon = 'history',
                onSelect = function()
                    MusicHistoryMenu()
                end
            },
            {
                title = 'Filtreler',
                description = 'Filtreleri çıkışa uygula.',
                icon = 'filter',
                onSelect = function()
                    FiltersMenu()
                end
            },
            {
                title = 'Bağlan',
                description = 'Hoparlörleri bir gruba bağla.',
                icon = 'link',
                onSelect = function()
                    QBCore.Functions.Notify('Bağlantı özelliği yakında!', 'info')
                end
            },
            {
                title = 'Herkese açık durum',
                description = 'Herkese açık durumu değiştir.',
                icon = 'globe',
                onSelect = function()
                    QBCore.Functions.Notify('Durum özelliği yakında!', 'info')
                end
            },
            {
                title = 'Kalıcı durum',
                description = 'Hoparlörü kalıcı olarak işaretle.',
                icon = 'lock',
                onSelect = function()
                    QBCore.Functions.Notify('Kalıcılık özelliği yakında!', 'info')
                end
            },
            {
                title = 'Hoparlörü yeniden adlandır',
                description = 'Mevcut ad: MooseSeagullRaccoon.',
                icon = 'tag',
                onSelect = function()
                    RenameDialog()
                end
            }
        }
    })
    
    lib.showContext('other_menu')
end

function ManageQueueMenu()
    lib.registerContext({
        id = 'manage_queue_menu',
        title = 'Sırayı yönet',
        menu = 'other_menu',
        options = {
            {
                title = 'Müziği Durdur',
                description = 'Müziği tamamen durdur',
                icon = 'stop',
                onSelect = function()
                    if currentMusicId then
                        exports.xsound:Destroy(currentMusicId)
                        currentMusicId = nil
                        isPlaying = false
                        isPaused = false
                        QBCore.Functions.Notify('Müzik durduruldu', 'error')
                    end
                end
            },
            {
                title = 'Playlist\'i Göster',
                description = 'Sıradaki şarkıları göster',
                icon = 'list',
                disabled = #playlist == 0,
                onSelect = function()
                    ShowPlaylist()
                end
            },
            {
                title = 'Playlist\'i Temizle',
                description = 'Tüm sırayı temizle',
                icon = 'trash',
                disabled = #playlist == 0,
                onSelect = function()
                    playlist = {}
                    currentIndex = 0
                    QBCore.Functions.Notify('Playlist temizlendi', 'info')
                end
            }
        }
    })
    
    lib.showContext('manage_queue_menu')
end

function MusicHistoryMenu()
    -- Geçmiş yüklenmemişse yükle
    if not historyLoaded then
        TriggerServerEvent('swx_speaker:server:loadHistory')
        Wait(500) -- Server'dan cevap bekle
    end
    
    -- Debug: musicHistory içeriğini logla
    print('[SWX Speaker Debug] MusicHistoryMenu açılıyor')
    print('[SWX Speaker Debug] Geçmiş sayısı: ' .. #musicHistory)
    print('[SWX Speaker Debug] historyLoaded: ' .. tostring(historyLoaded))
    
    if #musicHistory == 0 then
        QBCore.Functions.Notify('Müzik geçmişi boş! Bir şarkı çalın.', 'error')
        return
    end
    
    -- Duplicate kontrolü: Aynı URL'den sadece 1 tane göster
    local uniqueSongs = {}
    local seenUrls = {}
    
    for i, song in ipairs(musicHistory) do
        -- Debug: Her şarkıyı kontrol et
        print(string.format('[SWX Speaker Debug] İşleniyor %d: song=%s | url=%s | title=%s', 
            i, tostring(song), tostring(song.url), tostring(song.title)))
        
        if song and song.url and not seenUrls[song.url] then
            -- Title kontrolü ve fallback
            local songTitle = song.title
            if not songTitle or songTitle == '' or songTitle == 'nil' then
                songTitle = 'Bilinmeyen Şarkı #' .. i
                print('[SWX Speaker Debug] Title boş, fallback kullanıldı: ' .. songTitle)
            end
            
            table.insert(uniqueSongs, {
                url = song.url,
                title = songTitle,
                timestamp = song.timestamp
            })
            seenUrls[song.url] = true
        end
    end
    
    -- Eğer tüm şarkılar duplicate veya geçersizse
    if #uniqueSongs == 0 then
        QBCore.Functions.Notify('Müzik geçmişi boş!', 'error')
        return
    end
    
    local options = {}
    for i, song in ipairs(uniqueSongs) do
        local songTitle = song.title or 'Bilinmeyen Şarkı'
        
        -- Debug: Menüye eklenen her şarkıyı logla
        print('[SWX Speaker Debug] Menüye ekleniyor: "' .. songTitle .. '"')
        
        table.insert(options, {
            title = songTitle,
            icon = 'music',
            arrow = true,
            onSelect = function()
                SongActionMenu(song)
            end
        })
    end
    
    -- Eğer hiç option yoksa
    if #options == 0 then
        QBCore.Functions.Notify('Şarkı listesi oluşturulamadı!', 'error')
        return
    end
    
    lib.registerContext({
        id = 'music_history_menu',
        title = 'Hoparlör geçmişi (' .. #uniqueSongs .. ' şarkı)',
        menu = 'other_menu',
        options = options
    })
    
    lib.showContext('music_history_menu')
end

function SongActionMenu(song)
    lib.registerContext({
        id = 'song_action_menu',
        title = 'Eylem seç',
        menu = 'music_history_menu',
        options = {
            {
                title = 'Şimdi çal',
                description = 'Bu şarkıyı hemen çal',
                icon = 'play',
                onSelect = function()
                    PlayMusic(song.url, song.title)
                end
            },
            {
                title = 'Sıraya ekle',
                description = 'Bu şarkıyı sıraya ekle',
                icon = 'list',
                onSelect = function()
                    table.insert(playlist, {
                        url = song.url,
                        title = song.title
                    })
                    QBCore.Functions.Notify('Şarkı sıraya eklendi!', 'success')
                end
            },
            {
                title = 'Favori',
                description = 'Favorilere ekle',
                icon = 'star',
                onSelect = function()
                    QBCore.Functions.Notify('Favori özelliği yakında!', 'info')
                end
            },
            {
                title = 'Geçmişten sil',
                description = 'Bu şarkıyı geçmişten kaldır',
                icon = 'trash',
                onSelect = function()
                    for i, v in ipairs(musicHistory) do
                        if v.url == song.url and v.timestamp == song.timestamp then
                            table.remove(musicHistory, i)
                            TriggerServerEvent('swx_speaker:server:removeFromHistory', song.url, song.timestamp)
                            QBCore.Functions.Notify('Geçmişten silindi', 'success')
                            break
                        end
                    end
                end
            }
        }
    })
    
    lib.showContext('song_action_menu')
end

function RenameDialog()
    local input = lib.inputDialog('Hoparlörü Yeniden Adlandır', {
        {
            type = 'input',
            label = 'Yeni İsim',
            description = 'Hoparlör için yeni bir isim girin',
            required = true,
            icon = 'tag'
        }
    })
    
    if input then
        QBCore.Functions.Notify('Hoparlör adı: ' .. input[1], 'success')
    end
end

function ShowPlaylist()
    if #playlist == 0 then
        QBCore.Functions.Notify('Playlist boş!', 'error')
        return
    end
    
    local options = {}
    for i, song in ipairs(playlist) do
        table.insert(options, {
            title = song.title,
            description = 'Şarkı #' .. i,
            icon = 'music',
            onSelect = function()
                PlaylistSongActionMenu(song, i)
            end
        })
    end
    
    lib.registerContext({
        id = 'playlist_menu',
        title = 'Playlist (' .. #playlist .. ' şarkı)',
        menu = 'manage_queue_menu',
        options = options
    })
    
    lib.showContext('playlist_menu')
end

function PlaylistSongActionMenu(song, index)
    lib.registerContext({
        id = 'playlist_song_action_menu',
        title = 'Eylem seç',
        menu = 'playlist_menu',
        options = {
            {
                title = 'Şimdi çal',
                description = 'Bu şarkıyı hemen çal',
                icon = 'play',
                onSelect = function()
                    currentIndex = index
                    PlayMusic(song.url, song.title)
                end
            },
            {
                title = 'Sıradan çıkar',
                description = 'Bu şarkıyı sıradan kaldır',
                icon = 'trash',
                onSelect = function()
                    table.remove(playlist, index)
                    QBCore.Functions.Notify('Şarkı sıradan çıkarıldı', 'success')
                end
            }
        }
    })
    
    lib.showContext('playlist_song_action_menu')
end

-- Araçtan inince durdur
CreateThread(function()
    local wasInVehicle = false
    
    while true do
        Wait(1000)
        
        if isPlaying then
            local ped = PlayerPedId()
            local inVehicle = IsPedInAnyVehicle(ped, false)
            
            if wasInVehicle and not inVehicle then
                if currentMusicId then
                    exports.xsound:Destroy(currentMusicId)
                    currentMusicId = nil
                    isPlaying = false
                    isPaused = false
                end
            end
            
            wasInVehicle = inVehicle
        end
    end
end)

-- Filtreler Menüsü
function FiltersMenu()
    local activeCount = 0
    for _ in pairs(activeFilters) do
        activeCount = activeCount + 1
    end
    
    local options = {
        {
            title = 'Yeni filtre',
            description = 'Ses çıkışını değiştir.',
            icon = 'sliders',
            onSelect = function()
                FilterTypeMenu()
            end
        }
    }
    
    -- Aktif filtreleri göster
    if activeCount > 0 then
        table.insert(options, 1, {
            title = 'Aktif filtreler (' .. activeCount .. ')',
            description = 'Filtreleri yönet ve kaldır',
            icon = 'filter',
            onSelect = function()
                ActiveFiltersMenu()
            end
        })
        
        -- Tüm filtreleri temizle seçeneği
        table.insert(options, {
            title = 'Tüm filtreleri temizle',
            description = 'Tüm filtreleri kaldır ve orijinal sese dön',
            icon = 'trash',
            onSelect = function()
                ClearAllFilters()
            end
        })
    else
        table.insert(options, 1, {
            title = 'Toplam 0 aktif filtre.',
            description = 'Henüz filtre eklenmedi',
            icon = 'filter',
            disabled = true
        })
    end
    
    lib.registerContext({
        id = 'filters_menu',
        title = 'Hoparlör filtreleri',
        menu = 'other_menu',
        options = options
    })
    
    lib.showContext('filters_menu')
end

-- Aktif Filtreler Menüsü
function ActiveFiltersMenu()
    local options = {}
    
    for filterId, filter in pairs(activeFilters) do
        table.insert(options, {
            title = filter.type:upper(),
            description = string.format('Freq: %d Hz | Gain: %d dB | Detune: %d', 
                filter.frequency, filter.gain, filter.detune),
            icon = 'wave-square',
            onSelect = function()
                FilterActionMenu(filterId, filter)
            end
        })
    end
    
    lib.registerContext({
        id = 'active_filters_menu',
        title = 'Aktif Filtreler',
        menu = 'filters_menu',
        options = options
    })
    
    lib.showContext('active_filters_menu')
end

-- Filtre Eylem Menüsü
function FilterActionMenu(filterId, filter)
    lib.registerContext({
        id = 'filter_action_menu',
        title = filter.type:upper() .. ' Filtresi',
        menu = 'active_filters_menu',
        options = {
            {
                title = 'Filtreyi düzenle',
                description = 'Filtre ayarlarını değiştir',
                icon = 'edit',
                onSelect = function()
                    EditFilterDialog(filterId, filter)
                end
            },
            {
                title = 'Filtreyi kaldır',
                description = 'Bu filtreyi sil',
                icon = 'trash',
                onSelect = function()
                    RemoveFilter(filterId)
                end
            }
        }
    })
    
    lib.showContext('filter_action_menu')
end

-- Filtre Düzenleme
function EditFilterDialog(filterId, filter)
    local input = lib.inputDialog('Filtre Düzenle: ' .. filter.type:upper(), {
        {
            type = 'number',
            label = 'Frequency',
            description = '10 ile 10000 arasında Hz',
            min = 10,
            max = 10000,
            default = filter.frequency,
            required = true,
            icon = 'signal'
        },
        {
            type = 'number',
            label = 'Gain',
            description = '-40 ile 40 arasında dB',
            min = -40,
            max = 40,
            default = filter.gain,
            required = true,
            icon = 'volume-up'
        },
        {
            type = 'number',
            label = 'Detune',
            description = '-4800 ile 4800 arasında cents',
            min = -4800,
            max = 4800,
            default = filter.detune,
            required = true,
            icon = 'music'
        }
    })
    
    if input then
        activeFilters[filterId].frequency = input[1]
        activeFilters[filterId].gain = input[2]
        activeFilters[filterId].detune = input[3]
        
        -- Filtreyi uygula
        ApplyFilter(filterId, activeFilters[filterId])
        QBCore.Functions.Notify('Filtre güncellendi: ' .. filter.type:upper(), 'success')
    end
end

-- Filtre Kaldırma
function RemoveFilter(filterId)
    if activeFilters[filterId] then
        local filterType = activeFilters[filterId].type
        
        -- Chain'den kaldır
        filterChain[filterId] = nil
        activeFilters[filterId] = nil
        
        -- Kalan filtreleri yeniden hesapla
        RecalculateFilterChain()
        
        QBCore.Functions.Notify('Filtre kaldırıldı: ' .. filterType:upper(), 'success')
    end
end

-- Filtre Tipi Seçimi
function FilterTypeMenu()
    lib.registerContext({
        id = 'filter_type_menu',
        title = 'Filtre tipi',
        menu = 'filters_menu',
        options = {
            {
                title = 'Lowpass (Alçak Geçiren)',
                description = 'Boğuk, kapalı ses - Araba camı kapalı efekti',
                icon = 'wave-square',
                onSelect = function()
                    FilterSettingsDialog('lowpass')
                end
            },
            {
                title = 'Highpass (Yüksek Geçiren)',
                description = 'İnce, telefon sesi - Radyo/telefon efekti',
                icon = 'wave-square',
                onSelect = function()
                    FilterSettingsDialog('highpass')
                end
            },
            {
                title = 'Bandpass (Bant Geçiren)',
                description = 'Dar, filtrelenmiş ses - Telsiz efekti',
                icon = 'wave-square',
                onSelect = function()
                    FilterSettingsDialog('bandpass')
                end
            },
            {
                title = 'Notch (Bant Kesici)',
                description = 'Belirli frekansı keser - Cızırtı temizleme',
                icon = 'wave-square',
                onSelect = function()
                    FilterSettingsDialog('notch')
                end
            },
            {
                title = 'Peaking (Tepe Artırma)',
                description = 'Bass boost veya tiz boost',
                icon = 'wave-square',
                onSelect = function()
                    FilterSettingsDialog('peaking')
                end
            },
            {
                title = 'Lowshelf (Alt Raf)',
                description = 'Tüm bassları yükseltir - Subwoofer efekti',
                icon = 'wave-square',
                onSelect = function()
                    FilterSettingsDialog('lowshelf')
                end
            },
            {
                title = 'Highshelf (Üst Raf)',
                description = 'Parlaklık artışı - Müziği daha net yapar',
                icon = 'wave-square',
                onSelect = function()
                    FilterSettingsDialog('highshelf')
                end
            },
            {
                title = 'Allpass (Tüm Geçiren)',
                description = 'Faz değişimi - Echo/reverb altyapısı',
                icon = 'wave-square',
                onSelect = function()
                    FilterSettingsDialog('allpass')
                end
            }
        }
    })
    
    lib.showContext('filter_type_menu')
end

-- Filtre Ayarları Dialog
function FilterSettingsDialog(filterType)
    local input = lib.inputDialog('Filtre değerleri', {
        {
            type = 'number',
            label = 'Frequency',
            description = '10 ile 10000 arasında Hz',
            min = 10,
            max = 10000,
            default = 350,
            required = true,
            icon = 'signal'
        },
        {
            type = 'number',
            label = 'Gain',
            description = '-40 ile 40 arasında dB',
            min = -40,
            max = 40,
            default = 0,
            required = true,
            icon = 'volume-up'
        },
        {
            type = 'number',
            label = 'Detune',
            description = '-4800 ile 4800 arasında cents',
            min = -4800,
            max = 4800,
            default = 0,
            required = true,
            icon = 'music'
        }
    })
    
    if input then
        local frequency = input[1]
        local gain = input[2]
        local detune = input[3]
        
        -- Filtreyi kaydet
        local filterId = filterType .. '_' .. math.random(1000, 9999)
        activeFilters[filterId] = {
            type = filterType,
            frequency = frequency,
            gain = gain,
            detune = detune
        }
        
        -- Filtreyi uygula
        ApplyFilter(filterId, activeFilters[filterId])
        
        QBCore.Functions.Notify('Filtre eklendi: ' .. filterType:upper(), 'success')
    end
end

-- ============================================
-- PROFESYONEL FİLTRE SİSTEMİ v2.0
-- ============================================
-- Chain mantığı: Birden fazla filtre aynı anda aktif
-- Smooth transitions: Fade in/out efektleri
-- Safe gain values: Distortion önleme
-- ============================================

local filterChain = {} -- Aktif filtre zinciri
local baseVolume = Config.DefaultVolume -- Orijinal ses seviyesi
local currentFilteredVolume = Config.DefaultVolume -- Filtreli ses seviyesi
local isTransitioning = false -- Geçiş animasyonu aktif mi?

-- Filtre Uygulama Fonksiyonu (Chain + Smooth Transition)
function ApplyFilter(filterId, filter)
    if not currentMusicId then
        return
    end
    
    -- Filtreyi chain'e ekle
    filterChain[filterId] = filter
    
    -- Debug log
    print(string.format('[SWX Speaker] Filtre eklendi: %s | Gain: %d dB | Freq: %d Hz', 
        filter.type:upper(), filter.gain, filter.frequency))
    
    -- Tüm filtreleri hesapla ve uygula
    RecalculateFilterChain()
end

-- Tüm Filtre Zincirini Yeniden Hesapla
function RecalculateFilterChain()
    if not currentMusicId or isTransitioning then
        return
    end
    
    -- filterChain nil kontrolü
    if not filterChain then
        filterChain = {}
        return
    end
    
    -- Başlangıç: Orijinal volume
    local targetVolume = baseVolume
    local volumeMultiplier = 1.0
    
    -- Tüm aktif filtreleri chain olarak uygula
    for filterId, filter in pairs(filterChain) do
        if filter and filter.type then
            local filterType = filter.type:lower()
            local gain = filter.gain or 0
            local frequency = filter.frequency or 350
            
            -- Her filtre tipine göre volume çarpanı hesapla
            local filterMultiplier = CalculateFilterMultiplier(filterType, gain, frequency)
            volumeMultiplier = volumeMultiplier * filterMultiplier
        end
    end
    
    -- Hedef volume'u hesapla (safe limits)
    targetVolume = baseVolume * volumeMultiplier
    targetVolume = math.max(0.1, math.min(1.5, targetVolume)) -- 0.1 - 1.5 arası sınırla
    
    -- Debug log
    print(string.format('[SWX Speaker] Filtre hesaplama: Base: %.2f | Multiplier: %.2f | Target: %.2f', 
        baseVolume, volumeMultiplier, targetVolume))
    
    -- Smooth transition ile uygula
    SmoothVolumeTransition(currentFilteredVolume, targetVolume, 500) -- 500ms geçiş
    
    currentFilteredVolume = targetVolume
end

-- Filtre Çarpanı Hesapla (Safe Gain Values)
function CalculateFilterMultiplier(filterType, gain, frequency)
    -- Gain'i safe aralığa normalize et (-20 ile +20 arası)
    local safeGain = math.max(-20, math.min(20, gain))
    
    if filterType == 'lowpass' then
        -- Alçak geçiren: Yüksek frekansları azalt (boğuk ses)
        -- Gain negatifse daha fazla kesim, pozitifse daha az kesim
        local cutAmount = 0.3 - (safeGain / 100) -- Gain +20 ise 0.1, -20 ise 0.5
        local freqFactor = 1.0 - (frequency / 10000) * cutAmount
        return math.max(0.5, freqFactor)
        
    elseif filterType == 'highpass' then
        -- Yüksek geçiren: Düşük frekansları azalt (ince ses)
        local cutAmount = 0.3 - (safeGain / 100)
        local freqFactor = 0.7 + (frequency / 10000) * cutAmount
        return math.max(0.6, math.min(1.0, freqFactor))
        
    elseif filterType == 'bandpass' then
        -- Bant geçiren: Dar frekans aralığı (telsiz efekti)
        -- Gain ile keskinlik ayarlanır
        local narrowness = 0.7 - (math.abs(safeGain) / 100)
        return math.max(0.5, narrowness)
        
    elseif filterType == 'notch' then
        -- Bant kesici: Belirli frekansı kes
        local cutDepth = 0.9 - (math.abs(safeGain) / 100)
        return math.max(0.7, cutDepth)
        
    elseif filterType == 'peaking' then
        -- Tepe artırma: Bass/tiz boost veya cut
        -- Gain pozitifse boost, negatifse cut
        if safeGain > 0 then
            -- Boost: Volume artır (bass boost için)
            return 1.0 + (safeGain / 40) -- +20 gain = 1.5x volume
        else
            -- Cut: Volume azalt
            return 1.0 + (safeGain / 50) -- -20 gain = 0.6x volume
        end
        
    elseif filterType == 'lowshelf' then
        -- Alt raf: Tüm bassları yükselt/azalt (subwoofer)
        -- Gain pozitifse bass boost, negatifse bass cut
        if safeGain > 0 then
            -- Bass boost: Volume artır
            return 1.0 + (safeGain / 30) -- +20 gain = 1.67x volume (güçlü bass)
        else
            -- Bass cut: Volume azalt
            return 1.0 + (safeGain / 40) -- -20 gain = 0.5x volume
        end
        
    elseif filterType == 'highshelf' then
        -- Üst raf: Parlaklık artır/azalt (clarity)
        -- Gain pozitifse tiz boost, negatifse tiz cut
        if safeGain > 0 then
            -- Tiz boost: Volume artır
            return 1.0 + (safeGain / 50) -- +20 gain = 1.4x volume
        else
            -- Tiz cut: Volume azalt
            return 1.0 + (safeGain / 60) -- -20 gain = 0.67x volume
        end
        
    elseif filterType == 'allpass' then
        -- Tüm geçiren: Faz değişimi (minimal etki)
        return 0.98
    end
    
    return 1.0 -- Varsayılan: Değişiklik yok
end

-- Smooth Volume Transition (Fade Effect)
function SmoothVolumeTransition(fromVolume, toVolume, durationMs)
    if not currentMusicId then
        return
    end
    
    isTransitioning = true
    
    local steps = 20 -- 20 adımda geçiş
    local stepDelay = durationMs / steps
    local volumeStep = (toVolume - fromVolume) / steps
    
    CreateThread(function()
        for i = 1, steps do
            if not currentMusicId then
                break
            end
            
            local currentStep = fromVolume + (volumeStep * i)
            exports.xsound:setVolume(currentMusicId, currentStep)
            
            Wait(stepDelay)
        end
        
        -- Son adımda kesin değeri ayarla
        if currentMusicId then
            exports.xsound:setVolume(currentMusicId, toVolume)
        end
        
        isTransitioning = false
    end)
end

-- Tüm Filtreleri Temizle ve Orijinal Sese Dön
function ClearAllFilters()
    if currentMusicId then
        filterChain = {}
        SmoothVolumeTransition(currentFilteredVolume, baseVolume, 500)
        currentFilteredVolume = baseVolume
        activeFilters = {}
        QBCore.Functions.Notify('Tüm filtreler temizlendi', 'info')
    end
end

-- Filtre Kaldırma (Chain'den çıkar ve yeniden hesapla)
function RemoveFilter(filterId)
    if activeFilters[filterId] then
        local filterType = activeFilters[filterId].type
        
        -- Chain'den kaldır
        if filterChain then
            filterChain[filterId] = nil
        end
        activeFilters[filterId] = nil
        
        -- Kalan filtreleri yeniden hesapla
        RecalculateFilterChain()
        
        QBCore.Functions.Notify('Filtre kaldırıldı: ' .. filterType:upper(), 'success')
    end
end

-- Filtre Kaldırma (Chain'den çıkar ve yeniden hesapla)
function RemoveFilter(filterId)
    if activeFilters[filterId] then
        local filterType = activeFilters[filterId].type
        
        -- Chain'den kaldır
        filterChain[filterId] = nil
        activeFilters[filterId] = nil
        
        -- Kalan filtreleri yeniden hesapla
        RecalculateFilterChain()
        
        QBCore.Functions.Notify('Filtre kaldırıldı: ' .. filterType:upper(), 'success')
    end
end
