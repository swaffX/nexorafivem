local QBCore = exports['qb-core']:GetCoreObject()

-- Admin: Herhangi bir oyuncunun karakterini sil (CitizenID ile)
QBCore.Commands.Add("delchar", "Karakter Sil (Admin - CitizenID)", {{name = "citizenid", help = "Oyuncunun CitizenID'si"}}, true, function(source, args)
    local src = source
    local citizenid = args[1]
    
    if not citizenid then
        TriggerClientEvent('QBCore:Notify', src, "CitizenID girmelisiniz!", "error")
        return
    end
    
    -- Karakter var mı kontrol et
    MySQL.query('SELECT * FROM players WHERE citizenid = ?', {citizenid}, function(result)
        if result and #result > 0 then
            local playerData = result[1]
            local charName = playerData.charinfo and json.decode(playerData.charinfo).firstname .. " " .. json.decode(playerData.charinfo).lastname or "Bilinmiyor"
            
            -- İlişkili tabloları sil (sadece var olan tablolar)
            MySQL.query('DELETE FROM player_vehicles WHERE citizenid = ?', {citizenid})
            MySQL.query('DELETE FROM player_houses WHERE citizenid = ?', {citizenid})
            MySQL.query('DELETE FROM player_outfits WHERE citizenid = ?', {citizenid})
            MySQL.query('DELETE FROM player_contacts WHERE citizenid = ?', {citizenid})
            MySQL.query('DELETE FROM playerskins WHERE citizenid = ?', {citizenid})
            MySQL.query('DELETE FROM stashitems WHERE stash LIKE ?', {"%"..citizenid.."%"})
            MySQL.query('DELETE FROM apartments WHERE citizenid = ?', {citizenid})
            
            -- Ana karakter kaydını sil
            MySQL.query('DELETE FROM players WHERE citizenid = ?', {citizenid}, function(delResult)
                if delResult and delResult.affectedRows > 0 then
                    TriggerClientEvent('QBCore:Notify', src, "Karakter silindi: " .. charName .. " (" .. citizenid .. ")", "success")
                    print("^2[SWX-AdminChar] Karakter silindi: " .. charName .. " | CitizenID: " .. citizenid .. "^7")
                else
                    TriggerClientEvent('QBCore:Notify', src, "Karakter silinirken hata oluştu!", "error")
                end
            end)
        else
            TriggerClientEvent('QBCore:Notify', src, "Bu CitizenID'ye sahip karakter bulunamadı!", "error")
        end
    end)
end, "admin")

-- Admin: Oyuncu ID'sine göre karakter sil (online oyuncu)
QBCore.Commands.Add("delcharid", "Online Oyuncu Karakterini Sil (Admin)", {{name = "id", help = "Oyuncu ID'si"}}, true, function(source, args)
    local src = source
    local targetId = tonumber(args[1])
    
    if not targetId then
        TriggerClientEvent('QBCore:Notify', src, "Geçerli bir oyuncu ID'si girin!", "error")
        return
    end
    
    local targetPlayer = QBCore.Functions.GetPlayer(targetId)
    
    if not targetPlayer then
        TriggerClientEvent('QBCore:Notify', src, "Bu ID'de oyuncu bulunamadı!", "error")
        return
    end
    
    local citizenid = targetPlayer.PlayerData.citizenid
    local charName = targetPlayer.PlayerData.charinfo.firstname .. " " .. targetPlayer.PlayerData.charinfo.lastname
    
    -- Önce oyuncuyu kickle
    DropPlayer(targetId, "Karakteriniz silindi. Lütfen tekrar giriş yapın.")
    
    -- Kısa bekleme sonra karakteri sil
    Citizen.Wait(1000)
    
    -- İlişkili tabloları sil (sadece var olan tablolar)
    MySQL.query('DELETE FROM player_vehicles WHERE citizenid = ?', {citizenid})
    MySQL.query('DELETE FROM player_houses WHERE citizenid = ?', {citizenid})
    MySQL.query('DELETE FROM player_outfits WHERE citizenid = ?', {citizenid})
    MySQL.query('DELETE FROM player_contacts WHERE citizenid = ?', {citizenid})
    MySQL.query('DELETE FROM playerskins WHERE citizenid = ?', {citizenid})
    MySQL.query('DELETE FROM stashitems WHERE stash LIKE ?', {"%"..citizenid.."%"})
    MySQL.query('DELETE FROM apartments WHERE citizenid = ?', {citizenid})
    
    -- Ana karakter kaydını sil
    MySQL.query('DELETE FROM players WHERE citizenid = ?', {citizenid}, function(delResult)
        if delResult and delResult.affectedRows > 0 then
            TriggerClientEvent('QBCore:Notify', src, "Karakter silindi: " .. charName .. " (" .. citizenid .. ")", "success")
            print("^2[SWX-AdminChar] Online oyuncu karakteri silindi: " .. charName .. " | CitizenID: " .. citizenid .. "^7")
        else
            TriggerClientEvent('QBCore:Notify', src, "Karakter silinirken hata oluştu!", "error")
        end
    end)
end, "admin")

-- Admin: Tüm karakterleri listele
QBCore.Commands.Add("listchars", "Tüm Karakterleri Listele", {{name = "name", help = "İsim arama (opsiyonel)"}}, false, function(source, args)
    local src = source
    local searchName = args[1] or ""
    
    local query = "SELECT citizenid, charinfo, job, money FROM players"
    if searchName ~= "" then
        query = query .. " WHERE JSON_EXTRACT(charinfo, '$.firstname') LIKE '%" .. searchName .. "%' OR JSON_EXTRACT(charinfo, '$.lastname') LIKE '%" .. searchName .. "%'"
    end
    query = query .. " LIMIT 50"
    
    MySQL.query(query, {}, function(results)
        if results and #results > 0 then
            print("^2[SWX-AdminChar] Karakter Listesi:^7")
            for _, player in ipairs(results) do
                local charinfo = json.decode(player.charinfo) or {}
                local name = (charinfo.firstname or "") .. " " .. (charinfo.lastname or "")
                local job = json.decode(player.job) or {}
                local money = json.decode(player.money) or {}
                
                print(string.format("  - %s | %s | Meslek: %s | Nakit: $%s", 
                    player.citizenid, 
                    name,
                    job.label or "Yok",
                    money.cash or 0
                ))
            end
            TriggerClientEvent('QBCore:Notify', src, #results .. " karakter listelendi (console'da görüntüleyin)", "success")
        else
            TriggerClientEvent('QBCore:Notify', src, "Karakter bulunamadı!", "error")
        end
    end)
end, "admin")

print("^2[SWX-AdminChar] Admin Character Delete Tool yüklendi!^7")
print("^3Komutlar: /delchar [citizenid] | /delcharid [oyuncu_id] | /listchars [isim]^7")
