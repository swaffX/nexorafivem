Config = {}

-- Komut ayarları
Config.Command = "ap"

-- Hareket ayarları
Config.MoveSpeed = 0.05 -- Varsayılan hareket hızı
Config.MinSpeed = 0.01
Config.MaxSpeed = 0.5
Config.SpeedStep = 0.05

-- Maksimum hareket mesafesi (başlangıç noktasından)
Config.MaxDistance = 10.0

-- Dil ayarları
Config.Lang = {
    ["active"] = "Animpose aktif - Pozisyonu ayarlayın",
    ["confirmed"] = "Pozisyon onaylandı",
    ["cancelled"] = "Pozisyon iptal edildi",
    ["already_active"] = "Animpose zaten aktif",
    ["too_far"] = "Çok uzaklaştınız!"
}
