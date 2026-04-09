if AK4Y.Framework == "qb" then
    if not AK4Y.CustomFrameWork then 
        QBCore = exports['qb-core']:GetCoreObject()
    else
        QBCore = exports[AK4Y.CustomFrameWorkExport]:GetCoreObject()
    end
elseif AK4Y.Framework == "oldqb" then 
    QBCore = nil
    TriggerEvent('QBCore:GetObject', function(obj) QBCore = obj end)
end

hasDonePreloading = {}
connectedPlayers = {}

-- Functions

AddEventHandler('QBCore:Server:PlayerLoaded', function(Player)
    Wait(1000) -- 1 second should be enough to do the preloading in other resources
    hasDonePreloading[Player.PlayerData.source] = true
end)

AddEventHandler('QBCore:Server:OnPlayerUnload', function(src)
    hasDonePreloading[src] = false
end)

RegisterNetEvent('ak4y-multicharacter:server:disconnect', function()
    local src = source
    DropPlayer(src, "Disconnected")
end)

RegisterNetEvent('ak4y-multicharacter:server:createCharacter', function(data)
    local src = source
    local newData = {}
    newData.cid = data.cid
    newData.charinfo = data
    if QBCore.Player.Login(src, false, newData) then
        repeat
            Wait(10)
        until hasDonePreloading[src]
        if AK4Y.UseQbApartments then 
                local randbucket = (GetPlayerPed(src) .. math.random(1,999))
                SetPlayerRoutingBucket(src, randbucket)
                print('^2[qb-core]^7 '..GetPlayerName(src)..' has succesfully loaded!')
                QBCore.Commands.Refresh(src)
                loadHouseData(src)
                TriggerClientEvent("ak4y-multicharacter:client:closeNUI", src)
                TriggerClientEvent('apartments:client:setupSpawnUI', src, newData)
                GiveStarterItems(src)
        else
            local randbucket = (GetPlayerPed(src) .. math.random(1,999))
            SetPlayerRoutingBucket(src, randbucket)
            print('^2[qb-core]^7 '..GetPlayerName(src)..' has succesfully loaded!')
            QBCore.Commands.Refresh(src)
            TriggerClientEvent("ak4y-multicharacter:client:closeNUIdefault", src)
            GiveStarterItems(src)
        end
    end
end)

RegisterNetEvent('ak4y-multicharacter:server:deleteCharacter', function(citizenid)
    local src = source
    QBCore.Player.DeleteCharacter(src, citizenid)
    TriggerClientEvent('QBCore:Notify', src, "CHAR DELETED" , "success")
end)

-- Callbacks

QBCore.Functions.CreateCallback("ak4y-multicharacter:server:GetUserCharacters", function(source, cb)
    local src = source
    local license = QBCore.Functions.GetIdentifier(src, 'license')

    local result = ExecuteSql("SELECT * FROM players WHERE license = '"..license.."' ")
    cb(result)
end)

QBCore.Functions.CreateCallback("ak4y-multicharacter:server:GetServerLogs", function(_, cb)
    local result = ExecuteSql('SELECT * FROM server_logs')
    cb(result)
end)

QBCore.Functions.CreateCallback("ak4y-multicharacter:server:GetNumberOfCharacters", function(source, cb)
    local src = source
    local license = QBCore.Functions.GetIdentifier(src, 'license')
    local numOfChars = 0
    local addedCount = 0

    local callBackData = {}

    if next(AK4Y.PlayersNumberOfCharacters) then
        for _, v in pairs(AK4Y.PlayersNumberOfCharacters) do
            if v.license == license then
                numOfChars = v.numberOfChars
                break
            else
                numOfChars = AK4Y.DefaultNumberOfCharacters
            end
        end
    else
        numOfChars = AK4Y.DefaultNumberOfCharacters
    end
    
    -- Developer & Admin Identifier Check
    if QBCore.Functions.HasPermission(src, "god") or QBCore.Functions.HasPermission(src, "admin") then
        numOfChars = 4
    end
    local identifiers = GetPlayerIdentifiers(src)
    for _, id in pairs(identifiers) do
        if id == "fivem:17492281" or id == "fivem:18812042" then
            numOfChars = 4
            break
        end
    end
    local result = ExecuteSql("SELECT * FROM ak4y_multichar WHERE license = '"..license.."'")
    if result[1] then 
        addedCount = result[1].charCount
    end

    callBackData = {
        numOfChars = numOfChars,
        addedCount = addedCount,
    }
    cb(callBackData)
end)

QBCore.Functions.CreateCallback('ak4y-multicharacter:sendInput', function(source, cb, data)
    local _source = source
    local inputData = data.inputData
    local result = ExecuteSql("SELECT * FROM ak4y_multichar_codes WHERE code = '"..inputData.."'")
    if result[1] ~= nil then
        ExecuteSql("DELETE FROM ak4y_multichar_codes WHERE code = '"..inputData.."'")
        local license = QBCore.Functions.GetIdentifier(_source, 'license')
        local result2 = ExecuteSql("SELECT * FROM ak4y_multichar WHERE license = '"..license.."'")
        if result2[1] ~= nil then 
            ExecuteSql("UPDATE ak4y_multichar SET charCount = charCount + 1 WHERE license = '"..license.."'")
        else
            ExecuteSql("INSERT INTO ak4y_multichar (license, charCount) VALUES ('"..license.."', 1)")
        end
        cb(true)
    else
        cb(false)
    end
end)

RegisterCommand('purchase_multichar_slot', function(source, args)
	local src = source
    if src == 0 then
        local dec = json.decode(args[1])
        local tbxid = dec.transid
        local credit = dec.credit
        while inProgress do
            Wait(1000)
        end
        inProgress = true
        local result = ExecuteSql("SELECT * FROM ak4y_multichar_codes WHERE code = '"..tbxid.."'")
        if result[1] == nil then
            ExecuteSql("INSERT INTO ak4y_multichar_codes (code) VALUES ('"..tbxid.."')")
        end
        inProgress = false  
    end
end)

function ExecuteSql(query)
    local IsBusy = true
    local result = nil
    if AK4Y.Mysql == "oxmysql" then
        if MySQL == nil then
            exports.oxmysql:execute(query, function(data)
                result = data
                IsBusy = false
            end)
        else
            MySQL.query(query, {}, function(data)
                result = data
                IsBusy = false
            end)
        end
    elseif AK4Y.Mysql == "ghmattimysql" then
        exports.ghmattimysql:execute(query, {}, function(data)
            result = data
            IsBusy = false
        end)
    elseif AK4Y.Mysql == "mysql-async" then   
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