-- function Notify(title, content, timeout, type, position, tag)
--     SendNUIMessage({
-- 		action = 'createNotify',
-- 		content = content,
-- 		timeout = timeout,
-- 		type = type,
-- 		position = position,
--         tag = tag,
-- 	})
-- end

function Notify(title, content, timeout, type, position, tag)
    SendNUIMessage({
        action = 'createNotify',
        data = {
            title = title,
            content = content,
            timeout = timeout,
            type = type,
            position = position,
            tag = tag,
        }
    })
end

RegisterNetEvent("xs:notify")
AddEventHandler("xs:notify", function(title, content, timeout, notifyType, position, tag)
    Notify(title, content, timeout, notifyType, position, tag)
end)

-- Test komutu (admin kullanımı için)
RegisterCommand('notifytest', function()
    TriggerEvent("xs:notify", "BAŞARILI", "xs-notify sistemi çalışıyor!", 5000, 1, 3, 'Nexora')
    Wait(2000)
    TriggerEvent("xs:notify", "HATA", "Test hata bildirimi", 5000, 0, 3, 'Nexora')
    Wait(2000)
    TriggerEvent("xs:notify", "UYARI", "Test uyarı bildirimi", 5000, 2, 3, 'Nexora')
    Wait(2000)
    TriggerEvent("xs:notify", "BİLGİ", "Test bilgi bildirimi", 5000, 3, 3, 'Nexora')
end, true)