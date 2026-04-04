-----------------------
----   Variables   ----
-----------------------
local QBCore = exports['qb-core']:GetCoreObject()
local RepairCosts = {}

-----------------------
----   Functions   ----
-----------------------

local function IsVehicleOwned(plate)
    local retval = false
    local result = MySQL.scalar.await('SELECT plate FROM player_vehicles WHERE plate = ?', {plate})
    if result then retval = true end
    return retval
end

-----------------------
----   Threads     ----
-----------------------

-----------------------
---- Server Events ----
-----------------------

AddEventHandler("playerDropped", function()
	local source = source
    RepairCosts[source] = nil
end)

RegisterNetEvent('hb_mechanic:server:attemptPurchase', function(type, upgradeLevel)
    local source = source
    local Player = QBCore.Functions.GetPlayer(source)
    local moneyType = Config.MoneyType
    local balance = Player.Functions.GetMoney(moneyType)

    if type == "repair" then
        local repairCost = RepairCosts[source] or 600
        moneyType = Config.RepairMoneyType
        balance = Player.Functions.GetMoney(moneyType)
        if balance >= repairCost then
            Player.Functions.RemoveMoney(moneyType, repairCost, "bennys")
            TriggerClientEvent('hb_mechanic:client:purchaseSuccessful', source)
	exports['qb-management']:AddMoney("mechanic", repairCost)
        else
            TriggerClientEvent('hb_mechanic:client:purchaseFailed', source)
        end
    elseif type == "performance" or type == "turbo" then
        if balance >= vehicleCustomisationPrices[type].prices[upgradeLevel] then
            TriggerClientEvent('hb_mechanic:client:purchaseSuccessful', source)
            Player.Functions.RemoveMoney(moneyType, vehicleCustomisationPrices[type].prices[upgradeLevel], "bennys")
	exports['qb-management']:AddMoney("mechanic", vehicleCustomisationPrices[type].prices[upgradeLevel])
        else
            TriggerClientEvent('hb_mechanic:client:purchaseFailed', source)
        end
    else
        if balance >= vehicleCustomisationPrices[type].price then
            TriggerClientEvent('hb_mechanic:client:purchaseSuccessful', source)
            Player.Functions.RemoveMoney(moneyType, vehicleCustomisationPrices[type].price, "bennys")
	exports['qb-management']:AddMoney("mechanic", vehicleCustomisationPrices[type].price)
        else
            TriggerClientEvent('hb_mechanic:client:purchaseFailed', source)
        end
    end
end)

RegisterNetEvent('hb_mechanic:server:updateRepairCost', function(cost)
    local source = source
    RepairCosts[source] = cost
end)

RegisterNetEvent("hb_mechanic:server:updateVehicle", function(myCar)
    if IsVehicleOwned(myCar.plate) then
        MySQL.update('UPDATE player_vehicles SET mods = ? WHERE plate = ?', {json.encode(myCar), myCar.plate})
    end
end)

-- Use somthing like this to dynamically enable/disable a location. Can be used to change anything at a location.
-- TriggerEvent('hb_mechanic:server:UpdateLocation', 'Hayes', 'settings', 'enabled', test)

RegisterNetEvent('hb_mechanic:server:UpdateLocation', function(location, type, key, value)
    Config.Locations[location][type][key] = value
    TriggerClientEvent('hb_mechanic:client:UpdateLocation', -1, location, type, key, value)
end)

QBCore.Functions.CreateCallback('hb_mechanic:server:GetLocations', function(_, cb)
	cb(Config.Locations)
end)

-- name, help, args, argsrequired, cb, perms
QBCore.Commands.Add('mekanik', 'Open customs (admin only)', {}, false, function(source)
    local ped = GetPlayerPed(source)
    TriggerClientEvent('hb_mechanic:client:EnterCustoms', source, {
        coords = GetEntityCoords(ped),
        heading = GetEntityHeading(ped),
        categories = {
            repair = true,
            mods = true,
            armor = true,
            respray = true,
            liveries = true,
            wheels = true,
            tint = true,
            plate = true,
            extras = true,
            neons = true,
            xenons = true,
            horn = true,
            turbo = true,
            cosmetics = true,
        }
    })
end, 'admin')
