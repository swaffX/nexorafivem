-- =====================================================
--  decrypted by https://discord.gg/6NCbAv2VNK 𝐀𝐤 𝐋𝐞𝐚𝐤𝐬 
--		Cleaned By Said Ak Using Claude Sonnet 4.5
-- =====================================================

-- ============================================================================
-- WAIS HUD V6 - Server Script
-- ============================================================================

-- ============================================================================
-- DEATH STATUS EVENTS
-- ============================================================================

-- OSP Ambulance Death Status
RegisterNetEvent("osp_amblance:setDeathStatus", function(isDead)
    local playerId = source
    changeDeadStatus(playerId, isDead)
end)

-- ESX Ambulance Death Status
RegisterNetEvent("esx_ambulancejob:setDeathStatus", function(isDead)
    local playerId = source
    changeDeadStatus(playerId, isDead)
end)

-- QB Hospital Death Status
RegisterNetEvent("hospital:server:SetDeathStatus", function(isDead)
    local playerId = source
    changeDeadStatus(playerId, isDead)
end)

-- QB Hospital Laststand Status
RegisterNetEvent("hospital:server:SetLaststandStatus", function(isDead)
    local playerId = source
    changeDeadStatus(playerId, isDead)
end)

-- Wasabi Ambulance Death Status
RegisterNetEvent("wasabi_ambulance:setDeathStatus", function(status, data)
    local playerId = source
    local isDead = false
    
    if status == "dead" or status == "laststand" then
        isDead = true
    end
    
    changeDeadStatus(playerId, isDead)
end)

-- ============================================================================
-- CALLBACKS
-- ============================================================================

-- Get Active Players Callback
lib.callback.register("wais:hudv6:server:activePlayers", function()
    local currentPlayers = #GetPlayers()
    local maxPlayers = GetConvarInt("sv_maxclients", 32)
    
    return {
        max = maxPlayers,
        current = currentPlayers
    }
end)

-- ============================================================================
-- FUNCTIONS
-- ============================================================================

-- Change Death Status
function changeDeadStatus(playerId, isDead)
    if isDead ~= nil then
        TriggerClientEvent("wais:hudv6:client:setDead", playerId, isDead)
    end
end

-- ============================================================================
-- THREADS
-- ============================================================================

-- Player Count Update Thread
CreateThread(function()
    while true do
        local currentPlayers = #GetPlayers()
        local maxPlayers = GetConvarInt("sv_maxclients", 32)
        
        TriggerClientEvent("wais:hudv6:client:updatePlayers", -1, currentPlayers, maxPlayers)
        
        Wait(Config.RefreshTimes.players)
    end
end)

-- Seatbelt Conflict Detection Thread
CreateThread(function()
    -- Enable fly through windscreen
    SetConvarReplicated("game_enableFlyThroughWindscreen", "true")
    
    -- Check for conflicting scripts
    local qbxSeatbeltPath = GetResourcePath("qbx_seatbelt")
    local esxCruiseControlPath = GetResourcePath("esx_cruisecontrol")
    local qbSmallResourcesPath = GetResourcePath("qb-smallresources")
    
    -- Check ESX Cruise Control
    if esxCruiseControlPath ~= nil then
        print("^1[WARNING] => esx_cruisecontrol script has been detected, please disable the [BELT] system in this script. ^0")
    end
    
    -- Check QB Small Resources
    if qbSmallResourcesPath ~= nil then
        local seatbeltFilePath = string.format("%s/client/seatbelt.lua", qbSmallResourcesPath)
        local file = io.open(seatbeltFilePath, "r")
        
        if file then
            io.close(file)
            print("^1[WARNING] => qb-smallresources script has been detected, please remove the [@qb-smallresources/client/seatbelt.lua] file in the script. ^0")
        end
    end
    
    -- Check QBX Seatbelt
    if qbxSeatbeltPath ~= nil then
        print("^1[WARNING] => qbx_seatbelt script has been detected, please remove this script. ^0")
    end
end)

-- ============================================================================
-- VERSION CHECKER
-- ============================================================================

-- Get Resource Information
local resourceName = GetInvokingResource() or GetCurrentResourceName()
local scriptName = GetResourceMetadata(resourceName, "scriptname", 0)
local currentVersion = GetResourceMetadata(resourceName, "version", 0)

-- Check Version After 1 Second
SetTimeout(1000, function()
    checkversion()
end)

-- Version Check Function
function checkversion()
    PerformHttpRequest(
        "https://ayazwai.dev/version",
        function(statusCode, responseBody, headers)
            if responseBody ~= nil then
                local data = json.decode(responseBody)
                
                if statusCode == 202 then
                    print(data.message)
                    
                    if data.havelog then
                        for _, changelog in pairs(data.changelogs) do
                            print(changelog)
                        end
                    end
                else
                    print(data.message)
                end
            else
                print("Could not check the script version...")
            end
        end,
        "GET",
        "",
        {
            ["x-script"] = scriptName,
            ["x-version"] = currentVersion
        }
    )
end