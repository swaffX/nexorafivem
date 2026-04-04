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
		local pId = GetPlayerServerId(PlayerId())
		local pName = GetPlayerName(PlayerId())
		
		SetRichPresence("ID: "..pId.." | "..pName)
		
		Citizen.Wait(15000)
	end
end)