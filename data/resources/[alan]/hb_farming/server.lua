local QBCore = exports['qb-core']:GetCoreObject()

QBCore.Functions.CreateCallback("qb-farmjob:checkOrak", function(source, cb, item)
    local Player = QBCore.Functions.GetPlayer(source)
    cb(Player.Functions.GetItemByName(item) ~= nil)
end)

RegisterNetEvent("qb-farmjob:harvestProduct", function(product)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    for _, zone in ipairs(Config.FarmZones) do
        if zone.product == product then
            Player.Functions.AddItem(zone.dirtyItem, 1)
            TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items[zone.dirtyItem], "add")
            break
        end
    end
end)

RegisterNetEvent("qb-farmjob:washProduct", function()
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    for _, zone in ipairs(Config.FarmZones) do
        if Player.Functions.RemoveItem(zone.dirtyItem, 1) then
            TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items[zone.dirtyItem], "remove")
            Player.Functions.AddItem(zone.cleanItem, 1)
            TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items[zone.cleanItem], "add")
            return
        end
    end
    TriggerClientEvent("QBCore:Notify", src, "Yıkamak için kirli ürün yok!", "error")
end)
