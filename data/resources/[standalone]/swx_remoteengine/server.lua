local QBCore = exports['qb-core']:GetCoreObject()

print('[SWX-RemoteEngine] Server script yükleniyor...')

-- Oyuncunun araçlarını getir
QBCore.Functions.CreateCallback('swx_remoteengine:GetPlayerVehicles', function(source, cb)
    print('[SWX-RemoteEngine] Callback çağrıldı, source:', source)
    
    -- Tüm oyuncuları kontrol et ve source'a göre bul
    local allPlayers = QBCore.Functions.GetPlayers()
    print('[SWX-RemoteEngine] Tüm oyuncular:', json.encode(allPlayers))
    print('[SWX-RemoteEngine] Oyuncu sayısı:', #allPlayers)
    
    local Player = nil
    for _, playerId in ipairs(allPlayers) do
        print('[SWX-RemoteEngine] Kontrol edilen playerId:', playerId, 'type:', type(playerId))
        if tonumber(playerId) == tonumber(source) then
            Player = QBCore.Functions.GetPlayer(playerId)
            print('[SWX-RemoteEngine] Eşleşen playerId bulundu:', playerId, 'Player:', Player and 'VAR' or 'YOK')
            break
        end
    end
    
    if not Player then
        print('[SWX-RemoteEngine] Player bulunamadı! source:', source)
        -- Son çare: source'dan doğrudan dene
        Player = QBCore.Functions.GetPlayer(tonumber(source))
        print('[SWX-RemoteEngine] Son çare denemesi:', Player and 'BULUNDU' or 'YOK')
        if not Player then
            cb({})
            return
        end
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
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    
    if not Player then return end
    
    -- Anahtar kontrolü (server-side)
    local citizenid = Player.PlayerData.citizenid
    
    MySQL.query('SELECT vehicle FROM player_vehicles WHERE citizenid = ? AND plate = ?', {citizenid, plate}, function(result)
        if result and result[1] then
            local vehicleModel = result[1].vehicle
            
            -- Araç modeli izin verilen listede mi kontrol et
            if not AllowedVehicles[vehicleModel] then
                TriggerClientEvent('QBCore:Notify', src, 'Bu araç uzaktan çalıştırma desteklemiyor!', 'error')
                return
            end
            
            -- Tüm oyunculara motor durumunu senkronize et
            TriggerClientEvent('swx_remoteengine:SyncEngine', -1, netId, engineState)
            
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
