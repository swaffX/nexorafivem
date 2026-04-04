--[[
    ['Innocence'] = {
    settings = {
        label = 'Bennys Motorworks', -- Text label for anything that wants it
        welcomeLabel = "Welcome to Benny's Motorworks!", -- Welcome label in the UI
        enabled = true, -- If the location can be used at all
    },
    blip = {
        label = 'Bennys Motorworks',
        coords = vector3(-205.6992, -1312.7377, 31.1588),
        sprite = 72,
        scale = 0.65,
        color = 0,
        display = 4,
        enabled = true,
    },
    categories = { -- Only include the categories you want. A category not listed defaults to FALSE.
        mods = true, -- Performance Mods
        repair = true,
        armor = true,
        respray = true,
        liveries = true,
        wheels = true,
        tint = true,
        plate = true,
        extras = true,
        neons = true,
        xenons = true,
        horn = true,
        turbo = true,
        cosmetics = true, -- Cosmetic Mods
    },
    drawtextui = {
        text = "Bennys Motorworks",
    },
    restrictions = { -- A person must pass ALL the restriction checks. Remove an item below to automatically pass that check.
        job = "any", -- Allowed job. Can be an array of strings for multiple jobs. Any for all jobs
        gang = "any", -- Allowed gang. Can be an array of strings for multiple gangs. Any for all gangs
        allowedClasses = {}, -- Array of allowed classes. Empty will allow any but denied classes.
        deniedClasses = {}, -- Array of denied classes.
    },
    zones = {
        { coords = vector3(-212.55, -1320.56, 31.0), length = 6.0, width = 4.0, heading = 270.0, minZ = 29.88, maxZ = 33.48 },
        { coords = vector3(-222.47, -1329.73, 31.0), length = 6.0, width = 4.4, heading = 270.0, minZ = 29.88, maxZ = 33.48 },
    }
},

Vehicle Classes:
0: Compacts     1: Sedans       2: SUVs         3: Coupes       4: Muscle       5: Sports Classics
6: Sports       7: Super        8: Motorcycles  9: Off-road     10: Industrial  11: Utility
12: Vans        13: Cycles      14: Boats       15: Helicopters 16: Planes      17: Service
18: Emergency   19: Military    20: Commercial  21: Trains
 ]]

Config = Config or {}

Config.Locations = {
    ['police'] = {
        settings = {
            label = 'LSPD Mekanik',
            welcomeLabel = "LSPD Mekaniğe Hoşgeldiniz!",
            enabled = true,
        },
        blip = {
            label = 'LSPD Mekanik',
            coords = vector3(450.06, -976.04, 25.31),
            sprite = 72,
            scale = 0.65,
            color = 0,
            display = 4,
            enabled = false,
        },
        categories = {
            mods = true,
            turbo = true,
            repair = true,
            respray = true,
            liveries = true,
            wheels = true,
            tint = true,
            plate = true,
            extras = true,
            neons = true,
            xenons = true,
            horn = true,
            cosmetics = true,
        },
        drawtextui = {
            text = "Mekanik Alanı"
        },
        restrictions = {
            job = { 'police'}
            },
        zones = {
            { coords = vector3(450.06, -976.04, 25.31), length = 6.0, width = 4.0, heading = 270.0, minZ = 20.88, maxZ = 26.48 },
            { coords = vector3(435.44, -976.17, 25.31), length = 6.0, width = 4.0, heading = 270.0, minZ = 20.88, maxZ = 26.48 },
        }
    },
    ['BCSO'] = {
        settings = {
            label = 'BCSO Mekanik',
            welcomeLabel = "BCSO Mekaniğe Hoşgeldiniz!",
            enabled = true,
        },
        blip = {
            label = 'BCSO Mekanik',
            coords = vector3(450.06, -976.04, 25.31),
            sprite = 72,
            scale = 0.65,
            color = 0,
            display = 4,
            enabled = false,
        },
        categories = {
            mods = true,
            turbo = true,
            repair = true,
            respray = true,
            liveries = true,
            wheels = true,
            tint = true,
            plate = true,
            extras = true,
            neons = true,
            xenons = true,
            horn = true,
            cosmetics = true,
        },
        drawtextui = {
            text = "Mekanik Alanı"
        },
        restrictions = {
            job = { 'bcso'}
            },
        zones = {
            { coords = vector3(1876.5, 3699.04, 32.83), length = 6.0, width = 4.0, heading = 214.0, minZ = 30.88, maxZ = 35.48 },
        }
    },
    ['PALETO'] = {
        settings = {
            label = 'PALETO Mekanik',
            welcomeLabel = "PALETO Mekaniğe Hoşgeldiniz!",
            enabled = true,
        },
        blip = {
            label = 'PALETO Mekanik',
            coords = vector3(450.06, -976.04, 25.31),
            sprite = 72,
            scale = 0.65,
            color = 0,
            display = 4,
            enabled = false,
        },
        categories = {
            mods = true,
            turbo = true,
            repair = true,
            respray = true,
            liveries = true,
            wheels = true,
            tint = true,
            plate = true,
            extras = true,
            neons = true,
            xenons = true,
            horn = true,
            cosmetics = true,
        },
        drawtextui = {
            text = "Mekanik Alanı"
        },
        restrictions = {
            job = { 'paleto'}
            },
        zones = {
            { coords = vector3(-457.85, 6044.46, 30.92), length = 6.0, width = 4.0, heading = 224.0, minZ = 28.88, maxZ = 35.48 },
        }
    },
    ['bennys'] = {
        settings = {
            label = 'Bennys Mekanik',
            welcomeLabel = "Bennys mekaniğe hoşgeldiniz!",
            enabled = true,
        },
        blip = {
            label = 'Bennys Mekanik',
            coords = vector3(-205.6992, -1312.7377, 31.1588),
            sprite = 72,
            scale = 0.65,
            color = 0,
            display = 4,
            enabled = true,
        },
        categories = {
            mods = true,
            turbo = true,
            repair = true,
            respray = true,
            liveries = true,
            wheels = true,
            tint = true,
            plate = true,
            extras = true,
            neons = true,
            xenons = true,
            horn = true,
            cosmetics = true,
        },
        drawtextui = {
            text = "Mekanik Alanı"
        },
        restrictions = {
            job = { 'mechanic'}
            },
        zones = {
            { coords = vector3(-212.55, -1320.56, 31.0), length = 6.0, width = 4.0, heading = 270.0, minZ = 29.88, maxZ = 33.48 },
            { coords = vector3(-222.47, -1329.73, 31.0), length = 6.0, width = 4.0, heading = 270.0, minZ = 29.88, maxZ = 33.48 },
        }
    },
    ['lscustoms'] = {
        settings = {
            label = 'LS Customs Mekanik',
            welcomeLabel = "LS Customs Mekaniğe Hoşgeldiniz!",
            enabled = true,
        },
        blip = {
            label = 'LS Customs',
            coords = vector3(-366.71, -122.06, 38.27),
            sprite = 72,
            scale = 0.65,
            color = 0,
            display = 4,
            enabled = true,
        },
        categories = {
            mods = true,
            turbo = true,
            repair = true,
            respray = true,
            liveries = true,
            wheels = true,
            tint = true,
            plate = true,
            extras = true,
            neons = true,
            xenons = true,
            horn = true,
            cosmetics = true,
        },
        drawtextui = {
            text = "Mekanik Alanı"
        },
        restrictions = {
            job = { 'mechanic2'}
            },
        zones = {
            { coords = vector3(-324.03, -131.85, 38.54), length = 6.0, width = 4.0, heading = 249.18, minZ = 35.88, maxZ = 40.48 },
            { coords = vector3(-320.9, -126.28, 38.56), length = 6.0, width = 4.0, heading = 248.73, minZ = 35.88, maxZ = 40.48 },
            { coords = vector3(-319.4, -119.95, 38.59), length = 6.0, width = 4.0, heading = 248.73, minZ = 35.88, maxZ = 40.48 },
        }
    },
    ['domestic'] = {
        settings = {
            label = 'Domestic Mekanik',
            welcomeLabel = "Domestic Mekaniğe Hoşgeldiniz!",
            enabled = true,
        },
        blip = {
            label = 'Domestic Mekanik',
            coords = vector3(534.7, -185.46, 53.76),
            sprite = 72,
            scale = 0.65,
            color = 0,
            display = 4,
            enabled = true,
        },
        categories = {
            mods = true,
            turbo = true,
            repair = true,
            respray = true,
            liveries = true,
            wheels = true,
            tint = true,
            plate = true,
            extras = true,
            neons = true,
            xenons = true,
            horn = true,
            cosmetics = true,
        },
        drawtextui = {
            text = "Mekanik Alanı"
        },
        restrictions = {
            job = { 'mechanic3'}
            },
        zones = {
            { coords = vector3(543.7, -179.36, 54.07), length = 6.0, width = 4.0, heading = 272.19, minZ = 50.88, maxZ = 55.48 },
            { coords = vector3(544.0, -189.6, 54.07), length = 6.0, width = 4.0, heading = 272.19, minZ = 50.88, maxZ = 55.48 },
            { coords = vector3(534.7, -185.46, 53.76), length = 6.0, width = 4.0, heading = 342.73, minZ = 50.88, maxZ = 55.48 },
        }
    },
    ['hayes'] = {
        settings = {
            label = 'Hayes Mekanik',
            welcomeLabel = "Hayes Mekaniğe Hoşgeldiniz!",
            enabled = true,
        },
        blip = {
            label = 'Hayes Mekanik',
            coords = vector3(-1420.91, -435.31, 35.47),
            sprite = 72,
            scale = 0.65,
            color = 0,
            display = 4,
            enabled = true,
        },
        categories = {
            mods = true,
            turbo = true,
            repair = true,
            respray = true,
            liveries = true,
            wheels = true,
            tint = true,
            plate = true,
            extras = true,
            neons = true,
            xenons = true,
            horn = true,
            cosmetics = true,
        },
        drawtextui = {
            text = "Mekanik Alanı"
        },
        restrictions = {
            job = { 'mechanic4'}
            },
        zones = {
            { coords = vector3(-1423.87, -449.5, 35.49), length = 6.0, width = 4.0, heading = 211.19, minZ = 34.88, maxZ = 37.48 },
            { coords = vector3(-1417.59, -445.61, 35.49), length = 6.0, width = 4.0, heading = 210.7, minZ = 34.88, maxZ = 37.48 },
            { coords = vector3(-1411.98, -441.39, 35.51), length = 6.0, width = 4.0, heading = 212.8, minZ = 34.88, maxZ = 37.48 },
        }
    },

    ['lostmc'] = {
        settings = {
            label = 'Lost MC Mekanik',
            welcomeLabel = "Lost MC Mekaniğe Hoşgeldiniz!",
            enabled = true,
        },
        blip = {
            label = 'Lost MC Mekanik',
            coords = vector3(-1420.91, -435.31, 35.47),
            sprite = 72,
            scale = 0.65,
            color = 0,
            display = 4,
            enabled = false,
        },
        categories = {
            mods = true,
            turbo = true,
            repair = true,
            respray = true,
            liveries = true,
            wheels = true,
            tint = true,
            plate = true,
            extras = true,
            neons = true,
            xenons = true,
            horn = true,
            cosmetics = true,
        },
        drawtextui = {
            text = "Mekanik Alanı"
        },
        restrictions = {
            gang = { 'lostmc'}
            },
        zones = {
            { coords = vector3(984.79, -134.38, 74.06), length = 6.0, width = 4.0, heading = 148.99, minZ = 72.88, maxZ = 77.48 },
            { coords = vector3(982.22, -132.67, 74.06), length = 6.0, width = 4.0, heading = 148.99, minZ = 72.88, maxZ = 77.48 },
            { coords = vector3(993.4, -125.32, 74.06), length = 6.0, width = 4.0, heading = 250.05, minZ = 72.88, maxZ = 77.48 },
        }
    },
}