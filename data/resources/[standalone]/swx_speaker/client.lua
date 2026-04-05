local QBCore = exports['qb-core']:GetCoreObject()
local currentMusicId = nil
local isPlaying = false
local isPaused = false 
local currentVolume = Config.DefaultVolume
local currentDistance = Config.MaxDistance
local playlist = {}
local musicHistory = {} 
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
    if history then
        for i, song in ipairs(history) do
            table.insert(musicHistory, {
                url = song.url,
                title = song.title or 'Bilinmeyen Şarkı',
                timestamp = song.timestamp
            })
        end
    end
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
        title = 'Nexora Hoparlör v2',
        options = {
            {
                title = 'Müzik Çal',
                description = isExtracting and '⌛ YouTube sesi işleniyor...' or 'YouTube veya Direkt URL girişi',
                icon = 'play',
                disabled = isExtracting,
                onSelect = function() PlayMusicDialog() end
            },
            {
                title = 'Müzik Sıraya Al',
                description = 'Şarkıyı listeye ekle',
                icon = 'list',
                onSelect = function() AddToQueueDialog() end
            },
            {
                title = 'Playlist & Sırayı Yönet',
                description = 'Sıradaki şarkıları gör ve temizle',
                icon = 'bars',
                onSelect = function() PlaylistMenu() end
            },
            {
                title = isPaused and 'Müziği Devam Ettir' or 'Müziği Duraklat',
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
                title = 'Müziği Tamamen Durdur',
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
                title = 'Gelişmiş Filtreler (Bass Boost)',
                icon = 'filter',
                onSelect = function() FiltersMenu() end
            },
            {
                title = 'Müzik Geçmişi',
                icon = 'history',
                onSelect = function() MusicHistoryMenu() end
            }
        }
    })
    lib.showContext('speaker_menu')
end

-- KONUM GÜNCELLEME THREAD - Yüksek frekanslı ve velocity bazlı tahmin
CreateThread(function()
    while true do
        Wait(50) -- 50ms'de bir güncelle (çok daha smooth - 20fps)
        
        -- Tüm oyuncuların araçlarını kontrol et (networked audio için)
        local vehicles = GetGamePool('CVehicle')
        for _, vehicle in ipairs(vehicles) do
            if DoesEntityExist(vehicle) then
                local musicId = GetVehicleMusicId(vehicle)
                if musicId and exports.xsound:soundExists(musicId) then
                    local coords = GetEntityCoords(vehicle)
                    local velocity = GetEntityVelocity(vehicle)
                    
                    -- Velocity bazlı tahmin (sesin aracı takip etmesi için)
                    -- Hız vektörünü 50ms'lik gecikmeyi telafi etmek için biraz ileri kaydır
                    local predictedCoords = vector3(
                        coords.x + velocity.x * 0.05,
                        coords.y + velocity.y * 0.05,
                        coords.z + velocity.z * 0.05
                    )
                    
                    -- Sadece sesin sahibi veya yakındaki oyuncular için güncelle
                    local ped = PlayerPedId()
                    local playerCoords = GetEntityCoords(ped)
                    local dist = #(playerCoords - coords)
                    
                    if dist < currentDistance + 50.0 then -- Sadece duyabilecek mesafedekiler
                        exports.xsound:Position(musicId, predictedCoords)
                    end
                end
            end
        end
    end
end)

-- MÜZİK BAŞLATMA
function PlayMusic(url, title)
    local ped = PlayerPedId()
    local vehicle = GetVehiclePedIsIn(ped, false)
    if vehicle == 0 then return end
    local musicId = GetVehicleMusicId(vehicle)
    
    exports.xsound:Destroy(musicId)
    
    local coords = GetEntityCoords(vehicle)
    local isYouTube = string.find(url, 'youtube.com') or string.find(url, 'youtu.be')
    
    if isYouTube then
        isExtracting = true
        currentExtractRequest = currentExtractRequest + 1
        local requestId = currentExtractRequest
        
        SetTimeout(20000, function()
            if isExtracting and currentExtractRequest == requestId then
                isExtracting = false
                QBCore.Functions.Notify('Zaman aşımı: YouTube yanıt vermedi', 'error')
            end
        end)
        
        TriggerServerEvent('swx_speaker:server:extractYouTubeAudio', url, musicId, currentVolume, currentDistance, coords, requestId)
    else
        isExtracting = false
        StartAudio(musicId, url, currentVolume, coords, currentDistance)
        TriggerServerEvent('swx_speaker:server:addToHistory', url, title or 'Direkt URL')
    end
end

-- GARANTİLİ BAŞLATMA - Smooth start, no kickback
function StartAudio(musicId, url, volume, coords, distance)
    -- Önce varsa eski sesi sessizce kapat (kickback önlemek için)
    if exports.xsound:soundExists(musicId) then
        exports.xsound:Destroy(musicId)
        Wait(50) -- Kısa bekleme
    end
    
    -- Yeni sesi başlat
    exports.xsound:PlayUrlPos(musicId, url, volume, coords, false)
    exports.xsound:Distance(musicId, distance)
    exports.xsound:destroyOnFinish(musicId, false)
    isPlaying = true
    isPaused = false
    
    -- Buffer için kısa bekle, sonra volume'u ayarla (fade-in efekti)
    SetTimeout(100, function()
        if exports.xsound:soundExists(musicId) then
            exports.xsound:setVolume(musicId, 0.01) -- Sessiz başlat
            -- Smooth fade-in
            for i = 1, 10 do
                SetTimeout(i * 50, function()
                    if exports.xsound:soundExists(musicId) then
                        exports.xsound:setVolume(musicId, volume * (i / 10))
                    end
                end)
            end
        end
    end)
end

RegisterNetEvent('swx_speaker:client:playExtractedAudio', function(audioUrl, musicId, volume, distance, coords, title, originalUrl, requestId, serverIp)
    print('[SWX Speaker Client] playExtractedAudio event received!')
    print('[SWX Speaker Client] requestId:', requestId, 'currentExtractRequest:', currentExtractRequest)
    print('[SWX Speaker Client] audioUrl:', audioUrl and 'present' or 'nil')
    print('[SWX Speaker Client] musicId:', musicId)
    
    if requestId and requestId < currentExtractRequest then 
        print('[SWX Speaker Client] Request ID outdated, ignoring')
        return 
    end
    isExtracting = false
    
    local targetIp = serverIp or '194.105.5.37'
    audioUrl = audioUrl:gsub('localhost', targetIp)
    
    local ped = PlayerPedId()
    local vehicle = GetVehiclePedIsIn(ped, false)
    print('[SWX Speaker Client] Vehicle:', vehicle, 'GetVehicleMusicId:', GetVehicleMusicId(vehicle), 'musicId:', musicId)
    if vehicle ~= 0 and GetVehicleMusicId(vehicle) == musicId then
        print('[SWX Speaker Client] Starting audio...')
        StartAudio(musicId, audioUrl, volume, coords, distance)
        TriggerServerEvent('swx_speaker:server:addToHistory', originalUrl or audioUrl, title or 'YouTube Şarkı')
        QBCore.Functions.Notify('🎵 ' .. (title or 'YouTube Şarkı'), 'success')
    else
        print('[SWX Speaker Client] Vehicle check failed!')
    end
end)

RegisterNetEvent('swx_speaker:client:extractFailed', function(requestId)
    if requestId and requestId < currentExtractRequest then return end
    isExtracting = false
end)

-- DİALOGLAR VE MENÜLER
function PlayMusicDialog()
    local input = lib.inputDialog('Müzik Çal', {
        { type = 'input', label = 'YouTube veya Direkt URL', required = true, icon = 'link' }
    })
    if input then PlayMusic(input[1], nil) end
end

function AddToQueueDialog()
    local input = lib.inputDialog('Sıraya Ekle', {
        { type = 'input', label = 'YouTube veya Direkt URL', required = true, icon = 'link' }
    })
    if input then
        QBCore.Functions.TriggerCallback('swx_speaker:getYouTubeTitle', function(title)
            table.insert(playlist, { url = input[1], title = title or 'Sıradaki Şarkı' })
            QBCore.Functions.Notify('Şarkı sıraya eklendi', 'success')
        end, input[1])
    end
end

function PlaylistMenu()
    local options = {
        {
            title = 'Sıradaki Şarkıya Geç',
            icon = 'forward',
            disabled = #playlist == 0,
            onSelect = function() PlayNextSong() end
        },
        {
            title = 'Tüm Sırayı Temizle',
            icon = 'trash',
            disabled = #playlist == 0,
            onSelect = function() playlist = {} QBCore.Functions.Notify('Sıra temizlendi', 'info') end
        }
    }
    for i, song in ipairs(playlist) do
        table.insert(options, { title = i .. ". " .. song.title, description = 'Çalmak için tıkla', onSelect = function() PlayMusic(song.url, song.title) table.remove(playlist, i) end })
    end
    lib.registerContext({ id = 'playlist_menu', title = 'Playlist', menu = 'speaker_menu', options = options })
    lib.showContext('playlist_menu')
end

function FiltersMenu()
    lib.registerContext({
        id = 'filters_menu',
        title = 'Gelişmiş Filtreler',
        menu = 'speaker_menu',
        options = {
            { title = 'Bass Boost (Lowshelf)', onSelect = function() ApplyFilterDialog('lowshelf', 150, 15) end },
            { title = 'Boğuk Ses (Lowpass)', onSelect = function() ApplyFilterDialog('lowpass', 400, 10) end },
            { title = 'Telsiz Efekti (Bandpass)', onSelect = function() ApplyFilterDialog('bandpass', 1500, 0) end },
            { title = 'Tüm Filtreleri Temizle', icon = 'trash', onSelect = function()
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
        if musicId then
            -- Sesin yüklendiğinden emin olmak için 500ms bekle
            SetTimeout(500, function()
                exports.xsound:setFilter(musicId, type, input[1], 1.0, input[2])
                QBCore.Functions.Notify('Filtre uygulandı', 'success')
            end)
        end
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
    else
        QBCore.Functions.Notify('Playlist bitti', 'info')
    end
end
