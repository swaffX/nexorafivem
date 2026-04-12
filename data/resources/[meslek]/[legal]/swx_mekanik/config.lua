Config = {}

-- Mekanik job adi (qb-core/shared/jobs.lua'dan)
Config.MechanicJobs = { 'mechanic', 'mechanic2', 'mechanic3', 'beeker', 'bennys' }

-- Tamir edilebilir parcalar
Config.Parts = {
    { id = 'engine',   label = 'Motor',             price = 800,  wheelIndex = -1 },
    { id = 'body',     label = 'Kaporta / Boya',    price = 600,  wheelIndex = -1 },
    { id = 'bonnet',   label = 'On Kaporta',        price = 350,  wheelIndex = -1 },
    { id = 'boot',     label = 'Bagaj Kapagi',      price = 300,  wheelIndex = -1 },
    { id = 'wheel_lf', label = 'Sol On Tekerlek',   price = 200,  wheelIndex = 0  },
    { id = 'wheel_rf', label = 'Sag On Tekerlek',   price = 200,  wheelIndex = 1  },
    { id = 'wheel_lr', label = 'Sol Arka Tekerlek', price = 200,  wheelIndex = 2  },
    { id = 'wheel_rr', label = 'Sag Arka Tekerlek', price = 200,  wheelIndex = 3  },
}

-- Tamir suresi (ms) - her parca icin
Config.RepairDuration = 7000

-- Parca ile etkilesim mesafesi (metre)
Config.InteractDistance = 3.0

-- En yakin oyuncu tarama mesafesi
Config.ScanPlayerDistance = 20.0

-- Mekanik anim
Config.RepairAnim = {
    dict = 'mini@repair',
    anim = 'fixing_a_player'
}

-- Zone marker renkleri
Config.MarkerPending   = { r = 255, g = 165, b = 0,   a = 180 }  -- Turuncu: bekliyor
Config.MarkerCompleted = { r = 0,   g = 200, b = 80,  a = 180 }  -- Yesil: tamamlandi
