local QBCore = exports['qb-core']:GetCoreObject()

local currentMotel = nil
local currentRoom = nil
local closestRoom = nil
local currentMotelName = nil
local motelData = {}
local currentRooms = {}

local firstSpawn = false

AddEventHandler('playerSpawned', function()
    TriggerServerEvent('motel:getPlayerRooms')
end)

RegisterNetEvent('motel:client:setCurrentRoomFromServer')
AddEventHandler('motel:client:setCurrentRoomFromServer', function(motelName, roomId)
    currentMotelName = motelName
    currentRoom = roomId
    if motelName and roomId then
        local motelLabel = Config.Motels[motelName] and Config.Motels[motelName].label or motelName
        QBCore.Functions.Notify("Kiralı oda yüklendi: " .. motelLabel .. " - Oda " .. roomId, "success", 5000)
    elseif not motelName and not roomId then
        QBCore.Functions.Notify("Artık kiralık odan yok.", "error", 5000)
    end
end)

RegisterNetEvent('m3:motel:client:sendDoorlockState2')
AddEventHandler('m3:motel:client:sendDoorlockState2', function(motelName, doorid, lockstate)
    if Config.Motels[motelName] and Config.Motels[motelName].rooms[doorid] then
        Config.Motels[motelName].rooms[doorid].locked = lockstate
    end
end)

RegisterNetEvent('m3:motel:client:setCurrentMotel')
AddEventHandler('m3:motel:client:setCurrentMotel', function(data)
    local motelName = data[1]
    local room = data[2]
    currentMotelName = motelName
    currentRoom = room
    TriggerServerEvent('motel:rentRoom', motelName, room)
end)

-- Anahtar cooldown sistemi
local keyCooldown = false

-- Anahtar kullanımı
RegisterNetEvent('QBCore:Client:UseItem')
AddEventHandler('QBCore:Client:UseItem', function(item)
    if item.name == 'motelkey' then
        -- Cooldown kontrolü
        if keyCooldown then
            QBCore.Functions.Notify("Anahtarı çok hızlı kullanıyorsun! Biraz bekle.", "error")
            return
        end
        
        -- Cooldown başlat
        keyCooldown = true
        SetTimeout(2000, function()
            keyCooldown = false
        end)
        
        local player = PlayerPedId()
        local playerCoords = GetEntityCoords(player)
        local keyRoom = item.info.room
        local keyMotel = item.info.motel

        if keyRoom ~= nil and keyMotel ~= nil then
            -- motel ID'sini motel adına çevir
            local motelName = string.gsub(keyMotel, "hb_", "")
            
            if Config.Motels[motelName] and Config.Motels[motelName].rooms[keyRoom] then
                local roomData = Config.Motels[motelName].rooms[keyRoom]
                local doorCoords = roomData.door
                local stashCoords = roomData.stash

                local doorDist = #(playerCoords - doorCoords)
                local stashDist = #(playerCoords - stashCoords)

                if doorDist <= 3.0 then
                    -- Kapı durumunu değiştir
                    roomData.locked = not roomData.locked
                    
                    -- Kapı objesini bul ve güncelle
                    if not roomData.obj or not DoesEntityExist(roomData.obj) then
                        roomData.obj = GetClosestObjectOfType(roomData.door.x, roomData.door.y, roomData.door.z, 5.0, -1156992775, false, false, false)
                        
                        if roomData.obj == 0 or roomData.obj == nil then
                            roomData.obj = GetClosestObjectOfType(roomData.door.x, roomData.door.y, roomData.door.z, 5.0, 631614199, false, false, false)
                        end
                        
                        if roomData.obj == 0 or roomData.obj == nil then
                            roomData.obj = GetClosestObjectOfType(roomData.door.x, roomData.door.y, roomData.door.z, 3.0, 0, false, false, false)
                        end
                    end
                    
                    if roomData.obj and DoesEntityExist(roomData.obj) then
                        FreezeEntityPosition(roomData.obj, roomData.locked)
                    end
                    
                    TriggerServerEvent('m3:motel:server:toggleDoorlock', motelName, keyRoom, roomData.locked)
                    openHouseAnim()
                    
                    -- Emote gönder
                    if roomData.locked then
                        TriggerServerEvent('hb_me:me', GetPlayerServerId(PlayerId()), "kapının kilidini açar ve kapıyı kilitler")
                    else
                        TriggerServerEvent('hb_me:me', GetPlayerServerId(PlayerId()), "kapının kilidini açar ve kapıyı açar")
                    end
                    
                    QBCore.Functions.Notify("Oda " .. keyRoom .. " kapısı " .. (roomData.locked and "kilitlendi" or "açıldı"), "success")
                elseif stashDist <= 3.0 then
                    -- Kapı durumunu değiştir
                    roomData.locked = not roomData.locked
                    
                    -- Kapı objesini bul ve güncelle
                    if not roomData.obj or not DoesEntityExist(roomData.obj) then
                        roomData.obj = GetClosestObjectOfType(roomData.door.x, roomData.door.y, roomData.door.z, 5.0, -1156992775, false, false, false)
                        
                        if roomData.obj == 0 or roomData.obj == nil then
                            roomData.obj = GetClosestObjectOfType(roomData.door.x, roomData.door.y, roomData.door.z, 5.0, 631614199, false, false, false)
                        end
                        
                        if roomData.obj == 0 or roomData.obj == nil then
                            roomData.obj = GetClosestObjectOfType(roomData.door.x, roomData.door.y, roomData.door.z, 3.0, 0, false, false, false)
                        end
                    end
                    
                    if roomData.obj and DoesEntityExist(roomData.obj) then
                        FreezeEntityPosition(roomData.obj, roomData.locked)
                    end
                    
                    TriggerServerEvent('m3:motel:server:toggleDoorlock', motelName, keyRoom, roomData.locked)
                    openHouseAnim()
                    
                    -- Emote gönder
                    if roomData.locked then
                        TriggerServerEvent('hb_me:me', GetPlayerServerId(PlayerId()), "kapının kilidini açar ve kapıyı kilitler")
                    else
                        TriggerServerEvent('hb_me:me', GetPlayerServerId(PlayerId()), "kapının kilidini açar ve kapıyı açar")
                    end
                    
                    QBCore.Functions.Notify("Oda " .. keyRoom .. " kapısı " .. (roomData.locked and "kilitlendi" or "açıldı"), "success")
                else
                    QBCore.Functions.Notify("Anahtarın odasına veya deposuna çok uzaktasın!", "error")
                end
            else
                QBCore.Functions.Notify("Anahtar geçersiz motel/oda bilgisi içeriyor.", "error")
            end
        else
            QBCore.Functions.Notify("Anahtar meta bilgisi eksik.", "error")
        end
    end
end)

function openHouseAnim()
    local playerPed = PlayerPedId()
    local coords = GetEntityCoords(playerPed)

    loadAnimDict("anim@heists@keycard@")
    TaskPlayAnim(playerPed, "anim@heists@keycard@", "exit", 5.0, 1.0, -1, 16, 0, 0, 0, 0)
    TriggerServerEvent('InteractSound_SV:PlayWithinDistance', 5, 'motel', 0.3)

    Citizen.Wait(400)
    ClearPedTasks(playerPed)
end

function loadAnimDict(dict)
    RequestAnimDict(dict)
    while not HasAnimDictLoaded(dict) do
        Citizen.Wait(5)
    end
end

RegisterCommand('motelcik', function()
    local player = PlayerPedId()
    local playercoords = GetEntityCoords(player)
    
    -- En yakın motel çıkış noktasını bul
    local closestMotel = nil
    local closestDistance = 999999
    
    for motelName, motelData in pairs(Config.Motels) do
        local motelDistance = #(playercoords - motelData.coords)
        if motelDistance < closestDistance then
            closestDistance = motelDistance
            closestMotel = motelName
        end
    end
    
    if closestMotel and closestDistance <= 45.0 then
        -- Varsayılan çıkış koordinatları (config'e eklenebilir)
        local exitCoords = vector3(311.491, -206.25, 58.0151)
        SetEntityCoords(player, exitCoords.x, exitCoords.y, exitCoords.z, 0, 0, 0, 0)
        SetEntityHeading(player, 242.37)
        QBCore.Functions.Notify("Odadan ayrıldın", 'error', 5000)
    end
end)

RegisterNetEvent('m3:motel:client:sendDoorlockState')
AddEventHandler('m3:motel:client:sendDoorlockState', function(motelName, doorlocktable)
    if Config.Motels[motelName] then
        for i=1, #Config.Motels[motelName].rooms, 1 do
            if doorlocktable[i] then
                Config.Motels[motelName].rooms[i].locked = doorlocktable[i].locked
            end
        end
    end
end)

-- Blip oluşturma
Citizen.CreateThread(function()
    for motelName, motelData in pairs(Config.Motels) do
        local gblip = AddBlipForCoord(motelData.coords)
        SetBlipSprite(gblip, 826)
        SetBlipDisplay(gblip, 4)
        SetBlipScale(gblip, 0.6)
        SetBlipColour(gblip, 0)
        SetBlipAsShortRange(gblip, false)
        BeginTextCommandSetBlipName("STRING")
        AddTextComponentString(motelData.label)
        EndTextCommandSetBlipName(gblip)
    end
end)

-- Basit kapı yönetim sistemi
Citizen.CreateThread(function()
    while true do
        local player = PlayerPedId()
        local playercoords = GetEntityCoords(player)
        local sleep = 1000
        
        -- Sadece kiralık odası olan oyuncular için
        if currentMotelName and currentRoom then
            local motelData = Config.Motels[currentMotelName]
            if motelData and motelData.rooms[currentRoom] then
                local roomData = motelData.rooms[currentRoom]
                local doordistance = #(playercoords - roomData.door)
                
                if doordistance <= 30.0 then
                    sleep = 5
                    
                    -- Kapı objesini bul ve yönet
                    if not roomData.obj or not DoesEntityExist(roomData.obj) then
                        -- Daha geniş arama yap
                        roomData.obj = GetClosestObjectOfType(roomData.door.x, roomData.door.y, roomData.door.z, 5.0, -1156992775, false, false, false)
                        
                        -- Eğer bulunamazsa, farklı model dene
                        if roomData.obj == 0 or roomData.obj == nil then
                            roomData.obj = GetClosestObjectOfType(roomData.door.x, roomData.door.y, roomData.door.z, 5.0, 631614199, false, false, false)
                        end
                        
                        -- Hala bulunamazsa, herhangi bir obje ara
                        if roomData.obj == 0 or roomData.obj == nil then
                            roomData.obj = GetClosestObjectOfType(roomData.door.x, roomData.door.y, roomData.door.z, 3.0, 0, false, false, false)
                        end
                        
                        if roomData.obj ~= 0 and roomData.obj ~= nil then
                            FreezeEntityPosition(roomData.obj, roomData.locked)
                        end
                    end
                    
                    -- Marker çiz
                    if doordistance <= 30.0 then
                        DrawMarker(2, roomData.doortext.x, roomData.doortext.y, roomData.doortext.z - 0.3, 0, 0, 0, 0, 0, 0, 0.2, 0.2, 0.2, 32, 236, 54, 100, 0, 0, 0, 1, 0, 0, 0)
                    end
                    
                    -- Kapı etkileşimi
                    if doordistance <= 2.0 then
                        if IsControlJustReleased(0, 38) then
                            roomData.locked = not roomData.locked
                            
                            if roomData.obj and DoesEntityExist(roomData.obj) then
                                FreezeEntityPosition(roomData.obj, roomData.locked)
                            end
                            
                            TriggerServerEvent('m3:motel:server:toggleDoorlock', currentMotelName, currentRoom, roomData.locked)
                            openHouseAnim()
                        end
                    end
                end
            end
        end
        
        Citizen.Wait(sleep)
    end
end)

-- Kiralık oda marker'ları
Citizen.CreateThread(function()
    while true do
        if currentMotelName ~= nil and currentRoom ~= nil then
            local player = PlayerPedId()
            local playercoords = GetEntityCoords(player)
            
            if Config.Motels[currentMotelName] and Config.Motels[currentMotelName].rooms[currentRoom] then
                local roomData = Config.Motels[currentMotelName].rooms[currentRoom]
                local doordistance = #(playercoords - roomData.doortext)
                local moteldistance = #(playercoords - Config.Motels[currentMotelName].coords)

                if moteldistance <= 45.0 then
                    if doordistance <= 30.0 then
                        DrawMarker(2, roomData.doortext.x, roomData.doortext.y, roomData.doortext.z - 0.3, 0, 0, 0, 0, 0, 0, 0.2, 0.2, 0.2, 32, 236, 54, 100, 0, 0, 0, 1, 0, 0, 0)
                    end
                else
                    Citizen.Wait(500)
                end
            end
        end
        Citizen.Wait(5)
    end
end)

-- Target sistemleri
Citizen.CreateThread(function()
    Citizen.Wait(1000) -- Config yüklensin diye bekle

    for motelName, motelData in pairs(Config.Motels) do
        for roomId, roomData in pairs(motelData.rooms) do
            -- Stash için target
            exports['qb-target']:AddBoxZone("motel_stash_" .. motelName .. "_" .. roomId, roomData.stash, 1.0, 1.0, {
                name = "motel_stash_" .. motelName .. "_" .. roomId,
                heading = 0,
                debugPoly = false,
                minZ = roomData.stash.z - 1,
                maxZ = roomData.stash.z + 1,
            }, {
                options = {
                    {
                        icon = "fas fa-box-open",
                        label = "Motel deposunu görüntüle",
                        action = function()
                            if roomData.locked then
                                QBCore.Functions.Notify("Sandık kilitli!", "error")
                            else
                                OpenMotelInventory(motelName, roomId)
                            end
                        end,
                    }
                },
                distance = 2.5
            })

            -- Gardrop için target
            exports['qb-target']:AddBoxZone("motel_clothe_" .. motelName .. "_" .. roomId, roomData.clothe, 1.0, 1.0, {
                name = "motel_clothe_" .. motelName .. "_" .. roomId,
                heading = 0,
                debugPoly = false,
                minZ = roomData.clothe.z - 1,
                maxZ = roomData.clothe.z + 1,
            }, {
                options = {
                    {
                        icon = "fas fa-tshirt",
                        label = "Kıyafetlerini değiştir",
                        action = function()
                            if roomData.locked then
                                QBCore.Functions.Notify("Gardrop kilitli!", "error")
                            else
                                OpenMotelWardrobe()
                            end
                        end,
                    }
                },
                distance = 2.5
            })
        end
    end
end)

function OpenMotelInventory(motelName, roomId)
    if not motelName or not roomId then
        QBCore.Functions.Notify("Geçerli bir motel odası bulunamadı.", "error")
        return
    end
    local stashName = "hb_" .. motelName .. tostring(roomId)
    TriggerServerEvent("customstash:server:open", stashName)
end

function OpenMotelWardrobe()
    TriggerEvent('qb-clothing:client:openOutfitMenu')
end

function HasKeyForRoom(roomId, motelName)
    local PlayerData = QBCore.Functions.GetPlayerData()
    local motelId = "hb_" .. motelName

    for _, item in pairs(PlayerData.items) do
        if item.name == 'motelkey' and item.info then
            if item.info.room == roomId and item.info.motel == motelId then
                return true
            end
        end
    end
    return false
end

function GetNearbyMotelRoom()
    local player = PlayerPedId()
    local coords = GetEntityCoords(player)

    for motelName, motelData in pairs(Config.Motels) do
        for roomId, roomData in pairs(motelData.rooms) do
            local dist = #(coords - roomData.stash)
            if dist < 2.5 then
                return motelName, roomId, roomData
            end
        end
    end

    return nil, nil, nil
end

-- Ped ve target oluşturma
Citizen.CreateThread(function()
    for motelName, motelData in pairs(Config.Motels) do
        -- Ped spawn
        RequestModel(GetHashKey(motelData.pedModel))
        while not HasModelLoaded(GetHashKey(motelData.pedModel)) do
            Citizen.Wait(10)
        end
        local ped = CreatePed(4, GetHashKey(motelData.pedModel), motelData.coords.x, motelData.coords.y, motelData.coords.z - 1.0, 164.38, false, true)
        FreezeEntityPosition(ped, true)
        SetEntityInvincible(ped, true)
        SetBlockingOfNonTemporaryEvents(ped, true)

        -- Target ekle
        exports['qb-target']:AddBoxZone("motel_reception_"..motelName, motelData.coords, 1.0, 1.0, {
            name = "motel_reception_"..motelName,
            heading = 0,
            debugPoly = false,
            minZ = motelData.coords.z - 1,
            maxZ = motelData.coords.z + 1,
        }, {
            options = {
                {
                    icon = "fas fa-door-open",
                    label = "Elinizde hangi odalar var?",
                    action = function()
                        OpenRoomMenu(motelName)
                    end,
                },
                {
                    icon = "fas fa-key",
                    label = "Sanırım yeni bir anahtara ihtiyacım var",
                    action = function()
                        TriggerServerEvent('motel:getPlayerRooms')
                    end,
                },
                {
                    icon = "fas fa-times-circle",
                    label = "Odamı iptal etmek istiyorum",
                    action = function()
                        TriggerEvent("motel:client:cancelRoomMenu")
                    end,
                },
            },
            distance = 2.0,
        })
    end
end)

RegisterNetEvent('motel:client:cancelRoomMenu', function()
    TriggerServerEvent("motel:getPlayerRoomsForCancel")
end)

RegisterNetEvent('motel:client:showCancelRoomMenu', function(rooms)
    if not rooms or #rooms == 0 then
        QBCore.Functions.Notify("Hiç kiralanmış odan yok.", "error")
        return
    end

    local cancelOptions = {
        {
            header = "Hangi odayı iptal etmek istiyorsun?",
            isMenuHeader = true
        }
    }

    for _, v in ipairs(rooms) do
        local label = Config.Motels[v.motel] and Config.Motels[v.motel].label or v.motel
        table.insert(cancelOptions, {
            header = label .. " - Oda " .. v.room,
            txt = "Bu odayı iptal et",
            params = {
                event = "motel:client:requestCancelRoom",
                args = {motel = v.motel, room = v.room}
            }
        })
    end

    exports['qb-menu']:openMenu(cancelOptions)
end)

RegisterNetEvent('motel:client:requestCancelRoom', function(data)
    if data and data.motel and data.room then
        TriggerServerEvent("motel:cancelRoom", data.motel, data.room)
    else
        QBCore.Functions.Notify("Geçersiz oda bilgisi.", "error")
    end
end)

RegisterNetEvent('motel:sendPlayerRooms')
AddEventHandler('motel:sendPlayerRooms', function(rooms)
    currentRooms = rooms or {}

    if #currentRooms > 0 then
        -- İlk kiralanan odayı currentmotel olarak ayarla
        currentMotelName = currentRooms[1].motel
        currentRoom = currentRooms[1].room
    else
        currentMotelName = nil
        currentRoom = nil
    end

    if not rooms or #rooms == 0 then
        QBCore.Functions.Notify("Bir oda kiralamadan sana anahtar veremem", "error")
        return
    end

    local menuOptions = {
        {
            header = "Hangi odanın anahtarını çıkartmak istiyorsun?",
            isMenuHeader = true
        }
    }

    for _, v in pairs(rooms) do
        local label = Config.Motels[v.motel] and Config.Motels[v.motel].label or v.motel
        table.insert(menuOptions, {
            header = label .. " - Oda " .. v.room,
            txt = "Fiyat: <span style='color:#88A17D'>$</span>" .. (Config.keyprice or 50),
            params = {
                event = "custom:giveKey",
                args = {v.motel, v.room}
            }
        })
    end

    exports['qb-menu']:openMenu(menuOptions)
end)

RegisterNetEvent("custom:giveKey")
AddEventHandler("custom:giveKey", function(data)
    local motelName = data[1]
    local roomId = data[2]
    TriggerServerEvent("motel:requestNewKey", motelName, roomId)
end)

function OpenRoomMenu(motelName)
    QBCore.Functions.TriggerCallback('motel:getAvailableRooms', function(rooms)
        if not rooms or #rooms == 0 then
            QBCore.Functions.Notify("Kiralanacak boş oda yok.", "error")
            return
        end

        local menuOptions = {
            {
                header = Config.Motels[motelName].label .. " - Oda Kiralama",
                isMenuHeader = true
            }
        }

        for _, roomId in ipairs(rooms) do
           table.insert(menuOptions, {
                header = "Oda " .. roomId,
                txt = ("Ücret: <span style='color:#88A17D'>$</span>" .. (Config.Motels[motelName].rentPrice or 200)),
                params = {
                    event = "m3:motel:client:setCurrentMotel",
                    args = {motelName, roomId}
                }
            })
        end

        exports['qb-menu']:openMenu(menuOptions)
    end, motelName)
end

RegisterNetEvent('motel:client:setRentedRoom')
AddEventHandler('motel:client:setRentedRoom', function(motelName, roomId)
    currentMotelName = motelName
    currentRoom = roomId
    local motelLabel = Config.Motels[motelName] and Config.Motels[motelName].label or motelName
    QBCore.Functions.Notify("Oda başarıyla kiralandı: " .. motelLabel .. " #" .. roomId, "success")
end)

RegisterNetEvent('motel:client:roomCancelled')
AddEventHandler('motel:client:roomCancelled', function(motelName, roomId)
    -- Eğer iptal edilen oda current room ise, current room'u temizle
    if currentMotelName == motelName and currentRoom == roomId then
        currentMotelName = nil
        currentRoom = nil
        QBCore.Functions.Notify("Aktif odan iptal edildi. Artık kapı etkileşimleri çalışmayacak.", "error")
    end
end)

