local Translations = {
    error = {
        canceled = 'İptal edildi',
        max_ammo = 'Şarjör dolu',
        no_weapon = 'Silahın yok',
        wrong_ammo = 'Yanlış mermi deniyorsun',
        no_support_attachment = 'Bu silaha bu eklentiyi takamazsın',
        no_weapon_in_hand = 'Silah elinde değil',
        weapon_broken = 'Silah kötü durumda veya kullanılamaz',
        no_damage_on_weapon = 'Silah hasarlı durumda değil',
        weapon_broken_need_repair = 'Silahın hasarlı durumda, kullanabilmek için onarman lazım',
        attachment_already_on_weapon = 'Silahında zaten %{value} var'
    },
    success = {
        reloaded = 'Doldurdun'
    },
    info = {
        loading_bullets = 'Mermi dolduruyorsun',
        repairshop_not_usable = 'Onarım şuanda kullanım dışı',
        weapon_will_repair = 'Silahın onarılacak',
        take_weapon_back = '[E] - Silahı geri al',
        repair_weapon_price = '[E] Silahı tamir et, ~g~$%{value}~w~',
        removed_attachment = 'Silahından %{value} eklentisini çıkarttın',
        hp_of_weapon = 'Silahın durumu'
    },
    mail = {
        sender = 'Tyrone',
        subject = 'Onarım',
        message = '%{value} tamir edildi ve bu konumda. <br><br> Peace out madafaka'
    },
}

Lang = Locale:new({
    phrases = Translations,
    warnOnMissing = true
})
