local QBCore = exports['qb-core']:GetCoreObject()
local PlayerData = {}

RegisterNetEvent('QBCore:Client:OnPlayerLoaded')
AddEventHandler('QBCore:Client:OnPlayerLoaded', function(xPlayer)
    PlayerData = QBCore.Functions.GetPlayerData()
    TriggerServerEvent("wonev:RequestStocks")
    TriggerServerEvent('wonev:Updatemoney')
end)

RegisterNetEvent('QBCore:Client:OnJobUpdate')
AddEventHandler('QBCore:Client:OnJobUpdate', function(job)
    PlayerData.job = job
    TriggerServerEvent("wonev:RequestStocks")
    TriggerServerEvent('wonev:Updatemoney')
end)


exports['qb-target']:AddBoxZone("CupCoords", Config.CupCoords, 1.5, 1.5, {
    name = "CupCoords",
    heading = 0,
    debugPoly = false,
    minZ = 13.5,
    maxZ = 14.5,
}, {
    options = {
        {
            type = "server",
            event = "wonev:GiveCup",
            icon = "fa-cup-straw-swoosh",
            label = "Bardak Al",
            job = Config.Job
        }
    },
    distance = 1.0
})


exports['qb-target']:AddBoxZone("Machine", Config.Machine, 1.5, 1.5, {
    name = "Machine",
    heading = 0,
    debugPoly = false,
    minZ = 13.5,
    maxZ = 14.5,
}, {
    options = {
        {
            type = "client",
            event = "wonev:PrepairDrink",
            icon = "",
            label = "İçecek Hazırla",
            job = Config.Job
        }
    },
    distance = 1.0
})

exports['qb-target']:AddBoxZone("PeelPotato", Config.PeelPotato, 1.5, 1.5, {
    name = "PeelPotato",
    heading = 0,
    debugPoly = false,
    minZ = 13.5,
    maxZ = 14.5,
}, {
    options = {
        {
            type = "client",
            event = "wonev:ChoopingBoard",
            icon = "",
            label = "Kesme Tahtası",
            job = Config.Job
        }
    },
    distance = 1.0
})


exports['qb-target']:AddBoxZone("FryPtato", Config.Fry, 1.5, 1.5, {
    name = "FryPtato",
    heading = 0,
    debugPoly = false,
    minZ = 13.5,
    maxZ = 14.5,
}, {
    options = {
        {
            type = "client",
            event = "wonev:FryPatato",
            icon = "",
            label = "Patetes Kızart",
            job = Config.Job
        }
    },
    distance = 1.0
})


exports['qb-target']:AddBoxZone("CookMeatMenu", Config.CookMeat, 1.5, 1.5, {
    name = "CookMeatMenu",
    heading = 0,
    debugPoly = false,
    minZ = 13.5,
    maxZ = 14.5,
}, {
    options = {
        {
            type = "client",
            event = "wonev:CookMeatMenu",
            icon = "",
            label = "Et / Tavuk Pişir",
            job = Config.Job
        }
    },
    distance = 1.0
})

exports['qb-target']:AddBoxZone("CreateBurger", Config.CreateBurger, 1.5, 1.5, {
    name = "CreateBurger",
    heading = 0,
    debugPoly = false,
    minZ = 13.5,
    maxZ = 14.5,
}, {
    options = {
        {
            type = "clint",
            event = "wonev:CreateBurgerMenu",
            icon = "",
            label = "Hamburger Yap",
            job = Config.Job
        }
    },
    distance = 1.0
})

exports['qb-target']:AddBoxZone("MoneyCase", Config.MoneyCaseCoords, 1.5, 1.5, {
    name = "MoneyCase",
    heading = 0,
    debugPoly = false,
    minZ = 13.5,
    maxZ = 14.5,
}, {
    options = {
        {
            type = "client",
            event = "wonev:MoneyCase",
            icon = "fa-cup-straw-swoosh",
            label = "Para Kasası",
            job = Config.Job
        }
    },
    distance = 1.0
})


RegisterNetEvent("wonev:PrepairDrink",function ()
    if PlayerData.job and PlayerData.job.name == Config.Job then
        local menu = {
            {
                header = "İçecek Hazırlama Menüsü",
                isMenuHeader = true
            },
            {
                header = "Kola",
                txt = "Kola Hazırla",
                params = {
                    event = "wonev:PrepairCola"
                }
            },
            {
                header = "Limonata",
                txt = "Limonata Hazırla",
                params = {
                    event = "wonev:PrepairLemonade"
                }
            },
        }
        TriggerEvent('qb-menu:client:openMenu', menu)
    end
end)

RegisterNetEvent("wonev:CookMeatMenu", function ()
    local menu = {
        {
            header = "Pişirme Seçenekleri",
            isMenuHeader = true
        },
        {
            header = "Et Pişir",
            params = {
                event = "wonev:CookMeat"
            }
        },
        {
            header = "Tavuk Pişir",
            params = {
                event = "wonev:CookChicken"
            }
        }

    }
    TriggerEvent('qb-menu:client:openMenu', menu)
    
end)

RegisterNetEvent("wonev:CreateBurgerMenu", function ()
    local Menu = {
        {
            header = "Hamburger Seçecekleri",
            isMenuHeader = true
        },
        {
            header = "Et Burger",
            txt = "1x Pişmiş Et, 1x Kızarmış Patates, 2x Burger Ekmeği, 1x Domates, 1x Marul, 1x Cheddar Peyniri ",
            params = {
                event = "wonev:requestitem"
            }
        },
        {
            header = "Tavuk Burger",
            txt = "1x Pişmiş Tavuk Eti, 1x Kızarmış Patates, 2x Burger Ekmeği, 1x Domates, 1x Marul, 1x Cheddar Peyniri ",
            params = {
                event = "wonev:requesttitem"
            }
        }
    }
    TriggerEvent('qb-menu:client:openMenu', Menu)
    
end)

RegisterNetEvent("wonev:requestitem",function ()
    TriggerServerEvent("wonev:MeatBurgerCheckItem")
    
end )

RegisterNetEvent("wonev:requesttitem", function ()
    TriggerServerEvent('wonev:ChickenBurgerCheckItem')
    
end)

RegisterNetEvent("wonev:ChoopingBoard", function ()
    local Menu = {
        {
            header = "Kesme Tahtası",
            isMenuHeader = true
        },
        {
            header = "Patates Soy",
            params = {
                event = "wonev:PeelPotato"
            }
        },
        {
            header = "Marul Kes",
            params = {
                event = "wonev:CutLettuce"
            }
        },
        {
            header = "Domates Kes",
            params = {
                event = "wonev:CutTomato"
            }
        }
    }
    TriggerEvent('qb-menu:client:openMenu', Menu)
    
end)
-- Marul ve Domates Kesme eklenecek --

RegisterNetEvent("wonev:PeelPotato", function ()
    local item = QBCore.Functions.HasItem("wonev_soyulmamispatates")
    if item then
        QBCore.Functions.Progressbar("PeelPotato", "Patetesi Soyuyorsun ", 5000, false, true, {
            disableMovement = true,
            disableCarMovement = true,
            disableMouse = false,
            disableCombat = true
        }, {
            animDict = "mp_arresting",
            anim = "a_uncuff",
            flags = 49
        }, {}, {}, function()
            TriggerServerEvent("wonev:GivePatato")
            
        end, function()
            print("Transaction canceled!")
        end)
    else
        QBCore.Functions.Notify("Soyulmamış Patatesin Yok", "error", 5000)
    end
    
end)


RegisterNetEvent("wonev:CutLettuce", function ()
    local item = QBCore.Functions.HasItem("wonev_marul")
    if item then
        QBCore.Functions.Progressbar("CutLettuce", "Marul Kesiyorsun ", 5000, false, true, {
            disableMovement = true,
            disableCarMovement = true,
            disableMouse = false,
            disableCombat = true
        }, {
            animDict = "mp_arresting",
            anim = "a_uncuff",
            flags = 49
        }, {}, {}, function()
            TriggerServerEvent("wonev:GiveLettuce")
            
        end, function()
            print("Transaction canceled!")
        end)
    else
        QBCore.Functions.Notify("Marulun Yok", "error", 5000)
    end
    
end)

RegisterNetEvent("wonev:CutTomato", function ()
    local item = QBCore.Functions.HasItem("wonev_domates")
    if item then
        QBCore.Functions.Progressbar("CutTomato", "Domates Kesiyorsun ", 5000, false, true, {
            disableMovement = true,
            disableCarMovement = true,
            disableMouse = false,
            disableCombat = true
        }, {
            animDict = "mp_arresting",
            anim = "a_uncuff",
            flags = 49
        }, {}, {}, function()
            TriggerServerEvent("wonev:GiveTomato")
            
        end, function()
            print("Transaction canceled!")
        end)
    else
        QBCore.Functions.Notify("Doamtesin Yok", "error", 5000)
    end
    
end)

RegisterNetEvent("wonev:PrepairCola", function ()
    local cup = QBCore.Functions.HasItem("wonev_kartonbardak")
    if cup then
        QBCore.Functions.Progressbar("PrepairCola", "Kola Hazırlıyorsun ", 5000, false, true, {
            disableMovement = true,
            disableCarMovement = true,
            disableMouse = false,
            disableCombat = true
        }, {
            animDict = "amb@prop_human_bbq@male@base",
            anim = "base",
            flags = 49
        }, {}, {}, function()
            TriggerServerEvent("wonev:GiveCola")
            
        end, function()
            print("Transaction canceled!")
        end)
    else
        QBCore.Functions.Notify("Bardağın Yok", "error", 5000)
    end
end)

RegisterNetEvent("wonev:PrepairLemonade", function ()
    local cup = QBCore.Functions.HasItem("wonev_kartonbardak")
    if cup then
        QBCore.Functions.Progressbar("PrepairLemonade", "Limonata Hazırlıyorsun ", 5000, false, true, {
            disableMovement = true,
            disableCarMovement = true,
            disableMouse = false,
            disableCombat = true
        }, {
            animDict = "amb@prop_human_bbq@male@base",
            anim = "base",
            flags = 49
        }, {}, {}, function()
            TriggerServerEvent("wonev:GiveLemonade")
            
        end, function()
            print("Transaction canceled!")
        end)
    else
        QBCore.Functions.Notify("Bardağın Yok", "error", 5000)
    end
    
end)

RegisterNetEvent("wonev:FryPatato", function ()
    local item =  QBCore.Functions.HasItem("wonev_soyulmuspatates")
    if item then
        QBCore.Functions.Progressbar("FryPatato", "Patates Kızartıyorsun ", 5000, false, true, {
            disableMovement = true,
            disableCarMovement = true,
            disableMouse = false,
            disableCombat = true
        }, {
            animDict = "amb@prop_human_bbq@male@base",
            anim = "base",
            flags = 49
        }, {}, {}, function()
            TriggerServerEvent("wonev:FryPatato")
            
        end, function()
            print("Transaction canceled!")
        end)
    else
        QBCore.Functions.Notify("Soyulmuş Patatesin Yok", "error", 3500)
    end
    
end)

RegisterNetEvent("wonev:CookMeat", function ()
    local item = QBCore.Functions.HasItem("wonev_pismemiset")
    if item then
        QBCore.Functions.Progressbar("CookMeat", "Et Pişiriyorsun ", 5000, false, true, {
            disableMovement = true,
            disableCarMovement = true,
            disableMouse = false,
            disableCombat = true
        }, {
            animDict = "amb@prop_human_bbq@male@base",
            anim = "base",
            flags = 49
        }, {}, {}, function()
            TriggerServerEvent("wonev:GiveMeat")
            
        end, function()
            print("Transaction canceled!")
        end)
    else
        QBCore.Functions.Notify("Etin Yok", "error", 5000)
    end
    
end)

RegisterNetEvent("wonev:CookChicken", function ()
    local item = QBCore.Functions.HasItem("wonev_pismemistavuk")
    if item then
        QBCore.Functions.Progressbar("CookChicken", "Tavuk Pişiriyorsun ", 5000, false, true, {
            disableMovement = true,
            disableCarMovement = true,
            disableMouse = false,
            disableCombat = true
        }, {
            animDict = "amb@prop_human_bbq@male@base",
            anim = "base",
            flags = 49
        }, {}, {}, function()
            TriggerServerEvent("wonev:GiveChicken")
            
        end, function()
            print("Transaction canceled!")
        end)
    else
        QBCore.Functions.Notify("Tacuğun Yok", "error", 5000)
    end
    
end)

RegisterNetEvent("wonev:MeatBurgerItemChecked", function ()
    QBCore.Functions.Progressbar("CreateHamburger", "Hamburger Yapıyorsun ", 5000, false, true, {
        disableMovement = true,
        disableCarMovement = true,
        disableMouse = false,
        disableCombat = true
    }, {
        animDict = "mp_arresting",
        anim = "a_uncuff",
        flags = 49
    }, {}, {}, function()
        TriggerServerEvent("wonev:GiveMeatHamburger")
        
    end, function()
        print("Transaction canceled!")
    end)

    
end)

RegisterNetEvent("wonev:ChickenBurgerItemChecked", function ()
    QBCore.Functions.Progressbar("CreateHamburger", "Hamburger Yapıyorsun ", 5000, false, true, {
        disableMovement = true,
        disableCarMovement = true,
        disableMouse = false,
        disableCombat = true
    }, {
        animDict = "mp_arresting",
        anim = "a_uncuff",
        flags = 49
    }, {}, {}, function()
        TriggerServerEvent("wonev:GiveChickenHamburger")
        
    end, function()
        print("Transaction canceled!")
    end)

    
end)

local MeatBurgerStocks = 0
local ChickenBurgerStocks = 0
local PatatesMiktar = 0
local KolaMiktar = 0
local LimonataMiktar = 0

RegisterNetEvent("wonev:UpdateStocks", function(EtBurgerstocks ,TavukBurgerstocks, PatatesStock, KolaStock, LimonataStock)
    if EtBurgerstocks then
        MeatBurgerStocks = EtBurgerstocks
    end
    
    if TavukBurgerstocks then
        ChickenBurgerStocks = TavukBurgerstocks
    end
    if PatatesStock then
        PatatesMiktar = PatatesStock
    end
    if KolaStock then
        KolaMiktar = KolaStock
    end

    if LimonataStock then
        LimonataMiktar = LimonataStock
    end
end)

local money = 0

RegisterNetEvent('wonev:UpdatemoneyClient', function (moneyy)
    if moneyy then
        money = moneyy
        print('Kasadaki para :'.. money)
    end
end)

RegisterNetEvent('wonev:MoneyCase', function ()
    local Money = {
        {
            header = 'Toplam Para :'..' ' .. money .. '$',
            disabled = true,
        },
        {
            header = 'Para Ekle',
            params = {
                event = 'wonev:MoneyInput',
                args = {type = 'paraekle'}
            }
        },
        {
            header = 'Para Çek',
            params = {
                event = 'wonev:MoneyInput',
                args = {type = 'paracek'}
            }
        },
    }
    TriggerEvent('qb-menu:client:openMenu', Money)
    
end)

RegisterNetEvent('wonev:MoneyInput', function(data)
    print('sa')
    local dialog = exports['qb-input']:ShowInput({
        header = "Miktarı Girin",
        submitText = "Kaydet",
        inputs = {
            {
                type = "number",
                isRequired = true,
                name = "Miktar",
                text = "Miktarı Girin"
            }
        }
    })
    if dialog then
        local amount = tonumber(dialog.Miktar)
        if amount and amount > 0 then
            TriggerServerEvent("wonev:AddMoney", amount, data.type)
        end
    else
        QBCore.Functions.Notify("Geçersiz Miktar Girdiniz", "error", 2000)
    end
end)

RegisterNetEvent("wonev:StokMenu",function ()
    if PlayerData.job and PlayerData.job.name == Config.Job then
        local menu = {
            {
                header = "Stock Menüsü",
                isMenuHeader = true
            },
            {
                header = "Stoğa Et Hamburger Ekle",
                txt = "Şuanki stok : ".. tostring(MeatBurgerStocks),
                params = {
                    event = "wonev:openInput",
                    args = { type = "MeatBurger"}
                }
            },
            {
                header = "Stoğa Tavuk Hamburger Ekle",
                txt = "Şuanki stok : ".. tostring(ChickenBurgerStocks),
                params = {
                    event = "wonev:openInput",
                    args = { type = "ChickenBurger"}
                }
            },
            {
                header = "Stoğa Patates Ekle",
                txt = "Şuanki stok : ".. tostring(PatatesMiktar),
                params = {
                    event = "wonev:openInput",
                    args = { type = "Potato"}
                }
            },
            {
                header = "Stoğa Kola Ekle",
                txt = "Şuanki stok : ".. tostring(KolaMiktar),
                params = {
                    event = "wonev:openInput",
                    args = { type = "Kola"}
                }
            },
            {
                header = "Stoğa Limonata Ekle",
                txt = "Şuanki stok : ".. tostring(LimonataMiktar),
                params = {
                    event = "wonev:openInput",
                    args = { type = "Limonata"}
                }
            },
        }
        TriggerEvent('qb-menu:client:openMenu', menu)
    end
end)

RegisterNetEvent('wonev:openInput', function(data)
    local dialog = exports['qb-input']:ShowInput({
        header = "Miktarı Girin",
        submitText = "Kaydet",
        inputs = {
            {
                type = "number",
                isRequired = true,
                name = "StokMiktar",
                text = "Miktarı Girin"
            }
        }
    })
    if dialog then
        local amount = tonumber(dialog.StokMiktar)
        if amount and amount > 0 then
            TriggerServerEvent("wonev:CheckAmount", amount, data.type)
        end
    else
        QBCore.Functions.Notify("Geçersiz Miktar Girdiniz", "error", 2000)
    end
end)

CreateThread(function ()
    while true do 
        local sleep = 2000
        
            local Player = PlayerPedId()
            local PlayerCorods = GetEntityCoords(Player)
            local distance = GetDistanceBetweenCoords(PlayerCorods.x, PlayerCorods.y, PlayerCorods.z, Config.AddStock.x, Config.AddStock.y, Config.AddStock.z)
            local distance2 = GetDistanceBetweenCoords(PlayerCorods.x, PlayerCorods.y, PlayerCorods.z, Config.Order.x, Config.Order.y, Config.Order.z)
            local distance3 = GetDistanceBetweenCoords(PlayerCorods.x, PlayerCorods.y, PlayerCorods.z, Config.Stash.x, Config.Stash.y, Config.Stash.z)

            if distance < 2.0 then
                if PlayerData.job and PlayerData.job.name ==  Config.Job  then
                    sleep = 1
                    DrawText3D(Config.AddStock.x, Config.AddStock.y, Config.AddStock.z , "[~g~E~w~] stok ekle") 
                    if distance < 1.0 then
                        if IsControlJustPressed(0, 38) then
                            TriggerEvent("wonev:StokMenu")
                        end
                    end
                end
            end
            if distance2 < 5 then
                sleep = 1
                DrawText3D(Config.Order.x, Config.Order.y, Config.Order.z , "[~g~E~w~] Sipariş Ver") 
                if distance2 < 1.0 then
                    if IsControlJustPressed(0, 38) then
                        SellMenu()

                    end
                end
            end
        Wait(sleep)
    end
end)

function SellMenu()
    local SellMenu = {
        {
            header = 'Menüler',
            params ={
                event = 'wonev:Menus',
            }
        },
        {
            header = 'Hamburgerler',
            params ={
                event = 'wonev:Hamburgers',
            }
        },
        {
            header = 'İçecekler',
            params ={
                event = 'wonev:Drinks'
            }
        },
        {
            header = 'Ekstrlar',
            params ={
                event = 'wonev:Extra'
            }
        },
    }
    TriggerEvent('qb-menu:client:openMenu', SellMenu)
    
end

RegisterNetEvent('wonev:Drinks', function ()
    local Menu = {
        {
            header = Config.SellItems['Cola'].name,
            txt = Config.SellItems['Cola'].price .. '$',
            params = {
                event = 'wonev:SellInput',
                args = { type = "SellCola"}
            }
        },
        {
            header = Config.SellItems['Lemonade'].name,
            txt = Config.SellItems['Lemonade'].price.. '$',
            params = {
                event = 'wonev:SellInput',
                args = { type = "SellLemonade"}
            }
        },
    }
    TriggerEvent('qb-menu:client:openMenu', Menu)
    
end)

RegisterNetEvent('wonev:Hamburgers', function ()
    local Menu = {
        {
            header = Config.SellItems['ChickenBurger'].name,
            txt = Config.SellItems['ChickenBurger'].price.. '$',
            params = {
                event = 'wonev:SellInput',
                args = { type = "SellChicken"}
            }

        },
        {
            header = Config.SellItems['MeatBurgerBurger'].name,
            txt = Config.SellItems['MeatBurgerBurger'].price.. '$',
            params = {
                event = 'wonev:SellInput',
                args = { type = "SellMeat"}
            }

        },
    }
    TriggerEvent('qb-menu:client:openMenu', Menu)
    
end)

RegisterNetEvent('wonev:Extra', function ()
    local Menu = {
        {
            header = Config.SellItems['Potato'].name,
            txt = Config.SellItems['Potato'].price.. '$',
            params = {
                event = 'wonev:SellInput',
                args = { type = "SellPotato"}
            }
        },
    }
    TriggerEvent('qb-menu:client:openMenu', Menu)
    
end)

RegisterNetEvent('wonev:Menus', function ()
    local Menu = {
        {
            header = Config.SellItems['ChickenBurgerMenu'].name,
            txt = Config.SellItems['ChickenBurgerMenu'].txt .. ' '.. '1x Kola',
            params = {
                args = {type = 'ChickenBurger1'},
                event = 'wonev:SellInput'
            }
        },
        {
            header = Config.SellItems['ChickenBurgerMenu'].name,
            txt = Config.SellItems['ChickenBurgerMenu'].txt .. ' '.. '1x Limonata',
            params = {
                args = {type = 'ChickenBurger2'},
                event = 'wonev:SellInput'
            }
        },
        {
            header = Config.SellItems['MeatBurgerMenu'].name,
            txt = Config.SellItems['MeatBurgerMenu'].txt .. ' '.. '1x Kola',
            params = {
                args = {type = 'MeatBurgerMenu1'},
                event = 'wonev:SellInput'
            }
        },
        {
            header = Config.SellItems['MeatBurgerMenu'].name,
            txt = Config.SellItems['MeatBurgerMenu'].txt .. ' '.. '1x Limonata',
            params = {
                args = {type = 'MeatBurgerMenu2'},
                event = 'wonev:SellInput'
            }
        },
    }
    TriggerEvent('qb-menu:client:openMenu', Menu)
end)

RegisterNetEvent('wonev:SellInput', function(data)
    local dialog = exports['qb-input']:ShowInput({
        header = "Miktarı Girin",
        submitText = "Kaydet",
        inputs = {
            {
                type = "number",
                isRequired = true,
                name = "Miktar",
                text = "Miktarı Girin"
            }
        }
    })
    if dialog then
        local amount = tonumber(dialog.Miktar)
        if amount and amount > 0 then
            TriggerServerEvent("wonev:SellItem", amount, data.type)
        end
    else
        QBCore.Functions.Notify("Geçersiz Miktar Girdiniz", "error", 2000)
    end
end)

function DrawText3D(x, y, z, text)
    local onScreen, _x, _y = World3dToScreen2d(x, y, z)
    if onScreen then
        SetTextScale(0.40, 0.40)
        SetTextFont(0)
        SetTextProportional(1)
        SetTextColour(255, 255, 255, 215)
        SetTextEntry("STRING")
        SetTextCentre(1)
        AddTextComponentString(text)
        DrawText(_x, _y)
        local factor = (string.len(text)) / 250
        DrawRect(_x, _y + 0.0125, 0.015 + factor, 0.03, 0, 0, 0, 75)
    end
end




