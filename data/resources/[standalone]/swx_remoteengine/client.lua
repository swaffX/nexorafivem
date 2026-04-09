local QBCore = exports['qb-core']:GetCoreObject()
local PlayerData = {}
local MenuOpen = false

-- Oyuncu verilerini al
RegisterNetEvent('QBCore:Client:OnPlayerLoaded', function()
    PlayerData = QBCore.Functions.GetPlayerData()
end)

RegisterNetEvent('QBCore:Client:OnJobUpdate', function(job)
    PlayerData.job = job
end)

-- En yakın aracı bul (plate'e göre)
local function FindVehicleByPlate(plate)
    local vehicles = GetGamePool('CVehicle')
    for _, vehicle in ipairs(vehicles) do
        local vehPlate = GetVehicleNumberPlateText(vehicle)
        if vehPlate and string.gsub(vehPlate, "^%s*(.-)%s*$", "%1") == string.gsub(plate, "^%s*(.-)%s*$", "%1") then
            return vehicle
        end
    end
    return nil
end

-- Oyuncunun araç anahtarları var mı kontrol et
local function HasVehicleKeys(plate)
    local hasKeys = exports['qb-vehiclekeys']:HasKeys(plate)
    return hasKeys
end

-- Animasyon oynat
local function PlayKeyAnimation()
    local ped = PlayerPedId()
    -- Anahtar animasyonu (telefon kullanma animasyonu gibi)
    TaskStartScenarioInPlace(ped, 'WORLD_HUMAN_MOBILE_FILM_SHOCKING', 0, true)
    Wait(Config.AnimationDuration)
    ClearPedTasks(ped)
end

-- Araç motorunu kontrol et
local function ToggleVehicleEngine(plate)
    local vehicle = FindVehicleByPlate(plate)
    
    if not vehicle then
        QBCore.Functions.Notify(Config.Messages.no_vehicle, 'error', Config.NotifyDuration)
        return
    end
    
    -- Mesafe kontrolü
    local ped = PlayerPedId()
    local playerCoords = GetEntityCoords(ped)
    local vehicleCoords = GetEntityCoords(vehicle)
    local distance = #(playerCoords - vehicleCoords)
    
    if distance > Config.KeyRange then
        QBCore.Functions.Notify(Config.Messages.too_far .. ' (' .. math.floor(distance) .. 'm)', 'error', Config.NotifyDuration)
        return
    end
    
    -- Anahtar kontrolü
    if not HasVehicleKeys(plate) then
        QBCore.Functions.Notify(Config.Messages.no_keys, 'error', Config.NotifyDuration)
        return
    end
    
    -- Animasyon oynat
    PlayKeyAnimation()
    
    -- Motor durumunu değiştir
    local engineState = GetIsVehicleEngineRunning(vehicle)
    
    -- Server'a bildir ve motoru çalıştır/stop et
    TriggerServerEvent('swx_remoteengine:ToggleEngine', plate, VehToNet(vehicle), not engineState)
end

-- F3 Menü - Araç Listesi
local function OpenRemoteEngineMenu()
    if MenuOpen then return end
    
    MenuOpen = true
    
    QBCore.Functions.TriggerCallback('swx_remoteengine:GetPlayerVehicles', function(vehicles)
        if not vehicles or #vehicles == 0 then
            QBCore.Functions.Notify('Kayıtlı aracınız bulunamadı!', 'error', Config.NotifyDuration)
            MenuOpen = false
            return
        end
        
        -- Önce hiçbir araç menzilde mi kontrol et
        local ped = PlayerPedId()
        local playerCoords = GetEntityCoords(ped)
        local hasNearbyVehicle = false
        
        for _, veh in ipairs(vehicles) do
            -- Sadece izin verilen araç modellerini kontrol et
            if Config.AllowedVehicles[veh.vehicle] then
                local nearbyVeh = FindVehicleByPlate(veh.plate)
                if nearbyVeh then
                    local vehicleCoords = GetEntityCoords(nearbyVeh)
                    local distance = #(playerCoords - vehicleCoords)
                    if distance <= Config.KeyRange then
                        hasNearbyVehicle = true
                        break
                    end
                end
            end
        end
        
        -- Menzilde araç yoksa menüyü açma
        if not hasNearbyVehicle then
            QBCore.Functions.Notify(Config.Messages.no_allowed_vehicle, 'error', Config.NotifyDuration)
            MenuOpen = false
            return
        end
        
        local options = {}
        
        for _, veh in ipairs(vehicles) do
            local plate = veh.plate
            local model = veh.vehicle
            
            -- Sadece izin verilen araç modellerini göster
            if not Config.AllowedVehicles[model] then
                goto continue  -- İzin verilmeyen araçları atla
            end
            
            -- Araç adını al
            local vehData = QBCore.Shared.Vehicles[model]
            local displayName = vehData and (vehData.brand .. ' ' .. vehData.name) or model:upper()
            
            -- Yakındaki aracı kontrol et
            local nearbyVeh = FindVehicleByPlate(plate)
            local distanceText = ''
            local icon = 'car'
            local disabled = false
            
            if nearbyVeh then
                local ped = PlayerPedId()
                local playerCoords = GetEntityCoords(ped)
                local vehicleCoords = GetEntityCoords(nearbyVeh)
                local distance = #(playerCoords - vehicleCoords)
                
                if distance <= Config.KeyRange then
                    distanceText = ' (' .. math.floor(distance) .. 'm)'
                    icon = 'car-on'
                else
                    distanceText = ' (' .. math.floor(distance) .. 'm - Uzak)'
                    disabled = true
                end
            else
                distanceText = ' (Garajda/Çekilmişlerde)'
                disabled = true
                icon = 'warehouse'
            end
            
            table.insert(options, {
                title = displayName .. ' [' .. plate .. ']' .. distanceText,
                icon = icon,
                disabled = disabled,
                onSelect = function()
                    ToggleVehicleEngine(plate)
                end
            })
            
            ::continue::
        end
        
        -- Menü göster
        lib.registerContext({
            id = 'remote_engine_menu',
            title = Config.Messages.menu_title,
            options = options
        })
        lib.showContext('remote_engine_menu')
        
        MenuOpen = false
    end)
end

-- Komut kaydet
RegisterCommand('remoteengine', function()
    -- Sadece araç dışındayken çalışsın
    local ped = PlayerPedId()
    if IsPedInAnyVehicle(ped, false) then
        return -- Araçtayken menü açılmasın
    end
    
    OpenRemoteEngineMenu()
end, false)

-- Tuş atama (M tuşu)
RegisterKeyMapping('remoteengine', 'Uzaktan Araç Kontrolü (Anahtar)', 'keyboard', 'M')

-- Motor durumu senkronizasyonu
RegisterNetEvent('swx_remoteengine:SyncEngine', function(netId, engineState)
    local vehicle = NetToVeh(netId)
    if vehicle and vehicle ~= 0 then
        SetVehicleEngineOn(vehicle, engineState, false, true)
        
        if engineState then
            QBCore.Functions.Notify(Config.Messages.engine_on, 'success', Config.NotifyDuration)
        else
            QBCore.Functions.Notify(Config.Messages.engine_off, 'info', Config.NotifyDuration)
        end
    end
end)

-- Araçtan inince motoru kapatma (opsiyonel)
-- Bu kısım isteğe bağlı, isterseniz araçtan inince motor kapanabilir
