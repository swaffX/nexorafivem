Config = {}

-- Framework ayarı (qbcore, esx, standalone)
Config.Framework = 'qbcore'

-- Komut
Config.Command = 'vinewood'

-- Yetkili gruplar (QBCore için)
Config.AuthorizedGroups = {
    'god',
    'admin'
}

-- Vinewood harflerinin koordinatları
Config.Letters = {
    {coords = vector3(668.47, 1211.09, 326.06), heading = 343.5, letter = 'V'},
    {coords = vector3(681.39, 1204.18, 326.29), heading = 345.0, letter = 'I'},
    {coords = vector3(696.22, 1199.11, 326.37), heading = 345.0, letter = 'N'},
    {coords = vector3(711.22, 1196.97, 326.22), heading = 345.0, letter = 'E'},
    {coords = vector3(728.87, 1194.60, 326.56), heading = 345.0, letter = 'W'},
    {coords = vector3(745.75, 1187.60, 327.81), heading = 345.0, letter = 'O'},
    {coords = vector3(763.69, 1184.89, 329.15), heading = 345.0, letter = 'O'},
    {coords = vector3(776.69, 1174.89, 326.15), heading = 345.0, letter = 'D'}
}

-- Varsayılan yazı
Config.DefaultText = 'VINEWOOD'

-- Maksimum karakter sayısı
Config.MaxLength = 8

-- Dil
Config.Locale = {
    ['no_permission'] = 'Bu komutu kullanma yetkiniz yok!',
    ['text_changed'] = 'Vinewood yazısı değiştirildi: %s',
    ['text_reset'] = 'Vinewood yazısı sıfırlandı: VINEWOOD',
    ['invalid_length'] = 'Yazı en fazla 8 karakter olabilir!',
    ['enter_text'] = 'Yeni yazıyı girin (max 8 karakter):',
    ['current_text'] = 'Şu anki yazı: %s'
}
