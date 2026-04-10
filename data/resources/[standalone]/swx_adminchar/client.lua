local QBCore = exports['qb-core']:GetCoreObject()

-- Komut yardımcı mesajları
RegisterCommand("chardelhelp", function()
    TriggerEvent('chat:addMessage', {
        color = {255, 0, 0},
        multiline = true,
        args = {"[AdminChar]", "Karakter Silme Komutları:"}
    })
    TriggerEvent('chat:addMessage', {
        color = {255, 255, 0},
        multiline = true,
        args = {"", "/delchar [citizenid] - CitizenID ile karakter sil"}
    })
    TriggerEvent('chat:addMessage', {
        color = {255, 255, 0},
        multiline = true,
        args = {"", "/delcharid [oyuncu_id] - Online oyuncu karakterini sil"}
    })
    TriggerEvent('chat:addMessage', {
        color = {255, 255, 0},
        multiline = true,
        args = {"", "/listchars [isim] - Tüm karakterleri listele"}
    })
end, false)

print("^2[SWX-AdminChar] Client yüklendi!^7")
