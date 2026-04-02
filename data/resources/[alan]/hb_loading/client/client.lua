-- Variable to check if native has already been run
local Ran = false

-- Wait until client is loaded into the map
AddEventHandler("playerSpawned", function ()
    -- If not already ran
    if not Ran then
        -- Show 'Press SPACE' message in NUI
        SendNUIMessage({
            action = "showPressSpace"
        })
        -- NUI'ya focus ver
        SetNuiFocus(true, true)
        -- Set as ran
        Ran = true
    end
end)

-- NUI callback: Space basınca ekranı kapat
RegisterNUICallback("closeLoadingScreen", function(data, cb)
    -- NUI focus'u kapat
    SetNuiFocus(false, false)
    TriggerEvent('hb_multicharacter:client:chooseChar')
    cb("ok")
end)
