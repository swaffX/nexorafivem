-- =====================================================
--  decrypted by https://discord.gg/6NCbAv2VNK 𝐀𝐤 𝐋𝐞𝐚𝐤𝐬 
--		Cleaned By Said Ak Using Claude Sonnet 4.5
-- =====================================================

wFramework = {}

wFramework.PlayerLoaded = false
wFramework.Framework = {}
wFramework.Framework.PlayerData = {}
wFramework.Status = {
    hunger = 0,
    thirst = 0,
    stress = 0,
    stamina = 0
}
wFramework.Money = {
    bank = 0,
    cash = 0
}
wFramework.GangScript = nil
wFramework.GetGangFromScript = nil


-- ============================================
-- FUNKCJE WYSYŁAJĄCE DANE DO UI
-- ============================================

function wFramework.sendMoneyToUI()
    SendNUIMessage({
        type = "SET_PLAYER_CASH",
        cash = wFramework.Money.cash
    })
end

function wFramework.sendBankToUI()
    SendNUIMessage({
        type = "SET_PLAYER_BANK",
        bank = wFramework.Money.bank
    })
end

function wFramework.sendJobToUI()
    if Config.Framework.Framework == "esx" then
        Config.Debug("[^2INFO - FRAMEWORK^0] Sending ESX job data to UI")
        SendNUIMessage({
            type = "SET_PLAYER_JOB",
            label = ("%s - %s"):format(
                wFramework.Framework.PlayerData.job.label,
                wFramework.Framework.PlayerData.job.grade_label
            )
        })
    elseif Config.Framework.Framework == "qbcore" or Config.Framework.Framework == "qbx" then
        Config.Debug("[^2INFO - FRAMEWORK^0] Sending QBCore/QBX job data to UI")
        SendNUIMessage({
            type = "SET_PLAYER_JOB",
            label = ("%s - %s"):format(
                wFramework.Framework.PlayerData.job.label,
                wFramework.Framework.PlayerData.job.grade.name
            )
        })
    else
        Config.Debug("[^2INFO - FRAMEWORK^0] Sending unknown job data to UI")
        SendNUIMessage({
            type = "SET_PLAYER_JOB",
            label = ("%s - %s"):format(
                wFramework.Framework.PlayerData.job.label,
                wFramework.Framework.PlayerData.job.grade.name
            )
        })
    end
end

function wFramework.sendGangToUI()
    Config.Debug("[^2INFO - FRAMEWORK^0] Sending gang data to UI")
    
    local gangLabel = Lang("unknown")
    local gangGrade = Lang("unknown")
    
    if wFramework.Framework.PlayerData.gang ~= nil then
        Config.Debug("[^2INFO - FRAMEWORK^0] Gang data found, sending to UI")
        
        gangLabel = wFramework.Framework.PlayerData.gang.label or Lang("unknown")
        
        if Config.Framework.Framework == "qbcore" or Config.Framework.Framework == "qbx" then
            gangGrade = wFramework.Framework.PlayerData.gang.grade.name
        else
            local gradeType = type(wFramework.Framework.PlayerData.gang.grade)
            
            if gradeType == "number" then
                gangGrade = wFramework.Framework.PlayerData.gang.grade
            elseif gradeType == "string" then
                gangGrade = wFramework.Framework.PlayerData.gang.grade
            elseif gradeType == "table" then
                gangGrade = wFramework.Framework.PlayerData.gang.grade.name or
                           wFramework.Framework.PlayerData.gang.grade.rank or
                           wFramework.Framework.PlayerData.gang.grade.grade_label or
                           wFramework.Framework.PlayerData.gang.grade.label
            end
        end
    end
    
    SendNUIMessage({
        type = "SET_PLAYER_GANG",
        label = ("%s - %s"):format(gangLabel, gangGrade)
    })
end


-- ============================================
-- INICJALIZACJA FRAMEWORKU
-- ============================================

function FrameworkInit()
    if Config.Framework.Framework == "auto" then
        -- Wykryj ESX
        if GetResourceState("es_extended"):find("start") then
            Config.Framework.Framework = "esx"
            Config.Framework.ResourceName = "es_extended"
            wFramework.Framework = exports[Config.Framework.ResourceName]:getSharedObject()
            Config.Debug("[^2INFO - FRAMEWORK^0] Detected ESX framework")
        
        -- Wykryj QBX FIRST (before QBCore, since QBX also uses qb-core resource)
        elseif GetResourceState("qbx_core"):find("start") then
            Config.Framework.Framework = "qbx"
            Config.Framework.ResourceName = "qb-core"
            wFramework.Framework = exports[Config.Framework.ResourceName]:GetCoreObject()
            Config.Debug("[^2INFO - FRAMEWORK^0] Detected QBX framework")
        
        -- Wykryj QBCore
        elseif GetResourceState("qb-core"):find("start") then
            Config.Framework.Framework = "qbcore"
            Config.Framework.ResourceName = "qb-core"
            wFramework.Framework = exports[Config.Framework.ResourceName]:GetCoreObject()
            Config.Debug("[^2INFO - FRAMEWORK^0] Detected QBCore framework")
        
        else
            Config.Debug("[^2WARNING - FRAMEWORK^0] No framework detected, please set the framework manually in config.lua")
        end
    else
        if Config.Framework.Framework == "esx" then
            local success = pcall(function()
                wFramework.Framework = exports[Config.Framework.ResourceName]:getSharedObject()
            end)
            
            if not success then
                while wFramework.Framework == nil do
                    TriggerEvent(Config.Framework.SharedEvent, function(framework)
                        wFramework.Framework = framework
                    end)
                    Wait(10)
                end
                Config.Debug("[^2INFO - FRAMEWORK^0] ESX framework initialized ( OLD )")
            end
        
        elseif Config.Framework.Framework == "qbcore" then
            local success = pcall(function()
                wFramework.Framework = exports[Config.Framework.ResourceName]:GetCoreObject()
            end)
            
            if not success then
                while wFramework.Framework == nil do
                    TriggerEvent(Config.Framework.SharedEvent, function(framework)
                        wFramework.Framework = framework
                    end)
                    Wait(10)
                end
                Config.Debug("[^2INFO - FRAMEWORK^0] QBCore framework initialized ( OLD )")
            end
        end
    end
end


-- ============================================
-- POBIERANIE DANYCH GRACZA
-- ============================================

function wFramework.requestData()
    if Config.Framework.Framework == "esx" then
        return wFramework.Framework:GetPlayerData()
    elseif Config.Framework.Framework == "qbcore" then
        -- QBCore için callback olmadan direkt çağır
        local success, result = pcall(function()
            return wFramework.Framework.Functions.GetPlayerData()
        end)
        if success and result then
            return result
        else
            -- If GetPlayerData fails, check if qbx_core is running and switch to QBX mode
            if GetResourceState("qbx_core"):find("start") then
                Config.Framework.Framework = "qbx"
                Config.Debug("[^2INFO - FRAMEWORK^0] Switched to QBX framework (detected from error)")
                -- Return cached data if available
                if wFramework.Framework.PlayerData and wFramework.Framework.PlayerData.job then
                    return wFramework.Framework.PlayerData
                end
                return nil
            end
            return nil
        end
    elseif Config.Framework.Framework == "qbx" then
        -- QBX: Use cached PlayerData if available (set by event handlers)
        if wFramework.Framework.PlayerData and wFramework.Framework.PlayerData.job then
            return wFramework.Framework.PlayerData
        end
        -- If not cached, return nil - the event handler will set it when available
        return nil
    end
end

function wFramework.GetPlayerData()
    Config.Debug("[^2INFO - FRAMEWORK^0] Getting player data")
    
    if wFramework then
        -- For QBX, wait for cached player data from events instead of calling GetPlayerData directly
        if Config.Framework.Framework == "qbx" then
            local attempts = 0
            while (not wFramework.Framework.PlayerData or not wFramework.Framework.PlayerData.job) and attempts < 40 do
                Wait(250)
                attempts = attempts + 1
                -- Try to get from Player object if available
                if Player and type(Player) == "table" and Player.PlayerData and Player.PlayerData.job then
                    wFramework.Framework.PlayerData = Player.PlayerData
                    break
                end
            end
            
            if wFramework.Framework.PlayerData and wFramework.Framework.PlayerData.job then
                Config.Debug("[^2INFO - FRAMEWORK^0] Player data retrieved successfully (QBX)")
                return wFramework.Framework.PlayerData
            else
                Config.Debug("[^3WARNING - FRAMEWORK^0] Player data is nil for QBX. Waiting for player loaded event.")
                return nil
            end
        else
            local playerData = wFramework.requestData()
            
            if playerData == nil then
                Config.Debug("[^3WARNING - FRAMEWORK^0] Player data is nil. The GetPlayerData() function was not found or standalone usage was detected.")
                return
            end
            
            Config.Debug("[^2INFO - FRAMEWORK^0] Framework is initialized, getting player data")
            
            while playerData.job == nil do
                playerData = wFramework.requestData()
                Wait(250)
            end
            
            wFramework.Framework.PlayerData = playerData
            Config.Debug("[^2INFO - FRAMEWORK^0] Player data retrieved successfully")
            
            return wFramework.Framework.PlayerData
        end
    else
        Config.Debug("[^2WARNING - FRAMEWORK^0] Framework is not initialized, please check your config.lua")
        return false
    end
end

function wFramework.GetPlayerMoney()
    Config.Debug("[^2INFO - FRAMEWORK^0] Getting player money...")
    wFramework.GetPlayerData()
    
    if Config.Framework.Framework == "esx" then
        if Config.MoneySettings.isItem then
            Config.Debug("[^2INFO - FRAMEWORK^0] Getting player money from inventory")
            
            for _, item in pairs(wFramework.Framework.PlayerData.inventory) do
                if item.name == Config.MoneySettings.name then
                    local amount = Config.MoneySettings.qs_inventory and item.amount or item.count or 0
                    wFramework.Money.cash = amount
                    break
                end
            end
        elseif Config.MoneySettings.isOldType then
            Config.Debug("[^2INFO - FRAMEWORK^0] Getting player money from callback")
            lib.callback("wais:hudv6:server:getMoney", false, function(amount)
                wFramework.Money.cash = amount or 0
            end)
        else
            Config.Debug("[^2INFO - FRAMEWORK^0] Getting player money from accounts")
            
            for _, account in pairs(wFramework.Framework.PlayerData.accounts) do
                if account.name == "money" then
                    wFramework.Money.cash = account.money
                    break
                end
            end
        end
    
    elseif Config.Framework.Framework == "qbcore" then
        if Config.MoneySettings.isItem then
            Config.Debug("[^2INFO - FRAMEWORK^0] Getting player money from inventory")
            
            for _, item in pairs(wFramework.Framework.PlayerData.items) do
                if item.name == Config.MoneySettings.name then
                    wFramework.Money.cash = item.amount
                    break
                end
            end
        else
            Config.Debug("[^2INFO - FRAMEWORK^0] Getting player money from data")
            wFramework.Money.cash = wFramework.Framework.PlayerData.money.cash or 0
        end
    
    elseif Config.Framework.Framework == "qbx" then
        if Config.MoneySettings.isItem then
            if wFramework.Framework.PlayerData.items then
                for _, item in pairs(wFramework.Framework.PlayerData.items) do
                    if item.name == Config.MoneySettings.name then
                        wFramework.Money.cash = item.amount
                        break
                    end
                end
            end
        else
            if wFramework.Framework.PlayerData.money then
                wFramework.Money.cash = wFramework.Framework.PlayerData.money.cash or 0
            else
                wFramework.Money.cash = 0
            end
        end
    else
        Config.Debug("[^2WARNING - FRAMEWORK^0] Framework is not initialized, please check your config.lua")
    end
    
    wFramework.sendMoneyToUI()
end

function wFramework.GetPlayerBank()
    Config.Debug("[^2INFO - FRAMEWORK^0] Getting player bank...")
    wFramework.GetPlayerData()
    
    if Config.Framework.Framework == "esx" then
        Config.Debug("[^2INFO - FRAMEWORK^0] Getting player bank from accounts")
        
        for _, account in pairs(wFramework.Framework.PlayerData.accounts) do
            if account.name == "bank" then
                wFramework.Money.bank = account.money
                break
            end
        end
    
    elseif Config.Framework.Framework == "qbcore" then
        Config.Debug("[^2INFO - FRAMEWORK^0] Getting player bank from data")
        wFramework.Money.bank = wFramework.Framework.PlayerData.money.bank or 0
    
    elseif Config.Framework.Framework == "qbx" then
        Config.Debug("[^2INFO - FRAMEWORK^0] Getting player bank from data")
        if wFramework.Framework.PlayerData.money then
            wFramework.Money.bank = wFramework.Framework.PlayerData.money.bank or 0
        else
            wFramework.Money.bank = 0
        end
    
    else
        Config.Debug("[^2WARNING - FRAMEWORK^0] Framework is not initialized, please check your config.lua")
    end
    
    wFramework.sendBankToUI()
end

function wFramework.GetPlayerStatus()
    Config.Debug("[^2INFO - FRAMEWORK^0] Getting player status...")
    
    if Config.Framework.Framework == "qbcore" or Config.Framework.Framework == "qbx" then
        Config.Debug("[^2INFO - FRAMEWORK^0] Getting player status from PlayerData QBCore || Qbox...")
        
        -- Safety check for metadata
        if wFramework.Framework.PlayerData and wFramework.Framework.PlayerData.metadata then
            wFramework.Status.hunger = math.floor(wFramework.Framework.PlayerData.metadata.hunger or 100) or 100
            wFramework.Status.thirst = math.floor(wFramework.Framework.PlayerData.metadata.thirst or 100) or 100
            wFramework.Status.stress = math.floor(wFramework.Framework.PlayerData.metadata.stress or 0) or 0
        else
            -- Default values if metadata doesn't exist
            wFramework.Status.hunger = 100
            wFramework.Status.thirst = 100
            wFramework.Status.stress = 0
        end
    end
end


-- ============================================
-- GANG SYSTEM
-- ============================================

function wFramework.GetPlayerGang()
    Config.Debug("[^2INFO - FRAMEWORK^0] Getting player gang..")
    
    -- rcore_gangs
    if GetResourceState("rcore_gangs"):find("start") then
        wFramework.GangScript = "rcore_gangs"
        Config.Debug("[^2INFO - FRAMEWORK^0] Getting player gang from rcore_gangs")
        
        local gangData = exports.rcore_gangs:GetPlayerGang()
        wFramework.Framework.PlayerData.gang = {
            label = gangData and gangData.name or Lang("unknown"),
            grade = { name = gangData and gangData.rank or Lang("unknown") }
        }
        
        function wFramework.GetGangFromScript()
            local gangData = exports.rcore_gangs:GetPlayerGang()
            wFramework.Framework.PlayerData.gang = {
                label = gangData and gangData.name or Lang("unknown"),
                grade = { name = gangData and gangData.rank or Lang("unknown") }
            }
            wFramework.sendGangToUI()
        end
    
    -- ak47_territories
    elseif GetResourceState("ak47_territories"):find("start") then
        wFramework.GangScript = "ak47_territories"
        Config.Debug("[^2INFO - FRAMEWORK^0] Getting player gang from ak47_territories")
        
        local gangData = exports.ak47_territories:GetPlayerGang()
        wFramework.Framework.PlayerData.gang = {
            label = gangData and gangData.label or Lang("unknown"),
            grade = { name = gangData and gangData.ranklabel or Lang("unknown") }
        }
        
        function wFramework.GetGangFromScript()
            local gangData = exports.ak47_territories:GetPlayerGang()
            wFramework.Framework.PlayerData.gang = {
                label = gangData and gangData.label or Lang("unknown"),
                grade = { name = gangData and gangData.ranklabel or Lang("unknown") }
            }
            wFramework.sendGangToUI()
        end
    
    -- op-crime
    elseif GetResourceState("op-crime"):find("start") then
        wFramework.GangScript = "op-crime"
        Config.Debug("[^2INFO - FRAMEWORK^0] Getting player gang from op-crime")
        
        wFramework.Framework.PlayerData.gang = {
            label = LocalPlayer.state.gangName or Lang("unknown"),
            grade = { name = LocalPlayer.state.gangRankName or Lang("unknown") }
        }
        
        function wFramework.GetGangFromScript()
            wFramework.Framework.PlayerData.gang = {
                label = LocalPlayer.state.gangName or Lang("unknown"),
                grade = { name = LocalPlayer.state.gangRankName or Lang("unknown") }
            }
            wFramework.sendGangToUI()
        end
    
    -- brutal_gangs
    elseif GetResourceState("brutal_gangs"):find("start") then
        wFramework.GangScript = "brutal_gangs"
        Config.Debug("[^2INFO - FRAMEWORK^0] Getting player gang from brutal_gangs")
        
        local gangData = exports.brutal_gangs:playerGangRank()
        wFramework.Framework.PlayerData.gang = {
            label = gangData or Lang("unknown"),
            grade = { name = gangData or Lang("unknown") }
        }
        
        function wFramework.GetGangFromScript()
            local gangData = exports.brutal_gangs:playerGangRank()
            wFramework.Framework.PlayerData.gang = {
                label = gangData or Lang("unknown"),
                grade = { name = gangData or Lang("unknown") }
            }
            wFramework.sendGangToUI()
        end
    end
end


-- ============================================
-- AKTUALIZACJA DANYCH
-- ============================================

function wFramework.UpatePlayerJob()
    Config.Debug("[^2INFO - FRAMEWORK^0] Updating player job...")
    wFramework.GetPlayerData()
    wFramework.sendJobToUI()
end

function wFramework.UpdatePlayerGang()
    Config.Debug("[^2INFO - FRAMEWORK^0] Updating player gang...")
    wFramework.GetPlayerData()
    wFramework.sendGangToUI()
end


-- ============================================
-- USTAWIENIE DANYCH
-- ============================================

function wFramework.SetPlayerGang(gangData)
    if type(gangData) ~= "table" then
        Config.Debug("[^2WARNING - FRAMEWORK^0] Gang data is not a table, please check your parameters")
        return
    end
    
    Config.Debug("[^2INFO - FRAMEWORK^0] Setting player gang data.")
    
    wFramework.Framework.PlayerData.gang = gangData or {
        label = "Unkwon",
        grade = { name = "unkwon" }
    }
    
    wFramework.sendGangToUI()
end

function wFramework.SetPlayerJob(jobData)
    if type(jobData) ~= "table" then
        Config.Debug("[^2WARNING - FRAMEWORK^0] Job data is not a table, please check your parameters")
        return
    end
    
    Config.Debug("[^2INFO - FRAMEWORK^0] Setting player job data.")
    
    wFramework.Framework.PlayerData.job = jobData
    wFramework.sendJobToUI()
end

function wFramework.SetPlayerMoney(money)
    if type(money) ~= "number" then
        Config.Debug("[^2WARNING - FRAMEWORK^0] Money data is not a number, please check your parameters")
        return
    end
    
    Config.Debug("[^2INFO - FRAMEWORK^0] Setting player money data.")
    
    wFramework.Money.cash = money
    wFramework.sendMoneyToUI()
end

function wFramework.SetPlayerBank(bank)
    if type(bank) ~= "number" then
        Config.Debug("[^2WARNING - FRAMEWORK^0] Bank data is not a number, please check your parameters")
        return
    end
    
    Config.Debug("[^2INFO - FRAMEWORK^0] Setting player bank data.")
    
    wFramework.Money.bank = bank
    wFramework.sendBankToUI()
end


-- ============================================
-- ZAŁADOWANIE/ROZŁADOWANIE GRACZA
-- ============================================

function wFramework.playerLoaded()
    -- For QBX, allow proceeding even if GetPlayerData returns nil initially
    -- The data will be set via events
    local playerData = wFramework.GetPlayerData()
    
    if playerData or Config.Framework.Framework == "qbx" then
        -- For QBX, initialize HUD immediately with default data, then update when real data arrives
        if Config.Framework.Framework == "qbx" and not playerData then
            -- Set default player data structure immediately so HUD can show
            if not wFramework.Framework.PlayerData or not wFramework.Framework.PlayerData.job then
                wFramework.Framework.PlayerData = {
                    job = { name = "unemployed", label = "Unemployed", grade = { name = "Employee" } },
                    money = { cash = 0, bank = 0 },
                    metadata = { hunger = 100, thirst = 100, stress = 0 }
                }
            elseif not wFramework.Framework.PlayerData.metadata then
                -- Ensure metadata exists even if PlayerData was partially set
                wFramework.Framework.PlayerData.metadata = wFramework.Framework.PlayerData.metadata or {
                    hunger = 100,
                    thirst = 100,
                    stress = 0
                }
            end
            
            Config.Debug("[^2INFO - PLAYER^0] Initializing HUD immediately for QBX (will update when data arrives)")
            wFramework.PlayerLoaded = true
            
            wFramework.GetPlayerStatus()
            wFramework.GetPlayerMoney()
            wFramework.GetPlayerBank()
            wFramework.GetPlayerGang()
            wFramework.sendJobToUI()
            wFramework.sendGangToUI()
            
            InitHud()
            
            -- Try to get real player data in background and update when available
            CreateThread(function()
                local attempts = 0
                while attempts < 20 do -- Reduced to 5 seconds max
                    Wait(250)
                    attempts = attempts + 1
                    
                    -- Try to get from Player object
                    if Player and type(Player) == "table" and Player.PlayerData and Player.PlayerData.job then
                        wFramework.Framework.PlayerData = Player.PlayerData
                        Config.Debug("[^2INFO - QBX^0] Player data updated from Player object")
                        break
                    end
                    
                    -- Check if data was set by event
                    if wFramework.Framework.PlayerData and wFramework.Framework.PlayerData.job and wFramework.Framework.PlayerData.job.name ~= "unemployed" then
                        Config.Debug("[^2INFO - QBX^0] Player data updated from event")
                        break
                    end
                end
                
                -- Update HUD with real data if we got it
                if wFramework.Framework.PlayerData and wFramework.Framework.PlayerData.job and wFramework.Framework.PlayerData.job.name ~= "unemployed" then
                    Config.Debug("[^2INFO - QBX^0] Updating HUD with real player data")
                    wFramework.GetPlayerStatus()
                    wFramework.GetPlayerMoney()
                    wFramework.GetPlayerBank()
                    wFramework.GetPlayerGang()
                    wFramework.sendJobToUI()
                    wFramework.sendGangToUI()
                end
            end)
            return
        end
        
        Config.Debug("[^2INFO - PLAYER^0] Player loaded!")
        wFramework.PlayerLoaded = true
        
        wFramework.GetPlayerStatus()
        wFramework.GetPlayerMoney()
        wFramework.GetPlayerBank()
        wFramework.GetPlayerGang()
        wFramework.sendJobToUI()
        wFramework.sendGangToUI()
        
        InitHud()
    end
end

function wFramework.CustomPlayerLoaded()
    Config.Debug("[^2INFO - PLAYER^0] {Custom} Player loaded!")
    wFramework.PlayerLoaded = true
    InitHud()
end

function wFramework.playerUnloaded()
    Config.Debug("[^2INFO - PLAYER^0] Player unloaded, resetting data.")
    
    wFramework.PlayerLoaded = false
    wFramework.Framework.PlayerData = {}
    wFramework.Status = {
        hunger = 0,
        thirst = 0,
        stress = 0,
        stamina = 0
    }
    wFramework.Money = {
        bank = 0,
        cash = 0
    }
    
    Player.dead = false
    Player.cinematic = false
    
    closeEditorMode()
    closeSettings()
    
    SendNUIMessage({ type = "HIDE_UI" })
end


-- ============================================
-- THREAD GŁÓWNY
-- ============================================

CreateThread(function()
    FrameworkInit()
    
    if not IsDuplicityVersion() then
        InitHudCommands()
    end
end)