local closeloadingscreen = false

AddEventHandler("playerSpawned", function()
    if not closeloadingscreen then
        closeloadingscreen = true
        DoScreenFadeOut(0)
        Wait(300)
        ShutdownLoadingScreenNui()
        Wait(1500)
        DoScreenFadeIn(2000)
    end
end)