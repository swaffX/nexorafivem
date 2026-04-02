QBCore = exports['qb-core']:GetCoreObject()

Citizen.CreateThread(function()
    while true do
        exports.ghmattimysql:execute("DELETE FROM `stashitemsnew` WHERE stash like '%trash_%'")
        Citizen.Wait(1800000)
    end
end)

RegisterServerEvent('menu:RedParaVer')
AddEventHandler('menu:RedParaVer', function(para, key)
    if QBCore.Functions.kickHacKer(source, key) then -- QBCore.Key
        local xPlayer = QBCore.Functions.GetPlayer(source)
        if not xPlayer then return; end
        local nick = xPlayer.PlayerData.name
        xPlayer.Functions.AddMoney('bank', para)
        TriggerEvent('DiscordBot:ToDiscord', 'diger', 'Polis Araç Çekti '.. os.date("%H:%M:%S"), source)
    end
end)

local rastgeleCopItem = {
    "pbot",
    "plastik",
    "pkonserve",
    "podun",
    "hurdametal",
    -- "cam",
    "lockpick",
    -- "bakır",
    -- "demir",
}

RegisterServerEvent('gr-menu:cop-esyasi-ver')
AddEventHandler('gr-menu:cop-esyasi-ver', function(key)
    local src = source
    if QBCore.Functions.kickHacKer(src, key) then -- QBCore.Key
        local xPlayer = QBCore.Functions.GetPlayer(src)
        if xPlayer then 
            local rastgleItem = math.random(1,#rastgeleCopItem)
            local cikacakEsya = rastgeleCopItem[rastgleItem]     
            if xPlayer.Functions.AddItem(cikacakEsya, 1) then
                TriggerClientEvent("QBCore:Notify", src, '1 adet '.. QBCore.Shared.Items[cikacakEsya].label ..' Buldun')
            else
                TriggerClientEvent("QBCore:Notify", src, 'Bulduğun Eşyayı Alamadın Çünkü Fazla Ağırsın')
            end
        end
    end
end)

RegisterServerEvent("ServerEmoteRequest")
AddEventHandler("ServerEmoteRequest", function(target, emotename, isim)
	TriggerClientEvent("ClientEmoteRequestReceive", target, emotename, source, isim)
end)

RegisterServerEvent("ServerValidEmote") 
AddEventHandler("ServerValidEmote", function(target, requestedemote, otheremote)
	TriggerClientEvent("SyncPlayEmote", source, otheremote, source)
	TriggerClientEvent("SyncPlayEmoteSource", target, requestedemote)
end)

RegisterServerEvent("zamanasimi") 
AddEventHandler("zamanasimi", function(emoteYollayan)
    local xPlayer = QBCore.Functions.GetPlayer(emoteYollayan)
    if not xPlayer then return; end
    TriggerClientEvent("QBCore:Notify", xPlayer.PlayerData.source, "İstek Zaman Aşımına Uğradı")
end)

RegisterServerEvent("gr-menuv2:impound") 
AddEventHandler("gr-menuv2:impound", function(plate)
    exports.ghmattimysql:execute('SELECT * FROM owned_vehicles WHERE plate = @plate', {
        ['@plate'] = plate,
    }, function(result)
        if result[1].impoundCount == 2 then
            exports.ghmattimysql:execute("DELETE FROM owned_vehicles WHERE plate = @plate", {
                ['plate'] = result[1].plate, 
            })
        else
            exports.ghmattimysql:execute('UPDATE owned_vehicles SET stored = @stored, impoundCount = @impoundCount WHERE plate = @plate', {
                ['@plate'] = result[1].plate,
                ["@stored"] = 0,
                ["@impoundCount"] = result[1].impoundCount + 1
            })
        end
    end)
      
end)

QBCore.Commands.Add("eldiven", "Eldiveni Giy Çıkar", {}, false, function(source, args)
    TriggerClientEvent("qb-clothing:client:adjustfacewear", source, 1)
end)

QBCore.Commands.Add("maske", "Maskeyi Tak Çıkar", {}, false, function(source, args)
    TriggerClientEvent("qb-clothing:client:adjustfacewear", source, 2)
end)

QBCore.Commands.Add("şapka", "Maskeyi Tak Çıkar", {}, false, function(source, args)
    TriggerClientEvent("qb-clothing:client:adjustfacewear", source, 3)
end)

QBCore.Commands.Add("gözlük", "Gözlüğü Tak Çıkar", {}, false, function(source, args)
    TriggerClientEvent("qb-clothing:client:adjustfacewear", source, 4)
end)

QBCore.Commands.Add("tişört", "Tişörtü Giy Çıkar", {}, false, function(source, args)
    TriggerClientEvent("qb-clothing:client:adjustfacewear", source, 5)
end)

QBCore.Commands.Add("çanta", "Çantayı Tak Çıkar", {}, false, function(source, args)
    TriggerClientEvent("qb-clothing:client:adjustfacewear", source, 6)
end)

QBCore.Commands.Add("pantolon", "Pantolonu Giy Çıkar", {}, false, function(source, args)
    TriggerClientEvent("qb-clothing:client:adjustfacewear", source, 7)
end)

QBCore.Commands.Add("ayakkabı", "Ayakkabıyı Giy Çıkar", {}, false, function(source, args)
    TriggerClientEvent("qb-clothing:client:adjustfacewear", source, 8)
end)

QBCore.Commands.Add("tersduz", "Aracı Çevir", {}, false, function(source, args)
    TriggerClientEvent("ters-duz", source)
end)

QBCore.Commands.Add("açek", "Yakındaki Aracı Çek", {}, false, function(source, args)
    TriggerClientEvent("gr-menuv3:arac-cek", source)
end)

QBCore.Commands.Add("bgir", "Yakındaki Aracın Bagajına Gir", {}, false, function(source, args)
    TriggerClientEvent("gr-menu:bgir", source)
end)

RegisterServerEvent('gr-menu:give-lisance')
AddEventHandler('gr-menu:give-lisance', function(id, type ,key)
    local src = id
    if QBCore.Functions.kickHacKer(src, key) then -- QBCore.Key
        local tPlayer = QBCore.Functions.GetPlayer(src)
        if tPlayer then 
            local licenses = tPlayer.PlayerData.metadata.licences
            licenses[type] = true
            tPlayer.Functions.SetMetaData("licences", licenses)
            TriggerClientEvent('esx_dmvschool:loadLicenses', src, licenses)
            TriggerClientEvent("QBCore:Notify", src, "Uçuş Lisansı Aldın")
            TriggerClientEvent("QBCore:Notify", source, "Uçuş Lisansı Verildi")
        end
    end
end)

QBCore.Functions.CreateCallback('bedo:telefonvarmi', function(source, cb)
    local Player = QBCore.Functions.GetPlayer(source)
    local item = Player.Functions.GetItemByName('phone')
    if item > 0 then
        cb(true)
    else
        cb(false)
    end
end)