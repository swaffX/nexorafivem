local QBCore = exports['qb-core']:GetCoreObject()
local EtBurgerstocks = 0
local TavukBurgerstocks = 0
local PatatesStocks = 0
local KolaStocks = 0
local LimonataStocks = 0
local totalmoney = 0


RegisterNetEvent("wonev:GiveCup",function ()
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    if not Player then return end
    Player.Functions.AddItem("wonev_kartonbardak", 1)
    TriggerClientEvent('QBCore:Notify', src, "Bardak Aldın", "success", 2500)
    
end)

RegisterNetEvent("wonev:GiveCola",function ()
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    if not Player then return end
    Player.Functions.RemoveItem("wonev_kartonbardak", 1)
    Player.Functions.AddItem("wonev_cola", 1)
    TriggerClientEvent('QBCore:Notify', src, "Kola Yaptın", "success", 2500)
    
end)

RegisterNetEvent("wonev:GiveLemonade",function ()
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    if not Player then return end
    Player.Functions.RemoveItem("wonev_kartonbardak", 1)
    Player.Functions.AddItem("wonev_limonata", 1)
    TriggerClientEvent('QBCore:Notify', src, "Limonata Yaptın", "success", 2500)
    
end)

RegisterNetEvent("wonev:FryPatato",function ()
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    if not Player then return end
    Player.Functions.RemoveItem("wonev_soyulmuspatates", 1)
    Player.Functions.AddItem("wonev_kizarmispatates", 1)
    TriggerClientEvent('QBCore:Notify', src, "Patetes Kızarttın", "success", 2500)
    
end)

RegisterNetEvent("wonev:GivePatato",function ()
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    if not Player then return end
    Player.Functions.RemoveItem("wonev_soyulmamispatates", 1)
    Player.Functions.AddItem("wonev_soyulmuspatates", 1)
    TriggerClientEvent('QBCore:Notify', src, "Patatesi Soydun", "success", 2500)
    
end)

RegisterNetEvent("wonev:GiveLettuce",function ()
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    if not Player then return end
    Player.Functions.RemoveItem("wonev_marul", 1)
    Player.Functions.AddItem("wonev_kesilmismarul", 1)
    TriggerClientEvent('QBCore:Notify', src, "Marul Kestin", "success", 2500)
    
end)

RegisterNetEvent("wonev:GiveTomato",function ()
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    if not Player then return end
    Player.Functions.RemoveItem("wonev_domates", 1)
    Player.Functions.AddItem("wonev_kesilmisdomates", 1)
    TriggerClientEvent('QBCore:Notify', src, "Marul Kestin", "success", 2500)
    
end)

RegisterNetEvent("wonev:GiveChicken",function ()
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    if not Player then return end
    Player.Functions.RemoveItem("wonev_pismemistavuk", 1)
    Player.Functions.AddItem("wonev_pismistavuk", 1)
    TriggerClientEvent('QBCore:Notify', src, "Tavuğu Pişirdin", "success", 2500)
    
end)

RegisterNetEvent("wonev:GiveMeat",function ()
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    if not Player then return end
    Player.Functions.RemoveItem("wonev_pismemiset", 1)
    Player.Functions.AddItem("wonev_pismiset", 1)
    TriggerClientEvent('QBCore:Notify', src, "Eti Pişirdin", "success", 2500)
    
end)

RegisterNetEvent("wonev:MeatBurgerCheckItem",function ()
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    if not Player then return end
    local Allitems = true
    for _, item in pairs(Config.EtBurgeritems) do 
        local HasItem = Player.Functions.GetItemByName(item.name)
        if not HasItem or HasItem.amount < item.amount then
            Allitems = false
            TriggerClientEvent('QBCore:Notify', src, "Hamburger Yapmak İçin Gerekli Malzemelere Sahip Değilsin", "error", 2500)
            break
        end
    end
    if Allitems then
        TriggerClientEvent("wonev:MeatBurgerItemChecked",src)
        print("sa")
    end
end)
    
RegisterNetEvent("wonev:GiveMeatHamburger",function ()
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    if not Player then return end
    for _, v in pairs (Config.EtBurgeritems) do 
        Player.Functions.RemoveItem(v.name, v.amount)
    end
    Player.Functions.AddItem("wonev_Ethamburger", 1)
    TriggerClientEvent('QBCore:Notify', src, "Hamburger Yaptın", "success", 2500)
    
end)

RegisterNetEvent("wonev:ChickenBurgerCheckItem",function ()
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    if not Player then return end
    local Allitems = true
    for _, item in pairs(Config.TavukBurgeritems) do 
        local HasItem = Player.Functions.GetItemByName(item.name)
        if not HasItem or HasItem.amount < item.amount then
            Allitems = false
            TriggerClientEvent('QBCore:Notify', src, "Hamburger Yapmak İçin Gerekli Malzemelere Sahip Değilsin", "error", 2500)
            break
        end
    end
    if Allitems then
        TriggerClientEvent("wonev:ChickenBurgerItemChecked",src)
        print("sa")
    end
end)
    

RegisterNetEvent("wonev:GiveChickenHamburger",function ()
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    if not Player then return end
    for _, v in pairs (Config.TavukBurgeritems) do 
        Player.Functions.RemoveItem(v.name, v.amount)
    end
    Player.Functions.AddItem("wonev_tavukhamburger", 1)
    TriggerClientEvent('QBCore:Notify', src, "Hamburger Yaptın", "success", 2500)
    
end)

RegisterNetEvent("wonev:CheckAmount", function(amount, type)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    if not Player then return end

    MySQL.Async.fetchAll("SELECT etburger_amount, tavukburger_amount, potato_amount, cola_amount, lemonade_amount FROM burgershot_stocks WHERE id = 1", {}, function(result)
        if result and result[1] then
            EtBurgerstocks = result[1].etburger_amount or 0
            TavukBurgerstocks = result[1].tavukburger_amount or 0
            PatatesStocks = result[1].potato_amount or 0
            KolaStocks = result[1].cola_amount or 0
            LimonataStocks = result[1].lemonade_amount or 0

            if type == "MeatBurger" then
                local HasItem = Player.Functions.GetItemByName("wonev_ethamburger")
                if HasItem and HasItem.amount and HasItem.amount >= amount then
                    Player.Functions.RemoveItem("wonev_ethamburger", amount)
                    EtBurgerstocks = EtBurgerstocks + amount
                    MySQL.Async.execute("UPDATE burgershot_stocks SET etburger_amount = ? WHERE id = 1", {EtBurgerstocks}, function()
                        TriggerClientEvent("wonev:UpdateStocks", src ,EtBurgerstocks, TavukBurgerstocks, PatatesStocks, KolaStocks, LimonataStocks)
                        TriggerClientEvent('QBCore:Notify', src, "Depoya " .. amount .. " et hamburger eklendi!", "success", 2000)
                    end)
                else
                    TriggerClientEvent('QBCore:Notify', src, "Yeterli et hamburgerin yok!", "error", 2000)
                end
            elseif type == "ChickenBurger" then
                local HasItem = Player.Functions.GetItemByName("wonev_tavukhamburger")
                if HasItem and HasItem.amount and HasItem.amount >= amount then
                    Player.Functions.RemoveItem("wonev_tavukhamburger", amount)
                    TavukBurgerstocks = TavukBurgerstocks + amount
                    MySQL.Async.execute("UPDATE burgershot_stocks SET tavukburger_amount = ? WHERE id = 1", {TavukBurgerstocks}, function()
                        TriggerClientEvent("wonev:UpdateStocks", src ,EtBurgerstocks, TavukBurgerstocks, PatatesStocks, KolaStocks, LimonataStocks)
                        TriggerClientEvent('QBCore:Notify', src, "Depoya " .. amount .. " tavuk hamburger eklendi!", "success", 2000)
                    end)
                else
                    TriggerClientEvent('QBCore:Notify', src, "Yeterli tavuk hamburgerin yok!", "error", 2000)
                end
            elseif type == "Potato" then
                local HasItem = Player.Functions.GetItemByName("wonev_kizarmispatates")
                if HasItem and HasItem.amount and HasItem.amount >= amount then
                    Player.Functions.RemoveItem("wonev_kizarmispatates", amount)
                    PatatesStocks = PatatesStocks + amount
                    MySQL.Async.execute("UPDATE burgershot_stocks SET potato_amount = ? WHERE id = 1", {PatatesStocks}, function()
                        TriggerClientEvent("wonev:UpdateStocks", src ,EtBurgerstocks, TavukBurgerstocks, PatatesStocks, KolaStocks, LimonataStocks)
                        TriggerClientEvent('QBCore:Notify', src, "Depoya " .. amount .. " tavuk hamburger eklendi!", "success", 2000)
                    end)
                else
                    TriggerClientEvent('QBCore:Notify', src, "Yeterli Sayıda Patatesin yok!", "error", 2000)
                end
            elseif type == "Kola" then
                local HasItem = Player.Functions.GetItemByName("wonev_cola")
                if HasItem and HasItem.amount and HasItem.amount >= amount then
                    Player.Functions.RemoveItem("wonev_cola", amount)
                    KolaStocks = KolaStocks + amount
                    MySQL.Async.execute("UPDATE burgershot_stocks SET cola_amount = ? WHERE id = 1", {KolaStocks}, function()
                        TriggerClientEvent("wonev:UpdateStocks", src ,EtBurgerstocks, TavukBurgerstocks, PatatesStocks, KolaStocks, LimonataStocks)
                        TriggerClientEvent('QBCore:Notify', src, "Depoya " .. amount .. " tavuk hamburger eklendi!", "success", 2000)
                    end)
                else
                    TriggerClientEvent('QBCore:Notify', src, "Yeterli Sayıda Kola Yok!", "error", 2000)
                end
            elseif type == "Limonata" then
                local HasItem = Player.Functions.GetItemByName("wonev_limonata")
                if HasItem and HasItem.amount and HasItem.amount >= amount then
                    Player.Functions.RemoveItem("wonev_limonata", amount)
                    LimonataStocks = LimonataStocks + amount
                    MySQL.Async.execute("UPDATE burgershot_stocks SET lemonade_amount = ? WHERE id = 1", {LimonataStocks}, function()
                        TriggerClientEvent("wonev:UpdateStocks", src ,EtBurgerstocks, TavukBurgerstocks, PatatesStocks, KolaStocks, LimonataStocks)
                        TriggerClientEvent('QBCore:Notify', src, "Depoya " .. amount .. " tavuk hamburger eklendi!", "success", 2000)
                    end)
                else
                    TriggerClientEvent('QBCore:Notify', src, "Yeterli Sayıda Limonata Yok!", "error", 2000)
                end
            end
        end
    end)
end)

RegisterNetEvent("wonev:RequestStocks")
AddEventHandler("wonev:RequestStocks", function()
    local src = source
    local result = MySQL.Sync.fetchAll("SELECT etburger_amount, tavukburger_amount, potato_amount, cola_amount, lemonade_amount FROM burgershot_stocks WHERE id = 1")
    if result and result[1] then
        EtBurgerstocks = result[1].etburger_amount or 0
        TavukBurgerstocks = result[1].tavukburger_amount or 0
        PatatesStocks = result[1].potato_amount or 0
        KolaStocks = result[1].cola_amount or 0
        LimonataStocks = result[1].lemonade_amount or 0
        -- Stokları client'a gönder
        TriggerClientEvent("wonev:UpdateStocks", src, EtBurgerstocks, TavukBurgerstocks, PatatesStocks, KolaStocks, LimonataStocks)
    else
        print("Veritabanından stoklar alınamadı!")
    end
end)


RegisterNetEvent('wonev:SellItem', function (amount, type)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    if not Player then return end
    local money = Player.Functions.GetMoney('cash')

    if type == 'SellChicken' then
        local result = MySQL.Sync.fetchScalar("SELECT tavukburger_amount FROM burgershot_stocks WHERE id = 1")
        
        
        if result and result >= amount then
            local price = (amount * Config.SellItems['ChickenBurger'].price)
            print(price)
            if money and money >= price then
                TavukBurgerstocks = TavukBurgerstocks - amount
                totalmoney = totalmoney + price
                MySQL.Sync.fetchAll("SELECT money FROM burgershot_money WHERE id = 1")
                MySQL.Async.execute("UPDATE burgershot_stocks SET tavukburger_amount = ? WHERE id = 1", {TavukBurgerstocks})
                MySQL.Async.execute("UPDATE burgershot_money SET money = ? WHERE id = 1", {totalmoney})
                TriggerClientEvent("wonev:UpdateStocks", src, EtBurgerstocks, TavukBurgerstocks, PatatesStocks, KolaStocks, LimonataStocks)
                TriggerClientEvent("wonev:UpdatemoneyClient", src, totalmoney)
                TriggerClientEvent('QBCore:Notify', src, 'Satın Aldın', 'success', 3500)
                Player.Functions.AddItem('wonev_tavukhamburger', amount)
                Player.Functions.RemoveMoney('cash', price)
            elseif money < price then
                money = Player.Functions.GetMoney('bank')
                if money and money >= price then
                    TavukBurgerstocks = TavukBurgerstocks - amount
                    totalmoney = totalmoney + price
                    MySQL.Sync.fetchAll("SELECT money FROM burgershot_money WHERE id = 1")
                    MySQL.Async.execute("UPDATE burgershot_stocks SET tavukburger_amount = ? WHERE id = 1", {TavukBurgerstocks})
                    MySQL.Async.execute("UPDATE burgershot_money SET money = ? WHERE id = 1", {totalmoney})
                    TriggerClientEvent("wonev:UpdateStocks", src, EtBurgerstocks, TavukBurgerstocks, PatatesStocks, KolaStocks, LimonataStocks)
                    TriggerClientEvent('QBCore:Notify', src, 'Satın Aldın', 'success', 3500)
                    TriggerClientEvent("wonev:UpdatemoneyClient", src, totalmoney)
                    Player.Functions.AddItem('wonev_tavukhamburger', amount)
                    Player.Functions.RemoveMoney('bank', price)
                end
            else
                TriggerClientEvent('QBCore:Notify', src, 'Yeterli Paran Yok', 'error', 3500)
            end
        else
            TriggerClientEvent('QBCore:Notify', src, 'Stokta Yeterli Sayıda Tavuk Burger Yok', 'error', 3500)
        end
    elseif type == 'SellMeat' then
        local result = MySQL.Sync.fetchScalar("SELECT etburger_amount FROM burgershot_stocks WHERE id = 1")
        local price = (amount * Config.SellItems['MeatBurgerBurger'].price)
        if result and result >= amount then
            if money and money >= price then
                EtBurgerstocks = EtBurgerstocks - amount
                totalmoney = totalmoney + price
                MySQL.Sync.fetchAll("SELECT money FROM burgershot_money WHERE id = 1")
                MySQL.Async.execute("UPDATE burgershot_stocks SET etburger_amount = ? WHERE id = 1", {EtBurgerstocks})
                MySQL.Async.execute("UPDATE burgershot_money SET money = ? WHERE id = 1", {totalmoney})
                TriggerClientEvent("wonev:UpdateStocks", src, EtBurgerstocks, TavukBurgerstocks, PatatesStocks, KolaStocks, LimonataStocks)
                TriggerClientEvent('QBCore:Notify', src, 'Satın Aldın', 'success', 3500)
                TriggerClientEvent("wonev:UpdatemoneyClient", src, totalmoney)
                Player.Functions.AddItem('wonev_ethamburger', amount)
                Player.Functions.RemoveMoney('cash', price)
            elseif money < price then
                money = Player.Functions.GetMoney('bank')
                if money and money >= price then
                    EtBurgerstocks = EtBurgerstocks - amount
                    totalmoney = totalmoney + price
                    MySQL.Sync.fetchAll("SELECT money FROM burgershot_money WHERE id = 1")
                    MySQL.Async.execute("UPDATE burgershot_stocks SET etburger_amount = ? WHERE id = 1", {EtBurgerstocks})
                    MySQL.Async.execute("UPDATE burgershot_money SET money = ? WHERE id = 1", {totalmoney})
                    TriggerClientEvent("wonev:UpdateStocks", src, EtBurgerstocks, TavukBurgerstocks, PatatesStocks, KolaStocks, LimonataStocks)
                    TriggerClientEvent('QBCore:Notify', src, 'Satın Aldın', 'success', 3500)
                    TriggerClientEvent("wonev:UpdatemoneyClient", src, totalmoney)
                    Player.Functions.AddItem('wonev_ethamburger', amount)
                    Player.Functions.RemoveMoney('bank', price)
                end
            else
                TriggerClientEvent('QBCore:Notify', src, 'Yeterli Paran Yok', 'error', 3500)
            end
            
        else
            TriggerClientEvent('QBCore:Notify', src, 'Stokta Yeterli Sayıda Et Burger Yok', 'error', 3500)
        end
    elseif type == 'SellCola' then
        local result = MySQL.Sync.fetchScalar("SELECT cola_amount FROM burgershot_stocks WHERE id = 1")
        local price = (amount * Config.SellItems['MeatBurgerBurger'].price)

        if result and result >= amount then
            if money and money >= price then
                KolaStocks = KolaStocks - amount
                totalmoney = totalmoney + price
                MySQL.Sync.fetchAll("SELECT money FROM burgershot_money WHERE id = 1")
                MySQL.Async.execute("UPDATE burgershot_stocks SET cola_amount = ? WHERE id = 1", {KolaStocks})
                MySQL.Async.execute("UPDATE burgershot_money SET money = ? WHERE id = 1", {totalmoney})
                TriggerClientEvent("wonev:UpdateStocks", src, EtBurgerstocks, TavukBurgerstocks, PatatesStocks, KolaStocks, LimonataStocks)
                TriggerClientEvent('QBCore:Notify', src, 'Satın Aldın', 'success', 3500)
                TriggerClientEvent("wonev:UpdatemoneyClient", src, totalmoney)
                Player.Functions.AddItem('wonev_cola', amount)
                Player.Functions.RemoveMoney('cash', price)
            elseif money < price then
                money = Player.Functions.GetMoney('bank')
                if money and money >= price then
                    KolaStocks = KolaStocks - amount
                    totalmoney = totalmoney + price
                    MySQL.Sync.fetchAll("SELECT money FROM burgershot_money WHERE id = 1")
                    MySQL.Async.execute("UPDATE burgershot_stocks SET cola_amount = ? WHERE id = 1", {KolaStocks})
                    MySQL.Async.execute("UPDATE burgershot_money SET money = ? WHERE id = 1", {totalmoney})
                    TriggerClientEvent("wonev:UpdateStocks", src, EtBurgerstocks, TavukBurgerstocks, PatatesStocks, KolaStocks, LimonataStocks)
                    TriggerClientEvent('QBCore:Notify', src, 'Satın Aldın', 'success', 3500)
                    TriggerClientEvent("wonev:UpdatemoneyClient", src, totalmoney)
                    Player.Functions.AddItem('wonev_cola', amount)
                    Player.Functions.RemoveMoney('bank', price)
                end
            else
                TriggerClientEvent('QBCore:Notify', src, 'Yeterli Paran Yok', 'error', 3500)
            end
        else
            TriggerClientEvent('QBCore:Notify', src, 'Stokta Yeterli Sayıda Kola Yok', 'error', 3500)
        end
    elseif type == 'SellLemonade' then
        local result = MySQL.Sync.fetchScalar("SELECT lemonade_amount FROM burgershot_stocks WHERE id = 1")
        local price = (amount * Config.SellItems['MeatBurgerBurger'].price)

        if result and result >= amount then
            if money and money >= price then
                LimonataStocks = LimonataStocks - amount
                totalmoney = totalmoney + price
                MySQL.Sync.fetchAll("SELECT money FROM burgershot_money WHERE id = 1")
                MySQL.Async.execute("UPDATE burgershot_stocks SET lemonade_amount = ? WHERE id = 1", {LimonataStocks})
                MySQL.Async.execute("UPDATE burgershot_money SET money = ? WHERE id = 1", {totalmoney})
                TriggerClientEvent("wonev:UpdateStocks", src, EtBurgerstocks, TavukBurgerstocks, PatatesStocks, KolaStocks, LimonataStocks)
                TriggerClientEvent('QBCore:Notify', src, 'Satın Aldın', 'success', 3500)
                TriggerClientEvent("wonev:UpdatemoneyClient", src, totalmoney)
                Player.Functions.AddItem('wonev_limonata', amount)
                Player.Functions.RemoveMoney('cash', price)
            elseif money < price then
                money = Player.Functions.GetMoney('bank')
                if money and money >= price then
                    LimonataStocks = LimonataStocks - amount
                    totalmoney = totalmoney + price
                    MySQL.Sync.fetchAll("SELECT money FROM burgershot_money WHERE id = 1")
                    MySQL.Async.execute("UPDATE burgershot_stocks SET lemonade_amount = ? WHERE id = 1", {LimonataStocks})
                    MySQL.Async.execute("UPDATE burgershot_money SET money = ? WHERE id = 1", {totalmoney})
                    TriggerClientEvent("wonev:UpdateStocks", src, EtBurgerstocks, TavukBurgerstocks, PatatesStocks, KolaStocks, LimonataStocks)
                    TriggerClientEvent('QBCore:Notify', src, 'Satın Aldın', 'success', 3500)
                    TriggerClientEvent("wonev:UpdatemoneyClient", src, totalmoney)
                    Player.Functions.AddItem('wonev_limonata', amount)
                    Player.Functions.RemoveMoney('bank', price)
                end
            else
                TriggerClientEvent('QBCore:Notify', src, 'Yeterli Paran Yok', 'error', 3500)
            end
        else
            TriggerClientEvent('QBCore:Notify', src, 'Stokta Yeterli Sayıda Limonata Yok', 'error', 3500)
        end
    elseif type == 'SellPotato' then
        local result = MySQL.Sync.fetchScalar("SELECT potato_amount FROM burgershot_stocks WHERE id = 1")
        local price = (amount * Config.SellItems['MeatBurgerBurger'].price)
        if result and result >= amount then
            if money and money >= price then
                PatatesStocks = PatatesStocks - amount
                totalmoney = totalmoney + price
                MySQL.Sync.fetchAll("SELECT money FROM burgershot_money WHERE id = 1")
                MySQL.Async.execute("UPDATE burgershot_stocks SET potato_amount = ? WHERE id = 1", {PatatesStocks})
                MySQL.Async.execute("UPDATE burgershot_money SET money = ? WHERE id = 1", {totalmoney})
                TriggerClientEvent("wonev:UpdateStocks", src, EtBurgerstocks, TavukBurgerstocks, PatatesStocks, KolaStocks, LimonataStocks)
                TriggerClientEvent('QBCore:Notify', src, 'Satın Aldın', 'success', 3500)
                TriggerClientEvent("wonev:UpdatemoneyClient", src, totalmoney)
                Player.Functions.AddItem('wonev_kizarmispatates', amount)
                Player.Functions.RemoveMoney('cash', price)
            elseif money < price then
                money = Player.Functions.GetMoney('bank')
                if money and money >= price then
                    PatatesStocks = PatatesStocks - amount
                    totalmoney = totalmoney + price
                    MySQL.Sync.fetchAll("SELECT money FROM burgershot_money WHERE id = 1")
                    MySQL.Async.execute("UPDATE burgershot_stocks SET potato_amount = ? WHERE id = 1", {PatatesStocks})
                    MySQL.Async.execute("UPDATE burgershot_money SET money = ? WHERE id = 1", {totalmoney})
                    TriggerClientEvent("wonev:UpdateStocks", src, EtBurgerstocks, TavukBurgerstocks, PatatesStocks, KolaStocks, LimonataStocks)
                    TriggerClientEvent('QBCore:Notify', src, 'Satın Aldın', 'success', 3500)
                    TriggerClientEvent("wonev:UpdatemoneyClient", src, totalmoney)
                    Player.Functions.AddItem('wonev_kizarmispatates', amount)
                    Player.Functions.RemoveMoney('bank', price)
                end
            else
                TriggerClientEvent('QBCore:Notify', src, 'Yeterli Paran Yok', 'error', 3500)
            end
        else
            TriggerClientEvent('QBCore:Notify', src, 'Stokta Yeterli Sayıda Patates Kızartması Yok', 'error', 3500)
        end
    elseif type == 'ChickenBurger1' then
        local result = MySQL.Sync.fetchScalar("SELECT potato_amount, tavukburger_amount, cola_amount FROM burgershot_stocks WHERE id = 1")
        local price = (amount * Config.SellItems['ChickenBurgerMenu'].price)
        if result and result >= amount then
            if money and money >= price then
                PatatesStocks = PatatesStocks - amount
                TavukBurgerstocks = TavukBurgerstocks - amount
                KolaStocks = KolaStocks - amount
                totalmoney = totalmoney + price
                MySQL.Sync.fetchAll("SELECT money FROM burgershot_money WHERE id = 1")
                MySQL.Async.execute("UPDATE burgershot_stocks SET potato_amount = ? WHERE id = 1", {PatatesStocks})
                MySQL.Async.execute("UPDATE burgershot_stocks SET tavukburger_amount = ? WHERE id = 1", {TavukBurgerstocks})
                MySQL.Async.execute("UPDATE burgershot_stocks SET cola_amount = ? WHERE id = 1", {KolaStocks})
                MySQL.Async.execute("UPDATE burgershot_money SET money = ? WHERE id = 1", {totalmoney})
                TriggerClientEvent("wonev:UpdateStocks", src, EtBurgerstocks, TavukBurgerstocks, PatatesStocks, KolaStocks, LimonataStocks)
                TriggerClientEvent('QBCore:Notify', src, 'Satın Aldın', 'success', 3500)
                TriggerClientEvent("wonev:UpdatemoneyClient", src, totalmoney)
                Player.Functions.AddItem('wonev_chickenburgermenu1', amount)
                Player.Functions.RemoveMoney('cash', price)
            elseif money < price then
                money = Player.Functions.GetMoney('bank')
                if money and money >= price then
                    PatatesStocks = PatatesStocks - amount
                    TavukBurgerstocks = TavukBurgerstocks - amount
                    KolaStocks = KolaStocks - amount
                    totalmoney = totalmoney + price
                    MySQL.Sync.fetchAll("SELECT money FROM burgershot_money WHERE id = 1")
                    MySQL.Async.execute("UPDATE burgershot_stocks SET potato_amount = ? WHERE id = 1", {PatatesStocks})
                    MySQL.Async.execute("UPDATE burgershot_stocks SET tavukburger_amount = ? WHERE id = 1", {TavukBurgerstocks})
                    MySQL.Async.execute("UPDATE burgershot_stocks SET cola_amount = ? WHERE id = 1", {KolaStocks})
                    MySQL.Async.execute("UPDATE burgershot_money SET money = ? WHERE id = 1", {totalmoney})
                    TriggerClientEvent("wonev:UpdateStocks", src, EtBurgerstocks, TavukBurgerstocks, PatatesStocks, KolaStocks, LimonataStocks)
                    TriggerClientEvent('QBCore:Notify', src, 'Satın Aldın', 'success', 3500)
                    TriggerClientEvent("wonev:UpdatemoneyClient", src, totalmoney)
                    Player.Functions.AddItem('wonev_chickenburgermenu1', amount)
                    Player.Functions.RemoveMoney('bank', price)
                end
            else
                TriggerClientEvent('QBCore:Notify', src, 'Yeterli Paran Yok', 'error', 3500)
            end
        else
            TriggerClientEvent('QBCore:Notify', src, 'Stokta Yeterli Tavuk Burger Menüsü Bulunmuyor', 'error', 3500)
        end
    elseif type == 'ChickenBurger2' then
        local result = MySQL.Sync.fetchScalar("SELECT potato_amount, tavukburger_amount, lemonade_amount FROM burgershot_stocks WHERE id = 1")
        local price = (amount * Config.SellItems['ChickenBurgerMenu'].price)
        if result and result >= amount then
            if money and money >= price then
                PatatesStocks = PatatesStocks - amount
                TavukBurgerstocks = TavukBurgerstocks - amount
                LimonataStocks = LimonataStocks - amount
                totalmoney = totalmoney + price
                MySQL.Sync.fetchAll("SELECT money FROM burgershot_money WHERE id = 1")
                MySQL.Async.execute("UPDATE burgershot_stocks SET potato_amount = ? WHERE id = 1", {PatatesStocks})
                MySQL.Async.execute("UPDATE burgershot_stocks SET tavukburger_amount = ? WHERE id = 1", {TavukBurgerstocks})
                MySQL.Async.execute("UPDATE burgershot_stocks SET lemonade_amount = ? WHERE id = 1", {LimonataStocks})
                MySQL.Async.execute("UPDATE burgershot_money SET money = ? WHERE id = 1", {totalmoney})
                TriggerClientEvent("wonev:UpdateStocks", src, EtBurgerstocks, TavukBurgerstocks, PatatesStocks, KolaStocks, LimonataStocks)
                TriggerClientEvent('QBCore:Notify', src, 'Satın Aldın', 'success', 3500)
                TriggerClientEvent("wonev:UpdatemoneyClient", src, totalmoney)
                Player.Functions.AddItem('wonev_chickenburgermenu2', amount)
                Player.Functions.RemoveMoney('cash', price)
            elseif money < price then
                money = Player.Functions.GetMoney('bank')
                if money and money >= price then
                    PatatesStocks = PatatesStocks - amount
                    TavukBurgerstocks = TavukBurgerstocks - amount
                    LimonataStocks = LimonataStocks - amount
                    totalmoney = totalmoney + price
                    MySQL.Sync.fetchAll("SELECT money FROM burgershot_money WHERE id = 1")
                    MySQL.Async.execute("UPDATE burgershot_stocks SET potato_amount = ? WHERE id = 1", {PatatesStocks})
                    MySQL.Async.execute("UPDATE burgershot_stocks SET tavukburger_amount = ? WHERE id = 1", {TavukBurgerstocks})
                    MySQL.Async.execute("UPDATE burgershot_stocks SET lemonade_amount = ? WHERE id = 1", {LimonataStocks})
                    MySQL.Async.execute("UPDATE burgershot_money SET money = ? WHERE id = 1", {totalmoney})
                    TriggerClientEvent("wonev:UpdateStocks", src, EtBurgerstocks, TavukBurgerstocks, PatatesStocks, KolaStocks, LimonataStocks)
                    TriggerClientEvent('QBCore:Notify', src, 'Satın Aldın', 'success', 3500)
                    TriggerClientEvent("wonev:UpdatemoneyClient", src, totalmoney)
                    Player.Functions.AddItem('wonev_chickenburgermenu2', amount)
                    Player.Functions.RemoveMoney('bank', price)
                end
            else
                TriggerClientEvent('QBCore:Notify', src, 'Yeterli Paran Yok', 'error', 3500)
            end
        else
            TriggerClientEvent('QBCore:Notify', src, 'Stokta Yeterli Et Burger Menüsü Bulunmuyor', 'error', 3500)
        end
    elseif type == 'MeatBurgerMenu1' then
        local result = MySQL.Sync.fetchScalar("SELECT potato_amount, etburger_amount, cola_amount FROM burgershot_stocks WHERE id = 1")
        local price = (amount * Config.SellItems['MeatBurgerMenu'].price)
        if result and result >= amount then
            if money and money >= price then
                PatatesStocks = PatatesStocks - amount
                EtBurgerstocks = EtBurgerstocks - amount
                KolaStocks = KolaStocks - amount
                totalmoney = totalmoney + price
                MySQL.Sync.fetchAll("SELECT money FROM burgershot_money WHERE id = 1")
                MySQL.Async.execute("UPDATE burgershot_stocks SET potato_amount = ? WHERE id = 1", {PatatesStocks})
                MySQL.Async.execute("UPDATE burgershot_stocks SET etburger_amount = ? WHERE id = 1", {EtBurgerstocks})
                MySQL.Async.execute("UPDATE burgershot_stocks SET cola_amount = ? WHERE id = 1", {KolaStocks})
                MySQL.Async.execute("UPDATE burgershot_money SET money = ? WHERE id = 1", {totalmoney})
                TriggerClientEvent("wonev:UpdateStocks", src, EtBurgerstocks, TavukBurgerstocks, PatatesStocks, KolaStocks, LimonataStocks)
                TriggerClientEvent('QBCore:Notify', src, 'Satın Aldın', 'success', 3500)
                TriggerClientEvent("wonev:UpdatemoneyClient", src, totalmoney)
                Player.Functions.AddItem('wonev_meatburgermenu1', amount)
                Player.Functions.RemoveMoney('cash', price)
            elseif money < price then
                money = Player.Functions.GetMoney('bank')
                if money and money >= price then
                    PatatesStocks = PatatesStocks - amount
                    EtBurgerstocks = EtBurgerstocks - amount
                    KolaStocks = KolaStocks - amount
                    totalmoney = totalmoney + price
                    MySQL.Sync.fetchAll("SELECT money FROM burgershot_money WHERE id = 1")
                    MySQL.Async.execute("UPDATE burgershot_stocks SET potato_amount = ? WHERE id = 1", {PatatesStocks})
                    MySQL.Async.execute("UPDATE burgershot_stocks SET etburger_amount = ? WHERE id = 1", {EtBurgerstocks})
                    MySQL.Async.execute("UPDATE burgershot_stocks SET cola_amount = ? WHERE id = 1", {KolaStocks})
                    MySQL.Async.execute("UPDATE burgershot_money SET money = ? WHERE id = 1", {totalmoney})
                    TriggerClientEvent("wonev:UpdateStocks", src, EtBurgerstocks, TavukBurgerstocks, PatatesStocks, KolaStocks, LimonataStocks)
                    TriggerClientEvent('QBCore:Notify', src, 'Satın Aldın', 'success', 3500)
                    TriggerClientEvent("wonev:UpdatemoneyClient", src, totalmoney)
                    Player.Functions.AddItem('wonev_meatburgermenu1', amount)
                    Player.Functions.RemoveMoney('bank', price)
                end
            else
                TriggerClientEvent('QBCore:Notify', src, 'Yeterli Paran Yok', 'error', 3500)
            end
        else
            TriggerClientEvent('QBCore:Notify', src, 'Stokta Yeterli Et Burger Menüsü Bulunmuyor', 'error', 3500)
        end
    elseif type == 'MeatBurgerMenu2' then
        local result = MySQL.Sync.fetchScalar("SELECT potato_amount, etburger_amount, lemonade_amount FROM burgershot_stocks WHERE id = 1")
        local price = (amount * Config.SellItems['MeatBurgerMenu'].price)
        if result and result >= amount then
            if money and money >= price then
                PatatesStocks = PatatesStocks - amount
                EtBurgerstocks = EtBurgerstocks - amount
                LimonataStocks = LimonataStocks - amount
                totalmoney = totalmoney + price
                MySQL.Sync.fetchAll("SELECT money FROM burgershot_money WHERE id = 1")
                MySQL.Async.execute("UPDATE burgershot_stocks SET potato_amount = ? WHERE id = 1", {PatatesStocks})
                MySQL.Async.execute("UPDATE burgershot_stocks SET etburger_amount = ? WHERE id = 1", {EtBurgerstocks})
                MySQL.Async.execute("UPDATE burgershot_stocks SET lemonade_amount = ? WHERE id = 1", {LimonataStocks})
                MySQL.Async.execute("UPDATE burgershot_money SET money = ? WHERE id = 1", {totalmoney})
                TriggerClientEvent("wonev:UpdateStocks", src, EtBurgerstocks, TavukBurgerstocks, PatatesStocks, KolaStocks, LimonataStocks)
                TriggerClientEvent('QBCore:Notify', src, 'Satın Aldın', 'success', 3500)
                TriggerClientEvent("wonev:UpdatemoneyClient", src, totalmoney)
                Player.Functions.AddItem('wonev_meatburgermenu2', amount)
                Player.Functions.RemoveMoney('cash', price)
            elseif money < price then
                money = Player.Functions.GetMoney('bank')
                if money and money >= price then
                    PatatesStocks = PatatesStocks - amount
                    EtBurgerstocks = EtBurgerstocks - amount
                    LimonataStocks = LimonataStocks - amount
                    totalmoney = totalmoney + price
                    MySQL.Sync.fetchAll("SELECT money FROM burgershot_money WHERE id = 1")
                    MySQL.Async.execute("UPDATE burgershot_stocks SET potato_amount = ? WHERE id = 1", {PatatesStocks})
                    MySQL.Async.execute("UPDATE burgershot_stocks SET etburger_amount = ? WHERE id = 1", {EtBurgerstocks})
                    MySQL.Async.execute("UPDATE burgershot_stocks SET lemonade_amount = ? WHERE id = 1", {LimonataStocks})
                    MySQL.Async.execute("UPDATE burgershot_money SET money = ? WHERE id = 1", {totalmoney})
                    TriggerClientEvent("wonev:UpdateStocks", src, EtBurgerstocks, TavukBurgerstocks, PatatesStocks, KolaStocks, LimonataStocks)
                    TriggerClientEvent('QBCore:Notify', src, 'Satın Aldın', 'success', 3500)
                    TriggerClientEvent("wonev:UpdatemoneyClient", src, totalmoney)
                    Player.Functions.AddItem('wonev_meatburgermenu2', amount)
                    Player.Functions.RemoveMoney('bank', price)
                end
            else
                TriggerClientEvent('QBCore:Notify', src, 'Yeterli Paran Yok', 'error', 3500)
            end
        else
            TriggerClientEvent('QBCore:Notify', src, 'Stokta Yeterli Et Burger Menüsü Bulunmuyor', 'error', 3500)
        end
    end
end)

RegisterNetEvent("wonev:Updatemoney")
AddEventHandler("wonev:Updatemoney", function()
    local src = source
    local result = MySQL.Sync.fetchAll("SELECT money FROM burgershot_money WHERE id = 1")
    if result and result[1] then
        totalmoney = result[1].money or 0
        -- Stokları client'a gönder
        TriggerClientEvent("wonev:UpdatemoneyClient", src, totalmoney)
    else
        print("Veritabanından stoklar alınamadı!")
    end
end)


RegisterNetEvent('wonev:AddMoney')
AddEventHandler('wonev:AddMoney', function (amount, type)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    local money = Player.Functions.GetMoney('cash')
    if not Player then return end
    MySQL.Sync.fetchAll("SELECT money FROM burgershot_money WHERE id = 1")
    if type == 'paraekle' then
        if money >= amount then
            totalmoney = totalmoney + amount
            Player.Functions.RemoveMoney('cash', amount)
            MySQL.Async.execute("UPDATE burgershot_money SET money = ? WHERE id = 1", {totalmoney})
            TriggerClientEvent("wonev:UpdatemoneyClient", src, totalmoney)
        else
            TriggerClientEvent('QBCore:Notify', src, 'Yeterli Paranız Yok', 'error', 3500)
        end
    elseif type == 'paracek' then
        if totalmoney >= amount then
            totalmoney = totalmoney - amount
            Player.Functions.AddMoney('cash', amount)
            MySQL.Async.execute("UPDATE burgershot_money SET money = ? WHERE id = 1", {totalmoney})
            TriggerClientEvent("wonev:UpdatemoneyClient", src, totalmoney)
        else
            TriggerClientEvent('QBCore:Notify', src, 'Kasada Yeterli Para Yok', 'error', 3500)
        end
    end
 
end)

QBCore.Functions.CreateUseableItem('wonev_meatburgermenu1', function(source, item)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    if Player.Functions.GetItemByName('wonev_meatburgermenu1') then
        Player.Functions.RemoveItem('wonev_meatburgermenu1', 1)
        Player.Functions.AddItem('wonev_ethamburger', 1)
        Player.Functions.AddItem('wonev_kizarmispatates', 1)
        Player.Functions.AddItem('wonev_cola', 1)
        
    end
end)

QBCore.Functions.CreateUseableItem('wonev_meatburgermenu2', function(source, item)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    if Player.Functions.GetItemByName('wonev_meatburgermenu2') then
        Player.Functions.RemoveItem('wonev_meatburgermenu2', 1)
        Player.Functions.AddItem('wonev_ethamburger', 1)
        Player.Functions.AddItem('wonev_kizarmispatates', 1)
        Player.Functions.AddItem('wonev_limonata', 1)
        
    end
end)

QBCore.Functions.CreateUseableItem('wonev_chickenburgermenu1', function(source, item)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    if Player.Functions.GetItemByName('wonev_chickenburgermenu1') then
        Player.Functions.RemoveItem('wonev_chickenburgermenu1', 1)
        Player.Functions.AddItem('wonev_tavukhamburger', 1)
        Player.Functions.AddItem('wonev_kizarmispatates', 1)
        Player.Functions.AddItem('wonev_cola', 1)
        
    end
end)

QBCore.Functions.CreateUseableItem('wonev_chickenburgermenu2', function(source, item)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    if Player.Functions.GetItemByName('wonev_chickenburgermenu2') then
        Player.Functions.RemoveItem('wonev_chickenburgermenu2', 1)
        Player.Functions.AddItem('wonev_tavukhamburger', 1)
        Player.Functions.AddItem('wonev_kizarmispatates', 1)
        Player.Functions.AddItem('wonev_limonata', 1)
        
    end
end)