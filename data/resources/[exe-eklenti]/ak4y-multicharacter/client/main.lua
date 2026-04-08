cam = nil
charPed = nil
opened = false
if AK4Y.Framework == "qb" then
    if not AK4Y.CustomFrameWork then 
        QBCore = exports['qb-core']:GetCoreObject()
    else
        QBCore = exports[AK4Y.CustomFrameWorkExport]:GetCoreObject()
    end
elseif AK4Y.Framework == "oldqb" then 
    QBCore = nil
end

-- Main Thread

CreateThread(function()
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
	while true do
		Wait(0)
		if NetworkIsSessionStarted() then
			TriggerEvent('ak4y-multicharacter:client:chooseCharX')
			return
		end
	end
end)

-- Functions

function skyCam(bool)
    TriggerEvent('qb-weathersync:client:DisableSync')
    if bool then
        SetTimecycleModifier('default')
        DoScreenFadeIn(1000)
        FreezeEntityPosition(PlayerPedId(), false)
        cam = CreateCamWithParams("DEFAULT_SCRIPTED_CAMERA", AK4Y.CamCoords.x, AK4Y.CamCoords.y, AK4Y.CamCoords.z, 0.0 ,0.0, AK4Y.CamCoords.w, 60.00, false, 0)
        SetCamActive(cam, true)
        RenderScriptCams(true, false, 1, true, true)
    else
        SetTimecycleModifier('default')
        SetCamActive(cam, false)
        DestroyCam(cam, true)
        RenderScriptCams(false, false, 1, true, true)
        FreezeEntityPosition(PlayerPedId(), false)
    end
end

function openCharMenu(bool)
    QBCore.Functions.TriggerCallback("ak4y-multicharacter:server:GetNumberOfCharacters", function(result)
        local defaultOpenCharSlot = AK4Y.DefaultOpenCharSlot + result.addedCount
        if bool then 
            while not opened do 
                SetNuiFocus(bool, bool)
                SendNUIMessage({
                    action = "ui",
                    toggle = bool,
                    nChar = result.numOfChars,
                    enableDeleteButton = AK4Y.EnableDeleteButton,
                    defaultCharCount = AK4Y.MaxCharSlot,
                    mySlotCount = defaultOpenCharSlot,
                    translate = AK4Y.Translate,
                    tebexLink = AK4Y.TebexLink,
                })
                Wait(1000)
            end
        else
            SetNuiFocus(bool, bool)
            SendNUIMessage({
                action = "ui",
                toggle = bool,
                nChar = result.numOfChars,
                enableDeleteButton = AK4Y.EnableDeleteButton,
                defaultCharCount = AK4Y.MaxCharSlot,
                mySlotCount = defaultOpenCharSlot,
                translate = AK4Y.Translate,
                tebexLink = AK4Y.TebexLink,
            })
        end
        skyCam(bool)
    end)
end


-- Events

RegisterNetEvent('ak4y-multicharacter:client:closeNUIdefault', function() -- This event is only for no starting apartments
    DeleteEntity(charPed)
    SetNuiFocus(false, false)
    DoScreenFadeOut(500)
    Wait(2000)
    SetEntityCoords(PlayerPedId(), AK4Y.DefaultSpawn.x, AK4Y.DefaultSpawn.y, AK4Y.DefaultSpawn.z)
    TriggerServerEvent('QBCore:Server:OnPlayerLoaded')
    TriggerEvent('QBCore:Client:OnPlayerLoaded')
    TriggerServerEvent('qb-houses:server:SetInsideMeta', 0, false)
    TriggerServerEvent('qb-apartments:server:SetInsideMeta', 0, 0, false)
    Wait(500)
    openCharMenu()
    SetEntityVisible(PlayerPedId(), true)
    Wait(500)
    DoScreenFadeIn(250)
    TriggerEvent('qb-weathersync:client:EnableSync')
    TriggerEvent('qb-clothes:client:CreateFirstCharacter')
end)

RegisterNetEvent('ak4y-multicharacter:client:closeNUI', function()
    DeleteEntity(charPed)
    SetNuiFocus(false, false)
end)

RegisterNetEvent('ak4y-multicharacter:client:spawnLastLocation', function()
    DeleteEntity(charPed)
    SetNuiFocus(false, false)
    DoScreenFadeOut(500)
    Wait(2000)
    
    -- Son konumda spawn (QBCore spawn sistemi kullan)
    TriggerServerEvent('QBCore:Server:OnPlayerLoaded')
    TriggerEvent('QBCore:Client:OnPlayerLoaded')
    TriggerServerEvent('qb-houses:server:SetInsideMeta', 0, false)
    TriggerServerEvent('qb-apartments:server:SetInsideMeta', 0, 0, false)
    Wait(500)
    SetEntityVisible(PlayerPedId(), true)
    Wait(500)
    DoScreenFadeIn(250)
    TriggerEvent('qb-weathersync:client:EnableSync')
end)

RegisterNetEvent('ak4y-multicharacter:client:chooseCharX', function()
    SetNuiFocus(false, false)
    Wait(1000)
    local interior = GetInteriorAtCoords(AK4Y.Interior.x, AK4Y.Interior.y, AK4Y.Interior.z - 18.9)
    LoadInterior(interior)
    while not IsInteriorReady(interior) do
        Wait(1000)
    end
    FreezeEntityPosition(PlayerPedId(), true)
    SetEntityCoords(PlayerPedId(), AK4Y.HiddenCoords.x, AK4Y.HiddenCoords.y, AK4Y.HiddenCoords.z)
    Wait(1500)
    ShutdownLoadingScreen()
    ShutdownLoadingScreenNui()
    openCharMenu(true)
end)


-- NUI Callbacks

RegisterNUICallback('closeUI', function(_, cb)
    openCharMenu(false)
    cb("ok")
end)

RegisterNUICallback('disconnectButton', function(_, cb)
    SetEntityAsMissionEntity(charPed, true, true)
    DeleteEntity(charPed)
    TriggerServerEvent('ak4y-multicharacter:server:disconnect')
    cb("ok")
end)

RegisterNUICallback('selectCharacter', function(data, cb)
    local cData = data.cData
    DoScreenFadeOut(10)
    AK4Y.PlayerLoaded(cData)
    TriggerServerEvent('ak4y-multicharacter:server:loadUserData', cData)
    openCharMenu(false)
    SetEntityAsMissionEntity(charPed, true, true)
    DeleteEntity(charPed)
    cb("ok")
end)

RegisterNUICallback('setupCharacters', function(_, cb)
    QBCore.Functions.TriggerCallback("ak4y-multicharacter:server:setupCharacters", function(result)
        SendNUIMessage({
            action = "setupCharacters",
            characters = result
        })
        cb("ok")
    end)
end)

RegisterNUICallback('refreshCharacters', function(_, cb)
    QBCore.Functions.TriggerCallback("ak4y-multicharacter:server:setupCharacters", function(result)
        SendNUIMessage({
            action = "refreshCharacters",
            characters = result
        })
        cb("ok")
    end)
end)

RegisterNUICallback('removeBlur', function(_, cb)
    SetTimecycleModifier('default')
    cb("ok")
end)

RegisterNUICallback('createNewCharacter', function(data, cb)
    local cData = data
    DoScreenFadeOut(150)
    if cData.gender == "male" then
        cData.gender = 0
    elseif cData.gender == "female" then
        cData.gender = 1
    end
    TriggerServerEvent('ak4y-multicharacter:server:createCharacter', cData)
    Wait(500)
    cb("ok")
end)

RegisterNUICallback('removeCharacter', function(data, cb)
    TriggerServerEvent('ak4y-multicharacter:server:deleteCharacter', data.citizenid)
    DeletePed(charPed)
    opened = false
    TriggerEvent('ak4y-multicharacter:client:chooseCharX')
    cb("ok")
end)

local sendInputProtect = 0
RegisterNUICallback('sendInput', function(data, cb)
    if sendInputProtect < GetGameTimer() then 
        sendInputProtect = GetGameTimer() + 1500
        QBCore.Functions.TriggerCallback("ak4y-multicharacter:sendInput", function(result)
            if result then 
                DeletePed(charPed)
                opened = false
                TriggerEvent('ak4y-multicharacter:client:chooseCharX')
            end
            cb(result)
        end, data)
    end
end)

RegisterNUICallback('started', function(_, cb)
    opened = true
end)