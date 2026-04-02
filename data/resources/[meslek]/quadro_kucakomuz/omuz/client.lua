QBCore = nil
Citizen.CreateThread(function()
    while QBCore == nil do
        TriggerEvent('QBCore:GetObject', function(obj) QBCore = obj end)
        Citizen.Wait(200)
    end
end)

local piggyBackInProgress = false

Citizen.CreateThread(function()
	while true do
		Citizen.Wait(3)
		if IsControlJustPressed(0,56) then
			Citizen.Wait(1000)
			local closestPlayer, distance = QBCore.Functions.GetClosestPlayer()
			if not piggyBackInProgress and not IsPedInAnyVehicle(PlayerPedId(), false) then
				if closestPlayer ~= -1 and distance < 1.5 and not IsPedInAnyVehicle(GetPlayerPed(closestPlayer), false) and not IsEntityPlayingAnim(GetPlayerPed(closestPlayer), 'misslamar1dead_body', 'dead_idle', 3) then
					QBCore.Functions.Notify("Omuzluyorsun!")
					Citizen.Wait(1000)
					target = GetPlayerServerId(closestPlayer)
					piggyBackInProgress = true
					local player = PlayerPedId()	
					lib = 'anim@arena@celeb@flat@paired@no_props@'
					anim1 = 'piggyback_c_player_a'
					anim2 = 'piggyback_c_player_b'
					distans = -0.07
					distans2 = 0.0
					height = 0.45
					spin = 0.0		
					length = 100000
					controlFlagMe = 49
					controlFlagTarget = 33
					animFlagTarget = 1
					TriggerServerEvent('cmg2_animations:sync', closestPlayer, lib, anim1, anim2, distans, distans2, height, target, length, spin, controlFlagMe, controlFlagTarget, animFlagTarget)
				else
					QBCore.Functions.Notify("Çevrende sırtına alabileceğin kimse yok!")
				end
			else
				if closestPlayer ~= -1 and distance < 1.5 then
					QBCore.Functions.Notify("Omuzundan indiriyorsun!")
					Citizen.Wait(1000)
					piggyBackInProgress = false
					ClearPedSecondaryTask(PlayerPedId())
					DetachEntity(PlayerPedId(), true, false)
					target = GetPlayerServerId(closestPlayer)
					TriggerServerEvent("cmg2_animations:stop", target)
				else
					QBCore.Functions.Notify("Çevrende sırtına alabileceğin kimse yok!")
				end
			end
		end
	end
end)

RegisterCommand("omuzla", function()
	Citizen.Wait(1000)
	local closestPlayer, distance = QBCore.Functions.GetClosestPlayer()
	if not piggyBackInProgress and not IsPedInAnyVehicle(PlayerPedId(), false) then
		if closestPlayer ~= -1 and distance < 1.5 and not IsPedInAnyVehicle(GetPlayerPed(closestPlayer), false) and not IsEntityPlayingAnim(GetPlayerPed(closestPlayer), 'misslamar1dead_body', 'dead_idle', 3) then
			QBCore.Functions.Notify("Omuzluyorsun!")
			Citizen.Wait(1000)
			target = GetPlayerServerId(closestPlayer)
			piggyBackInProgress = true
			local player = PlayerPedId()	
			lib = 'anim@arena@celeb@flat@paired@no_props@'
			anim1 = 'piggyback_c_player_a'
			anim2 = 'piggyback_c_player_b'
			distans = -0.07
			distans2 = 0.0
			height = 0.45
			spin = 0.0		
			length = 100000
			controlFlagMe = 49
			controlFlagTarget = 33
			animFlagTarget = 1
			TriggerServerEvent('cmg2_animations:sync', closestPlayer, lib, anim1, anim2, distans, distans2, height, target, length, spin, controlFlagMe, controlFlagTarget, animFlagTarget)
		else
			QBCore.Functions.Notify("Çevrende sırtına alabileceğin kimse yok!")
		end
	else
		if closestPlayer ~= -1 and distance < 1.5 then
			QBCore.Functions.Notify("Omuzundan indiriyorsun!")
			Citizen.Wait(1000)
			piggyBackInProgress = false
			ClearPedSecondaryTask(PlayerPedId())
			DetachEntity(PlayerPedId(), true, false)
			target = GetPlayerServerId(closestPlayer)
			TriggerServerEvent("cmg2_animations:stop", target)
		else
			QBCore.Functions.Notify("Çevrende sırtına alabileceğin kimse yok!")
		end
	end
	Citizen.Wait(3)
end)

RegisterNetEvent('cmg2_animations:syncTarget')
AddEventHandler('cmg2_animations:syncTarget', function(target, animationLib, animation2, distans, distans2, height, length,spin,controlFlag)
	local playerPed = PlayerPedId()
	local targetPed = GetPlayerPed(GetPlayerFromServerId(target))
	piggyBackInProgress = true
	RequestAnimDict(animationLib)

	while not HasAnimDictLoaded(animationLib) do
		Citizen.Wait(10)
	end
	if spin == nil then spin = 180.0 end
	AttachEntityToEntity(PlayerPedId(), targetPed, 0, distans2, distans, height, 0.5, 0.5, spin, false, false, false, false, 2, false)
	if controlFlag == nil then controlFlag = 0 end
	TaskPlayAnim(playerPed, animationLib, animation2, 8.0, -8.0, length, controlFlag, 0, false, false, false)
end)

RegisterNetEvent('cmg2_animations:syncMe')
AddEventHandler('cmg2_animations:syncMe', function(animationLib, animation,length,controlFlag,animFlag)
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

RegisterNetEvent('cmg2_animations:cl_stop')
AddEventHandler('cmg2_animations:cl_stop', function()
	piggyBackInProgress = false
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