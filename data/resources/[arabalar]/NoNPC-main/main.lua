Citizen.CreateThread(function()
    while true do
        Citizen.Wait(0) -- Prevent crashing.

		-- Polisler kapalı kalsın (gerekirse true yap)
		SetCreateRandomCops(false)
		SetCreateRandomCopsNotOnScenarios(false)
		SetCreateRandomCopsOnScenarios(false)
		SetGarbageTrucks(true)  -- Çöp kamyonları açık
		SetRandomBoats(true)    -- Tekneler açık
       		SetVehicleDensityMultiplierThisFrame(0.3)      -- Trafik yoğunluğu düşük
       		SetPedDensityMultiplierThisFrame(0.4)          -- NPC yoğunluğu düşük-orta
		SetRandomVehicleDensityMultiplierThisFrame(0.3) -- Rastgele araçlar
		SetScenarioPedDensityMultiplierThisFrame(0.4, 0.4) -- Scenario NPC'ler
		SetParkedVehicleDensityMultiplierThisFrame(0.5)  -- Park edilmiş araçlar
    end
end)
