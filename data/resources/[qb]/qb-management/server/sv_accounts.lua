local QBCore = exports['qb-core']:GetCoreObject()

local function ensureFundsTable()
    MySQL.query.await([[
        CREATE TABLE IF NOT EXISTS `management_funds` (
            `job_name` VARCHAR(50) NOT NULL,
            `amount` INT NOT NULL DEFAULT 0,
            PRIMARY KEY (`job_name`)
        )
    ]])
end

local function normalizeAmount(amount)
    amount = tonumber(amount)
    if not amount then return nil end
    return math.floor(amount + 0.0)
end

local function getAccount(jobName)
    if type(jobName) ~= 'string' or jobName == '' then
        return 0
    end

    local amount = MySQL.scalar.await('SELECT amount FROM management_funds WHERE job_name = ?', { jobName })
    return tonumber(amount) or 0
end

local function addMoney(jobName, amount)
    amount = normalizeAmount(amount)
    if type(jobName) ~= 'string' or jobName == '' or not amount or amount <= 0 then
        return false
    end

    MySQL.insert.await('INSERT INTO management_funds (job_name, amount) VALUES (?, ?) ON DUPLICATE KEY UPDATE amount = amount + VALUES(amount)', {
        jobName,
        amount
    })

    return true
end

local function removeMoney(jobName, amount)
    amount = normalizeAmount(amount)
    if type(jobName) ~= 'string' or jobName == '' or not amount or amount <= 0 then
        return false
    end

    local currentAmount = getAccount(jobName)
    if currentAmount < amount then
        return false
    end

    MySQL.update.await('UPDATE management_funds SET amount = amount - ? WHERE job_name = ?', {
        amount,
        jobName
    })

    return true
end

MySQL.ready(function()
    ensureFundsTable()
end)

QBCore.Functions.CreateCallback('qb-bossmenu:server:GetAccount', function(_, cb, jobName)
    cb(getAccount(jobName))
end)

RegisterNetEvent('qb-bossmenu:server:addAccountMoneyScript', function(jobName, amount)
    addMoney(jobName, amount)
end)

RegisterNetEvent('qb-bossmenu:server:removeAccountMoneyScript', function(jobName, amount)
    removeMoney(jobName, amount)
end)

exports('AddMoney', addMoney)
exports('RemoveMoney', removeMoney)
exports('GetAccount', getAccount)

exports('AddJobMoney', addMoney)
exports('RemoveJobMoney', removeMoney)
