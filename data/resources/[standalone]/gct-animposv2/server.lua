local QBCore = exports['qb-core']:GetCoreObject()

QBCore.Commands.Add(Config.AnimPose["Command"], 'Animasyon Düzenleyici', {}, false, function(source, args)
    TriggerClientEvent("gct-animpos:AnimPosition", source)
end)

RegisterNetEvent("gct-animpos:server:syncPed", function(coords, heading, alpha)
    local src = source
    TriggerClientEvent("gct-animpos:client:syncPed", -1, src, coords, heading, alpha)
end)