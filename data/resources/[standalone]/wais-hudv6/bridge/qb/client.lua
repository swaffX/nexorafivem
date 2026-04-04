-- =====================================================
--  decrypted by https://discord.gg/6NCbAv2VNK 𝐀𝐤 𝐋𝐞𝐚𝐤𝐬 
--		Cleaned By Said Ak Using Claude Sonnet 4.5
-- =====================================================

-- ============================================
-- KLIENT - ZDARZENIA
-- ============================================

-- Gracz rozładowany
RegisterNetEvent("QBCore:Client:OnPlayerUnload", function()
    wFramework.playerUnloaded()
end)


-- Zmiana danych gracza (aktualizacja pieniędzy)
RegisterNetEvent("QBCore:Player:SetPlayerData", function(val)
    -- Store player data for QBX (QBX might pass it in the event)
    if Config and Config.Framework and Config.Framework.Framework == "qbx" then
        if val and type(val) == "table" and val.job then
            wFramework.Framework.PlayerData = val
            Config.Debug("[^2INFO - QBX^0] Player data set from SetPlayerData event")
            -- Trigger player loaded if not already loaded
            if not wFramework.PlayerLoaded then
                CreateThread(function()
                    Wait(100)
                    wFramework.playerLoaded()
                end)
            end
        else
            -- If val is not provided, try to get from framework
            CreateThread(function()
                Wait(100)
                if wFramework.Framework and wFramework.Framework.Functions then
                    local success, result = pcall(function()
                        -- Try to get from cached PlayerData if available
                        if wFramework.Framework.PlayerData and wFramework.Framework.PlayerData.job then
                            return wFramework.Framework.PlayerData
                        end
                        return nil
                    end)
                    if success and result and result.job then
                        wFramework.Framework.PlayerData = result
                        if not wFramework.PlayerLoaded then
                            wFramework.playerLoaded()
                        end
                    end
                end
            end)
        end
    end
    Wait(250)
    wFramework.GetPlayerBank()
    wFramework.GetPlayerMoney()
end)

-- QBX Player Loaded Event - Store player data when loaded
CreateThread(function()
    -- Wait for framework to be initialized
    while not Config or not Config.Framework or not Config.Framework.Framework do
        Wait(100)
    end
    
    if Config.Framework.Framework == "qbx" then
        RegisterNetEvent("QBCore:Client:OnPlayerLoaded", function()
            Config.Debug("[^2INFO - QBX^0] Player loaded event received")
            -- Try multiple methods to get player data
            CreateThread(function()
                Wait(1000) -- Wait a bit for everything to initialize
                
                -- Method 1: Try to get from Player object if available
                if Player and type(Player) == "table" and Player.PlayerData and Player.PlayerData.job then
                    wFramework.Framework.PlayerData = Player.PlayerData
                    Config.Debug("[^2INFO - QBX^0] Player data retrieved from Player object")
                    -- Trigger player loaded if data is available
                    if wFramework.Framework.PlayerData then
                        wFramework.playerLoaded()
                    end
                    return
                end
                
                -- Method 2: Try to get from framework using pcall to avoid errors
                local success, result = pcall(function()
                    if wFramework.Framework and wFramework.Framework.Functions then
                        -- Try to access PlayerData directly from framework
                        if wFramework.Framework.PlayerData and wFramework.Framework.PlayerData.job then
                            return wFramework.Framework.PlayerData
                        end
                    end
                    return nil
                end)
                
                if success and result and result.job then
                    wFramework.Framework.PlayerData = result
                    Config.Debug("[^2INFO - QBX^0] Player data retrieved from framework")
                    wFramework.playerLoaded()
                    return
                end
                
                -- Method 3: Wait for SetPlayerData event
                Config.Debug("[^3WARNING - QBX^0] Player data not immediately available, waiting for SetPlayerData event")
            end)
        end)
    end
end)


-- Aktualizacja pracy
RegisterNetEvent("QBCore:Client:OnJobUpdate", function(jobData)
    wFramework.UpatePlayerJob()
end)


-- Aktualizacja gangu
RegisterNetEvent("QBCore:Client:OnGangUpdate", function()
    wFramework.UpdatePlayerGang()
end)


-- ============================================
-- ZDARZENIA HUD - POTRZEBY
-- ============================================

-- Aktualizacja głodu i pragnienia
RegisterNetEvent("hud:client:UpdateNeeds", function(hunger, thirst)
    -- Głód
    local hungerValue = 0
    
    if hunger then
        hungerValue = math.floor(hunger)
        
        if hungerValue > 100 then
            hungerValue = 100
        elseif hungerValue <= 0 then
            hungerValue = 0
        end
    else
        hungerValue = 0
    end
    
    wFramework.Status.hunger = hungerValue
    
    -- Pragnienie
    local thirstValue = 0
    
    if thirst then
        thirstValue = math.floor(thirst)
        
        if thirstValue > 100 then
            thirstValue = 100
        elseif thirstValue <= 0 then
            thirstValue = 0
        end
    else
        thirstValue = 0
    end
    
    wFramework.Status.thirst = thirstValue
end)


-- Aktualizacja stresu
RegisterNetEvent("hud:client:UpdateStress", function(stress)
    local stressValue = 0
    
    if stress then
        stressValue = math.floor(stress)
        
        if stressValue > 100 then
            stressValue = 100
        elseif stressValue <= 0 then
            stressValue = 0
        end
    else
        stressValue = 0
    end
    
    wFramework.Status.stress = stressValue
end)


-- ============================================
-- STATE BAG - STAN ZDROWIA (QBX)
-- ============================================

-- Monitoruj stan śmierci gracza
AddStateBagChangeHandler("qbx_medical:deathState", ("player:%s"):format(cache.serverId), function(bagName, key, value)
    local isDead = nil
    
    -- Konwertuj wartość na boolean
    if type(value) == "number" then
        isDead = value > 1
    else
        isDead = value
    end
    
    Player.dead = isDead
end)