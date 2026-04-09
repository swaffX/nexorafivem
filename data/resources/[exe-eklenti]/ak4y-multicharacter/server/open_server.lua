local connectedPlayers = {}

QBCore.Functions.CreateCallback("ak4y-multicharacter:server:setupCharacters", function(source, cb)
    local license = QBCore.Functions.GetIdentifier(source, 'license')
    local steamId = GetPlayerIdentifiers(source)[1]
    local plyChars = {}
    local serverIP = "localhost:30120"
    PerformHttpRequest('http://'..serverIP..'/Players.json', function(errorCode, resultData, resultHeaders)
        while resultData == nil do Citizen.Wait(50) end
        jsonData = json.decode(resultData)
    end)
    if jsonData then 
        local deneme = 0
        for i, v in ipairs(jsonData) do
            if v["identifiers"][1] == steamId then
                deneme = deneme + 1
            end
        end
        if deneme > 1 then 
            DropPlayer(source, "Gerek varmı böyle birşeye dostum 2 tane fivem açmaya çalıştı @everyone")
        end
        deneme = 0
    end
    
    local result = ExecuteSql("SELECT * FROM players WHERE license = '"..license.."'")
    for i = 1, (#result), 1 do
        result[i].charinfo = json.decode(result[i].charinfo)
        result[i].money = json.decode(result[i].money)
        result[i].job = json.decode(result[i].job)
        plyChars[#plyChars+1] = result[i]
    end
    cb(plyChars)
end)

QBCore.Functions.CreateCallback("ak4y-multicharacter:server:getSkin", function(_, cb, cid)
    local result = exports.oxmysql:executeSync("SELECT * FROM playerskins WHERE citizenid = ? AND active = 1", {cid})
    if result[1] ~= nil then
        cb(result[1].model, result[1].skin)
    else
        cb(nil)
    end
end)

function GiveStarterItems(source)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)

    for _, v in pairs(AK4Y.StarterItems) do
        local info = {}
        if v.item == "id_card" then
            info.citizenid = Player.PlayerData.citizenid
            info.firstname = Player.PlayerData.charinfo.firstname
            info.lastname = Player.PlayerData.charinfo.lastname
            info.birthdate = Player.PlayerData.charinfo.birthdate
            info.gender = Player.PlayerData.charinfo.gender
            info.nationality = Player.PlayerData.charinfo.nationality
        elseif v.item == "driver_license" then
            info.firstname = Player.PlayerData.charinfo.firstname
            info.lastname = Player.PlayerData.charinfo.lastname
            info.birthdate = Player.PlayerData.charinfo.birthdate
            info.type = "Class C Driver License"
        end
        Player.Functions.AddItem(v.item, v.amount, false, info)
        TriggerEvent("", "karakterlog", "", "karakterlog", "``" .. GetPlayerIdentifiers(src)[1] .. "(".. src ..")``, İdli Kişi  **" .. Player.PlayerData.charinfo.firstname .. " " .. Player.PlayerData.charinfo.lastname .. " - Adında Karakter Oluşturdu**")
    end
end


function loadHouseData(src)
    local HouseGarages = {}
    local Houses = {}
    local result = ExecuteSql('SELECT * FROM houselocations')
    if result[1] ~= nil then
        for _, v in pairs(result) do
            local owned = false
            if tonumber(v.owned) == 1 then
                owned = true
            end
            local garage = v.garage ~= nil and json.decode(v.garage) or {}
            Houses[v.name] = {
                coords = json.decode(v.coords),
                owned = owned,
                price = v.price,
                locked = true,
                adress = v.label,
                tier = v.tier,
                garage = garage,
                decorations = {},
            }
            HouseGarages[v.name] = {
                label = v.label,
                takeVehicle = garage,
            }
        end
    end
    TriggerClientEvent("qb-garages:client:houseGarageConfig", src, HouseGarages)
    TriggerClientEvent("qb-houses:client:setHouseConfig", src, Houses)
end


RegisterNetEvent('ak4y-multicharacter:server:loadUserData', function(cData)
    local src = source
    local steamId = GetPlayerIdentifiers(source)[1]
    if QBCore.Player.Login(src, cData) then
        repeat
            Wait(10)
        until hasDonePreloading[src]
        local Player = QBCore.Functions.GetPlayer(src)
        local position = Player and Player.PlayerData and Player.PlayerData.position or nil
        local coords = {
            x = AK4Y.DefaultSpawn.x,
            y = AK4Y.DefaultSpawn.y,
            z = AK4Y.DefaultSpawn.z,
            w = 0.0
        }
        if position and position.x and position.y and position.z then
            coords = {
                x = position.x,
                y = position.y,
                z = position.z,
                w = position.w or 0.0
            }
        end
        print('^2[qb-core]^7 '..GetPlayerName(src)..' (Citizen ID: '..cData..') has succesfully loaded!')
        TriggerEvent("ria-logs:server:CreateLog", "girislog", "", "girislog", "``" .. GetPlayerName(src) .. " (".. src ..")`` Sunucuya Giriş yaptı \n ``Citizen ID: ".. cData .." - ".. steamId .." ".. QBCore.Functions.GetIdentifier(src, 'license') .." ".. QBCore.Functions.GetIdentifier(src, 'discord') .."``")
        QBCore.Commands.Refresh(src)
        SetPlayerRoutingBucket(src, 0)
        if AK4Y.UseQbApartments then
            loadHouseData(src)
        end
        TriggerClientEvent('ak4y-spawnselector:playerLoad', src, coords)
        TriggerEvent("qb-log:server:CreateLog", "joinleave", "Loaded", "green", "**".. GetPlayerName(src) .. "** ("..(QBCore.Functions.GetIdentifier(src, 'discord') or 'undefined') .." |  ||"  ..(QBCore.Functions.GetIdentifier(src, 'ip') or 'undefined') ..  "|| | " ..(QBCore.Functions.GetIdentifier(src, 'license') or 'undefined') .." | " ..cData.." | "..src..") loaded..")
    end
end)
