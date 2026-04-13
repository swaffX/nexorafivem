local QBCore = exports['qb-core']:GetCoreObject()
local currentMusicId = nil
local isPlaying = false
local isPaused = false -- Yeni: Pause durumu
local currentSongTitle = nil
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

-- Remote müzikleri takip için
local remoteMusicTracks = {}

-- Hoparlör söküldüğünde müzik durdur
RegisterNetEvent('swx_speaker:client:speakerRemoved')
AddEventHandler('swx_speaker:client:speakerRemoved', function()
    if currentMusicId then
        exports.xsound:Destroy(currentMusicId)
        TriggerServerEvent('swx_speaker:server:stopMusic')
        currentMusicId = nil
        isPlaying = false
        isPaused = false
        currentSongTitle = nil
        TriggerEvent('swx_carplay:stop')
    end
    QBCore.Functions.Notify('Hoparlör söküldü, müzik durduruldu.', 'error')
end)

-- Hoparlör takıldı bildirim
RegisterNetEvent('swx_speaker:client:speakerInstalled')
AddEventHandler('swx_speaker:client:speakerInstalled', function()
    QBCore.Functions.Notify('Hoparlör başarıyla takıldı!', 'success')
end)

-- Oyuncu spawn olduğunda geçmişi yükle
RegisterNetEvent('QBCore:Client:OnPlayerLoaded', function()
    TriggerServerEvent('swx_speaker:server:loadHistory')
end)

-- Geçmişi al
RegisterNetEvent('swx_speaker:client:receiveHistory', function(history)
    musicHistory = {}
    
    -- Debug: Gelen geçmişi detaylı logla
    print('[SWX Speaker] Müzik geçmişi yüklendi: ' .. #history .. ' şarkı')
    
    for i, song in ipairs(history) do
        -- Title kontrolü ve düzeltme
        local fixedTitle = song.title
        
        if not fixedTitle or fixedTitle == '' or fixedTitle == 'nil' then
            -- URL'den title çıkarmaya çalış
            if song.url and string.find(song.url, 'youtube.com') or string.find(song.url, 'youtu.be') then
                -- YouTube URL'sinden video ID'yi çıkar
                local videoId = string.match(song.url, '[?&]v=([^&]+)') or string.match(song.url, 'youtu%.be/([^?]+)')
                if videoId then
                    fixedTitle = 'YouTube: ' .. videoId
                else
                    fixedTitle = 'YouTube Şarkısı #' .. i
                end
            else
                fixedTitle = 'Şarkı #' .. i
            end
            
            print(string.format('[SWX Speaker] Title boş, düzeltildi: "%s"', fixedTitle))
        end
        
        table.insert(musicHistory, {
            url = song.url,
            title = fixedTitle,
            timestamp = song.timestamp
        })
        
        print(string.format('[SWX Speaker] Şarkı %d: Title="%s" | URL="%s"', 
            i, fixedTitle, song.url or 'NIL'))
    end
    
    historyLoaded = true
end)

-- M tuşu ile menü aç
RegisterCommand('swxspeaker', function()
    local ped = PlayerPedId()
    local vehicle = GetVehiclePedIsIn(ped, false)
    
    if vehicle == 0 then
        QBCore.Functions.Notify('Araçta değilsin!', 'error')
        return
    end
    
    OpenSpeakerMenu()
end, false)

RegisterKeyMapping('swxspeaker', 'Hoparlör Etkileşimi (M Tuşu)', 'keyboard', Config.OpenKey)

function OpenSpeakerMenu()
    local ped = PlayerPedId()
    local vehicle = GetVehiclePedIsIn(ped, false)
    local plate = GetVehicleNumberPlateText(vehicle)
    
    -- Hoparlör kontrolü
    QBCore.Functions.TriggerCallback('swx_speaker:hasVehicleSpeaker', function(hasSpeaker)
        if not hasSpeaker then
            lib.registerContext({
                id = 'speaker_menu',
                title = 'Hoparlör etkileşimi',
                options = {
                    {
                        title = 'Hoparlör tak',
                        description = 'Araca hoparlör takmak için car_speaker itemine sahip olmalısın. Digital Den\'den ($500) alabilirsin.',
                        icon = 'wrench',
                        onSelect = function()
                            InstallSpeakerDialog(plate)
                        end
                    }
                }
            })
        else
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
                        title = 'Hoparlör sök',
                        description = 'Aracıdan hoparlörü sök.',
                        icon = 'trash',
                        onSelect = function()
                            TriggerServerEvent('swx_speaker:removeSpeaker', plate)
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
        end
        lib.showContext('speaker_menu')
    end, plate)
end

function InstallSpeakerDialog(plate)
    local PlayerData = QBCore.Functions.GetPlayerData()
    local speakerItem = nil
    
    -- Check inventory for car_speaker item
    if PlayerData and PlayerData.items then
        for _, item in ipairs(PlayerData.items) do
            if item and item.name == 'car_speaker' then
                speakerItem = item
                break
            end
        end
    end
    
    if not speakerItem or speakerItem.amount < 1 then
        QBCore.Functions.Notify('Envanterinde hoparlör itemi yok!', 'error')
        return
    end
    
    lib.registerContext({
        id = 'install_speaker_confirm',
        title = 'Hoparlör Tak',
        menu = 'speaker_menu',
        options = {
            {
                title = 'Evet, tak',
                description = 'Hoparlörü araca tak',
                icon = 'check',
                onSelect = function()
                    local success = lib.progressBar({
                        duration = 4000,
                        label = 'Hoparlör takılıyor...',
                        useWhileDead = false,
                        canCancel = true,
                        disable = { move = true, car = true, combat = true, sprint = true },
                        anim = { dict = 'mini@repair', clip = 'fixing_a_player' }
                    })
                    if success then
                        TriggerServerEvent('swx_speaker:installSpeaker', plate)
                    else
                        QBCore.Functions.Notify('Hoparlör takma iptal edildi.', 'error')
                    end
                end
            },
            {
                title = 'İptal',
                description = 'İptal et',
                icon = 'xmark',
                onSelect = function()
                    OpenSpeakerMenu()
                end
            }
        }
    })
    
    lib.showContext('install_speaker_confirm')
end

function PlayMusicDialog()
    local input = lib.inputDialog('Müzik Çal', {
        {
            type = 'input',
            label = 'YouTube URL',
            description = 'YouTube video veya playlist URL\'si girin',
            required = true,
            icon = 'link'
        }
    })
    
    if input then
        local url = input[1]
        
        -- Loading notification
        QBCore.Functions.Notify('Şarkı bilgisi alınıyor...', 'info', 2000)
        
        -- Server'dan YouTube title'ı çek
        QBCore.Functions.TriggerCallback('swx_speaker:getYouTubeTitle', function(title)
            if title then
                PlayMusic(url, title)
            else
                -- Fallback: Video ID'den title oluştur
                local videoId = string.match(url, '[?&]v=([^&]+)') or string.match(url, 'youtu%.be/([^?]+)')
                local fallbackTitle = videoId and ('YouTube: ' .. videoId) or 'Bilinmeyen Şarkı'
                PlayMusic(url, fallbackTitle)
            end
        end, url)
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
        }
    })
    
    if input then
        local url = input[1]
        
        -- Loading notification
        QBCore.Functions.Notify('Şarkı bilgisi alınıyor...', 'info', 2000)
        
        -- Server'dan YouTube title'ı çek
        QBCore.Functions.TriggerCallback('swx_speaker:getYouTubeTitle', function(title)
            if title then
                table.insert(playlist, {
                    url = url,
                    title = title
                })
                QBCore.Functions.Notify('Şarkı sıraya eklendi! (' .. #playlist .. ' şarkı)', 'success')
            else
                -- Fallback
                local videoId = string.match(url, '[?&]v=([^&]+)') or string.match(url, 'youtu%.be/([^?]+)')
                local fallbackTitle = videoId and ('YouTube: ' .. videoId) or 'Bilinmeyen Şarkı'
                table.insert(playlist, {
                    url = url,
                    title = fallbackTitle
                })
                QBCore.Functions.Notify('Şarkı sıraya eklendi!', 'success')
            end
        end, url)
    end
end

function PlayMusic(url, title)
    local ped = PlayerPedId()
    local vehicle = GetVehiclePedIsIn(ped, false)
    local plate = GetVehicleNumberPlateText(vehicle)
    
    if vehicle ~= 0 and DoesEntityExist(vehicle) then
        -- Hoparlör kontrolü
        QBCore.Functions.TriggerCallback('swx_speaker:hasVehicleSpeaker', function(hasSpeaker)
            if not hasSpeaker then
                QBCore.Functions.Notify('Araçta hoparlör yok! Önce hoparlör takmalısın.', 'error')
                return
            end
            
            -- Hoparlör var, müziği başlat
            if currentMusicId then
                exports.xsound:Destroy(currentMusicId)
                TriggerServerEvent('swx_speaker:server:stopMusic')
            end
            
            currentMusicId = "speaker_" .. GetPlayerServerId(PlayerId()) .. "_" .. math.random(1000, 9999)
            
            local coords = GetEntityCoords(vehicle)
            local playerId = GetPlayerServerId(PlayerId())
            
            -- Sabit ses (non-positional): mesafe/konum hesabı yok, kıpırdamıyor
            -- Diğer oyuncular server sync event ile kendi positional seslerini yönetiyor
            exports.xsound:PlayUrl(currentMusicId, url, currentVolume, false)
            
            -- Şarkı bitince otomatik kapanmasın (loop değil ama destroyOnFinish = false)
            exports.xsound:destroyOnFinish(currentMusicId, false)
            
            isPlaying = true
            isPaused = false
            currentSongTitle = title
            TriggerEvent('swx_carplay:start', title)
            
            -- Geçmişe ekle (local) - FiveM uyumlu timestamp
            local timestamp = GetGameTimer()
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
            
            -- DİGER OYUNCULARA MÜZİK BİLGİSİNİ GÖNDER
            local vehicleNetId = NetworkGetNetworkIdFromEntity(vehicle)
            TriggerServerEvent('swx_speaker:server:playMusic', url, title, vehicleNetId, coords, currentVolume, currentDistance)
            
            QBCore.Functions.Notify('Müzik çalıyor!', 'success')
            print('[SWX Speaker] Müzik başlatıldı: ' .. currentMusicId .. ' | destroyOnFinish: false')
        end, plate)
    end
end

-- Araçtaki tüm oyuncuları al
function GetVehicleOccupants(vehicle)
    local occupants = {}
    
    -- Entity kontrolü ekle
    if not vehicle or vehicle == 0 or not DoesEntityExist(vehicle) then
        return occupants
    end
    
    local maxSeats = GetVehicleMaxNumberOfPassengers(vehicle)
    
    for seat = -1, maxSeats do
        local ped = GetPedInVehicleSeat(vehicle, seat)
        if ped ~= 0 and DoesEntityExist(ped) then
            -- pcall ile network hatasini engelle
            local success, playerId = pcall(function()
                return NetworkGetPlayerIndexFromPed(ped)
            end)
            if success and playerId and playerId ~= -1 then
                table.insert(occupants, playerId)
            end
        end
    end
    
    return occupants
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
        TriggerEvent('swx_carplay:resume', currentSongTitle)
        QBCore.Functions.Notify('Müzik devam ediyor', 'success')
    else
        -- Çalıyor, duraklat
        exports.xsound:Pause(currentMusicId)
        isPaused = true
        isPlaying = false
        TriggerEvent('swx_carplay:pause', currentSongTitle)
        QBCore.Functions.Notify('Müzik duraklatıldı', 'info')
    end
end

function VolumeRangeDialog()
    local input = lib.inputDialog('Ses ve Uzaklık Ayarları', {
        {
            type = 'slider',
            label = 'Ses Seviyesi',
            description = 'Müziğin ne kadar yüksek sesle çalacağı (0.10-1.5)',
            min = 10,
            max = 150,
            default = math.floor(currentVolume * 100),
            required = true
        },
        {
            type = 'slider',
            label = 'Duyulma Uzaklığı (Metre)',
            description = 'Müziğin kaç metre uzaktan duyulacağı (1-75m)',
            min = 10,
            max = 750,
            default = math.floor(currentDistance * 10),
            required = true
        }
    })
    
    if input then
        currentVolume = input[1] / 100
        currentDistance = input[2] / 10
        
        if currentMusicId then
            exports.xsound:Distance(currentMusicId, currentDistance)
            exports.xsound:setVolume(currentMusicId, currentVolume)
        end
        
        QBCore.Functions.Notify('✅ Ses: ' .. string.format("%.2f", currentVolume) .. ' | Uzaklık: ' .. string.format("%.1f", currentDistance) .. 'm', 'success')
        TriggerServerEvent('swx_speaker:server:updateSettings', currentVolume, currentDistance)
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
                        TriggerServerEvent('swx_speaker:server:stopMusic')
                        currentMusicId = nil
                        isPlaying = false
                        isPaused = false
                        currentSongTitle = nil
                        TriggerEvent('swx_carplay:stop')
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
    -- Her açılışta server'dan fresh data çek
    TriggerServerEvent('swx_speaker:server:loadHistory')
    Wait(300) -- Server'dan cevap bekle
    
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
                    -- Server'dan sil (URL bazlı - tüm duplicate'ler)
                    TriggerServerEvent('swx_speaker:server:removeFromHistoryByUrl', song.url)
                    
                    -- Local array'den de sil
                    local deletedCount = 0
                    for i = #musicHistory, 1, -1 do
                        if musicHistory[i].url == song.url then
                            table.remove(musicHistory, i)
                            deletedCount = deletedCount + 1
                        end
                    end
                    
                    QBCore.Functions.Notify('Geçmişten silindi (' .. deletedCount .. ' kayıt)', 'success')
                    
                    -- Menüyü yenile (kısa bekleme ile)
                    CreateThread(function()
                        Wait(200)
                        MusicHistoryMenu()
                    end)
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

-- Araçtan inince durdur (debounce: 3 saniye üst üste araçta değilse durdur)
CreateThread(function()
    local wasInVehicle = false
    local notInVehicleCount = 0
    
    while true do
        Wait(1000)
        
        if isPlaying and currentMusicId then
            local ped = PlayerPedId()
            local currentVehicle = GetVehiclePedIsIn(ped, false)
            local inVehicle = currentVehicle ~= 0
            
            if inVehicle then
                -- Araçta: sayıcıyı sıfırla, durumu güncelle
                notInVehicleCount = 0
                wasInVehicle = true
            else
                -- Araçta değil: sadece sayıcı arttsın
                if wasInVehicle then
                    notInVehicleCount = notInVehicleCount + 1
                    
                    -- 3 saniye üst üste araçta değilse gerçekten indi
                    if notInVehicleCount >= 3 then
                        print('[SWX Speaker] Araçtan indi (3s onay), müzik durduruluyor')
                        if currentMusicId then
                            exports.xsound:Destroy(currentMusicId)
                            TriggerServerEvent('swx_speaker:server:stopMusic')
                            currentMusicId = nil
                            isPlaying = false
                            isPaused = false
                            currentSongTitle = nil
                            TriggerEvent('swx_carplay:stop')
                        end
                        wasInVehicle = false
                        notInVehicleCount = 0
                    end
                end
            end
        else
            -- Müzik çalmıyorsa sıfırla
            wasInVehicle = false
            notInVehicleCount = 0
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
            title = 'Yeni filtre ekle',
            description = 'Ses çıkışını değiştir',
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
            title = 'Toplam 0 aktif filtre',
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
            label = 'Frequency (Hz)',
            description = '10 ile 22000 arasında Hz',
            min = 10,
            max = 22000,
            default = filter.frequency,
            required = true,
            icon = 'signal'
        },
        {
            type = 'number',
            label = 'Gain (dB)',
            description = '-40 ile 40 arasında dB',
            min = -40,
            max = 40,
            default = filter.gain,
            required = true,
            icon = 'volume-up'
        },
        {
            type = 'number',
            label = 'Detune (cents)',
            description = 'Q değeri (keskinlik)',
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
        
        -- Filtreyi yeniden uygula
        ApplyFilter(filterId, activeFilters[filterId])
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
    -- Her filtre tipi için optimize edilmiş varsayılan değerler
    local defaultFreq, defaultGain, defaultDetune, freqDesc, gainDesc
    
    if filterType == 'lowpass' then
        defaultFreq = 800
        defaultGain = 0
        defaultDetune = 0
        freqDesc = 'Kesim frekansı (düşük = daha boğuk)'
        gainDesc = 'Resonance (0 = doğal, pozitif = vurgulu)'
        
    elseif filterType == 'highpass' then
        defaultFreq = 200
        defaultGain = 0
        defaultDetune = 0
        freqDesc = 'Kesim frekansı (yüksek = daha ince)'
        gainDesc = 'Resonance (0 = doğal)'
        
    elseif filterType == 'bandpass' then
        defaultFreq = 1000
        defaultGain = 0
        defaultDetune = 2400
        freqDesc = 'Merkez frekans (telsiz: 1000-2000 Hz)'
        gainDesc = 'Resonance (yüksek = daha dar bant)'
        
    elseif filterType == 'notch' then
        defaultFreq = 1000
        defaultGain = -20
        defaultDetune = 2400
        freqDesc = 'Kesilecek frekans (cızırtı temizleme)'
        gainDesc = 'Kesim derinliği (negatif = daha fazla)'
        
    elseif filterType == 'peaking' then
        defaultFreq = 100
        defaultGain = 10
        defaultDetune = 0
        freqDesc = 'Hedef frekans (bass: 60-250 Hz, tiz: 8000+ Hz)'
        gainDesc = 'Boost/Cut (pozitif = artır, negatif = azalt)'
        
    elseif filterType == 'lowshelf' then
        defaultFreq = 200
        defaultGain = 8
        defaultDetune = 0
        freqDesc = 'Geçiş frekansı (bass kontrolü)'
        gainDesc = 'Bass boost/cut (pozitif = güçlü bass)'
        
    elseif filterType == 'highshelf' then
        defaultFreq = 8000
        defaultGain = 5
        defaultDetune = 0
        freqDesc = 'Geçiş frekansı (parlaklık kontrolü)'
        gainDesc = 'Tiz boost/cut (pozitif = daha parlak)'
        
    elseif filterType == 'allpass' then
        defaultFreq = 1000
        defaultGain = 0
        defaultDetune = 0
        freqDesc = 'Frekans (faz kayması)'
        gainDesc = 'Etki (genelde 0 bırakın)'
    end
    
    local input = lib.inputDialog('Filtre: ' .. filterType:upper(), {
        {
            type = 'number',
            label = 'Frequency (Hz)',
            description = freqDesc,
            min = 10,
            max = 22000,
            default = defaultFreq,
            required = true,
            icon = 'signal'
        },
        {
            type = 'number',
            label = 'Gain (dB)',
            description = gainDesc,
            min = -40,
            max = 40,
            default = defaultGain,
            required = true,
            icon = 'volume-up'
        },
        {
            type = 'number',
            label = 'Detune (cents)',
            description = 'Q değeri (keskinlik): 0 = yumuşak, yüksek = keskin',
            min = -4800,
            max = 4800,
            default = defaultDetune,
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
    end
end

-- ============================================
-- GERÇEK AUDIO FİLTRE SİSTEMİ v4.0
-- ============================================
-- xSound Web Audio API ile gerçek filtreler
-- ============================================

-- Filtre Uygulama Fonksiyonu
function ApplyFilter(filterId, filter)
    if not currentMusicId then
        QBCore.Functions.Notify('Önce bir şarkı çalmalısınız!', 'error')
        return
    end
    
    -- Filtreyi chain'e ekle
    filterChain[filterId] = filter
    activeFilters[filterId] = filter
    
    -- xSound'a gerçek filtre uygula
    local filterType = filter.type:lower()
    local frequency = math.max(10, math.min(22000, filter.frequency))
    local gain = math.max(-40, math.min(40, filter.gain))
    local Q = CalculateQValue(filterType, filter.detune)
    
    -- Debug log
    print(string.format('[SWX Speaker] Filtre uygulanıyor: %s | Freq: %d Hz | Gain: %d dB | Q: %.2f', 
        filterType:upper(), frequency, gain, Q))
    
    -- Şarkı yüklenmesini bekle (2 saniye)
    CreateThread(function()
        Wait(2000)
        
        -- xSound setFilter export'u
        local success = exports.xsound:setFilter(currentMusicId, filterType, frequency, Q, gain)
        
        if success then
            QBCore.Functions.Notify('Filtre uygulandı: ' .. filterType:upper(), 'success')
        else
            QBCore.Functions.Notify('Filtre uygulanamadı, tekrar deneyin', 'error')
            -- Başarısız olursa chain'den kaldır
            filterChain[filterId] = nil
            activeFilters[filterId] = nil
        end
    end)
end

-- Q Değeri Hesapla
function CalculateQValue(filterType, detune)
    local normalizedDetune = detune / 4800
    local Q = 1.0
    
    if filterType == 'lowpass' or filterType == 'highpass' then
        Q = 0.7 + (math.abs(normalizedDetune) * 5)
    elseif filterType == 'bandpass' or filterType == 'notch' then
        Q = 1.0 + (math.abs(normalizedDetune) * 15)
    elseif filterType == 'peaking' or filterType == 'lowshelf' or filterType == 'highshelf' then
        Q = 0.5 + (math.abs(normalizedDetune) * 3)
    elseif filterType == 'allpass' then
        Q = 0.1 + (math.abs(normalizedDetune) * 2)
    end
    
    return math.max(0.1, math.min(20, Q))
end

-- Tüm Filtreleri Temizle
function ClearAllFilters()
    if not currentMusicId then
        return
    end
    
    exports.xsound:clearAllFilters(currentMusicId)
    
    filterChain = {}
    activeFilters = {}
    
    QBCore.Functions.Notify('Tüm filtreler temizlendi', 'info')
    print('[SWX Speaker] Tüm filtreler kaldırıldı')
end

-- Tek Filtre Kaldır
function RemoveFilter(filterId)
    if not activeFilters[filterId] then
        return
    end
    
    local filterType = activeFilters[filterId].type:lower()
    
    if currentMusicId then
        exports.xsound:clearFilter(currentMusicId, filterType)
    end
    
    filterChain[filterId] = nil
    activeFilters[filterId] = nil
    
    QBCore.Functions.Notify('Filtre kaldırıldı: ' .. filterType:upper(), 'success')
    print('[SWX Speaker] Filtre kaldırıldı: ' .. filterType:upper())
end

-- ============================================
-- DİĞER OYUNCULARIN MÜZİĞİNİ DİNLEME SİSTEMİ
-- ============================================

-- Diğer oyunculardan gelen müzik senkronizasyonu
RegisterNetEvent('swx_speaker:client:syncMusic', function(data)
    -- Kendi müziğimizi tekrar çalmayalım
    if data.playerId == GetPlayerServerId(PlayerId()) then
        return
    end
    
    -- Araç entity'sini bul
    local vehicle = nil
    if data.vehicleNetId then
        vehicle = NetworkGetEntityFromNetworkId(data.vehicleNetId)
    end
    
    local musicId = "speaker_remote_" .. data.playerId .. "_" .. math.random(1000, 9999)
    
    -- Aynı araçta mı kontrol et
    local localVehicle = GetVehiclePedIsIn(PlayerPedId(), false)
    local isSameVehicle = (vehicle and vehicle ~= 0 and DoesEntityExist(vehicle) and localVehicle == vehicle)
    
    if isSameVehicle then
        -- Aynı araç: sürücü gibi non-positional ses (tam ses)
        exports.xsound:PlayUrl(musicId, data.url, data.volume or 0.6, false)
        exports.xsound:destroyOnFinish(musicId, false)
        remoteMusicTracks[musicId] = { vehicleNetId = data.vehicleNetId, playerId = data.playerId }
        -- Carplay widget güncelle
        TriggerEvent('swx_carplay:start', data.title)
        print(string.format('[SWX Speaker] Aynı araçta müzik çalınıyor (non-positional): Player=%s, Title=%s',
            data.playerId, data.title or 'Bilinmeyen'))
    elseif not vehicle or vehicle == 0 or not DoesEntityExist(vehicle) then
        -- Araç yok: koordinata göre 3D ses
        if data.coords then
            exports.xsound:PlayUrlPos(musicId, data.url, data.volume or 0.6, data.coords, false, {
                maxDistance = data.maxDistance or 60.0,
                rolloffFactor = 1.0,
                refDistance = 5.0
            })
            print(string.format('[SWX Speaker] Diğer oyuncunun müziği çalınıyor: Player=%s, Title=%s', 
                data.playerId, data.title or 'Bilinmeyen'))
        end
    else
        -- Farklı araç veya dışarıda: araca bağlı pozisyonel ses
        local coords = GetEntityCoords(vehicle)
        exports.xsound:PlayUrlPos(musicId, data.url, data.volume or 0.6, coords, false, {
            maxDistance = data.maxDistance or 60.0,
            rolloffFactor = 1.0,
            refDistance = 5.0
        })
        
        remoteMusicTracks[musicId] = {
            vehicleNetId = data.vehicleNetId,
            playerId = data.playerId
        }
        
        print(string.format('[SWX Speaker] Diğer oyuncunun aracında müzik çalınıyor: Player=%s, Title=%s', 
            data.playerId, data.title or 'Bilinmeyen'))
        
        -- Araç hareket edince ses pozisyonunu güncelle
        CreateThread(function()
            local trackMusicId = musicId
            while remoteMusicTracks[trackMusicId] do
                local track = remoteMusicTracks[trackMusicId]
                local veh = NetworkGetEntityFromNetworkId(track.vehicleNetId)
                
                if veh and veh ~= 0 and DoesEntityExist(veh) then
                    local newCoords = GetEntityCoords(veh)
                    pcall(function()
                        if exports.xsound:isPlaying(trackMusicId) then
                            exports.xsound:Position(trackMusicId, newCoords)
                        else
                            remoteMusicTracks[trackMusicId] = nil
                        end
                    end)
                else
                    remoteMusicTracks[trackMusicId] = nil
                    break
                end
                
                Wait(100)
            end
        end)
    end
end)

-- Ses/mesafe ayarı güncelleme (diğer oyunculardan)
RegisterNetEvent('swx_speaker:client:updateSettings', function(data)
    if data.playerId == GetPlayerServerId(PlayerId()) then return end
    for musicId, track in pairs(remoteMusicTracks) do
        if track.playerId == data.playerId then
            pcall(function()
                exports.xsound:setVolume(musicId, data.volume)
                exports.xsound:Distance(musicId, data.maxDistance)
            end)
        end
    end
end)

-- Diğer oyuncunun müziği durduğunda
RegisterNetEvent('swx_speaker:client:stopMusic', function(data)
    if data.playerId == GetPlayerServerId(PlayerId()) then
        return
    end
    
    -- Bu player'a ait tüm remote müzikleri bul ve temizle
    for musicId, track in pairs(remoteMusicTracks) do
        if track.playerId == data.playerId then
            pcall(function()
                if exports.xsound:isPlaying(musicId) then
                    exports.xsound:Destroy(musicId)
                end
            end)
            remoteMusicTracks[musicId] = nil
        end
    end
    
    print('[SWX Speaker] Diğer oyuncunun müziği durduruldu: Player=' .. data.playerId)
end)
