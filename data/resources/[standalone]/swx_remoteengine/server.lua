local QBCore = exports['qb-core']:GetCoreObject()

print('[SWX-RemoteEngine] Server script yükleniyor...')

-- Oyuncunun araçlarını getir
QBCore.Functions.CreateCallback('swx_remoteengine:GetPlayerVehicles', function(source, cb)
    print('[SWX-RemoteEngine] Callback çağrıldı, source:', source)
    
    -- Global QBCore'u dene (export yerine)
    local GlobalQBCore = _G.QBCore
    print('[SWX-RemoteEngine] Global QBCore:', GlobalQBCore and 'VAR' or 'YOK')
    
    local Player = nil
    if GlobalQBCore and GlobalQBCore.Functions then
        Player = GlobalQBCore.Functions.GetPlayer(tonumber(source))
        print('[SWX-RemoteEngine] Global QBCore denemesi:', Player and 'BULUNDU' or 'YOK')
    end
    
    -- Global çalışmazsa export QBCore'u dene
    if not Player then
        Player = QBCore.Functions.GetPlayer(tonumber(source))
        print('[SWX-RemoteEngine] Export QBCore denemesi:', Player and 'BULUNDU' or 'YOK')
    end
    
    if not Player then
        print('[SWX-RemoteEngine] Player bulunamadı! source:', source)
        cb({})
        return
    end
    
    local citizenid = Player.PlayerData.citizenid
    print('[SWX-RemoteEngine] Player bulundu, citizenid:', citizenid)
    
    -- Veritabanından oyuncunun araçlarını çek
    print('[SWX-RemoteEngine] DB sorgusu başlatılıyor, citizenid:', citizenid)
    MySQL.query('SELECT vehicle, plate FROM player_vehicles WHERE citizenid = ?', {citizenid}, function(result)
        print('[SWX-RemoteEngine] DB sorgusu tamamlandı, citizenid:', citizenid)
        print('[SWX-RemoteEngine] Sonuç:', json.encode(result))
        print('[SWX-RemoteEngine] Sonuç sayısı:', result and #result or 0)
        if result then
            cb(result)
        else
            cb({})
        end
    end)
end)

-- İzin verilen araç modelleri (client ile senkronize olmalı)
local AllowedVehicles = {
    ['redeye'] = true,  -- Dodge Challenger
}

-- Motor durumunu değiştir ve senkronize et
RegisterNetEvent('swx_remoteengine:ToggleEngine', function(plate, netId, engineState)
    print('[SWX-RemoteEngine] Server ToggleEngine eventi çağrıldı, plate:', plate, 'netId:', netId, 'state:', engineState)
    
    local src = source
    print('[SWX-RemoteEngine] Source:', src)
    
    local Player = QBCore.Functions.GetPlayer(src)
    print('[SWX-RemoteEngine] Player:', Player and 'BULUNDU' or 'YOK')
    
    if not Player then
        print('[SWX-RemoteEngine] Player yok, işlem iptal')
        return
    end
    
    -- Anahtar kontrolü (server-side)
    local citizenid = Player.PlayerData.citizenid
    print('[SWX-RemoteEngine] CitizenID:', citizenid)
    
    MySQL.query('SELECT vehicle FROM player_vehicles WHERE citizenid = ? AND plate = ?', {citizenid, plate}, function(result)
        print('[SWX-RemoteEngine] DB sonucu:', json.encode(result))
        if result and result[1] then
            local vehicleModel = result[1].vehicle
            print('[SWX-RemoteEngine] Araç modeli:', vehicleModel)
            
            -- Araç modeli izin verilen listede mi kontrol et
            if not AllowedVehicles[vehicleModel] then
                print('[SWX-RemoteEngine] Model izin listesinde değil!')
                TriggerClientEvent('QBCore:Notify', src, 'Bu araç uzaktan çalıştırma desteklemiyor!', 'error')
                return
            end
            
            print('[SWX-RemoteEngine] Tüm kontroller başarılı, SyncEngine tetikleniyor...')
            -- Tüm oyunculara motor durumunu senkronize et
            TriggerClientEvent('swx_remoteengine:SyncEngine', -1, netId, engineState)
            print('[SWX-RemoteEngine] SyncEngine tetiklendi!')
            
            -- Log (opsiyonel)
            -- print('[' .. plate .. '] Motor ' .. (engineState and 'çalıştırıldı' or 'stop edildi') .. ' - Oyuncu: ' .. Player.PlayerData.name)
        else
            TriggerClientEvent('QBCore:Notify', src, 'Bu aracın sahibi değilsiniz!', 'error')
        end
    end)
end)

-- Item kullanımı (opsiyonel - eğer özel item istenirse)
-- QBCore.Functions.CreateUseableItem('car_remote', function(source, item)
--     TriggerClientEvent('swx_remoteengine:UseRemote', source)
-- end)

print('[SWX-RemoteEngine] Uzaktan araç çalıştırma sistemi aktif!')
