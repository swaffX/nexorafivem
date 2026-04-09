local Translations = {
    error = {
        no_vehicles = "Bu konumda araç yok!",
        not_impound = "Aracınız çekilmişlerde değil",
        not_owned = "Bu araç sana ait değil!",
        not_correct_type = "Bu tür bir aracı burada depolayamazsınız",
        not_enough = "Yetersiz para",
        no_garage = "Hiçbiri",
        too_far_away = "Otoparktan çok uzaksın!",
        occupied = "Otopark zaten dolu",
        all_occupied = "Tüm park yerleri dolu",
        no_vehicle = "Park edecek araç yok",
        no_house_keys = "Bu evin garajının anahtarları sende yok",
    },
    success = {
        vehicle_parked = "Aracı garaja koydun",
    },
    menu = {
        header = {
            house_garage = "Ev Garajı",
            house_car = "Ev Garajı %{value}",
            public_car = "Garaj %{value}",
            public_sea = "Bot garajı %{value}",
            public_air = "Hangar %{value}",
            job_car = "İş Garajı %{value}",
            job_sea = "İş Kayıkhanesi %{value}",
            job_air = "İş Hangar %{value}",
            gang_car = "Çete Garajı %{value}",
            gang_sea = "Çete kayıkhanesi %{value}",
            gang_air = "Çete Hangar %{value}",
            depot_car = "Çekilmiş %{value}",
            depot_sea = "Çekilmiş %{value}",
            depot_air = "Çekilmiş %{value}",
            vehicles = "Mevcut Araçlar",
            depot = "%{value} [ $%{value2} ]",
            garage = "%{value} [ %{value2} ]",
        },
        leave = {
            car = "⬅ Garajdan Ayrıl",
            sea = "⬅ Kayıkhaneden ayrıl",
            air = "⬅ Hangar'dan ayrıl",
            job = "⬅ Garajdan Ayrıl"
        },
        text = {
            vehicles = "Araçlarınızı görüntüleyin!",
            depot = "Plaka: %{value}\nBenzin: %{value2} | Motor: %{value3}",
            garage = "Durum: %{value}\nBenzin: %{value2} | Motor: %{value3}",
        }
    },
    status = {
        out = "Dışarıda",
        garaged = "Garajda",
        impound = "Çekilmişlerde",
    },
}

Lang = Locale:new({
    phrases = Translations,
    warnOnMissing = true
})
