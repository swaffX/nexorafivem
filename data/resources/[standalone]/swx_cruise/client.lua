local QBCore = exports['qb-core']:GetCoreObject()

local cruiseControl = {
    enabled = false,
    targetSpeed = 0,
    lastVehicle = nil
}

-- ox_lib ve player loaded bekle, sonra keybind kaydet
CreateThread(function()
    -- ox_lib hazır olana kadar bekle (exports kontrolü)
    local ox_lib = nil
    while not ox_lib do
        Wait(100)
        local status, result = pcall(function()
            return exports['ox_lib']
        end)
        if status and result then
            ox_lib = result
        end
    end
    
    -- lib global'inin hazır olmasını bekle
    local attempts = 0
    while not _G.lib and attempts < 50 do
        Wait(100)
        attempts = attempts + 1
    end
    
    if not _G.lib then
        print('[SWX Cruise] Uyarı: ox_lib global değişkeni bulunamadı!')
        return
    end
    
    -- Player loaded olana kadar bekle
    while not LocalPlayer.state.isLoggedIn do
        Wait(100)
    end
    
    -- B tuşu ile hız sabitleme
    local success, result = pcall(function()
        cruiseControl.keybind = lib.addKeybind({
            name = 'swx_cruise_control',
            description = 'Hız Sabitleme (Cruise Control)',
            defaultKey = 'B',
            onPressed = function()
                ToggleCruiseControl()
            end
        })
    end)
    
    if not success then
        print('[SWX Cruise] Keybind kaydedilemedi: ' .. tostring(result))
    end
end)

function ToggleCruiseControl()
    local ped = PlayerPedId()
    local vehicle = GetVehiclePedIsIn(ped, false)
    
    -- Araçta değilse iptal
    if vehicle == 0 then
        QBCore.Functions.Notify('Araçta değilsiniz!', 'error', 3000)
        return
    end
    
    -- Sürücü değilse iptal
    local driver = GetPedInVehicleSeat(vehicle, -1)
    if driver ~= ped then
        QBCore.Functions.Notify('Sürücü koltuğunda değilsiniz!', 'error', 3000)
        return
    end
    
    -- Hız sabitleme açık ise kapat
    if cruiseControl.enabled then
        DisableCruiseControl()
        return
    end
    
    -- Hız çok düşükse iptal (5 km/h altı)
    local currentSpeed = GetEntitySpeed(vehicle)
    local speedKmh = currentSpeed * 3.6
    
    if speedKmh < 5.0 then
        QBCore.Functions.Notify('Hız çok düşük! En az 5 km/h gerekli.', 'error', 3000)
        return
    end
    
    -- Hız sabitlemeyi aç
    EnableCruiseControl(vehicle, currentSpeed)
end

function EnableCruiseControl(vehicle, speed)
    cruiseControl.enabled = true
    cruiseControl.targetSpeed = speed
    cruiseControl.lastVehicle = vehicle
    
    local speedKmh = math.floor(speed * 3.6)
    local speedMph = math.floor(speed * 2.23694)
    
    QBCore.Functions.Notify('Hız Sabitlendi: ' .. speedKmh .. ' km/h', 'success', 4000)
    
    -- Hız sabitleme thread'i
    CreateThread(function()
        while cruiseControl.enabled do
            Wait(100)
            
            local ped = PlayerPedId()
            local currentVehicle = GetVehiclePedIsIn(ped, false)
            
            -- Araç değişti veya araçta değil
            if currentVehicle ~= cruiseControl.lastVehicle or currentVehicle == 0 then
                DisableCruiseControl()
                break
            end
            
            local driver = GetPedInVehicleSeat(currentVehicle, -1)
            if driver ~= ped then
                DisableCruiseControl()
                break
            end
            
            -- Fren veya el freni kontrolü
            if IsControlPressed(0, 72) then -- Brake (S tuşu)
                DisableCruiseControl()
                QBCore.Functions.Notify('Fren yapıldı - Hız sabitleme kapandı', 'info', 3000)
                break
            end
            
            if IsControlPressed(0, 76) then -- Handbrake (SPACE)
                DisableCruiseControl()
                QBCore.Functions.Notify('El freni - Hız sabitleme kapandı', 'info', 3000)
                break
            end
            
            -- Aracı durdurma kontrolü
            if IsControlPressed(0, 71) then -- Throttle (W tuşu)
                -- Gaz veriliyor, hız sabitlemeyi aşıp aşmadığını kontrol et
                local currentSpeed = GetEntitySpeed(currentVehicle)
                local speedKmh = currentSpeed * 3.6
                local targetKmh = cruiseControl.targetSpeed * 3.6
                
                -- Eğer gaz veriliyorsa ve hedef hızın üzerine çıkılmak isteniyorsa
                -- Cruise control hedefini güncelle (isteğe bağlı)
                -- Şimdilik sadece hedef hızı koruyoruz
            end
            
            -- Hız sabitleme mantığı
            local currentSpeed = GetEntitySpeed(currentVehicle)
            local speedDiff = cruiseControl.targetSpeed - currentSpeed
            
            -- Hız düşerse gaz ver
            if speedDiff > 0.5 then -- 0.5 m/s = ~1.8 km/h tolerans
                local throttle = math.min(1.0, speedDiff / 5.0) -- Orantılı gaz
                SetControlValue(0, 71, throttle) -- Throttle
            elseif speedDiff > 0 then
                -- Küçük düzeltme
                SetControlValue(0, 71, 0.3)
            end
            
            -- Hız çok yüksekse (virajda kayma vb.)
            if currentSpeed > cruiseControl.targetSpeed * 1.1 then -- %10 tolerans
                -- Araç kendi hızını düşürecek (fren gerekmez)
                SetControlValue(0, 71, 0.0)
            end
        end
    end)
end

function DisableCruiseControl()
    if not cruiseControl.enabled then return end
    
    cruiseControl.enabled = false
    cruiseControl.targetSpeed = 0
    
    QBCore.Functions.Notify('Hız Sabitleme Kapatıldı', 'info', 3000)
end

-- Araçtan inince otomatik kapat
CreateThread(function()
    local wasInVehicle = false
    
    while true do
        Wait(1000)
        
        local ped = PlayerPedId()
        local inVehicle = IsPedInAnyVehicle(ped, false)
        
        if wasInVehicle and not inVehicle and cruiseControl.enabled then
            DisableCruiseControl()
        end
        
        wasInVehicle = inVehicle
    end
end)

-- Bildirim fonksiyonu wrapper
function ShowNotification(message, type, duration)
    duration = duration or 3000
    type = type or 'info'
    
    QBCore.Functions.Notify(message, type, duration)
end
