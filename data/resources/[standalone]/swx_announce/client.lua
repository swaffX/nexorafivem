local QBCore = exports['qb-core']:GetCoreObject()

-- Modern duyuru göster
RegisterNetEvent('swx_announce:ShowAnnouncement', function(message, adminName)
    -- ox_lib alert kullanarak modern bildirim
    lib.alertDialog({
        header = '📢 ' .. Config.TitleStyle,
        content = message,
        centered = true,
        cancel = false,
        size = 'lg'
    })
    
    -- Ayrıca bildirim olarak da göster
    lib.notify({
        title = Config.TitleStyle,
        description = message,
        type = Config.NotifyType,
        duration = Config.NotifyDuration,
        position = Config.NotifyPosition,
        icon = Config.Icon,
        iconColor = '#FFD700'
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
