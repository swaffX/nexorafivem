local currentFov = nil
local defaultFov = 50 -- GTA varsayılan FOV

-- FOV ayarlama fonksiyonu
local function SetVehicleFov(fov)
    if fov and fov >= 30 and fov <= 120 then
        SetGameplayCamFov(fov)
        currentFov = fov
        print('[SWX-FOV] FOV ayarlandı:', fov)
    end
end

-- Ana loop
Citizen.CreateThread(function()
    while true do
        Citizen.Wait(500) -- Her 500ms kontrol et (performans için)
        
        local ped = PlayerPedId()
        local inVehicle = IsPedInAnyVehicle(ped, false)
        local camViewMode = GetFollowVehicleCamViewMode()
        
        -- Araç içinde ve first person modda mı?
        if inVehicle and camViewMode == 4 then -- 4 = First person
            if currentFov ~= Config.VehicleFov then
                SetVehicleFov(Config.VehicleFov)
            end
        elseif not Config.OnlyInVehicle then
            -- Araç dışındaki FOV ayarı
            if Config.OnFootFov and currentFov ~= Config.OnFootFov then
                SetVehicleFov(Config.OnFootFov)
            elseif not Config.OnFootFov and currentFov ~= defaultFov then
                -- Varsayılana döndür
                SetGameplayCamFov(defaultFov)
                currentFov = defaultFov
            end
        elseif currentFov and currentFov ~= defaultFov then
            -- Araçtan çıkınca eski haline döndür
            SetGameplayCamFov(defaultFov)
            currentFov = defaultFov
        end
    end
end)

-- Komut (opsiyonel)
if Config.EnableCommand then
    RegisterCommand(Config.Command, function(source, args)
        local fov = tonumber(args[1])
        if fov and fov >= 30 and fov <= 120 then
            Config.VehicleFov = fov
            SetVehicleFov(fov)
            TriggerEvent('chat:addMessage', {
                color = {0, 255, 0},
                args = {'[FOV]', 'Araç içi FOV ' .. fov .. ' olarak ayarlandı!'}
            })
        else
            TriggerEvent('chat:addMessage', {
                color = {255, 0, 0},
                args = {'[FOV]', 'Geçerli bir FOV değeri girin! (30-120)'}
            })
        end
    end, false)
end

-- Tuş atama (opsiyonel)
if Config.Keybind then
    RegisterKeyMapping(Config.Command, 'FOV Ayarla', 'keyboard', Config.Keybind)
end

print('[SWX-FOV] Script yüklendi! Araç içi FOV:', Config.VehicleFov)
