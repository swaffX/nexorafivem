local QBCore = exports['qb-core']:GetCoreObject()
local isMenuOpen = false
local currentVehicle = nil
local currentMusicId = nil
local isPlaying = false
local playlist = {}
local currentVolume = Config.DefaultVolume
local currentBass = Config.DefaultBass
local currentTreble = Config.DefaultTreble

-- Menü aç/kapat
RegisterCommand('carradio', function()
    ToggleMenu()
end, false)

RegisterKeyMapping('carradio', 'Araç Radyosu', 'keyboard', 'K')

function ToggleMenu()
    local ped = PlayerPedId()
    local vehicle = GetVehiclePedIsIn(ped, false)
    
    if vehicle == 0 then
        QBCore.Functions.Notify(Config.Locales[Config.Locale]['not_in_vehicle'], 'error')
        return
    end
    
    local seat = GetPedInVehicleSeat(vehicle, -1)
    if seat ~= ped then
        QBCore.Functions.Notify(Config.Locales[Config.Locale]['not_driver'], 'error')
        return
    end
    
    currentVehicle = vehicle
    isMenuOpen = not isMenuOpen
    
    SetNuiFocus(isMenuOpen, isMenuOpen)
    SendNUIMessage({
        action = 'toggle',
        show = isMenuOpen,
        data = {
            volume = currentVolume,
            bass = currentBass,
            treble = currentTreble,
            isPlaying = isPlaying,
            playlist = playlist
        }
    })
end

-- NUI Callbacks
RegisterNUICallback('close', function(data, cb)
    isMenuOpen = false
    SetNuiFocus(false, false)
    cb('ok')
end)

RegisterNUICallback('playMusic', function(data, cb)
    local url = data.url
    
    if not url or url == "" then
        cb({ success = false, message = "URL boş" })
        return
    end
    
    -- Eski müziği durdur
    if currentMusicId then
        exports.xsound:Destroy(currentMusicId)
    end
    
    -- Yeni müzik ID'si
    currentMusicId = "carradio_" .. GetPlayerServerId(PlayerId()) .. "_" .. math.random(1000, 9999)
    
    -- Araç koordinatları
    local coords = GetEntityCoords(currentVehicle)
    
    -- Müzik çal
    exports.xsound:PlayUrlPos(currentMusicId, url, currentVolume, coords, false)
    exports.xsound:Distance(currentMusicId, Config.MaxDistance)
    
    -- Bass ve Tiz ayarla
    if currentBass ~= 0 then
        exports.xsound:setBassGain(currentMusicId, currentBass / 10)
    end
    
    isPlaying = true
    
    -- Playlist'e ekle
    table.insert(playlist, {
        url = url,
        title = data.title or "Bilinmeyen Şarkı",
        timestamp = os.time()
    })
    
    -- Araç konumunu güncelle
    CreateThread(function()
        while isPlaying and DoesEntityExist(currentVehicle) do
            local newCoords = GetEntityCoords(currentVehicle)
            exports.xsound:Position(currentMusicId, newCoords)
            Wait(500)
        end
    end)
    
    QBCore.Functions.Notify(Config.Locales[Config.Locale]['music_playing'], 'success')
    cb({ success = true, musicId = currentMusicId })
end)

RegisterNUICallback('stopMusic', function(data, cb)
    if currentMusicId then
        exports.xsound:Destroy(currentMusicId)
        currentMusicId = nil
        isPlaying = false
        QBCore.Functions.Notify(Config.Locales[Config.Locale]['music_stopped'], 'error')
    end
    cb({ success = true })
end)

RegisterNUICallback('pauseMusic', function(data, cb)
    if currentMusicId then
        exports.xsound:Pause(currentMusicId)
    end
    cb({ success = true })
end)

RegisterNUICallback('resumeMusic', function(data, cb)
    if currentMusicId then
        exports.xsound:Resume(currentMusicId)
    end
    cb({ success = true })
end)

RegisterNUICallback('setVolume', function(data, cb)
    currentVolume = data.volume
    if currentMusicId then
        exports.xsound:setVolume(currentMusicId, currentVolume)
    end
    cb({ success = true })
end)

RegisterNUICallback('setBass', function(data, cb)
    currentBass = data.bass
    if currentMusicId then
        -- Bass gain: -1.0 ile +1.0 arası
        exports.xsound:setBassGain(currentMusicId, currentBass / 10)
    end
    cb({ success = true })
end)

RegisterNUICallback('setTreble', function(data, cb)
    currentTreble = data.treble
    if currentMusicId then
        -- Treble için filter kullan (xsound'da treble yok, bass'ın tersi olarak kullanıyoruz)
        exports.xsound:setBassGain(currentMusicId, -currentTreble / 10)
    end
    cb({ success = true })
end)

RegisterNUICallback('clearPlaylist', function(data, cb)
    playlist = {}
    cb({ success = true })
end)

-- Araçtan inince müziği durdur
CreateThread(function()
    while true do
        Wait(1000)
        
        if isPlaying then
            local ped = PlayerPedId()
            local vehicle = GetVehiclePedIsIn(ped, false)
            
            if vehicle == 0 or vehicle ~= currentVehicle then
                -- Araçtan indi
                if currentMusicId then
                    exports.xsound:Destroy(currentMusicId)
                    currentMusicId = nil
                    isPlaying = false
                end
                
                if isMenuOpen then
                    isMenuOpen = false
                    SetNuiFocus(false, false)
                    SendNUIMessage({ action = 'toggle', show = false })
                end
            end
        end
    end
end)

-- Oyuncu çıkınca temizle
AddEventHandler('onResourceStop', function(resourceName)
    if GetCurrentResourceName() == resourceName then
        if currentMusicId then
            exports.xsound:Destroy(currentMusicId)
        end
        SetNuiFocus(false, false)
    end
end)
