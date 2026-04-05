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

-- Araç plakasına göre benzersiz ID oluştur
function GetVehicleMusicId(vehicle)
    if not vehicle or vehicle == 0 then return nil end
    local plate = GetVehicleNumberPlateText(vehicle)
    if not plate then return nil end
    return "veh_" .. plate:gsub("%s+", "")
end

-- K tuşu ile menü aç
RegisterCommand('speaker', function()
    local ped = PlayerPedId()
    local vehicle = GetVehiclePedIsIn(ped, false)
    if vehicle == 0 then
        QBCore.Functions.Notify('Araçta değilsin!', 'error')
        return
    end
    OpenSpeakerMenu()
end, false)

RegisterKeyMapping('speaker', 'Hoparlör Etkileşimi', 'keyboard', Config.OpenKey)

function OpenSpeakerMenu()
    local ped = PlayerPedId()
    local vehicle = GetVehiclePedIsIn(ped, false)
    local musicId = GetVehicleMusicId(vehicle)
    
    local options = {
        {
            title = 'Müzik çal',
            description = isExtracting and '⌛ Yükleniyor, lütfen bekleyin...' or 'Youtube videoları ve çalma listeleri.',
            icon = 'play',
            disabled = isExtracting,
            onSelect = function() PlayMusicDialog() end
        },
        {
            title = 'Müzik sıraya al',
            icon = 'list',
            onSelect = function() AddToQueueDialog() end
        },
        {
            title = 'Sonraki şarkı',
            icon = 'forward',
            disabled = #playlist == 0,
            onSelect = function() PlayNextSong() end
        },
        {
            title = isPaused and 'Devam ettir' or 'Duraklat',
            icon = isPaused and 'play' or 'pause',
            disabled = not isPlaying and not isPaused,
            onSelect = function() TogglePause() end
        },
        {
            title = 'Ses ve Mesafe Ayarları',
            icon = 'volume-up',
            onSelect = function() VolumeRangeDialog() end
        },
        {
            title = 'Müziği Durdur',
            icon = 'stop',
            onSelect = function()
                if musicId then
                    exports.xsound:Destroy(musicId)
                    isPlaying = false
                    isPaused = false
                    QBCore.Functions.Notify('Müzik tamamen kapatıldı', 'error')
                end
            end
        },
        {
            title = 'Gelişmiş Filtreler',
            icon = 'filter',
            onSelect = function() FiltersMenu() end
        },
        {
            title = 'Müzik Geçmişi',
            icon = 'history',
            onSelect = function() MusicHistoryMenu() end
        }
    }

    lib.registerContext({
        id = 'speaker_menu',
        title = 'Nexora Hoparlör v2',
        options = options
    })
    lib.showContext('speaker_menu')
end

-- Konum güncelleme thread'i (Sesin aracı takip etmesi için)
CreateThread(function()
    while true do
        Wait(500)
        local ped = PlayerPedId()
        local vehicle = GetVehiclePedIsIn(ped, false)
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
    if vehicle == 0 then return end
    local musicId = GetVehicleMusicId(vehicle)
    
    -- Önceki sesi temizle
    exports.xsound:Destroy(musicId)
    
    local coords = GetEntityCoords(vehicle)
    local isYouTube = string.find(url, 'youtube.com') or string.find(url, 'youtu.be')
    
    if isYouTube then
        isExtracting = true
        currentExtractRequest = currentExtractRequest + 1
        local requestId = currentExtractRequest
        
        -- Timeout: 20 saniye (API gecikmesi için pay bırakıldı)
        SetTimeout(20000, function()
            if isExtracting and currentExtractRequest == requestId then
                isExtracting = false
                QBCore.Functions.Notify('URL işleme başarısız (Zaman Aşımı)', 'error')
            end
        end)
        
        TriggerServerEvent('swx_speaker:server:extractYouTubeAudio', url, musicId, currentVolume, currentDistance, coords, requestId)
    else
        isExtracting = false
        StartAudio(musicId, url, currentVolume, coords, currentDistance)
        TriggerServerEvent('swx_speaker:server:addToHistory', url, title or 'Direkt Müzik')
    end
end

-- Garantili Başlatma Mantığı
function StartAudio(musicId, url, volume, coords, distance)
    exports.xsound:PlayUrlPos(musicId, url, volume, coords, false)
    exports.xsound:Distance(musicId, distance)
    exports.xsound:destroyOnFinish(musicId, false)
    isPlaying = true
    isPaused = false
    
    -- 2 saniye sonra kontrol et, eğer ses oluşmamışsa tekrar dene (API gecikme önlemi)
    SetTimeout(2000, function()
        if isPlaying and not exports.xsound:soundExists(musicId) then
            print('[SWX Speaker] Ses başlamadı, tekrar deneniyor...')
            exports.xsound:PlayUrlPos(musicId, url, volume, coords, false)
        end
    end)
end

RegisterNetEvent('swx_speaker:client:playExtractedAudio', function(audioUrl, musicId, volume, distance, coords, title, originalUrl, requestId, serverIp)
    if requestId and requestId < currentExtractRequest then return end
    isExtracting = false
    
    local targetIp = serverIp or '194.105.5.37'
    audioUrl = audioUrl:gsub('localhost', targetIp)
    
    local ped = PlayerPedId()
    local vehicle = GetVehiclePedIsIn(ped, false)
    if vehicle ~= 0 and GetVehicleMusicId(vehicle) == musicId then
        StartAudio(musicId, audioUrl, volume, coords, distance)
        TriggerServerEvent('swx_speaker:server:addToHistory', originalUrl or audioUrl, title or 'YouTube Şarkı')
        QBCore.Functions.Notify('🎵 ' .. (title or 'YouTube Şarkı'), 'success')
    end
end)

-- Gelişmiş Filtreler Menüsü (Eski Detaylı Mantık)
function FiltersMenu()
    lib.registerContext({
        id = 'filters_menu',
        title = 'Ses Efektleri & Filtreler',
        menu = 'speaker_menu',
        options = {
            {
                title = 'Alçak Geçiren (Lowpass)',
                description = 'Boğuk, kapalı ses efekti',
                onSelect = function() ApplyFilterDialog('lowpass') end
            },
            {
                title = 'Yüksek Geçiren (Highpass)',
                description = 'İnce, telefon/telsiz sesi',
                onSelect = function() ApplyFilterDialog('highpass') end
            },
            {
                title = 'Bass Boost (Lowshelf)',
                description = 'Bassları güçlendirir',
                onSelect = function() ApplyFilterDialog('lowshelf') end
            },
            {
                title = 'Filtreleri Temizle',
                icon = 'trash',
                onSelect = function()
                    local musicId = GetVehicleMusicId(GetVehiclePedIsIn(PlayerPedId(), false))
                    if musicId then exports.xsound:clearAllFilters(musicId) end
                    QBCore.Functions.Notify('Tüm filtreler kaldırıldı', 'info')
                end
            }
        }
    })
    lib.showContext('filters_menu')
end

function ApplyFilterDialog(type)
    local input = lib.inputDialog(type:upper() .. ' Filtresi', {
        { type = 'number', label = 'Frekans (Hz)', default = 500, min = 20, max = 20000 },
        { type = 'number', label = 'Kazanç (Gain dB)', default = 10, min = -40, max = 40 }
    })
    if input then
        local musicId = GetVehicleMusicId(GetVehiclePedIsIn(PlayerPedId(), false))
        if musicId then
            exports.xsound:setFilter(musicId, type, input[1], 1.0, input[2])
            QBCore.Functions.Notify('Filtre uygulandı', 'success')
        end
    end
end

-- Yardımcı Dialoglar
function PlayMusicDialog()
    local input = lib.inputDialog('Müzik Çal', {
        { type = 'input', label = 'YouTube URL', required = true, icon = 'link' }
    })
    if input then PlayMusic(input[1], nil) end
end

function VolumeRangeDialog()
    local input = lib.inputDialog('Ses ve Mesafe', {
        { type = 'slider', label = 'Ses Seviyesi', default = 50, min = 0, max = 150 },
        { type = 'slider', label = 'Duyulma Mesafesi (m)', default = 65, min = 5, max = 100 }
    })
    if input then
        currentVolume = input[1] / 100
        currentDistance = input[2]
        local musicId = GetVehicleMusicId(GetVehiclePedIsIn(PlayerPedId(), false))
        if musicId and exports.xsound:soundExists(musicId) then
            exports.xsound:setVolume(musicId, currentVolume)
            exports.xsound:Distance(musicId, currentDistance)
        end
        QBCore.Functions.Notify('Ayarlar güncellendi', 'success')
    end
end

function TogglePause()
    local musicId = GetVehicleMusicId(GetVehiclePedIsIn(PlayerPedId(), false))
    if not musicId then return end
    if isPaused then
        exports.xsound:Resume(musicId)
        isPaused = false
        isPlaying = true
    else
        exports.xsound:Pause(musicId)
        isPaused = true
        isPlaying = false
    end
end

-- Diğer menü fonksiyonları buraya eklenebilir...
