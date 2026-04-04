-- Nexora Visibility Fix
-- Karakterlerin görüş açısı dışında saydamlaşmasını engeller

Citizen.CreateThread(function()
    while true do
        Citizen.Wait(0)
        
        -- Ped ve araç LOD mesafelerini artır
        SetPedLodMultiplier(1.0)
        SetVehicleLodMultiplier(1.0)
        
        -- Streaming mesafesini optimize et
        SetStreamingDistanceMultiplier(1.0)
        
        -- Ped ve araçların daha uzaktan görünmesini sağla
        for _, ped in ipairs(GetGamePool('CPed')) do
            if DoesEntityExist(ped) and not IsPedAPlayer(ped) then
                SetEntityLodDist(ped, 500)
            end
        end
        
        for _, vehicle in ipairs(GetGamePool('CVehicle')) do
            if DoesEntityExist(vehicle) then
                SetEntityLodDist(vehicle, 500)
            end
        end
        
        Citizen.Wait(1000) -- Her saniye kontrol et (performans için)
    end
end)

-- Oyuncuların asla saydamlaşmamasını sağla
Citizen.CreateThread(function()
    while true do
        Citizen.Wait(100)
        
        local players = GetActivePlayers()
        for _, playerId in ipairs(players) do
            local ped = GetPlayerPed(playerId)
            if DoesEntityExist(ped) then
                SetEntityAlpha(ped, 255, false) -- Tam görünür
                SetEntityLodDist(ped, 1000) -- Uzak mesafeden görünür
            end
        end
    end
end)
