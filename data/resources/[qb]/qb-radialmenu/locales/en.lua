local Translations = {
    error = {
        no_people_nearby = "Yakında oyuncu yok",
        no_vehicle_found = "Araç bulunamadı",
        extra_deactivated = "Ekstra %{extra} devre dışı bırakıldı",
        extra_not_present = "Bu araçta %{extra} bulunmuyor",
        not_driver = "Aracın sürücüsü değilsin",
        vehicle_driving_fast = "Araç çok hızlı gidiyor",
        seat_occupied = "Bu koltuk dolu",
        race_harness_on = "Yarış kemeri takılı, koltuk değiştiremezsin",
        obj_not_found = "istenen nesne oluşturulamadı",
        not_near_ambulance = "Ambulans yakınında değilsin",
        far_away = "Çok uzaktasın",
        stretcher_in_use = "Bu sedye zaten kullanılıyor",
        not_kidnapped = "Bu kişiyi kaçırmadın",
        trunk_closed = "Bagaj kapalı",
        cant_enter_trunk = "Bu bagaja binemezsin",
        already_in_trunk = "Zaten bagajdasın",
        someone_in_trunk = "Bagajda biri var"
    },
    progress = {
        flipping_car = "Araç çevriliyor.."
    },
    success = {
        extra_activated = "Ekstra %{extra} etkinleştirildi",
        entered_trunk = "Bagaja girdin"
    },
    info = {
        no_variants = "Bunun için bir varyant yok gibi görünüyor",
        wrong_ped = "Bu ped modeli bu seçeneğe izin vermiyor",
        nothing_to_remove = "Çıkartacak bir şeyin yok",
        already_wearing = "Zaten bunu giyiyorsun",
        switched_seats = "Şimdi %{seat} konumundasın"
    },
    general = {
        command_description = "Radial Menüyü Aç",
        push_stretcher_button = "[E] - Sedye it",
        stop_pushing_stretcher_button = "~g~E~w~ - itmeyi Durdur",
        lay_stretcher_button = "[G] - Sedye Üzerine Yat",
        push_position_drawtext = "Buradan it",
        get_off_stretcher_button = "[G] - Sedyeden Kalk",
        get_out_trunk_button = "[E] Bagajdan Çık",
        close_trunk_button = "[G] Bagajı Kapat",
        open_trunk_button = "[G] Bagajı Aç",
        getintrunk_command_desc = "Bagaja Gir",
        putintrunk_command_desc = "Oyuncuyu Bagaja Koy"
    },
    options = {
        emergency_button = "Acil Durum Butonu",
        driver_seat = "Sürücü Koltuğu",
        passenger_seat = "Yolcu Koltuğu",
        other_seats = "Diğer Koltuk",
        rear_left_seat = "Arka Sol Koltuk",
        rear_right_seat = "Arka Sağ Koltuk"
    },
}

Lang = Lang or Locale:new({
    phrases = Translations,
    warnOnMissing = true
})
