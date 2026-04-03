Citizen.CreateThread(function()
	while true do       
        SetDiscordAppId(1489774594846887966)
        SetDiscordRichPresenceAsset('image')
        SetDiscordRichPresenceAssetText('Nexora Roleplay') 
        SetDiscordRichPresenceAssetSmall('image')
        SetDiscordRichPresenceAssetSmallText('FiveM - Nexora Roleplay')
		
        SetDiscordRichPresenceAction(0, "DİSCORD'A KATIL!", "https://discord.gg/nexorafivem")
		SetDiscordRichPresenceAction(1, "SUNUCUYA BAĞLAN!", "fivem://connect/194.105.5.37:30120")
		Citizen.Wait(60000)
	end
end)
Citizen.CreateThread(function()
	while true do
		local VehName = GetLabelText(GetDisplayNameFromVehicleModel(GetEntityModel(GetVehiclePedIsUsing(PlayerPedId()))))
		if VehName == "NULL" then VehName = GetDisplayNameFromVehicleModel(GetEntityModel(GetVehiclePedIsUsing(PlayerPedId()))) end
		local x,y,z = table.unpack(GetEntityCoords(PlayerPedId(),true))
		local StreetHash = GetStreetNameAtCoord(x, y, z)
		local pId = GetPlayerServerId(PlayerId())
		local pName = GetPlayerName(PlayerId())
		Citizen.Wait(15000)
		if StreetHash ~= nil then
			StreetName = GetStreetNameFromHashKey(StreetHash)
			if IsPedOnFoot(PlayerPedId()) and not IsEntityInWater(PlayerPedId()) then
				if IsPedSprinting(PlayerPedId()) then
					SetRichPresence("ID: "..pId.." | "..pName.." koşuyor | "..StreetName)
				elseif IsPedRunning(PlayerPedId()) then
					SetRichPresence("ID: "..pId.." | "..pName.." yürüyor | "..StreetName)
				elseif IsPedWalking(PlayerPedId()) then
					SetRichPresence("ID: "..pId.." | "..pName.." yürüyor | "..StreetName)
				elseif IsPedStill(PlayerPedId()) then
					SetRichPresence("ID: "..pId.." | "..pName.." duruyor | "..StreetName.."")
				end
			elseif GetVehiclePedIsUsing(PlayerPedId()) ~= nil and not IsPedInAnyHeli(PlayerPedId()) and not IsPedInAnyPlane(PlayerPedId()) and not IsPedOnFoot(PlayerPedId()) and not IsPedInAnySub(PlayerPedId()) and not IsPedInAnyBoat(PlayerPedId()) then
				local KMH = math.ceil(GetEntitySpeed(GetVehiclePedIsUsing(PlayerPedId())) * 3.6)
				if KMH > 50 then
					SetRichPresence("ID: "..pId.." | "..pName.." hızlanıyor | "..StreetName..", "..KMH.." KM/H ile - "..VehName)
				elseif KMH <= 50 and KMH > 0 then
					SetRichPresence("ID: "..pId.." | "..pName.." yavaşlıyor | "..StreetName..", "..KMH.." KM/H ile - "..VehName)
				elseif KMH == 0 then
					SetRichPresence("ID: "..pId.." | "..pName.." park halinde | "..StreetName.." - "..VehName)
				end
			elseif IsPedInAnyHeli(PlayerPedId()) or IsPedInAnyPlane(PlayerPedId()) then
				if IsEntityInAir(GetVehiclePedIsUsing(PlayerPedId())) or GetEntityHeightAboveGround(GetVehiclePedIsUsing(PlayerPedId())) > 5.0 then
					SetRichPresence("ID: "..pId.." | "..pName.." üzerinde uçuyor | "..StreetName.." aracı "..VehName)
				else
					SetRichPresence("ID: "..pId.." | "..pName.." uçağı indirdi | "..StreetName.." aracı "..VehName)
				end
			elseif IsEntityInWater(PlayerPedId()) then
				SetRichPresence("ID: "..pId.." | "..pName.." yüzüyor")
			elseif IsPedInAnyBoat(PlayerPedId()) and IsEntityInWater(GetVehiclePedIsUsing(PlayerPedId())) then
				SetRichPresence("ID: "..pId.." | "..pName.." bir yelken açıyor "..VehName)
			elseif IsPedInAnySub(PlayerPedId()) and IsEntityInWater(GetVehiclePedIsUsing(PlayerPedId())) then
				SetRichPresence("ID: "..pId.." | "..pName.." sarı bir denizaltıda")
			end
		end
	end
end)