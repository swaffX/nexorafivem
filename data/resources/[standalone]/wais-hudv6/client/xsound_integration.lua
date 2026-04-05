-- WAIS-HUD xsound Entegrasyonu
-- Nexora RP - Müzik senkronizasyonu

local currentMusicUrl = nil
local currentMusicId = nil
local isPlaying = false

-- WAIS-HUD'dan müzik çalma eventi (NUI'den gelecek)
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
    
    -- Yeni müzik ID'si oluştur
    currentMusicId = "wais_music_" .. GetPlayerServerId(PlayerId()) .. "_" .. math.random(1000, 9999)
    currentMusicUrl = url
    
    -- Araç içinde mi kontrol et
    local ped = PlayerPedId()
    local vehicle = GetVehiclePedIsIn(ped, false)
    
    if vehicle ~= 0 and DoesEntityExist(vehicle) then
        -- Araç içindeyse, aracın konumunda çal
        local coords = GetEntityCoords(vehicle)
        
        -- xsound ile müzik çal
        exports.xsound:PlayUrlPos(currentMusicId, url, 15.0, coords, false)
        exports.xsound:Distance(currentMusicId, 15.0)
        exports.xsound:setVolume(currentMusicId, data.volume or 0.5)
        
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
        exports.xsound:PlayUrlPos(currentMusicId, url, 10.0, coords, false)
        exports.xsound:Distance(currentMusicId, 10.0)
        exports.xsound:setVolume(currentMusicId, data.volume or 0.5)
        
        isPlaying = true
        print('[WAIS-HUD xsound] Müzik çalıyor (yaya): ' .. currentMusicId)
    end
    
    cb({ success = true, musicId = currentMusicId })
end)

-- Müziği durdur
RegisterNUICallback('stopMusic', function(data, cb)
    if currentMusicId then
        exports.xsound:Destroy(currentMusicId)
        currentMusicId = nil
        currentMusicUrl = nil
        isPlaying = false
        print('[WAIS-HUD xsound] Müzik durduruldu')
    end
    cb({ success = true })
end)

-- Müziği duraklat/devam ettir
RegisterNUICallback('pauseMusic', function(data, cb)
    if currentMusicId then
        exports.xsound:Pause(currentMusicId)
        print('[WAIS-HUD xsound] Müzik duraklatıldı')
    end
    cb({ success = true })
end)

RegisterNUICallback('resumeMusic', function(data, cb)
    if currentMusicId then
        exports.xsound:Resume(currentMusicId)
        print('[WAIS-HUD xsound] Müzik devam ediyor')
    end
    cb({ success = true })
end)

-- Ses seviyesi ayarla
RegisterNUICallback('setVolume', function(data, cb)
    if currentMusicId and data.volume then
        exports.xsound:setVolume(currentMusicId, data.volume)
        print('[WAIS-HUD xsound] Ses seviyesi: ' .. data.volume)
    end
    cb({ success = true })
end)

-- Araçtan indiğinde müziği durdur
CreateThread(function()
    local wasInVehicle = false
    
    while true do
        local ped = PlayerPedId()
        local inVehicle = IsPedInAnyVehicle(ped, false)
        
        if wasInVehicle and not inVehicle and isPlaying then
            -- Araçtan indi, müziği durdur
            if currentMusicId then
                exports.xsound:Destroy(currentMusicId)
                currentMusicId = nil
                currentMusicUrl = nil
                isPlaying = false
            end
        end
        
        wasInVehicle = inVehicle
        Wait(1000)
    end
end)

print('[WAIS-HUD] xsound entegrasyonu yüklendi')
