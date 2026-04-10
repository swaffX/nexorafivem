Config = {}

-- Anahtar mesafesi (metre)
Config.KeyRange = 50.0

-- Animasyon süresi (ms)
Config.AnimationDuration = 1500

-- Bildirim süresi (ms)
Config.NotifyDuration = 3000

-- Menü tuşu (varsayılan K - M tuşu swx_speaker tarafından kullanılıyor)
Config.MenuKey = 'K'

-- Uzaktan çalıştırma - TÜM ARAÇLAR İÇİN AKTİF
-- İstenirse sadece belirli araçlar kısıtlanabilir (şu an tüm araçlar açık)
Config.AllowedVehicles = nil -- nil = tüm araçlar izinli
-- Eğer sadece belirli araçlar istenirse:
-- Config.AllowedVehicles = {
--     ['redeye'] = true,
--     ['skyline'] = true,
-- }

-- Araç bulunamadığında hata mesajı
Config.Messages = {
    no_vehicle = 'Yakınızda araç bulunamadı!',
    too_far = 'Araç çok uzakta!',
    no_keys = 'Bu aracın anahtarına sahip değilsiniz!',
    engine_on = 'Araç çalıştırıldı!',
    engine_off = 'Araç stop edildi!',
    menu_title = 'Araç Kontrolü',
    no_allowed_vehicle = 'Yakında uzaktan çalıştırabileceğin bir araç yok!',
    vehicle_not_supported = 'Bu araç uzaktan çalıştırma desteklemiyor!'
}
