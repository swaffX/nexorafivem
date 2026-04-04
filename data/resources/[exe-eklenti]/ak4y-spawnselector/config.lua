-- ak4y dev.

-- IF YOU HAVE ANY PROBLEM OR DO YOU NEED HELP PLS COME TO MY DISCORD SERVER AND CREATE A TICKET
-- IF YOU DONT HAVE ANY PROBLEM YET AGAIN COME TO MY DISCORD :)
-- https://discord.gg/kWwM3Bx

AK4Y = {}
AK4Y.Framework = "qb" -- qb / oldqb | qb = export system | oldqb = triggerevent system

AK4Y.Spawns = {
    ["motel"] = {
        uniqueId = "motel",
        coords = vector4(324.3757, -230.4787, 54.2107, 152.9240),
        title = "MOTEL",
        description = "",
        miniInfo = "",
    },
    ["hospital"] = {
        uniqueId = "hospital",
        coords = vector4(295.5062, -601.6248, 43.5691, 71.1804),
        title = "HASTANE",
        description = "",
        miniInfo = "",
    },
    ["carShop"] = {
        uniqueId = "carShop",
        coords = vector4(-1746.5933, -1112.2319, 13.3241, 293.1711),
        title = "LUNAPARK",
        description = "",
        miniInfo = "",
    },
    ["pdDepartment"] = {
        uniqueId = "pdDepartment",
        coords = vector4(428.6116, -984.4926, 30.7108, 91.1565),
        title = "PD DEPARTMANI",
        description = "",
        miniInfo = "",
    },
    ["sdDepartment"] = {
        uniqueId = "sdDepartment",
        coords = vector4(1848.9854, 3699.5322, 34.2648, 288.0700),
        title = "SHERİFF DEPARTMANI",
        description = "",
        miniInfo = "",
    },
}

AK4Y.Language = {
    ["location"] = "KONUM",
    ["lastLocation"] = "SON KONUM",
}

function playerLoaded() -- it runs when player loaded
    TriggerServerEvent('QBCore:Server:OnPlayerLoaded')
    TriggerEvent('QBCore:Client:OnPlayerLoaded')
end