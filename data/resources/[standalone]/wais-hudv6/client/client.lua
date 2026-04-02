-- =====================================================
--  decrypted by https://discord.gg/6NCbAv2VNK 𝐀𝐤 𝐋𝐞𝐚𝐤𝐬 
--		Cleaned By Said Ak Using Claude Sonnet 4.5
-- =====================================================

-- ============================================================================
-- INITIALIZE VARIABLES
-- ============================================================================

Player = {
    pId = PlayerId(),
    dead = false,
    pausemenu = false,
    cinematic = false,
    voice = {
        radio = false,
        talking = false
    },
    weapon = {
        hash = -1569615261,
        name = Weapons[-1569615261]?.label or "Fists",
        ammo = 0,
        clip = 0
    },
    vehicle = {
        seat = -1,
        vehicle = 0,
        speed = 0,
        class = 0,
        doors = {},
        seats = {},
        belt = false,
        ignoreBelt = false,
        isBlacklisted = false,
        canPlayMusic = true,
        soundData = nil,
        isBoat = false,
        isPlane = false
    },
    customizations = {}
}

-- Voice System Detection
local hasPMAVoice = GetResourceState("pma-voice"):find("start") ~= nil

-- XSound Export
local xSound = exports.xsound

-- Screen Resolution
local screenResolution = {x = 0, y = 0}

-- Aspect Ratio
local aspectRatio = GetAspectRatio(false)

-- NUI Ready State
nuiState = {
    ready = false,
    timer = 150000.0
}

-- Keybind References
local carControlKeybind = nil
local settingsKeybind = nil
local editorKeybind = nil

-- UI States
local isCarControlOpen = false
local settingsMenuOpen = false
local isEditorModeOpen = false

-- Hide States
local hideStates = {
    radar = false,
    hud = false
}

-- Compass Directions
local compassDirections = {
    "N", "NW", "W", "SW", "S", "SE", "E", "NE"
}

-- Vehicle Features by Style
local vehicleStyleFeatures = {
    circle = {boat = true, plane = true, gears = true},
    modern = {boat = true, plane = true, gears = true},
    agressive = {boat = true, plane = true, gears = true},
    sport = {boat = false, plane = false, gears = true}
}

-- ============================================================================
-- NETWORK EVENTS
-- ============================================================================

-- Player Loaded Event
RegisterNetEvent("wais:hudv6:client:playerLoaded", function()
    wFramework.playerLoaded()
end)

-- Set Player Dead State
RegisterNetEvent("wais:hudv6:client:setDead", function(isDead)
    Player.dead = isDead
    if isCarControlOpen and isDead then
        closeCarControlMenu()
    end
end)

-- Update Active Players
RegisterNetEvent("wais:hudv6:client:updatePlayers", function(current, max)
    SendNUIMessage({
        type = "SET_ACTIVE_PLAYERS",
        max = max,
        current = current
    })
end)

-- Hide/Show Radar
RegisterNetEvent("wais:hudv6:client:hideRadar", function(state)
    if type(state) ~= "boolean" then
        Config.Debug("[^1ERROR - RADAR^0] Invalid argument type, expected boolean.")
        return
    end
    hideStates.radar = state
    InitRadar()
end)

-- Hide/Show HUD
RegisterNetEvent("wais:hudv6:client:hideHud", function(state)
    if type(state) ~= "boolean" then
        Config.Debug("[^1ERROR - HUD^0] Invalid argument type, expected boolean.")
        return
    end
    changeUIshowState(state)
end)

-- Toggle Cinematic Mode
RegisterNetEvent("wais:hudv6:client:cinematic", function(state)
    if type(state) ~= "boolean" then
        Config.Debug("[^1ERROR - CINEMATIC^0] Invalid argument type, expected boolean.")
        return
    end
    toggleCinematic(state)
end)

-- ============================================================================
-- RESOURCE START HANDLER
-- ============================================================================

-- Start thread to continuously hide default GTA HUD (must run every frame)
-- This runs immediately when resource starts
CreateThread(function()
    while true do
        Wait(0) -- Run every frame
        
        -- Hide default GTA HUD components using HideHudComponentThisFrame
        -- This must be called every frame to keep components hidden
        HideHudComponentThisFrame(0)  -- Wanted Stars
        HideHudComponentThisFrame(1)  -- Weapon Icon
        HideHudComponentThisFrame(2)  -- Cash
        HideHudComponentThisFrame(3)  -- MP Cash
        HideHudComponentThisFrame(4)  -- MP Message
        HideHudComponentThisFrame(5)  -- Vehicle Name
        HideHudComponentThisFrame(6)  -- Area Name
        HideHudComponentThisFrame(7)  -- Vehicle Class
        HideHudComponentThisFrame(8)  -- Street Name
        HideHudComponentThisFrame(9)  -- Vehicle Name (alternative)
        HideHudComponentThisFrame(10) -- Weapon Ammo
        HideHudComponentThisFrame(11) -- Weapon Ammo Clip
        HideHudComponentThisFrame(12) -- Weapon Ammo Total
        HideHudComponentThisFrame(13) -- Cash Change
        HideHudComponentThisFrame(14) -- Weapon Icon (alternative)
        HideHudComponentThisFrame(15) -- Weapon Name
        HideHudComponentThisFrame(17) -- Save Game
        HideHudComponentThisFrame(20) -- Multiplayer Chat
    end
end)

AddEventHandler("onClientResourceStart", function(resourceName)
    if GetCurrentResourceName() == resourceName then
        while not nuiState.ready or wFramework.Framework == nil do
            Wait(1)
        end
        
        -- For QBX, try to get player data immediately if player is already loaded
        if Config.Framework.Framework == "qbx" then
            CreateThread(function()
                Wait(100) -- Reduced wait time
                
                -- Try to get player data from multiple sources quickly
                if Player and type(Player) == "table" and Player.PlayerData and Player.PlayerData.job then
                    wFramework.Framework.PlayerData = Player.PlayerData
                    Config.Debug("[^2INFO - QBX^0] Player data found from Player object on resource start")
                elseif wFramework.Framework and wFramework.Framework.PlayerData and wFramework.Framework.PlayerData.job then
                    Config.Debug("[^2INFO - QBX^0] Player data already cached on resource start")
                end
                
                -- Call playerLoaded immediately (it will initialize HUD with default data if needed)
                wFramework.playerLoaded()
            end)
        else
            wFramework.playerLoaded()
        end
    end
end)

-- ============================================================================
-- VOICE SYSTEM EVENTS (PMA-VOICE)
-- ============================================================================

RegisterNetEvent("pma-voice:setTalkingMode", function(distance)
    SendNUIMessage({
        type = "UPDATE_MIC_DISTANCE",
        distance = distance
    })
end)

RegisterNetEvent("pma-voice:radioActive", function(isActive)
    Player.voice.radio = isActive
end)

-- ============================================================================
-- VOICE SYSTEM EVENTS (SALTY CHAT)
-- ============================================================================

RegisterNetEvent("SaltyChat_TalkStateChanged", function(isTalking)
    SendNUIMessage({
        type = "UPDATE_MIC",
        state = isTalking,
        radio = Player.voice.radio
    })
end)

RegisterNetEvent("SaltyChat_RadioTrafficStateChanged", function(playerName, isActive)
    Player.voice.radio = isActive
end)

RegisterNetEvent("SaltyChat_VoiceRangeChanged", function(playerName, range, index)
    SendNUIMessage({
        type = "UPDATE_MIC_DISTANCE",
        distance = index
    })
end)

RegisterNetEvent("SaltyChat_MicStateChanged", function(isMuted)
    SendNUIMessage({
        type = "SALTY_MIC_MUTED",
        state = isMuted
    })
end)

RegisterNetEvent("SaltyChat_SoundStateChanged", function(isMuted)
    SendNUIMessage({
        type = "SALTY_SOUND_MUTED",
        state = isMuted
    })
end)

-- ============================================================================
-- NUI CALLBACKS
-- ============================================================================

-- NUI Ready Callback
RegisterNUICallback("nuiReady", function(data, cb)
    nuiState.ready = true
    Player.customizations = data.customizations or {}
    Config.Debug("[^2INFO - NUI^0] NUI is ready, customizations loaded: " .. json.encode(Player.customizations))
    cb("ok")
end)

-- Save Customizations
RegisterNUICallback("customizations", function(data, cb)
    Player.customizations = data.customizations
    Config.Debug("[^2INFO - NUI^0] Customizations updated: " .. json.encode(Player.customizations))
    cb("ok")
end)

-- Close Quick Menu
RegisterNUICallback("closeQuickMenu", function(data, cb)
    closeCarControlMenu()
    cb("ok")
end)

-- Mark Nearby Location
RegisterNUICallback("marknearby", function(data, cb)
    closeCarControlMenu()
    
    if data.type and Location[data.type] then
        markNearCoord(data.type)
    else
        Config.Debug("[^1ERROR - MARK LOCATION^0] Invalid location type: " .. tostring(data.type))
    end
    
    cb("ok")
end)

-- Play Sound in Vehicle
RegisterNUICallback("playSound", function(data, cb)
    if Player.vehicle.vehicle <= 0 then
        return cb("ok")
    end
    
    if not Player.vehicle.canPlayMusic then
        Config.Debug("[^1ERROR - MUSIC^0] Vehicle is blacklisted for music playback.")
        return cb("ok")
    end
    
    -- Destroy existing sound if present
    if Player.vehicle.soundData ~= nil then
        if xSound:soundExists(Player.vehicle.soundData.id) then
            xSound:Destroy(Player.vehicle.soundData.id)
        end
    end
    
    -- Set up new sound
    data.data.vehicle = NetworkGetNetworkIdFromEntity(Player.vehicle.vehicle)
    data.data.volume = data.volume
    Player.vehicle.soundData = data.data
    
    SendNUIMessage({
        type = "UPDATE_VEHICLE_SOUND",
        data = data.data
    })
    
    xSound:PlayUrl(data.data.id, data.data.url, data.data.volume, false)
    cb("ok")
end)

-- Change Volume
RegisterNUICallback("changeVolume", function(data, cb)
    if Player.vehicle.vehicle <= 0 then
        return cb(false)
    end
    
    if not Player.vehicle.canPlayMusic then
        Config.Debug("[^1ERROR - MUSIC^0] Vehicle is blacklisted for music playback.")
        return cb(false)
    end
    
    if Player.vehicle.soundData ~= nil and Player.vehicle.soundData.id then
        if xSound:soundExists(Player.vehicle.soundData.id) then
            xSound:setVolume(Player.vehicle.soundData.id, data.volume)
            Player.vehicle.soundData.volume = data.volume
        else
            Config.Debug("[^1ERROR - MUSIC^0] Sound does not exist: " .. Player.vehicle.soundData.id)
        end
    else
        Config.Debug("[^1ERROR - MUSIC^0] No sound data available to change volume.")
    end
    
    cb(true)
end)

-- Sound Play/Pause State
RegisterNUICallback("soundStae", function(data, cb)
    if Player.vehicle.vehicle <= 0 then
        return cb(false)
    end
    
    if not Player.vehicle.canPlayMusic then
        Config.Debug("[^1ERROR - MUSIC^0] Vehicle is blacklisted for music playback.")
        return cb(false)
    end
    
    if Player.vehicle.soundData ~= nil and Player.vehicle.soundData.id then
        Player.vehicle.soundData.play = data.play
        
        if xSound:soundExists(Player.vehicle.soundData.id) then
            if data.play then
                xSound:Resume(Player.vehicle.soundData.id)
            else
                xSound:Pause(Player.vehicle.soundData.id)
            end
        else
            Config.Debug("[^1ERROR - MUSIC^0] Sound does not exist: " .. Player.vehicle.soundData.id)
        end
    else
        Config.Debug("[^1ERROR - MUSIC^0] No sound data available to change state.")
    end
    
    cb(true)
end)

-- Toggle Vehicle Door
RegisterNUICallback("doors:toggle", function(data, cb)
    if Player.vehicle.vehicle <= 0 then
        Config.Debug("[^1ERROR - DOORS^0] No vehicle detected.")
        return cb("ok")
    end
    
    local doorIndex = data.door
    local isDoorOpen = Player.vehicle.doors[doorIndex]
    
    if not isDoorOpen then
        SetVehicleDoorOpen(Player.vehicle.vehicle, doorIndex, false, false)
    else
        SetVehicleDoorShut(Player.vehicle.vehicle, doorIndex, false)
    end
    
    cb("ok")
end)

-- Switch Vehicle Seat
RegisterNUICallback("doors:switchSeat", function(data, cb)
    if Player.vehicle.vehicle <= 0 then
        Config.Debug("[^1ERROR - SEAT SWITCH^0] No vehicle detected.")
        return cb("ok")
    end
    
    local seatIndex = data.seat
    local seatData = Player.vehicle.seats[tostring(seatIndex)]
    
    if not seatData or not seatData.free then
        Config.Debug("[^1ERROR - SEAT SWITCH^0] Seat is not free or does not exist.")
        return cb("ok")
    end
    
    local playerPed = PlayerPedId()
    
    if IsVehicleSeatFree(Player.vehicle.vehicle, seatIndex) then
        SetPedIntoVehicle(playerPed, Player.vehicle.vehicle, seatIndex)
    else
        Config.Debug("[^1ERROR - SEAT SWITCH^0] Seat is occupied.")
    end
    
    cb("ok")
end)

-- Destroy Song
RegisterNUICallback("destroySong", function(data, cb)
    if Player.vehicle.vehicle <= 0 then
        return cb("ok")
    end
    
    if not Player.vehicle.canPlayMusic then
        Config.Debug("[^1ERROR - MUSIC^0] Vehicle is blacklisted for music playback.")
        return cb("ok")
    end
    
    if Player.vehicle.soundData ~= nil and Player.vehicle.soundData.id then
        if xSound:soundExists(Player.vehicle.soundData.id) then
            xSound:Destroy(Player.vehicle.soundData.id)
        else
            Config.Debug("[^1ERROR - MUSIC^0] Sound does not exist: " .. Player.vehicle.soundData.id)
        end
        Player.vehicle.soundData = nil
    else
        Config.Debug("[^1ERROR - MUSIC^0] No sound data available to destroy.")
    end
    
    cb("ok")
end)

-- Show Notification
RegisterNUICallback("notification", function(data, cb)
    Config.Notification(
        data.title or "Notification",
        data.text or "No text provided",
        data.type or "info"
    )
    cb("ok")
end)

-- Toggle Cinematic Mode
RegisterNUICallback("cinematic", function(data, cb)
    Player.cinematic = data.state
    InitRadar()
    cb("ok")
end)

-- Close Settings Menu
RegisterNUICallback("closeSettings", function(data, cb)
    if not settingsMenuOpen then
        Config.Debug("[^1ERROR - SETTINGS^0] Settings menu is not open.")
        return cb("ok")
    end
    
    closeSettings()
    cb("ok")
end)

-- Close Editor Mode
RegisterNUICallback("closeEditor", function(data, cb)
    closeEditorMode()
    cb("ok")
end)

-- Change Map Type
RegisterNUICallback("changeMapType", function(data, cb)
    Player.customizations.mapType = data.type or "square"
    InitMap()
    cb("ok")
end)

-- Change Map Position
RegisterNUICallback("changeMapPosition", function(data, cb)
    Player.customizations.mapPosition = data.position
    InitMap()
    cb("ok")
end)

-- Change Map Radius
RegisterNUICallback("changeMapRadius", function(data, cb)
    Player.customizations.mapRadius = data.radius or false
    InitMap()
    cb("ok")
end)

-- Input Focus Handler
RegisterNUICallback("input", function(data, cb)
    if Config.Commands.carcontrol.mouseControl then
        if data.focused then
            SetNuiFocusKeepInput(false)
        else
            SetNuiFocusKeepInput(true)
        end
    end
    cb("ok")
end)

-- Copy to Clipboard
RegisterNUICallback("copyToClipboard", function(data, cb)
    lib.setClipboard(data.text)
    Config.Notification(
        Lang("hud"),
        Lang("theme_data").copy,
        "success"
    )
    cb("ok")
end)

-- ============================================================================
-- UTILITY FUNCTIONS
-- ============================================================================

-- Parse ISO 8601 Duration to Seconds
local function parseDuration(duration)
    local hours = tonumber(duration:match("(%d+)H")) or 0
    local minutes = tonumber(duration:match("(%d+)M")) or 0
    local seconds = tonumber(duration:match("(%d+)S")) or 0
    
    return (hours * 3600) + (minutes * 60) + seconds
end

-- Get Player's Current Vehicle Seat
local function getCurrentSeat()
    local playerPed = PlayerPedId()
    local currentSeat = 0
    local minSeat = -1
    local maxSeats = GetVehicleModelNumberOfSeats(GetEntityModel(Player.vehicle.vehicle))
    
    for seat = minSeat, maxSeats do
        local pedInSeat = GetPedInVehicleSeat(Player.vehicle.vehicle, seat)
        if pedInSeat == playerPed then
            currentSeat = seat
            break
        end
    end
    
    return currentSeat
end

-- Check Vehicle Blacklist Settings
local function checkVehicleBlacklist()
    -- Check by vehicle class
    local classBlacklist = Config.BlacklistedVehicles.class[Player.vehicle.class]
    if classBlacklist ~= nil then
        Player.vehicle.isBlacklisted = classBlacklist.carhud or false
        Player.vehicle.ignoreBelt = classBlacklist.belt or false
        Player.vehicle.canPlayMusic = classBlacklist.music ~= nil and classBlacklist.music or true
    end
    
    -- Check by vehicle model
    local modelHash = GetEntityModel(Player.vehicle.vehicle)
    local modelBlacklist = Config.BlacklistedVehicles.models[modelHash]
    if modelBlacklist ~= nil then
        Player.vehicle.isBlacklisted = modelBlacklist.carhud or false
        Player.vehicle.ignoreBelt = modelBlacklist.belt or false
        Player.vehicle.canPlayMusic = modelBlacklist.music ~= nil and modelBlacklist.music or true
    end
end

-- Update Vehicle Class Info
local function updateVehicleClass()
    if Player.vehicle.vehicle then
        Player.vehicle.class = GetVehicleClass(Player.vehicle.vehicle)
        Player.vehicle.isBoat = Player.vehicle.class == 14
        Player.vehicle.isPlane = Player.vehicle.class == 15
    end
end

-- Update Vehicle Information
local function updateVehicleInfo()
    local playerPed = PlayerPedId()
    local vehicle = GetVehiclePedIsIn(playerPed, false)
    
    if vehicle and vehicle ~= 0 then
        Player.vehicle.vehicle = vehicle
        Player.vehicle.seat = getCurrentSeat()
        updateVehicleClass()
        checkVehicleBlacklist()
        
        SendNUIMessage({
            type = "UPDATE_PLAYER_CAR",
            vehicle = Player.vehicle.isBlacklisted and 0 or Player.vehicle.vehicle
        })
        
        SendNUIMessage({
            type = "UPDATE_PLAYER_SEAT",
            seat = Player.vehicle.seat
        })
    end
end

-- Update Current Weapon
local function updateCurrentWeapon()
    local playerPed = PlayerPedId()
    local weaponHash = GetSelectedPedWeapon(playerPed)
    
    if weaponHash and weaponHash ~= 0 then
        Player.weapon.hash = weaponHash
        Player.weapon.name = Weapons[weaponHash]?.label or "Unknown Weapon"
    end
end

-- ============================================================================
-- MAP FUNCTIONS
-- ============================================================================

-- Get Closest Aspect Ratio
local function getClosestAspectRatio(currentRatio)
    local aspectRatios = {
        {ratio = 1.77778, label = "16:9"},
        {ratio = 1.6, label = "16:10"},
        {ratio = 2.33333, label = "21:9"},
        {ratio = 2.3703, label = "21:9"},
        {ratio = 1.33333, label = "4:3"},
        {ratio = 1.25, label = "5:4"},
        {ratio = 1.66667, label = "5:3"}
    }
    
    local closest = nil
    local minDiff = math.huge
    
    for _, ar in ipairs(aspectRatios) do
        local diff = math.abs(currentRatio - ar.ratio)
        if diff < minDiff then
            minDiff = diff
            closest = ar
        end
    end
    
    return closest
end

-- Calculate Map Offset
local function calculateMapOffset(aspectData)
    local baseRatio = 1.77778
    
    if aspectData.ratio < baseRatio then
        return (1 - (aspectData.ratio / baseRatio)) * 0.5
    else
        return ((aspectData.ratio / baseRatio) - 5.61) * 0.25
    end
end

-- Position Minimap Components
local function positionMinimapComponents(aspectData)
    local baseRatio = 1.77778
    local offset = calculateMapOffset(aspectData)
    
    local resWidth, resHeight = 1920, 1080
    local actualWidth, actualHeight = GetActiveScreenResolution()
    
    local mapFactor, mapFactorY = Config.MapFactor.getFactor(
        string.format("%sx%s", actualWidth, actualHeight),
        Player.customizations.mapType
    )
    
    local normalizedX = Player.customizations.mapPosition.normalized.x
    local normalizedY = Player.customizations.mapPosition.normalized.y
    
    if normalizedX and normalizedY and mapFactor ~= nil and mapFactorY ~= nil then
        local scaleX = actualWidth / resWidth
        local scaleY = actualHeight / resHeight
        
        local mapWidth = Player.customizations.mapType == "square" and 0.14 or 0.165
        local mapHeight = Player.customizations.mapType == "square" and 0.18 or 0.25
        
        local posX = normalizedX - (mapWidth / mapFactor)
        local posY = normalizedY - ((scaleY * resHeight) / mapFactorY)
        
        local maskWidth = Player.customizations.mapType == "square" and 0.128 or 0.115
        local maskHeight = Player.customizations.mapType == "square" and 0.5 or 0.2
        
        local blurWidth = Player.customizations.mapType == "square" and 0.22 or 0.17
        local blurHeight = Player.customizations.mapType == "square" and 0.275 or 0.225
        
        SetMinimapComponentPosition("minimap", "L", "B", posX, posY, mapWidth, mapHeight)
        SetMinimapComponentPosition("minimap_mask", "L", "B", posX, posY, maskWidth, maskHeight)
        SetMinimapComponentPosition("minimap_blur", "L", "B", posX, posY, blurWidth, blurHeight)
    else
        -- Default positioning logic
        local offsetX = Player.customizations.mapType == "square" and -0.0025 or -0.02
        local offsetY = Player.customizations.mapType == "square" and -0.045 or -0.045
        
        local mapWidth = Player.customizations.mapType == "square" and 0.14 or 0.17
        local mapHeight = Player.customizations.mapType == "square" and 0.18 or 0.225
        
        if aspectData.ratio < baseRatio then
            offsetX = offsetX - ((baseRatio - aspectData.ratio) * 0.0)
        elseif aspectData.ratio > baseRatio then
            offsetX = offsetX + (offset * 0.16)
        end
        
        local scaleX = aspectData.ratio / baseRatio
        local scaleY = 1
        
        local scaledMapWidth = mapWidth * scaleX
        local scaledMapHeight = mapHeight * scaleY
        
        local maskWidth, maskHeight, blurWidth, blurHeight
        
        if Player.customizations.mapType == "square" then
            maskWidth = 0.128 * scaleX
            maskHeight = 0.5 * scaleY
            blurWidth = 0.22 * scaleX
            blurHeight = 0.275 * scaleY
        else
            maskWidth = 0.115 * scaleX
            maskHeight = 0.2 * scaleY
            blurWidth = 0.17 * scaleX
            blurHeight = 0.225 * scaleY
        end
        
        SetMinimapComponentPosition("minimap", "L", "B", offsetX, offsetY, scaledMapWidth, scaledMapHeight)
        SetMinimapComponentPosition("minimap_mask", "L", "B", offsetX, offsetY, maskWidth, maskHeight)
        SetMinimapComponentPosition("minimap_blur", "L", "B", offsetX, offsetY, blurWidth, blurHeight)
    end
    
    Config.Debug("[^2INFO - MAP^0] Minimap positions calculated successfully (dynamic, resolution-independent).")
end

-- Initialize Map
function InitMap()
    if Player.customizations.mapType == "square" then
        Config.Debug("[^2INFO - MAP^0] Using square map.")
        
        RequestStreamedTextureDict("squaremap", false)
        while not HasStreamedTextureDictLoaded("squaremap") do
            Wait(150)
        end
        
        SetMinimapClipType(0)
        
        AddReplaceTexture(
            "platform:/textures/graphics",
            "radarmasksm",
            "squaremap",
            Player.customizations.mapRadius and "radarmasksmr" or "radarmasksm"
        )
        
        positionMinimapComponents(getClosestAspectRatio(aspectRatio))
        
        local scaleform = RequestScaleformMovie("minimap")
        while not HasScaleformMovieLoaded(scaleform) do
            scaleform = RequestScaleformMovie("minimap")
            Wait(0)
        end
        
        SetBlipAlpha(GetNorthRadarBlip(), 0)
        SetRadarBigmapEnabled(true, false)
        SetMinimapClipType(0)
        SetRadarBigmapEnabled(false, false)
        
        Wait(2500)
        
        if IsBigmapActive() then
            SetRadarBigmapEnabled(false, false)
            SetBigmapActive(false, false)
        end
    else
        Config.Debug("[^2INFO - MAP^0] Using circle map.")
        
        RequestStreamedTextureDict("circlemap", false)
        while not HasStreamedTextureDictLoaded("circlemap") do
            Wait(150)
        end
        
        SetMinimapClipType(0)
        AddReplaceTexture("platform:/textures/graphics", "radarmasksm", "circlemap", "radarmasksm")
        
        positionMinimapComponents(getClosestAspectRatio(aspectRatio))
        
        local scaleform = RequestScaleformMovie("minimap")
        while not HasScaleformMovieLoaded(scaleform) do
            scaleform = RequestScaleformMovie("minimap")
            Wait(0)
        end
        
        SetBlipAlpha(GetNorthRadarBlip(), 0)
        SetMinimapClipType(1)
        SetRadarBigmapEnabled(true, false)
        SetRadarBigmapEnabled(false, false)
        
        Wait(2500)
        
        if IsBigmapActive() then
            SetRadarBigmapEnabled(false, false)
            SetBigmapActive(false, false)
        end
    end
    
    Config.Debug("[^2INFO - MAP^0] Map loaded successfully.")
end

-- ============================================================================
-- VEHICLE FUNCTIONS
-- ============================================================================

-- Update Vehicle Doors and Seats
local function updateVehicleDoorsAndSeats()
    local doorCount = GetNumberOfVehicleDoors(Player.vehicle.vehicle)
    local doors = {}
    local seats = {}
    
    if doorCount < 5 then
        doorCount = doorCount + 1
    end
    
    for i = 0, doorCount do
        local doorAngle = GetVehicleDoorAngleRatio(Player.vehicle.vehicle, i)
        doors[i] = doorAngle > 0.0
    end
    
    local minSeat = -1
    local maxSeats = GetVehicleModelNumberOfSeats(GetEntityModel(Player.vehicle.vehicle))
    
    for seat = minSeat, maxSeats do
        local isFree = IsVehicleSeatFree(Player.vehicle.vehicle, seat)
        seats[tostring(seat)] = {
            usable = true,
            free = isFree
        }
    end
    
    Player.vehicle.doors = doors
    Player.vehicle.seats = seats
end

-- Open Car Control Menu
local function openCarControlMenu()
    if isCarControlOpen then
        Config.Debug("[^1ERROR - CAR CONTROL^0] Car control menu is already open.")
        return
    end
    
    isCarControlOpen = true
    SetNuiFocus(true, true)
    
    if Config.Commands.carcontrol.mouseControl then
        SetNuiFocusKeepInput(true)
    end
    
    SendNUIMessage({
        type = "OPEN_CAR_CONTROL"
    })
end

-- Get Compass Direction
local function getCompassDirection(heading)
    local index = math.floor((heading % 360 + 22.5) / 45) % 8 + 1
    return compassDirections[index]
end

-- Close Car Control Menu
function closeCarControlMenu()
    if not isCarControlOpen then
        Config.Debug("[^1ERROR - CAR CONTROL^0] Car control menu is not open.")
        return
    end
    
    isCarControlOpen = false
    SetNuiFocus(false, false)
    
    if Config.Commands.carcontrol.mouseControl then
        SetNuiFocusKeepInput(false)
    end
    
    SendNUIMessage({
        type = "CLOSE_CAR_CONTROL"
    })
end

-- ============================================================================
-- HUD INITIALIZATION
-- ============================================================================

function InitHud()
    Config.Debug("[^2INFO^0] Initializing HUD.")
    
    -- HUD hiding is handled by continuous thread below
    
    -- Wait for NUI to be ready
    while not nuiState.ready do
        nuiState.timer = nuiState.timer - 1000
        
        if nuiState.timer <= 0 then
            Config.Debug("[^1ERROR - NUI^0] is not ready, please check your NUI files.")
            break
        end
        
        Wait(1000)
    end
    
    Config.Debug("[^2INFO - NUI^0] is ready, starting to use")
    nuiState.timer = 150000.0
    
    -- Send default variables to NUI
    SendNUIMessage({
        type = "SET_DEFAULT_VERIABLES",
        language = Config.Language,
        quickClose = Config.Commands.carcontrol.key,
        disableMusicSystem = Config.MusicSystem.disable,
        mapAllways = Config.ShowMapOnFoot,
        editorClose = Config.Commands.editor.closeKey,
        showPostal = Config.PostalMap.showNearPostal,
        stress = Config.StressSystem,
        totalRange = Config.VoiceSettings.totalRange,
        currRange = Config.VoiceSettings.defaultRange,
        disableRightCorner = Config.DisableRightCorner,
        disableMapAnimation = Config.DisableMapAnimation
    })
    
    -- Set player ID
    SendNUIMessage({
        type = "SET_PLAYER_ID",
        id = GetPlayerServerId(Player.pId)
    })
    
    -- Get active players
    lib.callback("wais:hudv6:server:activePlayers", false, function(data)
        SendNUIMessage({
            type = "SET_ACTIVE_PLAYERS",
            max = data.max,
            current = data.current
        })
    end)
    
    -- Show UI
    SendNUIMessage({
        type = "SHOW_UI"
    })
    
    updateCurrentWeapon()
    updateVehicleInfo()
    InitMap()
    InitRadar()
    
    -- HUD hiding thread is already running (started at resource start)
end

-- Initialize Radar Display
function InitRadar()
    if hideStates.radar then
        return DisplayRadar(false)
    end
    
    if Player.cinematic then
        return DisplayRadar(false)
    end

    if Config.ShowMapOnFoot then
      return DisplayRadar(true)
    elseif Player.vehicle.vehicle > 0 then
        return DisplayRadar(true)
    end
    
    return DisplayRadar(false)
end

-- Mark Nearest Coordinate
function markNearCoord(locationType)
    local playerPed = PlayerPedId()
    local playerCoords = GetEntityCoords(playerPed)
    local locations = Location[locationType]
    
    local nearestLocation = {
        coord = vector3(0, 0, 0),
        dist = math.huge
    }
    
    for _, coord in pairs(locations) do
        local distance = #(playerCoords - coord)
        if distance < nearestLocation.dist then
            nearestLocation.dist = distance
            nearestLocation.coord = coord
        end
    end
    
    if nearestLocation.dist < math.huge then
        Config.Notification(
            nil,
            Lang("marked_nearby_location", locationType),
            "success",
            5000
        )
        return SetNewWaypoint(nearestLocation.coord.x, nearestLocation.coord.y)
    end
    
    Config.Notification(
        nil,
        Lang("cant_find_location"),
        "error",
        5000
    )
end

-- Change UI Show State
function changeUIshowState(shouldHide)
    if not wFramework.PlayerLoaded then
        Config.Debug("[^1ERROR - UI^0] Player is not loaded, cannot change UI state.")
        return
    end
    
    hideStates.hud = shouldHide
    
    if shouldHide then
        Player.cinematic = false
        SendNUIMessage({
            type = "HIDE_UI"
        })
    else
        SendNUIMessage({
            type = "SHOW_UI"
        })
    end
end

-- Toggle Cinematic Mode
function toggleCinematic(state)
    Player.cinematic = state
    SendNUIMessage({
        type = "TOGGLE_CINEMATIC",
        cinematic = state
    })
    InitRadar()
end

-- ============================================================================
-- SETTINGS MENU FUNCTIONS
-- ============================================================================

-- Open Settings Menu
function openSettings()
    if isEditorModeOpen then
        Config.Debug("[^1ERROR - SETTINGS^0] Editor mode is open, please close it first.")
        return
    end
    
    if settingsMenuOpen then
        Config.Debug("[^1ERROR - SETTINGS^0] Settings menu is already open.")
        return
    end
    
    settingsMenuOpen = true
    SetNuiFocus(true, true)
    
    SendNUIMessage({
        type = "TOGGLE_SETTINGS",
        state = settingsMenuOpen
    })
end

-- Close Settings Menu
function closeSettings()
    if not settingsMenuOpen then
        Config.Debug("[^1ERROR - SETTINGS^0] Settings menu is not open.")
        return
    end
    
    settingsMenuOpen = false
    SetNuiFocus(false, false)
    
    SendNUIMessage({
        type = "TOGGLE_SETTINGS",
        state = settingsMenuOpen
    })
end

-- ============================================================================
-- EDITOR MODE FUNCTIONS
-- ============================================================================

-- Open Editor Mode
function openEditorMode()
    if Player.cinematic then
        Config.Debug("[^1ERROR - EDITOR MODE^0] Cinematic mode is enabled, please disable it first.")
        return
    end
    
    if settingsMenuOpen then
        Config.Debug("[^1ERROR - EDITOR MODE^0] Settings menu is open, please close it first.")
        return
    end
    
    if isEditorModeOpen then
        Config.Debug("[^1ERROR - EDITOR MODE^0] Editor mode is already open.")
        return
    end
    
    isEditorModeOpen = true
    SetNuiFocus(true, true)
    
    SendNUIMessage({
        type = "TOGGLE_EDITOR_MODE",
        state = isEditorModeOpen
    })
end

-- Close Editor Mode
function closeEditorMode()
    if not isEditorModeOpen then
        Config.Debug("[^1ERROR - EDITOR MODE^0] Editor mode is not open.")
        return
    end
    
    isEditorModeOpen = false
    SetNuiFocus(false, false)
    
    SendNUIMessage({
        type = "TOGGLE_EDITOR_MODE",
        state = isEditorModeOpen
    })
end

-- ============================================================================
-- LIBRARY CACHE HANDLERS
-- ============================================================================

-- Vehicle Cache Handler
lib.onCache("vehicle", function(newVehicle, oldVehicle)
    Player.vehicle.vehicle = type(newVehicle) == "boolean" and 0 or newVehicle
    
    if type(newVehicle) == "boolean" then
        -- Player exited vehicle
        Player.vehicle.seat = -1
        Player.vehicle.speed = 0
        Player.vehicle.class = 0
        Player.vehicle.belt = false
        Player.vehicle.ignoreBelt = false
        Player.vehicle.isBlacklisted = false
        Player.vehicle.isBoat = false
        Player.vehicle.isPlane = false
        Player.vehicle.canPlayMusic = true
        Player.vehicle.doors = {}
        Player.vehicle.seats = {}
        
        -- Handle music
        if Player.vehicle.soundData ~= nil then
            if xSound:soundExists(Player.vehicle.soundData.id) then
                if Player.vehicle.soundData.play then
                    xSound:Pause(Player.vehicle.soundData.id)
                end
            end
        end
        
        InitRadar()
        closeCarControlMenu()
        resetBelt()
        
        -- Turn off radio if using Q key
        if Config.Commands.carcontrol.key == "Q" then
            SetVehRadioStation(Player.vehicle.vehicle, "OFF")
        end
    else
        -- Player entered vehicle
        if Player.vehicle.soundData ~= nil then
            if Player.vehicle.soundData.play then
                if xSound:soundExists(Player.vehicle.soundData.id) then
                    xSound:Resume(Player.vehicle.soundData.id)
                end
            end
            
            SendNUIMessage({
                type = "UPDATE_VEHICLE_SOUND",
                data = Player.vehicle.soundData
            })
        end
        
        InitRadar()
        updateVehicleClass()
        checkVehicleBlacklist()
    end
    
    SendNUIMessage({
        type = "UPDATE_PLAYER_CAR",
        vehicle = Player.vehicle.isBlacklisted and 0 or Player.vehicle.vehicle
    })
end)

-- Weapon Cache Handler
lib.onCache("weapon", function(newWeapon)
    if newWeapon then
        Player.weapon.hash = newWeapon
        Player.weapon.name = Weapons[newWeapon]?.label or tostring(newWeapon)
    else
        Player.weapon.hash = -1569615261
        Player.weapon.name = Weapons[-1569615261]?.label or "Fists"
    end
end)

-- Seat Cache Handler
lib.onCache("seat", function(newSeat)
    Player.vehicle.seat = newSeat
    
    SendNUIMessage({
        type = "UPDATE_PLAYER_SEAT",
        seat = Player.vehicle.seat
    })
end)

-- ============================================================================
-- KEYBIND REGISTRATION
-- ============================================================================

-- Car Control Keybind
if not Config.Commands.carcontrol.disableKey then
    carControlKeybind = lib.addKeybind({
        name = Config.Commands.carcontrol.command,
        description = Config.Commands.carcontrol.description,
        defaultKey = Config.Commands.carcontrol.key,
        onPressed = function(self)
            if not Config.Commands.carcontrol.disabled then
                if Player.vehicle.vehicle > 0 and not Player.dead then
                    openCarControlMenu()
                end
            end
        end
    })
end

-- ============================================================================
-- COMMAND REGISTRATION
-- ============================================================================

function InitHudCommands()
    while not Config do
        Wait(0)
    end
    
    -- Settings Command
    if not Config.Commands.settings.disabled then
        if Config.Commands.settings.keymapping.usable then
            settingsKeybind = lib.addKeybind({
                name = Config.Commands.settings.keymapping.command,
                description = Config.Commands.settings.keymapping.description,
                defaultKey = Config.Commands.settings.keymapping.key,
                onPressed = function(self)
                    if not Config.Commands.settings.disabled and not Player.dead then
                        openSettings()
                    end
                end
            })
        else
            RegisterCommand(Config.Commands.settings.keymapping.command, function()
                if not Config.Commands.settings.disabled and not Player.dead then
                    openSettings()
                end
            end)
        end
    end
    
    -- Cinematic Command
    if not Config.Commands.cinematic.disabled then
        RegisterCommand(Config.Commands.cinematic.command, function()
            if wFramework.playerLoaded and nuiState.ready then
                Player.cinematic = not Player.cinematic
                toggleCinematic(Player.cinematic)
                
                if Player.cinematic then
                    Config.Debug("[^2INFO - CINEMATIC^0] Cinematic mode enabled.")
                else
                    Config.Debug("[^2INFO - CINEMATIC^0] Cinematic mode disabled.")
                end
            else
                Config.Debug("[^1ERROR - CINEMATIC^0] Player is not loaded or NUI is not ready.")
            end
        end)
    end
    
    -- Editor Command
    if not Config.Commands.editor.disabled then
        if Config.Commands.editor.keymapping.usable then
            editorKeybind = lib.addKeybind({
                name = Config.Commands.editor.keymapping.command,
                description = Config.Commands.editor.keymapping.description,
                defaultKey = Config.Commands.editor.keymapping.key,
                onPressed = function(self)
                    if not Config.Commands.editor.disabled and not Player.dead then
                        openEditorMode()
                    end
                end
            })
        else
            RegisterCommand(Config.Commands.editor.keymapping.command, function()
                if not Config.Commands.editor.disabled and not Player.dead then
                    openEditorMode()
                end
            end)
        end
    end
end

-- ============================================================================
-- MAIN THREADS
-- ============================================================================

-- Main Status Update Thread
CreateThread(function()
    while true do
        local sleepTime = 1000
        local playerPed = PlayerPedId()
        
        if wFramework.PlayerLoaded and next(Player.customizations) then
            local currentHour = GetClockHours()
            local maxHealth = GetEntityMaxHealth(playerPed)
            local isInWater = IsEntityInWater(playerPed)
            
            -- Calculate health
            local health = maxHealth == 175 and GetEntityHealth(playerPed) + 25 - 100 or GetEntityHealth(playerPed) - 100
            health = health or 0
            
            local armour = GetPedArmour(playerPed)
            
            -- Calculate stamina
            local stamina = math.floor(
                isInWater and (GetPlayerUnderwaterTimeRemaining(Player.pId) * 10)
                or (100 - GetPlayerSprintStaminaRemaining(Player.pId))
            )
            wFramework.Status.stamina = stamina
            
            -- Update weapon ammo
            if Player.weapon.hash ~= -1569615261 then
                Player.weapon.ammo = GetAmmoInPedWeapon(playerPed, Player.weapon.hash)
                local _, clip = GetAmmoInClip(playerPed, Player.weapon.hash)
                Player.weapon.clip = clip
            end
            
            -- Vehicle updates
            if Player.vehicle.vehicle > 0 then
                if not Player.vehicle.isBlacklisted then
                    sleepTime = Config.RefreshTimes.carhud[Player.customizations.performance]
                    
                    local speed = GetEntitySpeed(Player.vehicle.vehicle)
                    local fuel = Config.GetVehicleFuel(Player.vehicle.vehicle)
                    local rpm = GetVehicleCurrentRpm(Player.vehicle.vehicle)
                    local engineHealth = GetVehicleEngineHealth(Player.vehicle.vehicle)
                    
                    local gear = 0
                    local maxGear = 0
                    local attitude = 0
                    local altitude = 0
                    local heading = 0
                    local depth = 0
                    local lightsState = nil
                    local lightsOn = 0
                    local highBeams = 0
                    local isEngineOn = IsVehicleEngineOn(Player.vehicle.vehicle)
                    
                    Player.vehicle.speed = speed
                    
                    -- Get style-specific features
                    local styleFeatures = vehicleStyleFeatures[Player.customizations.carhud.style]
                    if styleFeatures ~= nil then
                        if Player.vehicle.isBoat and styleFeatures.boat then
                            heading = GetEntityHeading(Player.vehicle.vehicle)
                            depth = GetEntityHeightAboveGround(Player.vehicle.vehicle)
                        end
                        
                        if Player.vehicle.isPlane and styleFeatures.plane then
                            local rotation = GetEntityRotation(playerPed, 2)
                            attitude = rotation.y
                            altitude = GetEntityHeightAboveGround(Player.vehicle.vehicle)
                        end
                        
                        if styleFeatures.gears then
                            gear = GetVehicleCurrentGear(Player.vehicle.vehicle)
                            maxGear = GetVehicleHighGear(Player.vehicle.vehicle)
                        end
                    end
                    
                    -- Update car control menu if open
                    if isCarControlOpen then
                        updateVehicleDoorsAndSeats()
                        SendNUIMessage({
                            type = "UPDATE_CAR_CONTROL",
                            doors = Player.vehicle.doors,
                            seats = Player.vehicle.seats
                        })
                    end
                    
                    -- Get lights state
                    if not Player.vehicle.isBoat and not Player.vehicle.isPlane then
                        lightsState, lightsOn, highBeams = GetVehicleLightsState(Player.vehicle.vehicle)
                    end
                    
                    -- Send vehicle status to NUI
                    SendNUIMessage({
                        type = "UPDATE_CAR_STATUS",
                        speed = speed,
                        fuel = fuel,
                        rpm = rpm,
                        gear = gear,
                        maxGear = maxGear,
                        attitude = attitude,
                        altitude = altitude,
                        heading = heading,
                        depth = depth,
                        belt = Player.vehicle.belt,
                        engine = isEngineOn,
                        lights = lightsOn or highBeams,
                        aircraft = Player.vehicle.isPlane,
                        watercraft = Player.vehicle.isBoat,
                        health = engineHealth
                    })
                end
            else
                sleepTime = Config.RefreshTimes.status[Player.customizations.performance]
            end
            
            -- Handle pause menu
            if not hideStates.hud then
                if Player.pausemenu then
                    if not IsPauseMenuActive() then
                        Player.pausemenu = false
                        SendNUIMessage({
                            type = "PAUSE_MENU",
                            state = false
                        })
                    end
                elseif not Player.pausemenu then
                    if IsPauseMenuActive() then
                        Player.pausemenu = true
                        SendNUIMessage({
                            type = "PAUSE_MENU",
                            state = true
                        })
                    end
                end
            end
            
            -- Update time
            SendNUIMessage({
                type = "UPDATE_TIME",
                time = currentHour
            })
            
            -- Update player status
            SendNUIMessage({
                type = "UPDATE_PLAYER_STATUS",
                health = Player.dead and 0 or (health > 100 and 100 or (health < 0 and 0 or health)),
                armour = armour,
                hunger = wFramework.Status.hunger,
                thirst = wFramework.Status.thirst,
                stress = wFramework.Status.stress,
                stamina = wFramework.Status.stamina,
                inwater = isInWater
            })
            
            -- Update weapon info
            SendNUIMessage({
                type = "UPDATE_PLAYER_WEAPON",
                name = Player.weapon.name,
                hash = Player.weapon.hash,
                ammo = Player.weapon.ammo,
                clip = Player.weapon.ammo - Player.weapon.clip
            })
            
            -- Update microphone status (if PMA Voice is active)
            if hasPMAVoice then
                SendNUIMessage({
                    type = "UPDATE_MIC",
                    state = MumbleIsPlayerTalking(Player.pId),
                    radio = Player.voice.radio
                })
            end
        end
        
        Wait(sleepTime)
    end
end)

-- Compass and Street Name Thread
CreateThread(function()
    while true do
        local sleepTime = 1000
        local playerPed = PlayerPedId()
        local coords = GetEntityCoords(playerPed)
        local heading = GetEntityHeading(playerPed)
        
        if wFramework.playerLoaded then
            if Config.ShowMapOnFoot or Player.vehicle.vehicle > 0 then
                if next(Player.customizations) then
                    sleepTime = Config.RefreshTimes.compass[Player.customizations.performance]
                    
                    -- Street names removed - set to empty
                    local streetHash, crossingHash = GetStreetNameAtCoord(coords.x, coords.y, coords.z)
                    local streetName = "" -- Removed: GetStreetNameFromHashKey(streetHash)
                    local crossingName = "" -- Removed: GetStreetNameFromHashKey(crossingHash)
                    
                    SendNUIMessage({
                        type = "UPDATE_COMPASS",
                        compass = getCompassDirection(heading),
                        title = "", -- Street name removed
                        subtitle = "" -- Crossing name removed
                    })
                    
                    -- Update postal code
                    if Config.PostalMap.showNearPostal then
                        if Postals and #Postals > 0 then
                            local nearestPostal = nil
                            local minDistance = math.huge
                            
                            for i = 1, #Postals do
                                local postal = Postals[i]
                                local distance = #(vector2(coords.x, coords.y) - vector2(postal.x, postal.y))
                                
                                if distance < minDistance then
                                    minDistance = distance
                                    nearestPostal = postal
                                end
                            end
                            
                            if nearestPostal then
                                SendNUIMessage({
                                    type = "UPDATE_POSTAL",
                                    postal = nearestPostal.code
                                })
                            end
                        end
                    end
                end
            end
        end
        
        Wait(sleepTime)
    end
end)

-- Belt Alarm Thread
CreateThread(function()
    while true do
        local sleepTime = Config.RefreshTimes.sysControllers.beltAlarm
        
        if Player.vehicle.vehicle > 0 then
            if not Player.vehicle.ignoreBelt and not Config.Commands.belt.disabled then
                if not Player.vehicle.belt then
                    if Config.Commands.belt.notification then
                        Config.Notification(
                            Lang("belt"),
                            Lang("plug_belt_err"),
                            "warning",
                            5000
                        )
                    end
                    TriggerEvent("InteractSound_CL:PlayOnOne", "beltalarm", 0.25)
                end
            end
        end
        
        Wait(sleepTime)
    end
end)

-- Status Alert Thread (Optional)
if Config.SendStatusAlert then
    CreateThread(function()
        while true do
            local sleepTime = 1000
            
            if wFramework.playerLoaded then
                sleepTime = Config.RefreshTimes.statusControl
                
                if wFramework.Status.hunger <= 20 or wFramework.Status.thirst <= 20 then
                    local message = ""
                    
                    if wFramework.Status.hunger <= 20 then
                        message = Lang("hunger_low")
                    end
                    
                    if wFramework.Status.thirst <= 20 then
                        message = message .. ((message ~= "") and " " or "") .. Lang("thirst_low")
                    end
                    
                    Config.Notification(
                        Lang("status_alert"),
                        message,
                        "warning",
                        5000
                    )
                end
            end
            
            Wait(sleepTime)
        end
    end)
end

-- Music Duration Thread
if not Config.MusicSystem.disabled then
    CreateThread(function()
        while true do
            local sleepTime = 1000
            
            if Player.vehicle.soundData ~= nil and Player.vehicle.soundData then
                if Player.vehicle.soundData.play then
                    Player.vehicle.soundData.duration = (Player.vehicle.soundData.duration or 0) + (sleepTime / 1000)
                end
                
                local maxDuration = parseDuration(Player.vehicle.soundData.maxDuration or "PT0M")
                local currentDuration = Player.vehicle.soundData.duration or 0
                
                if currentDuration >= maxDuration then
                    if xSound:soundExists(Player.vehicle.soundData.id) then
                        xSound:Destroy(Player.vehicle.soundData.id)
                    end
                    
                    Player.vehicle.soundData.duration = 0
                    Player.vehicle.soundData = nil
                    
                    SendNUIMessage({
                        type = "UPDATE_VEHICLE_SOUND_DEFAULT"
                    })
                end
            end
            
            Wait(sleepTime)
        end
    end)
end

-- Car Control Open Event (Optional)
if Config.Commands.carcontrol.openevent ~= nil and Config.Commands.carcontrol.openevent ~= "" then
    RegisterNetEvent(Config.Commands.carcontrol.openevent, function()
        if not Config.Commands.carcontrol.disabled then
            if Player.vehicle.vehicle > 0 and not Player.dead then
                openCarControlMenu()
            end
        end
    end)
end

-- Screen Resolution Monitor Thread
CreateThread(function()
    while true do
        local sleepTime = Config.RefreshTimes.sysControllers.screenRes
        
        local x, y = GetActiveScreenResolution()
        
        SendNUIMessage({
            type = "CAN_EDIT_MAP",
            state = Config.MapFactor.getFactor(string.format("%sx%s", x, y), "square") ~= nil
        })
        
        if next(Player.customizations) ~= nil and wFramework.playerLoaded then
            local currentAspectRatio = GetAspectRatio(false)
            
            if aspectRatio ~= currentAspectRatio then
                aspectRatio = currentAspectRatio
                InitMap()
            end
            
            if screenResolution.x < x then
                screenResolution.x = x
                screenResolution.y = y
                InitMap()
            end
        end
        
        Wait(sleepTime)
    end
end)

-- Control Disable Thread
CreateThread(function()
    while true do
        local sleepTime = 1000
        
        if Player.vehicle.vehicle > 0 or Config.ShowMapOnFoot then
            if Config.PostalMap.enabled then
                sleepTime = 10
                SetRadarZoom(1100)
            end
            
            if Player.vehicle.vehicle > 0 then
                sleepTime = 10
                lib.disableControls()
                
                if Config.Commands.carcontrol.key == "Q" then
                    SetUserRadioControlEnabled(false)
                end
            end
        end
        
        Wait(sleepTime)
    end
end)

-- Radar and Gang Script Thread
CreateThread(function()
    while true do
        local sleepTime = 1000
        
        if wFramework.playerLoaded then
            InitRadar()
            
            if IsBigmapActive() then
                SetRadarBigmapEnabled(false, false)
                SetBigmapActive(false, false)
            end
            
            if wFramework.GangScript ~= nil and wFramework.GetGangFromScript ~= nil then
                wFramework.GetGangFromScript()
            end
        end
        
        Wait(sleepTime)
    end
end)

-- ============================================================================
-- EXPORTS
-- ============================================================================

-- Show/Hide Radar Export
exports("showRadar", function(state)
    if type(state) ~= "boolean" then
        Config.Debug("[^EXPORT - SHOW RADAR^0] Invalid argument type, expected boolean.")
        return nil
    end
    
    hideStates.radar = state
    InitRadar()
    return true
end)

-- Show/Hide HUD Export
exports("showHud", function(state)
    if type(state) ~= "boolean" then
        Config.Debug("[^EXPORT - SHOW HUD^0] Invalid argument type, expected boolean.")
        return nil
    end
    
    changeUIshowState(state)
    return true
end)

-- Cinematic Mode Export
exports("cinematic", function(state)
    if type(state) ~= "boolean" then
        Config.Debug("[^EXPORT - CINEMATIC^0] Invalid argument type, expected boolean.")
        return nil
    end
    
    toggleCinematic(state)
    return true
end)

-- Get Customizations Export
exports("customizations", function(element)
    if type(element) ~= "string" then
        Config.Debug("[^EXPORT - CUSTOMIZATIONS^0] Invalid argument type, expected string.")
        return nil
    end
    
    if element == "carhud" then
        return {
            style = Player.customizations.carhud.style,
            speed = Player.customizations.carhud.speedType,
            behaviors = Player.customizations.carhud.behaviors[Player.customizations.carhud.style]
        }
    elseif element == "status" then
        return {
            style = Player.customizations.status.style,
            behaviors = Player.customizations.status.behaviors[Player.customizations.status.style]
        }
    elseif element == "rightCorner" then
        return {
            style = Player.customizations.rightCorner.style,
            behaviors = Player.customizations.rightCorner.colors
        }
    elseif element == "map" then
        return {
            type = Player.customizations.mapType,
            radius = Player.customizations.mapRadius,
            position = Player.customizations.mapPosition
        }
    elseif element == "song" then
        return Player.vehicle.soundData or nil
    else
        Config.Debug("[^EXPORT - CUSTOMIZATIONS^0] Invalid element type, expected 'carhud', 'status', 'rightCorner', 'map', or 'song'.")
        return nil
    end
end)

-- Open Car Control Export
exports("openCarcontrol", function()
    if not Config.Commands.carcontrol.disabled then
        if Player.vehicle.vehicle > 0 and not Player.dead then
            openCarControlMenu()
            return true
        end
    end
    return false
end)