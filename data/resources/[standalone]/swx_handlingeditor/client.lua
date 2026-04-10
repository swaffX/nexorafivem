local QBCore = exports['qb-core']:GetCoreObject()
local currentVehicle = nil
local currentModel = nil
local tempHandling = {}

-- Admin kontrolü
local function IsAdmin()
    -- AdminGroups nil ise herkese izin ver (geliştirme modu)
    if Config.AdminGroups == nil then
        return true
    end
    
    local Player = QBCore.Functions.GetPlayerData()
    if not Player or not Player.group then
        return false
    end
    
    return Config.AdminGroups[Player.group] or false
end

-- Araç handling değerlerini al
local function GetVehicleHandling(vehicle)
    if not DoesEntityExist(vehicle) then return nil end
    
    local handling = {}
    for key, _ in pairs(Config.DefaultHandling) do
        local success, value = pcall(function()
            return GetVehicleHandlingFloat(vehicle, 'CHandlingData', key)
        end)
        if success then
            handling[key] = value
        end
    end
    return handling
end

-- Handling uygula
local function ApplyHandling(vehicle, handling)
    if not DoesEntityExist(vehicle) or not handling then return end
    
    for key, value in pairs(handling) do
        pcall(function()
            SetVehicleHandlingFloat(vehicle, 'CHandlingData', key, tonumber(value))
        end)
    end
    
    -- Top speed yenile
    ModifyVehicleTopSpeed(vehicle, 1.0)
    SetVehicleEnginePowerMultiplier(vehicle, 1.0)
end

-- Input dialog
local function OpenInputDialog(title, defaultValue)
    local input = lib.inputDialog(title, {
        {type = 'number', label = 'Değer', default = defaultValue, min = 0, max = 10000, step = 0.01}
    })
    
    if input and input[1] then
        return tonumber(input[1])
    end
    return nil
end

-- Ana menü
local function OpenHandlingMenu()
    if not IsAdmin() then
        lib.notify({type = 'error', description = 'Bu komutu kullanma yetkiniz yok!'})
        return
    end
    
    local ped = PlayerPedId()
    currentVehicle = GetVehiclePedIsIn(ped, false)
    
    if not currentVehicle or not DoesEntityExist(currentVehicle) then
        lib.notify({type = 'error', description = 'Bir araçta olmalısınız!'})
        return
    end
    
    currentModel = GetDisplayNameFromVehicleModel(GetEntityModel(currentVehicle)):lower()
    tempHandling = GetVehicleHandling(currentVehicle) or {}
    
    local options = {}
    
    -- Tüm handling değerleri için menü
    for key, defaultValue in pairs(Config.DefaultHandling) do
        local currentValue = tempHandling[key] or defaultValue
        table.insert(options, {
            title = key,
            description = string.format('Mevcut: %.3f', currentValue),
            onSelect = function()
                local newValue = OpenInputDialog(key .. ' Düzenle', currentValue)
                if newValue then
                    tempHandling[key] = newValue
                    ApplyHandling(currentVehicle, tempHandling)
                    OpenHandlingMenu() -- Menüyü yenile
                end
            end
        })
    end
    
    -- Kaydet butonu
    table.insert(options, {
        title = '💾 Kaydet',
        description = currentModel .. ' handlinglerini kalıcı kaydet',
        onSelect = function()
            TriggerServerEvent('swx_handlingeditor:save', currentModel, tempHandling)
        end
    })
    
    -- Varsayılana sıfırla
    table.insert(options, {
        title = '🔄 Varsayılana Sıfırla',
        description = 'Orijinal handling değerlerine dön',
        onSelect = function()
            TriggerServerEvent('swx_handlingeditor:delete', currentModel)
            tempHandling = Config.DefaultHandling
            ApplyHandling(currentVehicle, tempHandling)
            lib.notify({type = 'info', description = 'Varsayılan değerlere sıfırlandı!'})
        end
    })
    
    lib.registerContext({
        id = 'handling_editor',
        title = Config.MenuTitle .. ' - ' .. currentModel:upper(),
        options = options
    })
    
    lib.showContext('handling_editor')
end

-- Kayıtlı handlingleri listele
local function OpenHandlingList()
    if not IsAdmin() then return end
    
    local handlingList = lib.callback.await('swx_handlingeditor:getAllHandling', false)
    
    if not handlingList or next(handlingList) == nil then
        lib.notify({type = 'error', description = 'Kayıtlı handling bulunamadı!'})
        return
    end
    
    local options = {}
    for model, data in pairs(handlingList) do
        local topSpeed = data.fInitialDriveMaxFlatVel or 0
        table.insert(options, {
            title = model:upper(),
            description = string.format('Top Speed: %.1f km/h | Güç: %.2f', topSpeed, data.fInitialDriveForce or 0),
            onSelect = function()
                -- Silme onayı
                local alert = lib.alertDialog({
                    header = model:upper() .. ' Sil?',
                    content = 'Bu handling kaydını silmek istediğinize emin misiniz?',
                    centered = true,
                    cancel = true
                })
                
                if alert == 'confirm' then
                    TriggerServerEvent('swx_handlingeditor:delete', model)
                end
            end
        })
    end
    
    lib.registerContext({
        id = 'handling_list',
        title = '📋 Kayıtlı Handlingler',
        options = options
    })
    
    lib.showContext('handling_list')
end

-- Komutlar
RegisterCommand(Config.Commands.editor, function()
    OpenHandlingMenu()
end, false)

RegisterCommand(Config.Commands.list, function()
    OpenHandlingList()
end, false)

-- Server'dan gelen handling uygulama
RegisterNetEvent('swx_handlingeditor:apply', function(netId, handling)
    local vehicle = NetworkGetEntityFromNetworkId(netId)
    if vehicle and DoesEntityExist(vehicle) then
        Citizen.SetTimeout(500, function()
            ApplyHandling(vehicle, handling)
        end)
    end
end)

-- Handling güncellendi bildirimi
RegisterNetEvent('swx_handlingeditor:updated', function(model, data)
    lib.notify({type = 'info', description = model .. ' handling güncellendi!'})
end)

-- Araç değiştirme kontrolü
Citizen.CreateThread(function()
    local lastVehicle = nil
    
    while true do
        Citizen.Wait(1000)
        
        local ped = PlayerPedId()
        local vehicle = GetVehiclePedIsIn(ped, false)
        
        if vehicle ~= lastVehicle and vehicle ~= 0 then
            lastVehicle = vehicle
            
            -- Kayıtlı handling var mı kontrol et
            local model = GetDisplayNameFromVehicleModel(GetEntityModel(vehicle)):lower()
            local savedHandling = lib.callback.await('swx_handlingeditor:getHandling', false, model)
            
            if savedHandling then
                ApplyHandling(vehicle, savedHandling)
                print('[SWX-HandlingEditor] Uygulandı:', model)
            end
        elseif vehicle == 0 then
            lastVehicle = nil
        end
    end
end)

print('[SWX-HandlingEditor] Client yüklendi!')
print('[SWX-HandlingEditor] Komut: /' .. Config.Commands.editor)
