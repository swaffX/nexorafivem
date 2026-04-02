QBCore = nil
Citizen.CreateThread(function()
    while QBCore == nil do
        TriggerEvent('QBCore:GetObject', function(obj) QBCore = obj end)
        Citizen.Wait(200)
    end
end)

local carryingBackInProgress = false

Citizen.CreateThread(function()
	while true do
		Citizen.Wait(3)
		if IsControlJustPressed(0, 57) then
			Citizen.Wait(1000)
			local closestPlayer, distance = QBCore.Functions.GetClosestPlayer()
			if not carryingBackInProgress and not IsPedInAnyVehicle(PlayerPedId(), false) then
				if closestPlayer ~= -1 and distance < 1.5 and not IsPedInAnyVehicle(GetPlayerPed(closestPlayer), false) then
					QBCore.Functions.Notify("Kucaklıyorsun!")
					Citizen.Wait(1000)
					target = GetPlayerServerId(closestPlayer)
					carryingBackInProgress = true
					local player = PlayerPedId()	
					lib = 'missfinale_c2mcs_1'
					anim1 = 'fin_c2_mcs_1_camman'
					lib2 = 'nm'
					anim2 = 'firemans_carry'
					distans = 0.15
					distans2 = 0.27
					height = 0.63
					spin = 0.0		
					length = 100000
					controlFlagMe = 49
					controlFlagTarget = 33
					animFlagTarget = 1
					TriggerServerEvent('cmg2_animationsCarry:sync', closestPlayer, lib,lib2, anim1, anim2, distans, distans2, height, target, length, spin, controlFlagMe, controlFlagTarget, animFlagTarget)
				else
					QBCore.Functions.Notify("Çevrende kucağına alabileceğin kimse yok!")
				end
			else
				local closestPlayer, distance = QBCore.Functions.GetClosestPlayer()
				if closestPlayer ~= -1 and distance < 1.5 then
					QBCore.Functions.Notify("Kucağından indiriyorsun!")
					Citizen.Wait(1000)
					carryingBackInProgress = false
					ClearPedSecondaryTask(PlayerPedId())
					DetachEntity(PlayerPedId(), true, false)
					target = GetPlayerServerId(closestPlayer)
					TriggerServerEvent("cmg2_animationsCarry:stop", target)
				else
					QBCore.Functions.Notify("Çevrende kucağına alabileceğin kimse yok!")
				end
			end
		end
	end
end)

RegisterCommand("kucakla", function()
	Citizen.Wait(1000)
	local closestPlayer, distance = QBCore.Functions.GetClosestPlayer()
	if not carryingBackInProgress and not IsPedInAnyVehicle(PlayerPedId(), false) then
		if closestPlayer ~= -1 and distance < 1.5 and not IsPedInAnyVehicle(GetPlayerPed(closestPlayer), false) then
			QBCore.Functions.Notify("Kucaklıyorsun!")
			Citizen.Wait(1000)
			target = GetPlayerServerId(closestPlayer)
			carryingBackInProgress = true
			local player = PlayerPedId()	
			lib = 'missfinale_c2mcs_1'
			anim1 = 'fin_c2_mcs_1_camman'
			lib2 = 'nm'
			anim2 = 'firemans_carry'
			distans = 0.15
			distans2 = 0.27
			height = 0.63
			spin = 0.0		
			length = 100000
			controlFlagMe = 49
			controlFlagTarget = 33
			animFlagTarget = 1
			TriggerServerEvent('cmg2_animationsCarry:sync', closestPlayer, lib,lib2, anim1, anim2, distans, distans2, height, target, length, spin, controlFlagMe, controlFlagTarget, animFlagTarget)
		else
			QBCore.Functions.Notify("Çevrende kucağına alabileceğin kimse yok!")
		end
	else
		local closestPlayer, distance = QBCore.Functions.GetClosestPlayer()
		if closestPlayer ~= -1 and distance < 1.5 then
			QBCore.Functions.Notify("Kucağından indiriyorsun!")
			Citizen.Wait(1000)
			carryingBackInProgress = false
			ClearPedSecondaryTask(PlayerPedId())
			DetachEntity(PlayerPedId(), true, false)
			target = GetPlayerServerId(closestPlayer)
			TriggerServerEvent("cmg2_animationsCarry:stop", target)
		else
			QBCore.Functions.Notify("Çevrende kucağına alabileceğin kimse yok!")
		end
	end
end)

RegisterNetEvent('cmg2_animationsCarry:syncTarget')
AddEventHandler('cmg2_animationsCarry:syncTarget', function(target, animationLib, animation2, distans, distans2, height, length,spin,controlFlag)
	local playerPed = PlayerPedId()
	local targetPed = GetPlayerPed(GetPlayerFromServerId(target))
	carryingBackInProgress = true
	RequestAnimDict(animationLib)

	while not HasAnimDictLoaded(animationLib) do
		Citizen.Wait(10)
	end
	if spin == nil then spin = 180.0 end
	AttachEntityToEntity(PlayerPedId(), targetPed, 0, distans2, distans, height, 0.5, 0.5, spin, false, false, false, false, 2, false)
	if controlFlag == nil then controlFlag = 0 end
	TaskPlayAnim(playerPed, animationLib, animation2, 8.0, -8.0, length, controlFlag, 0, false, false, false)
end)

RegisterNetEvent('cmg2_animationsCarry:syncMe')
AddEventHandler('cmg2_animationsCarry:syncMe', function(animationLib, animation,length,controlFlag,animFlag)
	local playerPed = PlayerPedId()
	RequestAnimDict(animationLib)

	while not HasAnimDictLoaded(animationLib) do
		Citizen.Wait(10)
	end
	Wait(500)
	if controlFlag == nil then controlFlag = 0 end
	TaskPlayAnim(playerPed, animationLib, animation, 8.0, -8.0, length, controlFlag, 0, false, false, false)

	Citizen.Wait(length)
end)

RegisterNetEvent('cmg2_animationsCarry:cl_stop')
AddEventHandler('cmg2_animationsCarry:cl_stop', function()
	carryingBackInProgress = false
	ClearPedSecondaryTask(PlayerPedId())
	DetachEntity(PlayerPedId(), true, false)
end)

function GetPlayers()
    local players = {}

    for _, i in ipairs(GetActivePlayers()) do
        table.insert(players, i)
    end

    return players
end

function GetClosestPlayer(radius)
    local players = GetPlayers()
    local closestDistance = -1
    local closestPlayer = -1
    local ply = PlayerPedId()
    local plyCoords = GetEntityCoords(ply, 0)

    for index,value in ipairs(players) do
        local target = GetPlayerPed(value)
        if(target ~= ply) then
            local targetCoords = GetEntityCoords(GetPlayerPed(value), 0)
            local distance = GetDistanceBetweenCoords(targetCoords['x'], targetCoords['y'], targetCoords['z'], plyCoords['x'], plyCoords['y'], plyCoords['z'], true)
            if(closestDistance == -1 or closestDistance > distance) then
                closestPlayer = value
                closestDistance = distance
            end
        end
	end
	
	if closestDistance <= radius then
		return closestPlayer
	else
		return nil
	end
end