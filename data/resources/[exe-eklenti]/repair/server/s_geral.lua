if Config.Framework == "NEW" then
    QBCore = exports['qb-core']:GetCoreObject()
elseif Config.Framework == "OLD" then 
    QBCore = nil
    TriggerEvent('QBCore:GetObject', function(obj) QBCore = obj end) 
else
    print("The Framework '", Config.Framework, "' is not support, please change in config.lua")
end

QBCore.Functions.CreateCallback('m-Repairs:server:VerificarGuita', function(source, cb)
    if QBCore.Functions.GetPlayer(source).Functions.RemoveMoney("cash", Config.Amount) then
        cb({
            state   = true,
        })
    else
        TriggerClientEvent('QBCore:Notify', source,Config["Language"]['Notificacoes']['SemGuita'], 'error', 3500)
    end
end)