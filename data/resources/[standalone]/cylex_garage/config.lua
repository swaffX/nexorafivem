Config = {}
Config.Framework = "new-qb" -- esx, old-qb, new-qb
Config.Sql = "oxmysql" -- oxmysql, ghmattimysql, mysql-async
Config.LegacyFuel = false
Config.OnlyTakeOutPlacedGarage = false
Config.FuelResource = "LegacyFuel"
Config.Blip = {
    sprite = 357,
    color = 0,
    scale = 0.6,
    label = "Garage"
}

Config.ImpoundBlip = {
    sprite = 67,
    color = 1,
    scale = 0.6,
    label = "Impound"
}

Config.HTML = {
    ["header"] = "NEXORA GARAJ",
    ["description"] = "Nexora Roleplay"
}


Config.Garages = {
    -- Legion Square Garaj
    {
        interaction = vector3(213.98, -809.29, 30.83),
        spawn = vector4(216.67, -787.25, 30.70, 161.68),
        camCoord = vector4(234.57, -785.1, 30.59, -20.0),
    },
    -- Pillbox Hill Garaj
    {
        interaction = vector3(275.95, -344.06, 45.17),
        spawn = vector4(292.79, -332.22, 44.92, 161.25),
        camCoord = vector4(273.08, -335.04, 44.92, -20.0),
    },
    -- Grove Street Garaj
    {
        interaction = vector3(-1183.58, -1509.04, 4.65),
        spawn = vector4(-1183.17, -1502.86, 4.38, 212.08),
        camCoord = vector4(-1188.67, -1497.89, 4.38, 29.0),
    },
    -- Mirror Park Garaj
    {
        interaction = vector3(68.35, 13.85, 69.21),
        spawn = vector4(73.24, 11.78, 68.85, 155.92),
        camCoord = vector4(64.78, 22.19, 69.54, 70.0),
    },
    -- Rockford Hills Garaj
    {
        interaction = vector3(-778.65, 5571.76, 33.49),
        spawn = vector4(-771.36, 5572.43, 33.49, 86.54),
        camCoord = vector4(-778.21, 5569.05, 33.49, 289.38),
    },
    -- Vespucci Garaj
    {
        interaction = vector3(-1158.51, -740.67, 19.89),
        spawn = vector4(-1169.03, -743.49, 19.63, 42.38),
        camCoord = vector4(-1148.57, -754.86, 18.97, -140.0),
    },
    -- La Mesa Garaj
    {
        interaction = vector3(-795.33, -2023.8, 9.17),
        spawn = vector4(-790.11, -2022.68, 8.87, 58.85),
        camCoord = vector4(-766.54, -2037.82, 8.9, -143.0),
    },
    -- Little Seoul Garaj
    {
        interaction = vector3(-468.87, -819.67, 30.52),
        spawn = vector4(-472.16, -812.83, 30.53, 179.63),
        camCoord = vector4(-472.16, -806.15, 30.54, -3.0),
    },
    -- Sandy Shores Garaj
    {
        interaction = vector3(1142.38, 2661.28, 38.16),
        spawn = vector4(1137.57, 2674.86, 38.25, 1.08),
        camCoord = vector4(1127.68, 2664.84, 38.02, 88.0),
    },
    -- Paleto Bay Garaj
    {
        interaction = vector3(83.51, 6420.3, 31.76),
        spawn = vector4(85.93, 6426.8, 31.34, 38.93),
        camCoord = vector4(107.37, 6402.14, 31.33, -138.0),
    },
}

Config.CustomImages = {
    ["fnf4r34"] = ""
}

Config.Translate = {
    ["alreadyspawned"] = "Bu araç zaten dışarıda",
    ["vehicleparked"] = "Araç park edildi",
    ["cannotfind"] = "Aracınızı bulamıyoruz",
    ["transferheader"] = "ARAÇ TRANSFERİ",
    ["accept"] = "Kabul Et",
    ["decline"] = "Reddet",
    ["spawncar"] = "Aracı Çıkar",
    ["goback"] = "Geri Dön",
    ["engine"] = "Motor",
    ["fuel"] = "Yakıt",
    ["gasoline"] = "Benzin",
    ["oillevel"] = "Yağ Seviyesi",
    ["tankhealth"] = "Depo Sağlığı",
    ["totalcars"] = "Toplam Araç",
    ["stored"] = "Garajda",
    ["notstored"] = "Dışarıda",
    ["transfer"] = "Aracınızı buradan transfer edebilirsiniz",
    ["select"] = "Seç",
    ["takeout"] = "Çıkar",
    ["givekey"] = "Anahtar Ver",
    ["favourite"] = "Favori",
    ["spawn"] = "Çıkar",
    ["spawnpointclear"] = "Spawn noktası temiz değil",
}

