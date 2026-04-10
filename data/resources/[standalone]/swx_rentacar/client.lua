local QBCore = exports['qb-core']:GetCoreObject()

-- Değişkenler
local NPC = nil
local NPCBlip = nil
local GUIOpen = false
local CurrentRentedVehicle = nil
local RentStartTime = nil

-- Trim fonksiyonu (plaka temizleme)
function Trim(value)
    if not value then return nil end
    return (string.gsub(value, '^%s*(.-)%s*$', '%1'))
end

-- NPC Spawn
local function SpawnNPC()
    -- Zaten NPC varsa spawn etme (cift NPC onlemek icin)
    if NPC and DoesEntityExist(NPC) then
        return
    end
    
    local model = Config.NPCModel
    
    -- Model yükle
    RequestModel(model)
    while not HasModelLoaded(model) do
        Wait(100)
    end
    
    -- NPC olustur (sadece 1 tane)
    local coords = Config.NPCLocation
    if not NPC or not DoesEntityExist(NPC) then
        NPC = CreatePed(4, model, coords.x, coords.y, coords.z, coords.w, false, true)
    end
    
    -- NPC ayarları
    SetEntityHeading(NPC, coords.w)
    FreezeEntityPosition(NPC, true)
    SetEntityInvincible(NPC, true)
    SetBlockingOfNonTemporaryEvents(NPC, true)
    SetPedCanPlayAmbientAnims(NPC, true)
    SetPedCanRagdollFromPlayerImpact(NPC, false)
    
    -- Animasyon (idle)
    TaskStartScenarioInPlace(NPC, "WORLD_HUMAN_CLIPBOARD", 0, true)
    
    -- Blip oluştur
    if Config.Blip.enabled then
        NPCBlip = AddBlipForCoord(coords.x, coords.y, coords.z)
        SetBlipSprite(NPCBlip, Config.Blip.sprite)
        SetBlipColour(NPCBlip, Config.Blip.color)
        SetBlipScale(NPCBlip, Config.Blip.scale)
        SetBlipAsShortRange(NPCBlip, true)
        BeginTextCommandSetBlipName("STRING")
        AddTextComponentString(Config.Blip.label)
        EndTextCommandSetBlipName(NPCBlip)
    end
    
    if Config.Debug then
        print('[SWX-RentACar] NPC spawn edildi:', coords)
    end
end

-- NPC Temizle
local function DeleteNPC()
    if NPC and DoesEntityExist(NPC) then
        DeleteEntity(NPC)
        NPC = nil
    end
    if NPCBlip then
        RemoveBlip(NPCBlip)
        NPCBlip = nil
    end
end

-- Hoşgeldin Baloncuğu
local function ShowWelcomeBubble()
    local coords = Config.NPCLocation
    
    -- 3D Text/Baloncuk
    CreateThread(function()
        local endTime = GetGameTimer() + Config.WelcomeMessage.duration
        
        while GetGameTimer() < endTime do
            local playerPed = PlayerPedId()
            local playerCoords = GetEntityCoords(playerPed)
            local npcCoords = GetEntityCoords(NPC)
            local distance = #(playerCoords - npcCoords)
            
            if distance < Config.DrawTextDistance then
                -- 3D Baloncuk çiz
                DrawWelcomeBubble(npcCoords)
            end
            
            Wait(0)
        end
    end)
    
    -- Bildirim göster
    lib.notify({
        title = Config.WelcomeMessage.title,
        description = Config.WelcomeMessage.subtitle,
        type = 'info',
        duration = 5000,
        position = 'top-right'
    })
end

-- 3D KONUSMA BALONCUGU Çizim (Speech Bubble)
function DrawWelcomeBubble(coords)
    -- NPC'nin kafasinin uzerinde gorunecek sekilde ayarlandi
    local onScreen, _x, _y = World3dToScreen2d(coords.x, coords.y, coords.z + 1.75)
    
    if onScreen then
        local bubbleWidth = 0.28
        local bubbleHeight = 0.09
        local tailHeight = 0.02
        local alpha = 220
        
        -- Ana baloncuğun arka planı (yuvarlatılmış dikdörtgen efekti için çoklu rect)
        -- Üst kısım
        DrawRect(_x, _y - bubbleHeight/2 + 0.015, bubbleWidth - 0.02, 0.03, 0, 0, 0, alpha)
        -- Orta kısım
        DrawRect(_x, _y - 0.005, bubbleWidth, bubbleHeight - 0.04, 0, 0, 0, alpha)
        -- Alt kısım
        DrawRect(_x, _y + bubbleHeight/2 - 0.025, bubbleWidth - 0.02, 0.02, 0, 0, 0, alpha)
        
        -- Köşe yuvarlaklığı için küçük rect'ler
        DrawRect(_x - bubbleWidth/2 + 0.01, _y - bubbleHeight/2 + 0.02, 0.02, 0.025, 0, 0, 0, alpha)
        DrawRect(_x + bubbleWidth/2 - 0.01, _y - bubbleHeight/2 + 0.02, 0.02, 0.025, 0, 0, 0, alpha)
        DrawRect(_x - bubbleWidth/2 + 0.01, _y + bubbleHeight/2 - 0.03, 0.02, 0.015, 0, 0, 0, alpha)
        DrawRect(_x + bubbleWidth/2 - 0.01, _y + bubbleHeight/2 - 0.03, 0.02, 0.015, 0, 0, 0, alpha)
        
        -- Kuyruk (üçgen efekti için 3 küçük dikdörtgen)
        -- Orta kuyruk
        DrawRect(_x, _y + bubbleHeight/2 - 0.005, 0.015, tailHeight + 0.01, 0, 0, 0, alpha)
        -- Kuyruk yanları
        DrawRect(_x - 0.008, _y + bubbleHeight/2 - 0.01, 0.01, tailHeight, 0, 0, 0, alpha)
        DrawRect(_x + 0.008, _y + bubbleHeight/2 - 0.01, 0.01, tailHeight, 0, 0, 0, alpha)
        -- Kuyruk ucu
        DrawRect(_x, _y + bubbleHeight/2 + tailHeight/2 - 0.002, 0.008, 0.008, 0, 0, 0, alpha)
        
        -- Başlık (Altın renk)
        SetTextScale(0.32, 0.32)
        SetTextFont(4)
        SetTextProportional(1)
        SetTextColour(255, 215, 0, 255)
        SetTextEntry("STRING")
        SetTextCentre(1)
        AddTextComponentString(Config.WelcomeMessage.title)
        DrawText(_x, _y - 0.035)
        
        -- Alt başlık (Beyaz)
        SetTextScale(0.23, 0.23)
        SetTextFont(4)
        SetTextProportional(1)
        SetTextColour(255, 255, 255, 255)
        SetTextEntry("STRING")
        SetTextCentre(1)
        AddTextComponentString(Config.WelcomeMessage.subtitle)
        DrawText(_x, _y - 0.002)
        
        -- İkon (Opsiyonel - konuşma baloncuğu ikonu)
        SetTextScale(0.35, 0.35)
        SetTextFont(4)
        SetTextProportional(1)
        SetTextColour(255, 215, 0, 255)
        SetTextEntry("STRING")
        SetTextCentre(1)
        AddTextComponentString("💬")
        DrawText(_x - bubbleWidth/2 + 0.025, _y - 0.035)
    end
end

-- GUI Aç
function OpenRentGUI()
    if GUIOpen then
        -- Eğer zaten açıksa kapatıp tekrar aç
        CloseRentGUI()
        Citizen.Wait(100)
    end

    GUIOpen = true

    -- UI Aç
    SendNUIMessage({
        action = 'open',
        vehicles = Config.RentVehicles
    })

    SetNuiFocus(true, true)
end

-- GUI Kapat
function CloseRentGUI()
    GUIOpen = false
    SetNuiFocus(false, false)
    SendNUIMessage({action = 'close'})
end

-- Araç Spawn
local function SpawnRentedVehicle(vehicleData)
    -- Boş spawn noktası bul
    local spawnCoords = nil
    for _, loc in ipairs(Config.SpawnLocations) do
        if not IsAnyVehicleNearPoint(loc.x, loc.y, loc.z, 3.0) then
            spawnCoords = loc
            break
        end
    end
    
    if not spawnCoords then
        lib.notify({
            title = 'Hata',
            description = 'Araç spawn noktası dolu!',
            type = 'error'
        })
        return false
    end
    
    -- Model yükle
    RequestModel(vehicleData.model)
    while not HasModelLoaded(vehicleData.model) do
        Wait(100)
    end
    
    -- Araç oluştur
    local vehicle = CreateVehicle(vehicleData.model, spawnCoords.x, spawnCoords.y, spawnCoords.z, spawnCoords.w, true, false)

    if not DoesEntityExist(vehicle) then
        lib.notify({
            title = 'Hata',
            description = 'Araç oluşturulamadı!',
            type = 'error'
        })
        return false
    end

    -- Araç ayarları
    SetEntityAsMissionEntity(vehicle, true, true)
    SetVehicleNumberPlateText(vehicle, "KIRALIK")
    SetVehicleEngineOn(vehicle, true, true, false)

    -- Oyuncuyu aracın içine koy (SÜRÜCÜ KOLTUĞU)
    SetPedIntoVehicle(PlayerPedId(), vehicle, -1)

    -- Yakıt
    SetVehicleFuelLevel(vehicle, 100.0)

    -- Kilit AYARLARI - Oyuncu kapıları açabilsin
    SetVehicleDoorsLocked(vehicle, 0) -- 0 = kapılar açık
    SetVehicleDoorsLockedForPlayer(vehicle, PlayerId(), false) -- Oyuncu için kilidi aç
    SetVehicleNeedsToBeHotwired(vehicle, false) -- Hotwire gerektirmesin
    SetVehicleHasBeenOwnedByPlayer(vehicle, true) -- Oyuncunun sahipliğini ayarla

    -- Temizlik
    SetModelAsNoLongerNeeded(vehicleData.model)

    -- Kayıt
    CurrentRentedVehicle = vehicle
    RentStartTime = GetGameTimer()

    -- ANAHTAR VER (vehicle keys)
    local plate = GetVehicleNumberPlateText(vehicle)
    if plate then
        plate = Trim(plate)
        if Config.Debug then
            print('[SWX-RentACar] Anahtar veriliyor: ' .. tostring(plate))
        end
        Config.GiveCarKeys(plate)
    end

    return true
end

-- NUI Callback - Kiralama
RegisterNUICallback('rentVehicle', function(data, cb)
    local vehicleData = data.vehicle
    
    -- Server'a istek gönder
    QBCore.Functions.TriggerCallback('swx_rentacar:rentVehicle', function(success, message)
        if success then
            -- Araç spawn
            if SpawnRentedVehicle(vehicleData) then
                -- GUI kapat
                CloseRentGUI()
                
                cb({success = true, message = 'Araç başarıyla kiralandı!'})
            else
                cb({success = false, message = 'Araç spawn edilemedi!'})
            end
        else
            cb({success = false, message = message})
        end
    end, vehicleData)
end)

-- NUI Callback - Kapat
RegisterNUICallback('close', function(data, cb)
    CloseRentGUI()
    cb({})
end)

-- Mesafe Kontrolü
CreateThread(function()
    while true do
        Wait(1000)
        
        if not NPC or not DoesEntityExist(NPC) then
            SpawnNPC()
        end
        
        local playerPed = PlayerPedId()
        local playerCoords = GetEntityCoords(playerPed)
        local npcCoords = vector3(Config.NPCLocation.x, Config.NPCLocation.y, Config.NPCLocation.z)
        local distance = #(playerCoords - npcCoords)
        
        if distance < Config.DrawTextDistance then
            -- Yakındayken işlem yap
        end
    end
end)

-- 3D Text ve E tuşu kontrolü
CreateThread(function()
    while true do
        local sleep = 1000
        
        if NPC and DoesEntityExist(NPC) then
            local playerPed = PlayerPedId()
            local playerCoords = GetEntityCoords(playerPed)
            local npcCoords = GetEntityCoords(NPC)
            local distance = #(playerCoords - npcCoords)
            
            if distance < Config.DrawTextDistance then
                sleep = 0
                
                -- 3D Text göster
                if distance < Config.InteractDistance then
                    -- E tuşu ile etkileşim (Key: 38)
                    DrawText3D(npcCoords.x, npcCoords.y, npcCoords.z + 1.0, "[~g~E~w~] Araç Kirala")
                    
                    if IsControlJustPressed(0, 38) then -- E tuşu
                        OpenRentGUI()
                    end
                else
                    DrawText3D(npcCoords.x, npcCoords.y, npcCoords.z + 1.0, "Araç Kiralama")
                end
            end
        end
        
        Wait(sleep)
    end
end)

-- 3D Text Fonksiyonu
function DrawText3D(x, y, z, text)
    local onScreen, _x, _y = World3dToScreen2d(x, y, z)
    local scale = 0.35
    
    if onScreen then
        SetTextScale(scale, scale)
        SetTextFont(4)
        SetTextProportional(1)
        SetTextColour(255, 255, 255, 215)
        SetTextEntry("STRING")
        SetTextCentre(1)
        AddTextComponentString(text)
        DrawText(_x, _y)
        
        -- Arka plan
        local factor = string.len(text) / 370
        DrawRect(_x, _y + 0.0125, 0.015 + factor, 0.03, 41, 11, 41, 68)
    end
end

-- Resource başlangıç
AddEventHandler('onClientResourceStart', function(resourceName)
    if resourceName == GetCurrentResourceName() then
        SpawnNPC()
        print('[SWX-RentACar] Client yüklendi!')
    end
end)

-- Resource durdurma
AddEventHandler('onClientResourceStop', function(resourceName)
    if resourceName == GetCurrentResourceName() then
        DeleteNPC()
        -- Kiralık araç varsa sil
        if CurrentRentedVehicle and DoesEntityExist(CurrentRentedVehicle) then
            DeleteEntity(CurrentRentedVehicle)
        end
    end
end)

-- NUI Callback - Bildirim göster
RegisterNUICallback('showNotification', function(data, cb)
    lib.notify({
        title = data.title,
        description = data.message,
        type = data.type,
        duration = 5000
    })
    cb({})
end)

-- NUI Callback - Ses çal
RegisterNUICallback('playSound', function(data, cb)
    local sound = data.sound
    if sound == 'success' then
        PlaySoundFrontend(-1, "PURCHASE", "HUD_LIQUOR_STORE_SOUNDSET", true)
    elseif sound == 'select' then
        PlaySoundFrontend(-1, "NAV_UP_DOWN", "HUD_FRONTEND_DEFAULT_SOUNDSET", true)
    elseif sound == 'error' then
        PlaySoundFrontend(-1, "ERROR", "HUD_FRONTEND_DEFAULT_SOUNDSET", true)
    end
    cb({})
end)

-- Server olayları
-- Süre dolunca veya çıkış yapınca araç ve anahtar sil
RegisterNetEvent('swx_rentacar:rentalExpired', function()
    if CurrentRentedVehicle and DoesEntityExist(CurrentRentedVehicle) then
        -- ANAHTARI SİL
        local plate = GetVehicleNumberPlateText(CurrentRentedVehicle)
        if plate then
            plate = Trim(plate)
            Config.RemoveCarKeys(plate)
        end

        -- ARACI SİL
        DeleteEntity(CurrentRentedVehicle)
        CurrentRentedVehicle = nil
        RentStartTime = nil

        lib.notify({
            title = 'Kiralama Bitti',
            description = 'Kiralama süreniz doldu veya çıkış yaptınız. Araç geri alındı.',
            type = 'warning'
        })
    end
end)

-- Araç iade edilince araç ve anahtar sil
RegisterNetEvent('swx_rentacar:returnVehicle', function()
    if CurrentRentedVehicle and DoesEntityExist(CurrentRentedVehicle) then
        -- ANAHTARI SİL
        local plate = GetVehicleNumberPlateText(CurrentRentedVehicle)
        if plate then
            plate = Trim(plate)
            Config.RemoveCarKeys(plate)
        end

        -- ARACI SİL
        DeleteEntity(CurrentRentedVehicle)
    end

    CurrentRentedVehicle = nil
    RentStartTime = nil
end)

-- Komut (opsiyonel)
RegisterCommand('kiralama', function()
    OpenRentGUI()
end, false)
