if Config.Core == "ESX" then
    if Config.CoreDefine ~= nil and Config.CoreDefine ~= "" then
        ESX = nil
        TriggerEvent(Config.CoreDefine, function(obj) 
            ESX = obj 
        end)
    else
        ESX = Config.CoreExport()
    end

    ESX.RegisterServerCallback('vms_vehicleshop:buyTestDrive', function(source, cb, testDrivePrice)
        local xPlayer = ESX.GetPlayerFromId(source)
        if testDrivePrice then
            local myMoney = xPlayer.getMoney()
            if myMoney >= testDrivePrice then
                xPlayer.removeMoney(testDrivePrice)
                TriggerClientEvent('vms_vehicleshop:notification', source, Config.Translate['notify.you_bought_test']:format(testDrivePrice), 5000, 'success')
                cb(true)
            else
                TriggerClientEvent('vms_vehicleshop:notification', source, Config.Translate['notify.enought_money_for_test'], 4000, 'error')
                cb(false)
            end
        end
    end)
    
    ESX.RegisterServerCallback('vms_vehicleshop:isPlateTaken', function(source, cb, plate)
        MySQL.Async.fetchAll('SELECT plate FROM owned_vehicles WHERE @plate = plate', {
            ['@plate'] = plate
        }, function (result)
            cb(result[1] ~= nil)
        end)
    end)
elseif Config.Core == "QB-Core" then
    QBCore = Config.CoreExport()

    QBCore.Functions.CreateCallback("vms_vehicleshop:buyTestDrive", function(source, cb, testDrivePrice)
		local Player = QBCore.Functions.GetPlayer(source)
        if testDrivePrice then
            local myMoney = Player.Functions.GetMoney('bank')
            if myMoney >= testDrivePrice then
                Player.Functions.RemoveMoney('bank', testDrivePrice)
                TriggerClientEvent('vms_vehicleshop:notification', source, Config.Translate['notify.you_bought_test']:format(testDrivePrice), 5000, 'success')
                cb(true)
            else
                TriggerClientEvent('vms_vehicleshop:notification', source, Config.Translate['notify.enought_money_for_test'], 4000, 'error')
                cb(false)
            end
        end
	end)
    
    QBCore.Functions.CreateCallback("vms_vehicleshop:isPlateTaken", function(source, cb, plate)
        MySQL.Async.fetchAll('SELECT plate FROM player_vehicles WHERE @plate = plate', {
            ['@plate'] = plate
        }, function(result)
            cb(result[1] ~= nil)
        end)
	end)
end

RegisterNetEvent("vms_vehicleshop:setRoutingBucket")
AddEventHandler("vms_vehicleshop:setRoutingBucket", function(isBack)
    local src = source
    if isBack then
        SetPlayerRoutingBucket(src, 0)
        TriggerClientEvent('vms_vehicleshop:settedRoutingBucket', src, false)
    else
        SetPlayerRoutingBucket(src, src)
        TriggerClientEvent('vms_vehicleshop:settedRoutingBucket', src, true)
    end
end)