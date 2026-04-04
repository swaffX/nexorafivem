-- Nexora RP - NPC Density Control
-- NPC'leri açar (orta seviye)

CreateThread(function()
    while true do
        -- Yaya yoğunluğu (0.0 = kapalı, 1.0 = tam açık)
        SetPedDensityMultiplierThisFrame(0.5) -- Orta seviye yaya
        
        -- Araç yoğunluğu
        SetVehicleDensityMultiplierThisFrame(0.5) -- Orta seviye araç
        SetRandomVehicleDensityMultiplierThisFrame(0.5)
        SetParkedVehicleDensityMultiplierThisFrame(0.5)
        
        -- Senaryo yoğunluğu (yayaların aktiviteleri)
        SetScenarioPedDensityMultiplierThisFrame(0.5, 0.5)
        
        Wait(0)
    end
end)

print('[Nexora Density] NPC yoğunluğu orta seviyede açıldı')
