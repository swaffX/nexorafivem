-- # Credits to CrossLeak's

-- # Discord Server - https://discord.gg/rf2Kkwd

-- # Discord Founder - CrossLeaks#0918

-- # You can find support in that discord too!

-- Although there is only one export at the moment, more may be added down the line. 

--[[---------------------------------------------------------------------------------------
	Locks the designated plate reader camera for the given client. 

	Parameters:
		clientId:
			The id of the client
		cam:
			The camera to lock, either "front" or "rear"
		beepAudio:
			Play an audible beep, either true or false
		boloAudio:
			Play the bolo lock sound, either true or false
---------------------------------------------------------------------------------------]]--
function TogglePlateLock( clientId, cam, beepAudio, boloAudio )
	TriggerClientEvent( "wk:togglePlateLock", clientId, cam, beepAudio, boloAudio )
end 