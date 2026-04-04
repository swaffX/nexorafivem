Config = {}

-- Discord Webhook URL (BURAYA KENDİ WEBHOOK URL'NİZİ YAZIN)
Config.WebhookURL = "https://discord.com/api/webhooks/1489866726027038822/VPbS9abzK3tPwuKeboSYYlVtlTqDSafIgTYVyMgf2tK4Iqp4ILuAwOqtsxHi6csCYc50"

-- Webhook ayarları
Config.WebhookName = "Nexora Performans Monitörü"
Config.WebhookAvatar = "" -- Webhook avatar URL (opsiyonel)
Config.WebhookColor = 3447003 -- Embed rengi (mavi)
Config.ErrorColor = 15158332 -- Hata rengi (kırmızı)
Config.WarningColor = 15105570 -- Uyarı rengi (turuncu)
Config.SuccessColor = 3066993 -- Başarı rengi (yeşil)

-- Performans eşik değerleri
Config.FPSDropThreshold = 25 -- Bu FPS'nin altına düşerse uyarı gönderilir
Config.HighMSThreshold = 8.0 -- Script ms değeri bu üstüne çıkarsa uyarı (ms)
Config.CriticalMSThreshold = 16.0 -- Kritik ms eşiği

-- Kontrol aralıkları (milisaniye)
Config.CheckInterval = 30000 -- Ne sıklıkla kontrol (30 saniye)
Config.ReportInterval = 300000 -- Periyodik rapor gönderme (5 dakika)

-- Spam koruması
Config.CooldownTime = 120 -- Aynı uyarıyı en az kaç saniyede bir gönder
Config.MaxAlertsPerMinute = 5 -- Dakikada maksimum uyarı sayısı

-- İzleme ayarları
Config.MonitorFPS = true -- FPS izleme
Config.MonitorResourceUsage = true -- Resource kullanım izleme
Config.PeriodicReport = true -- Periyodik rapor gönder
Config.MonitorErrors = true -- Script hatalarını izle

-- Loglama
Config.LogToConsole = true -- Konsola da yazdır
Config.DetailedLog = false -- Detaylı loglama (debug için)
