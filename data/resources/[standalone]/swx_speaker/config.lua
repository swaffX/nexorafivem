Config = {}

-- Menü açma tuşu (wais-hudv6 M tuşu pasif, buraya entegre edildi)
Config.OpenKey = 'M'

-- Ses ayarları
Config.DefaultVolume = 0.2  -- 0.10-1.5 arası
Config.MaxDistance = 45.0   -- 1.0-75.0 arası

-- Bass ayarları (xsound desteklemiyor, kaldırıldı)
-- Config.DefaultBass = 0

-- Playlist
Config.MaxPlaylistSize = 50
Config.MaxHistorySize = 50

-- Otomatik müzik yeniden başlatma (YouTube timeout sorunu için)
Config.AutoRestartOnStop = true  -- Müzik durunca otomatik yeniden başlat
Config.AutoRestartDelay = 2000   -- Yeniden başlatma öncesi bekleme (ms)
