Config = {}

Config.FarmZones = {
    {
        name = "Domates Tarlası",
        product = "domates",
        dirtyItem = "kirli_domates",
        cleanItem = "domates",
        center = vector3(243.87, 6460.59, 31.39),
        radius = 24.0,
        propCount = 20,
        propModel = `prop_veg_crop_01`,    -- Domatesin özel prop modeli
        anim = { dict = "amb@world_human_gardener_plant@male@enter", name = "enter" }
    },
    {
        name = "Soğan Tarlası",
        product = "sogan",
        dirtyItem = "kirli_sogan",
        cleanItem = "sogan",
        center = vector3(261.66, 6630.61, 29.18),
        radius = 20.0,
        propCount = 12,
        propModel = `prop_creosote_b_01`,
        anim = { dict = "amb@world_human_gardener_plant@male@base", name = "base" }
    },
}

Config.WashStations = {
    {
        coords = vector3(87.73, 713.59, 197.73),
        radius = 3.0,
        label = "Sebzeleri Yıka"
    }
}

Config.RespawnTime = 3600000 -- milisaniye (1 saat)
Config.RequiredItem = "pickaxe"
