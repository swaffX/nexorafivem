Config = {}

-- Menü açma tuşu (wais-hudv6 M tuşu pasif, buraya entegre edildi)
Config.OpenKey = 'M'

-- Ses ayarları - DİĞER OYUNCULAR DUYABİLSİN İÇİN YÜKSELTİLDİ
Config.DefaultVolume = 0.6  -- 0.10-1.5 arası (Daha yüksek ses)
Config.MaxDistance = 60.0   -- 1.0-75.0 arası (Daha geniş alan)

-- Bass ayarları (xsound desteklemiyor, kaldırıldı)
-- Config.DefaultBass = 0

-- Playlist
Config.MaxPlaylistSize = 50
Config.MaxHistorySize = 50

-- Otomatik müzik yeniden başlatma KAPALI (sonsuz döngü yapıyordu)
Config.AutoRestartOnStop = false  -- Müzik durunca otomatik yeniden başlat (KAPALI)
Config.AutoRestartDelay = 2000   -- Yeniden başlatma öncesi bekleme (ms)
