Config = {}

-- Anahtar mesafesi (metre)
Config.KeyRange = 50.0

-- Animasyon süresi (ms)
Config.AnimationDuration = 1500

-- Bildirim süresi (ms)
Config.NotifyDuration = 3000

-- Menü tuşu (varsayılan K - M tuşu swx_speaker tarafından kullanılıyor)
Config.MenuKey = 'K'

-- Uzaktan çalıştırma yapılabilecek özel araçlar (model kodları)
-- Şu an sadece Dodge Challenger (redeye) için aktif
Config.AllowedVehicles = {
    ['redeye'] = true,  -- Dodge Challenger
    -- ['skyline'] = true,  -- Nissan Skyline (aktif edilecek)
    -- ['r820'] = true,     -- Audi R8 (aktif edilecek)
}

-- Araç bulunamadığında hata mesajı
Config.Messages = {
    no_vehicle = 'Yakınızda araç bulunamadı!',
    too_far = 'Araç çok uzakta!',
    no_keys = 'Bu aracın anahtarına sahip değilsiniz!',
    engine_on = 'Araç çalıştırıldı!',
    engine_off = 'Araç stop edildi!',
    menu_title = 'Araç Kontrolü',
    no_allowed_vehicle = 'Uzaktan çalıştırma destekleyen araç bulunamadı! (Şu an sadece Dodge Challenger)',
    vehicle_not_supported = 'Bu araç uzaktan çalıştırma desteklemiyor!'
}
