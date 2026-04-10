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
    local result = MySQL.query.await('SELECT * FROM players WHERE citizenid = ?', {citizenid})
    if result and #result > 0 then
        local playerData = result[1]
        local charName = playerData.charinfo and json.decode(playerData.charinfo).firstname .. " " .. json.decode(playerData.charinfo).lastname or "Bilinmiyor"
        
        -- İlişkili tabloları sil (sadece var olan tablolar)
        MySQL.query.await('DELETE FROM player_vehicles WHERE citizenid = ?', {citizenid})
        MySQL.query.await('DELETE FROM player_houses WHERE citizenid = ?', {citizenid})
        MySQL.query.await('DELETE FROM player_outfits WHERE citizenid = ?', {citizenid})
        MySQL.query.await('DELETE FROM player_contacts WHERE citizenid = ?', {citizenid})
        MySQL.query.await('DELETE FROM playerskins WHERE citizenid = ?', {citizenid})
        MySQL.query.await('DELETE FROM stashitems WHERE stash LIKE ?', {"%"..citizenid.."%"})
        MySQL.query.await('DELETE FROM apartments WHERE citizenid = ?', {citizenid})
        
        -- Ana karakter kaydını sil
        local delResult = MySQL.query.await('DELETE FROM players WHERE citizenid = ?', {citizenid})
        if delResult and delResult.affectedRows > 0 then
            TriggerClientEvent('QBCore:Notify', src, "Karakter silindi: " .. charName .. " (" .. citizenid .. ")", "success")
            print("^2[SWX-AdminChar] Karakter silindi: " .. charName .. " | CitizenID: " .. citizenid .. "^7")
        else
            TriggerClientEvent('QBCore:Notify', src, "Karakter silinirken hata oluştu!", "error")
        end
    else
        TriggerClientEvent('QBCore:Notify', src, "Bu CitizenID'ye sahip karakter bulunamadı!", "error")
    end
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
    MySQL.query.await('DELETE FROM player_vehicles WHERE citizenid = ?', {citizenid})
    MySQL.query.await('DELETE FROM player_houses WHERE citizenid = ?', {citizenid})
    MySQL.query.await('DELETE FROM player_outfits WHERE citizenid = ?', {citizenid})
    MySQL.query.await('DELETE FROM player_contacts WHERE citizenid = ?', {citizenid})
    MySQL.query.await('DELETE FROM playerskins WHERE citizenid = ?', {citizenid})
    MySQL.query.await('DELETE FROM stashitems WHERE stash LIKE ?', {"%"..citizenid.."%"})
    MySQL.query.await('DELETE FROM apartments WHERE citizenid = ?', {citizenid})
    
    -- Ana karakter kaydını sil
    local delResult = MySQL.query.await('DELETE FROM players WHERE citizenid = ?', {citizenid})
    if delResult and delResult.affectedRows > 0 then
        TriggerClientEvent('QBCore:Notify', src, "Karakter silindi: " .. charName .. " (" .. citizenid .. ")", "success")
        print("^2[SWX-AdminChar] Online oyuncu karakteri silindi: " .. charName .. " | CitizenID: " .. citizenid .. "^7")
    else
        TriggerClientEvent('QBCore:Notify', src, "Karakter silinirken hata oluştu!", "error")
    end
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
    
    local results = MySQL.query.await(query, {})
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
end, "admin")

-- Admin: Tüm karakterleri sil (DİKKAT: GERİ DÖNÜŞÜZ)
QBCore.Commands.Add("delallchars", "Tüm Karakterleri Sil (DİKKAT: Geri Dönüşsüz)", {}, true, function(source, args)
    local src = source
    
    -- Önce kaç karakter olduğunu say
    local countResult = MySQL.query.await('SELECT COUNT(*) as count FROM players', {})
    local charCount = countResult[1].count
    
    if charCount == 0 then
        TriggerClientEvent('QBCore:Notify', src, "Silinecek karakter bulunamadı!", "error")
        return
    end
    
    -- İlişkili tabloları temizle
    MySQL.query.await('DELETE FROM player_vehicles')
    MySQL.query.await('DELETE FROM player_houses')
    MySQL.query.await('DELETE FROM player_outfits')
    MySQL.query.await('DELETE FROM player_contacts')
    MySQL.query.await('DELETE FROM playerskins')
    MySQL.query.await('DELETE FROM stashitems')
    MySQL.query.await('DELETE FROM apartments')
    
    -- Ana karakter kayıtlarını sil
    local delResult = MySQL.query.await('DELETE FROM players')
    if delResult and delResult.affectedRows > 0 then
        TriggerClientEvent('QBCore:Notify', src, charCount .. " karakter başarıyla silindi!", "success")
        print("^2[SWX-AdminChar] TÜM KARAKTERLER SİLİNDİ: " .. charCount .. " karakter^7")
        print("^3[SWX-AdminChar] Bu işlem geri alınamaz!^7")
    else
        TriggerClientEvent('QBCore:Notify', src, "Karakterler silinirken hata oluştu!", "error")
    end
end, "admin")

print("^2[SWX-AdminChar] Admin Character Delete Tool yüklendi!^7")
print("^3Komutlar: /delchar [citizenid] | /delcharid [oyuncu_id] | /listchars [isim] | /delallchars^7")
