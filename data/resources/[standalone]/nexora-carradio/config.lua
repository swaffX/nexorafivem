Config = {}

-- Menü açma tuşu (varsayılan: K)
Config.OpenKey = 311 -- K tuşu

-- Ses ayarları
Config.DefaultVolume = 0.5 -- 0.0 - 1.0
Config.MaxDistance = 30.0 -- Maksimum duyulma mesafesi (metre)

-- Bass/Tiz ayarları
Config.DefaultBass = 0 -- -10 ile +10 arası
Config.DefaultTreble = 0 -- -10 ile +10 arası

-- Playlist kaydetme
Config.SavePlaylist = true -- Oyuncu çıkınca playlist'i kaydet

-- Dil
Config.Locale = 'tr'

Config.Locales = {
    ['tr'] = {
        ['open_menu'] = 'Araç Radyosu',
        ['not_in_vehicle'] = 'Araçta değilsin!',
        ['not_driver'] = 'Sürücü koltuğunda değilsin!',
        ['music_playing'] = 'Müzik çalıyor',
        ['music_stopped'] = 'Müzik durduruldu',
        ['invalid_url'] = 'Geçersiz URL!',
        ['volume_changed'] = 'Ses seviyesi değiştirildi',
    }
}
