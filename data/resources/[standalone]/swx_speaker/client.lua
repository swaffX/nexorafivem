local QBCore = exports['qb-core']:GetCoreObject()
local currentMusicId = nil
local isPlaying = false
local isPaused = false 
local currentVolume = Config.DefaultVolume
local currentDistance = Config.MaxDistance
local playlist = {}
local currentIndex = 0
local musicHistory = {} 
local activeFilters = {} 
local historyLoaded = false 
local isExtracting = false 

-- Request tracking
local currentExtractRequest = 0

-- Filtre sistemi değişkenleri
local filterChain = {} 
local baseVolume = Config.DefaultVolume 
local currentFilteredVolume = Config.DefaultVolume 
local isTransitioning = false 

-- Oyuncu spawn olduğunda geçmişi yükle
RegisterNetEvent('QBCore:Client:OnPlayerLoaded', function()
    TriggerServerEvent('swx_speaker:server:loadHistory')
end)

-- Geçmişi al
RegisterNetEvent('swx_speaker:client:receiveHistory', function(history)
    musicHistory = {}
    for i, song in ipairs(history) do
        local fixedTitle = song.title
        if not fixedTitle or fixedTitle == '' or fixedTitle == 'nil' then
            if song.url and (string.find(song.url, 'youtube.com') or string.find(song.url, 'youtu.be')) then
                local videoId = string.match(song.url, '[?&]v=([^&]+)') or string.match(song.url, 'youtu%.be/([^?]+)')
                fixedTitle = videoId and ('YouTube: ' .. videoId) or ('Şarkı #' .. i)
            else
                fixedTitle = 'Şarkı #' .. i
            end
        end
        table.insert(musicHistory, {
            url = song.url,
            title = fixedTitle,
            timestamp = song.timestamp
        })
    end
    historyLoaded = true
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

-- Araç plakasına göre benzersiz ID oluştur
function GetVehicleMusicId(vehicle)
    if not vehicle or vehicle == 0 then return nil end
    local plate = GetVehicleNumberPlateText(vehicle)
    if not plate then return nil end
    return "veh_" .. plate:gsub("%s+", "")
end

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
                title = 'Durdur',
                description = 'Müziği tamamen kapat',
                icon = 'stop',
                onSelect = function()
                    local ped = PlayerPedId()
                    local vehicle = GetVehiclePedIsIn(ped, false)
                    local musicId = GetVehicleMusicId(vehicle)
                    if musicId then
                        exports.xsound:Destroy(musicId)
                        isPlaying = false
                        isPaused = false
                        currentMusicId = nil
                        QBCore.Functions.Notify('Müzik durduruldu', 'error')
                    end
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
    if isExtracting then
        QBCore.Functions.Notify('Bir şarkı zaten yükleniyor, lütfen bekleyin...', 'error')
        return
    end

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
        QBCore.Functions.Notify('Şarkı bilgisi alınıyor...', 'info', 2000)
        
        QBCore.Functions.TriggerCallback('swx_speaker:getYouTubeTitle', function(title)
            local videoId = string.match(url, '[?&]v=([^&]+)') or string.match(url, 'youtu%.be/([^?]+)')
            local finalTitle = title or (videoId and ('YouTube: ' .. videoId) or 'Bilinmeyen Şarkı')
            PlayMusic(url, finalTitle)
        end, url)
    end
end

-- Konum güncelleme thread'i (Tüm araçlar için dinamik takip)
CreateThread(function()
    while true do
        Wait(500)
        local ped = PlayerPedId()
        local vehicle = GetVehiclePedIsIn(ped, false)
        
        -- Eğer oyuncu bir araçtaysa ve o aracın müziği aktifse konumunu güncelle
        if vehicle ~= 0 then
            local musicId = GetVehicleMusicId(vehicle)
            if musicId and exports.xsound:soundExists(musicId) then
                local coords = GetEntityCoords(vehicle)
                exports.xsound:Position(musicId, coords)
            end
        end
    end
end)

function PlayMusic(url, title)
    local ped = PlayerPedId()
    local vehicle = GetVehiclePedIsIn(ped, false)
    
    if vehicle == 0 then
        QBCore.Functions.Notify('Aracın içinde olmalısın!', 'error')
        return
    end

    local musicId = GetVehicleMusicId(vehicle)
    if not musicId then return end

    print('[SWX Speaker] PlayMusic Request - Vehicle:', GetVehicleNumberPlateText(vehicle), 'ID:', musicId)
    
    -- Önceki müziği bu araç için kesinlikle temizle
    exports.xsound:Destroy(musicId)
    
    currentMusicId = musicId
    isPlaying = false
    isPaused = false
    
    local coords = GetEntityCoords(vehicle)
    local isYouTube = string.find(url, 'youtube.com') or string.find(url, 'youtu.be')
    
    if isYouTube then
        isExtracting = true
        currentExtractRequest = currentExtractRequest + 1
        local requestId = currentExtractRequest
        
        -- Timeout
        SetTimeout(15000, function()
            if isExtracting and currentExtractRequest == requestId then
                isExtracting = false
                QBCore.Functions.Notify('YouTube işlemi zaman aşımına uğradı!', 'error')
            end
        end)
        
        TriggerServerEvent('swx_speaker:server:extractYouTubeAudio', url, musicId, currentVolume, currentDistance, coords, requestId)
    else
        isExtracting = false
        exports.xsound:PlayUrlPos(musicId, url, currentVolume, coords, false)
        exports.xsound:Distance(musicId, currentDistance)
        exports.xsound:destroyOnFinish(musicId, false)
        isPlaying = true
        TriggerServerEvent('swx_speaker:server:addToHistory', url, title or 'Bilinmeyen Şarkı')
        QBCore.Functions.Notify('🎵 Müzik çalıyor!', 'success')
    end
end

RegisterNetEvent('swx_speaker:client:playExtractedAudio', function(audioUrl, musicId, volume, distance, coords, title, originalUrl, requestId, serverIp)
    if requestId and requestId < currentExtractRequest then return end
    isExtracting = false
    
    -- URL Düzeltme
    local targetIp = serverIp or '194.105.5.37'
    audioUrl = audioUrl:gsub('localhost', targetIp)
    
    local ped = PlayerPedId()
    local vehicle = GetVehiclePedIsIn(ped, false)
    
    -- Eğer oyuncu hala aynı araçtaysa (veya araç dünyada mevcutsa)
    if vehicle ~= 0 then
        local currentVehId = GetVehicleMusicId(vehicle)
        if currentVehId == musicId then
            isPlaying = true
            isPaused = false
            
            exports.xsound:PlayUrlPos(musicId, audioUrl, volume, coords, false)
            exports.xsound:Distance(musicId, distance)
            exports.xsound:destroyOnFinish(musicId, false)
            
            TriggerServerEvent('swx_speaker:server:addToHistory', originalUrl or audioUrl, title or 'YouTube Şarkı')
            QBCore.Functions.Notify('🎵 ' .. (title or 'YouTube Şarkı'), 'success')
        end
    end
end)

function TogglePause()
    local ped = PlayerPedId()
    local vehicle = GetVehiclePedIsIn(ped, false)
    local musicId = GetVehicleMusicId(vehicle)
    if not musicId then return end
    
    if isPaused then
        exports.xsound:Resume(musicId)
        isPaused = false
        isPlaying = true
        QBCore.Functions.Notify('Müzik devam ediyor', 'success')
    else
        exports.xsound:Pause(musicId)
        isPaused = true
        isPlaying = false
        QBCore.Functions.Notify('Müzik duraklatıldı', 'info')
    end
end

-- Araçtan inince durdurma mantığını KALDIRDIK. Müzik araçta kalır.
-- Ancak oyuncu uzaklaşırsa xsound zaten mesafeden dolayı sesi kısar.

function VolumeRangeDialog()
    local ped = PlayerPedId()
    local vehicle = GetVehiclePedIsIn(ped, false)
    local musicId = GetVehicleMusicId(vehicle)
    if not musicId then return end

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
        if exports.xsound:soundExists(musicId) then
            exports.xsound:Distance(musicId, currentDistance)
            exports.xsound:setVolume(musicId, currentVolume)
        end
        QBCore.Functions.Notify('Ses güncellendi', 'success')
    end
end

-- Diğer menü fonksiyonları (OtherMenu, History, Filters vb.) aşağıda devam eder...
-- (Kodun geri kalanı aynı mantıkla araç bazlı ID kullanacak şekilde devam etmektedir)

function OtherMenu()
    lib.registerContext({
        id = 'other_menu',
        title = 'Diğer',
        menu = 'speaker_menu',
        options = {
            {
                title = 'Müzik geçmişi',
                icon = 'history',
                onSelect = function()
                    MusicHistoryMenu()
                end
            },
            {
                title = 'Filtreler',
                icon = 'filter',
                onSelect = function()
                    FiltersMenu()
                end
            }
        }
    })
    lib.showContext('other_menu')
end

function MusicHistoryMenu()
    TriggerServerEvent('swx_speaker:server:loadHistory')
    Wait(300)
    if #musicHistory == 0 then
        QBCore.Functions.Notify('Geçmiş boş!', 'error')
        return
    end
    local options = {}
    for i, song in ipairs(musicHistory) do
        table.insert(options, {
            title = song.title or 'Bilinmeyen',
            onSelect = function()
                PlayMusic(song.url, song.title)
            end
        })
    end
    lib.registerContext({
        id = 'history_menu',
        title = 'Geçmiş',
        menu = 'other_menu',
        options = options
    })
    lib.showContext('history_menu')
end

function FiltersMenu()
    lib.registerContext({
        id = 'filters_menu',
        title = 'Filtreler',
        menu = 'other_menu',
        options = {
            {
                title = 'Bass Boost (Lowshelf)',
                onSelect = function() ApplyFilter('bass', {type='lowshelf', frequency=150, gain=15, detune=0}) end
            },
            {
                title = 'Telsiz Efekti (Bandpass)',
                onSelect = function() ApplyFilter('radio', {type='bandpass', frequency=1500, gain=0, detune=2400}) end
            },
            {
                title = 'Tüm Filtreleri Temizle',
                onSelect = function() 
                    local musicId = GetVehicleMusicId(GetVehiclePedIsIn(PlayerPedId(), false))
                    if musicId then exports.xsound:clearAllFilters(musicId) end
                end
            }
        }
    })
    lib.showContext('filters_menu')
end

function ApplyFilter(id, filter)
    local musicId = GetVehicleMusicId(GetVehiclePedIsIn(PlayerPedId(), false))
    if not musicId then return end
    exports.xsound:setFilter(musicId, filter.type, filter.frequency, 1.0, filter.gain)
    QBCore.Functions.Notify('Filtre uygulandı', 'success')
end
