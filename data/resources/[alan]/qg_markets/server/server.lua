local QBCore = exports['qb-core']:GetCoreObject()

-- Purchase Items Callback
QBCore.Functions.CreateCallback('qg_markets:purchaseItems', function(source, cb, data)
    local Player = QBCore.Functions.GetPlayer(source)
    if not Player then
        print('[QG Markets] Player not found: ' .. source)
        cb(false, Config.Language['purchase_failed'])
        return
    end
    
    local paymentMethod = data.paymentMethod
    local items = data.items
    local total = data.total
    local marketId = data.marketId
    
    -- Validate data
    if not paymentMethod or not items or not total or not marketId then
        print('[QG Markets] Invalid purchase data received')
        cb(false, Config.Language['purchase_failed'])
        return
    end
    
    -- Check if player has enough money
    local playerMoney = 0
    if paymentMethod == 'cash' then
        playerMoney = Player.PlayerData.money.cash or 0
    elseif paymentMethod == 'bank' then
        playerMoney = Player.PlayerData.money.bank or 0
    else
        print('[QG Markets] Invalid payment method: ' .. tostring(paymentMethod))
        cb(false, Config.Language['purchase_failed'])
        return
    end
    
    print(string.format('[QG Markets] Player %s has $%d in %s, trying to spend $%d', 
        Player.PlayerData.citizenid, playerMoney, paymentMethod, total))
    
    if playerMoney < total then
        print('[QG Markets] Insufficient funds')
        cb(false, Config.Language['insufficient_funds'])
        return
    end
    
    -- Remove money first
    local moneyRemoved = false
    if paymentMethod == 'cash' then
        moneyRemoved = Player.Functions.RemoveMoney('cash', total, 'market-purchase')
    elseif paymentMethod == 'bank' then
        moneyRemoved = Player.Functions.RemoveMoney('bank', total, 'market-purchase')
    end
    
    if not moneyRemoved then
        print('[QG Markets] Failed to remove money from player')
        cb(false, Config.Language['purchase_failed'])
        return
    end
    
    print('[QG Markets] Money removed successfully')
    
    -- Add items to player inventory
    local itemsAdded = 0
    local totalItems = 0
    
    for _, item in pairs(items) do
        totalItems = totalItems + 1
        local itemData = GetMarketItem(marketId, item.name)
        
        if itemData then
            -- Check if item exists in QBCore shared items
            if QBCore.Shared.Items[item.name] then
                local success = Player.Functions.AddItem(item.name, item.quantity)
                
                if success then
                    itemsAdded = itemsAdded + 1
                    print(string.format('[QG Markets] Added %dx %s to player inventory', item.quantity, item.name))
                    
                    -- Trigger item notification
                    TriggerClientEvent('inventory:client:ItemBox', source, QBCore.Shared.Items[item.name], 'add', item.quantity)
                else
                    print(string.format('[QG Markets] Failed to add item %s to inventory', item.name))
                end
            else
                print(string.format('[QG Markets] Item %s does not exist in QBCore.Shared.Items', item.name))
            end
        else
            print(string.format('[QG Markets] Item %s not found in market %s', item.name, marketId))
        end
    end
    
    -- Check if all items were added successfully
    if itemsAdded == totalItems then
        print(string.format('[QG Markets] Purchase successful: %s (%s) bought %d items for $%d using %s', 
            Player.PlayerData.charinfo.firstname .. ' ' .. Player.PlayerData.charinfo.lastname,
            Player.PlayerData.citizenid,
            totalItems,
            total,
            paymentMethod
        ))
        
        cb(true, Config.Language['purchase_successful'])
    else
        -- Some items failed to add, but money was already removed
        -- In a production system, you might want to refund the money or handle this differently
        print(string.format('[QG Markets] Partial purchase: %d/%d items added', itemsAdded, totalItems))
        cb(true, Config.Language['purchase_successful'] .. ' (Bazı itemlar eklenemedi)')
    end
end)

-- Helper Functions
function GetMarketItems(market)
    if type(market.items) == "string" then
        return Config.ItemGroups[market.items]
    else
        return market.items
    end
end

function GetMarketItem(marketId, itemName)
    local market = Config.Markets[marketId]
    if not market then 
        print('[QG Markets] Market not found: ' .. tostring(marketId))
        return nil 
    end

    local items = GetMarketItems(market)
    for _, item in pairs(items) do
        if item.name == itemName then
            return item
        end
    end

    print('[QG Markets] Item not found in market: ' .. tostring(itemName))
    return nil
end

-- Debug command to check player money (remove in production)
QBCore.Commands.Add('checkmarketmoney', 'Check your money for market debugging', {}, false, function(source, args)
    local Player = QBCore.Functions.GetPlayer(source)
    if Player then
        TriggerClientEvent('chat:addMessage', source, {
            color = {255, 255, 0},
            multiline = true,
            args = {"Market Debug", string.format("Cash: $%d | Bank: $%d", 
                Player.PlayerData.money.cash or 0, 
                Player.PlayerData.money.bank or 0)}
        })
    end
end, 'user')