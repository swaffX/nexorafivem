Citizen.CreateThread(function()
    while true do
        Citizen.Wait(0) -- Prevent crashing.

		-- Polisler kapalı kalsın (gerekirse true yap)
		SetCreateRandomCops(false)
		SetCreateRandomCopsNotOnScenarios(false)
		SetCreateRandomCopsOnScenarios(false)
		SetGarbageTrucks(true)  -- Çöp kamyonları açık
		SetRandomBoats(true)    -- Tekneler açık
        	SetVehicleDensityMultiplierThisFrame(0.5)      -- Trafik yoğunluğu orta
       		SetPedDensityMultiplierThisFrame(0.6)          -- NPC yoğunluğu artırıldı
		SetRandomVehicleDensityMultiplierThisFrame(0.5) -- Rastgele araçlar
		SetScenarioPedDensityMultiplierThisFrame(0.6, 0.6) -- Scenario NPC'ler
		SetParkedVehicleDensityMultiplierThisFrame(0.5)  -- Park edilmiş araçlar
    end
end)
