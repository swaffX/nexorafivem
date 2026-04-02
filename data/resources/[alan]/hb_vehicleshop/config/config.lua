Config = {}

-- Client Trigger to open is TriggerEvent("vms_vehicleshop:open", ID_OF_VEHICLESHOP)

Config.DistanceViewMarker = 20.0
Config.DistanceView3DText = 5.0
Config.DistanceAccess = 2.0 -- The distance in which it will be possible to take a seat by pressing the E key
Config.KeyOpen = 38 -- 38 = E

-- █▀ █▀▄ ▄▀▄ █▄ ▄█ ██▀ █   █ ▄▀▄ █▀▄ █▄▀
-- █▀ █▀▄ █▀█ █ ▀ █ █▄▄ ▀▄▀▄▀ ▀▄▀ █▀▄ █ █

Config.Core = "QB-Core" -- "ESX" or "QB-Core"
Config.CoreDefine = nil
	-- ESX: "esx:getSharedObject" 
	-- QBCore: ""
	-- Or your custom trigger event also you can set nil to core define by exports["es_extended"]:getSharedObject

Config.CoreExport = function()
	return exports['qb-core']:GetCoreObject()
	-- return exports['qb-core']:GetCoreObject()
end

-- @PlayerLoaded for ESX: "esx:playerLoaded"
-- @PlayerLoaded for QB-Core: "QBCore:Client:OnPlayerLoaded"
Config.PlayerLoaded = 'QBCore:Client:OnPlayerLoaded' -- its a trigger to load players tattoos

-- @JobUpdated for ESX: "esx:setJob"
-- @JobUpdated for QB-Core: "QBCore:Client:OnJobUpdate"
Config.JobUpdated = 'QBCore:Client:OnJobUpdate' -- its a trigger to check players job

Config.UseVehicleColorsRGB = true

Config.UseFadeWithSpawn = true
Config.SoundsEffects = true -- if you want to sound effects by clicks set true

Config.Hud = {
	Enable = function()
		DisplayRadar(true)
		-- exports['vms_hud']:Display(true) -- here insert your export / trigger to enable hud after exit from showroom
	end,
	Disable = function()
		DisplayRadar(false)
		-- exports['vms_hud']:Display(false) -- here insert your export / trigger to disable hud after enter to showroom
	end
}

Config.Notification = function(message, time, type)
    if type == "success" then
        --exports["vms_notify"]:Notification("VEHICLE SHOP", message, time, "#27FF09", "fa-solid fa-car")
		--TriggerEvent('esx:showNotification', message)
         TriggerEvent('QBCore:Notify', message, 'success', time)
    elseif type == "error" then
        --exports["vms_notify"]:Notification("VEHICLE SHOP", message, time, "#FF0909", "fa-solid fa-car")
	--TriggerEvent('esx:showNotification', message)
         TriggerEvent('QBCore:Notify', message, 'error', time)
    end
end


Config.AccessOnMarker = false -- if you want to use this with marker acces, set true, if you want to use this script with for e.g vms_npctalk set false.

Config.UseTarget = true
Config.TargetResource = 'qb-target'
Config.Target = function(id, data)
	if Config.TargetResource == 'ox_target' then
		exports[Config.TargetResource]:addBoxZone({
			coords = data.coords,
			size = vec(2.0, 2.0, 4.3),
			debug = false,
			useZ = true,
			rotation = data.targetSystemRotation,
			distance = 1.0,
			options = {
				{
					name = 'vehicleshop-'..id,
					icon = data.icon,
					label = data.name,
					onSelect = function()
						TriggerEvent("vms_vehicleshop:open", id)
					end
				}
			}
		})
	
	elseif Config.TargetResource == 'qb-target' then
		-- local pedModel = `a_m_m_business_01` -- Dilediğin ped modelini kullanabilirsin
		-- RequestModel(pedModel)
		-- while not HasModelLoaded(pedModel) do Wait(10) end
	
		-- local ped = CreatePed(4, pedModel, data.coords.x, data.coords.y, data.coords.z - 1.0, 32.75 or 0.0, false, true)
		-- FreezeEntityPosition(ped, true)
		-- SetEntityInvincible(ped, true)
		-- SetBlockingOfNonTemporaryEvents(ped, true)
	
		exports['qb-target']:AddBoxZone("vehicleshop_target_"..id, vector3(data.coords.x, data.coords.y, data.coords.z), 1.5, 1.5, {
    name = "vehicleshop_target_"..id,
    heading = data.coords.w or 0,
    debugPoly = false,
    minZ = data.coords.z - 1.0,
    maxZ = data.coords.z + 1.0
}, {
    options = {
        {
            type = "client",
            icon = data.icon or "fas fa-car",
            label = "Araç listesini görüntüle",
            action = function()
                TriggerEvent("vms_vehicleshop:open", id)
            end
        }
    },
    distance = 2.0
})
	else
		-- Diğer target sistemleri için gerekli kodu buraya ekleyin
	end
end

Config.UseRoutingBucketsInShowRoom = true
Config.UseRoutingBucketsOnTestDrive = true

Config.PlateCustomPrefix = nil -- "PREFIX" or nil
Config.PlateLetters = 3
Config.PlateNumbers = 4

Config.GiveKeysBuy = function(veh, plate, model)
	 TriggerEvent('vehiclekeys:client:SetOwner', plate)
	-- exports['LegacyFuel']:SetFuel(veh, 100)
	-- Here insert your export / trigger to give keys to player and set fuel
end

Config.GiveKeysTestDrive = function(veh, plate, model)
	 TriggerEvent('vehiclekeys:client:SetOwner', plate)
	-- exports['LegacyFuel']:SetFuel(veh, 100)
	-- Here insert your export / trigger to give keys to player and set fuel
end

Config.TestDrive = {
	displayTimer = true, -- this option runs DrawText3D over the vehicle with a countdown timer to the end of the test drive.
	time = 35, -- in seconds
	coords = vector4(-1267.47, -3374.01, 13.94, 327.4), -- coords of spawn the vehicle
	maxDistance = 500, -- maximum distance from coords
}

Config.VehicleShops = {
    [1] = {
		blip = {sprite = 595, scale = 0.95, color = 0, display = 4},
		categories = {'sedan', 'suv', 'compact', 'van', 'offroad', 'motorcycle'}, -- if you adding new categories, you need add also .svg file at the same name for @vms_vehicleshop/html/icons/
		testDrive = true,
		testDrivePrice = 50,
		type = 'car',
		icon = 'fa-solid fa-car',
		name = "Galeri",
		-- requiredJob = 'police',
		-- requiredJobGrade = {'boss'}, -- string: 'boss' or table: {'boss', 'manager'}
		targetSystemRotation = -20.0,
        coords = vector3(-43.39, -1105.36, 26.39),
		carCoords = vector4(-69.79, -824.51, 221.0, 61.72),
		camCoord = vector3(-74.72, -824.49, 223.15),
		buyCoords = vector4(-31.04, -1090.45, 25.42, 334.67),
		drawable = {
			['marker'] = true,
			['3dtext'] = true
		},
		vehicles = Vehicles[1] -- Vehicles in the config.vehicles.lua
	},
--	[2] = {
--		blip = {sprite = 90, scale = 0.65, color = 30, display = 4},
--		categories = {'helicopter', 'airplane'}, -- if you adding new categories, you need add also .svg file at the same name for @vms_vehicleshop/html/icons/
--		testDrive = false,
--		testDrivePrice = 0,
--		type = 'fly',
--		icon = 'fa-solid fa-plane',
--		name = "PLANE DEALER",
--		-- requiredJob = 'police',
--		-- requiredJobGrade = {'boss'}, -- string: 'boss' or table: {'boss', 'manager'}
--		targetSystemRotation = 60.0,
--		coords = vector3(-941.26, -2954.54, 12.8),
--		carCoords = vector4(-974.58, -3000.76, 12.95, 58.63),
--		camCoord = vector3(-988.33, -3001.73, 14.95),
--		buyCoords = vector4(-974.89, -3082.39, 12.94, 58.0),
--		drawable = {
--			['marker'] = true,
--			['3dtext'] = true
--		},
--		vehicles = Vehicles[2]
--	},
--	[3] = {
--		blip = {sprite = 427, scale = 0.65, color = 30, display = 4},
--		categories = {}, -- if you adding new categories, you need add also .svg file at the same name for @vms_vehicleshop/html/icons/
--		testDrive = false,
--		testDrivePrice = 0,
--		type = 'boat',
--		icon = 'fa-solid fa-ship',
--		name = "BOATS DEALER",
--		-- requiredJob = 'police',
--		-- requiredJobGrade = {'boss'}, -- string: 'boss' or table: {'boss', 'manager'}
--		targetSystemRotation = 50.0,
--		coords = vector3(-704.18, -1398.44, 4.4),
--		carCoords = vector4(-797.95, -1502.53, -0.45, 112.22),
--		camCoord = vector3(-802.24, -1512.52, 2.69),
--		buyCoords = vector4(-783.76, -1436.2, -0.06, 136.22),
--		drawable = {
--			['marker'] = true,
--			['3dtext'] = true
--		},
--		vehicles = Vehicles[3]
--	},
}

Config.Translate = {
	['notify.you_bought'] = "%s %s satın aldınız. Fiyatı: %s$.",
	['notify.enought_money'] = "%s %s için bankanızda yeterli paranız yok.",
	['notify.you_bought_test'] = "Test sürüşü satın aldınız. Fiyatı: %s$.",
	['notify.enought_money_for_test'] = "Test sürüşü için yeterli paranız yok.",
	['3dtext.time_remaining'] = "%s saniye kaldı",
	['3dtext.open'] = "Açmak için [E] tuşuna basın",
}
