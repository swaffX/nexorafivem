local Translations = {
    error = {
        lockpick_fail = "Maymuncuk Başarısız",
        door_not_found = "Bir model karma almadınız, kapı şeffafsa, kapının çerçevesini hedeflediğinizden emin olun",
        same_entity = "Her iki kapı da aynı obje olamaz",
        door_registered = "Bu kapı zaten kayıtlı",
        door_identifier_exists = "Yapılandırmada bu tanımlayıcıya sahip bir kapı zaten var. (%s)",
    },
    success = {
        lockpick_success = "Maymuncuk başarılı"
    },
    general = {
        locked = "Kilitli",
        unlocked = "Açık",
        locked_button = "[E] - Kilitli",
        unlocked_button = "[E] - Açık",
        keymapping_description = "Kapı kilitleriyle etkileşim",
        keymapping_remotetriggerdoor = "Bir kapıyı uzaktan tetikleme",
        locked_menu = "Kilitli",
        pickable_menu = "Takılabilir",
        cantunlock_menu = 'Kilidi açamıyorum',
        hidelabel_menu = 'Kapı Etiketini Gizle',
        distance_menu = "Maks. Mesafe",
        item_authorisation_menu = "Öğe Yetkilendirme",
        citizenid_authorisation_menu = "CitizenID Yetkilendirmesi",
        gang_authorisation_menu = "Çete Yetkilendirmesi",
        job_authorisation_menu = "Meslek Yetkilendirmesi",
        doortype_title = "Kapı Tipi",
        doortype_door = "Tek Kapı",
        doortype_double = "Çift Kapı",
        doortype_sliding = "Tek Sürgülü kapı",
        doortype_doublesliding = "Çift Sürgülü kapı",
        doortype_garage = "Garaj",
        dooridentifier_title = "benzersiz tanımlayıcı",
        doorlabel_title = "Kapı Etiketi",
        configfile_title = "Yapılandırma Dosyası Adı",
        submit_text = "gönderin",
        newdoor_menu_title = "Add a new door",
        newdoor_command_description = "Add a new door to the doorlock system",
        doordebug_command_description = "Toggle debug mode",
        warning = "Warning",
        created_by = "created by",
        warn_no_permission_newdoor = "%{player} (%{license}) tried to add a new door without permission (source: %{source})",
        warn_no_authorisation = "%{player} (%{license}) attempted to open a door without authorisation (Sent: %{doorID})",
        warn_wrong_doorid = "%{player} (%{license}) attempted to update invalid door (Sent: %{doorID})",
        warn_wrong_state = "%{player} (%{license}) attempted to update to an invalid state (Sent: %{state})",
        warn_wrong_doorid_type = "%{player} (%{license}) didn't send an appropriate doorID (Sent: %{doorID})",
        warn_admin_privilege_used = "%{player} (%{license}) opened a door using admin privileges"
    }
}

Lang = Locale:new({
    phrases = Translations,
    warnOnMissing = true
})