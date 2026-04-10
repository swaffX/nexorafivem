local QBCore = exports['qb-core']:GetCoreObject()

-- Aktif kiralamaları takip et
local ActiveRentals = {}

-- Araç Kiralama Callback
QBCore.Functions.CreateCallback('swx_rentacar:rentVehicle', function(source, cb, vehicleData)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    
    if not Player then
        cb(false, 'Oyuncu bulunamadı!')
        return
    end
    
    -- Fiyat kontrolü
    local price = vehicleData.price
    local account = Config.PaymentAccount
    
    -- Para kontrolü
    if account == 'cash' then
        local cash = Player.PlayerData.money.cash
        if cash < price then
            cb(false, 'Yeterli nakit paranız yok! (' .. price .. '$)')
            return
        end
    else
        local bank = Player.PlayerData.money.bank
        if bank < price then
            cb(false, 'Yeterli banka bakiyeniz yok! (' .. price .. '$)')
            return
        end
    end
    
    -- Ödeme al
    local paymentSuccess = Player.Functions.RemoveMoney(account, price, 'arac-kiralama')
    
    if not paymentSuccess then
        cb(false, 'Ödeme işlemi başarısız!')
        return
    end
    
    -- Kiralama kaydı
    local citizenid = Player.PlayerData.citizenid
    local rentalData = {
        citizenid = citizenid,
        vehicle = vehicleData.model,
        price = price,
        rentTime = os.time(),
        expireTime = Config.RentDuration > 0 and (os.time() + (Config.RentDuration * 60)) or nil,
        source = src
    }
    
    -- Veritabanına kaydet (opsiyonel)
    MySQL.insert('INSERT INTO swx_rentals (citizenid, vehicle, price, rent_time, expire_time) VALUES (?, ?, ?, ?, ?)', {
        citizenid,
        vehicleData.model,
        price,
        rentalData.rentTime,
        rentalData.expireTime
    }, function(id)
        if id then
            rentalData.id = id
            ActiveRentals[src] = rentalData
            
            -- Bildirim
            TriggerClientEvent('ox_lib:notify', src, {
                title = 'Araç Kiralandı!',
                description = vehicleData.label .. ' ' .. price .. '$ karşılığında kiralandı!',
                type = 'success',
                duration = 5000
            })
            
            cb(true, 'Kiralama başarılı!')
        else
            -- Para iade
            Player.Functions.AddMoney(account, price, 'arac-kiralama-iptal')
            cb(false, 'Kiralama kaydı oluşturulamadı!')
        end
    end)
end)

-- Veritabanı tablosu oluştur
CreateThread(function()
    MySQL.query([[
        CREATE TABLE IF NOT EXISTS swx_rentals (
            id INT AUTO_INCREMENT PRIMARY KEY,
            citizenid VARCHAR(50) NOT NULL,
            vehicle VARCHAR(50) NOT NULL,
            price INT NOT NULL,
            rent_time INT NOT NULL,
            expire_time INT,
            returned BOOLEAN DEFAULT FALSE,
            return_time INT,
            INDEX (citizenid),
            INDEX (rent_time)
        )
    ]], {}, function(result)
        print('[SWX-RentACar] Veritabanı tablosu kontrol edildi/oluşturuldu')
    end)
end)

-- Kiralama süresi kontrolü
CreateThread(function()
    while true do
        Wait(60000) -- Her dakika kontrol et
        
        local currentTime = os.time()
        
        for src, rentalData in pairs(ActiveRentals) do
            -- Süresi dolmuş mu kontrol et
            if rentalData.expireTime and currentTime > rentalData.expireTime then
                local Player = QBCore.Functions.GetPlayer(src)
                
                if Player then
                    TriggerClientEvent('ox_lib:notify', src, {
                        title = 'Kiralama Süresi Doldu',
                        description = 'Kiralama süreniz doldu. Araç geri alındı.',
                        type = 'warning'
                    })
                end
                
                -- Araç sil (client tarafında yapılacak)
                TriggerClientEvent('swx_rentacar:rentalExpired', src)
                
                -- Kayıttan sil
                ActiveRentals[src] = nil
            end
        end
    end
end)

-- Oyuncu çıkış yaptığında
RegisterNetEvent('QBCore:Server:OnPlayerUnload', function(src)
    if ActiveRentals[src] then
        -- Araç sil (client tarafında yapılacak)
        TriggerClientEvent('swx_rentacar:rentalExpired', src)
        ActiveRentals[src] = nil
    end
end)

-- Araç iade (opsiyonel)
RegisterCommand('araciade', function(source)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    
    if not Player then return end
    
    if ActiveRentals[src] then
        -- İade işlemi
        ActiveRentals[src] = nil
        
        TriggerClientEvent('swx_rentacar:returnVehicle', src)
        
        TriggerClientEvent('ox_lib:notify', src, {
            title = 'Araç İade Edildi',
            description = 'Kiralık araç başarıyla iade edildi!',
            type = 'success'
        })
    else
        TriggerClientEvent('ox_lib:notify', src, {
            title = 'Hata',
            description = 'Aktif kiralamanız bulunmuyor!',
            type = 'error'
        })
    end
end, false)

-- Admin: Tüm kiralamaları gör
RegisterCommand('kiralamalar', function(source)
    local src = source
    
    MySQL.query('SELECT * FROM swx_rentals ORDER BY rent_time DESC LIMIT 20', {}, function(results)
        if results and #results > 0 then
            print('^2[SWX-RentACar] Son 20 Kiralama:^7')
            for _, rental in ipairs(results) do
                print(string.format('  - %s | %s | %d$ | %s', 
                    rental.citizenid, 
                    rental.vehicle, 
                    rental.price,
                    rental.returned and 'İade Edildi' or 'Aktif'
                ))
            end
        else
            print('^3[SWX-RentACar] Kiralama kaydı bulunamadı^7')
        end
    end)
end, true) -- Admin only

print('[SWX-RentACar] Server yüklendi!')
