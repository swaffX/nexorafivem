-- =====================================================
--  decrypted by https://discord.gg/6NCbAv2VNK 𝐀𝐤 𝐋𝐞𝐚𝐤𝐬 
--		Cleaned By Said Ak Using Claude Sonnet 4.5
-- =====================================================

-----------------------------------------------------------------------------------------
-- EVENT'S --
-----------------------------------------------------------------------------------------

--- @important When player loaded, this event will be triggered.
RegisterNetEvent('wais:hudv6:client:custom:playerLoaded', function()
    wFramework.CustomPlayerLoaded()
end)

--- @important When player unloaded, this event will be triggered.
RegisterNetEvent('wais:hudv6:client:custom:playerUnloaded', function()
    wFramework.playerUnloaded()
end)

--- @param job table { label = string, grade = { name = string } }
RegisterNetEvent('wais:hudv6:client:custom:setPlayerJob', function(job)
    wFramework.SetPlayerJob(job)
end)

--- @param gang table { label = string, grade = { name = string } }
RegisterNetEvent('wais:hudv6:client:custom:setPlayerGang', function(gang)
    wFramework.SetPlayerGang(gang)
end)

--- @param money number
RegisterNetEvent('wais:hudv6:client:custom:setPlayerMoney', function(money)
    wFramework.SetPlayerMoney(money)
end)

--- @param bank number
RegisterNetEvent('wais:hudv6:client:custom:setPlayerBank', function(bank)
    wFramework.SetPlayerBank(bank)
end)

-----------------------------------------------------------------------------------------
-- CALLBACK'S --
-----------------------------------------------------------------------------------------

-----------------------------------------------------------------------------------------
-- FUNCTION'S --
-----------------------------------------------------------------------------------------

local function markPostal(postalId)
    for _, v in pairs(Postals) do
        if v.code == postalId then
            SetNewWaypoint(v.x, v.y)
            return Config.Notification(Lang("postal"), Lang("postal_marked"), "success")
        end
    end

    return Config.Notification(Lang("postal"), Lang("postal_not_found"), "error")
end

-----------------------------------------------------------------------------------------
-- COMMAND'S --
-----------------------------------------------------------------------------------------

if not Config.Commands.postal.disabled then
    RegisterCommand(Config.Commands.postal.command, function(_, args)
        local postalId = args[1] and args[1] or nil
        markPostal(postalId)
    end, false)
end

-----------------------------------------------------------------------------------------
-- THREAD'S --
-----------------------------------------------------------------------------------------

-----------------------------------------------------------------------------------------
-- EXPORT'S --
-----------------------------------------------------------------------------------------