local Translations = {
    error = {
        minimum_store_robbery_police = "Yeterli Polis Yok (%{MinimumStoreRobberyPolice} Gerekli)",
        not_driver = "Sen Sürücü Değilsin",
        demolish_vehicle = "Artık Araçları Yıkmanıza İzin Verilmiyor",
        process_canceled = "İşlem iptal edildi..",
        you_broke_the_lock_pick = "Kilit Seçimini Kırdın",
    },
    text = {
        the_cash_register_is_empty = "Yazarkasa Boş",
        try_combination = "~g~E~w~ - Kasayı açmayı deneyin",
        safe_opened = "Güvenli Açıldı",
        emptying_the_register= "Kayıt Boşaltma..",
        safe_code = "Kasa Şifresi: "
    },
    email = {
        shop_robbery = "10-31 | Market Soygunu",
        someone_is_trying_to_rob_a_store = "Birisi %{street} Adresindeki Bir Marketi Soymaya Çalışıyor (KAMERA Kimliği: %{cameraId1})",
        storerobbery_progress = "Market soygunu devam ediyor"
    },
}

Lang = Locale:new({
    phrases = Translations,
    warnOnMissing = true
})