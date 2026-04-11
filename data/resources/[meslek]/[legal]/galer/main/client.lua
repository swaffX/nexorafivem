isOpen, TestDriveTime, SpawnCoords, Coords, TestDrive, lastPlayerCoords, Framework = {}, true, nil, nil, nil, nil, nil, nil, nil
local currentVeh = nil
local createdPeds = {}
local pendingPurchaseData = nil

-- Ödeme menüsü göster (ox_lib context menu)
local function ShowPaymentMenu(data, Framework, isQBCore)
    pendingPurchaseData = data

    -- Bakiye bilgilerini al
    local cash = 0
    local bank = 0

    if isQBCore then
        local PlayerData = Framework.Functions.GetPlayerData()
        cash = PlayerData.money.cash or 0
        bank = PlayerData.money.bank or 0
    else
        local PlayerData = Framework.GetPlayerData()
        cash = PlayerData.money or 0
        bank = PlayerData.bank or 0
    end

    local price = data.price
    local vehicleName = data.model

    lib.registerContext({
        id = 'galer_payment_menu',
        title = 'Araç Satın Alma',
        options = {
            {
                title = vehicleName:upper(),
                description = 'Fiyat: $' .. price,
                icon = 'car',
                disabled = true
            },
            {
                title = 'Nakit ile Öde',
                description = 'Mevcut: $' .. cash .. ' | Gereken: $' .. price,
                icon = 'money-bill',
                disabled = cash < price,
                onSelect = function()
                    ProcessPurchase(data, 'cash', Framework, isQBCore)
                end
            },
            {
                title = 'Bankadan Öde',
                description = 'Mevcut: $' .. bank .. ' | Gereken: $' .. price,
                icon = 'credit-card',
                disabled = bank < price,
                onSelect = function()
                    ProcessPurchase(data, 'bank', Framework, isQBCore)
                end
            },
            {
                title = 'İptal',
                description = 'Satın almayı iptal et',
                icon = 'times',
                onSelect = function()
                    pendingPurchaseData = nil
                end
            }
        }
    })

    lib.showContext('galer_payment_menu')
end

-- Satın alma işlemini gerçekleştir
function ProcessPurchase(data, paymentMethod, Framework, isQBCore)
    local callbackName = isQBCore and "Framework.Functions.TriggerCallback" or "Framework.TriggerServerCallback"

    if isQBCore then
        Framework.Functions.TriggerCallback("isPrice", function(result)
            if not result then
                Framework.Functions.Notify('Yetersiz bakiye!', 'error')
                return
            end
            CompleteVehiclePurchase(data, Framework, isQBCore)
        end, data.price, paymentMethod)
    else
        Framework.TriggerServerCallback("isPrice", function(result)
            if not result then
                Framework.ShowNotification("Yetersiz bakiye!")
                return
            end
            CompleteVehiclePurchase(data, Framework, isQBCore)
        end, data.price, paymentMethod)
    end
end

-- Araç oluşturma ve sahiplik atama
function CompleteVehiclePurchase(data, Framework, isQBCore)
    local hash = GetHashKey(data.model)
    local coords = konumfor(SpawnCoords)
    if coords == nil then return end

    RequestModel(hash)
    while not HasModelLoaded(hash) do
        Citizen.Wait(10)
    end

    local buycar = CreateVehicle(hash, coords.x, coords.y, coords.z, coords.w, true, false)
    local netid = NetworkGetNetworkIdFromEntity(buycar)
    SetPedIntoVehicle(PlayerPedId(), buycar, -1)
    SetVehicleNumberPlateText(buycar, CustomizePlate())
    SetVehicleCustomPrimaryColour(buycar, data.color.R, data.color.G, data.color.B)
    SetVehicleCustomSecondaryColour(buycar, data.color.R, data.color.G, data.color.B)
    SetVehicleHasBeenOwnedByPlayer(buycar, true)
    SetNetworkIdCanMigrate(netid, true)
    SetVehicleNeedsToBeHotwired(buycar, false)
    SetVehRadioStation(buycar, 'OFF')

    local Plate = Trim(GetVehicleNumberPlateText(buycar))
    CloseNui()
    CustomizeCamera(isOpen)
    Config.Carkeys(Plate)

    if isQBCore then
        TriggerServerEvent("vehicleshop:setVehicleOwned", Plate, Framework.Functions.GetVehicleProperties(buycar), data.model)
    else
        TriggerServerEvent("vehicleshop:setVehicleOwned", Plate, Framework.Game.GetVehicleProperties(buycar), data.model)
    end

    SendNUIMessage({type = "close"})
    pendingPurchaseData = nil
end

RegisterNUICallback("TestDrive", function(data, cb)
    SetEntityVisible(PlayerPedId(), 1)

    local hash = GetHashKey(data.car)
    lastPlayerCoords = GetEntityCoords(PlayerPedId())
    RequestModel(hash)
    while not HasModelLoaded(hash) do
        Citizen.Wait(10)
    end
    local testDriveEntity = CreateVehicle(hash, vector4(TestDrive), 1, 1)
    SetPedIntoVehicle(PlayerPedId(), testDriveEntity, -1)
    SetVehicleNumberPlateText(testDriveEntity, "TestCar")
    local Plate = Trim(GetVehicleNumberPlateText(testDriveEntity))
    SetVehicleCustomPrimaryColour(testDriveEntity, data.color.R, data.color.G, data.color.B)
    SetVehicleCustomSecondaryColour(testDriveEntity, data.color.R, data.color.G, data.color.B)
    Config.Carkeys(Plate)

    startCountDown = true
    local timeGG = GetGameTimer()
    local testDriveActive = true

    -- Modern bildirim göster
    if Config.Framework == "QBCore" or Config.Framework == "OLDQBCore" then
        Framework.Functions.Notify("Test sürüşü başladı! Süre: " .. TestDriveTime .. " saniye", "success", 5000)
        Framework.Functions.Notify("Test sürüşünü bitirmek için [E] tuşuna basın veya araçtan inin", "primary", 7000)
    else
        Framework.ShowNotification("Test sürüşü başladı! Süre: " .. TestDriveTime .. " saniye")
        Framework.ShowNotification("Test sürüşünü bitirmek için [E] tuşuna basın veya araçtan inin")
    end

    Citizen.CreateThread(function()
        while startCountDown and testDriveActive do
            SendNUIMessage({type = "close"})
            Citizen.Wait(1)
            
            local remainingTime = math.ceil(TestDriveTime - (GetGameTimer() - timeGG)/1000)
            
            -- E tuşuna basıldı mı kontrol et
            if IsControlJustPressed(0, 38) then -- E tuşu
                testDriveActive = false
                if Config.Framework == "QBCore" or Config.Framework == "OLDQBCore" then
                    Framework.Functions.Notify("Test sürüşü sonlandırıldı", "error", 3000)
                else
                    Framework.ShowNotification("Test sürüşü sonlandırıldı")
                end
            end
            
            -- Araçtan indi mi kontrol et
            if not IsPedInVehicle(PlayerPedId(), testDriveEntity, false) then
                testDriveActive = false
                if Config.Framework == "QBCore" or Config.Framework == "OLDQBCore" then
                    Framework.Functions.Notify("Araçtan indiğiniz için test sürüşü sonlandırıldı", "error", 3000)
                else
                    Framework.ShowNotification("Araçtan indiğiniz için test sürüşü sonlandırıldı")
                end
            end
            
            if GetGameTimer() < timeGG + tonumber(1000*TestDriveTime) and testDriveActive then
                -- Modern HUD gösterimi
                drawTxt('~w~TEST SÜRÜŞÜ: ~g~' .. remainingTime .. ' ~w~saniye~n~~y~[E] ~w~ile bitir',4,0.5,0.93,0.50,255,255,255,200)
            else
                testDriveActive = false
                if Config.Framework == "QBCore" or Config.Framework == "OLDQBCore" then
                    Framework.Functions.Notify("Test sürüşü süresi doldu", "error", 3000)
                else
                    Framework.ShowNotification("Test sürüşü süresi doldu")
                end
            end
            
            -- Test sürüşü bitti, aracı sil ve oyuncuyu geri götür
            if not testDriveActive then
                DeleteEntity(testDriveEntity)
                SetEntityCoords(PlayerPedId(), lastPlayerCoords)
                startCountDown = false
            end
        end
    end)
end)

    function Draw3DText(x, y, z, text)
        local onScreen, _x, _y = World3dToScreen2d(x, y, z)
        local px,py,pz=table.unpack(GetGameplayCamCoords())
        if onScreen then
            SetTextScale(0.35, 0.35)
            SetTextFont(4)
            SetTextProportional(1)
            SetTextColour(255, 255, 255, 215)
            SetTextDropShadow(0, 0, 0, 55)
            SetTextEdge(0, 0, 0, 150)
            SetTextDropShadow()
            SetTextOutline()
            SetTextEntry("STRING")
            SetTextCentre(1)
            AddTextComponentString(text)
            DrawText(_x,_y)
        end
    end


    RegisterNUICallback("rotateright", function()
        SetEntityHeading(currentVeh, GetEntityHeading(currentVeh) - 2)
    end)

    RegisterNUICallback("rotateleft", function()
        SetEntityHeading(currentVeh, GetEntityHeading(currentVeh) + 2)
    end)

      RegisterNUICallback("Vehicle",function(data, cb)
        local model = GetHashKey(data.vehicle)
        local vehClass = GetVehicleClassFromName(model)
        RequestModel(model)
        while not HasModelLoaded(model) do
            Wait(7)
        end
        if DoesEntityExist(currentVeh) then
            EYESDeleteVehicle(currentVeh)
            currentVeh = nil
        end
        currentVeh = CreateVehicle(model, Coords, false, true)
        SetVehicleEngineOn(currentVeh, true, true, false)
        SetVehicleCustomPrimaryColour(currentVeh, data.color.R, data.color.G, data.color.B)
        SetVehicleCustomSecondaryColour(currentVeh, data.color.R, data.color.G, data.color.B)
        SetEntityHeading(currentVeh, Coords.w or GetEntityHeading(currentVeh))
        SetVehicleOnGroundProperly(currentVeh)
        FreezeEntityPosition(currentVeh, vehClass == 14)
        cb(
            {
               maxSpeed = GetVehicleEstimatedMaxSpeed(currentVeh),
                Fuel = Config.GetVehFuel(currentVeh),
                Handling = GetVehicleMaxTraction(currentVeh) *12.6,
                Acceleration = GetVehicleAcceleration(currentVeh) *12.6,
                Brake = GetVehicleMaxBraking(currentVeh) *12.6
            }
        )
    end
)           
         RegisterNUICallback("Delete",function()
                 EYESDeleteVehicle(currentVeh)
             end
         )

      function EYESDeleteVehicle(vehicle)
          if not vehicle or not DoesEntityExist(vehicle) then return end
          SetEntityAsMissionEntity(vehicle, true, true)
          DeleteVehicle(vehicle)
      end

      RegisterNUICallback("SelectColor", function(data)
          RGB = data.color
          SetVehicleCustomPrimaryColour(currentVeh, data.color.R, data.color.G, data.color.B)
          SetVehicleCustomSecondaryColour(currentVeh, data.color.R, data.color.G, data.color.B)
      end)
      


     function OpenNui(data)
          SetDisplay(true, true)
          local cam = CreateCamWithParams("DEFAULT_SCRIPTED_CAMERA",data.NuiCarViewCameraPosition.posX, data.NuiCarViewCameraPosition.posY, data.NuiCarViewCameraPosition.posZ,data.NuiCarViewCameraPosition.rotX, data.NuiCarViewCameraPosition.rotY, data.NuiCarViewCameraPosition.rotZ,data.NuiCarViewCameraPosition.fov,true,0)
          RequestCollisionAtCoord(data.NuiCarViewCameraPosition.posX, data.NuiCarViewCameraPosition.posY, data.NuiCarViewCameraPosition.posZ)
          RenderScriptCams(true, true, 1, true, true)
          PointCamAtCoord(cam, data.NuiCarViewCameraPosition.posX, data.NuiCarViewCameraPosition.posY, data.NuiCarViewCameraPosition.posZ)
          SetFocusPosAndVel(data.NuiCarViewCameraPosition.posX, data.NuiCarViewCameraPosition.posY, data.NuiCarViewCameraPosition.posZ, 0.0, 0.0, 0.0)
          CustomizeCamera(isOpen)
      end


 function CloseNui()
    Citizen.Wait(1)
     CustomizeCamera(isOpen)
     SetDisplay(false)
     DestroyAllCams(true)
     RenderScriptCams(false, true, 75, true, false, false)
     SetFocusEntity(GetPlayerPed(PlayerId()))
     EYESDeleteVehicle(currentVeh)
     DisplayRadar(true)
     DisplayHud(true)
 end


 if Config.Framework == "ESX" or Config.Framework == "NewESX" then
    Citizen.CreateThread(function()
      Framework = GetFramework()
      while Framework == nil do
        Citizen.Wait(0)
        TriggerEvent('esx:getSharedObject', function(obj) Framework = obj end)
        while Framework.GetPlayerData().job == nil do
            Citizen.Wait(10)
        end
        Framework.PlayerData = Framework.GetPlayerData()
      end

      Citizen.CreateThread(function()
        Framework.PlayerData = Framework.GetPlayerData()
        while Framework.GetPlayerData().job == nil do
            Citizen.Wait(0)
            Framework.PlayerData = Framework.GetPlayerData()
        end
      end)
  

        RegisterNetEvent('esx:setJob')
        AddEventHandler('esx:setJob', function(job)
          Framework.PlayerData.job = job
        end)


      Citizen.CreateThread(function()
        Framework.PlayerData = Framework.GetPlayerData()
        while true do
          Citizen.Wait(0)
          local getPed = PlayerPedId()
          local entity = GetEntityCoords(getPed)
    
          for k,v in pairs(Config.Locations) do
            local dist = #(entity - v.coords)

            if dist < 10 then
              if dist < 3 then
                x = v.coords[1]
                y = v.coords[2]
                z = v.coords[3]
                -- Baloncuk ve E etkilesimi (NPC'nin ustunde)
                local npc = nil
                for i = 1, #createdPeds do
                    if DoesEntityExist(createdPeds[i]) then
                        local pedCoords = GetEntityCoords(createdPeds[i])
                        local distToPed = #(vector3(x,y,z) - pedCoords)
                        if distToPed < 2.0 then
                            npc = createdPeds[i]
                            break
                        end
                    end
                end
                
                if npc then
                    local npcCoords = GetEntityCoords(npc)
                    DrawWelcomeBubble(npcCoords, "GALERI", "Hosgeldiniz! Tum araclar burada.")
                    DrawText3D(npcCoords.x, npcCoords.y, npcCoords.z + 1.0, "[~g~E~w~] Galeri")
                end
                if IsControlJustPressed(0,38) then
                  if v.job == Framework.PlayerData.job.name or v.job == 'all' then
                    SendNUIMessage({
                      type = "ui",
                      vehicle = Config.Vehicles.Car[v.type],
                      color = Config.Vehicles.Color[v.type],
                      category = Config.Vehicles.Category[v.type]
                    })
    
                    Coords = v.NuiCarViewSpawnPosition
                    TestDrive = v.TestDriveSpawnPosition
                    TestDriveTime = v.TestDriveTime
                    SpawnCoords = v.BuyCarSpawnPositions
    
                    OpenNui(v)
                  end
                end
              end
            end
          end
        end
      end)

      function sellVehicle(model, plate)
        local car = GetVehiclePedIsIn(PlayerPedId())
        for _,v in pairs(Config.Vehicles.Car['car']) do
            if v.model == model then
                Framework.TriggerServerCallback("SellVehicles", function(result, cb)
                    if result then
                        Framework.ShowNotification("The gallery owner has agreed to buy your vehicle! You have received $"..v.price * (Config.RefundPercent * 0.01))
                        DeleteVehicle(car)
                    else
                        Framework.ShowNotification("This vehicle does not belong to you! ("..plate..")")
                    end
                end, plate, v.price, Config.RefundPercent)
            end
        end
    end
    
    Citizen.CreateThread(function()
        while true do
            Citizen.Wait(0)
            local vehicle = GetVehiclePedIsIn(PlayerPedId())
            if IsPedInVehicle(PlayerPedId(), vehicle, true) and GetPedInVehicleSeat(vehicle, -1) then
                local entity = GetEntityCoords(PlayerPedId())
                for _,v in pairs(Config.SellVehicles) do
                    local dist = #(entity - v)
                    if dist <= 5.0 then
                        DrawText3D(v.x, v.y, v.z + 0.4, '~g~SELL ~w~YOUR VEHICLE ~r~')
                        DrawMarker(2, v.x, v.y, v.z, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.3, 0.2, 0.15, 255, 255, 255, 255, false, false, false, true, false, false, false)
                        if IsControlJustPressed(0,38) then
                            local model = GetDisplayNameFromVehicleModel(GetEntityModel(vehicle)):lower()
                            local plate = GetVehicleNumberPlateText(vehicle)
                            sellVehicle(model, plate)
                        end
                        break
                    end
                end
            end
        end
    end)


   RegisterNUICallback("Buy", function(data, cb)
       -- Ödeme menüsünü göster
       ShowPaymentMenu(data, Framework, false)
   end)


end)

elseif Config.Framework == 'QBCore' or Config.Framework == 'OLDQBCore'  then
     if Config.Framework == "OLDQBCore" then
          while Framework == nil do
               TriggerEvent('QBCore:GetObject', function(obj) Framework = obj end)
               Citizen.Wait(4)
          end
          Framework.PlayerData = Framework.Functions.GetPlayerData()
     else  Framework = exports['qb-core']:GetCoreObject() end

     Citizen.CreateThread(function()
        Framework.PlayerData = Framework.Functions.GetPlayerData()
        while Framework.Functions.GetPlayerData().job == nil do
            Citizen.Wait(0)
            Framework.PlayerData = Framework.Functions.GetPlayerData()
        end
      end)
    

            Citizen.CreateThread(function()
                while true do
                    Citizen.Wait(0)
                    local getPed = PlayerPedId()
                    local entity = GetEntityCoords(getPed)
                    for k, v in pairs(Config.Locations) do
                        local dist = #(entity - v.coords)
                        if dist < 10 then
                            if dist < 3 then
                                local x, y, z = v.coords[1], v.coords[2], v.coords[3]
                                -- Baloncuk ve E etkilesimi (NPC'nin ustunde)
                                local npc = nil
                                for i = 1, #createdPeds do
                                    if DoesEntityExist(createdPeds[i]) then
                                        local pedCoords = GetEntityCoords(createdPeds[i])
                                        local distToPed = #(vector3(x,y,z) - pedCoords)
                                        if distToPed < 2.0 then
                                            npc = createdPeds[i]
                                            break
                                        end
                                    end
                                end
                                
                                if npc then
                                    local npcCoords = GetEntityCoords(npc)
                                    DrawWelcomeBubble(npcCoords, "GALERI", "Hosgeldiniz! Tum araclar burada.")
                                    DrawText3D(npcCoords.x, npcCoords.y, npcCoords.z + 1.0, "[~g~E~w~] Galeri")
                                end
                                if IsControlJustPressed(0, 38) then
                                    if v.job == Framework.PlayerData.job.name or v.job == 'all' then
                                        SendNUIMessage({
                                            type = "ui",
                                            vehicle = Config.Vehicles.Car[v.type],
                                            color = Config.Vehicles.Color[v.type],
                                            category = Config.Vehicles.Category[v.type]
                                        })
                                        Coords = v.NuiCarViewSpawnPosition
                                        TestDrive = v.TestDriveSpawnPosition
                                        TestDriveTime = v.TestDriveTime
                                        SpawnCoords = v.BuyCarSpawnPositions
                                        OpenNui(v)
                                    end
                                end
                            end
                        end
                    end
                end
        end)  

        RegisterNUICallback("Buy", function(data, cb)
            -- Ödeme menüsünü göster
            ShowPaymentMenu(data, Framework, true)
        end)

     end


 function randomNumber(length)
	local res = ""
	for i = 1, length do res = res .. string.char(math.random(48,  57)) end
	return res
end

function randomCharacter(length)
	local res = ""
	for i = 1, length do res = res .. string.char(math.random(97, 122))	end
	return res
end


 function Trim(value)
    return (string.gsub(value, '^%s*(.-)%s*$', '%1'))
end

local function EnumerateEntities(initFunc, moveFunc, disposeFunc)
	return coroutine.wrap(function()
		local iter, id = initFunc()
		if not id or id == 0 then
			disposeFunc(iter)
			return
		end
		local enum = {handle = iter, destructor = disposeFunc}
		setmetatable(enum, entityEnumerator)
		local next = true
		repeat
			coroutine.yield(id)
			next, id = moveFunc(iter)
		until not next
		enum.destructor, enum.handle = nil, nil
		disposeFunc(iter)
	end)
end

function EnumerateVehicles()
    return EnumerateEntities(FindFirstVehicle, FindNextVehicle, EndFindVehicle)
end

function EnumerateEntitiesWithinDistance(entities, isPlayerEntities, coords, maxDistance)
	local nearbyEntities = {}
	if coords then
		coords = vector3(coords.x, coords.y, coords.z)
	else
		local playerPed = PlayerPedId()
		coords = GetEntityCoords(playerPed)
	end
	for k,entity in pairs(entities) do
		local distance = #(coords - GetEntityCoords(entity))
		if distance <= maxDistance then
			table.insert(nearbyEntities, isPlayerEntities and k or entity)
		end
	end
	return nearbyEntities
end

function GetVehicles()
	local vehicles = {}
	for vehicle in EnumerateVehicles() do
		table.insert(vehicles, vehicle)
	end
	return vehicles
end

function konumfor(getkonum)
    for k, v in pairs(getkonum) do
        local konum = EnumerateEntitiesWithinDistance(GetVehicles(), false, v, 2.5)
        Wait(4)
        if konum[1] == nil then
            return v
        end
    end
end
 
 local display = false
 
 RegisterNUICallback("exit", function(data)
     CloseNui()
 end)
 
 function SetDisplay(bool)
     display = bool
     SetNuiFocus(bool, bool)
 end


 _RequestModel = function(hash)
    if type(hash) == "string" then hash = GetHashKey(hash) end
    RequestModel(hash)
    while not HasModelLoaded(hash) do
    Wait(0)
    end
end


EYES.Create = function()
    for i = 1, #createdPeds do
        if DoesEntityExist(createdPeds[i]) then
            DeletePed(createdPeds[i])
            SetPedAsNoLongerNeeded(createdPeds[i])
        end
    end
    createdPeds = {}
end

Citizen.CreateThread(function()
    EYES.Functions.CreateBlips()
    local locations = Config.Locations
    for i=1, #locations do
        local pedHash = GetHashKey(locations[i].hash)
        local coords = locations[i].coords
        local heading = locations[i].heading
        if pedHash then
            _RequestModel(pedHash)
            local ped = CreatePed(4, pedHash, coords.x, coords.y, coords.z - 1.0, heading, false, false)
            if DoesEntityExist(ped) then
                SetEntityAsMissionEntity(ped, true, true)
                SetBlockingOfNonTemporaryEvents(ped, true)
                FreezeEntityPosition(ped, true)
                SetEntityInvincible(ped, true)
                SetEntityHeading(ped, heading)
                createdPeds[#createdPeds + 1] = ped
            end
            SetModelAsNoLongerNeeded(pedHash)
        end
    end
end)


AddEventHandler('onResourceStop', function(resourceName)
    if resourceName == GetCurrentResourceName() then
        print(GetCurrentResourceName() .. ' [PED] New pads added, old pad data deleted!')
        EYES.Create()
    end
end)


 
 DrawText3D = function(x, y, z, text)
     SetTextScale(0.35, 0.35)
     SetTextFont(2)
     SetTextProportional(1)
     SetTextColour(255, 255, 255, 215)
     SetTextEntry("STRING")
     SetTextCentre(true)
     AddTextComponentString(text)
     SetDrawOrigin(x,y,z, 0)
     DrawText(0.0, 0.0)
     local factor = (string.len(text)) / 370
     DrawRect(0.0, 0.0+0.0125, 0.017+ factor, 0.03, 0, 0, 0, 75)
     ClearDrawOrigin()
 end

 

 function drawTxt(text,font,x,y,scale,r,g,b,a)
	SetTextFont(font)
	SetTextScale(scale,scale)
	SetTextColour(r,g,b,a)
	SetTextOutline()
	SetTextCentre(5)
     SetTextFont(8)
	SetTextEntry("STRING")
	AddTextComponentString(text)
	DrawText(x,y)
end

-- Rentacar'daki gibi 3D KONUSMA BALONCUGU
function DrawWelcomeBubble(coords, title, subtitle)
    local onScreen, _x, _y = World3dToScreen2d(coords.x, coords.y, coords.z + 1.75)
    
    if onScreen then
        local bubbleWidth = 0.28
        local bubbleHeight = 0.09
        local tailHeight = 0.02
        local alpha = 220
        
        -- Ana baloncuğun arka planı
        DrawRect(_x, _y - bubbleHeight/2 + 0.015, bubbleWidth - 0.02, 0.03, 0, 0, 0, alpha)
        DrawRect(_x, _y - 0.005, bubbleWidth, bubbleHeight - 0.04, 0, 0, 0, alpha)
        DrawRect(_x, _y + bubbleHeight/2 - 0.025, bubbleWidth - 0.02, 0.02, 0, 0, 0, alpha)
        
        -- Köşe yuvarlaklığı
        DrawRect(_x - bubbleWidth/2 + 0.01, _y - bubbleHeight/2 + 0.02, 0.02, 0.025, 0, 0, 0, alpha)
        DrawRect(_x + bubbleWidth/2 - 0.01, _y - bubbleHeight/2 + 0.02, 0.02, 0.025, 0, 0, 0, alpha)
        DrawRect(_x - bubbleWidth/2 + 0.01, _y + bubbleHeight/2 - 0.03, 0.02, 0.015, 0, 0, 0, alpha)
        DrawRect(_x + bubbleWidth/2 - 0.01, _y + bubbleHeight/2 - 0.03, 0.02, 0.015, 0, 0, 0, alpha)
        
        -- Kuyruk
        DrawRect(_x, _y + bubbleHeight/2 - 0.005, 0.015, tailHeight + 0.01, 0, 0, 0, alpha)
        DrawRect(_x - 0.008, _y + bubbleHeight/2 - 0.01, 0.01, tailHeight, 0, 0, 0, alpha)
        DrawRect(_x + 0.008, _y + bubbleHeight/2 - 0.01, 0.01, tailHeight, 0, 0, 0, alpha)
        DrawRect(_x, _y + bubbleHeight/2 + tailHeight/2 - 0.002, 0.008, 0.008, 0, 0, 0, alpha)
        
        -- Başlık (Altın renk)
        SetTextScale(0.32, 0.32)
        SetTextFont(4)
        SetTextProportional(1)
        SetTextColour(255, 215, 0, 255)
        SetTextEntry("STRING")
        SetTextCentre(1)
        AddTextComponentString(title)
        DrawText(_x, _y - 0.035)
        
        -- Alt başlık (Beyaz)
        SetTextScale(0.23, 0.23)
        SetTextFont(4)
        SetTextProportional(1)
        SetTextColour(255, 255, 255, 255)
        SetTextEntry("STRING")
        SetTextCentre(1)
        AddTextComponentString(subtitle)
        DrawText(_x, _y - 0.002)
        
        -- İkon
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

