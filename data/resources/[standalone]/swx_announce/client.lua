local QBCore = exports['qb-core']:GetCoreObject()

-- Duyuru sesi çal
local function PlayAnnouncementSound()
    -- Ses dosyasını NUI üzerinden çal
    SendNUIMessage({
        action = 'playSound',
        soundFile = 'voice.mp3'
    })
end

-- Modern duyuru göster (sadece üstten animasyonlu bildirim)
RegisterNetEvent('swx_announce:ShowAnnouncement', function(message, adminName)
    -- Duyuru sesini çal
    PlayAnnouncementSound()
    
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

-- NUI Başlatma - Resource start olduğunda NUI'yi yükle
AddEventHandler('onClientResourceStart', function(resourceName)
    if resourceName == GetCurrentResourceName() then
        -- NUI'yi başlat (görünmez şekilde)
        SendNUIMessage({
            action = 'init'
        })
        print('[SWX-Announce] Ses sistemi başlatıldı!')
    end
end)
