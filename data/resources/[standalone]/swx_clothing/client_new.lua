-- NEXORA RP - QB-Inventory Kıyafet Entegrasyonu (Client)
-- Bu script qb-inventory'nin modifiye edilmiş HTML/CSS/JS dosyalarıyla çalışır

local QBCore = exports['qb-core']:GetCoreObject()

-- Mevcut kıyafet verilerini tut
local PlayerClothing = {}

-- qb-inventory'den gelen kıyafet giy/çıkar istekleri
RegisterNUICallback('WearClothing', function(data, cb)
    if data and data.slot and data.item then
        local success = exports['swx_clothing'].WearClothing(
            data.slot,
            data.item.info.drawableId,
            data.item.info.textureId,
            data.item.info.paletteId or 0
        )
        
        if success then
            -- Envanterden kıyafeti sil
            TriggerServerEvent('swx_clothing:removeClothingItem', data.item.info)
            
            -- Kıyafet verilerini kaydet
            PlayerClothing[data.slot] = data.item
            
            cb({ success = true, message = data.item.label .. ' giyildi!' })
        else
            cb({ success = false, message = 'Kıyafet giyilemedi!' })
        end
    else
        cb({ success = false, message = 'Geçersiz kıyafet verisi!' })
    end
end)

RegisterNUICallback('RemoveClothing', function(data, cb)
    if data and data.slot then
        -- Kıyafeti çıkar
        local removed = exports['swx_clothing'].RemoveClothing(data.slot)
        
        if removed then
            -- Envantere ekle
            TriggerServerEvent('swx_clothing:addClothingItem', removed)
            
            -- Kıyafet verisini temizle
            PlayerClothing[data.slot] = nil
            
            cb({ success = true, message = removed.label .. ' çıkarıldı!' })
        else
            cb({ success = false, message = 'Kıyafet bulunamadı!' })
        end
    else
        cb({ success = false, message = 'Geçersiz slot!' })
    end
end)

RegisterNUICallback('SortItems', function(data, cb)
    -- Eşya sıralama - client tarafında sadece UI güncellenir
    -- Gerçek sıralama server'da yapılır
    cb({ success = true })
end)

-- Kıyafet verilerini UI'ye gönder
RegisterNUICallback('GetClothingData', function(data, cb)
    cb({ clothing = PlayerClothing })
end)

-- Server'dan kıyafet verilerini al
RegisterNetEvent('swx_clothing:updateClothing', function(clothingData)
    PlayerClothing = clothingData or {}
    
    -- UI'yi güncelle
    SendNUIMessage({
        action = 'updateClothing',
        clothing = PlayerClothing
    })
end)

-- Kıyafet iteminden giy (envanterdeki iteme tıklayınca)
RegisterNetEvent('swx_clothing:wearFromItem', function(clothingData)
    if clothingData then
        local success = exports['swx_clothing'].WearClothing(
            clothingData.slot,
            clothingData.drawableId,
            clothingData.textureId,
            clothingData.paletteId or 0
        )
        
        if success then
            PlayerClothing[clothingData.slot] = clothingData
            TriggerServerEvent('swx_clothing:removeClothingItem', clothingData)
        end
    end
end)

-- Başlangıçta kıyafet verilerini al
CreateThread(function()
    Wait(2000) -- qb-inventory'nin yüklenmesini bekle
    TriggerServerEvent('swx_clothing:getPlayerClothing')
end)

print('[swx_clothing] Client yüklendi - QB-Inventory entegrasyonu aktif')
