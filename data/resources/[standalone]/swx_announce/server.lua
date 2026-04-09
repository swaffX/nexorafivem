local QBCore = exports['qb-core']:GetCoreObject()

-- Admin kontrol fonksiyonu
local function IsAdmin(src)
    -- Ace permission kontrolü (txAdmin / in-game admin)
    if IsPlayerAceAllowed(src, 'command.duyuru') then
        return true
    end
    
    -- QBCore grup kontrolü
    local Player = QBCore.Functions.GetPlayer(src)
    if Player then
        local playerGroup = Player.PlayerData.group or 'user'
        if Config.AllowedGroups[playerGroup] then
            return true
        end
        
        -- Job kontrolü (police, ambulance vb. high rank)
        local job = Player.PlayerData.job
        if job and Config.AllowedGroups[job.name] then
            return true
        end
    end
    
    return false
end

-- Duyuru komutu kaydet
QBCore.Commands.Add('duyuru', 'Admin duyuru gönder (Tüm oyunculara)', {{name = 'mesaj', help = 'Duyuru mesajı'}}, true, function(source, args)
    local src = source
    
    -- Yetki kontrolü
    if not IsAdmin(src) then
        TriggerClientEvent('QBCore:Notify', src, 'Bu komutu kullanma yetkiniz yok!', 'error', 3000)
        return
    end
    
    local Player = QBCore.Functions.GetPlayer(src)
    if not Player then return end
    
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
