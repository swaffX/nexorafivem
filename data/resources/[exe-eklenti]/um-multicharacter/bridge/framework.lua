-- Functions Shared [um-multicharacter\framework\custom.lua]

Framework = {}

-- Auto-detect framework
local function DetectFramework()
    if GetResourceState('qb-core') == 'started' then
        return 'qbcore', exports['qb-core']:GetCoreObject()
    elseif GetResourceState('es_extended') == 'started' then
        return 'esx', exports["es_extended"]:getSharedObject()
    end
    return nil, nil
end

local frameworkType, frameworkObject = DetectFramework()

if not frameworkType then
    print('^1[um-multicharacter] ERROR: No framework detected! Please ensure qb-core or es_extended is started.^7')
end

function Framework:PlayerDeadCheck()
    if frameworkType == 'qbcore' then
        local PlayerData = frameworkObject.Functions.GetPlayerData()
        return PlayerData.metadata?.isdead or false
    elseif frameworkType == 'esx' then
        return frameworkObject.GetPlayerData()?.dead or false
    end
    return false
end

-- Functions Server [um-multicharacter\framework\custom.lua]
if IsDuplicityVersion() then
    Debug('Framework Func() Start for Server | Type: ' .. (frameworkType or 'NONE'))

    local cfgIdentifier = Config.Identifier

    function Framework:getPlayerIdentifierType(src, type)
        return GetPlayerIdentifierByType(src, type)
    end

    function Framework:GetPlayer(src)
        if frameworkType == 'qbcore' then
            return frameworkObject.Functions.GetPlayer(src) or Debug('GetPlayer ?')
        elseif frameworkType == 'esx' then
            return frameworkObject.GetPlayerFromId(src) or Debug('GetPlayer ?')
        end
    end

    function Framework:GetIdentifier(src)
        local identifier = Framework:getPlayerIdentifierType(src, cfgIdentifier)
        return string.gsub(identifier, cfgIdentifier .. ':', '')
    end

    function Framework:GetPlayerFromIdentifier(char)
        if frameworkType == 'qbcore' then
            return frameworkObject.Functions.GetPlayerByCitizenId(char) or Debug('GetPlayerFromIdentifier ?')
        elseif frameworkType == 'esx' then
            return frameworkObject.GetPlayerFromIdentifier(char) or Debug('GetPlayerFromIdentifier ?')
        end
    end

    function Framework:SQLQuery(src)
        local identifier = Framework:GetIdentifier(src)
        local id = Config.Prefix .. '%:' .. identifier
        Debug('SQLQuery | ' .. id .. ' | Framework: ' .. frameworkType)
        
        if frameworkType == 'qbcore' then
            return MySQL.query.await('SELECT citizenid, money, job, charinfo, skin FROM players WHERE citizenid LIKE ?', { id })
        elseif frameworkType == 'esx' then
            return MySQL.query.await('SELECT identifier, accounts, job, job_grade, firstname, lastname, dateofbirth, sex, skin, height FROM users WHERE identifier LIKE ?', { id })
        end
        return {}
    end

    function Framework:ReadySQLGetJobs()
        if frameworkType == 'esx' then
            MySQL.ready(function()
                repeat
                    Wait(100)
                    frameworkObject.Jobs = frameworkObject.GetJobs()
                until next(frameworkObject.Jobs)
            end)
        else
            Debug('QBCore jobs ready')
        end
    end

    function Framework:GetJobLabel(sJob, sGrade)
        local job = sJob or "unemployed"
        
        if frameworkType == 'qbcore' then
            local Jobs = frameworkObject.Shared.Jobs
            if Jobs[job] then
                return Jobs[job].label
            end
            return Jobs["unemployed"]?.label or sJob
        elseif frameworkType == 'esx' then
            local grade = tostring(sGrade or 0)
            if frameworkObject?.DoesJobExist(job, grade) then
                return frameworkObject?.Jobs[job]?.label
            end
            return frameworkObject?.Jobs["unemployed"]?.label or sJob
        end
        
        return sJob
    end
    
    function Framework:GetType()
        return frameworkType
    end
end
