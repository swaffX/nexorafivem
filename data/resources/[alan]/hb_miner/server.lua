
local QBCore = exports['qb-core']:GetCoreObject()


QBCore.Functions.CreateUseableItem("pickaxe", function(source)
    TriggerClientEvent('hb_miner:eleKazma', source)
end)


RegisterNetEvent('hb_miner:givekaya', function()
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    if Player then
        Player.Functions.AddItem("stone", 1)
    end
end)

RegisterServerEvent('hb_miner:giveToken')
AddEventHandler('hb_miner:giveToken', function(count)
    local xPlayer = QBCore.Functions.GetPlayer(source)
    if not count then count = 1 end
    xPlayer.Functions.AddItem("madentokeni", count)
end)

RegisterNetEvent('hb_miner:givePara', function(tokenCount)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    if not Player then return end

    local tokenPrice = math.random(20,40)
    local item = Player.Functions.GetItemByName("madentokeni")
    if item and item.amount >= tokenCount then
        Player.Functions.RemoveItem("madentokeni", tokenCount)
        Player.Functions.AddMoney("cash", tokenCount * tokenPrice)
		 TriggerClientEvent('QBCore:Notify', src, tokenCount .. " token karşılığında $" .. tokenCount * tokenPrice .. " tutarında ödeme aldın", "success")
    else
        TriggerClientEvent('QBCore:Notify', src, "Yeterli tokenin yok", "error")
    end
end)


RegisterNetEvent('hb_miner:kayalariver', function()
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    if not Player then return end

    local item = Player.Functions.GetItemByName("stone")
    if item and item.amount > 0 then
        local count = item.amount
        Player.Functions.RemoveItem("stone", count)
        TriggerClientEvent('hb_miner:tokensayac', src, count * math.random(1, 3))
        TriggerClientEvent('hb_miner:verchance', src, true)
    else
        TriggerClientEvent('QBCore:Notify', src, "Üstünde taş yok", "error")
    end
end)

RegisterNetEvent('hb_miner:arac', function()
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    if not Player then return end

    local fiyat = 200
    local cash = Player.Functions.GetMoney("cash")

    if cash >= fiyat then
        Player.Functions.RemoveMoney("cash", fiyat)
        TriggerClientEvent('hb_miner:AracOlustur', src)
    else
        TriggerClientEvent('QBCore:Notify', src, "Yeterli paran yok", "error")
    end
end)


RegisterNetEvent('hb_miner:paraver', function()
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    if Player then
        Player.Functions.AddMoney("cash", 200)
    end
end)


QBCore.Functions.CreateCallback('hb_miner:hasPickaxe', function(source, cb)
    local Player = QBCore.Functions.GetPlayer(source)
    if Player then
        local pickaxe = Player.Functions.GetItemByName("pickaxe")
        cb(pickaxe ~= nil)
    else
        cb(false)
    end
end)

QBCore.Functions.CreateCallback('hb_miner:hasStone', function(source, cb)
    local Player = QBCore.Functions.GetPlayer(source)
    if Player then
        local pickaxe = Player.Functions.GetItemByName("stone")
        cb(pickaxe ~= nil)
    else
        cb(false)
    end
end)
