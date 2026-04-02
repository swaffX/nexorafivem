local QBCore = exports['qb-core']:GetCoreObject()
local isMarketOpen = false
local currentMarket = nil
local spawnedPeds = {}


-- Market Blip Creation
CreateThread(function()
    for marketId, market in pairs(Config.Markets) do
        local blip = AddBlipForCoord(market.coords.x, market.coords.y, market.coords.z)
        SetBlipSprite(blip, market.blip.sprite)
        SetBlipDisplay(blip, market.blip.display)
        SetBlipScale(blip, market.blip.scale)
        SetBlipColour(blip, market.blip.color)
        SetBlipAsShortRange(blip, true)
        BeginTextCommandSetBlipName('STRING')
        AddTextComponentSubstringPlayerName(market.label)
        EndTextCommandSetBlipName(blip)
    end
end)

CreateThread(function()
    for marketId, market in pairs(Config.Markets) do
        local model = market.pedModel or "mp_m_shopkeep_01"
        local coords = market.coords
        local hash = GetHashKey(model)

        RequestModel(hash)
        while not HasModelLoaded(hash) do Wait(10) end

        local ped = CreatePed(0, hash, coords.x, coords.y, coords.z - 1.0, market.heading, false, true)
        FreezeEntityPosition(ped, true)
        SetEntityInvincible(ped, true)
        SetBlockingOfNonTemporaryEvents(ped, true)

        table.insert(spawnedPeds, ped)

        exports['qb-target']:AddTargetEntity(ped, {
            options = {
                {
                    type = "client",
                    event = "qg_markets:client:openClosestMarket", -- Her pede aynı event
                    icon = "fas fa-store",
                    label = market.TargetLabel,
                }
            },
            distance = 2.0
        })
    end
end)

RegisterNetEvent("qg_markets:client:openClosestMarket", function()
    local pedCoords = GetEntityCoords(PlayerPedId())
    local closestMarketId = nil
    local closestDist = 100000.0

    for marketId, market in pairs(Config.Markets) do
        local dist = #(pedCoords - market.coords)
        if dist < closestDist then
            closestDist = dist
            closestMarketId = marketId
        end
    end

    if closestMarketId then
        print("Market açılıyor (en yakın):", closestMarketId)
        OpenMarket(closestMarketId)
    else
        print("Yakında market bulunamadı.")
    end
end)


-- -- Market Interaction
-- CreateThread(function()
--     while true do
--         local sleep = 1000
--         local playerPed = PlayerPedId()
--         local playerCoords = GetEntityCoords(playerPed)
        
--         for marketId, market in pairs(Config.Markets) do
--             local distance = #(playerCoords - market.coords)
            
--             if distance < 10.0 then
--                 sleep = 0
                
--                 if distance < 2.0 then
--                     QBCore.Functions.DrawText3D(market.coords.x, market.coords.y, market.coords.z, '[E] ' .. market.label)
                    
--                     if IsControlJustPressed(0, 38) then -- E key
--                         OpenMarket(marketId)
--                     end
--                 end
--             end
--         end
        
--         Wait(sleep)
--     end
-- end)

-- Functions
function GetMarketItems(market)
    if type(market.items) == "string" then
        return Config.ItemGroups[market.items]
    else
        return market.items
    end
end

function OpenMarket(marketId)
    print("Market açılıyor:", marketId)
    if isMarketOpen then return end
    
    currentMarket = marketId
    isMarketOpen = true
    
    local marketData = Config.Markets[marketId]
    marketData.items = GetMarketItems(marketData)
    SetNuiFocus(true, true)
    SendNUIMessage({
        action = 'openMarket',
        marketData = marketData,
        language = Config.Language,
        paymentMethods = Config.PaymentMethods
    })
end

function CloseMarket()
    isMarketOpen = false
    currentMarket = nil
    SetNuiFocus(false, false)
    SendNUIMessage({
        action = 'closeMarket'
    })
end

-- NUI Callbacks
RegisterNUICallback('closeMarket', function(data, cb)
    CloseMarket()
    cb('ok')
end)

RegisterNUICallback('showNotification', function(data, cb)
    local message = data.message or 'Bildirim'
    local notifyType = data.type or 'primary'
    
    -- QBCore Notify kullan
    QBCore.Functions.Notify(message, notifyType, 3000)
    
    cb('ok')
end)

RegisterNUICallback('purchaseItems', function(data, cb)
    local paymentMethod = data.paymentMethod
    local items = data.items
    local total = data.total
    
    if not paymentMethod or not items or not total then
        QBCore.Functions.Notify(Config.Language['purchase_failed'], 'error', 3000)
        cb({ success = false, message = Config.Language['purchase_failed'] })
        return
    end
    
    QBCore.Functions.TriggerCallback('qg_markets:purchaseItems', function(success, message)
        if success then
            QBCore.Functions.Notify(message or Config.Language['purchase_successful'], 'success', 3000)
        else
            QBCore.Functions.Notify(message or Config.Language['purchase_failed'], 'error', 3000)
        end
        
        cb({ success = success, message = message })
        
        if success then
            -- Close market after successful purchase
            Wait(1000) -- Wait a bit to show the notification
            CloseMarket()
        end
    end, {
        paymentMethod = paymentMethod,
        items = items,
        total = total,
        marketId = currentMarket
    })
end)

-- Key Handler
RegisterCommand('+closeMarket', function()
    if isMarketOpen then
        CloseMarket()
    end
end)

RegisterCommand('-closeMarket', function() end)

RegisterKeyMapping('+closeMarket', 'Close Market', 'keyboard', 'ESCAPE')