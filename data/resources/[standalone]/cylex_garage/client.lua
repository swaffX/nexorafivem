print("started")
curVehicles = {}
CurrentGarage = nil
cam = nil
Framework = nil
createdlocalveh = nil
playerjob = nil



GetFrameworkObject = function()
    local object = nil
    if Config.Framework == "esx" then
        while object == nil do
            object = exports['es_extended']:getSharedObject()
            Citizen.Wait(0)
        end
    end
    if Config.Framework == "new-qb" then
        object = exports["qb-core"]:GetCoreObject()
    end
    if Config.Framework == "old-qb" then
        while object == nil do
            TriggerEvent('QBCore:GetObject', function(obj)object = obj end)
            Citizen.Wait(200)
        end
    end
    return object
end

Citizen.CreateThread(function()
    Framework = GetFrameworkObject()
    while not Framework do
        Citizen.Wait(10)
    end
    if Config.Framework == "new-qb" or Config.Framework == "old-qb" then
		PlayerData = Framework.Functions.GetPlayerData()
		while PlayerData.job == nil do
			PlayerData = Framework.Functions.GetPlayerData()
			Wait(0)
		end
		playerjob = PlayerData.job.name
	elseif Config.Framework == "esx" then
		PlayerData = Framework.GetPlayerData()
		while PlayerData.job == nil do
			PlayerData = Framework.GetPlayerData()
			Wait(0)
		end
		if (PlayerData.job.name and PlayerData.job.grade) then
			playerjob = PlayerData.job.name
		end
	end
end)

RegisterNetEvent('QBCore:Client:OnJobUpdate', function(JobInfo)
	playerjob = JobInfo.name
end)

RegisterNetEvent('esx:setJob')
AddEventHandler('esx:setJob', function(job)
	playerjob = job.name
end)




RegisterNetEvent("cylex_garage:Open", function(vehs)
    local src = source
    local cars = SetVehicleName(vehs, CurrentGarage)
    SendNUIMessage({
        action = "open",
        Translate = Config.Translate,
        cars = cars,
        html = Config.HTML
    })
    SetNuiFocus(true, true)
    curVehicles = cars
end)

SetVehicleName = function(vehs, curgarage)
    local returntable = {}
    for k,v in pairs(vehs) do
        local name = GetDisplayNameFromVehicleModel(v.hash)
        v.name = name
    end
    if curgarage and Config.Garages[curgarage].impound then
        for k,v in pairs(vehs) do
            if v.stored == 0 or not v.stored then
                table.insert(returntable, v)
            end
        end

    end
    if curgarage and not Config.Garages[curgarage].impound then
        if Config.Garages[curgarage].planegarage then
            for k,v in pairs(vehs) do
                local retval = GetVehicleClassFromName(GetHashKey(v.hash))
                if retval == 16 then
                    if Config.OnlyTakeOutPlacedGarage then
                        if v.stored and v.garage == CurrentGarage or v.stored == 1 and v.garage == CurrentGarage then
                            table.insert(returntable, v)
                        end
                    else
                        if v.stored or v.stored == 1  then
                            table.insert(returntable, v)
                        end
                    end
                end
            end
        elseif Config.Garages[curgarage].boatgarage then
            for k,v in pairs(vehs) do
                local retval = GetVehicleClassFromName(GetHashKey(v.hash))
                if retval == 14 then
                    if Config.OnlyTakeOutPlacedGarage then
                        if v.stored and v.garage == CurrentGarage or v.stored == 1 and v.garage == CurrentGarage then
                            table.insert(returntable, v)
                        end
                    else
                        if v.stored or v.stored == 1  then
                            table.insert(returntable, v)
                        end
                    end
                end
            end
        else
            for k,v in pairs(vehs) do
                if Config.OnlyTakeOutPlacedGarage then
                    if v.stored and v.garage == CurrentGarage or v.stored == 1 and v.garage == CurrentGarage then
                        table.insert(returntable, v)
                    end
                else
                    if v.stored or v.stored == 1  then
                        table.insert(returntable, v)
                    end
                end
    
            end
        end

    end
    return returntable
end

-- RegisterCommand("test31", function()
--     local retval --[[ integer ]] =
-- 	GetVehicleClassFromName(
-- 		`alphaz1` --[[ Hash ]]
-- 	)
--     print(retval)
-- end)

RegisterNUICallback("close", function(data)
    SetNuiFocus(false, false)
    if cam then
        RenderScriptCams(false, true, 500, true, true)
        DestroyCam(cam, true)
        ClearFocus()
        cam = nil
    end
    if createdlocalveh then
        DeleteVehicle(createdlocalveh)
        createdlocalveh = nil
    end
end)

RegisterNUICallback("closecam", function(data)
    if cam then
        RenderScriptCams(false, true, 500, true, true)
        DestroyCam(cam, true)
        ClearFocus()
        cam = nil
    end
end)

RegisterNUICallback("AddVehToFav", function(data)
    if data.plate then
        TriggerServerEvent("cylex_garage:AddVehToFav", data.plate)
    end
end)

function removeLocalVehicle()
    if createdlocalveh then
        DeleteVehicle(createdlocalveh)
        createdlocalveh = nil
    end
end

RegisterNUICallback("DeleteVeh", function()
    removeLocalVehicle()
end)

RegisterNUICallback("SpawnCar", function(data)
    local canspawn = CheckVehicles(data.vehicle.plate)
    if canspawn ~= 'false' then
        -- if not IsSpawnPointClear(vector3(Config.Garages[CurrentGarage].spawn.x, Config.Garages[CurrentGarage].spawn.y, Config.Garages[CurrentGarage].spawn.z), 8.0) then
        --     if Config.Framework == "new-qb" or Config.Framework == "old-qb" then
        --         Framework.Functions.Notify(Config.Translate["spawnpointclear"], "error")
        --     else
        --         Framework.ShowNotification(Config.Translate["spawnpointclear"], "error")
        --     end
        --     return
        -- end
        removeLocalVehicle()
        Wait(50)
        SpawnCar(data.vehicle)
    else 
        if Config.Framework == "new-qb" or Config.Framework == "old-qb" then
            Framework.Functions.Notify(Config.Translate["alreadyspawned"], "error")
            removeLocalVehicle()
        else
            Framework.ShowNotification(Config.Translate["alreadyspawned"], "error")
            removeLocalVehicle()
        end
    end
end)

RegisterNUICallback("GiveVehicleKey", function(data)
    TriggerServerEvent("cylex_garage:GiveVehicleKey", data.plate, data.playerid)
end)

RegisterNUICallback("SetCamera", function(data)
    CreateLocalVehicle(data.plate)
    local playerPed = PlayerPedId()
    local coords = Config.Garages[CurrentGarage].camCoord
    --local coords = GetOffsetFromEntityInWorldCoords(PlayerPedId(), 0, 0.0, 0)
    RenderScriptCams(false, true, 500, true, true)
    DestroyCam(cam, false)
    if (not DoesCamExist(cam)) then
        cam = CreateCam('DEFAULT_SCRIPTED_CAMERA', true)
        SetCamActive(cam, true)
        RenderScriptCams(true, true, 500, true, true)
        SetCamCoord(cam, coords.x, coords.y, coords.z + 0.2)
        SetCamRot(cam, 5.0, 0.0, coords.w) -- Change here
        SetCamNearClip(cam, 0.1)                                  -- Adjust the near clip distance
        SetCamFarClip(cam, 1000.0)                                -- Adjust the far clip distance
        SetCamFov(cam, 68.0)                                      -- Adjust the field of view
        SetCamDofFnumberOfLens(camera, 24.0)                      -- Number of lens in the camera's focus
        SetCamDofFocalLengthMultiplier(camera, 50.0)              -- Focal length of the camera's lens
    end
    headingToCam = GetEntityHeading(PlayerPedId()) + 90
    camOffset = 2.0
end)

CreateLocalVehicle = function(plate)
    for k,v in pairs(curVehicles) do
        if v.plate == plate then
            if Config.Framework == "new-qb" or Config.Framework == "old-qb" then
                Framework.Functions.SpawnVehicle(v.hash, function(veh)
                    Framework.Functions.SetVehicleProperties(veh, v.allmods)
                    SetEntityHeading(veh, Config.Garages[CurrentGarage].spawn.w)
                    --SetVehicleFuelLevelS(veh, v.allmods.fuelLevel)
                    createdlocalveh = veh
                end, Config.Garages[CurrentGarage].spawn, false)
            else
                Framework.Game.SpawnVehicle(v.hash, vector3(Config.Garages[CurrentGarage].spawn.x, Config.Garages[CurrentGarage].spawn.y, Config.Garages[CurrentGarage].spawn.z), Config.Garages[CurrentGarage].spawn.w, function(vehiclet)
                    SetEntityHeading(vehiclet, Config.Garages[CurrentGarage].spawn.w)
                    SetVehicleProperties(vehiclet, v.allmods)
                    createdlocalveh = veh
                end)
            end
            break
        end
    end
end

CheckVehicles = function(plate)
    local returndata = nil
    if Config.Framework == "new-qb" or Config.Framework == "old-qb" then
        Framework.Functions.TriggerCallback("cylex_garage:CheckVehicles", function(result)
            returndata = result
        end, plate, createdlocalveh)


        while not returndata do
            print("waiting")
            Citizen.Wait(10)
        end

        return returndata
    else
        Framework.TriggerServerCallback("cylex_garage:CheckVehicles", function(result)
            returndata = result
        end, plate, createdlocalveh)
        while not returndata do
            print("waiting")
            Citizen.Wait(10)
        end

        return returndata
    end

end

SpawnCar = function(vehicle)
    if Config.Framework == "new-qb" or Config.Framework == "old-qb" then
        Framework.Functions.SpawnVehicle(vehicle.hash, function(veh)
            Framework.Functions.SetVehicleProperties(veh, vehicle.allmods)
            SetEntityHeading(veh, Config.Garages[CurrentGarage].spawn.w)
            OnVehicleSpawn(veh, vehicle)
        end, Config.Garages[CurrentGarage].spawn, true)
        TriggerServerEvent("cylex_garage:UpdateOutsideVehicle", vehicle.plate)
    else
        Framework.Game.SpawnVehicle(vehicle.hash, vector3(Config.Garages[CurrentGarage].spawn.x, Config.Garages[CurrentGarage].spawn.y, Config.Garages[CurrentGarage].spawn.z), Config.Garages[CurrentGarage].spawn.w, function(vehiclet)
            SetEntityHeading(vehiclet, Config.Garages[CurrentGarage].spawn.w)
            OnVehicleSpawn(vehiclet, vehicle)
            SetVehicleProperties(vehiclet, vehicle.allmods)
        end)
        TriggerServerEvent("cylex_garage:UpdateOutsideVehicle", vehicle.plate)
    end
end

RegisterNetEvent("cylex_garage:SetParkVehicle", function(props)
    local veh = GetVehiclePedIsIn(PlayerPedId(), false)
    DeleteVehicle(veh)
    if Config.Framework == "new-qb" or Config.Framework == "old-qb" then
        Framework.Functions.Notify(Config.Translate["vehicleparked"], 'primary', 4500)
        TriggerServerEvent('qb-vehicletuning:server:SaveVehicleProps', props)
    else
        Framework.ShowNotification(Config.Translate["vehicleparked"], 'success', 3000)
    end
end)

StoreVehicle = function()
    local veh = GetVehiclePedIsIn(PlayerPedId(), false)
    local bodyDamage = math.ceil(GetVehicleBodyHealth(veh))
    local engineDamage = math.ceil(GetVehicleEngineHealth(veh))
    
    if Config.Framework == "new-qb" or Config.Framework == "old-qb" then
        TriggerServerEvent("cylex_garages:SetParkVehicle", Framework.Functions.GetVehicleProperties(veh))
    else
        TriggerServerEvent("cylex_garages:SetParkVehicle", GetVehicleProperties(veh))
    end
end

GetVehicles = function()
	local vehicles = {}
    local veh = GetGamePool('CVehicle')
	for k,v in pairs(veh) do
		table.insert(vehicles, v)
	end

	return vehicles
end


IsSpawnPointClear = function(coords, radius)
	local vehicles = GetVehiclesInArea(coords, radius)

	return #vehicles == 0
end

GetVehiclesInArea = function(coords, area)
	local vehicles       = GetVehicles()
	local vehiclesInArea = {}

	for i=1, #vehicles, 1 do
		local vehicleCoords = GetEntityCoords(vehicles[i])
		local distance      = GetDistanceBetweenCoords(vehicleCoords, coords.x, coords.y, coords.z, true)

		if distance <= area then
			table.insert(vehiclesInArea, vehicles[i])
		end
	end

	return vehiclesInArea
end


function SetVehicleProperties(vehicle, props)
    if DoesEntityExist(vehicle) then
        if props.extras then
            for id, enabled in pairs(props.extras) do
                if enabled then
                    SetVehicleExtra(vehicle, tonumber(id), 0)
                else
                    SetVehicleExtra(vehicle, tonumber(id), 1)
                end
            end
        end

        local colorPrimary, colorSecondary = GetVehicleColours(vehicle)
        local pearlescentColor, wheelColor = GetVehicleExtraColours(vehicle)
        SetVehicleModKit(vehicle, 0)
        if props.plate then
            SetVehicleNumberPlateText(vehicle, props.plate)
        end
        if props.plateIndex then
            SetVehicleNumberPlateTextIndex(vehicle, props.plateIndex)
        end
        if props.bodyHealth then
            SetVehicleBodyHealth(vehicle, props.bodyHealth + 0.0)
        end
        if props.engineHealth then
            SetVehicleEngineHealth(vehicle, props.engineHealth + 0.0)
        end
        if props.tankHealth then
            SetVehiclePetrolTankHealth(vehicle, props.tankHealth)
        end
        if props.fuelLevel then
            SetVehicleFuelLevel(vehicle, props.fuelLevel + 0.0)
        end
        if props.dirtLevel then
            SetVehicleDirtLevel(vehicle, props.dirtLevel + 0.0)
        end
        if props.oilLevel then
            SetVehicleOilLevel(vehicle, props.oilLevel)
        end
        if props.color1 then
            if type(props.color1) == "number" then
                ClearVehicleCustomPrimaryColour(vehicle)
                SetVehicleColours(vehicle, props.color1, colorSecondary)
            else
                SetVehicleCustomPrimaryColour(vehicle, props.color1[1], props.color1[2], props.color1[3])
            end
        end
        if props.color2 then
            if type(props.color2) == "number" then
                ClearVehicleCustomSecondaryColour(vehicle)
                SetVehicleColours(vehicle, props.color1 or colorPrimary, props.color2)
            else
                SetVehicleCustomSecondaryColour(vehicle, props.color2[1], props.color2[2], props.color2[3])
            end
        end
        if props.pearlescentColor then
            SetVehicleExtraColours(vehicle, props.pearlescentColor, wheelColor)
        end
        if props.interiorColor then
            SetVehicleInteriorColor(vehicle, props.interiorColor)
        end
        if props.dashboardColor then
            SetVehicleDashboardColour(vehicle, props.dashboardColor)
        end
        if props.wheelColor then
            SetVehicleExtraColours(vehicle, props.pearlescentColor or pearlescentColor, props.wheelColor)
        end
        if props.wheels then
            SetVehicleWheelType(vehicle, props.wheels)
        end
        if props.tireHealth then
            for wheelIndex, health in pairs(props.tireHealth) do
                SetVehicleWheelHealth(vehicle, wheelIndex, health)
            end
        end
        if props.tireBurstState then
            for wheelIndex, burstState in pairs(props.tireBurstState) do
                if burstState then
                    SetVehicleTyreBurst(vehicle, tonumber(wheelIndex), false, 1000.0)
                end
            end
        end
        if props.tireBurstCompletely then
            for wheelIndex, burstState in pairs(props.tireBurstCompletely) do
                if burstState then
                    SetVehicleTyreBurst(vehicle, tonumber(wheelIndex), true, 1000.0)
                end
            end
        end
        if props.windowTint then
            SetVehicleWindowTint(vehicle, props.windowTint)
        end
        if props.windowStatus then
            for windowIndex, smashWindow in pairs(props.windowStatus) do
                if not smashWindow then SmashVehicleWindow(vehicle, windowIndex) end
            end
        end
        if props.doorStatus then
            for doorIndex, breakDoor in pairs(props.doorStatus) do
                if breakDoor then
                    SetVehicleDoorBroken(vehicle, tonumber(doorIndex), true)
                end
            end
        end
        if props.neonEnabled then
            SetVehicleNeonLightEnabled(vehicle, 0, props.neonEnabled[1])
            SetVehicleNeonLightEnabled(vehicle, 1, props.neonEnabled[2])
            SetVehicleNeonLightEnabled(vehicle, 2, props.neonEnabled[3])
            SetVehicleNeonLightEnabled(vehicle, 3, props.neonEnabled[4])
        end
        if props.neonColor then
            SetVehicleNeonLightsColour(vehicle, props.neonColor[1], props.neonColor[2], props.neonColor[3])
        end
        if props.headlightColor then
            SetVehicleHeadlightsColour(vehicle, props.headlightColor)
        end
        if props.interiorColor then
            SetVehicleInteriorColour(vehicle, props.interiorColor)
        end
        if props.wheelSize then
            SetVehicleWheelSize(vehicle, props.wheelSize)
        end
        if props.wheelWidth then
            SetVehicleWheelWidth(vehicle, props.wheelWidth)
        end
        if props.tyreSmokeColor then
            SetVehicleTyreSmokeColor(vehicle, props.tyreSmokeColor[1], props.tyreSmokeColor[2], props.tyreSmokeColor[3])
        end
        if props.modSpoilers then
            SetVehicleMod(vehicle, 0, props.modSpoilers, false)
        end
        if props.modFrontBumper then
            SetVehicleMod(vehicle, 1, props.modFrontBumper, false)
        end
        if props.modRearBumper then
            SetVehicleMod(vehicle, 2, props.modRearBumper, false)
        end
        if props.modSideSkirt then
            SetVehicleMod(vehicle, 3, props.modSideSkirt, false)
        end
        if props.modExhaust then
            SetVehicleMod(vehicle, 4, props.modExhaust, false)
        end
        if props.modFrame then
            SetVehicleMod(vehicle, 5, props.modFrame, false)
        end
        if props.modGrille then
            SetVehicleMod(vehicle, 6, props.modGrille, false)
        end
        if props.modHood then
            SetVehicleMod(vehicle, 7, props.modHood, false)
        end
        if props.modFender then
            SetVehicleMod(vehicle, 8, props.modFender, false)
        end
        if props.modRightFender then
            SetVehicleMod(vehicle, 9, props.modRightFender, false)
        end
        if props.modRoof then
            SetVehicleMod(vehicle, 10, props.modRoof, false)
        end
        if props.modEngine then
            SetVehicleMod(vehicle, 11, props.modEngine, false)
        end
        if props.modBrakes then
            SetVehicleMod(vehicle, 12, props.modBrakes, false)
        end
        if props.modTransmission then
            SetVehicleMod(vehicle, 13, props.modTransmission, false)
        end
        if props.modHorns then
            SetVehicleMod(vehicle, 14, props.modHorns, false)
        end
        if props.modSuspension then
            SetVehicleMod(vehicle, 15, props.modSuspension, false)
        end
        if props.modArmor then
            SetVehicleMod(vehicle, 16, props.modArmor, false)
        end
        if props.modKit17 then
            SetVehicleMod(vehicle, 17, props.modKit17, false)
        end
        if props.modTurbo then
            ToggleVehicleMod(vehicle, 18, props.modTurbo)
        end
        if props.modKit19 then
            SetVehicleMod(vehicle, 19, props.modKit19, false)
        end
        if props.modSmokeEnabled then
            ToggleVehicleMod(vehicle, 20, props.modSmokeEnabled)
        end
        if props.modKit21 then
            SetVehicleMod(vehicle, 21, props.modKit21, false)
        end
        if props.modXenon then
            ToggleVehicleMod(vehicle, 22, props.modXenon)
        end
        if props.xenonColor then
            SetVehicleXenonLightsColor(vehicle, props.xenonColor)
        end
        if props.modFrontWheels then
            SetVehicleMod(vehicle, 23, props.modFrontWheels, false)
        end
        if props.modBackWheels then
            SetVehicleMod(vehicle, 24, props.modBackWheels, false)
        end
        if props.modCustomTiresF then
            SetVehicleMod(vehicle, 23, props.modFrontWheels, props.modCustomTiresF)
        end
        if props.modCustomTiresR then
            SetVehicleMod(vehicle, 24, props.modBackWheels, props.modCustomTiresR)
        end
        if props.modPlateHolder then
            SetVehicleMod(vehicle, 25, props.modPlateHolder, false)
        end
        if props.modVanityPlate then
            SetVehicleMod(vehicle, 26, props.modVanityPlate, false)
        end
        if props.modTrimA then
            SetVehicleMod(vehicle, 27, props.modTrimA, false)
        end
        if props.modOrnaments then
            SetVehicleMod(vehicle, 28, props.modOrnaments, false)
        end
        if props.modDashboard then
            SetVehicleMod(vehicle, 29, props.modDashboard, false)
        end
        if props.modDial then
            SetVehicleMod(vehicle, 30, props.modDial, false)
        end
        if props.modDoorSpeaker then
            SetVehicleMod(vehicle, 31, props.modDoorSpeaker, false)
        end
        if props.modSeats then
            SetVehicleMod(vehicle, 32, props.modSeats, false)
        end
        if props.modSteeringWheel then
            SetVehicleMod(vehicle, 33, props.modSteeringWheel, false)
        end
        if props.modShifterLeavers then
            SetVehicleMod(vehicle, 34, props.modShifterLeavers, false)
        end
        if props.modAPlate then
            SetVehicleMod(vehicle, 35, props.modAPlate, false)
        end
        if props.modSpeakers then
            SetVehicleMod(vehicle, 36, props.modSpeakers, false)
        end
        if props.modTrunk then
            SetVehicleMod(vehicle, 37, props.modTrunk, false)
        end
        if props.modHydrolic then
            SetVehicleMod(vehicle, 38, props.modHydrolic, false)
        end
        if props.modEngineBlock then
            SetVehicleMod(vehicle, 39, props.modEngineBlock, false)
        end
        if props.modAirFilter then
            SetVehicleMod(vehicle, 40, props.modAirFilter, false)
        end
        if props.modStruts then
            SetVehicleMod(vehicle, 41, props.modStruts, false)
        end
        if props.modArchCover then
            SetVehicleMod(vehicle, 42, props.modArchCover, false)
        end
        if props.modAerials then
            SetVehicleMod(vehicle, 43, props.modAerials, false)
        end
        if props.modTrimB then
            SetVehicleMod(vehicle, 44, props.modTrimB, false)
        end
        if props.modTank then
            SetVehicleMod(vehicle, 45, props.modTank, false)
        end
        if props.modWindows then
            SetVehicleMod(vehicle, 46, props.modWindows, false)
        end
        if props.modKit47 then
            SetVehicleMod(vehicle, 47, props.modKit47, false)
        end
        if props.modLivery then
            SetVehicleMod(vehicle, 48, props.modLivery, false)
            SetVehicleLivery(vehicle, props.modLivery)
        end
        if props.modKit49 then
            SetVehicleMod(vehicle, 49, props.modKit49, false)
        end
        if props.liveryRoof then
            SetVehicleRoofLivery(vehicle, props.liveryRoof)
        end
    end
end


function GetVehicleProperties(vehicle)
    if DoesEntityExist(vehicle) then
        local pearlescentColor, wheelColor = GetVehicleExtraColours(vehicle)

        local colorPrimary, colorSecondary = GetVehicleColours(vehicle)
        if GetIsVehiclePrimaryColourCustom(vehicle) then
            local r, g, b = GetVehicleCustomPrimaryColour(vehicle)
            colorPrimary = {r, g, b}
        end

        if GetIsVehicleSecondaryColourCustom(vehicle) then
            local r, g, b = GetVehicleCustomSecondaryColour(vehicle)
            colorSecondary = {r, g, b}
        end

        local extras = {}
        for extraId = 0, 12 do
            if DoesExtraExist(vehicle, extraId) then
                local state = IsVehicleExtraTurnedOn(vehicle, extraId) == 1
                extras[tostring(extraId)] = state
            end
        end

        local modLivery = GetVehicleMod(vehicle, 48)
        if GetVehicleMod(vehicle, 48) == -1 and GetVehicleLivery(vehicle) ~= 0 then
            modLivery = GetVehicleLivery(vehicle)
        end

        local tireHealth = {}
        for i = 0, 3 do
            tireHealth[i] = GetVehicleWheelHealth(vehicle, i)
        end

        local tireBurstState = {}
        for i = 0, 5 do
           tireBurstState[i] = IsVehicleTyreBurst(vehicle, i, false)
        end

        local tireBurstCompletely = {}
        for i = 0, 5 do
            tireBurstCompletely[i] = IsVehicleTyreBurst(vehicle, i, true)
        end

        local windowStatus = {}
        for i = 0, 7 do
            windowStatus[i] = IsVehicleWindowIntact(vehicle, i) == 1
        end

        local doorStatus = {}
        for i = 0, 5 do
            doorStatus[i] = IsVehicleDoorDamaged(vehicle, i) == 1
        end

        return {
            model = GetEntityModel(vehicle),
            plate = Framework.Math.Trim(GetVehicleNumberPlateText(vehicle)),
            plateIndex = GetVehicleNumberPlateTextIndex(vehicle),
            bodyHealth = Framework.Math.Round(GetVehicleBodyHealth(vehicle), 0.1),
            engineHealth = Framework.Math.Round(GetVehicleEngineHealth(vehicle), 0.1),
            tankHealth = Framework.Math.Round(GetVehiclePetrolTankHealth(vehicle), 0.1),
            fuelLevel = Framework.Math.Round(GetVehicleFuelLevel(vehicle), 0.1),
            dirtLevel = Framework.Math.Round(GetVehicleDirtLevel(vehicle), 0.1),
            oilLevel = Framework.Math.Round(GetVehicleOilLevel(vehicle), 0.1),
            color1 = colorPrimary,
            color2 = colorSecondary,
            pearlescentColor = pearlescentColor,
            dashboardColor = GetVehicleDashboardColour(vehicle),
            wheelColor = wheelColor,
            wheels = GetVehicleWheelType(vehicle),
            wheelSize = GetVehicleWheelSize(vehicle),
            wheelWidth = GetVehicleWheelWidth(vehicle),
            tireHealth = tireHealth,
            tireBurstState = tireBurstState,
            tireBurstCompletely = tireBurstCompletely,
            windowTint = GetVehicleWindowTint(vehicle),
            windowStatus = windowStatus,
            doorStatus = doorStatus,
            xenonColor = GetVehicleXenonLightsColour(vehicle),
            neonEnabled = {
                IsVehicleNeonLightEnabled(vehicle, 0),
                IsVehicleNeonLightEnabled(vehicle, 1),
                IsVehicleNeonLightEnabled(vehicle, 2),
                IsVehicleNeonLightEnabled(vehicle, 3)
            },
            neonColor = table.pack(GetVehicleNeonLightsColour(vehicle)),
            headlightColor = GetVehicleHeadlightsColour(vehicle),
            interiorColor = GetVehicleInteriorColour(vehicle),
            extras = extras,
            tyreSmokeColor = table.pack(GetVehicleTyreSmokeColor(vehicle)),
            modSpoilers = GetVehicleMod(vehicle, 0),
            modFrontBumper = GetVehicleMod(vehicle, 1),
            modRearBumper = GetVehicleMod(vehicle, 2),
            modSideSkirt = GetVehicleMod(vehicle, 3),
            modExhaust = GetVehicleMod(vehicle, 4),
            modFrame = GetVehicleMod(vehicle, 5),
            modGrille = GetVehicleMod(vehicle, 6),
            modHood = GetVehicleMod(vehicle, 7),
            modFender = GetVehicleMod(vehicle, 8),
            modRightFender = GetVehicleMod(vehicle, 9),
            modRoof = GetVehicleMod(vehicle, 10),
            modEngine = GetVehicleMod(vehicle, 11),
            modBrakes = GetVehicleMod(vehicle, 12),
            modTransmission = GetVehicleMod(vehicle, 13),
            modHorns = GetVehicleMod(vehicle, 14),
            modSuspension = GetVehicleMod(vehicle, 15),
            modArmor = GetVehicleMod(vehicle, 16),
            modKit17 = GetVehicleMod(vehicle, 17),
            modTurbo = IsToggleModOn(vehicle, 18),
            modKit19 = GetVehicleMod(vehicle, 19),
            modSmokeEnabled = IsToggleModOn(vehicle, 20),
            modKit21 = GetVehicleMod(vehicle, 21),
            modXenon = IsToggleModOn(vehicle, 22),
            modFrontWheels = GetVehicleMod(vehicle, 23),
            modBackWheels = GetVehicleMod(vehicle, 24),
            modCustomTiresF = GetVehicleModVariation(vehicle, 23),
            modCustomTiresR = GetVehicleModVariation(vehicle, 24),
            modPlateHolder = GetVehicleMod(vehicle, 25),
            modVanityPlate = GetVehicleMod(vehicle, 26),
            modTrimA = GetVehicleMod(vehicle, 27),
            modOrnaments = GetVehicleMod(vehicle, 28),
            modDashboard = GetVehicleMod(vehicle, 29),
            modDial = GetVehicleMod(vehicle, 30),
            modDoorSpeaker = GetVehicleMod(vehicle, 31),
            modSeats = GetVehicleMod(vehicle, 32),
            modSteeringWheel = GetVehicleMod(vehicle, 33),
            modShifterLeavers = GetVehicleMod(vehicle, 34),
            modAPlate = GetVehicleMod(vehicle, 35),
            modSpeakers = GetVehicleMod(vehicle, 36),
            modTrunk = GetVehicleMod(vehicle, 37),
            modHydrolic = GetVehicleMod(vehicle, 38),
            modEngineBlock = GetVehicleMod(vehicle, 39),
            modAirFilter = GetVehicleMod(vehicle, 40),
            modStruts = GetVehicleMod(vehicle, 41),
            modArchCover = GetVehicleMod(vehicle, 42),
            modAerials = GetVehicleMod(vehicle, 43),
            modTrimB = GetVehicleMod(vehicle, 44),
            modTank = GetVehicleMod(vehicle, 45),
            modWindows = GetVehicleMod(vehicle, 46),
            modKit47 = GetVehicleMod(vehicle, 47),
            modLivery = modLivery,
            modKit49 = GetVehicleMod(vehicle, 49),
            liveryRoof = GetVehicleRoofLivery(vehicle),
        }
    else
        return
    end
end