local QBCore = exports['qb-core']:GetCoreObject()


QBCore.Commands.Add("durum", "Açlık ve susuzluk seviyeni gösterir", {}, false, function(source, args)
    local Player = QBCore.Functions.GetPlayer(source)
    if Player then
        local hunger = Player.PlayerData.metadata["hunger"]
        local thirst = Player.PlayerData.metadata["thirst"]
        local message = "Açlık: " .. hunger .. " | Susuzluk: " .. thirst
        TriggerClientEvent("QBCore:Notify", source, message, "primary", 7000)
    end
end)

QBCore.Commands.Add("değerayarla", "Tüm değerleri belirlenen sayıya ayarla (0-10000 arası)", {{name = "deger", help = "Sayı (örn: 5000)"}}, false, function(source, args)
    local value = tonumber(args[1])
    if value and value >= 0 and value <= 10000 then
        -- Metadata güncelle
        local Player = QBCore.Functions.GetPlayer(source)
        if Player then
            Player.Functions.SetMetaData("hunger", value)
            Player.Functions.SetMetaData("thirst", value)
            Player.Functions.SetMetaData("heal", value) -- max 200 can, 10000/50=200
            Player.Functions.SetMetaData("armor", value) -- max 100 zırh, 10000/100=100
            
            TriggerClientEvent("QBCore:Notify", source, ("Tüm değerler %s olarak ayarlandı!"):format(value), "success", 5000)
            -- Client'a yeni değerleri yüklemesini söyle
            TriggerClientEvent("tgian-hud:load-data", source)
        end
    else
        TriggerClientEvent("QBCore:Notify", source, "Lütfen 0 ile 10000 arasında geçerli bir sayı girin.", "error", 5000)
    end
end)
