local QBCore = exports['qb-core']:GetCoreObject()

-- Kıyafet itemi ekle
RegisterNetEvent('swx_clothing:addClothingItem', function(clothingData)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    
    if not Player or not clothingData then return end
    
    local itemName = 'clothing_' .. clothingData.slot
    local itemLabel = clothingData.label
    local itemWeight = Config.DefaultClothingWeight
    
    -- Item metadata
    local itemInfo = {
        slot = clothingData.slot,
        drawableId = clothingData.drawableId,
        textureId = clothingData.textureId,
        paletteId = clothingData.paletteId,
        label = clothingData.label
    }
    
    -- Envantere ekle
    if exports['qb-inventory'] then
        local success = exports['qb-inventory']:AddItem(src, itemName, 1, nil, itemInfo)
        if success then
            TriggerClientEvent('ox_lib:notify', src, {
                type = 'success',
                description = clothingData.label .. ' envanterine eklendi!'
            })
        end
    end
end)

-- Kıyafet itemi sil
RegisterNetEvent('swx_clothing:removeClothingItem', function(clothingData)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    
    if not Player or not clothingData then return end
    
    local itemName = 'clothing_' .. clothingData.slot
    
    -- Envanterden sil
    if exports['qb-inventory'] then
        exports['qb-inventory']:RemoveItem(src, itemName, 1)
    end
end)

-- Oyuncu ara (kıyafetleri gör)
RegisterNetEvent('swx_clothing:searchPlayer', function(targetId)
    local src = source
    local targetPlayer = QBCore.Functions.GetPlayer(targetId)
    
    if not targetPlayer then
        TriggerClientEvent('ox_lib:notify', src, {type = 'error', description = 'Oyuncu bulunamadı!'})
        return
    end
    
    -- Mesafe kontrolü
    local srcPed = GetPlayerPed(src)
    local targetPed = GetPlayerPed(targetId)
    local srcCoords = GetEntityCoords(srcPed)
    local targetCoords = GetEntityCoords(targetPed)
    local distance = #(srcCoords - targetCoords)
    
    if distance > Config.SearchDistance then
        TriggerClientEvent('ox_lib:notify', src, {type = 'error', description = 'Oyuncu çok uzak!'})
        return
    end
    
    -- Target'ın kıyafet bilgilerini al
    -- Bu client'tan gelmeli, şimdilik basit tutalım
    TriggerClientEvent('swx_clothing:requestClothingData', targetId, src)
end)

-- Kıyafet çal
RegisterNetEvent('swx_clothing:stealClothing', function(slotName, clothingData)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    
    if not Player or not clothingData then return end
    
    -- Basit çalma mantığı - normalde karşı tarafın onayını almalı veya baygın olmalı
    -- Şimdilik direkt verelim
    
    local itemName = 'clothing_' .. slotName
    local itemInfo = {
        slot = slotName,
        drawableId = clothingData.drawableId,
        textureId = clothingData.textureId,
        paletteId = clothingData.paletteId,
        label = clothingData.label
    }
    
    if exports['qb-inventory'] then
        local success = exports['qb-inventory']:AddItem(src, itemName, 1, nil, itemInfo)
        if success then
            TriggerClientEvent('ox_lib:notify', src, {
                type = 'success',
                description = clothingData.label .. ' alındı!'
            })
        end
    end
end)

-- Kıyafet düşür (yerde obje)
RegisterNetEvent('swx_clothing:dropClothing', function(clothingData, coords)
    local src = source
    
    if not clothingData or not coords then return end
    
    -- QB-Inventory drop mantığı
    local itemName = 'clothing_' .. clothingData.slot
    local itemInfo = {
        slot = clothingData.slot,
        drawableId = clothingData.drawableId,
        textureId = clothingData.textureId,
        paletteId = clothingData.paletteId,
        label = clothingData.label
    }
    
    -- Düşürme işlemi
    if exports['qb-inventory'] then
        exports['qb-inventory']:CreateDrop(src, itemName, 1, coords, itemInfo)
    end
end)

-- Kıyafet itemlerini QB-Inventory'e kaydet
AddEventHandler('onResourceStart', function(resource)
    if resource == GetCurrentResourceName() then
        -- Kıyafet itemlerini tanımla
        for _, slot in ipairs(Config.ClothingSlots) do
            local itemName = 'clothing_' .. slot.name
            
            -- QB-Shared Items'a ekle
            if QBCore.Shared.Items then
                QBCore.Shared.Items[itemName] = {
                    name = itemName,
                    label = slot.label .. ' (Kıyafet)',
                    weight = Config.DefaultClothingWeight,
                    type = 'item',
                    image = 'clothing_' .. slot.name .. '.png',
                    unique = true,
                    useable = true,
                    shouldClose = true,
                    description = 'Giyilebilir ' .. slot.label
                }
            end
        end
        
        print('[SWX-Clothing] Kıyafet itemleri tanımlandı!')
    end
end)

-- Item kullanımı (giy)
QBCore.Functions.CreateUseableItem('clothing_.*', function(source, item)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    
    if not Player or not item.info then return end
    
    -- Kıyafet giy
    TriggerClientEvent('swx_clothing:wearFromItem', src, item.info)
end)

print('[SWX-Clothing] Server yüklendi!')
