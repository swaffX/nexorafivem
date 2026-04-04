-- WAIS-HUD xsound Entegrasyonu
-- Nexora RP - Müzik senkronizasyonu

local currentMusicUrl = nil
local currentMusicId = nil
local isPlaying = false

-- WAIS-HUD'dan müzik çalma eventi
RegisterNetEvent('wais-hud:client:playMusic', function(url)
    if not url or url == "" then
        return
    end
    
    -- Eski müziği durdur
    if currentMusicId then
        exports.xsound:Destroy(currentMusicId)
    end
    
    -- Yeni müzik ID'si oluştur
    currentMusicId = "wais_music_" .. GetPlayerServerId(PlayerId()) .. "_" .. math.random(1000, 9999)
    currentMusicUrl = url
    
    -- Araç içinde mi kontrol et
    local ped = PlayerPedId()
    local vehicle = GetVehiclePedIsIn(ped, false)
    
    if vehicle ~= 0 then
        -- Araç içindeyse, aracın konumunda çal
        local coords = GetEntityCoords(vehicle)
        
        -- xsound ile müzik çal
        exports.xsound:PlayUrlPos(currentMusicId, url, Config.MusicSystem.distance or 10.0, coords, false)
        exports.xsound:Distance(currentMusicId, Config.MusicSystem.distance or 10.0)
        
        isPlaying = true
        
        -- Aracın konumunu sürekli güncelle
        CreateThread(function()
            while isPlaying and DoesEntityExist(vehicle) do
                local newCoords = GetEntityCoords(vehicle)
                exports.xsound:Position(currentMusicId, newCoords)
                Wait(500)
            end
        end)
        
        print('[WAIS-HUD xsound] Müzik çalıyor: ' .. currentMusicId)
    else
        -- Araç dışındaysa, oyuncunun konumunda çal
        local coords = GetEntityCoords(ped)
        exports.xsound:PlayUrlPos(currentMusicId, url, Config.MusicSystem.distance or 10.0, coords, false)
        exports.xsound:Distance(currentMusicId, Config.MusicSystem.distance or 10.0)
        
        isPlaying = true
        print('[WAIS-HUD xsound] Müzik çalıyor (yaya): ' .. currentMusicId)
    end
end)

-- Müziği durdur
RegisterNetEvent('wais-hud:client:stopMusic', function()
    if currentMusicId then
        exports.xsound:Destroy(currentMusicId)
        currentMusicId = nil
        currentMusicUrl = nil
        isPlaying = false
        print('[WAIS-HUD xsound] Müzik durduruldu')
    end
end)

-- Araçtan indiğinde müziği durdur
CreateThread(function()
    local wasInVehicle = false
    
    while true do
        local ped = PlayerPedId()
        local inVehicle = IsPedInAnyVehicle(ped, false)
        
        if wasInVehicle and not inVehicle and isPlaying then
            -- Araçtan indi, müziği durdur
            TriggerEvent('wais-hud:client:stopMusic')
        end
        
        wasInVehicle = inVehicle
        Wait(1000)
    end
end)

print('[WAIS-HUD] xsound entegrasyonu yüklendi')
