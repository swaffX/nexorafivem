Citizen.CreateThread(function()
    while true do
        Citizen.Wait(0)
        -- Set to 40% density (0.4)
        SetVehicleDensityMultiplierThisFrame(0.4)
        SetPedDensityMultiplierThisFrame(0.4)
        SetRandomVehicleDensityMultiplierThisFrame(0.4)
        SetParkedVehicleDensityMultiplierThisFrame(0.4)
        SetScenarioPedDensityMultiplierThisFrame(0.4, 0.4)
        
        -- Bazı istenmeyen servislerin spawn olmasını tamamen engellemek (isteğe bağlı)
        -- SetDispatchCopsForPlayer(PlayerId(), false)
    end
end)
