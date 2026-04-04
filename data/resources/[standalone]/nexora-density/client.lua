-- Nexora RP - NPC Density Control
-- NPC'leri açar (yüksek seviye)

CreateThread(function()
    while true do
        -- Yaya yoğunluğu (0.0 = kapalı, 1.0 = tam açık)
        SetPedDensityMultiplierThisFrame(1.0) -- Tam yaya yoğunluğu
        
        -- Araç yoğunluğu
        SetVehicleDensityMultiplierThisFrame(1.0) -- Tam araç yoğunluğu
        SetRandomVehicleDensityMultiplierThisFrame(1.0)
        SetParkedVehicleDensityMultiplierThisFrame(1.0)
        
        -- Senaryo yoğunluğu (yayaların aktiviteleri)
        SetScenarioPedDensityMultiplierThisFrame(1.0, 1.0)
        
        Wait(0)
    end
end)

print('[Nexora Density] NPC yoğunluğu YÜKSEK seviyede açıldı (1.0)')
