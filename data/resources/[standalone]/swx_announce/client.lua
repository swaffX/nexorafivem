local QBCore = exports['qb-core']:GetCoreObject()

-- Modern duyuru göster (sadece üstten animasyonlu bildirim)
RegisterNetEvent('swx_announce:ShowAnnouncement', function(message, adminName)
    -- Modern bildirim (animasyonlu, yukarıdan gelen)
    lib.notify({
        title = '📢 ' .. Config.TitleStyle,
        description = message,
        type = Config.NotifyType,
        duration = Config.NotifyDuration,
        position = Config.NotifyPosition,
        icon = Config.Icon,
        iconColor = '#FFD700',
        showDuration = true
    })
    
    -- Ayrıca chat'e de yaz
    TriggerEvent('chat:addMessage', {
        color = {255, 215, 0},
        multiline = true,
        args = {'[DUYURU] ' .. adminName, message}
    })
end)

-- Chat üzerinden duyuru (opsiyonel)
RegisterNetEvent('swx_announce:ShowChatAnnouncement', function(message, adminName)
    -- Chat'e renkli mesaj gönder
    TriggerEvent('chat:addMessage', {
        color = {255, 215, 0},
        multiline = true,
        args = {'📢 [DUYURU] ' .. adminName, message}
    })
end)
