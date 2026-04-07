local QBCore = exports['qb-core']:GetCoreObject()

AddEventHandler("BakiTelli_mechanic:buyitem")
RegisterNetEvent("BakiTelli_mechanic:buyitem", function (price)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    
    -- Mekanik görevine sahip oyuncular için fiyat kontrolü
    if Player.PlayerData.job.name == "mechanic" then
        price = 0 -- Mekanikler için ücretsiz
    end
    
    if getMoney(src) >= price then 
        if price > 0 then
            removeMoney(src, price)
        end
        TriggerClientEvent("BakiTelli_mechanic:cl:buyitem", src)
    else 
        nofity(src, Config.Langs["NoPrice"])
    end
end)