local PlayerData = {}
local currentVehicleshop = nil
local currentVehicle = nil
local spawnedVehs = {}
local vehicle = nil
local isInRoutingBucket = false

if Config.Core == "ESX" then
    if Config.CoreDefine ~= nil and Config.CoreDefine ~= "" then
        ESX = nil
        Citizen.CreateThread(function()
    	    while ESX == nil do
    		    TriggerEvent(Config.CoreDefine, function(obj) ESX = obj end)
    		    Citizen.Wait(0)
    	    end
        end)
    else
        ESX = Config.CoreExport()
    end

    RegisterNetEvent(Config.PlayerLoaded)
    AddEventHandler(Config.PlayerLoaded, function(xPlayer)
        PlayerData = xPlayer
    end)

    RegisterNetEvent(Config.JobUpdated)
    AddEventHandler(Config.JobUpdated, function(job)
        PlayerData.job = job 
    end)
elseif Config.Core == "QB-Core" then
    QBCore = Config.CoreExport()

    RegisterNetEvent(Config.PlayerLoaded, function()
        PlayerData = QBCore.Functions.GetPlayerData()
    end)

    RegisterNetEvent(Config.JobUpdated, function(JobInfo)
        PlayerData.job = JobInfo
    end)
end

Citizen.CreateThread(function()
    Citizen.Wait(250)
    if Config.UseTarget and Config.TargetResource == "ox_target" or Config.Menu == "ox_lib" then
        local import = LoadResourceFile('ox_lib', 'init.lua')
        local chunk = assert(load(import, '@@ox_lib/init.lua'))
        chunk()
    end
    if Config.UseTarget then
        for k, v in pairs(Config.VehicleShops) do
            Config.Target(k, v)
        end
    end
end)

local NumberCharset = {}
local Charset = {}

for i = 48,  57 do table.insert(NumberCharset, string.char(i)) end -- 0-9
for i = 65,  90 do table.insert(Charset, string.char(i)) end       -- A-Z
for i = 97, 122 do table.insert(Charset, string.char(i)) end       -- a-z

function GeneratePlate()
	local generatedPlate
	local isNotTaken = false

	while not isNotTaken do
		Citizen.Wait(0)
		-- Özel format: SAYI-HARF-HARF-HARF-SAYI-SAYI-SAYI
		local part1 = GetRandomNumber(1)
		local part2 = GetRandomLetter(3)
		local part3 = GetRandomNumber(3)
		generatedPlate = part1 .. part2 .. part3

		if Config.Core == "ESX" then
			ESX.TriggerServerCallback('vms_vehicleshop:isPlateTaken', function(isPlateTaken)
				if not isPlateTaken then
					isNotTaken = true
				end
			end, generatedPlate)
		elseif Config.Core == "QB-Core" then
			QBCore.Functions.TriggerCallback('vms_vehicleshop:isPlateTaken', function(isPlateTaken)
				if not isPlateTaken then
					isNotTaken = true
				end
			end, generatedPlate)
		end
	end

	return generatedPlate
end

function GetRandomNumber(length)
	local result = ""
	for i = 1, length do
		result = result .. NumberCharset[math.random(1, #NumberCharset)]
	end
	return result
end

function GetRandomLetter(length)
	local result = ""
	for i = 1, length do
		result = result .. Charset[math.random(1, #Charset)]
	end
	return string.upper(result) -- Büyük harfe çeviriyoruz
end


Citizen.CreateThread(function()
    for k, v in pairs(Config.VehicleShops) do
        if v and v.blip then
		    local blip = AddBlipForCoord(v.coords)
		    SetBlipSprite(blip, v.blip.sprite)
		    SetBlipDisplay(blip, v.blip.display)
		    SetBlipScale(blip, 0.6)
		    SetBlipColour(blip, 0)
		    SetBlipAsShortRange(blip, true)
		    BeginTextCommandSetBlipName("STRING")
		    AddTextComponentString(v.name)
		    EndTextCommandSetBlipName(blip)
        end
    end
end)

local function deleteShowedVehicle() 
    for i,v in pairs(spawnedVehs) do
        if DoesEntityExist(v) then
            DeleteEntity(v)
        end
        table.remove(spawnedVehs, i)
    end
    if DoesEntityExist(vehicle) then
        DeleteEntity(vehicle)
        vehicle = nil
    end
end

local function spawnCar(modelName)
    currentVehicle = modelName
    local model = (type(modelName) == 'number' and modelName or GetHashKey(modelName))
	Citizen.CreateThread(function()
        deleteShowedVehicle()
		local modelHash = model
        modelHash = (type(modelHash) == 'number' and modelHash or GetHashKey(modelHash))
        if not HasModelLoaded(modelHash) and IsModelInCdimage(modelHash) then
            RequestModel(modelHash)
            while not HasModelLoaded(modelHash) do
                Citizen.Wait(1)
            end
        end
		vehicle = CreateVehicle(model, currentVehicleshop.carCoords, false, false)
        Config.VehicleInShowRoom(vehicle)
        FreezeEntityPosition(vehicle, true)
		SetPedIntoVehicle(PlayerPedId(), vehicle, -1)
        table.insert(spawnedVehs, vehicle)
		local timeout = 0
		SetEntityAsMissionEntity(vehicle, true, false)
		SetVehicleHasBeenOwnedByPlayer(vehicle, true)
		SetVehicleNeedsToBeHotwired(vehicle, false)
		SetVehRadioStation(vehicle, 'OFF')
		SetModelAsNoLongerNeeded(model)
		RequestCollisionAtCoord(currentVehicleshop.carCoords)
		while not HasCollisionLoadedAroundEntity(vehicle) and timeout < 2000 do
			Citizen.Wait(0)
			timeout = timeout + 1
		end
		if cb then
			cb(vehicle)
		end
	end)
end

RegisterNUICallback("action", function(data)
    if data.action == "close" then
        SetEntityCoords(PlayerPedId(), currentVehicleshop.coords)
        if DoesCamExist(cam) then
            DestroyCam(cam, true)
            RenderScriptCams(false, true, 1)
            cam = nil
        end
        SetEntityVisible(PlayerPedId(), 1)
        deleteShowedVehicle()
        if Config.UseRoutingBucketsInShowRoom then
            TriggerServerEvent("vms_vehicleshop:setRoutingBucket", true)
        end
        Config.Hud:Enable()
        SetNuiFocus(false, false)
        if Config.SoundsEffects then
            PlaySoundFrontend(-1, 'OK', 'HUD_FRONTEND_DEFAULT_SOUNDSET', 1)
        end
    elseif data.action == "select" then
        spawnCar(data.model)
        if Config.SoundsEffects then
            PlaySoundFrontend(-1, "NAV_LEFT_RIGHT", "HUD_FRONTEND_DEFAULT_SOUNDSET", true)
        end
    elseif data.action == "select-color" then
        if vehicle and DoesEntityExist(vehicle) then
            if Config.UseVehicleColorsRGB then
                SetVehicleCustomPrimaryColour(vehicle, data.color.r, data.color.g, data.color.b)
                SetVehicleCustomSecondaryColour(vehicle, data.color.r, data.color.g, data.color.b)
            else
                SetVehicleColours(vehicle, data.color.index, data.color.index)
            end
            if Config.SoundsEffects then
                PlaySoundFrontend(-1, "NAV_LEFT_RIGHT", "HUD_FRONTEND_DEFAULT_SOUNDSET", true)
            end
        end
    elseif data.action == "select-category" then
        PlaySoundFrontend(-1, "NAV_LEFT_RIGHT", "HUD_FRONTEND_DEFAULT_SOUNDSET", true)
    elseif data.action == "rotate-right" then
        if vehicle and DoesEntityExist(vehicle) then
            SetEntityRotation(vehicle, GetEntityRotation(vehicle) + vector3(0, 0, 5), false, false, 2, false)
        end
    elseif data.action == "rotate-left" then
        if vehicle and DoesEntityExist(vehicle) then
            SetEntityRotation(vehicle, GetEntityRotation(vehicle) - vector3(0, 0, 5), false, false, 2, false)
        end
    elseif data.action == "buy" then
        if Config.Core == "ESX" then
            ESX.TriggerServerCallback('vms_vehicleshop:buyVehicle', function(callback) 
                if callback then
                    if Config.UseRoutingBucketsInShowRoom then
                        TriggerServerEvent("vms_vehicleshop:setRoutingBucket", true)
                        while isInRoutingBucket do
                            Citizen.Wait(10)
                        end
                    end
                    SendNUIMessage({action = 'bought'})
                    if Config.UseFadeWithSpawn then
                        DoScreenFadeOut(600)
                        Citizen.Wait(600)
                    end
                    Citizen.CreateThread(function() 
                        RequestModel(GetHashKey(currentVehicle))
                        while not HasModelLoaded(GetHashKey(currentVehicle)) do
                           Wait(1000)
                        end
                        local customPrimaryColor = {GetVehicleCustomPrimaryColour(vehicle)}
                        local customSecondaryColor = {GetVehicleCustomSecondaryColour(vehicle)}
                        local indexPrimaryColor, indexSecondaryColor = GetVehicleColours(vehicle)
                        local myPed = PlayerPedId()
                        ESX.Game.SpawnVehicle(currentVehicle, vec(currentVehicleshop.buyCoords.x, currentVehicleshop.buyCoords.y, currentVehicleshop.buyCoords.z), currentVehicleshop.buyCoords.w, function(vehicle)
                            TaskWarpPedIntoVehicle(myPed, vehicle, -1)
                            local newPlate = GeneratePlate()
                            local vehicleProps = ESX.Game.GetVehicleProperties(vehicle)
                            vehicleProps.plate = newPlate
                            SetVehicleNumberPlateText(vehicle, newPlate)
                            SetVehicleDirtLevel(vehicle, 0.0)
                            if Config.UseVehicleColorsRGB then
                                SetVehicleCustomPrimaryColour(vehicle, tonumber(customPrimaryColor[1]), tonumber(customPrimaryColor[2]), tonumber(customPrimaryColor[3]))
                                SetVehicleCustomSecondaryColour(vehicle, tonumber(customSecondaryColor[1]), tonumber(customSecondaryColor[2]), tonumber(customSecondaryColor[3]))
                            else
                                SetVehicleColours(vehicle, tonumber(indexPrimaryColor), tonumber(indexSecondaryColor))
                            end
                            TriggerServerEvent('vms_vehicleshop:addOwner', vehicleProps, currentVehicleshop.vehicles[currentVehicle], currentVehicleshop.type)
                            
                            Config.GiveKeysBuy(vehicle, vehicleProps.plate, currentVehicleshop.vehicles[currentVehicle].model)
                        end)
                        if DoesCamExist(cam) then
                            DestroyCam(cam, true)
                            RenderScriptCams(false, true, 1)
                            cam = nil
                        end
                        SetEntityVisible(myPed, 1)
                        deleteShowedVehicle()
                        Config.Hud:Enable()
                        SetNuiFocus(false, false)
                        if Config.UseFadeWithSpawn then
                            DoScreenFadeIn(800)
                        end
                        if Config.SoundsEffects then
                            PlaySoundFrontend(-1, 'OK', 'HUD_FRONTEND_DEFAULT_SOUNDSET', 1)
                        end
                   end)
                end
            end, currentVehicleshop.vehicles[currentVehicle])
        elseif Config.Core == "QB-Core" then
            QBCore.Functions.TriggerCallback('vms_vehicleshop:buyVehicle', function(callback)
                if callback then
                    if Config.UseRoutingBucketsInShowRoom then
                        TriggerServerEvent("vms_vehicleshop:setRoutingBucket", true)
                        while isInRoutingBucket do
                            Citizen.Wait(10)
                        end
                    end
                    SendNUIMessage({action = 'bought'})
                    if Config.UseFadeWithSpawn then
                        DoScreenFadeOut(600)
                        Citizen.Wait(600)
                    end
                    local customPrimaryColor = {GetVehicleCustomPrimaryColour(vehicle)}
                    local customSecondaryColor = {GetVehicleCustomSecondaryColour(vehicle)}
                    local indexPrimaryColor, indexSecondaryColor = GetVehicleColours(vehicle)
                    local myPed = PlayerPedId()
                    QBCore.Functions.TriggerCallback('QBCore:Server:SpawnVehicle', function(netId)
                        local vehicle = NetToVeh(netId)
                        local newPlate = GeneratePlate()
                        local vehicleProps = QBCore.Functions.GetVehicleProperties(vehicle)
                        vehicleProps.plate = newPlate
                        SetVehicleNumberPlateText(vehicle, newPlate)
                        SetVehicleDirtLevel(vehicle, 0.0)
                        if Config.UseVehicleColorsRGB then
                            SetVehicleCustomPrimaryColour(vehicle, tonumber(customPrimaryColor[1]), tonumber(customPrimaryColor[2]), tonumber(customPrimaryColor[3]))
                            SetVehicleCustomSecondaryColour(vehicle, tonumber(customSecondaryColor[1]), tonumber(customSecondaryColor[2]), tonumber(customSecondaryColor[3]))
                            vehicleProps.color1 = customPrimaryColor
                            vehicleProps.color2 = customSecondaryColor
                        else
                            SetVehicleColours(vehicle, tonumber(indexPrimaryColor), tonumber(indexSecondaryColor))
                            vehicleProps.color1 = tonumber(indexPrimaryColor)
                            vehicleProps.color2 = tonumber(indexSecondaryColor)
                        end
                        TriggerServerEvent('vms_vehicleshop:addOwner', vehicleProps, currentVehicleshop.vehicles[currentVehicle], currentVehicleshop.type)
                        TriggerServerEvent("qb-vehicletuning:server:SaveVehicleProps", vehicleProps)
                        Config.GiveKeysBuy(vehicle, vehicleProps.plate, currentVehicleshop.vehicles[currentVehicle].model)
                        
                        if DoesCamExist(cam) then
                            DestroyCam(cam, true)
                            RenderScriptCams(false, true, 1)
                            cam = nil
                        end
                        SetEntityHeading(vehicle, currentVehicleshop.buyCoords.w)
                        SetEntityVisible(myPed, 1)
                        deleteShowedVehicle()
                        Config.Hud:Enable()
                        SetNuiFocus(false, false)
                        if Config.UseFadeWithSpawn then
                            DoScreenFadeIn(800)
                        end
                        if Config.SoundsEffects then
                            PlaySoundFrontend(-1, 'OK', 'HUD_FRONTEND_DEFAULT_SOUNDSET', 1)
                        end
                    end, currentVehicle, currentVehicleshop.buyCoords, true)
                end
            end, currentVehicleshop.vehicles[currentVehicle])
        end
    elseif data.action == "test" then
        local canTestDrive = true
        if currentVehicleshop.testDrivePrice and currentVehicleshop.testDrivePrice > 0 then
            canTestDrive = nil
            if Config.Core == "ESX" then
                ESX.TriggerServerCallback('vms_vehicleshop:buyTestDrive', function(callback) 
                    canTestDrive = callback
                end, currentVehicleshop.testDrivePrice)
            elseif Config.Core == "QB-Core" then
                QBCore.Functions.TriggerCallback('vms_vehicleshop:buyTestDrive', function(callback)
                    canTestDrive = callback
                end, currentVehicleshop.testDrivePrice)
            end
            while canTestDrive == nil do
                Wait(15)
            end
        end
        if canTestDrive then
            SetNuiFocus(false, false)
            SetEntityVisible(PlayerPedId(), 1)
            Config.Hud:Enable()
            if DoesCamExist(cam) then
                DestroyCam(cam, true)
                RenderScriptCams(false, true, 1)
                cam = nil
            end
            if vehicle and DoesEntityExist(vehicle) then
                if Config.UseRoutingBucketsOnTestDrive then
                    TriggerServerEvent("vms_vehicleshop:setRoutingBucket")
                else
                    TriggerServerEvent("vms_vehicleshop:setRoutingBucket", true)
                end
                Config.GiveKeysTestDrive(vehicle, GetVehicleNumberPlateText(vehicle), currentVehicleshop.vehicles[currentVehicle].model)
                FreezeEntityPosition(vehicle,false)
                SetVehicleUndriveable(vehicle,false)
                SetPedIntoVehicle(PlayerPedId(), vehicle, -1)
                SetPedCoordsKeepVehicle(PlayerPedId(), vec(Config.TestDrive.coords.x, Config.TestDrive.coords.y, Config.TestDrive.coords.z))
                SetEntityHeading(vehicle, Config.TestDrive.coords.w)
                SendNUIMessage({action = "startTest"})
            end
            if Config.SoundsEffects then
                PlaySoundFrontend(-1, 'OK', 'HUD_FRONTEND_DEFAULT_SOUNDSET', 1)
            end
            Citizen.CreateThread(function()
                local start = GetGameTimer() / 1000
                Citizen.CreateThread(function()
                    while Config.TestDrive.displayTimer and GetGameTimer() / 1000 - start < Config.TestDrive.time do
                        if Config.TestDrive.displayTimer then
                            local myVehicleCoords = GetEntityCoords(vehicle)
                            local timer = math.floor(Config.TestDrive.time - (GetGameTimer() / 1000 - start))
                            DrawText3D(myVehicleCoords.x, myVehicleCoords.y, myVehicleCoords.z+1.0, Config.Translate['3dtext.time_remaining']:format(timer))
                        end
                        Citizen.Wait(1)
                    end
                end)
                SetVehicleDoorsLocked(vehicle, 2)
                while GetGameTimer() / 1000 - start < Config.TestDrive.time and DoesEntityExist(vehicle) and not IsEntityDead(PlayerPedId()) do
                    if #(GetEntityCoords(PlayerPedId()) - vec(Config.TestDrive.coords.x, Config.TestDrive.coords.y, Config.TestDrive.coords.z)) > Config.TestDrive.maxDistance then
                        SetPedCoordsKeepVehicle(PlayerPedId(), vec(Config.TestDrive.coords.x, Config.TestDrive.coords.y, Config.TestDrive.coords.z))
                        SetEntityHeading(vehicle, Config.TestDrive.coords.w)
                    end
                    if GetVehiclePedIsIn(PlayerPedId(), false) == 0 and DoesEntityExist(vehicle) then
                        SetPedIntoVehicle(PlayerPedId(), vehicle, -1)
                    end
                    Wait(1000)
                end
                SetPedCoordsKeepVehicle(PlayerPedId(), currentVehicleshop.carCoords)
                FreezeEntityPosition(vehicle, true)
                SetEntityHeading(vehicle, currentVehicleshop.carCoords.w)
                SetVehicleDoorsLocked(vehicle, 1)
                SetVehicleDirtLevel(vehicle)
                SetVehicleFixed(vehicle, false)
                SetEntityVisible(PlayerPedId(), 0)
                cam = CreateCam("DEFAULT_SCRIPTED_CAMERA", 0)
                SetCamCoord(cam, currentVehicleshop.camCoord.x, currentVehicleshop.camCoord.y, currentVehicleshop.camCoord.z)
                PointCamAtCoord(cam, currentVehicleshop.carCoords.x, currentVehicleshop.carCoords.y+1.0, currentVehicleshop.carCoords.z)
                SetCamActive(cam, true)
                RenderScriptCams(true, true, 1)
                SetNuiFocus(true, true)
                SendNUIMessage({action = "stopTest"})
                if Config.UseRoutingBucketsInShowRoom then
                    TriggerServerEvent("vms_vehicleshop:setRoutingBucket")
                end
                Config.Hud:Disable()
                if Config.SoundsEffects then
                    PlaySoundFrontend(-1, 'CHECKPOINT_UNDER_THE_BRIDGE', 'HUD_MINI_GAME_SOUNDSET', 0)
                end
            end)
        end
    end
end)

function openVehicleshop(shop)
    currentVehicleshop = shop
    SetEntityVisible(PlayerPedId(), 0)
    SetEntityCoords(PlayerPedId(), vec(shop.carCoords.x, shop.carCoords.y, shop.carCoords.z+0.5))
    cam = CreateCam("DEFAULT_SCRIPTED_CAMERA", 0)
    SetCamCoord(cam, shop.camCoord.x, shop.camCoord.y, shop.camCoord.z)
    PointCamAtCoord(cam, shop.carCoords.x, shop.carCoords.y+1.0, shop.carCoords.z)
    SetCamActive(cam, true)
    RenderScriptCams(true, true, 1)
    Config.Hud:Disable()
    if Config.SoundsEffects then
        PlaySoundFrontend(-1, 'OK', 'HUD_FRONTEND_DEFAULT_SOUNDSET', 1)
    end
    if Config.UseRoutingBucketsInShowRoom then
        TriggerServerEvent("vms_vehicleshop:setRoutingBucket")
    end
    SetNuiFocus(true, true)
    SendNUIMessage({
        action = 'open',
        vehicles = shop.vehicles,
        categories = shop.categories,
        name = shop.name,
        icon = shop.icon,
        testDrive = shop.testDrive,
        testDrivePrice = shop.testDrivePrice,
    })
end

Citizen.CreateThread(function()
    while Config.AccessOnMarker do
        local sleep = true
        local myPed = PlayerPedId()
        local myCoords = GetEntityCoords(myPed)
        for k, v in pairs(Config.VehicleShops) do
            if v.coords then
                local distance = #(myCoords - v.coords)
                if distance < Config.DistanceViewMarker then
                    v.hasAccessToThis = true
                    if v.requiredJob then
                        v.hasAccessToThis = false
                        if PlayerData.job ~= nil and PlayerData.job.name == v.requiredJob then
                            if v.requiredJobGrade then
                                if type(v.requiredJobGrade) == "table" then
                                    for gradeK, gradeV in ipairs(v.requiredJobGrade) do
                                        if Config.Core == "ESX" and (PlayerData.job.grade_name == gradeV) or Config.Core == "QB-Core" and (PlayerData.job.grade.name == gradeV) then
                                            v.hasAccessToThis = true
                                        end
                                    end
                                else
                                    if Config.Core == "ESX" and (PlayerData.job.grade_name == v.requiredJobGrade) or Config.Core == "QB-Core" and (PlayerData.job.grade.name == v.requiredJobGrade)  then
                                        v.hasAccessToThis = true
                                    end
                                end
                            else
                                v.hasAccessToThis = true
                            end
                        end
                    end
                    if v.hasAccessToThis then
                        sleep = false
                        if v.drawable['marker'] then
                            DrawMarker(1, v.coords.x, v.coords.y, v.coords.z, 0, 0, 0, 0, 0, 0, 1.2, 1.2, 1.2, 200, 200, 200, 120)
                        end
                        if distance < Config.DistanceView3DText then
                            if v.drawable['3dtext'] then
                                DrawText3D(v.coords.x, v.coords.y, v.coords.z+1.0, Config.Translate['3dtext.open'])
                            end
                            if distance < Config.DistanceAccess then
                                if IsControlJustPressed(0, Config.KeyOpen) then
                                    openVehicleshop(v)
                                end
                            end
                        end
                    end
                end
            end
        end
        Citizen.Wait(sleep and 1500 or 1)
    end
end)

RegisterNetEvent("vms_vehicleshop:settedRoutingBucket", function(toggle)
    isInRoutingBucket = toggle
end)

RegisterNetEvent("vms_vehicleshop:open", function(id)
    local v = Config.VehicleShops[id]
    openVehicleshop(v)
end)

RegisterNetEvent('vms_vehicleshop:notification', function(message, time, type)
    Config.Notification(message, time, type)
end)