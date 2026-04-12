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
    if not Player then return false end
    
    local citizenid = Player.PlayerData.citizenid
    
    if Config.UseDatabase then
        local result = MySQL.query.await('SELECT first_join FROM `' .. Config.DBTable .. '` WHERE citizenid = ?', {citizenid})
        if result and result[1] then
            return result[1].first_join == 1
        else
            -- İlk kez giriş, kaydet
            MySQL.insert('INSERT INTO `' .. Config.DBTable .. '` (citizenid, first_join) VALUES (?, 1)', {citizenid})
            return true
        end
    else
        -- QBCore metadata kullan
        local meta = Player.PlayerData.metadata
        if not meta.firstJoin then
            Player.Functions.SetMetaData('firstJoin', true)
            return true
        end
        return false
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

-- Karakter görünümü kaydedildiğinde kontrol et (karakter oluşturma tamamlandıktan sonra)
RegisterServerEvent("fivem-appearance:server:saveAppearance", function(appearance)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)

    if not Player then return end

    print('[SWX-Welcome] fivem-appearance:server:saveAppearance event triggered for player: ' .. src)

    -- Yeni oyuncu mu kontrol et
    local isNew = lib.callback.await('swx_welcome:isNewPlayer', false, src)

    print('[SWX-Welcome] isNewPlayer callback result: ' .. tostring(isNew))

    if isNew then
        -- Kısa gecikme ile göster (karakter spawn olana kadar)
        SetTimeout(2000, function()
            print('[SWX-Welcome] Triggering client event for player: ' .. src)
            TriggerClientEvent('swx_welcome:checkNewPlayer', src)
        end)
    end
end)

print('[SWX-Welcome] Server yüklendi!')
