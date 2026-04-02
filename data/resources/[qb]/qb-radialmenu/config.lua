Config = {}
Config.Keybind = 'F1'           -- FiveM Keyboard, this is registered keymapping, so needs changed in keybindings if player already has this mapped.
Config.Toggle = false           -- use toggle mode. False requires hold of key
Config.UseWhilstWalking = false -- use whilst walking
Config.EnableExtraMenu = false
Config.Fliptime = 15000

Config.MenuItems = {
   
    {
        id = 'citizen',
        title = 'Genel',
        icon = 'user',
        items = {
        {
            id = 'getintrunk',
            title = 'Bagaja Gir',
            icon = 'car',
            type = 'client',
            event = 'qb-trunk:client:GetIn',
            shouldClose = true
        },
        {
            id = 'playerinvehicle',
            title = 'Araca Bindir',
            icon = 'car-side',
            type = 'client',
            event = 'police:client:PutPlayerInVehicle',
            shouldClose = true
        }, {
            id = 'playeroutvehicle',
            title = 'Araçtan Indir',
            icon = 'car-side',
            type = 'client',
            event = 'police:client:SetPlayerOutVehicle',
            shouldClose = true
        }, {
            id = 'stealplayer',
            title = 'Soy',
            icon = 'mask',
            type = 'client',
            event = 'police:client:RobPlayer',
            shouldClose = true
        }, {
            id = 'escort',
            title = 'Kaçır',
            icon = 'user-group',
            type = 'client',
            event = 'police:client:KidnapPlayer',
            shouldClose = true
        }, {
            id = 'escort2',
            title = 'Taşı',
            icon = 'user-group',
            type = 'client',
            event = 'police:client:EscortPlayer',
            shouldClose = true
        }, {
            id = 'escort554',
            title = 'Rehin Al',
            icon = 'child',
            type = 'client',
            event = 'A5:Client:TakeHostage',
            shouldClose = true
        }
        }
    },
    {
        id = 'clothesmenu',
        title = 'Kıyafet',
        icon = 'shirt',
        items = {
            {
                id = 'Hair',
                title = 'Saç',
                icon = 'user',
                type = 'client',
                event = 'qb-radialmenu:ToggleClothing',
                shouldClose = true
            }, {
            id = 'Ear',
            title = 'Kulak',
            icon = 'ear-deaf',
            type = 'client',
            event = 'qb-radialmenu:ToggleProps',
            shouldClose = true
        }, {
            id = 'Neck',
            title = 'Boyun',
            icon = 'user-tie',
            type = 'client',
            event = 'qb-radialmenu:ToggleClothing',
            shouldClose = true
        }, {
            id = 'Top',
            title = 'Ceket',
            icon = 'shirt',
            type = 'client',
            event = 'qb-radialmenu:ToggleClothing',
            shouldClose = true
        }, {
            id = 'Shirt',
            title = 'Tişört',
            icon = 'shirt',
            type = 'client',
            event = 'qb-radialmenu:ToggleClothing',
            shouldClose = true
        }, {
            id = 'Pants',
            title = 'Pantolon',
            icon = 'user',
            type = 'client',
            event = 'qb-radialmenu:ToggleClothing',
            shouldClose = true
        }, {
            id = 'Shoes',
            title = 'Ayakkabı',
            icon = 'shoe-prints',
            type = 'client',
            event = 'qb-radialmenu:ToggleClothing',
            shouldClose = true
        }, {
            id = 'meer',
            title = 'Ekstra',
            icon = 'plus',
            items = {
                {
                    id = 'Hat',
                    title = 'Şapka',
                    icon = 'hat-cowboy-side',
                    type = 'client',
                    event = 'qb-radialmenu:ToggleProps',
                    shouldClose = true
                }, {
                id = 'Glasses',
                title = 'Gözlük',
                icon = 'glasses',
                type = 'client',
                event = 'qb-radialmenu:ToggleProps',
                shouldClose = true
            }, {
                id = 'Visor',
                title = 'Kask',
                icon = 'hat-cowboy-side',
                type = 'client',
                event = 'qb-radialmenu:ToggleProps',
                shouldClose = true
            }, {
                id = 'Mask',
                title = 'Maske',
                icon = 'masks-theater',
                type = 'client',
                event = 'qb-radialmenu:ToggleClothing',
                shouldClose = true
            }, {
                id = 'Vest',
                title = 'Zırh',
                icon = 'vest',
                type = 'client',
                event = 'qb-radialmenu:ToggleClothing',
                shouldClose = true
            }, {
                id = 'Bag',
                title = 'Çanta',
                icon = 'bag-shopping',
                type = 'client',
                event = 'qb-radialmenu:ToggleClothing',
                shouldClose = true
            }, {
                id = 'Bracelet',
                title = 'Bilezik',
                icon = 'user',
                type = 'client',
                event = 'qb-radialmenu:ToggleProps',
                shouldClose = true
            }, {
                id = 'Watch',
                title = 'Saat',
                icon = 'stopwatch',
                type = 'client',
                event = 'qb-radialmenu:ToggleProps',
                shouldClose = true
            }, {
                id = 'Gloves',
                title = 'Eldiven',
                icon = 'mitten',
                type = 'client',
                event = 'qb-radialmenu:ToggleClothing',
                shouldClose = true
            }
            }
        }
        }
    }
}

Config.VehicleDoors = {
    id = 'vehicledoors',
    title = 'Araç Menü',
    icon = 'car-side',
    items = {
        {
            id = 'door0',
            title = 'Sürücü Kapısı',
            icon = 'car-side',
            type = 'client',
            event = 'qb-radialmenu:client:openDoor',
            shouldClose = false
        }, {
        id = 'door4',
        title = 'Kaput',
        icon = 'car',
        type = 'client',
        event = 'qb-radialmenu:client:openDoor',
        shouldClose = false
    }, {
        id = 'door1',
        title = 'Yolcu Kapısı',
        icon = 'car-side',
        type = 'client',
        event = 'qb-radialmenu:client:openDoor',
        shouldClose = false
    }, {
        id = 'door3',
        title = 'Yolcu Arka',
        icon = 'car-side',
        type = 'client',
        event = 'qb-radialmenu:client:openDoor',
        shouldClose = false
    }, {
        id = 'door5',
        title = 'Bagaj',
        icon = 'car',
        type = 'client',
        event = 'qb-radialmenu:client:openDoor',
        shouldClose = false
    }, {
        id = 'door2',
        title = 'Sürücü Arka',
        icon = 'car-side',
        type = 'client',
        event = 'qb-radialmenu:client:openDoor',
        shouldClose = false
    }
    }
}

Config.VehicleExtras = {
    id = 'vehicleextras',
    title = 'Araç Ekstra',
    icon = 'plus',
    items = {
        {
            id = 'extra1',
            title = 'Extra 1',
            icon = 'box-open',
            type = 'client',
            event = 'qb-radialmenu:client:setExtra',
            shouldClose = false
        }, {
        id = 'extra2',
        title = 'Extra 2',
        icon = 'box-open',
        type = 'client',
        event = 'qb-radialmenu:client:setExtra',
        shouldClose = false
    }, {
        id = 'extra3',
        title = 'Extra 3',
        icon = 'box-open',
        type = 'client',
        event = 'qb-radialmenu:client:setExtra',
        shouldClose = false
    }, {
        id = 'extra4',
        title = 'Extra 4',
        icon = 'box-open',
        type = 'client',
        event = 'qb-radialmenu:client:setExtra',
        shouldClose = false
    }, {
        id = 'extra5',
        title = 'Extra 5',
        icon = 'box-open',
        type = 'client',
        event = 'qb-radialmenu:client:setExtra',
        shouldClose = false
    }, {
        id = 'extra6',
        title = 'Extra 6',
        icon = 'box-open',
        type = 'client',
        event = 'qb-radialmenu:client:setExtra',
        shouldClose = false
    }, {
        id = 'extra7',
        title = 'Extra 7',
        icon = 'box-open',
        type = 'client',
        event = 'qb-radialmenu:client:setExtra',
        shouldClose = false
    }, {
        id = 'extra8',
        title = 'Extra 8',
        icon = 'box-open',
        type = 'client',
        event = 'qb-radialmenu:client:setExtra',
        shouldClose = false
    }, {
        id = 'extra9',
        title = 'Extra 9',
        icon = 'box-open',
        type = 'client',
        event = 'qb-radialmenu:client:setExtra',
        shouldClose = false
    }, {
        id = 'extra10',
        title = 'Extra 10',
        icon = 'box-open',
        type = 'client',
        event = 'qb-radialmenu:client:setExtra',
        shouldClose = false
    }, {
        id = 'extra11',
        title = 'Extra 11',
        icon = 'box-open',
        type = 'client',
        event = 'qb-radialmenu:client:setExtra',
        shouldClose = false
    }, {
        id = 'extra12',
        title = 'Extra 12',
        icon = 'box-open',
        type = 'client',
        event = 'qb-radialmenu:client:setExtra',
        shouldClose = false
    }, {
        id = 'extra13',
        title = 'Extra 13',
        icon = 'box-open',
        type = 'client',
        event = 'qb-radialmenu:client:setExtra',
        shouldClose = false
    }
    }
}

Config.VehicleSeats = {
    id = 'vehicleseats',
    title = 'Araç Koltukları',
    icon = 'chair',
    items = {}
}

Config.JobInteractions = {
    ['ambulance'] = {
        {
            id = 'statuscheck',
            title = 'Sağlık Kontrol',
            icon = 'heart-pulse',
            type = 'client',
            event = 'hospital:client:CheckStatus',
            shouldClose = true
        }, {
        id = 'revivep',
        title = 'CPR',
        icon = 'user-doctor',
        type = 'client',
        event = 'hospital:client:RevivePlayer',
        shouldClose = true
    }, {
        id = 'treatwounds',
        title = 'Sargı sar',
        icon = 'bandage',
        type = 'client',
        event = 'hospital:client:TreatWounds',
        shouldClose = true
    }, {
        id = 'escort',
        title = 'Taşı',
        icon = 'user-group',
        type = 'client',
        event = 'police:client:EscortPlayer',
        shouldClose = true
    }, {
        id = 'stretcheroptions',
        title = 'Sedye',
        icon = 'bed-pulse',
        items = {
            {
                id = 'spawnstretcher',
                title = 'Sedye Çıkar',
                icon = 'plus',
                type = 'client',
                event = 'qb-radialmenu:client:TakeStretcher',
                shouldClose = false
            }, {
            id = 'despawnstretcher',
            title = 'Sedyeyi Yoket',
            icon = 'minus',
            type = 'client',
            event = 'qb-radialmenu:client:RemoveStretcher',
            shouldClose = false
        }
        }
    }
    },
    ['taxi'] = {
        {
            id = 'togglemeter',
            title = 'Taksimetre aç/kapat',
            icon = 'eye-slash',
            type = 'client',
            event = 'qb-taxi:client:toggleMeter',
            shouldClose = false
        }, {
        id = 'togglemouse',
        title = 'Taksimetreyi başlat/durdur',
        icon = 'hourglass-start',
        type = 'client',
        event = 'qb-taxi:client:enableMeter',
        shouldClose = true
    }, {
        id = 'npc_mission',
        title = 'NPC görevi',
        icon = 'taxi',
        type = 'client',
        event = 'qb-taxi:client:DoTaxiNpc',
        shouldClose = true
    }
    },
    ['tow'] = {
        {
            id = 'togglenpc',
            title = 'Toggle NPC',
            icon = 'toggle-on',
            type = 'client',
            event = 'jobs:client:ToggleNpc',
            shouldClose = true
        }, {
        id = 'towvehicle',
        title = 'Tow vehicle',
        icon = 'truck-pickup',
        type = 'client',
        event = 'qb-tow:client:TowVehicle',
        shouldClose = true
    }
    },
    ['mechanic'] = {
        {
            id = 'towvehicle',
            title = 'Tow vehicle',
            icon = 'truck-pickup',
            type = 'client',
            event = 'qb-tow:client:TowVehicle',
            shouldClose = true
        }
    },
    ['police'] = {
     --[[{
        id = 'checkvehstatus',
        title = 'Modifiye kontrol',
        icon = 'circle-info',
        type = 'client',
        event = 'qb-tunerchip:client:TuneStatus',
        shouldClose = true
    },]] {
        id = 'takedriverlicense',
        title = 'Ehliyeti al',
        icon = 'id-card',
        type = 'client',
        event = 'police:client:SeizeDriverLicense',
        shouldClose = true
    }, {
        id = 'policeinteraction',
        title = 'Meslek',
        icon = 'list-check',
        items = {
            {
                id = 'statuscheck',
                title = 'Sağlığı Kontrol Et',
                icon = 'heart-pulse',
                type = 'client',
                event = 'hospital:client:CheckStatus',
                shouldClose = true
            }, {
            id = 'checkstatus',
            title = 'GSR Kontrol',
            icon = 'question',
            type = 'client',
            event = 'police:client:CheckStatus',
            shouldClose = true
        }, {
            id = 'escort',
            title = 'Taşı',
            icon = 'user-group',
            type = 'client',
            event = 'police:client:EscortPlayer',
            shouldClose = true
        }, {
            id = 'searchplayer',
            title = 'Üstünü ara',
            icon = 'magnifying-glass',
            type = 'server',
            event = 'police:server:SearchPlayer',
            shouldClose = true
        }, {
            id = 'jailplayer',
            title = 'Hapise Gönder',
            icon = 'user-lock',
            type = 'client',
            event = 'police:client:JailPlayer',
            shouldClose = true
        }
        }
    }, {
        id = 'policeobjects',
        title = 'Objeler',
        icon = 'road',
        items = {
            {
                id = 'spawnpion',
                title = 'Koni',
                icon = 'triangle-exclamation',
                type = 'client',
                event = 'police:client:spawnCone',
                shouldClose = false
            }, {
            id = 'spawnhek',
            title = 'Kapı',
            icon = 'torii-gate',
            type = 'client',
            event = 'police:client:spawnBarrier',
            shouldClose = false
        }, {
            id = 'spawnschotten',
            title = 'Hız Limiti Tabelası',
            icon = 'sign-hanging',
            type = 'client',
            event = 'police:client:spawnRoadSign',
            shouldClose = false
        }, {
            id = 'spawntent',
            title = 'Tente',
            icon = 'campground',
            type = 'client',
            event = 'police:client:spawnTent',
            shouldClose = false
        }, {
            id = 'spawnverlichting',
            title = 'Işıklandırma',
            icon = 'lightbulb',
            type = 'client',
            event = 'police:client:spawnLight',
            shouldClose = false
        }, {
            id = 'spikestrip',
            title = 'Spike Strips',
            icon = 'caret-up',
            type = 'client',
            event = 'police:client:SpawnSpikeStrip',
            shouldClose = false
        }, {
            id = 'deleteobject',
            title = 'Objeleri Sil',
            icon = 'trash',
            type = 'client',
            event = 'police:client:deleteObject',
            shouldClose = false
        }
        }
    }
    },
}

Config.TrunkClasses = {
    [0] = { allowed = true, x = 0.0, y = -1.5, z = 0.0 },   -- Coupes
    [1] = { allowed = true, x = 0.0, y = -2.0, z = 0.0 },   -- Sedans
    [2] = { allowed = true, x = 0.0, y = -1.0, z = 0.25 },  -- SUVs
    [3] = { allowed = true, x = 0.0, y = -1.5, z = 0.0 },   -- Coupes
    [4] = { allowed = true, x = 0.0, y = -2.0, z = 0.0 },   -- Muscle
    [5] = { allowed = true, x = 0.0, y = -2.0, z = 0.0 },   -- Sports Classics
    [6] = { allowed = true, x = 0.0, y = -2.0, z = 0.0 },   -- Sports
    [7] = { allowed = true, x = 0.0, y = -2.0, z = 0.0 },   -- Super
    [8] = { allowed = false, x = 0.0, y = -1.0, z = 0.25 }, -- Motorcycles
    [9] = { allowed = true, x = 0.0, y = -1.0, z = 0.25 },  -- Off-road
    [10] = { allowed = true, x = 0.0, y = -1.0, z = 0.25 }, -- Industrial
    [11] = { allowed = true, x = 0.0, y = -1.0, z = 0.25 }, -- Utility
    [12] = { allowed = true, x = 0.0, y = -1.0, z = 0.25 }, -- Vans
    [13] = { allowed = true, x = 0.0, y = -1.0, z = 0.25 }, -- Cycles
    [14] = { allowed = true, x = 0.0, y = -1.0, z = 0.25 }, -- Boats
    [15] = { allowed = true, x = 0.0, y = -1.0, z = 0.25 }, -- Helicopters
    [16] = { allowed = true, x = 0.0, y = -1.0, z = 0.25 }, -- Planes
    [17] = { allowed = true, x = 0.0, y = -1.0, z = 0.25 }, -- Service
    [18] = { allowed = true, x = 0.0, y = -1.0, z = 0.25 }, -- Emergency
    [19] = { allowed = true, x = 0.0, y = -1.0, z = 0.25 }, -- Military
    [20] = { allowed = true, x = 0.0, y = -1.0, z = 0.25 }, -- Commercial
    [21] = { allowed = true, x = 0.0, y = -1.0, z = 0.25 }  -- Trains
}

Config.ExtrasEnabled = true

Config.Commands = {
    ['ceket'] = {
        Func = function() ToggleClothing('Top') end,
        Sprite = 'top',
        Desc = 'Gömleğini çıkar/tak',
        Button = 1,
        Name = 'Üst'
    },
    ['eldiven'] = {
        Func = function() ToggleClothing('gloves') end,
        Sprite = 'gloves',
        Desc = 'Eldivenlerini çıkar/tak',
        Button = 2,
        Name = 'Eldiven'
    },
    ['visor'] = {
        Func = function() ToggleProps('visor') end,
        Sprite = 'visor',
        Desc = 'Şapka varyasyonunu değiştir',
        Button = 3,
        Name = 'Vizör'
    },
    ['çanta'] = {
        Func = function() ToggleClothing('Bag') end,
        Sprite = 'bag',
        Desc = 'Çantanı aç/kapat',
        Button = 8,
        Name = 'Çanta'
    },
    ['ayakkabı'] = {
        Func = function() ToggleClothing('Shoes') end,
        Sprite = 'shoes',
        Desc = 'Ayakkabılarını çıkar/tak',
        Button = 5,
        Name = 'Ayakkabı'
    },
    ['yelek'] = {
        Func = function() ToggleClothing('Vest') end,
        Sprite = 'vest',
        Desc = 'Yeleğini çıkar/tak',
        Button = 14,
        Name = 'Yelek'
    },
    ['saç'] = {
        Func = function() ToggleClothing('hair') end,
        Sprite = 'hair',
        Desc = 'Saç stilini değiştir (toplu/açık vs.)',
        Button = 7,
        Name = 'Saç'
    },
    ['şapka'] = {
        Func = function() ToggleProps('Hat') end,
        Sprite = 'hat',
        Desc = 'Şapkanı çıkar/tak',
        Button = 4,
        Name = 'Şapka'
    },
    ['gözlük'] = {
        Func = function() ToggleProps('Glasses') end,
        Sprite = 'glasses',
        Desc = 'Gözlüğünü çıkar/tak',
        Button = 9,
        Name = 'Gözlük'
    },
    ['kulak'] = {
        Func = function() ToggleProps('Ear') end,
        Sprite = 'ear',
        Desc = 'Kulak aksesuarını çıkar/tak',
        Button = 10,
        Name = 'Kulak'
    },
    ['boyun'] = {
        Func = function() ToggleClothing('Neck') end,
        Sprite = 'neck',
        Desc = 'Boyun aksesuarını çıkar/tak',
        Button = 11,
        Name = 'Boyun'
    },
    ['saat'] = {
        Func = function() ToggleProps('Watch') end,
        Sprite = 'watch',
        Desc = 'Saatini çıkar/tak',
        Button = 12,
        Name = 'Saat',
        Rotation = 5.0
    },
    ['bileklik'] = {
        Func = function() ToggleProps('Bracelet') end,
        Sprite = 'bracelet',
        Desc = 'Bilekliğini çıkar/tak',
        Button = 13,
        Name = 'Bileklik'
    },
    ['maske'] = {
        Func = function() ToggleClothing('Mask') end,
        Sprite = 'mask',
        Desc = 'Maskeni çıkar/tak',
        Button = 6,
        Name = 'Maske'
    }
    
}

local bags = { [40] = true, [41] = true, [44] = true, [45] = true }

Config.ExtraCommands = {
    ['pantolon'] = {
        Func = function() ToggleClothing('Pants', true) end,
        Sprite = 'pants',
        Desc = 'Pantolonunu çıkar/tak',
        Name = 'Pantolon',
        OffsetX = -0.04,
        OffsetY = 0.0
    },
    ['tshirt'] = {
        Func = function() ToggleClothing('Shirt', true) end,
        Sprite = 'shirt',
        Desc = 'Gömleğini çıkar/tak',
        Name = 'Gömlek',
        OffsetX = 0.04,
        OffsetY = 0.0
    },
    ['reset'] = {
        Func = function()
            if not ResetClothing(true) then
                Notify('Sıfırlanacak bir şey yok', 'error')
            end
        end,
        Sprite = 'reset',
        Desc = 'Tüm kıyafetleri eski haline döndür',
        Name = 'Sıfırla',
        OffsetX = 0.12,
        OffsetY = 0.2,
        Rotate = true
    },
    ['çantaçıkar'] = {
        Func = function() ToggleClothing('Bagoff', true) end,
        Sprite = 'bagoff',
        SpriteFunc = function()
            local Bag = GetPedDrawableVariation(PlayerPedId(), 5)
            local BagOff = LastEquipped['Bagoff']
            if LastEquipped['Bagoff'] then
                if bags[BagOff.Drawable] then
                    return 'bagoff'
                else
                    return 'paraoff'
                end
            end
            if Bag ~= 0 then
                if bags[Bag] then
                    return 'bagoff'
                else
                    return 'paraoff'
                end
            else
                return false
            end
        end,
        Desc = 'Çantanı çıkar/tak',
        Name = 'Çanta Çıkar',
        OffsetX = -0.12,
        OffsetY = 0.2
    }
    
}