function LoadPlayerMoney(type, amount)
    nuiMessage("LOAD_PLAYER_MONEY", {
        type = type,
        amount = amount
    })
end

local function GetQBCoreCashAmount(playerData)
    if not playerData then return 0 end
    if playerData.items then
        for _, item in pairs(playerData.items) do
            if item and item.name == 'cash' then
                return item.amount or 0
            end
        end
    end
    return playerData.money and playerData.money.cash or 0
end

local function RefreshQBCoreMoney(delay)
    if Config.Framework == 'esx' or Config.Framework == 'oldesx' then return end
    CreateThread(function()
        Wait(delay or 100)
        local PlayerData = Core.Functions.GetPlayerData()
        if not PlayerData then return end
        LoadPlayerMoney('cash', GetQBCoreCashAmount(PlayerData))
        LoadPlayerMoney('bank', PlayerData.money and PlayerData.money.bank or 0)
    end)
end

function LoadPlayerId()
    nuiMessage("LOAD_PLAYER_ID", Config.PlayerServerId())
end

function LoadPlayerName(name)
    nuiMessage("LOAD_PLAYER_NAME", name)
end

function LoadPlayerJob(job_label, job_grade_label)
    nuiMessage("LOAD_PLAYER_JOB", {
        job_label = job_label,
        job_grade_label = job_grade_label
    })
 
end

RegisterNetEvent("esx:setJob")
AddEventHandler("esx:setJob", function(job)
    LoadPlayerJob(job.label, job.grade_label)
end)

RegisterNetEvent("QBCore:Player:SetPlayerData")
AddEventHandler("QBCore:Player:SetPlayerData", function(data)
    LoadPlayerMoney("cash", GetQBCoreCashAmount(data))
    LoadPlayerMoney("bank", data.money and data.money.bank or 0)
    LoadPlayerJob(data.job.label, data.job.grade.name)
end)

RegisterNetEvent("QBCore:Client:OnMoneyChange")
AddEventHandler("QBCore:Client:OnMoneyChange", function()
    RefreshQBCoreMoney(100)
end)

RegisterNetEvent("hud:client:OnMoneyChange")
AddEventHandler("hud:client:OnMoneyChange", function()
    RefreshQBCoreMoney(100)
end)

RegisterNetEvent("inventory:client:UpdatePlayerInventory")
AddEventHandler("inventory:client:UpdatePlayerInventory", function()
    RefreshQBCoreMoney(100)
end)

RegisterNetEvent("inventory:client:ItemBox")
AddEventHandler("inventory:client:ItemBox", function(itemData)
    if itemData and itemData.name == "cash" then
        RefreshQBCoreMoney(50)
    end
end)

RegisterNetEvent('esx:setAccountMoney')
AddEventHandler('esx:setAccountMoney', function(account)
    if account.name == 'money' then
        account.name = 'cash'
    end
    LoadPlayerMoney(account.name, account.money)
end)

RegisterNetEvent("es:removedMoney")
AddEventHandler("es:removedMoney", function(a, b, m)
    Wait(1500)
    local PlayerData = Core.GetPlayerData()
    for _,v in pairs(PlayerData.accounts) do
        if v.name == 'bank' then
            LoadPlayerMoney("bank", v.money)
        end
        if v.name == 'money' then
            LoadPlayerMoney("cash", v.money)
        end
    end
end)

RegisterNetEvent("es:addedMoney")
AddEventHandler("es:addedMoney", function(a, b, m)
    Wait(1500)
    local PlayerData = Core.GetPlayerData()
    for _,v in pairs(PlayerData.accounts) do
        if v.name == 'bank' then
            LoadPlayerMoney("bank", v.money)
        end
        if v.name == 'money' then
            LoadPlayerMoney("cash", v.money)
        end
    end
end)

function LoadPlayerInformations()
    WaitCore()
    WaitPlayer()
    CreateThread(function()
        local cash = 0
        local bank = 0
        local job_label = ""
        local job_grade_label = ""
        local playerName = TriggerCallback("mHud:GetPlayerName")
    
        if Config.Framework == 'esx' or Config.Framework == 'oldesx' then
            local PlayerData = Core.GetPlayerData()
            local esxCash = TriggerCallback("mHud:GetESXCash")
            local esxBank = TriggerCallback("mHud:GetESXBank")
            bank = esxBank
            cash = esxCash
            job_label = PlayerData["job"].label
            job_grade_label = PlayerData["job"].grade_label      
        else
            local PlayerData = Core.Functions.GetPlayerData()
            cash = GetQBCoreCashAmount(PlayerData)
            bank = PlayerData["money"].bank
            job_label = PlayerData["job"].label
            job_grade_label = PlayerData["job"].grade.name  
        end
        LoadPlayerName(playerName)
        LoadPlayerId()
        LoadPlayerMoney("cash", cash)
    
        LoadPlayerMoney("bank", bank)
    
        LoadPlayerJob(job_label, job_grade_label)
    
    end)
end

CreateThread(function()

    ForceAccountVisibility("cash", Config.MoneyHud.cash.show)
    ForceAccountVisibility("bank", Config.MoneyHud.bank.show)
    ForceAccountVisibility("black_money", Config.MoneyHud.black_money.show)
    ForceAccountVisibility("vip_money", Config.MoneyHud.vip_money.show)
    -- ForceAccountVisibility("boss_money", Config.MoneyHud.boss_money.show)
    Config.MoneyHud.black_money.getMoney(Config.MoneyHud.black_money)
    Config.MoneyHud.boss_money.getMoney(Config.MoneyHud.boss_money)
    Config.MoneyHud.vip_money.getMoney(Config.MoneyHud.vip_money)
end)

function ForceAccountVisibility(type, value)
    nuiMessage("FORCE_ACCOUNT_VISIBILITY", {
        type = type,
        value = value
    })
end

