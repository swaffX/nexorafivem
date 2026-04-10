Config = {}

Config.ItemGroups = {
    telefonlar = {
        {
            name = 'blue_phone',
            label = 'Mavi Telefon',
            price = 200,
            category = 'teknoloji'
        },
        {
            name = 'pink_phone',
            label = 'Pembe Telefon',
            price = 200,
            category = 'teknoloji'
        },
        {
            name = 'white_phone',
            label = 'Beyaz Telefon',
            price = 200,
            category = 'teknoloji'
        },
        {
            name = 'yellow_phone',
            label = 'Sarı Telefon',
            price = 200,
            category = 'teknoloji'
        },
        {
            name = 'radio',
            label = 'Telsiz',
            price = 200,
            category = 'teknoloji'
        },
        {
            name = 'car_speaker',
            label = 'Araç Hoparlörü',
            price = 500,
            category = 'teknoloji'
        },
    },
    marketitemleri = {
        {
            name = 'tosti',
            label = 'Grilled Cheese Sandwich',
            price = 5,
            category = 'food'
        },
        {
            name = 'twerks_candy',
            label = 'Twerks',
            price = 5,
            category = 'food'
        },
        {
            name = 'snikkel_candy',
            label = 'Snikkel',
            price = 5,
            category = 'food'
        },
        {
            name = 'sandwich',
            label = 'Sandwich',
            price = 5,
            category = 'food'
        },
        {
            name = 'water_bottle',
            label = 'Water Bottle',
            price = 10,
            category = 'drinks'
        },
        {
            name = 'kurkakola',
            label = 'Cola',
            price = 10,
            category = 'drinks'
        },
        {
            name = 'beer',
            label = 'Beer',
            price = 15,
            category = 'alcohol'
        },
        {
            name = 'vodka',
            label = 'Vodka',
            price = 15,
            category = 'alcohol'
        },
        
    }
}

Config.Markets = {
    ['teknoloji'] = {
        label = 'Digital Den',
        coords = vector3(-1530.36, -402.16, 35.64),
        heading = 225.46,
        pedModel = "a_m_y_smartcaspat_01",
        TargetLabel = "Merhaba, telefon almak istiyorum.",
        blip = {
            sprite = 52,
            color = 0,
            scale = 0.65,
            display = 4
        },
        items = "telefonlar"
    },
   ['market1'] = {
    label = 'Market',
    coords = vector3(24.47, -1346.62, 29.5),
    heading = 271.66,
    pedModel = "mp_m_shopkeep_01",
    TargetLabel = "Merhaba, kolay gelsin.",
    blip = {
        sprite = 52,
        color = 0,
        scale = 0.65,
        display = 4
    },
    items = "marketitemleri"
},

['market2'] = {
    label = 'Market',
    coords = vector3(-3039.54, 584.38, 7.91),
    heading = 17.27,
    pedModel = "mp_m_shopkeep_01",
    TargetLabel = "Merhaba, kolay gelsin.",
    blip = {
        sprite = 52,
        color = 0,
        scale = 0.65,
        display = 4
    },
    items = "marketitemleri"
},

['market3'] = {
    label = 'Market',
    coords = vector3(-3242.97, 1000.01, 12.83),
    heading = 357.57,
    pedModel = "mp_m_shopkeep_01",
    TargetLabel = "Merhaba, kolay gelsin.",
    blip = {
        sprite = 52,
        color = 0,
        scale = 0.65,
        display = 4
    },
    items = "marketitemleri"
},

['market4'] = {
    label = 'Market',
    coords = vector3(1728.07, 6415.63, 35.04),
    heading = 242.95,
    pedModel = "mp_m_shopkeep_01",
    TargetLabel = "Merhaba, kolay gelsin.",
    blip = {
        sprite = 52,
        color = 0,
        scale = 0.65,
        display = 4
    },
    items = "marketitemleri"
},

['market5'] = {
    label = 'Market',
    coords = vector3(1959.82, 3740.48, 32.34),
    heading = 301.57,
    pedModel = "mp_m_shopkeep_01",
    TargetLabel = "Merhaba, kolay gelsin.",
    blip = {
        sprite = 52,
        color = 0,
        scale = 0.65,
        display = 4
    },
    items = "marketitemleri"
},

['market6'] = {
    label = 'Market',
    coords = vector3(549.13, 2670.85, 42.16),
    heading = 99.39,
    pedModel = "mp_m_shopkeep_01",
    TargetLabel = "Merhaba, kolay gelsin.",
    blip = {
        sprite = 52,
        color = 0,
        scale = 0.65,
        display = 4
    },
    items = "marketitemleri"
},

['market7'] = {
    label = 'Market',
    coords = vector3(2677.47, 3279.76, 55.24),
    heading = 335.08,
    pedModel = "mp_m_shopkeep_01",
    TargetLabel = "Merhaba, kolay gelsin.",
    blip = {
        sprite = 52,
        color = 0,
        scale = 0.65,
        display = 4
    },
    items = "marketitemleri"
},

['market8'] = {
    label = 'Market',
    coords = vector3(2556.66, 380.84, 108.62),
    heading = 356.67,
    pedModel = "mp_m_shopkeep_01",
    TargetLabel = "Merhaba, kolay gelsin.",
    blip = {
        sprite = 52,
        color = 0,
        scale = 0.65,
        display = 4
    },
    items = "marketitemleri"
},

['market9'] = {
    label = 'Market',
    coords = vector3(372.66, 326.98, 103.57),
    heading = 253.73,
    pedModel = "mp_m_shopkeep_01",
    TargetLabel = "Merhaba, kolay gelsin.",
    blip = {
        sprite = 52,
        color = 0,
        scale = 0.65,
        display = 4
    },
    items = "marketitemleri"
},

['market10'] = {
    label = 'Market',
    coords = vector3(-47.02, -1758.23, 29.42),
    heading = 45.05,
    pedModel = "mp_m_shopkeep_01",
    TargetLabel = "Merhaba, kolay gelsin.",
    blip = {
        sprite = 52,
        color = 0,
        scale = 0.65,
        display = 4
    },
    items = "marketitemleri"
},

['market11'] = {
    label = 'Market',
    coords = vector3(-706.06, -913.97, 19.22),
    heading = 88.04,
    pedModel = "mp_m_shopkeep_01",
    TargetLabel = "Merhaba, kolay gelsin.",
    blip = {
        sprite = 52,
        color = 0,
        scale = 0.65,
        display = 4
    },
    items = "marketitemleri"
},

['market12'] = {
    label = 'Market',
    coords = vector3(-1820.02, 794.03, 138.09),
    heading = 135.45,
    pedModel = "mp_m_shopkeep_01",
    TargetLabel = "Merhaba, kolay gelsin.",
    blip = {
        sprite = 52,
        color = 0,
        scale = 0.65,
        display = 4
    },
    items = "marketitemleri"
},

['market13'] = {
    label = 'Market',
    coords = vector3(1164.71, -322.94, 69.21),
    heading = 101.72,
    pedModel = "mp_m_shopkeep_01",
    TargetLabel = "Merhaba, kolay gelsin.",
    blip = {
        sprite = 52,
        color = 0,
        scale = 0.65,
        display = 4
    },
    items = "marketitemleri"
},

['market14'] = {
    label = 'Market',
    coords = vector3(1697.87, 4922.96, 42.06),
    heading = 324.71,
    pedModel = "mp_m_shopkeep_01",
    TargetLabel = "Merhaba, kolay gelsin.",
    blip = {
        sprite = 52,
        color = 0,
        scale = 0.65,
        display = 4
    },
    items = "marketitemleri"
},




    -- Başka marketler de aynı şekilde items = "telefonlar" diyerek eklenebilir
}

Config.PaymentMethods = {
    ['cash'] = {
        label = 'Nakit',
        account = 'cash'
    },
    ['bank'] = {
        label = 'Banka Kartı',
        account = 'bank'
    }
}

Config.Language = {
    ['market_title'] = 'Teknoloji Marketi',
    ['search_placeholder'] = 'Bir şeyler ara...',
    ['category'] = 'Kategori',
    ['add_to_cart'] = 'Sepete Ekle',
    ['cart_total'] = 'Toplam',
    ['pay'] = 'Öde',
    ['clear_cart'] = 'Sepeti Temizle',
    ['exit'] = 'Çıkış',
    ['payment_screen'] = 'Ödeme Ekranı',
    ['payment_options'] = 'Seçenekler',
    ['cash'] = 'Nakit',
    ['bank_card'] = 'Banka Kartı',
    ['cancel'] = 'İptal',
    ['insufficient_funds'] = 'Yetersiz bakiye!',
    ['purchase_successful'] = 'Satın alma başarılı!',
    ['purchase_failed'] = 'Satın alma başarısız!',
    ['cart_empty'] = 'Sepetiniz boş!'
}