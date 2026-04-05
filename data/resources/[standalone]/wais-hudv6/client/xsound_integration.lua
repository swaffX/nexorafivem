-- WAIS-HUD xsound Entegrasyonu (Geliştirilmiş)
-- Nexora RP - Müzik senkronizasyonu

local currentMusicUrl = nil
local currentMusicId = nil
local isPlaying = false
local currentVolume = 0.5
local currentBass = 0

-- WAIS-HUD'dan müzik çalma (NUI'den gelecek)
RegisterNUICallback('wais:playMusic', function(data, cb)
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
    currentMusicId = "wais_music_" .. GetPlayerServerId(PlayerId()) .. "_" .. math.random(1000, 9999)
    currentMusicUrl = url
    
    -- Araç içinde mi kontrol et
    local ped = PlayerPedId()
    local vehicle = GetVehiclePedIsIn(ped, false)
    
    if vehicle ~= 0 and DoesEntityExist(vehicle) then
        -- Araç içindeyse, aracın konumunda çal (herkes duyar)
        local coords = GetEntityCoords(vehicle)
        
        exports.xsound:PlayUrlPos(currentMusicId, url, currentVolume, coords, false)
        exports.xsound:Distance(currentMusicId, 30.0) -- 30 metre mesafe
        
        if currentBass ~= 0 then
            exports.xsound:setBassGain(currentMusicId, currentBass / 10)
        end
        
        isPlaying = true
        
        -- Aracın konumunu sürekli güncelle
        CreateThread(function()
            while isPlaying and DoesEntityExist(vehicle) do
                local newCoords = GetEntityCoords(vehicle)
                exports.xsound:Position(currentMusicId, newCoords)
                Wait(500)
            end
        end)
        
        print('[WAIS-HUD xsound] Müzik çalıyor (araç): ' .. currentMusicId)
    else
        -- Araç dışındaysa, sadece kendisi duyar (client-side)
        exports.xsound:PlayUrl(currentMusicId, url, currentVolume, false)
        
        isPlaying = true
        print('[WAIS-HUD xsound] Müzik çalıyor (yaya): ' .. currentMusicId)
    end
    
    cb({ success = true, musicId = currentMusicId })
end)

-- Müziği durdur
RegisterNUICallback('wais:stopMusic', function(data, cb)
    if currentMusicId then
        exports.xsound:Destroy(currentMusicId)
        currentMusicId = nil
        currentMusicUrl = nil
        isPlaying = false
        print('[WAIS-HUD xsound] Müzik durduruldu')
    end
    cb({ success = true })
end)

-- Müziği duraklat
RegisterNUICallback('wais:pauseMusic', function(data, cb)
    if currentMusicId then
        exports.xsound:Pause(currentMusicId)
        print('[WAIS-HUD xsound] Müzik duraklatıldı')
    end
    cb({ success = true })
end)

-- Müziği devam ettir
RegisterNUICallback('wais:resumeMusic', function(data, cb)
    if currentMusicId then
        exports.xsound:Resume(currentMusicId)
        print('[WAIS-HUD xsound] Müzik devam ediyor')
    end
    cb({ success = true })
end)

-- Ses seviyesi ayarla
RegisterNUICallback('wais:setVolume', function(data, cb)
    currentVolume = data.volume or 0.5
    if currentMusicId then
        exports.xsound:setVolume(currentMusicId, currentVolume)
        print('[WAIS-HUD xsound] Ses seviyesi: ' .. currentVolume)
    end
    cb({ success = true })
end)

-- Bass ayarla
RegisterNUICallback('wais:setBass', function(data, cb)
    currentBass = data.bass or 0
    if currentMusicId then
        exports.xsound:setBassGain(currentMusicId, currentBass / 10)
        print('[WAIS-HUD xsound] Bass: ' .. currentBass)
    end
    cb({ success = true })
end)

-- Şarkı atlama (sonraki)
RegisterNUICallback('wais:nextSong', function(data, cb)
    -- Playlist'ten sonraki şarkıyı çal
    cb({ success = true })
end)

-- Şarkı atlama (önceki)
RegisterNUICallback('wais:prevSong', function(data, cb)
    -- Playlist'ten önceki şarkıyı çal
    cb({ success = true })
end)

-- Müzik durumu sorgula
RegisterNUICallback('wais:getMusicStatus', function(data, cb)
    cb({ 
        success = true,
        isPlaying = isPlaying,
        currentUrl = currentMusicUrl,
        volume = currentVolume,
        bass = currentBass
    })
end)

-- Araçtan indiğinde müziği durdur
CreateThread(function()
    local wasInVehicle = false
    
    while true do
        Wait(1000)
        
        if isPlaying then
            local ped = PlayerPedId()
            local inVehicle = IsPedInAnyVehicle(ped, false)
            
            if wasInVehicle and not inVehicle then
                -- Araçtan indi, müziği durdur
                if currentMusicId then
                    exports.xsound:Destroy(currentMusicId)
                    currentMusicId = nil
                    currentMusicUrl = nil
                    isPlaying = false
                    
                    -- NUI'ye bildir
                    SendNUIMessage({
                        action = 'musicStopped',
                        reason = 'leftVehicle'
                    })
                end
            end
            
            wasInVehicle = inVehicle
        end
    end
end)

print('[WAIS-HUD] xsound entegrasyonu yüklendi (geliştirilmiş)')

