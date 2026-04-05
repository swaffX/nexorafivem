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

-- Oyuncu spawn olduğunda geçmişi yükle
RegisterNetEvent('QBCore:Client:OnPlayerLoaded', function()
    TriggerServerEvent('swx_speaker:server:loadHistory')
end)

-- Geçmişi al
RegisterNetEvent('swx_speaker:client:receiveHistory', function(history)
    musicHistory = {}
    for i, song in ipairs(history) do
        table.insert(musicHistory, {
            url = song.url,
            title = song.title or 'Bilinmeyen Şarkı',
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

-- ANA MENÜ
function OpenSpeakerMenu()
    local ped = PlayerPedId()
    local vehicle = GetVehiclePedIsIn(ped, false)
    local musicId = GetVehicleMusicId(vehicle)
    
    lib.registerContext({
        id = 'speaker_menu',
        title = 'Nexora Hoparlör Sistemi',
        options = {
            {
                title = 'Müzik Çal',
                description = isExtracting and '⌛ Yükleniyor...' or 'YouTube veya Direkt URL',
                icon = 'play',
                disabled = isExtracting,
                onSelect = function() PlayMusicDialog() end
            },
            {
                title = 'Müziği Duraklat / Devam Ettir',
                description = isPaused and 'Müziği çalmaya devam et' or 'Müziği geçici olarak durdur',
                icon = isPaused and 'play' or 'pause',
                disabled = not isPlaying and not isPaused,
                onSelect = function() TogglePause() end
            },
            {
                title = 'Ses ve Mesafe Ayarları',
                description = 'Ses yüksekliği ve duyulma mesafesi',
                icon = 'volume-up',
                onSelect = function() VolumeRangeDialog() end
            },
            {
                title = 'Müziği Tamamen Durdur',
                description = 'Ses objesini yok eder',
                icon = 'stop',
                onSelect = function()
                    if musicId then
                        exports.xsound:Destroy(musicId)
                        isPlaying = false
                        isPaused = false
                        QBCore.Functions.Notify('Müzik durduruldu', 'error')
                    end
                end
            },
            {
                title = 'Playlist & Sıra',
                description = 'Sıradaki şarkıları yönet',
                icon = 'list',
                onSelect = function() PlaylistMenu() end
            },
            {
                title = 'Gelişmiş Filtreler',
                description = 'Bass Boost, Telsiz Efekti vb.',
                icon = 'filter',
                onSelect = function() FiltersMenu() end
            },
            {
                title = 'Müzik Geçmişi',
                description = 'Son çalınan şarkılar',
                icon = 'history',
                onSelect = function() MusicHistoryMenu() end
            }
        }
    })
    lib.showContext('speaker_menu')
end

-- KONUM GÜNCELLEME (ARACI TAKİP ETME)
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

-- MÜZİK BAŞLATMA MANTIĞI
function PlayMusic(url, title)
    local ped = PlayerPedId()
    local vehicle = GetVehiclePedIsIn(ped, false)
    if vehicle == 0 then return end
    local musicId = GetVehicleMusicId(vehicle)
    
    exports.xsound:Destroy(musicId) -- Eski sesi sil
    
    local coords = GetEntityCoords(vehicle)
    local isYouTube = string.find(url, 'youtube.com') or string.find(url, 'youtu.be')
    
    if isYouTube then
        isExtracting = true
        currentExtractRequest = currentExtractRequest + 1
        local requestId = currentExtractRequest
        
        SetTimeout(20000, function()
            if isExtracting and currentExtractRequest == requestId then
                isExtracting = false
                QBCore.Functions.Notify('YouTube işlemi zaman aşımına uğradı', 'error')
            end
        end)
        
        TriggerServerEvent('swx_speaker:server:extractYouTubeAudio', url, musicId, currentVolume, currentDistance, coords, requestId)
    else
        isExtracting = false
        StartAudio(musicId, url, currentVolume, coords, currentDistance)
        TriggerServerEvent('swx_speaker:server:addToHistory', url, title or 'Direkt Müzik')
    end
end

-- GARANTİLİ BAŞLATMA (RETRY)
function StartAudio(musicId, url, volume, coords, distance)
    exports.xsound:PlayUrlPos(musicId, url, volume, coords, false)
    exports.xsound:Distance(musicId, distance)
    exports.xsound:destroyOnFinish(musicId, false)
    isPlaying = true
    isPaused = false
    
    SetTimeout(2000, function()
        if isPlaying and not exports.xsound:soundExists(musicId) then
            print('[SWX Speaker] Ses başlamadı, tekrar deneniyor...')
            exports.xsound:PlayUrlPos(musicId, url, volume, coords, false)
            exports.xsound:Distance(musicId, distance)
        end
    end)
end

-- SERVER'DAN GELEN YOUTUBE SESİ
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

-- MENÜ DİALOGLARI VE ALT MENÜLER
function PlayMusicDialog()
    local input = lib.inputDialog('Müzik Çal', {
        { type = 'input', label = 'YouTube veya Direkt URL', required = true, icon = 'link' }
    })
    if input then PlayMusic(input[1], nil) end
end

function PlaylistMenu()
    local options = {
        {
            title = 'Sıradaki Şarkıyı Çal',
            disabled = #playlist == 0,
            onSelect = function() PlayNextSong() end
        },
        {
            title = 'Sırayı Temizle',
            disabled = #playlist == 0,
            onSelect = function() 
                playlist = {} 
                QBCore.Functions.Notify('Sıra temizlendi', 'info')
            end
        }
    }
    for i, song in ipairs(playlist) do
        table.insert(options, { title = i .. ". " .. (song.title or 'Bilinmeyen'), description = 'Tıkla ve çal' })
    end
    lib.registerContext({ id = 'playlist_menu', title = 'Playlist', menu = 'speaker_menu', options = options })
    lib.showContext('playlist_menu')
end

function FiltersMenu()
    lib.registerContext({
        id = 'filters_menu',
        title = 'Ses Filtreleri',
        menu = 'speaker_menu',
        options = {
            { title = 'Bass Boost (Lowshelf)', onSelect = function() ApplyFilterDialog('lowshelf', 150, 15) end },
            { title = 'Boğuk Ses (Lowpass)', onSelect = function() ApplyFilterDialog('lowpass', 400, 10) end },
            { title = 'Telsiz Sesi (Bandpass)', onSelect = function() ApplyFilterDialog('bandpass', 1500, 0) end },
            { title = 'İnce Ses (Highpass)', onSelect = function() ApplyFilterDialog('highpass', 2000, 10) end },
            { title = 'Filtreleri Temizle', icon = 'trash', onSelect = function()
                local musicId = GetVehicleMusicId(GetVehiclePedIsIn(PlayerPedId(), false))
                if musicId then exports.xsound:clearAllFilters(musicId) end
                QBCore.Functions.Notify('Filtreler temizlendi', 'info')
            end }
        }
    })
    lib.showContext('filters_menu')
end

function ApplyFilterDialog(type, defFreq, defGain)
    local input = lib.inputDialog(type:upper() .. ' Ayarları', {
        { type = 'number', label = 'Frekans (Hz)', default = defFreq },
        { type = 'number', label = 'Gain (dB)', default = defGain }
    })
    if input then
        local musicId = GetVehicleMusicId(GetVehiclePedIsIn(PlayerPedId(), false))
        if musicId then exports.xsound:setFilter(musicId, type, input[1], 1.0, input[2]) end
    end
end

function MusicHistoryMenu()
    TriggerServerEvent('swx_speaker:server:loadHistory')
    Wait(300)
    local options = {}
    if #musicHistory == 0 then
        table.insert(options, { title = 'Geçmiş boş', disabled = true })
    else
        for i, song in ipairs(musicHistory) do
            table.insert(options, {
                title = song.title,
                description = 'Çalmak için tıkla',
                onSelect = function() PlayMusic(song.url, song.title) end
            })
        end
    end
    lib.registerContext({ id = 'history_menu', title = 'Müzik Geçmişi', menu = 'speaker_menu', options = options })
    lib.showContext('history_menu')
end

function VolumeRangeDialog()
    local input = lib.inputDialog('Ses ve Mesafe', {
        { type = 'slider', label = 'Ses Seviyesi', default = math.floor(currentVolume * 100), min = 0, max = 150 },
        { type = 'slider', label = 'Duyulma Mesafesi (m)', default = math.floor(currentDistance), min = 5, max = 100 }
    })
    if input then
        currentVolume = input[1] / 100
        currentDistance = input[2]
        local musicId = GetVehicleMusicId(GetVehiclePedIsIn(PlayerPedId(), false))
        if musicId then
            exports.xsound:setVolume(musicId, currentVolume)
            exports.xsound:Distance(musicId, currentDistance)
        end
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

function PlayNextSong()
    if #playlist > 0 then
        local song = table.remove(playlist, 1)
        PlayMusic(song.url, song.title)
    end
end
