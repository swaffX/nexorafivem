-- You probably shouldnt touch these.
local QBCore = exports['qb-core']:GetCoreObject()
local AnimationDuration = -1
local ChosenAnimation = ""
local ChosenDict = ""
local ChosenAnimOptions = false
local IsInAnimation = false
local MostRecentChosenAnimation = ""
local MostRecentChosenDict = ""
local MovementType = 0
local PlayerGender = "male"
local PlayerHasProp = false
local PlayerProps = {}
local PlayerParticles = {}
local SecondPropEmote = false
local lang = Config.MenuLanguage
local PtfxNotif = false
local PtfxPrompt = false
local PtfxWait = 500
local PtfxCanHold = false
local PtfxNoProp = false
local AnimationThreadStatus = false
local CanCancel = true
local Pointing = false


-- Remove emotes if needed

local emoteTypes = {
    "Shared",
    "Dances",
    "AnimalEmotes",
    "Emotes",
    "PropEmotes",
}

for i = 1, #emoteTypes do
    local emoteType = emoteTypes[i]
    for emoteName, emoteData in pairs(RP[emoteType]) do
        local shouldRemove = false
        if Config.AdultEmotesDisabled and emoteData.AdultAnimation then shouldRemove = true end
        if not Config.AnimalEmotesEnabled and emoteData.AnimalEmote then shouldRemove = true end
        if emoteData[1] and not ((emoteData[1] == 'Scenario') or (emoteData[1] == 'ScenarioObject') or (emoteData[1] == 'MaleScenario')) and not DoesAnimDictExist(emoteData[1]) then shouldRemove = true end
        if shouldRemove then RP[emoteType][emoteName] = nil end
    end
end

local function RunAnimationThread()
    if AnimationThreadStatus then return end
    AnimationThreadStatus = true
    CreateThread(function()
        local sleep
        while AnimationThreadStatus and (IsInAnimation or PtfxPrompt) do
            sleep = 500

            if IsInAnimation then
                sleep = 0
                if IsPedShooting(PlayerPedId()) then
                    EmoteCancel()
                end
            end

            if PtfxPrompt then
                sleep = 0
                if not PtfxNotif then
                    -- SimpleNotify(PtfxInfo)
                    QBCore.Functions.Notify(PtfxInfo, "inform")
                    PtfxNotif = true
                end
                if IsControlPressed(0, 47) then
                    PtfxStart()
                    Wait(PtfxWait)
                    if PtfxCanHold then
                        while IsControlPressed(0, 47) and IsInAnimation and AnimationThreadStatus do
                            Wait(5)
                        end
                    end
                    PtfxStop()
                end
            end

            Wait(sleep)
        end
    end)
end

if Config.EnableXtoCancel then
    RegisterKeyMapping("emotecancel", "Cancel current emote", "keyboard", Config.CancelEmoteKey)
end

if Config.MenuKeybindEnabled then
    RegisterKeyMapping("animasyonlar", "Open rpemotes menu", "keyboard", "F5")
end

if Config.HandsupKeybindEnabled then
    RegisterKeyMapping("handsup", "Put your arms up", "keyboard", Config.HandsupKeybind)
end

if Config.PointingKeybindEnabled then
    RegisterKeyMapping("pointing", "Finger pointing", "keyboard", Config.PointingKeybind)
end

-----------------------------------------------------------------------------------------------------
-- Commands / Events --------------------------------------------------------------------------------
-----------------------------------------------------------------------------------------------------

Citizen.CreateThread(function()
    TriggerEvent('chat:addSuggestion', '/e', 'Play an emote',
        { { name = "emotename", help = "dance, camera, sit or any valid emote." }, 
            { name = "texturevariation", help = "(Optional) 1, 2, 3 or any number. Will change the texture of some props used in emotes, for example the color of a phone. Enter -1 to see a list of variations." } })
    TriggerEvent('chat:addSuggestion', '/emote', 'Play an emote',
        { { name = "emotename", help = "dance, camera, sit or any valid emote." },  
            { name = "texturevariation", help = "(Optional) 1, 2, 3 or any number. Will change the texture of some props used in emotes, for example the color of a phone. Enter -1 to see a list of variations." } })
    if Config.SqlKeybinding then
        TriggerEvent('chat:addSuggestion', '/emotebind', 'Bind an emote',
            { { name = "key", help = "num4, num5, num6, num7. num8, num9. Numpad 4-9!" },
                { name = "emotename", help = "dance, camera, sit or any valid emote." } })
        TriggerEvent('chat:addSuggestion', '/emotebinds', 'Check your currently bound emotes.')
    end
    TriggerEvent('chat:addSuggestion', '/emotemenu', 'Open rpemotes menu (F4) by default. This may differ from server to server.')
    TriggerEvent('chat:addSuggestion', '/emotes', 'List available emotes.')
    TriggerEvent('chat:addSuggestion', '/walk', 'Set your walkingstyle.',
        { { name = "style", help = "/walks for a list of valid styles" } })
    TriggerEvent('chat:addSuggestion', '/walks', 'List available walking styles.')
    TriggerEvent('chat:addSuggestion', '/emotecancel', 'Cancel currently playing emote.')
    TriggerEvent('chat:addSuggestion', '/handsup', 'Put your arms up.')
    TriggerEvent('chat:addSuggestion', '/pointing', 'Finger pointing.')
end)

RegisterCommand('e', function(source, args, raw) EmoteCommandStart(source, args, raw) end, false)
RegisterCommand('emote', function(source, args, raw) EmoteCommandStart(source, args, raw) end, false)
if Config.SqlKeybinding then
    RegisterCommand('emotebind', function(source, args, raw) EmoteBindStart(source, args, raw) end, false)
    RegisterCommand('emotebinds', function(source, args, raw) EmoteBindsStart(source, args, raw) end, false)
end
RegisterCommand('animasyonlar', function(source, args, raw) OpenEmoteMenu() end, false)
RegisterCommand('emotes', function(source, args, raw) EmotesOnCommand() end, false)
RegisterCommand('walk', function(source, args, raw) WalkCommandStart(source, args, raw) end, false)
RegisterCommand('walks', function(source, args, raw) WalksOnCommand() end, false)
RegisterCommand('emotecancel', function(source, args, raw) EmoteCancel() end, false)

RegisterCommand('handsup', function(source, args, raw)
	if Config.HandsupKeybindEnabled then
		if IsEntityPlayingAnim(PlayerPedId(), "missminuteman_1ig_2", "handsup_base", 51) then
			EmoteCancel()
		else
			EmoteCommandStart(nil, {"handsup"}, nil)
		end
	end
end, false)

RegisterCommand('pointing', function(source, args, raw)
	if Config.PointingKeybindEnabled then
		local ped = PlayerPedId()
		Pointing = not Pointing

		if Pointing then
			if LoadAnim("anim@mp_point") then
				SetPedConfigFlag(ped, 36, 1)
				TaskMoveNetworkByName(ped, 'task_mp_pointing', 0.5, 0, 'anim@mp_point', 24)
			end

			Citizen.CreateThread(function()
				local ped = PlayerPedId()

				while Pointing and IsPedOnFoot(ped) do
					Citizen.Wait(0)

					local camPitch = GetGameplayCamRelativePitch()

					if camPitch < -70.0 then
						camPitch = -70.0
					elseif camPitch > 42.0 then
						camPitch = 42.0
					end

					camPitch = (camPitch + 70.0) / 112.0

					local camHeading = GetGameplayCamRelativeHeading()
					local cosCamHeading = Cos(camHeading)
					local sinCamHeading = Sin(camHeading)

					if camHeading < -180.0 then
						camHeading = -180.0
					elseif camHeading > 180.0 then
						camHeading = 180.0
					end

					camHeading = (camHeading + 180.0) / 360.0
					local coords = GetOffsetFromEntityInWorldCoords(ped, (cosCamHeading * -0.2) - (sinCamHeading * (0.4 * camHeading + 0.3)), (sinCamHeading * -0.2) + (cosCamHeading * (0.4 * camHeading + 0.3)), 0.6)
					local rayHandle, blocked = GetShapeTestResult(StartShapeTestCapsule(coords.x, coords.y, coords.z - 0.2, coords.x, coords.y, coords.z + 0.2, 0.4, 95, ped, 7))

					SetTaskMoveNetworkSignalFloat(ped, 'Pitch', camPitch)
					SetTaskMoveNetworkSignalFloat(ped, 'Heading', (camHeading * -1.0) + 1.0)
					SetTaskMoveNetworkSignalBool(ped, 'isBlocked', blocked)
					SetTaskMoveNetworkSignalBool(ped, 'isFirstPerson', GetCamViewModeForContext(GetCamActiveViewModeContext()) == 4)
				end

				ResetPedMovementClipset(ped, 0)
				RequestTaskMoveNetworkStateTransition(ped, 'Stop')

				if not IsPedInjured(ped) then ClearPedSecondaryTask(ped) end

				SetPedConfigFlag(ped, 36, 0)

				if Config.WalkingStylesEnabled and Config.PersistentWalk then
					local kvp = GetResourceKvpString("walkstyle")

					if kvp ~= nil then WalkMenuStart(kvp) end
				end
			end)
		else
			Pointing = false
		end
	end
end, false)

AddEventHandler('onResourceStop', function(resource)
    if resource == GetCurrentResourceName() then
        local ply = PlayerPedId()
        DestroyAllProps()
        ClearPedTasksImmediately(ply)
        DetachEntity(ply, true, false)
        ResetPedMovementClipset(ply)
        AnimationThreadStatus = false
    end
end)

-----------------------------------------------------------------------------------------------------
------ Functions and stuff --------------------------------------------------------------------------
-----------------------------------------------------------------------------------------------------

function EmoteCancel(force)
    local ply = PlayerPedId()
        if not CanCancel and force ~= true then return end
        if ChosenDict == "MaleScenario" and IsInAnimation then
            ClearPedTasksImmediately(ply)
            IsInAnimation = false
            DebugPrint("Forced scenario exit")
        elseif ChosenDict == "Scenario" and IsInAnimation then
            ClearPedTasksImmediately(ply)
            IsInAnimation = false
            DebugPrint("Forced scenario exit")
        end
    
        PtfxNotif = false
        PtfxPrompt = false
        Pointing = false
    
        if IsInAnimation then
            if LocalPlayer.state.ptfx then
                PtfxStop()
            end
            DetachEntity(ply, true, false)
            CancelSharedEmote(ply)
            DestroyAllProps()
    
            if ChosenAnimOptions and ChosenAnimOptions.ExitEmote then
                -- If the emote exit type is not spesifed it defaults to Emotes
                local ExitEmoteType = ChosenAnimOptions.ExitEmoteType or "Emotes"
    
                -- Checks that the exit emote actually exists
                if not RP[ExitEmoteType] or not RP[ExitEmoteType][ChosenAnimOptions.ExitEmote] then
                    DebugPrint("Exit emote was invalid")
                    ClearPedTasks(ply)
                    IsInAnimation = false
                    return
                end
    
                OnEmotePlay(RP[ExitEmoteType][ChosenAnimOptions.ExitEmote])
                DebugPrint("Playing exit animation")
            else
                ClearPedTasks(ply)
                IsInAnimation = false
            end
        end
        AnimationThreadStatus = false
end

function EmoteChatMessage(msg, multiline)
    if msg then
        TriggerEvent("chat:addMessage", { multiline = multiline == true or false, color = { 255, 255, 255 }, args = { "^5Help^0", tostring(msg) } })
    end
end

function DebugPrint(args)
    if Config.DebugDisplay then
        print(args)
    end
end

--#region ptfx
function PtfxThis(asset)
    while not HasNamedPtfxAssetLoaded(asset) do
        RequestNamedPtfxAsset(asset)
        Wait(10)
    end
    UseParticleFxAssetNextCall(asset)
end

function PtfxStart()
    LocalPlayer.state:set('ptfx', true, true)
end

function PtfxStop()
    LocalPlayer.state:set('ptfx', false, true)
end

AddStateBagChangeHandler('ptfx', nil, function(bagName, key, value, _unused, replicated)
    local plyId = tonumber(bagName:gsub('player:', ''), 10)

    -- We stop here if we don't need to go further
    -- We don't need to start or stop the ptfx twice
    if (PlayerParticles[plyId] and value) or (not PlayerParticles[plyId] and not value) then return end

    -- Only allow ptfx change on players
    local ply = GetPlayerFromServerId(plyId)
    if ply == 0 then return end

    local plyPed = GetPlayerPed(ply)
    if not DoesEntityExist(plyPed) then return end

    local stateBag = Player(plyId).state
    if value then
        -- Start ptfx

        local asset = stateBag.ptfxAsset
        local name = stateBag.ptfxName
        local offset = stateBag.ptfxOffset
        local rot = stateBag.ptfxRot
        local scale = stateBag.ptfxScale or 1
        local color = stateBag.ptfxColor
        local propNet = stateBag.ptfxPropNet
        local entityTarget = plyPed
        -- Only do for valid obj
        if propNet then
            local propObj = NetToObj(propNet)
            if DoesEntityExist(propObj) then
                entityTarget = propObj
            end
        end
        PtfxThis(asset)
        PlayerParticles[plyId] = StartNetworkedParticleFxLoopedOnEntityBone(name, entityTarget, offset.x, offset.y, offset.z, rot.x, rot.y, rot.z, GetEntityBoneIndexByName(name, "VFX"), scale + 0.0, 0, 0, 0, 1065353216, 1065353216, 1065353216, 0)
        if color then
            if color[1] and type(color[1]) == 'table' then
                local randomIndex = math.random(1, #color)
                color = color[randomIndex]
            end
            SetParticleFxLoopedAlpha(PlayerParticles[plyId], color.A)
            SetParticleFxLoopedColour(PlayerParticles[plyId], color.R / 255, color.G / 255, color.B / 255, false)
        end
        DebugPrint("Started PTFX: " .. PlayerParticles[plyId])
    else
        -- Stop ptfx
        DebugPrint("Stopped PTFX: " .. PlayerParticles[plyId])
        StopParticleFxLooped(PlayerParticles[plyId], false)
        RemoveNamedPtfxAsset(stateBag.ptfxAsset)
        PlayerParticles[plyId] = nil
    end
end)
--#endregion ptfx

function EmotesOnCommand(source, args, raw)
    local EmotesCommand = ""
    for a in pairsByKeys(RP.Emotes) do
        EmotesCommand = EmotesCommand .. "" .. a .. ", "
    end
    EmoteChatMessage(EmotesCommand)
    EmoteChatMessage(Config.Languages[lang]['emotemenucmd'])
end

function pairsByKeys(t, f)
    local a = {}
    for n in pairs(t) do
        table.insert(a, n)
    end
    table.sort(a, f)
    local i = 0 -- iterator variable
    local iter = function() -- iterator function
        i = i + 1
        if a[i] == nil then
            return nil
        else
            return a[i], t[a[i]]
        end
    end
    return iter
end

function EmoteMenuStart(args, hard, textureVariation)
    local name = args
    local etype = hard

    if etype == "dances" then
        if RP.Dances[name] ~= nil then
            if RP.Dances[name].animpos then
                PlacingThread(RP.Dances[name])
            else
                OnEmotePlay(RP.Dances[name])
            end
        end
    elseif etype == "animals" then
        if RP.AnimalEmotes[name] ~= nil then
            OnEmotePlay(RP.AnimalEmotes[name])
        end
    elseif etype == "props" then
        if RP.PropEmotes[name] ~= nil then
            if RP.PropEmotes[name].animpos then
                PlacingThread(RP.PropEmotes[name], textureVariation)
            else
                OnEmotePlay(RP.PropEmotes[name], textureVariation)
            end
        end
    elseif etype == "emotes" then
        if RP.Emotes[name] ~= nil then
            if RP.Emotes[name].animpos then
                PlacingThread(RP.Emotes[name])
            else
                OnEmotePlay(RP.Emotes[name])
            end
        else
            if name ~= "🕺 Dance Emotes" then end
        end
    elseif etype == "expression" then
        if RP.Expressions[name] ~= nil then
            if RP.Expressions[name].animpos then
                PlacingThread(RP.Expressions[name])
            else
                OnEmotePlay(RP.Expressions[name])
            end
        end
    end
end

function EmoteCommandStart(source, args, raw)
    if #args > 0 then
        local name = string.lower(args[1])
        if name == "c" then
            if IsInAnimation then
                EmoteCancel()
            end
            return
        elseif name == "help" then
            EmotesOnCommand()
            return
        end

        if RP.Emotes[name] ~= nil then
            PlacingThread(RP.Emotes[name])
            print(RP.Emotes[name])
            return
        elseif RP.Dances[name] ~= nil then
            if RP.Dances[name].animpos then
                PlacingThread(RP.Dances[name])
            else
                OnEmotePlay(RP.Dances[name])
            end
            return
        elseif RP.AnimalEmotes[name] ~= nil then
            if RP.AnimalEmotes[name].animpos then
                PlacingThread(RP.AnimalEmotes[name])
            else
                OnEmotePlay(RP.AnimalEmotes[name])
            end
            return
        elseif RP.Exits[name] ~= nil then
            if RP.Exits[name].animpos then
                PlacingThread(RP.Exits[name])
            else
                OnEmotePlay(RP.Exits[name])
            end
            return
        elseif RP.PropEmotes[name] ~= nil then
            if RP.PropEmotes[name].AnimationOptions.PropTextureVariations then
                if #args > 1 then
                    local textureVariation = tonumber(args[2])
                    if (RP.PropEmotes[name].AnimationOptions.PropTextureVariations[textureVariation] ~= nil) then
                        if RP.PropEmotes[name].animpos then
                            PlacingThread(RP.PropEmotes[name], textureVariation - 1)
                        else
                            OnEmotePlay(RP.PropEmotes[name], textureVariation - 1)
                        end
                        return
                    else
                        local str = ""
                        for k, v in ipairs(RP.PropEmotes[name].AnimationOptions.PropTextureVariations) do
                            str = str .. string.format("\n(%s) - %s", k, v.Name)
                        end
                        
                        EmoteChatMessage(string.format(Config.Languages[lang]['invalidvariation'], str), true)
                        if RP.PropEmotes[name].animpos then
                            PlacingThread(RP.PropEmotes[name], 0)
                        else
                            OnEmotePlay(RP.PropEmotes[name], 0)
                        end
                        return
                    end
                end
            end
            if RP.PropEmotes[name].animpos then
                PlacingThread(RP.PropEmotes[name])
            else
                OnEmotePlay(RP.PropEmotes[name])
            end
            return
        else
            EmoteChatMessage("'" .. name .. "' " .. Config.Languages[lang]['notvalidemote'] .. "")
        end
    end
end

function LoadAnim(dict)
    if not DoesAnimDictExist(dict) then
        return false
    end

    while not HasAnimDictLoaded(dict) do
        RequestAnimDict(dict)
        Wait(10)
    end

    return true
end

function LoadPropDict(model)
    while not HasModelLoaded(joaat(model)) do
        RequestModel(joaat(model))
        Wait(10)
    end
end

function DestroyAllProps()
    for _, v in pairs(PlayerProps) do
        DeleteEntity(v)
    end
    PlayerHasProp = false
    DebugPrint("Destroyed Props")
end

function AddPropToPlayer(prop1, bone, off1, off2, off3, rot1, rot2, rot3, textureVariation)
    local Player = PlayerPedId()
    local x, y, z = table.unpack(GetEntityCoords(Player))

    if not HasModelLoaded(prop1) then
        LoadPropDict(prop1)
    end

    prop = CreateObject(joaat(prop1), x, y, z + 0.2, true, true, true)
    if textureVariation ~= nil then
        SetObjectTextureVariation(prop, textureVariation)
    end
    AttachEntityToEntity(prop, Player, GetPedBoneIndex(Player, bone), off1, off2, off3, rot1, rot2, rot3, true, true,
        false, true, 1, true)
    table.insert(PlayerProps, prop)
    PlayerHasProp = true
    SetModelAsNoLongerNeeded(prop1)
    return true
end

-----------------------------------------------------------------------------------------------------
-- V -- This could be a whole lot better, i tried messing around with "IsPedMale(ped)"
-- V -- But i never really figured it out, if anyone has a better way of gender checking let me know.
-- V -- Since this way doesnt work for ped models.
-- V -- in most cases its better to replace the scenario with an animation bundled with prop instead.
-----------------------------------------------------------------------------------------------------

function CheckGender()
    local hashSkinMale = joaat("mp_m_freemode_01")
    local hashSkinFemale = joaat("mp_f_freemode_01")

    if GetEntityModel(PlayerPedId()) == hashSkinMale then
        PlayerGender = "male"
    elseif GetEntityModel(PlayerPedId()) == hashSkinFemale then
        PlayerGender = "female"
    end
    DebugPrint("Set gender as = (" .. PlayerGender .. ")")
end

-----------------------------------------------------------------------------------------------------
------ This is the major function for playing emotes! -----------------------------------------------
-----------------------------------------------------------------------------------------------------

local ped = nil
local animsiso = false

StartAnimThread = function()
    animsiso = true
    exports['qb-core']:DrawText("İptal etmek için [Q] tuşuna basın")
    CreateThread(function ()
        while animsiso do
            Wait(1)
            if IsControlJustPressed(0, 44) then
                animsiso = false
                exports['qb-core']:HideText()
                ClearPedTasksImmediately(PlayerPedId())
                return
            end
        end
    end)
end

requestAnimDict = function(animDict)
	if HasAnimDictLoaded(animDict) then return end
	RequestAnimDict(animDict)
	while not HasAnimDictLoaded(animDict) do
		Wait(0)
	end
end


local function RotationToDirection(rotation)
	local adjustedRotation =
	{
		x = (math.pi / 180) * rotation.x,
		y = (math.pi / 180) * rotation.y,
		z = (math.pi / 180) * rotation.z
	}
	local direction =
	{
		x = -math.sin(adjustedRotation.z) * math.abs(math.cos(adjustedRotation.x)),
		y = math.cos(adjustedRotation.z) * math.abs(math.cos(adjustedRotation.x)),
		z = math.sin(adjustedRotation.x)
	}
	return direction
end

Camera = function(ped)
    local cameraRotation = GetGameplayCamRot()
	local cameraCoord = GetGameplayCamCoord()
	local direction = RotationToDirection(cameraRotation)
	local destination =
	{
		x = cameraCoord.x + direction.x * 10.0,
		y = cameraCoord.y + direction.y * 10.0,
		z = cameraCoord.z + direction.z * 10.0
	}

    local sphereCast = StartShapeTestSweptSphere(
        cameraCoord.x,
        cameraCoord.y,
        cameraCoord.z,
        destination.x,
        destination.y,
        destination.z,
        0.2,
        339,
        ped,
        4
    );
    return GetShapeTestResultIncludingMaterial(sphereCast);
end

startPlacing = function()
    local _, hit, endCoords, _, _, _ = Camera(ped)
    if hit then
        currentCoords = endCoords
    end
end

stopPlacing = function()
    if ped then
        DeleteEntity(ped)
    end
    ped = nil
    heading = 0.0
    currentCoords = nil
    exports['qb-core']:HideText()
end

MakePedAnim = function(coords, heading, EmoteName, textureVariation)

    if not DoesEntityExist(PlayerPedId()) then
        return false
    end

    ChosenDict, ChosenAnimation, ename = table.unpack(EmoteName)
    ChosenAnimOptions = EmoteName.AnimationOptions
    AnimationDuration = -1

    if ChosenDict == "Expression" then
        SetFacialIdleAnimOverride(PlayerPedId(), ChosenAnimation, 0)
        return
    end

    if Config.DisarmPlayer then
        if IsPedArmed(PlayerPedId(), 7) then
            SetCurrentPedWeapon(PlayerPedId(), joaat('WEAPON_UNARMED'), true)
        end
    end

    if PlayerHasProp then
        DestroyAllProps()
    end

    if ChosenDict == "MaleScenario" or "Scenario" then
        CheckGender()
        if ChosenDict == "MaleScenario" then
            if InVehicle then
                return
            end
            if PlayerGender == "male" then
                ClearPedTasks(PlayerPedId())
                TaskStartScenarioInPlace(PlayerPedId(), ChosenAnimation, 0, true)
                DebugPrint("Playing scenario = (" .. ChosenAnimation .. ")")
                IsInAnimation = true
                RunAnimationThread()
            else
                EmoteChatMessage(Config.Languages[lang]['maleonly'])
            end
            return
        elseif ChosenDict == "ScenarioObject" then
            if InVehicle then
                return
            end
            BehindPlayer = GetOffsetFromEntityInWorldCoords(PlayerPedId(), 0.0, 0 - 0.5, -0.5)
            ClearPedTasks(PlayerPedId())
            TaskStartScenarioAtPosition(PlayerPedId(), ChosenAnimation, BehindPlayer['x'], BehindPlayer['y'],
                BehindPlayer['z'], GetEntityHeading(PlayerPedId()), 0, 1, false)
            DebugPrint("Playing scenario = (" .. ChosenAnimation .. ")")
            IsInAnimation = true
            RunAnimationThread()
            return
        elseif ChosenDict == "Scenario" then
            if InVehicle then
                return
            end
            ClearPedTasks(PlayerPedId())
            TaskStartScenarioInPlace(PlayerPedId(), ChosenAnimation, 0, true)
            DebugPrint("Playing scenario = (" .. ChosenAnimation .. ")")
            IsInAnimation = true
            RunAnimationThread()
            return
        end
    end

    -- Small delay at the start
    if EmoteName.AnimationOptions and EmoteName.AnimationOptions.StartDelay then
        Wait(EmoteName.AnimationOptions.StartDelay)
    end

    if not LoadAnim(ChosenDict) then
        EmoteChatMessage("'" .. ename .. "' " .. Config.Languages[lang]['notvalidemote'] .. "")
        return
    end

    if EmoteName.AnimationOptions then
        if EmoteName.AnimationOptions.EmoteLoop then
            MovementType = 1
            if EmoteName.AnimationOptions.EmoteMoving then
                MovementType = 51 -- 110011
            end

        elseif EmoteName.AnimationOptions.EmoteMoving then
            MovementType = 51 -- 110011
        elseif EmoteName.AnimationOptions.EmoteMoving == false then
            MovementType = 0
        elseif EmoteName.AnimationOptions.EmoteStuck then
            MovementType = 50 -- 110010
        end

    else
        MovementType = 0
    end

    if InVehicle == 1 then
        MovementType = 51
    end

    if EmoteName.AnimationOptions then
        if EmoteName.AnimationOptions.EmoteDuration == nil then
            EmoteName.AnimationOptions.EmoteDuration = -1
            AttachWait = 0
        else
            AnimationDuration = EmoteName.AnimationOptions.EmoteDuration
            AttachWait = EmoteName.AnimationOptions.EmoteDuration
        end

        if EmoteName.AnimationOptions.PtfxAsset then
            PtfxAsset = EmoteName.AnimationOptions.PtfxAsset
            PtfxName = EmoteName.AnimationOptions.PtfxName
            if EmoteName.AnimationOptions.PtfxNoProp then
                PtfxNoProp = EmoteName.AnimationOptions.PtfxNoProp
            else
                PtfxNoProp = false
            end
            Ptfx1, Ptfx2, Ptfx3, Ptfx4, Ptfx5, Ptfx6, PtfxScale = table.unpack(
                EmoteName.AnimationOptions.PtfxPlacement)
            PtfxColor = EmoteName.AnimationOptions.PtfxColor
            PtfxInfo = EmoteName.AnimationOptions.PtfxInfo
            PtfxWait = EmoteName.AnimationOptions.PtfxWait
            PtfxCanHold = EmoteName.AnimationOptions.PtfxCanHold
            PtfxNotif = false
            PtfxPrompt = true
            -- RunAnimationThread() -- ? This call should not be required, see if needed with tests

            TriggerServerEvent("rpemotes:ptfx:sync", PtfxAsset, PtfxName,
                vector3(Ptfx1, Ptfx2, Ptfx3), vector3(Ptfx4, Ptfx5, Ptfx6), PtfxScale, PtfxColor)
        else
            DebugPrint("Ptfx = none")
            PtfxPrompt = false
        end
    end

    stopPlacing()
    TaskGoToCoordAnyMeans(PlayerPedId(), coords.x, coords.y, coords.z, 1.0, 0, 0, 786603, 0xbf800000)
    local PlayerCoords = GetEntityCoords(PlayerPedId())
    exports['qb-core']:DrawText("İptal etmek için [Sağ Tık] tuşuna basın")
    while #(PlayerCoords - coords) > 1.5 do
        Wait(1)
        PlayerCoords = GetEntityCoords(PlayerPedId())
        if IsControlJustPressed(0, 177) then
            exports['qb-core']:HideText()
            ClearPedTasksImmediately(PlayerPedId())
            return
        end
    end
    exports['qb-core']:HideText()
    SetEntityCoords(PlayerPedId(), coords.x, coords.y, coords.z, 0.0, 0.0, 0.0, false)
    TaskPlayAnimAdvanced(PlayerPedId(), ChosenDict, ChosenAnimation, coords.x, coords.y, coords.z, 0, 0, heading, 3.0, 3.0, -1, 2, 1.0, false, false)
    StartAnimThread()
    RemoveAnimDict(ChosenDict)
    IsInAnimation = true
    RunAnimationThread()
    MostRecentDict = ChosenDict
    MostRecentAnimation = ChosenAnimation

    if EmoteName.AnimationOptions then
        if EmoteName.AnimationOptions.Prop then
            PropName = EmoteName.AnimationOptions.Prop
            PropBone = EmoteName.AnimationOptions.PropBone
            PropPl1, PropPl2, PropPl3, PropPl4, PropPl5, PropPl6 = table.unpack(
                EmoteName.AnimationOptions.PropPlacement)
            if EmoteName.AnimationOptions.SecondProp then
                SecondPropName = EmoteName.AnimationOptions.SecondProp
                SecondPropBone = EmoteName.AnimationOptions.SecondPropBone
                SecondPropPl1, SecondPropPl2, SecondPropPl3, SecondPropPl4, SecondPropPl5, SecondPropPl6 = table.unpack(
                    EmoteName.AnimationOptions.SecondPropPlacement)
                SecondPropEmote = true
            else
                SecondPropEmote = false
            end
            Wait(AttachWait)
            if not AddPropToPlayer(PropName, PropBone, PropPl1, PropPl2, PropPl3, PropPl4, PropPl5, PropPl6,
                textureVariation) then
                return
            end
            if SecondPropEmote then
                if not AddPropToPlayer(SecondPropName, SecondPropBone, SecondPropPl1, SecondPropPl2,
                    SecondPropPl3, SecondPropPl4, SecondPropPl5, SecondPropPl6, textureVariation) then
                    DestroyAllProps()
                    return
                end
            end

            -- Ptfx is on the prop, then we need to sync it
            if EmoteName.AnimationOptions.PtfxAsset and not PtfxNoProp then
                TriggerServerEvent("rpemotes:ptfx:syncProp", ObjToNet(prop))
            end
        end
    end
end

local txt = {
    '[E] Onayla \n',
    '[X / Sağ Tık] İptal \n',
    '[Yukarı/Aşağı Ok] Yükseklik \n',
    '[SCROLL] Döndür \n',
}

PlacingThread = function(animData, textureVariation)
    if ped == nil then
        local playerPed = PlayerPedId()
        ped = ClonePed(playerPed, false, false, false)
        FreezeEntityPosition(ped, true)
        SetEntityAlpha(ped, 0)

        local animDict = animData[1]
        local animName = animData[2]

        requestAnimDict(animDict)
        TaskPlayAnim(ped, animDict, animName, 8.0, 8.0, -1, 1, 0, false, false, false)

        SetEntityCollision(ped, false, false)
        SetEntityAlpha(ped, 100)
        SetBlockingOfNonTemporaryEvents(ped, true)
        heading = GetEntityHeading(playerPed) + 90.0
        exports['qb-core']:DrawText(table.concat(txt))
        CreateThread(function ()
            local currentCoordsZ = 0
            while ped ~= nil do
                Wait(1)
                DisableControlAction(0, 22, true)
                startPlacing()
                if currentCoords then
                    SetEntityCoords(ped, currentCoords.x, currentCoords.y, currentCoords.z + currentCoordsZ)
                    SetEntityHeading(ped, heading)
                end
                if IsDisabledControlJustPressed(0, 14) then
                    heading = heading + 5
                    if heading > 360 then heading = 0.0 end
                end
                if IsDisabledControlPressed(0, 27) then
                    currentCoordsZ = currentCoordsZ + 0.01
                end
                if IsDisabledControlPressed(0, 173) then
                    currentCoordsZ = currentCoordsZ - 0.01
                end
                if IsDisabledControlJustPressed(0, 15) then
                    heading = heading - 5
                    if heading < 0 then heading = 360.0 end
                end
                if IsControlJustPressed(0, 38) then
                    if #(GetEntityCoords(PlayerPedId()) - currentCoords) < 5.0 then
                        MakePedAnim(GetEntityCoords(ped), GetEntityHeading(ped), animData, textureVariation)
                    else
                        QBCore.Functions.Notify("Çok uzaktasın.", "error")
                    end
                end

                if IsControlJustPressed(0, 47) then -- G

                    requestAnimDict(animDict)
                    TaskPlayAnim(ped, animDict, animName, 8.0, 8.0, -1, 1, 0, false, false, false)
            
                end

                if IsControlJustPressed(0, 74) then -- H

                    requestAnimDict(animDict)
                    TaskPlayAnim(ped, animDict, animName, 8.0, 8.0, -1, 1, 0, false, false, false)
                end

                if IsControlJustPressed(0, 177) then
                    stopPlacing()
                end
            end
        end)
    else
        DeleteObject(ped)
        ped = nil
        stopPlacing()
        return
    end
end

function OnEmotePlay(EmoteName, textureVariation)
    local playerPed = PlayerPedId()
    if not IsEntityInAir(playerPed) then
        InVehicle = IsPedInAnyVehicle(PlayerPedId(), true)
        Pointing = false

        if not Config.AllowedInCars and InVehicle == 1 then
            return
        end

        if not DoesEntityExist(PlayerPedId()) then
            return false
        end

        ChosenDict, ChosenAnimation, ename = table.unpack(EmoteName)
        ChosenAnimOptions = EmoteName.AnimationOptions
        AnimationDuration = -1

        if ChosenDict == "Expression" then
            SetFacialIdleAnimOverride(PlayerPedId(), ChosenAnimation, 0)
            return
        end

        if Config.DisarmPlayer then
            if IsPedArmed(PlayerPedId(), 7) then
                SetCurrentPedWeapon(PlayerPedId(), joaat('WEAPON_UNARMED'), true)
            end
        end

        if PlayerHasProp then
            DestroyAllProps()
        end

        if ChosenDict == "MaleScenario" or "Scenario" then
            CheckGender()
            if ChosenDict == "MaleScenario" then
                if InVehicle then
                    return
                end
                if PlayerGender == "male" then
                    ClearPedTasks(PlayerPedId())
                    TaskStartScenarioInPlace(PlayerPedId(), ChosenAnimation, 0, true)
                    DebugPrint("Playing scenario = (" .. ChosenAnimation .. ")")
                    IsInAnimation = true
                    RunAnimationThread()
                else
                    EmoteChatMessage(Config.Languages[lang]['maleonly'])
                end
                return
            elseif ChosenDict == "ScenarioObject" then
                if InVehicle then
                    return
                end
                BehindPlayer = GetOffsetFromEntityInWorldCoords(PlayerPedId(), 0.0, 0 - 0.5, -0.5)
                ClearPedTasks(PlayerPedId())
                TaskStartScenarioAtPosition(PlayerPedId(), ChosenAnimation, BehindPlayer['x'], BehindPlayer['y'],
                    BehindPlayer['z'], GetEntityHeading(PlayerPedId()), 0, 1, false)
                DebugPrint("Playing scenario = (" .. ChosenAnimation .. ")")
                IsInAnimation = true
                RunAnimationThread()
                return
            elseif ChosenDict == "Scenario" then
                if InVehicle then
                    return
                end
                ClearPedTasks(PlayerPedId())
                TaskStartScenarioInPlace(PlayerPedId(), ChosenAnimation, 0, true)
                DebugPrint("Playing scenario = (" .. ChosenAnimation .. ")")
                IsInAnimation = true
                RunAnimationThread()
                return
            end
        end

        -- Small delay at the start
        if EmoteName.AnimationOptions and EmoteName.AnimationOptions.StartDelay then
            Wait(EmoteName.AnimationOptions.StartDelay)
        end

        if not LoadAnim(ChosenDict) then
            EmoteChatMessage("'" .. ename .. "' " .. Config.Languages[lang]['notvalidemote'] .. "")
            return
        end

        if EmoteName.AnimationOptions then
            if EmoteName.AnimationOptions.EmoteLoop then
                MovementType = 1
                if EmoteName.AnimationOptions.EmoteMoving then
                    MovementType = 51 -- 110011
                end

            elseif EmoteName.AnimationOptions.EmoteMoving then
                MovementType = 51 -- 110011
            elseif EmoteName.AnimationOptions.EmoteMoving == false then
                MovementType = 0
            elseif EmoteName.AnimationOptions.EmoteStuck then
                MovementType = 50 -- 110010
            end

        else
            MovementType = 0
        end

        if InVehicle == 1 then
            MovementType = 51
        end

        if EmoteName.AnimationOptions then
            if EmoteName.AnimationOptions.EmoteDuration == nil then
                EmoteName.AnimationOptions.EmoteDuration = -1
                AttachWait = 0
            else
                AnimationDuration = EmoteName.AnimationOptions.EmoteDuration
                AttachWait = EmoteName.AnimationOptions.EmoteDuration
            end

            if EmoteName.AnimationOptions.PtfxAsset then
                PtfxAsset = EmoteName.AnimationOptions.PtfxAsset
                PtfxName = EmoteName.AnimationOptions.PtfxName
                if EmoteName.AnimationOptions.PtfxNoProp then
                    PtfxNoProp = EmoteName.AnimationOptions.PtfxNoProp
                else
                    PtfxNoProp = false
                end
                Ptfx1, Ptfx2, Ptfx3, Ptfx4, Ptfx5, Ptfx6, PtfxScale = table.unpack(
                    EmoteName.AnimationOptions.PtfxPlacement)
                PtfxColor = EmoteName.AnimationOptions.PtfxColor
                PtfxInfo = EmoteName.AnimationOptions.PtfxInfo
                PtfxWait = EmoteName.AnimationOptions.PtfxWait
                PtfxCanHold = EmoteName.AnimationOptions.PtfxCanHold
                PtfxNotif = false
                PtfxPrompt = true
                -- RunAnimationThread() -- ? This call should not be required, see if needed with tests

                TriggerServerEvent("rpemotes:ptfx:sync", PtfxAsset, PtfxName,
                    vector3(Ptfx1, Ptfx2, Ptfx3), vector3(Ptfx4, Ptfx5, Ptfx6), PtfxScale, PtfxColor)
            else
                DebugPrint("Ptfx = none")
                PtfxPrompt = false
            end
        end

        TaskPlayAnim(PlayerPedId(), ChosenDict, ChosenAnimation, 5.0, 5.0, AnimationDuration, MovementType, 0, false, false, false)
        RemoveAnimDict(ChosenDict)
        IsInAnimation = true
        RunAnimationThread()
        MostRecentDict = ChosenDict
        MostRecentAnimation = ChosenAnimation

        if EmoteName.AnimationOptions then
            if EmoteName.AnimationOptions.Prop then
                PropName = EmoteName.AnimationOptions.Prop
                PropBone = EmoteName.AnimationOptions.PropBone
                PropPl1, PropPl2, PropPl3, PropPl4, PropPl5, PropPl6 = table.unpack(
                    EmoteName.AnimationOptions.PropPlacement)
                if EmoteName.AnimationOptions.SecondProp then
                    SecondPropName = EmoteName.AnimationOptions.SecondProp
                    SecondPropBone = EmoteName.AnimationOptions.SecondPropBone
                    SecondPropPl1, SecondPropPl2, SecondPropPl3, SecondPropPl4, SecondPropPl5, SecondPropPl6 = table.unpack(
                        EmoteName.AnimationOptions.SecondPropPlacement)
                    SecondPropEmote = true
                else
                    SecondPropEmote = false
                end
                Wait(AttachWait)
                if not AddPropToPlayer(PropName, PropBone, PropPl1, PropPl2, PropPl3, PropPl4, PropPl5, PropPl6,
                    textureVariation) then
                    return
                end
                if SecondPropEmote then
                    if not AddPropToPlayer(SecondPropName, SecondPropBone, SecondPropPl1, SecondPropPl2,
                        SecondPropPl3, SecondPropPl4, SecondPropPl5, SecondPropPl6, textureVariation) then
                        DestroyAllProps()
                        return
                    end
                end

                -- Ptfx is on the prop, then we need to sync it
                if EmoteName.AnimationOptions.PtfxAsset and not PtfxNoProp then
                    TriggerServerEvent("rpemotes:ptfx:syncProp", ObjToNet(prop))
                end
            end
        end
    else
        QBCore.Functions.Notify('Havada iken animasyon kullanamazsın', 'error')
    end
end

-----------------------------------------------------------------------------------------------------
------ Some exports to make the script more standalone! (by Clem76) ---------------------------------
-----------------------------------------------------------------------------------------------------

exports("EmoteCommandStart", function(emoteName, textureVariation)
        EmoteCommandStart(nil, {emoteName, textureVariation}, nil)
end)
exports("EmoteCancel", EmoteCancel)
exports("CanCancelEmote", function(State)
		CanCancel = State == true
end)
