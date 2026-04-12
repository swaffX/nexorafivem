local QBCore = exports['qb-core']:GetCoreObject()

-- Veritabanı tablosu oluştur
if Config.UseDatabase then
    MySQL.query([[CREATE TABLE IF NOT EXISTS `]] .. Config.DBTable .. [[` (
        `citizenid` VARCHAR(50) PRIMARY KEY,
        `first_join` TINYINT(1) DEFAULT 1,
        `join_date` TIMESTAMP DEFAULT CURRENT_TIMESTAMP
    )]], {})
end

-- Yeni oyuncu mu kontrol et
lib.callback.register('swx_welcome:isNewPlayer', function(source)
    local Player = QBCore.Functions.GetPlayer(source)
    if not Player then
        print('[SWX-Welcome] ERROR: Player not found for source: ' .. source)
        return false
    end

    local citizenid = Player.PlayerData.citizenid
    print('[SWX-Welcome] Checking if new player for citizenid: ' .. citizenid)

    if Config.UseDatabase then
        local result = MySQL.query.await('SELECT first_join FROM `' .. Config.DBTable .. '` WHERE citizenid = ?', {citizenid})
        if result and result[1] then
            -- Kayıt var, first_join değerine bak
            local firstJoinValue = result[1].first_join
            local isNew = firstJoinValue == 1
            print('[SWX-Welcome] Database record found, first_join: ' .. tostring(firstJoinValue) .. ', isNew: ' .. tostring(isNew))
            return isNew
        else
            -- Kayıt yok - bu oyuncu sistemden önce vardı, yeni değil
            -- Kayıt oluştur ve first_join = 0 yap (eski oyuncu olarak işaretle)
            print('[SWX-Welcome] No database record, marking as existing player (first_join = 0)')
            MySQL.insert('INSERT INTO `' .. Config.DBTable .. '` (citizenid, first_join) VALUES (?, 0)', {citizenid})
            return false
        end
    else
        -- QBCore metadata kullan
        local meta = Player.PlayerData.metadata
        if not meta.firstJoin then
            -- Metadata yok - eski oyuncu olarak işaretle
            print('[SWX-Welcome] No metadata found, marking as existing player')
            Player.Functions.SetMetaData('firstJoin', false)
            return false
        end
        local isNew = meta.firstJoin == true
        print('[SWX-Welcome] Metadata found, firstJoin: ' .. tostring(meta.firstJoin) .. ', isNew: ' .. tostring(isNew))
        return isNew
    end
end)

-- Başlangıç itemlerini ver
RegisterNetEvent('swx_welcome:giveStarterItems', function()
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)

    if not Player then return end

    -- Itemleri ver
    for _, item in ipairs(Config.StarterItems) do
        Player.Functions.AddItem(item.name, item.amount)
    end

    -- Para ver
    Player.Functions.AddMoney('cash', Config.StarterCash)
    Player.Functions.AddMoney('bank', Config.StarterBank)

    -- İlk giriş işaretle
    local citizenid = Player.PlayerData.citizenid
    if Config.UseDatabase then
        MySQL.update('UPDATE `' .. Config.DBTable .. '` SET first_join = 0 WHERE citizenid = ?', {citizenid})
    end

    QBCore.Functions.Notify(src, 'Başlangıç hediyelerin verildi!', 'success')
end)

-- Karakter oluşturulduğunda yeni oyuncu olarak işaretle
RegisterNetEvent('swx_welcome:characterCreated', function(citizenid)
    print('[SWX-Welcome] swx_welcome:characterCreated event fired for citizenid: ' .. citizenid)

    if not citizenid then
        print('[SWX-Welcome] ERROR: No citizenid provided')
        return
    end

    print('[SWX-Welcome] New character created for citizenid: ' .. citizenid .. ', marking as new player')

    if Config.UseDatabase then
        -- Kayıt varsa güncelle, yoksa oluştur, first_join = 1 yap
        local result = MySQL.query.await('SELECT citizenid FROM `' .. Config.DBTable .. '` WHERE citizenid = ?', {citizenid})
        if result and result[1] then
            MySQL.update.await('UPDATE `' .. Config.DBTable .. '` SET first_join = 1 WHERE citizenid = ?', {citizenid})
        else
            MySQL.insert.await('INSERT INTO `' .. Config.DBTable .. '` (citizenid, first_join) VALUES (?, 1)', {citizenid})
        end
        print('[SWX-Welcome] Database updated for citizenid: ' .. citizenid .. ', first_join = 1')
    end
end)

print('[SWX-Welcome] Server yüklendi!')
