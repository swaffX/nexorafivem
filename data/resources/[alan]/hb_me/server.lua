local QBCore = exports['qb-core']:GetCoreObject()

RegisterCommand("me", function(source, args)
    local text = table.concat(args, " ")
    local Player = QBCore.Functions.GetPlayer(source)
    local firstname = Player.PlayerData.charinfo.firstname
    local lastname = Player.PlayerData.charinfo.lastname
    local fullName = firstname .. " " .. lastname

    TriggerClientEvent("hb_me:me", -1, text, source, fullName)
end)

RegisterCommand("do", function(source, args)
    local text = table.concat(args, " ")
    local Player = QBCore.Functions.GetPlayer(source)
    local firstname = Player.PlayerData.charinfo.firstname
    local lastname = Player.PlayerData.charinfo.lastname
    local fullName = firstname .. " " .. lastname

    TriggerClientEvent("hb_me:do", -1, text, source, fullName)
end)


RegisterCommand("static", function(source, args)
    local text = table.concat(args, " ")
    local Player = QBCore.Functions.GetPlayer(source)
    local firstname = Player.PlayerData.charinfo.firstname
    local lastname = Player.PlayerData.charinfo.lastname
    local fullName = firstname .. " " .. lastname

    TriggerClientEvent("hb_me:static", -1, text, source, fullName)
end)

RegisterNetEvent("hb_me:getTime", function()
    local src = source
    local currentTime = os.date("%H:%M")
    TriggerClientEvent("hb_me:returnTime", src, currentTime)
end)