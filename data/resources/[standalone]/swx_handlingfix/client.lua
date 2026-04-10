-- Handling değerlerini zorla uygula
local function ApplyForcedHandling(vehicle, handlingData)
    if not DoesEntityExist(vehicle) then return end
    
    -- SetVehicleHandlingFloat kullanarak değerleri zorla uygula
    for key, value in pairs(handlingData) do
        -- Handling hash hesapla
        local hash = GetHashKey(key)
        SetVehicleHandlingFloat(vehicle, 'CHandlingData', key, value)
        print('[SWX-HandlingFix] Uygulandı:', key, '=', value)
    end
    
    -- Handling'i yenile
    ModifyVehicleTopSpeed(vehicle, 1.0)
    
    -- Motor gücünü yenile
    SetVehicleEnginePowerMultiplier(vehicle, 1.0)
end

-- Araç spawn olduğunda uygula
RegisterNetEvent('swx_handlingfix:apply', function(netId, modelName)
    local vehicle = NetworkGetEntityFromNetworkId(netId)
    
    if vehicle and DoesEntityExist(vehicle) then
        local handlingData = Config.ForcedHandling[modelName]
        if handlingData then
            -- Kısa gecikme ile uygula (handling yüklenmesi için)
            Citizen.SetTimeout(500, function()
                ApplyForcedHandling(vehicle, handlingData)
                print('[SWX-HandlingFix]', modelName, 'handling uygulandı!')
            end)
        end
    end
end)

-- Oyuncu araç bindiğinde kontrol et
Citizen.CreateThread(function()
    while true do
        Citizen.Wait(Config.CheckInterval)
        
        local ped = PlayerPedId()
        local vehicle = GetVehiclePedIsIn(ped, false)
        
        if vehicle and DoesEntityExist(vehicle) then
            local model = GetEntityModel(vehicle)
            local modelName = GetDisplayNameFromVehicleModel(model):lower()
            
            if Config.ForcedHandling[modelName] then
                -- Hız kontrolü - handling değişmiş mi?
                local currentTopSpeed = GetVehicleHandlingFloat(vehicle, 'CHandlingData', 'fInitialDriveMaxFlatVel')
                local expectedSpeed = Config.ForcedHandling[modelName].fInitialDriveMaxFlatVel
                
                if math.abs(currentTopSpeed - expectedSpeed) > 5 then
                    print('[SWX-HandlingFix] Cache tespit edildi, yeniden uygulanıyor...')
                    ApplyForcedHandling(vehicle, Config.ForcedHandling[modelName])
                end
            end
        end
    end
end)

print('[SWX-HandlingFix] Client yüklendi!')
