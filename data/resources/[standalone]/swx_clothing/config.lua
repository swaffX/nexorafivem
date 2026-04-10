Config = {}

-- Kıyafet slotları
Config.ClothingSlots = {
    {name = 'head', label = 'Kafa', icon = 'hat-cowboy', slot = 1},
    {name = 'torso', label = 'Üst Giyim', icon = 'shirt', slot = 2},
    {name = 'undershirt', label = 'İç Giyim', icon = 'vest', slot = 3},
    {name = 'legs', label = 'Alt Giyim', icon = 'socks', slot = 4},
    {name = 'shoes', label = 'Ayakkabı', icon = 'shoe-prints', slot = 5},
    {name = 'bag', label = 'Çanta', icon = 'suitcase', slot = 6},
    {name = 'accessory', label = 'Aksesuar', icon = 'gem', slot = 7},
    {name = 'mask', label = 'Maske', icon = 'mask', slot = 8},
}

-- Kıyafet itemleri için metadata formatı
Config.ClothingItemFormat = 'clothing_%s_%d' -- clothing_torso_123

-- Kıyafet çıkartma animasyonu
Config.RemoveClothingAnim = {
    dict = 'clothingshirt',
    anim = 'try_shirt_negative_a',
    duration = 1200
}

-- Kıyafet giyme animasyonu
Config.WearClothingAnim = {
    dict = 'clothingshirt',
    anim = 'try_shirt_positive_a',
    duration = 1200
}

-- Oyuncudan kıyafet arama mesafesi
Config.SearchDistance = 2.0

-- Kıyafet düşürme koordinat offset (önünde düşsün)
Config.DropOffset = {
    x = 0.0,
    y = 1.0,
    z = 0.0
}

-- Ağırlık limitleri
Config.MaxInventoryWeight = 50.0
Config.DefaultClothingWeight = 0.5

-- Komutlar
Config.Commands = {
    inventory = 'envanter',
    clothing = 'kiyafet',
    searchPlayer = 'ara'
}

-- UI Ayarları
Config.UI = {
    rows = 5,
    cols = 8,
    slotSize = 75,
    clothingPanelWidth = 250
}
