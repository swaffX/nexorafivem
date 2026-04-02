Discord = {}

function Discord.SendLog(title, description, color, fields)
    if not Config.Discord.Enabled or not Config.Discord.WebhookURL or Config.Discord.WebhookURL == "" then
        return
    end

    local embed = {
        {
            ["title"] = title,
            ["description"] = description,
            ["color"] = color,
            ["fields"] = fields or {},
            ["footer"] = {
                ["text"] = "MS FPS Booster • " .. os.date("%Y-%m-%d %H:%M:%S"),
            },
            ["timestamp"] = os.date("!%Y-%m-%dT%H:%M:%S")
        }
    }

    PerformHttpRequest(Config.Discord.WebhookURL, function(err, text, headers) end, 'POST', json.encode({
        username = "MS FPS Booster",
        embeds = embed
    }), { ['Content-Type'] = 'application/json' })
end

function Discord.LogAdminAccess(source, isAuthorized)
    if not Config.Discord.LogAdminAccess then
        return
    end

    if not isAuthorized then
        return
    end

    local playerName = GetPlayerName(source) or "Unknown"
    local identifiers = GetPlayerIdentifiers(source)
    
    local steamId = ""
    local steamHex = ""
    local discordId = ""
    local licenseId = ""
    
    if identifiers then
        for _, id in ipairs(identifiers) do
            if string.sub(id, 1, 6) == "steam:" then
                steamId = "`" .. id .. "`"
                local steamNum = string.sub(id, 7)
                if steamNum and steamNum ~= "" then
                    steamHex = "`steam:0x" .. string.format("%x", tonumber(steamNum, 16) or 0) .. "`"
                end
            elseif string.sub(id, 1, 8) == "discord:" then
                discordId = "`" .. id .. "`"
            elseif string.sub(id, 1, 8) == "license:" then
                licenseId = "`" .. id .. "`"
            end
        end
    end
    
    local idList = ""
    if steamId ~= "" then idList = idList .. _L("discord.steam") .. " " .. steamId .. "\n" end
    if steamHex ~= "" then idList = idList .. _L("discord.steam_hex") .. " " .. steamHex .. "\n" end
    if discordId ~= "" then idList = idList .. _L("discord.discord_id") .. " " .. discordId .. "\n" end
    if licenseId ~= "" then idList = idList .. _L("discord.license") .. " " .. licenseId .. "\n" end
    
    if idList == "" then
        idList = _L("discord.not_found")
    end

    local fields = {
        {
            ["name"] = _L("discord.field_player"),
            ["value"] = playerName .. " (ID: " .. source .. ")",
            ["inline"] = true
        },
        {
            ["name"] = _L("discord.field_status"),
            ["value"] = _L("discord.status_secure"),
            ["inline"] = true
        },
        {
            ["name"] = _L("discord.field_identifiers"),
            ["value"] = idList,
            ["inline"] = false
        }
    }

    Discord.SendLog(
        _L("discord.admin_panel_title"),
        _L("discord.admin_panel_desc"),
        3066993, 
        fields
    )
end

function Discord.LogCleanup(source, cleanupType, count)
    if not Config.Discord.LogCleanupActions then
        return
    end

    local playerName = GetPlayerName(source) or "Unknown"
    
    local typeNames = {
        ["all"] = _L("discord.cleanup_all"),
        ["vehicles"] = _L("discord.cleanup_vehicles"),
        ["peds"] = _L("discord.cleanup_peds"),
        ["objects"] = _L("discord.cleanup_objects")
    }

    local fields = {
        {
            ["name"] = _L("discord.field_admin"),
            ["value"] = playerName .. " (ID: " .. source .. ")",
            ["inline"] = true
        },
        {
            ["name"] = _L("discord.field_cleanup_type"),
            ["value"] = typeNames[cleanupType] or cleanupType,
            ["inline"] = true
        }
    }

    Discord.SendLog(
        _L("discord.cleanup_title"),
        _L("discord.cleanup_desc"),
        15844367, 
        fields
    )
end
