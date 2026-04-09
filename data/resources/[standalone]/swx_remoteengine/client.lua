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
    print('[SWX-RemoteEngine] ToggleVehicleEngine() başladı, plate:', plate)
    
    local vehicle = FindVehicleByPlate(plate)
    print('[SWX-RemoteEngine] Araç bulundu:', vehicle and 'EVET' or 'HAYIR')
    
    if not vehicle then
        print('[SWX-RemoteEngine] Araç bulunamadı!')
        QBCore.Functions.Notify(Config.Messages.no_vehicle, 'error', Config.NotifyDuration)
        return
    end
    
    -- Mesafe kontrolü
    local ped = PlayerPedId()
    local playerCoords = GetEntityCoords(ped)
    local vehicleCoords = GetEntityCoords(vehicle)
    local distance = #(playerCoords - vehicleCoords)
    print('[SWX-RemoteEngine] Mesafe:', distance)
    
    if distance > Config.KeyRange then
        print('[SWX-RemoteEngine] Çok uzak!')
        QBCore.Functions.Notify(Config.Messages.too_far .. ' (' .. math.floor(distance) .. 'm)', 'error', Config.NotifyDuration)
        return
    end
    
    -- Anahtar kontrolü
    local hasKeys = HasVehicleKeys(plate)
    print('[SWX-RemoteEngine] Anahtar var mı:', hasKeys and 'EVET' or 'HAYIR')
    if not hasKeys then
        print('[SWX-RemoteEngine] Anahtar yok!')
        QBCore.Functions.Notify(Config.Messages.no_keys, 'error', Config.NotifyDuration)
        return
    end
    
    print('[SWX-RemoteEngine] Tüm kontroller başarılı, motor değiştiriliyor...')
    -- Animasyon oynat
    PlayKeyAnimation()
    
    -- Motor durumunu değiştir
    local engineState = GetIsVehicleEngineRunning(vehicle)
    print('[SWX-RemoteEngine] Mevcut motor durumu:', engineState)
    
    -- Server'a bildir ve motoru çalıştır/stop et
    local netId = VehToNet(vehicle)
    print('[SWX-RemoteEngine] NetID:', netId, 'Yeni durum:', not engineState)
    TriggerServerEvent('swx_remoteengine:ToggleEngine', plate, netId, not engineState)
    print('[SWX-RemoteEngine] Server event tetiklendi!')
end

-- F3 Menü - Araç Listesi
local function OpenRemoteEngineMenu()
    print('[SWX-RemoteEngine] OpenRemoteEngineMenu() çağrıldı')
    
    -- ox_lib menüsü zaten açık mı kontrol et
    if MenuOpen then 
        print('[SWX-RemoteEngine] Menü zaten açık, beklemede...')
        return 
    end
    
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
            return
        end
        
        -- Menü gösterilecek, MenuOpen'ı true yap
        MenuOpen = true
        
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
            options = options,
            onExit = function()
                print('[SWX-RemoteEngine] Menü kapandı')
                MenuOpen = false
            end
        })
        print('[SWX-RemoteEngine] Menü kaydedildi, gösteriliyor...')
        lib.showContext('remote_engine_menu')
        print('[SWX-RemoteEngine] Menü gösterildi!')
    end)
end

-- Radial Menü entegrasyonu - Araç dışındayken "Aracı Çalıştır" seçeneği
RegisterNetEvent('swx_remoteengine:OpenRadialMenu', function()
    print('[SWX-RemoteEngine] Radial menüden çağrıldı')
    -- Sadece araç dışındayken çalışsın
    local ped = PlayerPedId()
    if IsPedInAnyVehicle(ped, false) then
        QBCore.Functions.Notify('Araçtayken bu menüyü kullanamazsınız!', 'error', 3000)
        return
    end
    
    OpenRemoteEngineMenu()
end)

print('[SWX-RemoteEngine] Radial menü entegrasyonu hazır')

-- Motor durumu senkronizasyonu
RegisterNetEvent('swx_remoteengine:SyncEngine', function(netId, engineState)
    print('[SWX-RemoteEngine] SyncEngine eventi çağrıldı, netId:', netId, 'state:', engineState)
    
    local vehicle = NetToVeh(netId)
    print('[SWX-RemoteEngine] NetToVeh sonucu:', vehicle and 'VAR (' .. vehicle .. ')' or 'YOK/0')
    
    if vehicle and vehicle ~= 0 then
        print('[SWX-RemoteEngine] Motor çalıştırma deneniyor...')
        
        -- Kapı kilidini kontrol et ve aç
        local lockStatus = GetVehicleDoorLockStatus(vehicle)
        print('[SWX-RemoteEngine] Kapı kilidi durumu:', lockStatus)
        if lockStatus ~= 1 then
            SetVehicleDoorsLocked(vehicle, 1) -- 1 = Unlocked
            print('[SWX-RemoteEngine] Kapılar açıldı')
        end
        
        -- Motor sağlığını kontrol et ve düzelt
        local engineHealth = GetVehicleEngineHealth(vehicle)
        print('[SWX-RemoteEngine] Motor sağlığı:', engineHealth)
        
        if engineHealth <= 0 then
            SetVehicleEngineHealth(vehicle, 1000.0)
            print('[SWX-RemoteEngine] Motor sağlığı düzeltildi')
        end
        
        -- Alternatif 1: SetVehicleEngineOn (standart)
        SetVehicleEngineOn(vehicle, engineState, false, true)
        print('[SWX-RemoteEngine] SetVehicleEngineOn çağrıldı')
        
        -- Motoru çalıştır/kapat (vehiclekeys ile birlikte)
        Citizen.CreateThread(function()
            Wait(100)
            local ped = PlayerPedId()
            
            if engineState then
                -- Önce anahtarı set et
                local plate = GetVehicleNumberPlateText(vehicle)
                TriggerEvent("vehiclekeys:client:SetOwner", plate)
                print('[SWX-RemoteEngine] Anahtar set edildi:', plate)
                
                Wait(100)
                
                -- Aracı aktif hale getir
                SetEntityAsMissionEntity(vehicle, true, true)
                SetVehicleHasBeenOwnedByPlayer(vehicle, true)
                
                -- Motoru çalıştır (native doğrudan çağrı)
                Citizen.InvokeNative(0x2497C4717C8B810E, vehicle, true, false, false)
                print('[SWX-RemoteEngine] Native 1 (false, false) çağrıldı')
                
                Wait(100)
                
                -- Tekrar dene (instantly = true)
                Citizen.InvokeNative(0x2497C4717C8B810E, vehicle, true, true, false)
                print('[SWX-RemoteEngine] Native 2 (true, false) çağrıldı')
                
                Wait(100)
                
                -- Son deneme (noInstant = true)
                SetVehicleEngineOn(vehicle, true, false, true)
                print('[SWX-RemoteEngine] SetVehicleEngineOn (false, true) çağrıldı')
                
                -- 500ms sonra tekrar kontrol et ve çalıştırmaya çalış
                Citizen.SetTimeout(500, function()
                    if not GetIsVehicleEngineRunning(vehicle) then
                        print('[SWX-RemoteEngine] 500ms sonra hala çalışmadı, tekrar deneniyor...')
                        SetVehicleEngineOn(vehicle, true, false, false)
                        SetVehicleEngineOn(vehicle, true, true, false)
                    end
                end)
            else
                -- Motoru kapat
                SetVehicleEngineOn(vehicle, false, false, true)
                SetVehicleUndriveable(vehicle, true)
            end
        end)
        
        print('[SWX-RemoteEngine] Motor durumu değiştirildi!')
        
        if engineState then
            QBCore.Functions.Notify(Config.Messages.engine_on, 'success', Config.NotifyDuration)
        else
            QBCore.Functions.Notify(Config.Messages.engine_off, 'info', Config.NotifyDuration)
        end
    else
        print('[SWX-RemoteEngine] Araç bulunamadı, netId:', netId)
    end
end)

-- Araçtan inince motoru kapatma (opsiyonel)
-- Bu kısım isteğe bağlı, isterseniz araçtan inince motor kapanabilir
