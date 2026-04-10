Config = {}

Config.SellVehicles = {
    vector3(-45.0163, -1083.18, 26.708)
}

Config.RefundPercent = 70 -- 70% (percentage from original value)
Config.Framework = "QBCore" -- QBCore or ESX or OLDQBCore -- NewESX

function GetFramework()
    local Get = nil
    if Config.Framework == "ESX" then
        while Get == nil do
            TriggerEvent('esx:getSharedObject', function(Set) Get = Set end)
            Citizen.Wait(0)
        end
    end
    if Config.Framework == "NewESX" then
        Get = exports['es_extended']:getSharedObject()
    end
    if Config.Framework == "QBCore" then
        Get = exports["qb-core"]:GetCoreObject()
    end
    if Config.Framework == "OldQBCore" then
        while Get == nil do
            TriggerEvent('QBCore:GetObject', function(Set) Get = Set end)
            Citizen.Wait(200)
        end
    end
    return Get
 end

Config.Vehicles = {
    Car = {
        ['car'] = {
            -- [BAŞLANGIÇ/ECONOMY ARAÇLARI]
            {model='asea',       label='Asea',          price=6500,    category='sedan'},
            {model='emperor',    label='Emperor',       price=8000,    category='sedan'},
            {model='Injection',  label='Injection',     price=12000,   category='jeep'},        
            {model='bifta',      label='Bifta',         price=15000,   category='jeep'},
            {model='rebel2',     label='Rebel',         price=8500,    category='jeep'},
            {model='rancherxl',  label='Rancher XL',    price=18000,   category='jeep'},
            {model='mesa3',      label='Mesa',          price=35000,   category='jeep'},
            
            -- [ORTA SEVİYE SEDANLAR]
            {model='fugitive',   label='Fugitive',      price=18000,   category='luxury'},
            {model='glendale',   label='Glendale',      price=14000,   category='luxury'},
            {model='premier',    label='Premier',       price=16000,   category='luxury'},
            
            -- [SPOR ARABALAR]
            {model='buffalo4',   label='Buffalo STX',   price=42000,   category='sport'},
            {model='drafter',    label='Drafter',       price=55000,   category='sport'},
            {model='jester',     label='Jester',        price=48000,   category='sport'},
            {model='elegy2',     label='Elegy Retro',   price=52000,   category='sport'},
            {model='skyline',    label='Nissan Skyline GT-R34', price=75000,   category='sport'},
            {model='r820',       label='Audi R8 2020',  price=100000,  category='sport'},
            {model='redeye',     label='Dodge Challenger', price=80000, category='sport'},
            {model='cla250',     label='Mercedes Benz CLA 250', price=85000, category='luxury'},
            {model='hermes',     label='Hermes',        price=38000,   category='trunk'},
            {model='blade',      label='Blade',         price=24000,   category='trunk'},
            
            -- [LÜKS ARABALAR]
            {model='zentorno',   label='Zentorno',      price=145000,  category='sport'},
            
            -- [MOTOSİKLETLER]
            {model='bati',       label='Bati',          price=22000,   category='moto'},
            {model='sanchez',    label='Sanchez',       price=9500,    category='moto'},
            {model='avarus',     label='Avarus',        price=15000,   category='moto'},
            
            -- [MUSCLE/CLASSIC]
            {model='buccaneer',  label='Buccaneer',     price=16500,   category='trunk'},
            {model='hotknife',   label='Hotknife',      price=28000,   category='trunk'},
            {model='moonbeam',   label='Moon Beam',     price=22000,   category='trunk'},
            {model='brawler',    label='Brawler',       price=32000,   category='jeep'},
        },

        -- TEKNE VE HAVA ARACI SATIŞI KAPALI
        -- ['boat'] = {
        --   {model='Seashark2',       label='Seashark',          price=45000,    category='boats'},
        --   {model='Seashark3',       label='Seashark3',         price=45000,    category='criminals'},
        --   {model='Submersible2',    label='Submersible2',      price=185000,   category='boats'},
        --   {model='Dinghy4',         label='Dinghy4',           price=55000,    category='boats'},
        --   {model='Dinghy',          label='Dinghy',            price=38000,    category='boats'},
        --   {model='Toro',            label='Toro',              price=125000,   category='boats'},
        -- },

        -- ['aircraft'] = {
        --   {model='Cargobob',        label='Cargobob',          price=450000,    category='military'},
        --   {model='Maverick',        label='Maverick',          price=285000,    category='military'},
        --   {model='Valkyrie2',       label='Valkyrie2',         price=650000,    category='airplane'},
        --   {model='Swift2',          label='Swift2',            price=520000,    category='airplane'},
        -- },


        ['armor'] = {
            -- Standart LSPD Araçları
            {model='police',     label='Police',          price=1600,    category='armor'},
            {model='police2',    label='Police 2',        price=2600,    category='armor'},
            {model='police3',    label='Police 3',        price=3600,    category='armor'},
            -- pdexe Özel Araçlar (pdbike, mrap, hellancpd, nk araçları)
            {model='hellancpd',  label='Hellan CPD',      price=5200,    category='armor'},
            {model='mrap',       label='MRAP',            price=8500,    category='armor'},
            {model='nkbuffalos', label='Buffalo Police',  price=4200,    category='armor'},
            {model='nkcoquette', label='Coquette Police', price=5500,    category='armor'},
            {model='nkcruiser',  label='Cruiser Police',  price=3800,    category='armor'},
            {model='nkgauntlet4',label='Gauntlet Police', price=4800,    category='armor'},
            {model='nkscout',    label='Scout Police',    price=4500,    category='armor'},
            {model='nkscout2020',label='Scout 2020',      price=5000,    category='armor'},
            {model='nktorrence', label='Torrence Police', price=4600,    category='armor'},
            {model='pdbike',     label='Police Bike',     price=1200,    category='armor'},
        },

    },    

    Category = {
        ['car'] = {
            {name="luxury",    trunk='25'},
            {name='jeep',      trunk='50'},
            {name='sport',     trunk='7.5'},
            {name='trunk',     trunk='75'},
            {name='sedan',     trunk='15'},
            {name='universal', trunk='5'},
            {name='moto',      trunk='5'},
        },

        ['boat'] = {
            {name="boats",     trunk='15'},
            {name='criminals', trunk='25'},
        },

        ['aircraft'] = {
            {name="military", trunk='125'},
            {name="airplane", trunk='175'},
        },

        ['armor'] = {
            {name="armor", trunk='125'},
        }



    },

    Color = {
        ['car'] = {
            {R = 132, G = 131, B = 145},
            {R = 141, G = 82 , B = 38},
            {R = 142, G = 148, B = 36},
            {R = 104, G = 146, B = 36},
            {R = 139, G = 80 , B = 24},
            {R = 32 , G = 87 , B = 15},
            {R = 24 , G = 144, B = 10},
            {R = 40 , G = 143, B = 34},
            {R = 130, G = 18 , B = 22},
            {R = 135, G = 35 , B = 39},
            {R = 121, G = 19 , B = 14},
            {R = 4,   G = 32 , B = 14},
            {R = 35 , G = 35 , B = 45},
            {R = 89 , G = 25 , B = 47},
            {R = 64 , G = 62 , B = 23},
            {R = 38 , G = 46 , B = 19},
        },

        ['boat'] = {
            {R = 132, G = 131, B = 145},
            {R = 141, G = 82 , B = 38},
            {R = 142, G = 148, B = 36},
            {R = 104, G = 146, B = 36},
            {R = 139, G = 80 , B = 24},
            {R = 32 , G = 87 , B = 15},
            {R = 24 , G = 144, B = 10},
            {R = 40 , G = 143, B = 34},
            {R = 130, G = 18 , B = 22},
            {R = 135, G = 35 , B = 39},
            {R = 121, G = 19 , B = 14},
            {R = 4,   G = 32 , B = 14},
            {R = 35 , G = 35 , B = 45},
            {R = 89 , G = 25 , B = 47},
            {R = 64 , G = 62 , B = 23},
            {R = 38 , G = 46 , B = 19},   
        },

        ['aircraft'] = {
            {R = 132, G = 131, B = 145},
            {R = 141, G = 82 , B = 38},
            {R = 142, G = 148, B = 36},
            {R = 104, G = 146, B = 36},
            {R = 139, G = 80 , B = 24},
            {R = 32 , G = 87 , B = 15},
            {R = 24 , G = 144, B = 10},
            {R = 40 , G = 143, B = 34},
            {R = 130, G = 18 , B = 22},
            {R = 135, G = 35 , B = 39},
            {R = 121, G = 19 , B = 14},
            {R = 4,   G = 32 , B = 14},
            {R = 35 , G = 35 , B = 45},
            {R = 89 , G = 25 , B = 47},
            {R = 64 , G = 62 , B = 23},
            {R = 38 , G = 46 , B = 19},   
        },

        ['armor'] = {
            {R = 132, G = 131, B = 145},
            {R = 141, G = 82 , B = 38},
            {R = 142, G = 148, B = 36},
            {R = 104, G = 146, B = 36},
            {R = 139, G = 80 , B = 24},
            {R = 32 , G = 87 , B = 15},
            {R = 24 , G = 144, B = 10},
            {R = 40 , G = 143, B = 34},
            {R = 130, G = 18 , B = 22},
            {R = 135, G = 35 , B = 39},
            {R = 121, G = 19 , B = 14},
            {R = 4,   G = 32 , B = 14},
            {R = 35 , G = 35 , B = 45},
            {R = 89 , G = 25 , B = 47},
            {R = 64 , G = 62 , B = 23},
            {R = 38 , G = 46 , B = 19},   
        }
    }
}



CustomizeCamera = function(self)
    isOpen = not self
    DisplayHud(isOpen)
    DisplayRadar(isOpen)
end

Config.GetVehFuel = function(Veh)
    return GetVehicleFuelLevel(Veh)-- exports["LegacyFuel"]:GetFuel(Veh)
end

Config.Carkeys = function(Plate)
    TriggerEvent('vehiclekeys:client:SetOwner', Plate)
end

CustomizePlate = function()
    return string.upper(randomNumber(2) .. randomCharacter(3) .. randomNumber(3))
end

Config.Locations = {
    {
        job = 'police', -- job
        type = 'armor', -- car type
        coords = vector3(439.55, -1011.4, 28.54),
        hash = "a_m_o_soucent_01",
        heading = 174.33,
        marker = "POLICE SHOP",
        blip = {
            ["active"] = true,
            ["name"] = "Police Shop",
            ["colour"] = 29,
            ["id"] = 225
        },
        NuiCarViewSpawnPosition = vector4(-73.5, -822.0, 284.8, 201.5),
        NuiCarViewCameraPosition = {
            posX = -67.0,
            posY = -824.5,
            posZ = 285.5,
            rotX = -9.0,
            rotY = 0,
            rotZ = 74.0,
            fov = 45.00
        },
        TestDriveTime = 60,
        TestDriveSpawnPosition = vector4(-874.34, -3226.6, 13.22, 60.82),
        BuyCarSpawnPositions = {
            [1] = vector4(442.87, -1025.9, 27.71, 3.56),
            [2] = vector4(438.57, -1025.83, 27.78, 352.31),
            [3] = vector4(435.38, -1026.68, 27.84, 347.11),
            [4] = vector4(431.69, -1027.0, 27.91, 345.23),
            [5] = vector4(427.41, -1027.12, 27.99, 346.04)
        },
    }, 

    
    { 
        job = 'all', -- job
        type = 'car',
        coords = vector3(-56.61, -1099.26, 26.86),
        hash = "a_m_o_soucent_01",
        heading = 26.2,
        marker = "VEHICLESHOP",
        blip = {
            ["active"] = true,
            ["name"] = "Galeri",
            ["colour"] = 3,
            ["id"] = 326
        },
        NuiCarViewSpawnPosition = vector4(-73.5, -822.0, 284.8, 201.5),
        NuiCarViewCameraPosition = {
            posX = -67.0,
            posY = -824.5,
            posZ = 285.5,
            rotX = -9.0,
            rotY = 0,
            rotZ = 74.0,
            fov = 45.00
        },
        TestDriveTime = 60,
        TestDriveSpawnPosition = vector4(-874.34, -3226.6, 13.22, 60.82),
        BuyCarSpawnPositions = {
            [1] = vector4(-10.6716, -1096.76, 26.183, 100.5),
            [2] = vector4(-11.4883, -1099.59, 26.180, 100.5),
            [3] = vector4(-12.4124, -1102.35, 26.183, 100.5),
            [4] = vector4(-13.0040, -1105.23, 26.179, 100.5),
            [5] = vector4(-14.5665, -1108.37, 26.183, 100.5)
        },
    }, 

    { 
        job = 'all', -- job
        type = 'boat',
        coords = vector3(-706.262, -1360.31, 4.1021),
        hash = "a_m_o_soucent_01",
        heading = 170.00,
        marker = "Bot Galeri",
        blip = {
            ["active"] = true,
            ["name"] = "Bot Galerisi",
            ["colour"] = 4,
            ["id"] = 427
        },
        NuiCarViewSpawnPosition = vector4(-716.794, -1344.95, 0.1710, 201.5),
        NuiCarViewCameraPosition = {
            posX = -725.602, -- -725.602, -1358.61, 0.1185
            posY = -1358.61,
            posZ = 7.0,
            rotX = -16.0,
            rotY = 0,
            rotZ = -35.0,
            fov = 45.00
        },
        TestDriveTime = 60,
        TestDriveSpawnPosition = vector4(-912.642, -1455.92, 0.1226, 60.82),
        BuyCarSpawnPositions = {
            [1] = vector4(-748.3, -1356.2, 1.13, 231.02),
            [2] = vector4(-754.52, -1361.99, 0.42, 231.65)

        },
    }, 

    { 
        job = 'all', -- job
        type = 'aircraft',
        coords = vector3(1729.02, 3293.57, 40.19),
        hash = "a_m_o_soucent_01",
        heading = 216.16,
        marker = "Ucak Galerisi",
        blip = {
            ["active"] = true,
            ["name"] = "Uçak Galerisi",
            ["colour"] = 4,
            ["id"] = 64
        },
        NuiCarViewSpawnPosition = vector4(-75.3122, -818.490, 326.17, 201.5),
        NuiCarViewCameraPosition = {
            posX = -52.1,
            posY = -825.4,
            posZ = 335.17,
            rotX = -20.0,
            rotY = 0,
            rotZ = 73.2,
            fov = 40.00
        },
        TestDriveTime = 60,
        TestDriveSpawnPosition = vector4(-874.34, -3230.6, 13.22, 60.82),
        BuyCarSpawnPositions = {
            [1] = vector4(1696.33, 3248.07, 39.92, 284.66),
            [2] = vector4(1668.62, 3241.17, 39.66, 284.33)
           
        },
    }, 

}


EYES = {}
EYES.Functions = {
    CreateBlips = function()
        for k,v in pairs(Config.Locations) do 
            if v.blip["active"] then 
            local blip = AddBlipForCoord(v.coords)
            SetBlipSprite(blip, v.blip["id"])
            SetBlipScale(blip, 0.5)
            SetBlipAsShortRange(blip, true)
            SetBlipColour(blip, v.blip["colour"])
            BeginTextCommandSetBlipName("STRING")
            AddTextComponentString(v.blip["name"])
            EndTextCommandSetBlipName(blip)
            end
        end
    end
}







