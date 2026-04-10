Config = {}

-- NPC Konumu (Ekran görüntüsündeki konum)
Config.NPCLocation = vector4(-1039.28, -2730.74, 20.21, 226.21)

-- NPC Modeli (galerideki gibi)
Config.NPCModel = "s_m_m_autoshop_01"

-- Araç Spawn Konumları (NPC'nin yakınında)
Config.SpawnLocations = {
    vector4(-1045.28, -2732.74, 20.21, 145.0),
    vector4(-1042.28, -2728.74, 20.21, 145.0),
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

-- Hoşgeldin Mesajı (Baloncuk)
Config.WelcomeMessage = {
    title = "Nexora Roleplay'e Hoşgeldin!",
    subtitle = "Sunucumuzda Keyifli Vakitler Geçirmeni Dileriz!",
    duration = 5000 -- 5 saniye
}

-- Kiralama süresi (dakika) - 0 = sınırsız (manuel iade)
Config.RentDuration = 0

-- Maksimum kiralama süresi (saat) - otomatik iade için
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
