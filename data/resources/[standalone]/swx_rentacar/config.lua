Config = {}

-- NPC Konumu (Ekran görüntüsündeki konum - YERE INDIRILDI)
Config.NPCLocation = vector4(-1039.28, -2730.74, 19.1, 226.21)

-- NPC Modeli (galerideki gibi)
Config.NPCModel = "s_m_m_autoshop_01"

-- Araç Spawn Konumları (Ekrandaki Ped Coordinates konumu)
Config.SpawnLocations = {
    vector4(-1033.85, -2728.22, 20.16, 230.52),
}

-- Kiralanabilir Araçlar
Config.RentVehicles = {
    {
        model = "asea",
        label = "Karin Asea",
        price = 100,
        image = "asea.png",
        description = "Ekonomik sedan, günlük kullanım için ideal"
    },
    {
        model = "faggio",
        label = "Faggio",
        price = 50,
        image = "faggio.png",
        description = "Ekonomik scooter, şehir içi ulaşım için mükemmel"
    }
}

-- Hosgeldin Mesaji (Baloncuk) - Turkce karakterler kaldirildi
Config.WelcomeMessage = {
    title = "Nexora Roleplay'e Hosgeldin!",
    subtitle = "Sunucumuzda Keyifli Vakitler Gecirmeni Dileriz!",
    duration = 5000 -- 5 saniye
}

-- Kiralama süresi (dakika) - 0 = sınırsız (manuel iade)
Config.RentDuration = 0

-- Maksimum kiralama süresi (saat) - 24 saat sonra otomatik geri al
Config.MaxRentHours = 24

-- Ödeme hesabı (cash veya bank)
Config.PaymentAccount = "cash"

-- Blip ayarları
Config.Blip = {
    enabled = true,
    sprite = 326, -- Kiralama ikonu
    color = 5,    -- Sarı
    scale = 0.8,
    label = "Araç Kiralama"
}

-- Mesafe ayarları
Config.InteractDistance = 2.0
Config.DrawTextDistance = 5.0

-- Debug mod
Config.Debug = false

-- Araç Anahtarı Verme Fonksiyonu
Config.GiveCarKeys = function(plate)
    if not plate then return end
    -- qb-vehiclekeys için (event)
    TriggerEvent('vehiclekeys:client:SetOwner', plate)
    -- Alternatif: qb-vehiclekeys export (eğer varsa)
    -- exports['qb-vehiclekeys']:GiveKeys(plate)
end

-- Araç Anahtarını Silme Fonksiyonu (çıkış yapınca / süre dolunca)
Config.RemoveCarKeys = function(plate)
    if not plate then return end
    -- qb-vehiclekeys için anahtarı sil
    TriggerEvent('vehiclekeys:client:RemoveOwner', plate)
end
