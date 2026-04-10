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
    
    -- Server'a bildir ve motoru çalıştır/stop et
    TriggerServerEvent('swx_remoteengine:ToggleEngine', plate, VehToNet(vehicle), not GetIsVehicleEngineRunning(vehicle))
end

-- F3 Menü - Araç Listesi
local function OpenRemoteEngineMenu()
    -- Eğer menü takıldıysa zorla resetle (5 saniye timeout)
    if MenuOpen then
        QBCore.Functions.Notify('Menü hazırlanıyor, lütfen bekleyin...', 'info', 2000)
        return
    end
    
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
            -- Eğer AllowedVehicles nil ise tüm araçlar izinli, değilse kontrol et
            local isAllowed = (Config.AllowedVehicles == nil) or Config.AllowedVehicles[veh.vehicle]
            if isAllowed then
                local nearbyVeh = FindVehicleByPlate(veh.plate)
                if nearbyVeh then
                    local vehicleCoords = GetEntityCoords(nearbyVeh)
                    if #(playerCoords - vehicleCoords) <= Config.KeyRange then
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
            
            -- Sadece izin verilen araç modellerini göster (nil = tüm araçlar)
            local isAllowed = (Config.AllowedVehicles == nil) or Config.AllowedVehicles[model]
            if not isAllowed then
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
            options = options,
            onExit = function()
                MenuOpen = false
            end
        })
        lib.showContext('remote_engine_menu')
        
        -- 10 saniye sonra menü otomatik kapatılacak (eğer kullanıcı kapatmadıysa)
        Citizen.SetTimeout(10000, function()
            MenuOpen = false
        end)
    end)
end

-- Radial Menü entegrasyonu - Araç dışındayken "Aracı Çalıştır" seçeneği
RegisterNetEvent('swx_remoteengine:OpenRadialMenu', function()
    local ped = PlayerPedId()
    if IsPedInAnyVehicle(ped, false) then
        QBCore.Functions.Notify('Araçtayken bu menüyü kullanamazsınız!', 'error', 3000)
        return
    end
    
    OpenRemoteEngineMenu()
end)

-- Motor durumu senkronizasyonu
RegisterNetEvent('swx_remoteengine:SyncEngine', function(netId, engineState)
    local vehicle = NetToVeh(netId)
    
    if vehicle and vehicle ~= 0 then
        -- Kapı kilidini kontrol et ve aç
        if GetVehicleDoorLockStatus(vehicle) ~= 1 then
            SetVehicleDoorsLocked(vehicle, 1)
        end
        
        -- Motor sağlığını düzelt
        if GetVehicleEngineHealth(vehicle) <= 0 then
            SetVehicleEngineHealth(vehicle, 1000.0)
        end
        
        -- Motoru çalıştır/kapat
        Citizen.CreateThread(function()
            print('[SWX-RemoteEngine] Thread başladı, engineState:', engineState)
            
            if engineState then
                print('[SWX-RemoteEngine] Motor çalıştırılıyor...')
                
                -- Anahtarı set et (önce)
                TriggerEvent("vehiclekeys:client:SetOwner", GetVehicleNumberPlateText(vehicle))
                
                Wait(100)
                
                -- Aracı aktif hale getir ve sürülebilir yap
                SetEntityAsMissionEntity(vehicle, true, true)
                SetVehicleHasBeenOwnedByPlayer(vehicle, true)
                SetVehicleUndriveable(vehicle, false)
                
                print('[SWX-RemoteEngine] Direkt açıyorum...')
                
                -- 1. Deneme: Hemen aç
                SetVehicleEngineOn(vehicle, true, false, false)
                
                Wait(300)
                
                -- 2. Deneme: Tekrar dene
                SetVehicleEngineOn(vehicle, true, true, false)
                
                Wait(500)
                print('[SWX-RemoteEngine] 800ms sonra motor durumu:', GetIsVehicleEngineRunning(vehicle))
                
                -- Hala çalışmadıysa
                if not GetIsVehicleEngineRunning(vehicle) then
                    print('[SWX-RemoteEngine] Çalışmadı, native ile deniyorum...')
                    Citizen.InvokeNative(0x2497C4717C8B810E, vehicle, true, false, false)
                end
            else
                print('[SWX-RemoteEngine] Motor kapatılıyor...')
                SetVehicleEngineOn(vehicle, false, false, true)
                SetVehicleUndriveable(vehicle, true)
            end
        end)
        
        if engineState then
            QBCore.Functions.Notify(Config.Messages.engine_on, 'success', Config.NotifyDuration)
        else
            QBCore.Functions.Notify(Config.Messages.engine_off, 'info', Config.NotifyDuration)
        end
    end
end)

-- Araçtan inince motoru kapatma (opsiyonel)
-- Bu kısım isteğe bağlı, isterseniz araçtan inince motor kapanabilir
