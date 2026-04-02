local QBCore = exports['qb-core']:GetCoreObject()

-- Tüm moteller için kilit durumlarını tutacak tablo
local motelLockStates = {}

-- Config'den motelleri yükle ve kilit durumlarını başlat
Citizen.CreateThread(function()
    for motelName, motelData in pairs(Config.Motels) do
        motelLockStates[motelName] = {}
        for roomId, _ in pairs(motelData.rooms) do
            motelLockStates[motelName][roomId] = {locked = true}
        end
    end
end)

local rentedRooms = {}

-- Kiralanan odaları db'den yükle
Citizen.CreateThread(function()
    local result = exports.oxmysql:executeSync("SELECT * FROM motel_rentals")
    for _, v in pairs(result) do
        rentedRooms[v.motel .. "_" .. v.room] = {
            citizenid = v.citizenid,
            rent_timestamp = tonumber(v.rent_timestamp),
        }
    end
end)

QBCore.Functions.CreateCallback('motel:getAvailableRooms', function(source, cb, motel)
    local availableRooms = {}
    if Config.Motels[motel] then
        for roomId, _ in pairs(Config.Motels[motel].rooms) do
            if rentedRooms[motel .. "_" .. roomId] == nil then
                table.insert(availableRooms, roomId)
            end
        end
    end
    cb(availableRooms)
end)

local playerRooms = {}

RegisterNetEvent('motel:getPlayerRooms')
AddEventHandler('motel:getPlayerRooms', function()
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    if not Player then return end

    local citizenid = Player.PlayerData.citizenid
    local rooms = {}

    for key, data in pairs(rentedRooms) do
        if data.citizenid == citizenid then
            local motelName, roomId = key:match("([^_]+)_(%d+)")
            if motelName and roomId then
                table.insert(rooms, {motel = motelName, room = tonumber(roomId)})
            end
        end
    end

    TriggerClientEvent('motel:sendPlayerRooms', src, rooms)
end)

RegisterNetEvent('motel:getPlayerRoomsForCancel', function()
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    if not Player then return end

    local citizenid = Player.PlayerData.citizenid
    local playerRooms = {}

    for key, data in pairs(rentedRooms) do
        if data.citizenid == citizenid then
            local motel, room = key:match("([^_]+)_(%d+)")
            if motel and room then
                table.insert(playerRooms, {motel = motel, room = tonumber(room)})
            end
        end
    end

    TriggerClientEvent("motel:client:showCancelRoomMenu", src, playerRooms)
end)

RegisterNetEvent('motel:cancelRoom', function(motel, room)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    if not Player then return end

    if not motel or not room then
        TriggerClientEvent('QBCore:Notify', src, "Geçersiz motel veya oda bilgisi.", "error")
        return
    end

    local key = motel .. "_" .. room

    if rentedRooms[key] and rentedRooms[key].citizenid == Player.PlayerData.citizenid then
        -- Anahtarı sil
        local items = Player.Functions.GetItemsByName('motelkey')
        for _, item in pairs(items) do
            if item.info and item.info.motel == "hb_" .. motel and item.info.room == tonumber(room) then
                Player.Functions.RemoveItem('motelkey', 1, item.slot)
                break
            end
        end

        -- DB'den sil
        exports.oxmysql:execute('DELETE FROM motel_rentals WHERE citizenid = ? AND motel = ? AND room = ?', {
            Player.PlayerData.citizenid,
            motel,
            room
        })

        -- Bellekten sil
        rentedRooms[key] = nil

        -- Bildirim gönder
        local motelLabel = Config.Motels[motel] and Config.Motels[motel].label or motel
        TriggerClientEvent('QBCore:Notify', src, motelLabel .. " - Oda " .. room .. " iptal edildi ve anahtar geri alındı.", "success")
        
        -- Client'a oda iptal edildiğini bildir ve current room'u güncelle
        TriggerClientEvent('motel:client:roomCancelled', src, motel, room)
        
        -- Oyuncunun başka odaları var mı kontrol et
        local remainingRooms = {}
        for key, data in pairs(rentedRooms) do
            if data.citizenid == Player.PlayerData.citizenid then
                local remainingMotel, remainingRoom = key:match("([^_]+)_(%d+)")
                if remainingMotel and remainingRoom then
                    table.insert(remainingRooms, {motel = remainingMotel, room = tonumber(remainingRoom)})
                end
            end
        end
        
        -- Eğer başka odaları varsa, ilkini aktif oda olarak ayarla
        if #remainingRooms > 0 then
            TriggerClientEvent('motel:client:setCurrentRoomFromServer', src, remainingRooms[1].motel, remainingRooms[1].room)
        else
            -- Hiç odası kalmadıysa current room'u temizle
            TriggerClientEvent('motel:client:setCurrentRoomFromServer', src, nil, nil)
        end
    else
        TriggerClientEvent('QBCore:Notify', src, "Bu odaya sahip değilsin veya geçersiz bilgi.", "error")
    end
end)

QBCore.Functions.CreateCallback('motel:getPlayerRooms', function(source, cb)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    if not Player then cb({}) return end

    local citizenid = Player.PlayerData.citizenid
    local rooms = {}

    for key, data in pairs(rentedRooms) do
        if data.citizenid == citizenid then
            local motelName, roomId = key:match("([^_]+)_(%d+)")
            if motelName and roomId then
                table.insert(rooms, {motel = motelName, room = tonumber(roomId)})
            end
        end
    end

    cb(rooms)
end)

RegisterNetEvent('motel:requestNewKey')
AddEventHandler('motel:requestNewKey', function(motelName, roomId)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    if not Player then return end

    if not motelName or not roomId then
        TriggerClientEvent('QBCore:Notify', src, "Geçersiz motel veya oda bilgisi.", "error")
        return
    end

    local keyPrice = Config.keyprice or 50

    if rentedRooms[motelName .. "_" .. roomId] == nil or rentedRooms[motelName .. "_" .. roomId].citizenid ~= Player.PlayerData.citizenid then
        TriggerClientEvent('QBCore:Notify', src, "Bu oda senin değil.", "error")
        return
    end

    if Player.Functions.RemoveMoney('cash', keyPrice) then
        Player.Functions.AddItem('motelkey', 1, false, {motel = "hb_" .. motelName, room = roomId})
        TriggerClientEvent('QBCore:Notify', src, "Yedek anahtar verildi.", "success")
    else
        TriggerClientEvent('QBCore:Notify', src, "Yeterli paran yok.", "error")
    end
end)

RegisterNetEvent('motel:rentRoom', function(motel, roomId)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    if not Player then return end

    local citizenid = Player.PlayerData.citizenid

    -- Geçersiz motel veya oda kontrolü
    if not Config.Motels[motel] or not Config.Motels[motel].rooms[roomId] then
        TriggerClientEvent('QBCore:Notify', src, "Geçersiz motel veya oda.", "error")
        return
    end

    -- Oda kiralanmış mı kontrolü
    if rentedRooms[motel .. "_" .. roomId] ~= nil then
        TriggerClientEvent('QBCore:Notify', src, "Bu oda zaten kiralanmış.", "error")
        return
    end

    -- Aynı motelden zaten bir oda kiralamış mı kontrolü
    for key, v in pairs(rentedRooms) do
        if v.citizenid == citizenid then
            local rentedMotel, _ = key:match("([^_]+)_(%d+)")
            if rentedMotel == motel then
                TriggerClientEvent('QBCore:Notify', src, "Bu motelden zaten bir oda kiraladın.", "error")
                return
            end
        end
    end

    local rentPrice = Config.Motels[motel].rentPrice or 200
    if not Player.Functions.RemoveMoney('cash', rentPrice) then
        TriggerClientEvent('QBCore:Notify', src, "Yeterli paranız yok.", "error")
        return
    end

    -- Başarılı kiralama
    local timestamp = os.time()
    rentedRooms[motel .. "_" .. roomId] = {
        citizenid = citizenid,
        rent_timestamp = timestamp
    }

    -- DB'ye yaz
    exports.oxmysql:insert([[
        INSERT INTO motel_rentals (citizenid, motel, room, rent_timestamp)
        VALUES (?, ?, ?, ?)
    ]], { citizenid, motel, roomId, timestamp })

    -- Anahtar ver
    Player.Functions.AddItem('motelkey', 1, false, {
        motel = "hb_" .. motel,
        room = roomId
    })

    -- Bildirim ve client'a marker bilgisi gönder
    TriggerClientEvent('QBCore:Notify', src, "Oda kiralandı! Anahtar eline verildi.", "success")
    TriggerClientEvent('motel:client:setRentedRoom', src, motel, roomId)
end)

-- Kira ücreti kesme sistemi
Citizen.CreateThread(function()
    while true do
        Citizen.Wait(2 * 60 * 60 * 1000) -- 2 saat

        for key, data in pairs(rentedRooms) do
            local Player = QBCore.Functions.GetPlayerByCitizenId(data.citizenid)
            if Player then
                local motel, room = key:match("([^_]+)_([^_]+)")
                if Config.Motels[motel] then
                    local fee = Config.Motels[motel].rentFee or 20
                    local motelLabel = Config.Motels[motel].label or motel

                    if Player.Functions.RemoveMoney("bank", fee) then
                        TriggerClientEvent("QBCore:Notify", Player.PlayerData.source, motelLabel .. " " .. room .. " odası için kira ücreti kesildi: $" .. fee, "success")

                        local query = [[
                            INSERT INTO phone_invoices ( citizenid, sender, amount, reason, sell_time )
                            VALUES ( ?, ?, ?, ?, ? )
                        ]]
                        local dateNow = os.date("%Y-%m-%d %H:%M:%S")

                        exports.oxmysql:execute(query, {
                            data.citizenid,
                            motelLabel,
                            fee,
                            motelLabel .. "-" .. room .. " Oda ücreti",
                            dateNow
                        })
                    else
                        TriggerClientEvent("QBCore:Notify", Player.PlayerData.source, motelLabel .. " " .. room .. " odası için banka paranız yetersiz. Lütfen kira ödeyin.", "error")
                    end
                end
            end
        end
    end
end)

QBCore.Functions.CreateUseableItem('motelkey', function(source, item)
    local Player = QBCore.Functions.GetPlayer(source)
    TriggerClientEvent('QBCore:Client:UseItem', source, item)
end)

-- Client'a güncel kilit durumlarını gönderme
RegisterNetEvent('m3:motel:server:getLockStates')
AddEventHandler('m3:motel:server:getLockStates', function(motelName)
    local src = source
    if motelLockStates[motelName] then
        TriggerClientEvent('m3:motel:client:sendDoorlockState', src, motelName, motelLockStates[motelName])
    end
end)

-- Kilit durumunu toggle etme (anahtar kullanımı ile)
RegisterNetEvent('m3:motel:server:toggleDoorlock')
AddEventHandler('m3:motel:server:toggleDoorlock', function(motelName, doorid, lockstate)
    if motelLockStates[motelName] and motelLockStates[motelName][doorid] then
        motelLockStates[motelName][doorid].locked = lockstate
        TriggerClientEvent('m3:motel:client:sendDoorlockState2', -1, motelName, doorid, lockstate)
    end
end)

QBCore.Functions.CreateCallback('m3:motel:server:getPlayerOutfit', function(source, cb, num)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)

    if Player then
        QBCore.Functions.ExecuteSql(false, "SELECT * FROM `player_outfits` WHERE `citizenid` = '"..Player.PlayerData.citizenid.."'", function(result)
            if result[1] ~= nil then
                cb(result)
            else
                cb(nil)
            end
        end)
    end
end)

RegisterCommand("mk", function(source, args)
    local Player = QBCore.Functions.GetPlayer(source)
    if not Player then return end

    local motelName = args[1]      -- örnek: "pinkcage"
    local roomNumber = tonumber(args[2])  -- örnek: 14

    if not motelName or not roomNumber then
        TriggerClientEvent('QBCore:Notify', source, "/mk moteladi odano şeklinde kullan.", "error")
        return
    end

    -- Motel geçerli mi kontrol et
    if not Config.Motels[motelName] then
        TriggerClientEvent('QBCore:Notify', source, "Geçersiz motel adı.", "error")
        return
    end

    -- Oda numarası geçerli mi kontrol et
    if not Config.Motels[motelName].rooms[roomNumber] then
        TriggerClientEvent('QBCore:Notify', source, "Geçersiz oda numarası.", "error")
        return
    end

    local metadata = {
        room = roomNumber,
        motel = "hb_" .. motelName
    }

    Player.Functions.AddItem('motelkey', 1, false, metadata)
    local motelLabel = Config.Motels[motelName].label
    TriggerClientEvent('QBCore:Notify', source, "Anahtar verildi: " .. motelLabel .. " - Oda " .. roomNumber, "success")
end)

RegisterNetEvent('customstash:server:open', function(stashName)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    if not Player then return end

    local weight = 250000 -- 250 kg
    local slots = 50

    if GetResourceState('qb-inventory') == 'started' then
        exports['qb-inventory']:OpenInventory(src, stashName, {
            label = stashName,
            maxweight = weight,
            slots = slots
        })
    elseif GetResourceState('ps-inventory') == 'started' then
        exports['ps-inventory']:OpenInventory(src, stashName, {
            label = stashName,
            maxweight = weight,
            slots = slots
        })
    elseif GetResourceState('ox_inventory') == 'started' then
        exports.ox_inventory:openInventory('stash', {id = stashName})
    else
        print("^1 Inventory sistemi başlatılamadı.")
    end
end)