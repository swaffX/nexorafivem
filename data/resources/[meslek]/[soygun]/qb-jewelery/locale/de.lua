local Translations = {
    error = {
        fingerprints = 'Du hast Fingerabdrücke am Glas hinterlassen...',
        minimum_police = '%{value} Polizisten benötigt',
        wrong_weapon = 'Deine Waffe ist nicht stark genug..',
        to_much = 'Du hast zu viel in deinen Tas!'
    },
    success = {},
    info = {
        progressbar = 'Glas bre',
    },
    general = {
        target_label = 'Vitrine aufbre',
        drawtextui_grab = '~o~[~b~E~o~]~w~ um aufzubre',
        drawtextui_broken = 'AUFGEBRO'
    }
}

Lang = Locale:new({phrases = Translations})
