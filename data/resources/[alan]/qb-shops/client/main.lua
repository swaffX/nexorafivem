local QBCore = exports['qb-core']:GetCoreObject()
local coreLoaded = true
local PlayerData = QBCore.Functions.GetPlayerData()

RegisterNetEvent('QBCore:Client:OnPlayerLoaded')
AddEventHandler('QBCore:Client:OnPlayerLoaded', function()
    PlayerData = QBCore.Functions.GetPlayerData()
end)

RegisterNetEvent('QBCore:Client:OnJobUpdate')
AddEventHandler('QBCore:Client:OnJobUpdate', function(job)
	PlayerData.job = job
end)

RegisterNetEvent('qbshopsKeybindGeneral')
AddEventHandler('qbshopsKeybindGeneral', function()
    if coreLoaded then
        local PlayerPos = GetEntityCoords(PlayerPedId())
        for shop, data in pairs(Config.Locations) do
            for _, loc in pairs(Config.Locations[shop]["coords"]) do
                if #(PlayerPos - vector3(loc["x"], loc["y"], loc["z"])) < 2 then
                    if Config.Locations[shop]["label"] == "Kartel Dibidi" then
                        if PlayerData.job.name == "unemployed" and PlayerData.job.grade == 2 then
                            QBCore.Functions.Notify("Merhaba dostum, nasılsın?")
                            Citizen.Wait(2000)
                            QBCore.Functions.Notify("Tam sana uygun bir mekanım var göz atmanı öneririm!")
                            Citizen.Wait(4000)
                            TriggerServerEvent("qy-phone:server:sendNewMail", { sender = "Kartel Dibidi", subject = "Gang Gunner Konumu", message = "Aradığın malzemeleri bu mekandan tedarik edebilirsin!", button = vector3(1446.847412109375, -1481.4246826171875, 63.22446060180664), image = ""})
                        else
                            QBCore.Functions.Notify("Seni buralarda yeni görüyorum!")
                        end
                    elseif Config.Locations[shop]["label"] == "Kartel QY" then 
                        if PlayerData.job.name == "unemployed" and PlayerData.job.grade == 2 then
                            local ShopItems = {}
                            ShopItems.label = Config.Locations[shop]["label"]
                            ShopItems.items = Config.Locations[shop]["products"]
                            ShopItems.slots = #Config.Locations[shop]["products"]
                            TriggerServerEvent("inventory:server:OpenInventory", "shop", "Itemshop_"..shop, ShopItems)
                        else
                            QBCore.Functions.Notify("Seni buralarda yeni görüyorum!")
                        end
                    else
                        local ShopItems = {}
                        ShopItems.label = Config.Locations[shop]["label"]
                        ShopItems.items = Config.Locations[shop]["products"]
                        ShopItems.slots = #Config.Locations[shop]["products"]
                        TriggerServerEvent("inventory:server:OpenInventory", "shop", "Itemshop_"..shop, ShopItems)
                    end
                end
            end
        end
    end
end)

RegisterNetEvent('qb-shops:client:UpdateShop')
AddEventHandler('qb-shops:client:UpdateShop', function(shop, itemData, amount)
    TriggerServerEvent('qb-shops:server:UpdateShopItems', shop, itemData, amount)
end)

RegisterNetEvent('qb-shops:client:SetShopItems')
AddEventHandler('qb-shops:client:SetShopItems', function(shop, shopProducts)
    Config.Locations[shop]["products"] = shopProducts
end)

RegisterNetEvent('qb-shops:client:RestockShopItems')
AddEventHandler('qb-shops:client:RestockShopItems', function(shop, amount)
    if Config.Locations[shop]["products"] ~= nil then 
        for k, v in pairs(Config.Locations[shop]["products"]) do 
            Config.Locations[shop]["products"][k].amount = Config.Locations[shop]["products"][k].amount + amount
        end
    end
end)

Citizen.CreateThread(function()
    for store,data in pairs(Config.Locations) do
        for i=1, #data.coords do
            -- gr-base kullanımı kaldırıldı - qb-target veya ox_target kullanılabilir
            -- exports["gr-base"]:addNotif(data["icon"], "E", data["label"], 2, 2, vector3(data.coords[i].x, data.coords[i].y, data.coords[i].z))
            -- exports["gr-base"]:pedcreate("qb-shops-"..store.."-"..i, data.pedHash, data.coords[i].x, data.coords[i].y, data.coords[i].z - 1, data.coords[i].h)
        end

        if data["blip"] then
            for i=1, #Config.Locations[store]["coords"] do
                local StoreBlip = AddBlipForCoord(Config.Locations[store]["coords"][i]["x"], Config.Locations[store]["coords"][i]["y"], Config.Locations[store]["coords"][i]["z"])

                SetBlipColour(StoreBlip, data["blip"]["colour"])
                SetBlipSprite(StoreBlip, data["blip"]["sprite"])
                SetBlipScale(StoreBlip, data["blip"]["scale"])
                
                SetBlipDisplay(StoreBlip, 4)
                SetBlipAsShortRange(StoreBlip, true)

                BeginTextCommandSetBlipName("STRING")
                AddTextComponentSubstringPlayerName(Config.Locations[store]["label"])
                EndTextCommandSetBlipName(StoreBlip)
            end
        end

    end
end)

local blip = false
local weaponShopBlip = {}
RegisterNetEvent("esx_weaponshop:blipAcKapa")
AddEventHandler("esx_weaponshop:blipAcKapa", function()
	if blip then
		pasifblip()
		blip = false
	else
		aktifblip()
		blip = true
	end
end)

function aktifblip()
    for k,location in pairs(Config.Locations["Weapons"]["coords"]) do
        local blip = AddBlipForCoord(location.x, location.y, location.z)
        SetBlipSprite (blip, 110)
        SetBlipDisplay(blip, 4)
        SetBlipScale  (blip, 0.5)
        SetBlipColour (blip, 81)
        SetBlipAsShortRange(blip, true)

        BeginTextCommandSetBlipName("STRING")
        AddTextComponentSubstringPlayerName("Silah Dukkanı")
        EndTextCommandSetBlipName(blip)
        table.insert(weaponShopBlip, blip)
	end		
end

function pasifblip()
	for i = 1, #weaponShopBlip do
		RemoveBlip(weaponShopBlip[i])
	end
	weaponShopBlip = {}
end

---------------------------------------------

local blips = false
local marketShopBlip = {}
RegisterNetEvent("esx_marketshop:blipAcKapa")
AddEventHandler("esx_marketshop:blipAcKapa", function()
	if blips then
		pasifblips()
		blips = false
	else
		aktifblips()
		blips = true
	end
end)

function aktifblips()
    for k,location in pairs(Config.Locations["Market"]["coords"]) do
        local blips = AddBlipForCoord(location.x, location.y, location.z)
        SetBlipSprite(blips, 52)
        SetBlipDisplay(blips, 4)
        SetBlipScale(blips, 0.5)
        SetBlipColour(blips, 3)
        SetBlipAsShortRange(blips, true)

        BeginTextCommandSetBlipName("STRING")
        AddTextComponentSubstringPlayerName("Market")
        EndTextCommandSetBlipName(blips)
        table.insert(marketShopBlip, blips)
	end		
end

function pasifblips()
	for i = 1, #marketShopBlip do
		RemoveBlip(marketShopBlip[i])
	end
	marketShopBlip = {}
end
---------------------------------------------

-- local blips = false
-- local manavBlip = {}
-- RegisterNetEvent("esx_manavshop:blipAcKapa")
-- AddEventHandler("esx_manavshop:blipAcKapa", function()
-- 	if blips then
-- 		pasifblips()
-- 		blips = false
-- 	else
-- 		aktifblips()
-- 		blips = true
-- 	end
-- end)

-- function aktifblips()
--     for k,location in pairs(Config.Locations["Manav"]["coords"]) do
--         local blips = AddBlipForCoord(location.x, location.y, location.z)
--         SetBlipSprite(blips, 52)
--         SetBlipDisplay(blips, 4)
--         SetBlipScale(blips, 0.5)
--         SetBlipColour(blips, 3)
--         SetBlipAsShortRange(blips, true)

--         BeginTextCommandSetBlipName("STRING")
--         AddTextComponentSubstringPlayerName("Manav")
--         EndTextCommandSetBlipName(blips)
--         table.insert(manavBlip, blips)
-- 	end		
-- end

-- function pasifblips()
-- 	for i = 1, #manavBlip do
-- 		RemoveBlip(manavBlip[i])
-- 	end
-- 	manavBlip = {}
-- end

-- ---------------------------------------------


-- local blips = false
-- local etciBlip = {}
-- RegisterNetEvent("esx_etci:blipAcKapa")
-- AddEventHandler("esx_etci:blipAcKapa", function()
-- 	if blips then
-- 		pasifblips()
-- 		blips = false
-- 	else
-- 		aktifblips()
-- 		blips = true
-- 	end
-- end)

-- function aktifblips()
--     for k,location in pairs(Config.Locations["etci"]["coords"]) do
--         local blips = AddBlipForCoord(location.x, location.y, location.z)
--         SetBlipSprite(blips, 273)
--         SetBlipDisplay(blips, 4)
--         SetBlipScale(blips, 0.5)
--         SetBlipColour(blips, 9)
--         SetBlipAsShortRange(blips, true)

--         BeginTextCommandSetBlipName("STRING")
--         AddTextComponentSubstringPlayerName("Çiftlik Sahibi Efe")
--         EndTextCommandSetBlipName(blips)
--         table.insert(etciBlip, blips)
-- 	end		
-- end

-- function pasifblips()
-- 	for i = 1, #etciBlip do
-- 		RemoveBlip(etciBlip[i])
-- 	end
-- 	etciBlip = {}
-- end