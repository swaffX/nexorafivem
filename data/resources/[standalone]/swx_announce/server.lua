local QBCore = exports['qb-core']:GetCoreObject()

-- Duyuru komutu kaydet
QBCore.Commands.Add('duyuru', 'Admin duyuru gönder (Tüm oyunculara)', {{name = 'mesaj', help = 'Duyuru mesajı'}}, true, function(source, args)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    
    if not Player then return end
    
    -- Yetki kontrolü
    local playerGroup = Player.PlayerData.group
    if not Config.AllowedGroups[playerGroup] then
        TriggerClientEvent('QBCore:Notify', src, 'Bu komutu kullanma yetkiniz yok!', 'error', 3000)
        return
    end
    
    -- Mesajı birleştir
    local message = table.concat(args, ' ')
    
    if #message < 1 then
        TriggerClientEvent('QBCore:Notify', src, 'Duyuru mesajı boş olamaz!', 'error', 3000)
        return
    end
    
    -- Admin adını al
    local adminName = Player.PlayerData.name
    
    -- Tüm oyunculara duyuru gönder
    TriggerClientEvent('swx_announce:ShowAnnouncement', -1, message, adminName)
    
    -- Admin'e onay mesajı
    TriggerClientEvent('QBCore:Notify', src, 'Duyuru gönderildi: ' .. message, 'success', 3000)
    
    -- Server log (opsiyonel)
    print('[SWX-Announce] Duyuru gönderildi - Admin: ' .. adminName .. ' | Mesaj: ' .. message)
end, 'admin')
