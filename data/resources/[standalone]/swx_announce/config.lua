Config = {}

-- Admin grup izinleri
Config.AllowedGroups = {
    ['admin'] = true,
    ['god'] = true,
    ['mod'] = true,
}

-- Bildirim süresi (ms)
Config.NotifyDuration = 8000

-- Bildirim pozisyonu: 'top', 'top-right', 'top-left', 'center', 'bottom'
Config.NotifyPosition = 'top'

-- Bildirim başlık stili
Config.TitleStyle = 'DUYURU'

-- Bildirim iconu (Lucide icon ismi)
Config.Icon = 'megaphone'

-- Bildirim rengi: 'info', 'success', 'warning', 'error'
Config.NotifyType = 'info'
