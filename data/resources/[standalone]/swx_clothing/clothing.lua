-- Kıyafet yönetim fonksiyonları
local PlayerClothing = {}

-- Kıyafet component ID'leri
local ClothingComponents = {
    head = {componentId = 0, drawableId = 0, textureId = 0},
    torso = {componentId = 11, drawableId = 0, textureId = 0},
    undershirt = {componentId = 8, drawableId = 0, textureId = 0},
    legs = {componentId = 4, drawableId = 0, textureId = 0},
    shoes = {componentId = 6, drawableId = 0, textureId = 0},
    bag = {componentId = 5, drawableId = 0, textureId = 0},
    accessory = {componentId = 7, drawableId = 0, textureId = 0},
    mask = {componentId = 1, drawableId = 0, textureId = 0},
}

-- Aktif kıyafetleri sakla
local ActiveClothing = {}

-- Kıyafet giy
function WearClothing(slotName, drawableId, textureId, paletteId)
    local ped = PlayerPedId()
    local component = ClothingComponents[slotName]
    
    if not component then return false end
    
    -- Animasyon oynat
    RequestAnimDict(Config.WearClothingAnim.dict)
    while not HasAnimDictLoaded(Config.WearClothingAnim.dict) do
        Wait(100)
    end
    TaskPlayAnim(ped, Config.WearClothingAnim.dict, Config.WearClothingAnim.anim, 8.0, -8.0, Config.WearClothingAnim.duration, 0, 0, false, false, false)
    
    Wait(Config.WearClothingAnim.duration)
    
    -- Kıyafeti giy
    SetPedComponentVariation(ped, component.componentId, drawableId or 0, textureId or 0, paletteId or 0)
    
    -- Aktif kıyafetleri kaydet
    ActiveClothing[slotName] = {
        drawableId = drawableId,
        textureId = textureId,
        paletteId = paletteId
    }
    
    ClearPedTasks(ped)
    return true
end

-- Kıyafet çıkar
function RemoveClothing(slotName)
    local ped = PlayerPedId()
    local component = ClothingComponents[slotName]
    
    if not component then return nil end
    
    -- Şu anki kıyafet bilgilerini al
    local currentDrawable = GetPedDrawableVariation(ped, component.componentId)
    local currentTexture = GetPedTextureVariation(ped, component.componentId)
    local currentPalette = GetPedPaletteVariation(ped, component.componentId)
    
    -- Boş drawable ID'ler (çıplak/varsayılan)
    local EmptyDrawables = {
        head = -1,
        torso = 15, -- Çıplak üst
        undershirt = 15, -- Çıplak iç
        legs = 14, -- Şort
        shoes = 34, -- Çıplak ayak
        bag = 0, -- Çanta yok
        accessory = -1, -- Aksesuar yok
        mask = 0, -- Maske yok
    }
    
    -- Animasyon oynat
    RequestAnimDict(Config.RemoveClothingAnim.dict)
    while not HasAnimDictLoaded(Config.RemoveClothingAnim.dict) do
        Wait(100)
    end
    TaskPlayAnim(ped, Config.RemoveClothingAnim.dict, Config.RemoveClothingAnim.anim, 8.0, -8.0, Config.RemoveClothingAnim.duration, 0, 0, false, false, false)
    
    Wait(Config.RemoveClothingAnim.duration)
    
    -- Kıyafeti çıkar (varsayılan/boş hale getir)
    local emptyDrawable = EmptyDrawables[slotName] or 0
    SetPedComponentVariation(ped, component.componentId, emptyDrawable, 0, 0)
    
    ActiveClothing[slotName] = nil
    
    ClearPedTasks(ped)
    
    -- Çıkarılan kıyafet bilgilerini döndür
    return {
        slot = slotName,
        drawableId = currentDrawable,
        textureId = currentTexture,
        paletteId = currentPalette,
        label = GetClothingLabel(slotName, currentDrawable)
    }
end

-- Kıyafet etiketi oluştur
function GetClothingLabel(slotName, drawableId)
    local labels = {
        head = 'Şapka/Baret #' .. drawableId,
        torso = 'Gömlek/Mont #' .. drawableId,
        undershirt = 'Atlet/İç Gömlek #' .. drawableId,
        legs = 'Pantolon #' .. drawableId,
        shoes = 'Ayakkabı #' .. drawableId,
        bag = 'Çanta #' .. drawableId,
        accessory = 'Aksesuar #' .. drawableId,
        mask = 'Maske #' .. drawableId,
    }
    return labels[slotName] or 'Kıyafet #' .. drawableId
end

-- Mevcut kıyafetleri al
function GetCurrentClothing()
    local ped = PlayerPedId()
    local clothing = {}
    
    for slotName, component in pairs(ClothingComponents) do
        local drawable = GetPedDrawableVariation(ped, component.componentId)
        local texture = GetPedTextureVariation(ped, component.componentId)
        local palette = GetPedPaletteVariation(ped, component.componentId)
        
        -- Boş değilse ekle
        if drawable ~= nil and drawable >= 0 then
            clothing[slotName] = {
                drawableId = drawable,
                textureId = texture,
                paletteId = palette,
                label = GetClothingLabel(slotName, drawable)
            }
        end
    end
    
    return clothing
end

-- Kıyafet düşür (yerde obje oluştur)
function DropClothing(clothingData)
    if not clothingData then return end
    
    local ped = PlayerPedId()
    local coords = GetEntityCoords(ped)
    local forward = GetEntityForwardVector(ped)
    
    -- Önünde düşür
    local dropCoords = vector3(
        coords.x + forward.x * Config.DropOffset.y,
        coords.y + forward.y * Config.DropOffset.y,
        coords.z + Config.DropOffset.z
    )
    
    -- Server'a düşürme isteği gönder
    TriggerServerEvent('swx_clothing:dropClothing', clothingData, dropCoords)
    
    -- Animasyon
    TaskPlayAnim(ped, 'pickup_object', 'pickup_low', 8.0, -8.0, 1000, 0, 0, false, false, false)
end

-- Export fonksiyonlar
exports('WearClothing', WearClothing)
exports('RemoveClothing', RemoveClothing)
exports('GetCurrentClothing', GetCurrentClothing)
exports('DropClothing', DropClothing)
