local QBCore = exports['qb-core']:GetCoreObject()

-- Kıyafet durumu
local CurrentClothing = {}

-- qb-inventory'nin NUI callbacklerini dinle
-- Bu script qb-inventory'nin HTML/CSS/JS dosyalarını modifiye eder

-- Kıyafet çıkar ve envantere koy
RegisterNUICallback('removeClothing', function(data, cb)
    local slotName = data.slot
    
    -- Kıyafeti çıkar
    local removedClothing = exports['swx_clothing'].RemoveClothing(slotName)
    
    if removedClothing then
        -- Envantere ekle
        TriggerServerEvent('swx_clothing:addClothingItem', removedClothing)
        
        -- Başarılı
        cb({success = true, message = removedClothing.label .. ' çıkarıldı!'})
        
        -- UI Güncelle
        local clothing = exports['swx_clothing'].GetCurrentClothing()
        SendNUIMessage({
            type = 'updateClothing',
            clothing = clothing
        })
    else
        cb({success = false, message = 'Kıyafet çıkarılamadı!'})
    end
end)

-- Envanterden kıyafet giy
RegisterNUICallback('wearClothing', function(data, cb)
    local clothingData = data.clothing
    
    if clothingData then
        local success = exports['swx_clothing'].WearClothing(
            clothingData.slot,
            clothingData.drawableId,
            clothingData.textureId,
            clothingData.paletteId
        )
        
        if success then
            -- Envanterden sil
            TriggerServerEvent('swx_clothing:removeClothingItem', clothingData)
            
            cb({success = true, message = clothingData.label .. ' giyildi!'})
            
            -- UI Güncelle
            local clothing = exports['swx_clothing'].GetCurrentClothing()
            SendNUIMessage({
                type = 'updateClothing',
                clothing = clothing
            })
        else
            cb({success = false, message = 'Kıyafet giyilemedi!'})
        end
    else
        cb({success = false, message = 'Geçersiz kıyafet!'})
    end
end)

-- Oyuncuyu ara (kıyafet çalma)
function SearchNearbyPlayer()
    local ped = PlayerPedId()
    local coords = GetEntityCoords(ped)
    
    -- Yakındaki oyuncuları bul
    local closestPlayer, closestDistance = nil, math.huge
    
    for _, player in ipairs(GetActivePlayers()) do
        if player ~= PlayerId() then
            local targetPed = GetPlayerPed(player)
            local targetCoords = GetEntityCoords(targetPed)
            local distance = #(coords - targetCoords)
            
            if distance < closestDistance and distance < Config.SearchDistance then
                closestDistance = distance
                closestPlayer = player
            end
        end
    end
    
    if closestPlayer then
        local targetId = GetPlayerServerId(closestPlayer)
        
        -- Onay dialogu
        local alert = lib.alertDialog({
            header = 'Oyuncu Ara',
            content = 'Bu oyuncunun üzerindeki kıyafetleri aramak istiyor musun?',
            centered = true,
            cancel = true
        })
        
        if alert == 'confirm' then
            TriggerServerEvent('swx_clothing:searchPlayer', targetId)
        end
    else
        lib.notify({type = 'error', description = 'Yakında aranacak oyuncu yok!'})
    end
end

-- Arama sonucu göster
RegisterNetEvent('swx_clothing:showSearchResult', function(targetName, clothing)
    local options = {}
    
    for slotName, clothData in pairs(clothing) do
        table.insert(options, {
            title = clothData.label,
            description = slotName .. ' slotundan al',
            onSelect = function()
                -- Kıyafet çalma işlemi
                TriggerServerEvent('swx_clothing:stealClothing', slotName, clothData)
            end
        })
    end
    
    if #options == 0 then
        lib.notify({type = 'error', description = 'Oyuncuda kıyafet yok!'})
        return
    end
    
    lib.registerContext({
        id = 'search_clothing',
        title = targetName .. ' - Kıyafetler',
        options = options
    })
    
    lib.showContext('search_clothing')
end)

-- Komutlar
RegisterCommand(Config.Commands.inventory, function()
    ToggleInventory()
end, false)

RegisterCommand(Config.Commands.clothing, function()
    OpenClothingMenu()
end, false)

RegisterCommand(Config.Commands.searchPlayer, function()
    SearchNearbyPlayer()
end, false)

-- Tuş atamaları
RegisterKeyMapping(Config.Commands.inventory, 'Envanter', 'keyboard', 'TAB')
RegisterKeyMapping(Config.Commands.clothing, 'Kıyafet Menüsü', 'keyboard', 'K')

-- Kıyafet menüsü
function OpenClothingMenu()
    local clothing = exports['swx_clothing'].GetCurrentClothing()
    
    local options = {}
    
    for _, slot in ipairs(Config.ClothingSlots) do
        local current = clothing[slot.name]
        
        table.insert(options, {
            title = slot.label,
            description = current and current.label or 'Boş',
            icon = slot.icon,
            onSelect = function()
                -- Çıkar giyme menüsü
                ClothingActionMenu(slot, current)
            end
        })
    end
    
    lib.registerContext({
        id = 'clothing_menu',
        title = '👕 Kıyafet Yönetimi',
        options = options
    })
    
    lib.showContext('clothing_menu')
end

function ClothingActionMenu(slot, current)
    local options = {}
    
    if current then
        table.insert(options, {
            title = 'Çıkar',
            description = current.label .. ' çıkar ve envantere koy',
            icon = 'arrow-down',
            onSelect = function()
                local removed = exports['swx_clothing'].RemoveClothing(slot.name)
                if removed then
                    TriggerServerEvent('swx_clothing:addClothingItem', removed)
                    lib.notify({type = 'success', description = removed.label .. ' çıkarıldı!'})
                end
            end
        })
    end
    
    -- Envanterdeki kıyafetler
    local PlayerData = QBCore.Functions.GetPlayerData()
    local items = PlayerData.items or {}
    
    for _, item in ipairs(items) do
        if item.name:match('^clothing_') then
            local clothSlot = item.info and item.info.slot
            if clothSlot == slot.name then
                table.insert(options, {
                    title = 'Giy: ' .. (item.label or item.name),
                    icon = 'arrow-up',
                    onSelect = function()
                        local success = exports['swx_clothing'].WearClothing(
                            item.info.slot,
                            item.info.drawableId,
                            item.info.textureId,
                            item.info.paletteId
                        )
                        if success then
                            TriggerServerEvent('swx_clothing:removeClothingItem', item.info)
                            lib.notify({type = 'success', description = item.label .. ' giyildi!'})
                        end
                    end
                })
            end
        end
    end
    
    lib.registerContext({
        id = 'clothing_action',
        title = slot.label,
        menu = 'clothing_menu',
        options = options
    })
    
    lib.showContext('clothing_action')
end

print('[SWX-Clothing] Client yüklendi!')
print('[SWX-Clothing] Komutlar: /' .. Config.Commands.inventory .. ' - /' .. Config.Commands.clothing .. ' - /' .. Config.Commands.searchPlayer)

-- NUI Callback'ler (HTML'den gelen istekler)
RegisterNUICallback('closeInventory', function(data, cb)
    CloseInventory()
    cb({})
end)

RegisterNUICallback('getPlayerInfo', function(data, cb)
    local PlayerData = QBCore.Functions.GetPlayerData()
    cb({
        name = PlayerData.charinfo.firstname .. ' ' .. PlayerData.charinfo.lastname,
        job = PlayerData.job.label,
        id = GetPlayerServerId(PlayerId())
    })
end)

RegisterNUICallback('useItem', function(data, cb)
    if data.slot then
        -- QB-Inventory item kullan
        TriggerServerEvent('inventory:server:UseItem', data.slot)
    end
    cb({})
end)

RegisterNUICallback('showNotification', function(data, cb)
    lib.notify({
        type = data.type or 'info',
        description = data.message
    })
    cb({})
end)

-- Kıyafet iteminden giy
RegisterNetEvent('swx_clothing:wearFromItem', function(clothingData)
    if clothingData then
        local success = exports['swx_clothing'].WearClothing(
            clothingData.slot,
            clothingData.drawableId,
            clothingData.textureId,
            clothingData.paletteId
        )
        
        if success then
            -- Envanterden sil
            TriggerServerEvent('swx_clothing:removeClothingItem', clothingData)
        end
    end
end)
