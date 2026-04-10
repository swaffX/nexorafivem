Config = {}

-- Karşılama başlığı
Config.WelcomeTitle = '🎉 Nexora Roleplay\'e Hoş Geldin!'

-- Karşılama mesajları (sırayla gösterilecek)
Config.Messages = {
    {
        title = 'Başlangıç Hediyelerin!',
        description = 'Yeni karakterin için başlangıç itemleri envanterine eklendi.',
        icon = 'gift',
        duration = 8000
    },
    {
        title = 'İş Merkezi',
        description = 'Hayatına başlamak için iş merkezine gitmelisin. GPS\'inde işaretlendi!',
        icon = 'briefcase',
        duration = 8000
    },
    -- YARDIM MENÜSÜ KALDIRILDI - /yardım komutu kullanılmıyor
    {
        title = 'Araç Kiralama!',
        description = 'Yakınındaki Görevliden E tuşunu kullanarak Araç kiralama menüsüne erişip araç kiralayabilirsin!',
        icon = 'car',
        duration = 8000
    },
    {
        title = 'Bol Şans!',
        description = 'Nexora Roleplay ailesine hoş geldin. İyi eğlenceler!',
        icon = 'sparkles',
        duration = 5000
    }
}

-- Başlangıç itemleri (qb-inventory için)
-- NOT: phone yerine white_phone (beyaz telefon), bandaj kaldırıldı, su eklendi
Config.StarterItems = {
    {name = 'white_phone', amount = 1},  -- Beyaz telefon (phone yerine)
    {name = 'water', amount = 2},        -- Su (içecek)
    {name = 'sandwich', amount = 2},     -- Sandviç (yiyecek)
    -- {name = 'bandage', amount = 3},   -- BANDAJ KALDIRILDI
}

-- Başlangıç parası
Config.StarterCash = 500
Config.StarterBank = 2500

-- Karşılama süresi (toplam, saniye)
Config.WelcomeDuration = 30

-- Karakter oluşturma sonrası bekleme süresi (saniye)
Config.DelayAfterCharacterCreate = 3

-- İş merkezi koordinatları (GPS işareti için)
Config.JobCenterCoords = vector3(-268.0, -956.0, 31.0)

-- UI pozisyonu: 'left' veya 'bottom'
Config.UIPosition = 'left'

-- Yeni oyuncu kontrol veritabanı tablosu (MySQL için)
Config.UseDatabase = true
Config.DBTable = 'player_first_join'
