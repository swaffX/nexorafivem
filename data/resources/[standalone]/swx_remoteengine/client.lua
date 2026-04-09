local QBCore = exports['qb-core']:GetCoreObject()
local PlayerData = {}
local MenuOpen = false

print('[SWX-RemoteEngine] Client script yükleniyor...')

-- Oyuncu verilerini al
RegisterNetEvent('QBCore:Client:OnPlayerLoaded', function()
    PlayerData = QBCore.Functions.GetPlayerData()
    print('[SWX-RemoteEngine] Oyuncu verileri yüklendi')
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
    print('[SWX-RemoteEngine] OpenRemoteEngineMenu() çağrıldı')
    
    if MenuOpen then 
        print('[SWX-RemoteEngine] MenuOpen true, menü zaten açık')
        return 
    end
    
    MenuOpen = true
    print('[SWX-RemoteEngine] Callback çağrılıyor...')
    
    QBCore.Functions.TriggerCallback('swx_remoteengine:GetPlayerVehicles', function(vehicles)
        print('[SWX-RemoteEngine] Callback yanıt verdi. Araç sayısı:', vehicles and #vehicles or 0)
        
        if not vehicles or #vehicles == 0 then
            print('[SWX-RemoteEngine] Araç bulunamadı!')
            QBCore.Functions.Notify('Kayıtlı aracınız bulunamadı!', 'error', Config.NotifyDuration)
            MenuOpen = false
            return
        end
        
        -- Önce hiçbir araç menzilde mi kontrol et
        local ped = PlayerPedId()
        local playerCoords = GetEntityCoords(ped)
        local hasNearbyVehicle = false
        
        print('[SWX-RemoteEngine] Menzilde araç aranıyor...')
        for _, veh in ipairs(vehicles) do
            print('[SWX-RemoteEngine] Kontrol edilen:', veh.vehicle, 'Plaka:', veh.plate)
            -- Sadece izin verilen araç modellerini kontrol et
            if Config.AllowedVehicles[veh.vehicle] then
                print('[SWX-RemoteEngine] İzin verilen araç bulundu:', veh.vehicle)
                local nearbyVeh = FindVehicleByPlate(veh.plate)
                if nearbyVeh then
                    local vehicleCoords = GetEntityCoords(nearbyVeh)
                    local distance = #(playerCoords - vehicleCoords)
                    print('[SWX-RemoteEngine] Araç bulundu, mesafe:', distance)
                    if distance <= Config.KeyRange then
                        hasNearbyVehicle = true
                        print('[SWX-RemoteEngine] Menzilde araç bulundu!')
                        break
                    end
                else
                    print('[SWX-RemoteEngine] Araç yakında değil (spawn olmamış olabilir)')
                end
            else
                print('[SWX-RemoteEngine] Araç izin listesinde değil:', veh.vehicle)
            end
        end
        
        -- Menzilde araç yoksa menüyü açma
        if not hasNearbyVehicle then
            print('[SWX-RemoteEngine] Menzilde uygun araç yok!')
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
        print('[SWX-RemoteEngine] Menü oluşturuluyor, seçenek sayısı:', #options)
        lib.registerContext({
            id = 'remote_engine_menu',
            title = Config.Messages.menu_title,
            options = options
        })
        print('[SWX-RemoteEngine] Menü kaydedildi, gösteriliyor...')
        lib.showContext('remote_engine_menu')
        print('[SWX-RemoteEngine] Menü gösterildi!')
        
        MenuOpen = false
    end)
end

-- Komut kaydet (benzersiz isim - eski tuş çakışmasını önlemek için)
RegisterCommand('swxremoteengine', function()
    print('[SWX-RemoteEngine] Komut çalıştırıldı!')
    -- Sadece araç dışındayken çalışsın
    local ped = PlayerPedId()
    if IsPedInAnyVehicle(ped, false) then
        print('[SWX-RemoteEngine] Araçtayken menü açılmaz')
        return -- Araçtayken menü açılmasın
    end
    
    print('[SWX-RemoteEngine] Menü açılıyor...')
    OpenRemoteEngineMenu()
end, false)

-- Tuş atama (K tuşu - M tuşu swx_speaker tarafından kullanılıyor)
RegisterKeyMapping('swxremoteengine', 'Uzaktan Araç Kontrolü (Anahtar)', 'keyboard', 'K')
print('[SWX-RemoteEngine] K tuşu ataması yapıldı')

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
