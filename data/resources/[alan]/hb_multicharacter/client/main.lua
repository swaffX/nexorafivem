local cam = nil
local charPed = nil
local QBCore = exports['qb-core']:GetCoreObject()
local PlayAnim = Config.RandomAnims[math.random(#Config.RandomAnims)] 

-- Main Thread
--    CreateThread(function()
--    	while true do
--    		Wait(0)
--    		if NetworkIsSessionStarted() then
--   			TriggerEvent('hb_multicharacter:client:chooseChar')
--    			return
--    		end
--   	end
--    end)

-- Functions

local function skyCam(bool)
    TriggerEvent('qb-weathersync:client:DisableSync')
    if bool then
        DoScreenFadeIn(1300)
        SetTimecycleModifier('scanline_cam_cheap') --https://wiki.rage.mp/index.php?title=Timecycle_Modifiers
        SetTimecycleModifierStrength(1.0)
        FreezeEntityPosition(PlayerPedId(), true)
        cam = CreateCamWithParams("DEFAULT_SCRIPTED_CAMERA", Config.CamCoords.x , Config.CamCoords.y, Config.CamCoords.z, Config.CamRoll, 0.0, Config.CamCoords.w, Config.CameraFoV, true, 0)
        RenderScriptCams(true, false, 1, true, true)
        SetCamUseShallowDofMode(cam, Config.Blur)
        SetCamNearDof(cam, Config.CameraNearDof)
        SetCamFarDof(cam, Config.CameraFarDof)
        SetCamDofStrength(cam, Config.CameraDofStrength)
        ShakeCam(cam, Config.ShakeType, Config.CameraShake) -- Shakes the camera
        while DoesCamExist(cam) do
            -- You have to run this function every frame (while you want DOF for your camera) otherwise it wont work
            SetUseHiDof()
        
            Citizen.Wait(0)
        end

    else
        SetTimecycleModifier('default')
        SetCamActive(cam, false)
        DestroyCam(cam, true)
        RenderScriptCams(false, false, 1, true, true)
        FreezeEntityPosition(PlayerPedId(), false)
    end
end

local function openlogout(bool)
    QBCore.Functions.TriggerCallback("hb_multicharacter:server:GetNumberOfCharacters", function(result)
        local translations = {}
        for k in pairs(Lang.fallback and Lang.fallback.phrases or Lang.phrases) do
            if k:sub(0, ('ui.'):len()) then
                translations[k:sub(('ui.'):len() + 1)] = Lang:t(k)
            end
        end
        SetNuiFocus(bool, bool)
        SendNUIMessage({
            action = "ui",
            customNationality = Config.customNationality,
            toggle = bool,
            nChar = result,
            enableDeleteButton = Config.EnableDeleteButton,
            translations = translations
        })
        skyCam(bool)
    end)
end

-- Events

RegisterNetEvent('hb_multicharacter:client:closeNUIdefault', function() -- This event is only for no starting apartments
    DeleteEntity(charPed)
    SetNuiFocus(false, false)
    DoScreenFadeOut(500)
    Wait(2000)
    SetEntityCoords(PlayerPedId(), Config.DefaultSpawn.x, Config.DefaultSpawn.y, Config.DefaultSpawn.z)
    TriggerServerEvent('QBCore:Server:OnPlayerLoaded')
    TriggerEvent('QBCore:Client:OnPlayerLoaded')
    Wait(500)
    openlogout()
    SetEntityVisible(PlayerPedId(), true)
    Wait(500)
    DoScreenFadeIn(250)
    TriggerEvent('qb-weathersync:client:EnableSync')
    TriggerEvent('qb-clothes:client:CreateFirstCharacter')
end)

RegisterNetEvent('hb_multicharacter:client:closeNUI', function()
    DeleteEntity(charPed)
    SetNuiFocus(false, false)
end)

RegisterNetEvent('hb_multicharacter:client:chooseChar', function()
    SetNuiFocus(false, false)
    DoScreenFadeOut(10)
    Wait(1000)
    local interior = GetInteriorAtCoords(Config.Interior.x, Config.Interior.y, Config.Interior.z - 18.9)
    LoadInterior(interior)
    while not IsInteriorReady(interior) do
        Wait(1000)
    end
    FreezeEntityPosition(PlayerPedId(), true)
    SetEntityCoords(PlayerPedId(), Config.HiddenCoords.x, Config.HiddenCoords.y, Config.HiddenCoords.z)
    Wait(1500)
    ShutdownLoadingScreen()
    ShutdownLoadingScreenNui()
    DisplayRadar(false)
    openlogout(true)
end)

-- NUI Callbacks

RegisterNUICallback('closeUI', function(_, cb)
    openlogout(false)
    cb("ok")
end)

RegisterNUICallback('disconnectButton', function(_, cb)
    SetEntityAsMissionEntity(charPed, true, true)
    DeleteEntity(charPed)
    TriggerServerEvent('hb_multicharacter:server:disconnect')
    cb("ok")
end)

RegisterNUICallback('selectCharacter', function(data, cb)
    local cData = data.cData
    DoScreenFadeOut(10)

    SetEntityAsMissionEntity(charPed, true, true)
    DeleteEntity(charPed)

    openlogout(false)
    skyCam(false)

    TriggerServerEvent('hb_multicharacter:server:loadUserData', cData)

    TriggerServerEvent('hb_multicharacter:server:spawnLastLocation', cData)

    cb("ok")
end)
RegisterNUICallback('cDataPed', function(nData, cb)
    local cData = nData.cData
    local slot = nData.slot or 1 -- slot bilgisi yoksa 1. slot
    SetEntityAsMissionEntity(charPed, true, true)
    DeleteEntity(charPed)
    
    local function createPed(model, slot)
        local pedSlot = Config.PedSlots and Config.PedSlots[slot] or Config.PedSlots[1]
        local pos = pedSlot.coords
        local anim = pedSlot.anim or Config.RandomAnims[math.random(#Config.RandomAnims)]
        RequestModel(model)
        while not HasModelLoaded(model) do
            Wait(0)
        end
        charPed = CreatePed(2, model, pos.x, pos.y, pos.z - 0.98, pos.w, false, true)
        SetPedComponentVariation(charPed, 0, 0, 0, 2)
        FreezeEntityPosition(charPed, true)
        SetEntityInvincible(charPed, true)
        TaskStartScenarioInPlace(charPed, anim, 0, true)
        SetBlockingOfNonTemporaryEvents(charPed, true)
    end

    local function loadSkinData(skinData)
        if skinData then
            local model = joaat(skinData.model)
            CreateThread(function()
                createPed(model, slot)
                if Config.UseAppearance == "fivem-appearance" then
                    exports['fivem-appearance']:setPedAppearance(charPed, skinData)
                elseif Config.UseAppearance == "illenium-appearance" then
                    exports['illenium-appearance']:setPedAppearance(charPed, skinData)
                else
                    TriggerEvent('qb-clothing:client:loadPlayerClothing', skinData, charPed)
                end
            end)
        else
            CreateThread(function()
                local randommodels = {"mp_m_freemode_01", "mp_f_freemode_01"}
                local model = joaat(randommodels[math.random(1, #randommodels)])
                createPed(model, slot)
            end)
        end
    end

    if cData ~= nil then
        QBCore.Functions.TriggerCallback('hb_multicharacter:server:getSkin', function(skinData)
            loadSkinData(skinData)
            cb("ok")
        end, cData.citizenid)
    else
        CreateThread(function()
            local randommodels = {"mp_m_freemode_01", "mp_f_freemode_01"}
            local model = joaat(randommodels[math.random(1, #randommodels)])
            createPed(model, slot)
        end)
        cb("ok")
    end
end)

RegisterNUICallback('setupCharacters', function(_, cb)
    QBCore.Functions.TriggerCallback("hb_multicharacter:server:setupCharacters", function(result)
        SendNUIMessage({
            action = "setupCharacters",
            characters = result
        })
        TriggerEvent('hb_multicharacter:client:setupCharPeds', result) -- Pedleri spawn et
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
    if cData.gender == Lang:t("ui.male") then
        cData.gender = 0
    elseif cData.gender == Lang:t("ui.female") then
        cData.gender = 1
    end
    TriggerServerEvent('hb_multicharacter:server:createCharacter', cData)
    Wait(500)
    cb("ok")
end)

RegisterNUICallback('removeCharacter', function(data, cb)
    TriggerServerEvent('hb_multicharacter:server:deleteCharacter', data.citizenid)
    DeletePed(charPed)
    TriggerEvent('hb_multicharacter:client:chooseChar')
    cb("ok")
end)

RegisterNetEvent('hb_multicharacter:client:spawnLastLocation', function(coords)
    local ped = PlayerPedId()
    SetEntityCoords(ped, coords.x, coords.y, coords.z)
    SetEntityHeading(ped, coords.w)
    FreezeEntityPosition(ped, false)
    SetEntityVisible(ped, true)

    -- 🔧 Mouse imlecini kapat
    SetNuiFocus(false, false)

    TriggerServerEvent('QBCore:Server:OnPlayerLoaded')
    TriggerEvent('QBCore:Client:OnPlayerLoaded')
    DoScreenFadeIn(250)
end)

RegisterNetEvent('hb_multicharacter:client:spawnLastLocation', function(coords)
    local ped = PlayerPedId()
    SetEntityCoords(ped, coords.x, coords.y, coords.z)
    SetEntityHeading(ped, coords.w)
    FreezeEntityPosition(ped, false)
    SetEntityVisible(ped, true)
    TriggerServerEvent('QBCore:Server:OnPlayerLoaded')
    TriggerEvent('QBCore:Client:OnPlayerLoaded')
    DoScreenFadeIn(250)
end)

local charPeds = {} -- Çoklu pedler için tablo

-- 3D yazı fonksiyonu
function DrawText3D(x, y, z, text, scale)
    local onScreen, _x, _y = World3dToScreen2d(x, y, z)
    local px, py, pz = table.unpack(GetGameplayCamCoords())
    SetTextScale(scale or 0.35, scale or 0.35)
    SetTextFont(4)
    SetTextProportional(1)
    SetTextColour(255, 255, 255, 215)
    SetTextEntry("STRING")
    SetTextCentre(1)
    AddTextComponentString(text)
    if onScreen then
        DrawText(_x, _y)
        local factor = (string.len(text)) / 370
        DrawRect(_x, _y + 0.0125, 0.015 + factor, 0.03, 0, 0, 0, 75)
    end
end

-- Ped pozisyonlarını slot sayısına göre ayarla
function GetPedPositionForSlot(slot, total)
    if Config.PedSlots and Config.PedSlots[slot] then
        return Config.PedSlots[slot].coords
    end
    -- fallback eski sistem
    local base = Config.PedCoords or vector4(0,0,0,0)
    local spacing = 2.0
    local start = base.x - ((total-1)/2)*spacing
    return vector4(start + (slot-1)*spacing, base.y, base.z, base.w)
end

-- Tüm pedleri spawn et
function SpawnAllCharPeds(characters)
    for i, ped in pairs(charPeds) do
        if DoesEntityExist(ped) then DeleteEntity(ped) end
    end
    charPeds = {}
    local total = #characters
    local sanchezVeh = nil
    for i=1, total do
        local cData = characters[i]
        local pos = GetPedPositionForSlot(i, total)
        local model = `mp_m_freemode_01`
        if cData and cData.skin and cData.skin.model then
            model = joaat(cData.skin.model)
        end
        RequestModel(model)
        while not HasModelLoaded(model) do Wait(0) end
        local ped = CreatePed(2, model, pos.x, pos.y, pos.z-0.98, pos.w, false, true)
        SetPedComponentVariation(ped, 0, 0, 0, 2)
        FreezeEntityPosition(ped, true)
        SetEntityInvincible(ped, true)
        local anim = (Config.PedSlots and Config.PedSlots[i] and Config.PedSlots[i].anim) or Config.RandomAnims[math.random(#Config.RandomAnims)]
        -- Slot bazlı özel animasyonlar
        if i == 1 then
            anim = nil -- anim oynatma
            -- Blazer spawn
            local vehModel = joaat("blazer")
            RequestModel(vehModel)
            while not HasModelLoaded(vehModel) do Wait(0) end
            local veh = CreateVehicle(vehModel, pos.x, pos.y, pos.z-1.0, pos.w, false, true)
            SetEntityAsMissionEntity(veh, true, true)
            SetVehicleOnGroundProperly(veh)
            TaskWarpPedIntoVehicle(ped, veh, -1) -- sürücü koltuğuna bindir
        elseif i == 2 then
            anim = "WORLD_HUMAN_STAND_IMPATIENT" -- ayakta idle
            -- Sanchez sabit konumda spawnla (dekor)
            local vehModel = joaat("sanchez")
            RequestModel(vehModel)
            while not HasModelLoaded(vehModel) do Wait(0) end
            sanchezVeh = CreateVehicle(vehModel, 162.18, 7034.24, 1.52, 335.26, false, true)
            SetEntityAsMissionEntity(sanchezVeh, true, true)
            SetVehicleOnGroundProperly(sanchezVeh)
        elseif i == 3 then
            anim = "WORLD_HUMAN_PICNIC" -- yerde oturuyor animasyonu
            -- sanchez'e binme yok
        end
        if anim then
            TaskStartScenarioInPlace(ped, anim, 0, true)
        end
        SetBlockingOfNonTemporaryEvents(ped, true)
        -- Karakterin görünümünü uygula
        if cData and cData.skin then
            if Config.UseAppearance == "fivem-appearance" then
                exports['fivem-appearance']:setPedAppearance(ped, cData.skin)
            elseif Config.UseAppearance == "illenium-appearance" then
                exports['illenium-appearance']:setPedAppearance(ped, cData.skin)
            else
                TriggerEvent('qb-clothing:client:loadPlayerClothing', cData.skin, ped)
            end
        end
        charPeds[i] = ped
    end
end

-- Her frame isimleri pedlerin üstünde göster ve pede tıklama ile seçim
-- (DrawText3D ile yazı gösterme kodları kaldırıldı)
CreateThread(function()
    while true do
        Wait(0)
        local playerPed = PlayerPedId()
        local playerCoords = GetEntityCoords(playerPed)
        local hitPedIndex = nil
        for i, ped in pairs(charPeds) do
            if DoesEntityExist(ped) then
                local coords = GetEntityCoords(ped)
                -- Sadece HTML/CSS ile gösterilecek, DrawText3D kaldırıldı
                -- Oyuncu pede yakın mı ve bakıyor mu? (artık gerek yok)
            end
        end
        -- E ile seçim kaldırıldı
    end
end)

-- Karakter seçimini pede tıklama ile yap
RegisterNetEvent('hb_multicharacter:client:selectPedCharacter', function(index)
    if _G.characters and _G.characters[index] then
        -- NUI'ya play_character fonksiyonunu tetiklet
        SetNuiFocus(true, true)
        SendNUIMessage({
            action = "selectPedCharacter",
            selected = index
        })
    end
end)

-- NUI'dan karakterler geldiğinde karakter dizisini globalde sakla
RegisterNetEvent('hb_multicharacter:client:setupCharPeds', function(characters)
    _G.characters = characters
    SpawnAllCharPeds(characters)
end)

-- Her frame pedlerin ekran koordinatlarını NUI'ya gönder
CreateThread(function()
    while true do
        Wait(0)
        local pedLabels = {}
        for i, ped in pairs(charPeds) do
            if DoesEntityExist(ped) and _G.characters and _G.characters[i] and _G.characters[i].charinfo then
                local coords = GetEntityCoords(ped)
                local onScreen, x, y = World3dToScreen2d(coords.x, coords.y, coords.z+1.0)
                if onScreen then
                    table.insert(pedLabels, {
                        index = i,
                        x = x,
                        y = y,
                        firstname = _G.characters[i].charinfo.firstname,
                        lastname = _G.characters[i].charinfo.lastname
                    })
                end
            end
        end
        SendNUIMessage({
            action = "updatePedLabels",
            pedLabels = pedLabels
        })
    end
end)

-- Her frame pedlerin saydamlığını sıfırla (tam görünür yap)
CreateThread(function()
    while true do
        Wait(0)
        for _, ped in pairs(charPeds) do
            if DoesEntityExist(ped) then
                SetEntityAlpha(ped, 255, false)
                ResetEntityAlpha(ped)
            end
        end
    end
end)
