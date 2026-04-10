local QBCore = exports['qb-core']:GetCoreObject()

-- Config'den izin verilen araçları al (nil = tüm araçlar izinli)
local AllowedVehicles = Config.AllowedVehicles

-- Oyuncunun araçlarını getir
QBCore.Functions.CreateCallback('swx_remoteengine:GetPlayerVehicles', function(source, cb)
    local Player = QBCore.Functions.GetPlayer(source)
    
    if not Player then
        cb({})
        return
    end
    
    local citizenid = Player.PlayerData.citizenid
    
    -- Veritabanından oyuncunun araçlarını çek
    -- Eğer AllowedVehicles nil ise tüm araçlar, değilse sadece izinliler
    if AllowedVehicles == nil then
        -- Tüm araçları getir
        MySQL.query('SELECT vehicle, plate FROM player_vehicles WHERE citizenid = ?', {citizenid}, function(result)
            if result then
                cb(result)
            else
                cb({})
            end
        end)
    else
        -- Sadece izin verilen araçları getir
        MySQL.query('SELECT vehicle, plate FROM player_vehicles WHERE citizenid = ?', {citizenid}, function(result)
            if result then
                local filtered = {}
                for _, vehicle in ipairs(result) do
                    if AllowedVehicles[vehicle.vehicle] then
                        table.insert(filtered, vehicle)
                    end
                end
                cb(filtered)
            else
                cb({})
            end
        end)
    end
end)

-- Motor durumunu değiştir ve senkronize et
RegisterNetEvent('swx_remoteengine:ToggleEngine', function(plate, netId, engineState)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    
    if not Player then return end
    
    local citizenid = Player.PlayerData.citizenid
    
    MySQL.query('SELECT vehicle FROM player_vehicles WHERE citizenid = ? AND plate = ?', {citizenid, plate}, function(result)
        if result and result[1] then
            local vehicleModel = result[1].vehicle
            
            -- Araç modeli izin verilen listede mi kontrol et (sadece kısıtlama varsa)
            if AllowedVehicles ~= nil and not AllowedVehicles[vehicleModel] then
                TriggerClientEvent('QBCore:Notify', src, 'Bu araç uzaktan çalıştırma desteklemiyor!', 'error')
                return
            end
            
            -- Tüm oyunculara motor durumunu senkronize et
            TriggerClientEvent('swx_remoteengine:SyncEngine', -1, netId, engineState)
        else
            TriggerClientEvent('QBCore:Notify', src, 'Bu aracın sahibi değilsiniz!', 'error')
        end
    end)
end)
