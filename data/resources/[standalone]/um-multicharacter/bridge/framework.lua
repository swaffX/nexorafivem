-- Functions Shared [um-multicharacter\framework\custom.lua]

Framework = {}

ESX = exports["es_extended"]:getSharedObject()

function Framework:PlayerDeadCheck()
    return ESX.GetPlayerData()?.dead or false
end

-- Functions Server [um-multicharacter\framework\custom.lua]
if IsDuplicityVersion() then
    Debug('Framework Func() Start for Server')

    local cfgIdentifier = Config.Identifier

    function Framework:getPlayerIdentifierType(src, type)
        return GetPlayerIdentifierByType(src, type)
    end

    function Framework:GetPlayer(src)
        return ESX.GetPlayerFromId(src) or Debug('GetPlayer ?')
    end

    function Framework:GetIdentifier(src)
        local identifier = Framework:getPlayerIdentifierType(src, cfgIdentifier)
        return string.gsub(identifier, cfgIdentifier .. ':', '')
    end

    function Framework:GetPlayerFromIdentifier(char)
        return ESX.GetPlayerFromIdentifier(char) or Debug('GetPlayerFromIdentifier ?')
    end

    function Framework:SQLQuery(src)
        local identifier = Framework:GetIdentifier(src)
        local id = Config.Prefix .. '%:' .. identifier
        Debug('SQLQuery | ' .. id)
        return MySQL.query.await('SELECT identifier, accounts, job, job_grade, firstname, lastname, dateofbirth, sex, skin, height FROM users WHERE identifier LIKE ?', { id })
    end

    function Framework:ReadySQLGetJobs()
        MySQL.ready(function()
            repeat
                Wait(100)
                ESX.Jobs = ESX.GetJobs()
            until next(ESX.Jobs)
        end)
    end

    function Framework:GetJobLabel(sJob, sGrade)
        local job = sJob or "unemployed"
        local grade = tostring(sGrade or 0)

        if ESX?.DoesJobExist(job, grade) then
            return ESX?.Jobs[job]?.label
        end

        return ESX?.Jobs["unemployed"]?.label or sJob
    end
end
