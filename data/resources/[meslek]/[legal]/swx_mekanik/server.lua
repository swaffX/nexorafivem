local QBCore = exports['qb-core']:GetCoreObject()

-- Mekanik fisi gonder
RegisterNetEvent('swx_mekanik:server:sendFis', function(data)
    local src = source
    local mechanic = QBCore.Functions.GetPlayer(src)
    if not mechanic then return end

    local targetId = data.targetId
    local target = QBCore.Functions.GetPlayer(targetId)
    if not target then
        TriggerClientEvent('swx_mekanik:client:notify', src, 'Oyuncu bulunamadi!', 'error')
        return
    end

    local mechanicName = mechanic.PlayerData.charinfo.firstname .. ' ' .. mechanic.PlayerData.charinfo.lastname

    -- Musteriye fisi gonder
    TriggerClientEvent('swx_mekanik:client:receiveFis', targetId, {
        mechanicId  = src,
        mechanicName = mechanicName,
        parts       = data.parts,
        total       = data.total,
        vehicleNet  = data.vehicleNet,
    })

    TriggerClientEvent('swx_mekanik:client:notify', src, 'Fis gonderildi! Musteri onayini bekle...', 'info')
end)

-- Musteri kabul etti
RegisterNetEvent('swx_mekanik:server:acceptFis', function(data)
    local src = source
    local player = QBCore.Functions.GetPlayer(src)
    if not player then return end

    local mechanicId = data.mechanicId
    local mechanic   = QBCore.Functions.GetPlayer(mechanicId)
    if not mechanic then
        TriggerClientEvent('swx_mekanik:client:notify', src, 'Mekanik bulunamadi!', 'error')
        return
    end

    -- Para cek
    if not player.Functions.RemoveMoney('cash', data.total, 'mekanik-fis-odemesi') then
        if not player.Functions.RemoveMoney('bank', data.total, 'mekanik-fis-odemesi') then
            TriggerClientEvent('swx_mekanik:client:notify', src, 'Yeterli paraniz yok! Toplam: $' .. data.total, 'error')
            return
        end
    end

    -- Mekanik odeme al
    mechanic.Functions.AddMoney('cash', data.total, 'mekanik-tamir-kazanci')

    local customerName = player.PlayerData.charinfo.firstname .. ' ' .. player.PlayerData.charinfo.lastname

    -- Mekanik'e onay bildir
    TriggerClientEvent('swx_mekanik:client:repairAccepted', mechanicId, {
        parts      = data.parts,
        vehicleNet = data.vehicleNet,
        customerName = customerName,
        total      = data.total,
    })

    TriggerClientEvent('swx_mekanik:client:notify', src, '$' .. data.total .. ' odendi. Mekanik tamire basliyor!', 'success')
end)

-- Musteri reddetti
RegisterNetEvent('swx_mekanik:server:rejectFis', function(data)
    local src = source
    local player = QBCore.Functions.GetPlayer(src)
    local playerName = player and (player.PlayerData.charinfo.firstname .. ' ' .. player.PlayerData.charinfo.lastname) or 'Musteri'

    TriggerClientEvent('swx_mekanik:client:repairRejected', data.mechanicId, playerName)
    TriggerClientEvent('swx_mekanik:client:notify', src, 'Fisi reddettiniz.', 'error')
end)

-- Tamir tamamlandi - arac sahibine uygula
RegisterNetEvent('swx_mekanik:server:applyRepairs', function(data)
    local src = source
    -- Arac network owner'ina gonder
    local vehicleOwner = NetworkGetEntityOwner(NetworkGetEntityFromNetworkId(data.vehicleNet))
    if vehicleOwner then
        TriggerClientEvent('swx_mekanik:client:applyRepairs', vehicleOwner, data)
    end
    TriggerClientEvent('swx_mekanik:client:notify', src, 'Tum tamir islemi tamamlandi!', 'success')
end)
