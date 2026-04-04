local function customIDCard(src, item)
    if GetResourceState 'um-idcard' == 'started' then
        exports['um-idcard']:CreateMetaLicense(src, item)
    elseif GetResourceState 'bl_idcard' == 'started' then
        exports.bl_idcard:createLicense(src, item)
    else
        warn('You need to start one of the idcard resources to use custom ID Card')
    end
end

local function addItemToInventory(src, item, amount, metadata, pFunction)
    if GetResourceState('ox_inventory') == 'started' then
        exports.ox_inventory:AddItem(src, item, amount, metadata)
        return
    end

    local xPlayer = Framework:GetPlayer(src)
    if not xPlayer then return end
    xPlayer.addInventoryItem(item, amount, metadata)
end

function GiveStarterItems(src)
    local Player = Framework:GetPlayer(src)
    if not Player then return end

    local starterItems = Config?.StarterItems

    if not next(starterItems) then return end

    for i = 1, #starterItems do
        local data = starterItems[i]
        local metadata = {}

        if data.item == 'id_card' or data.item == 'driver_license' then
            if data.customExport then
                customIDCard(src, data.item)
            end
        end

        if not data.customExport then
            addItemToInventory(src, data.item, data.amount, metadata)
        end
    end
end
