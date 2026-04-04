Config = {}

Config.Job = "burgershot"

Config.Stash = vector3(-1196.78, -901.35, 13.89)
Config.CupCoords = vector3(-1202.27, -894.63, 14.15)
Config.Machine = vector3(-1191.07, -898.76, 14.35)
Config.PeelPotato = vector3(-1193.83, -899.92, 13.89)
Config.Fry = vector3(-1196.86, -899.08, 13.89)
Config.CookMeat = vector3(-1195.91, -899.33, 13.89)
Config.CreateBurger = vector3(-1195.57, -898.19, 13.89)
Config.Order = vector3(-1194.15, -892.29, 13.89)
Config.AddStock = vector3(-1195.01, -894.75, 13.89) 
Config.MoneyCaseCoords = vector3(-1197.48, -892.51, 14.04) 

Config.ShopItems =  {
    {name = "water", price = 0, amount = 50, type = "item" },
    {name = "bread", price = 0, amount = 50, type = "item" },
    {name = "water", price = 0, amount = 50, type = "item" },
}

Config.EtBurgeritems = {
    {name = "wonev_pismiset", amount = 1},
    {name = "wonev_kizarmispatates", amount = 1},
    {name = "wonev_burgerekmek", amount = 2},
    {name = "wonev_domates", amount = 1},
    {name = "wonev_marul", amount = 1},
    {name = "wonev_cheddarpeyniri", amount = 1}
}

Config.TavukBurgeritems = {
    {name = "wonev_pismistavuk", amount = 1},
    {name = "wonev_kizarmispatates", amount = 1},
    {name = "wonev_burgerekmek", amount = 2},
    {name = "wonev_domates", amount = 1},
    {name = "wonev_marul", amount = 1},
    {name = "wonev_cheddarpeyniri", amount = 1}
}

Config.SellItems = {
    ['ChickenBurger'] = {
        name = 'Tavuk Burger',
        price = 50
    },
    ['MeatBurgerBurger'] = {
        name = 'Et Burger' ,
        price = 50
    },
    ['Cola'] = {
        name = 'Kola',
        price = 50
    },
    ['Lemonade'] = {
        name = 'Limonata',
        price = 50
    },
    ['Potato'] = {
        name = 'Patates Kızartması',
        price = 50
    },
    ['Onion_ring'] = {
        name = 'Soğan Halkası',
        price = 50
    },
    ['ChickenBurgerMenu'] = {
        name = 'Tavuk Burger Menüsü',
        price = 125,
        txt = '1x Tavuk Burger , 1x Patates Kızartması,'
    },
    ['MeatBurgerMenu'] = {
        name = 'Et Burger Menüsü',
        price = 125,
        txt = '1x Et Burger , 1x Patates Kızartması,'
    },

}

Config.Menus = {
    {name = 'TavukBurger1', item = 'wonev_meatburgermenu1' },
    {name = 'TavukBurger2', item = 'wonev_meatburgermenu2' },
    {name = 'wonev_meatburgermenu1', item = 'wonev_meatburgermenu1' },
    {name = 'wonev_meatburgermenu2', item = 'wonev_meatburgermenu2' },
}