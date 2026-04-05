-- WAIS-HUD Entity Hata Düzeltmesi
-- Nexora RP - GET_VEHICLE hatalarını önler

local lastVehicle = 0
local lastVehicleCheck = 0

-- Güvenli araç kontrolü
function SafeGetVehicle()
    local ped = PlayerPedId()
    if not DoesEntityExist(ped) then return 0 end
    
    local vehicle = GetVehiclePedIsIn(ped, false)
    
    -- Entity var mı kontrol et
    if vehicle ~= 0 and DoesEntityExist(vehicle) then
        lastVehicle = vehicle
        lastVehicleCheck = GetGameTimer()
        return vehicle
    end
    
    -- Son araç hala geçerli mi?
    if lastVehicle ~= 0 and DoesEntityExist(lastVehicle) then
        local timeSinceCheck = GetGameTimer() - lastVehicleCheck
        if timeSinceCheck < 1000 then -- 1 saniye içinde
            return lastVehicle
        end
    end
    
    lastVehicle = 0
    return 0
end

-- Güvenli yakıt kontrolü
function SafeGetFuelLevel(vehicle)
    if vehicle == 0 or not DoesEntityExist(vehicle) then
        return 0.0
    end
    
    local success, fuel = pcall(function()
        return GetVehicleFuelLevel(vehicle)
    end)
    
    if success then
        return fuel or 0.0
    end
    
    return 0.0
end

-- Güvenli RPM kontrolü
function SafeGetRPM(vehicle)
    if vehicle == 0 or not DoesEntityExist(vehicle) then
        return 0.0
    end
    
    local success, rpm = pcall(function()
        return GetVehicleCurrentRpm(vehicle)
    end)
    
    if success then
        return rpm or 0.0
    end
    
    return 0.0
end

-- Güvenli vites kontrolü
function SafeGetGear(vehicle)
    if vehicle == 0 or not DoesEntityExist(vehicle) then
        return 0
    end
    
    local success, gear = pcall(function()
        return GetVehicleCurrentGear(vehicle)
    end)
    
    if success then
        return gear or 0
    end
    
    return 0
end

-- Güvenli network ID kontrolü
function SafeGetNetworkId(entity)
    if entity == 0 or not DoesEntityExist(entity) then
        return 0
    end
    
    local success, netId = pcall(function()
        return NetworkGetNetworkIdFromEntity(entity)
    end)
    
    if success then
        return netId or 0
    end
    
    return 0
end

-- Export fonksiyonlar
exports('SafeGetVehicle', SafeGetVehicle)
exports('SafeGetFuelLevel', SafeGetFuelLevel)
exports('SafeGetRPM', SafeGetRPM)
exports('SafeGetGear', SafeGetGear)
exports('SafeGetNetworkId', SafeGetNetworkId)

print('[WAIS-HUD] Entity hata düzeltmesi yüklendi')
