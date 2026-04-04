if AK4Y.Framework == "qb" then
    QBCore = exports['qb-core']:GetCoreObject()
elseif AK4Y.Framework == "oldqb" then 
    QBCore = nil
end

Citizen.CreateThread(function()
    if AK4Y.Framework == "oldqb" then 
        while QBCore == nil do
            TriggerEvent('QBCore:GetObject', function(obj) QBCore = obj end)
            Citizen.Wait(200)
        end
	elseif AK4Y.Framework == "qb" then
		while QBCore == nil do
            Citizen.Wait(200)
        end
    end	
end)

local spawnInfos = {}
RegisterNetEvent("ak4y-spawnselector:playerLoad")
AddEventHandler("ak4y-spawnselector:playerLoad", function(location)
    delCam()
    doCamera(location.x, location.y, location.z)
    DoScreenFadeOut(2)
	delCam()
    SetEntityCoords(PlayerPedId(), location.x, location.y, location.z)
    SetEntityHeading(PlayerPedId(),location.w)
    SetEntityVisible(PlayerPedId(), true)
    Wait(200)
    DoScreenFadeIn(2500)
    playerLoaded()
end)

function delCam()
    ClearFocus()
	DestroyAllCams(true)
	RenderScriptCams(false, true, 1, true, true)
end

local cam = 0
function doCamera(x,y,z)
	DoScreenFadeOut(1)
	if(not DoesCamExist(cam)) then
		cam = CreateCam('DEFAULT_SCRIPTED_CAMERA', true)
	end
	i = 3200
	SetFocusArea(x, y, z, 0.0, 0.0, 0.0)
	SetCamActive(cam,  true)
	RenderScriptCams(true,  false,  0,  true,  true)
	DoScreenFadeIn(1500)
	local camAngle = -90.0
	while i > 1 do
		local factor = i / 50
		if i < 1 then i = 1 end
		i = i - factor
		SetCamCoord(cam, x,y,z+i)
		if i < 1200 then
			DoScreenFadeIn(600)
		end
		if i < 90.0 then
			camAngle = i - i - i
		end
		SetCamRot(cam, camAngle, 0.0, 0.0)
		Citizen.Wait(2/i)
	end
end

RegisterNetEvent('ak4y-spawnselector:openUI', function(value)
    SetEntityVisible(PlayerPedId(), false)
    openMenu()
end)

openMenu = function()
    SetNuiFocus(true,true)
    SendNUIMessage({
        action = 'show', 
        motelLoc = AK4Y.Spawns["motel"],
        hospitalLoc = AK4Y.Spawns["hospital"],
        carShopLoc = AK4Y.Spawns["carShop"],
        pdDepartmentLoc = AK4Y.Spawns["pdDepartment"],
        sdDepartmentLoc = AK4Y.Spawns["sdDepartment"],
        translate = AK4Y.Language,
    })  
end

local selectSpawnSpam = 0
RegisterNUICallback('selectSpawn', function(data, cb)
    if GetGameTimer() > selectSpawnSpam then 
        selectSpawnSpam = GetGameTimer() + 1000
        local spawnId = data.buttonId
        QBCore.Functions.GetPlayerData(function(PlayerData)
            if spawnId == "last" then 
                AK4Y.Spawns["last"] = {}
                AK4Y.Spawns["last"].coords = vector4(PlayerData.position.x, PlayerData.position.y,PlayerData.position.z, 0.0) 
            end
            spawnInfos = AK4Y.Spawns[spawnId]
            SendNUIMessage({action = 'hide'})  
            TriggerEvent("ak4y-spawnselector:playerLoad", spawnInfos.coords)
        end)
        SetNuiFocus(false, false)
    end
end)