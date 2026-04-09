-- ============================================
-- Advanced Discord Queue System for FiveM
-- ============================================

-- Queue System Variables
local queueList = {}
local queueHalted = false

-- ============================================
-- UTILITY FUNCTIONS
-- ============================================

-- Helper function to count table entries
local function countTable(tbl)
    local count = 0
    for _ in pairs(tbl) do
        count = count + 1
    end
    return count
end

-- Format seconds to MM:SS
local function formatTime(seconds)
    if seconds <= 0 then
        return "00:00"
    end
    
    local minutes = math.floor(seconds / 60)
    local secs = math.floor(seconds - (minutes * 60))
    return string.format("%02.f:%02.f", minutes, secs)
end

-- Extract the last part after colon from identifier
local function extractIdentifier(identifier)
    local result = nil
    for part in identifier:gmatch("([^:]+)") do
        result = part
    end
    return result
end

-- Get player identifiers (Steam, Discord)
local function getPlayerIdentifiers(source)
    local identifiers = {
        id = source,
        name = GetPlayerName(source),
        steamhex = "Aucun",
        discord = "Aucun"
    }
    
    for i = 0, GetNumPlayerIdentifiers(source) - 1 do
        local identifier = GetPlayerIdentifier(source, i)
        
        if string.find(identifier, "steam") then
            identifiers.steamhex = extractIdentifier(identifier)
        elseif string.find(identifier, "discord") then
            identifiers.discord = extractIdentifier(identifier)
        end
    end
    
    return identifiers
end

-- Send alert to Discord webhook
local function sendDiscordAlert(username, reason)
    PerformHttpRequest(Config.General.WebhookURL, function(statusCode, response, headers)
        -- Silent callback
    end, "POST", json.encode({
        username = Config.AlertMessages.WebhookUsername,
        embeds = {{
            title = Config.AlertMessages.AlertTitle,
            description = string.format(Config.AlertMessages.AlertDescriptionTemplate, username, reason),
            color = Config.AlertMessages.AlertColor
        }}
    }), {
        ["Content-Type"] = "application/json"
    })
end

-- Validate username against blacklist
local function validateUsername(username)
    local lowerUsername = string.lower(username)
    
    for _, blacklistedWord in ipairs(Config.UsernameBlacklist) do
        if lowerUsername:find(string.lower(blacklistedWord)) then
            return false, string.format("Mot interdit détecté : %s", blacklistedWord)
        end
    end
    
    return true, "Nom valide"
end

-- ============================================
-- MAIN PLAYER CONNECTING EVENT HANDLER
-- ============================================

AddEventHandler("playerConnecting", function(playerName, setKickReason, deferrals)
    local src = source
    local playerIdentifiers = getPlayerIdentifiers(src)
    
    deferrals.defer()
    deferrals.update(Config.UI.LoadingScreen.Text)
    
    -- Show loading screen with animated dots
    local dots = ""
    local numDots = math.random(Config.UI.LoadingScreen.MinDots, Config.UI.LoadingScreen.MaxDots)
    
    for i = 1, numDots do
        dots = dots .. "."
        deferrals.presentCard([[
{
    "type": "AdaptiveCard",
    "$schema": "http://adaptivecards.io/schemas/adaptive-card.json",
    "version": "1.5",
    "body": [
        {
            "type": "Container",
            "items": [
                {
                    "type": "Image",
                    "url": "]] .. Config.UI.LoadingScreen.ImagePath .. [[",
                    "size": "]] .. Config.UI.LoadingScreen.ImageSize .. [[",
                    "horizontalAlignment": "Center",
                    "altText": "]] .. Config.UI.LoadingScreen.ImageAltText .. [["
                },
                {
                    "type": "TextBlock",
                    "text": "]] .. Config.UI.LoadingScreen.Text .. dots .. [[",
                    "wrap": true,
                    "size": "]] .. Config.UI.LoadingScreen.TextSize .. [[",
                    "horizontalAlignment": "Center",
                    "weight": "]] .. Config.UI.LoadingScreen.TextWeight .. [[",
                    "color": "]] .. Config.UI.LoadingScreen.TextColor .. [["
                }
            ],
            "style": "default",
            "bleed": true,
            "height": "stretch"
        }
    ]
}]])
        Wait(1000)
    end
    
    -- Check if player is whitelisted
    local isWhitelisted = false
    for _, whitelistedID in ipairs(Config.Roles.WhitelistedDiscordIDs) do
        if playerIdentifiers.discord == whitelistedID then
            isWhitelisted = true
            break
        end
    end
    
    -- Validate username if not whitelisted
    if not isWhitelisted then
        local isValidUsername, usernameError = validateUsername(playerName)
        if not isValidUsername then
            sendDiscordAlert(playerName, string.format(Config.AlertMessages.InvalidUsernameReason, usernameError))
            setKickReason(Config.ErrorMessages.KickInvalidUsername .. " (" .. usernameError .. ")")
            deferrals.done(Config.ErrorMessages.KickInvalidUsername .. " (" .. usernameError .. ")")
            CancelEvent()
            return
        end
        
        -- Check if Discord ID exists
        if playerIdentifiers.discord == "Aucun" then
            sendDiscordAlert(playerName, Config.AlertMessages.NoDiscordIDReason)
            setKickReason(Config.ErrorMessages.KickNoDiscord)
            deferrals.done(Config.ErrorMessages.KickNoDiscord)
            CancelEvent()
            return
        end
    end
    
    -- Verify Discord server membership and roles
    PerformHttpRequest(
        "https://discord.com/api/v9/guilds/" .. Config.General.DiscordServerID .. "/members/" .. playerIdentifiers.discord,
        function(statusCode, response, headers)
            if statusCode ~= 200 then
                setKickReason(string.format(Config.ErrorMessages.DiscordCheckError, statusCode))
                deferrals.done(string.format(Config.ErrorMessages.DiscordCheckError, statusCode))
                CancelEvent()
                return
            end
            
            local memberData = json.decode(response)
            if not memberData then
                sendDiscordAlert(playerName, Config.AlertMessages.NotInDiscordReason)
                setKickReason(Config.ErrorMessages.KickNoDiscord)
                deferrals.done(Config.ErrorMessages.KickNoDiscord)
                CancelEvent()
                return
            end
            
            -- Check for required roles if not whitelisted
            if not isWhitelisted then
                local hasRequiredRole = false
                for _, playerRole in pairs(memberData.roles) do
                    for _, requiredRole in ipairs(Config.Roles.RequiredRoles) do
                        if playerRole == requiredRole then
                            hasRequiredRole = true
                            break
                        end
                    end
                    if hasRequiredRole then break end
                end
                
                if not hasRequiredRole then
                    sendDiscordAlert(playerName, Config.AlertMessages.MissingRoleReason)
                    setKickReason(Config.ErrorMessages.KickNoRole)
                    deferrals.done(Config.ErrorMessages.KickNoRole)
                    CancelEvent()
                    return
                end
            end
            
            -- Calculate priority based on roles
            local priority = 1
            for _, playerRole in pairs(memberData.roles) do
                if Config.Roles.QueuePrio[playerRole] then
                    if priority < Config.Roles.QueuePrio[playerRole] then
                        priority = Config.Roles.QueuePrio[playerRole]
                    end
                end
            end
            
            -- Add player to queue
            local queuePosition = countTable(queueList) + 1
            
            -- Adjust positions based on priority
            for queuedPlayer, queueData in pairs(queueList) do
                if priority > queueData.ticket then
                    if queuePosition > queueData.pos then
                        queuePosition = queueData.pos
                    end
                    queueList[queuedPlayer].pos = queueList[queuedPlayer].pos + 1
                end
            end
            
            queueList[src or 0] = {
                ticket = priority,
                pos = queuePosition
            }
            
            -- Get player display name and avatar
            local displayName = playerName
            if memberData.nick then
                displayName = memberData.nick
            elseif memberData.user then
                displayName = memberData.user.username
            end
            
            local avatarURL = Config.UI.QueueScreen.Avatar.DefaultPath
            if memberData.user and memberData.user.avatar then
                avatarURL = "https://cdn.discordapp.com/avatars/" .. playerIdentifiers.discord .. "/" .. memberData.user.avatar .. ".webp?size=128"
            end
            
            -- Queue wait time
            local waitTime = math.random(Config.Queue.MinWaitTime, Config.Queue.MaxWaitTime)
            local elapsedTime = 0
            
            -- Queue loop
            while true do
                if not queueHalted and queueList[src] and queueList[src].pos > 1 and GetPlayerEndpoint(src) then
                    -- Player is still in queue
                elseif not queueHalted and elapsedTime >= waitTime then
                    local currentPlayers = #GetPlayers()
                    local maxPlayers = GetConvarInt(Config.General.MaxSlotsConvar, Config.General.DefaultMaxSlots)
                    
                    if currentPlayers < maxPlayers then
                        break
                    end
                end
                
                -- Build verification checks
                local enabledChecks = {}
                for _, check in ipairs(Config.UI.QueueScreen.Verifications.Checks) do
                    if check.Enabled then
                        table.insert(enabledChecks, check)
                    end
                end
                
                local checkNamesJSON = {}
                local checkStatusJSON = {}
                
                for _, check in ipairs(enabledChecks) do
                    local statusText = (elapsedTime >= check.Delay) and Config.UI.QueueScreen.Verifications.StatusPassed or Config.UI.QueueScreen.Verifications.StatusChecking
                    local statusColor = (elapsedTime >= check.Delay) and check.PassedStatusColor or check.CheckingStatusColor
                    
                    table.insert(checkNamesJSON, [[
                    {
                        "type": "TextBlock",
                        "text": "]] .. check.Name .. [[",
                        "wrap": true,
                        "size": "]] .. check.TextSize .. [[",
                        "weight": "]] .. check.TextWeight .. [[",
                        "color": "]] .. check.TextColor .. [["
                    }
                ]])
                    
                    table.insert(checkStatusJSON, [[
                    {
                        "type": "TextBlock",
                        "text": "]] .. statusText .. [[",
                        "wrap": true,
                        "size": "]] .. check.TextSize .. [[",
                        "weight": "]] .. check.TextWeight .. [[",
                        "color": "]] .. statusColor .. [["
                    }
                ]])
                end
                
                local checkNamesStr = table.concat(checkNamesJSON, ",")
                local checkStatusStr = table.concat(checkStatusJSON, ",")
                
                local verificationsSection = ""
                if #enabledChecks > 0 then
                    verificationsSection = [[
                    {
                        "type": "ColumnSet",
                        "columns": [
                            {
                                "type": "Column",
                                "items": [
                                    {
                                        "type": "TextBlock",
                                        "text": "]] .. Config.UI.QueueScreen.Verifications.Title .. [[",
                                        "wrap": true,
                                        "size": "]] .. Config.UI.QueueScreen.Verifications.TitleSize .. [[",
                                        "weight": "]] .. Config.UI.QueueScreen.Verifications.TitleWeight .. [[",
                                        "color": "]] .. Config.UI.QueueScreen.Verifications.TitleColor .. [[",
                                        "spacing": "Medium"
                                    }
                                    ]] .. (checkNamesStr ~= "" and ("," .. checkNamesStr) or "") .. [[
                                ],
                                "width": "stretch",
                                "spacing": "None"
                            },
                            {
                                "type": "Column",
                                "items": [
                                    {
                                        "type": "TextBlock",
                                        "text": "]] .. Config.UI.QueueScreen.Verifications.StatusTitle .. [[",
                                        "wrap": true,
                                        "size": "]] .. Config.UI.QueueScreen.Verifications.StatusTitleSize .. [[",
                                        "weight": "]] .. Config.UI.QueueScreen.Verifications.StatusTitleWeight .. [[",
                                        "color": "]] .. Config.UI.QueueScreen.Verifications.StatusTitleColor .. [[",
                                        "spacing": "Medium"
                                    }
                                    ]] .. (checkStatusStr ~= "" and ("," .. checkStatusStr) or "") .. [[
                                ],
                                "width": "stretch",
                                "spacing": "None"
                            }
                        ],
                        "horizontalAlignment": "Left",
                        "separator": true,
                        "spacing": "Medium"
                    }
                ]]
                end
                
                -- Build and present queue card
                local queueCard = [[
{
    "type": "AdaptiveCard",
    "body": [
        {
            "type": "Container",
            "items": [
                {
                    "type": "TextBlock",
                    "text": "]] .. Config.UI.QueueScreen.HeaderText .. [[",
                    "wrap": true,
                    "size": "]] .. Config.UI.QueueScreen.HeaderTextSize .. [[",
                    "weight": "]] .. Config.UI.QueueScreen.HeaderTextWeight .. [[",
                    "color": "]] .. Config.UI.QueueScreen.HeaderTextColor .. [["
                },
                {
                    "type": "ColumnSet",
                    "columns": [
                        {
                            "type": "Column",
                            "items": [
                                {
                                    "type": "Image",
                                    "style": "Person",
                                    "url": "]] .. avatarURL .. [[",
                                    "size": "]] .. Config.UI.QueueScreen.Avatar.Size .. [[",
                                    "altText": "]] .. Config.UI.QueueScreen.Avatar.AltText .. [["
                                }
                            ],
                            "width": "auto"
                        },
                        {
                            "type": "Column",
                            "items": [
                                {
                                    "type": "TextBlock",
                                    "weight": "]] .. Config.UI.QueueScreen.WelcomeMessage.NicknameTextWeight .. [[",
                                    "text": "]] .. (displayName or Config.UI.QueueScreen.Avatar.FallbackNickname) .. [[",
                                    "wrap": true,
                                    "size": "]] .. Config.UI.QueueScreen.WelcomeMessage.NicknameTextSize .. [[",
                                    "color": "]] .. Config.UI.QueueScreen.WelcomeMessage.NicknameTextColor .. [["
                                },
                                {
                                    "type": "TextBlock",
                                    "spacing": "None",
                                    "text": "]] .. Config.UI.QueueScreen.WelcomeMessage.WelcomeText .. [[",
                                    "isSubtle": ]] .. (Config.UI.QueueScreen.WelcomeMessage.WelcomeTextIsSubtle and "true" or "false") .. [[,
                                    "wrap": true,
                                    "size": "]] .. Config.UI.QueueScreen.WelcomeMessage.WelcomeTextSize .. [[",
                                    "weight": "]] .. Config.UI.QueueScreen.WelcomeMessage.WelcomeTextWeight .. [[",
                                    "color": "]] .. Config.UI.QueueScreen.WelcomeMessage.WelcomeTextColor .. [["
                                }
                            ],
                            "width": "stretch"
                        }
                    ]
                },
                {
                    "type": "ColumnSet",
                    "columns": [
                        {
                            "type": "Column",
                            "items": [
                                {
                                    "type": "TextBlock",
                                    "weight": "]] .. Config.UI.QueueScreen.QueueInfo.PositionLabelWeight .. [[",
                                    "text": "]] .. Config.UI.QueueScreen.QueueInfo.PositionLabel .. [[",
                                    "wrap": true,
                                    "spacing": "Small",
                                    "horizontalAlignment": "Left",
                                    "size": "]] .. Config.UI.QueueScreen.QueueInfo.PositionLabelSize .. [[",
                                    "color": "]] .. Config.UI.QueueScreen.QueueInfo.PositionLabelColor .. [["
                                },
                                {
                                    "type": "TextBlock",
                                    "weight": "]] .. Config.UI.QueueScreen.QueueInfo.PriorityLabelWeight .. [[",
                                    "text": "]] .. Config.UI.QueueScreen.QueueInfo.PriorityLabel .. [[",
                                    "wrap": true,
                                    "spacing": "Small",
                                    "horizontalAlignment": "Left",
                                    "size": "]] .. Config.UI.QueueScreen.QueueInfo.PriorityLabelSize .. [[",
                                    "color": "]] .. Config.UI.QueueScreen.QueueInfo.PriorityLabelColor .. [["
                                },
                                {
                                    "type": "TextBlock",
                                    "text": "]] .. Config.UI.QueueScreen.QueueInfo.WaitTimeLabel .. [[",
                                    "wrap": true,
                                    "weight": "]] .. Config.UI.QueueScreen.QueueInfo.WaitTimeLabelWeight .. [[",
                                    "spacing": "Small",
                                    "horizontalAlignment": "Left",
                                    "size": "]] .. Config.UI.QueueScreen.QueueInfo.WaitTimeLabelSize .. [[",
                                    "color": "]] .. Config.UI.QueueScreen.QueueInfo.WaitTimeLabelColor .. [["
                                }
                            ],
                            "width": "auto",
                            "spacing": "None",
                            "horizontalAlignment": "Left"
                        },
                        {
                            "type": "Column",
                            "items": [
                                {
                                    "type": "TextBlock",
                                    "weight": "]] .. Config.UI.QueueScreen.QueueInfo.PositionValueWeight .. [[",
                                    "text": "]] .. queueList[src].pos .. "/" .. countTable(queueList) .. [[",
                                    "wrap": true,
                                    "spacing": "Small",
                                    "size": "]] .. Config.UI.QueueScreen.QueueInfo.PositionValueSize .. [[",
                                    "color": "]] .. Config.UI.QueueScreen.QueueInfo.PositionValueColor .. [["
                                },
                                {
                                    "type": "TextBlock",
                                    "weight": "]] .. Config.UI.QueueScreen.QueueInfo.PriorityValueWeight .. [[",
                                    "text": "]] .. priority .. [[",
                                    "wrap": true,
                                    "spacing": "Small",
                                    "size": "]] .. Config.UI.QueueScreen.QueueInfo.PriorityValueSize .. [[",
                                    "color": "]] .. Config.UI.QueueScreen.QueueInfo.PriorityValueColor .. [["
                                },
                                {
                                    "type": "TextBlock",
                                    "text": "]] .. formatTime(elapsedTime) .. [[",
                                    "wrap": true,
                                    "weight": "]] .. Config.UI.QueueScreen.QueueInfo.WaitTimeValueWeight .. [[",
                                    "spacing": "Small",
                                    "size": "]] .. Config.UI.QueueScreen.QueueInfo.WaitTimeValueSize .. [[",
                                    "color": "]] .. Config.UI.QueueScreen.QueueInfo.WaitTimeValueColor .. [["
                                }
                            ],
                            "width": "stretch"
                        }
                    ],
                    "horizontalAlignment": "Left"
                },
                {
                    "type": "ColumnSet",
                    "columns": [
                        {
                            "type": "Column",
                            "items": [
                                {
                                    "type": "Image",
                                    "style": "Person",
                                    "url": "]] .. Config.UI.QueueScreen.QueueMessage.ImagePath .. [[",
                                    "size": "]] .. Config.UI.QueueScreen.QueueMessage.ImageSize .. [[",
                                    "altText": "]] .. Config.UI.QueueScreen.QueueMessage.ImageAltText .. [["
                                }
                            ],
                            "width": "auto"
                        },
                        {
                            "type": "Column",
                            "items": [
                                {
                                    "type": "TextBlock",
                                    "text": "]] .. Config.UI.QueueScreen.QueueMessage.MainText .. [[",
                                    "size": "]] .. Config.UI.QueueScreen.QueueMessage.MainTextSize .. [[",
                                    "weight": "]] .. Config.UI.QueueScreen.QueueMessage.MainTextWeight .. [[",
                                    "color": "]] .. Config.UI.QueueScreen.QueueMessage.MainTextColor .. [["
                                },
                                {
                                    "type": "TextBlock",
                                    "spacing": "None",
                                    "text": "]] .. Config.UI.QueueScreen.QueueMessage.SubText .. [[",
                                    "isSubtle": ]] .. (Config.UI.QueueScreen.QueueMessage.SubTextIsSubtle and "true" or "false") .. [[,
                                    "size": "]] .. Config.UI.QueueScreen.QueueMessage.SubTextSize .. [[",
                                    "weight": "]] .. Config.UI.QueueScreen.QueueMessage.SubTextWeight .. [[",
                                    "color": "]] .. Config.UI.QueueScreen.QueueMessage.SubTextColor .. [[",
                                    "wrap": true
                                }
                            ],
                            "width": "stretch"
                        }
                    ],
                    "separator": true,
                    "spacing": "Medium"
                }
                ]] .. (verificationsSection ~= "" and ("," .. verificationsSection) or "") .. [[
                ,{
                    "type": "ColumnSet",
                    "columns": [
                        {
                            "type": "Column",
                            "items": [
                                {
                                    "type": "ActionSet",
                                    "actions": [
                                        {
                                            "type": "Action.OpenUrl",
                                            "title": "]] .. Config.UI.QueueScreen.Buttons.Forums.Text .. [[",
                                            "url": "]] .. Config.UI.QueueScreen.Buttons.Forums.URL .. [[",
                                            "style": "]] .. Config.UI.QueueScreen.Buttons.Forums.Style .. [["
                                        }
                                    ]
                                }
                            ],
                            "width": "auto"
                        },
                        {
                            "type": "Column",
                            "items": [
                                {
                                    "type": "ActionSet",
                                    "actions": [
                                        {
                                            "type": "Action.OpenUrl",
                                            "title": "]] .. Config.UI.QueueScreen.Buttons.Discord.Text .. [[",
                                            "url": "]] .. Config.UI.QueueScreen.Buttons.Discord.URL .. [[",
                                            "style": "]] .. Config.UI.QueueScreen.Buttons.Discord.Style .. [["
                                        }
                                    ]
                                }
                            ],
                            "width": "auto"
                        }
                    ],
                    "spacing": "Medium"
                }
            ]
        }
    ],
    "$schema": "http://adaptivecards.io/schemas/adaptive-card.json",
    "version": "1.5"
}]]
                
                deferrals.presentCard(queueCard)
                elapsedTime = elapsedTime + 1
                Wait(1000)
            end
            
            -- Player is ready to connect - halt queue temporarily
            CreateThread(function()
                if GetPlayerEndpoint(src) then
                    queueHalted = true
                    Wait(Config.Queue.HaltDuration * 1000)
                    queueHalted = false
                end
            end)
            
            -- Remove player from queue and adjust positions
            if queueList[src] and queueList[src].pos <= 1 then
                queueList[src or 0] = nil
                for queuedPlayer, queueData in pairs(queueList) do
                    queueList[queuedPlayer].pos = queueData.pos - 1
                end
            else
                if queueList[src] and queueList[src].pos > 1 then
                    for queuedPlayer, queueData in pairs(queueList) do
                        if queueData.pos > queueList[src].pos then
                            queueList[queuedPlayer].pos = queueData.pos - 1
                        end
                    end
                    queueList[src or 0] = nil
                end
            end
            
            deferrals.done()
        end,
        "GET",
        nil,
        {
            ["Content-Type"] = "application/json",
            Authorization = "Bot " .. Config.General.DiscordBotToken
        }
    )
end)
