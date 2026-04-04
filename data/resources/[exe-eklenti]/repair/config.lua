Config = Config or {}

-------------------
-- Utility
-------------------
Config.Framework = "NEW" -- "NEW" -> New qbcore | "OLD" -> Old qbcore

-------------------
-- Stations
-------------------
Config["Repairs"] = {
    vector3(148.97, 321.53, 111.14), 
    vector3(769.82, -1866.97, 28.29), 
    vector3(-1536.31, -579.6, 24.71), 
    vector3(259.4, 2586.71, 44.13), 
    -- You can add more locations
}

Config.Function = 'all' -- Functions: "repair" - Only repair vehicle. | "colour" - Only change a colour. | "all" - Repair & Colour
Config.Payment = 'cash' -- You can put: OFF or cash
Config.Amount = 1000 -- Paymant amount if you use 'cash'

-------------------
-- Language
-------------------
Config["Language"] = {
    ["QBTarget"] = {
        ["Falar"] = "Boya ve Tamir Et",
        ["Reparar"] = "Tamir",
        ["Pintar"] = "Boya Degistir",
        ["Icon"] = "fas fa-car",
    },
    ["ProgressBars"] = {
        ["Reparar"] = "Arac Boyanıyor",
        ["Pintar"] = "Arac Boyanıyor.."
    },
    ['Notificacoes'] = {
        ["SemGuita"] = "Yeterli Paran Yok"
    }
}

----------------------
-- Blip
----------------------
Config.BlipRepair = {
    Enable = true,
    Name = "Boya ve Tamir",
    Sprite = 253,
    Scale = 0.6,
    Colour = 4,
}

----------------------
-- Peds
----------------------
Config.PedListRepairs = { -- Peds that will be spawned in
    {
        model = "s_m_y_armymech_01",                                                         
        coords = vector3(148.97, 321.53, 111.14),           
        heading = 88.45,
        gender = "male",
        scenario = "WORLD_HUMAN_STAND_MOBILE_UPRIGHT" 
    },
    {
        model = "s_m_y_armymech_01",                                                         
        coords = vector3(769.82, -1866.97, 28.29),           
        heading = 288.45,
        gender = "male",
        scenario = "WORLD_HUMAN_STAND_MOBILE_UPRIGHT" 
    },
    {
        model = "s_m_y_armymech_01",                                                         
        coords = vector3(-1536.31, -579.6, 24.71),           
        heading = 88.45,
        gender = "male",
        scenario = "WORLD_HUMAN_STAND_MOBILE_UPRIGHT" 
    },
    {
        model = "s_m_y_armymech_01",                                                         
        coords = vector3(259.4, 2586.71, 44.13),           
        heading = 88.00,
        gender = "male",
        scenario = "WORLD_HUMAN_STAND_MOBILE_UPRIGHT" 
    },
}