local Translations = {
    notifications = {
        ["char_deleted"] = "Karakter silindi!",
        ["deleted_other_char"] = "Vatandaş kimlik numarası %{citizenid} olan karakteri başarıyla sildiniz.",
        ["forgot_citizenid"] = "Vatandaş kimlik numarasını girmeyi unuttunuz!",
    },

    commands = {
        -- /deletechar
        ["deletechar_description"] = "Başka bir oyuncunun karakterini siler",
        ["citizenid"] = "Vatandaş Kimlik Numarası",
        ["citizenid_help"] = "Silmek istediğiniz karakterin Vatandaş Kimlik Numarası",
        ["logout_description"] = "Karakter menusune don",

        -- /closeNUI
        ["closeNUI_description"] = "Çoklu NUI'yi Kapat"
    },

    misc = {
        ["droppedplayer"] = "QBCore'dan ayrıldınız"
    },

    ui = {
        -- Ana
        characters_header = "Karakterlerim",
        emptyslot = "+",
        play_button = "OYNA",
        create_button = "YENİ KARAKTER  ",
        register_button = "ONAYLA",

        -- Karakter Bilgisi
        charinfo_header = "Karakter Bilgileri",
        charinfo_description = "Tüm karakter bilgilerini görmek için bir karakter yuvası seçin.",
        name = "İsim",
        male = "Erkek",
        female = "Kadın",
        firstname = "Ad",
        lastname = "Soyad",
        nationality = "Uyruk",
        gender = "Cinsiyet",
        birthdate = "Doğum Tarihi",
        job = "İş",
        jobgrade = "İş Kademesi",
        cash = "Nakit",
        bank = "Banka",
        phonenumber = "Telefon Numarası",
        accountnumber = "Hesap Numarası",

        chardel_header = "Karakter Kaydı",

        -- Karakter Silme
        deletechar_header = "Karakteri Sil",
        deletechar_description = "Karakterinizi Silmek İstediğinizden Emin Misiniz?",

        -- Düğmeler
        cancel = "İptal",
        confirm = "Onayla",

        -- Yükleniyor Metni
        retrieving_playerdata = "Oyuncu verisi alınıyor",
        validating_playerdata = "Oyuncu verisi doğrulanıyor",
        retrieving_characters = "Karakterler alınıyor",
        validating_characters = "Karakterler doğrulanıyor",

        -- Bildirimler
        ran_into_issue = "Bir sorunla karşılaştık",
        profanity = "Adınızda veya uyruğunuzda küfürlü veya kötü sözcükler kullanmaya çalışıyorsunuz gibi görünüyor!",
        forgotten_field = "Bir veya birkaç alanı girmeyi unutmuş gibi görünüyorsunuz!"
    }
}

Lang = Lang or Locale:new({
    phrases = Translations,
    warnOnMissing = true
})