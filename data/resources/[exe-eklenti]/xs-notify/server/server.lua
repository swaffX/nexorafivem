-- Server-side event handler for 'xs:notify'
-- Tüm oyunculara bildirim gönder (broadcast)
AddEventHandler("xs:notify", function(title, content, timeout, notifyType, position, tag)
    TriggerClientEvent("xs:notify", -1, title, content, timeout, notifyType, position, tag)
end)

-- Server-side notify command (admin kullanımı için)
RegisterCommand('notifyall', function(source, args, rawCommand)
    local title = args[1] or "BİLGİ"
    local content = table.concat(args, " ", 2) or "Bildirim mesajı"
    TriggerEvent("xs:notify", title, content, 5000, 3, 3, "Nexora")
end, true)