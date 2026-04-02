RegisterServerEvent('chat:init')
RegisterServerEvent('chat:addTemplate')
RegisterServerEvent('chat:addMessage')
RegisterServerEvent('chat:addSuggestion')
RegisterServerEvent('chat:removeSuggestion')
RegisterServerEvent('_chat:messageEntered')
RegisterServerEvent('chat:clear')
RegisterServerEvent('__cfx_internal:commandFallback')

local QBCore = exports['qb-core']:GetCoreObject()

AddEventHandler('_chat:messageEntered', function(author, color, message)
    if not message or not author then
        return
    end

    TriggerEvent('chatMessage', source, author, message)

    if not WasEventCanceled() then
        --TriggerClientEvent('chatMessage', -1, 'OOC | '..author,  false, message)
    end
end)

AddEventHandler('__cfx_internal:commandFallback', function(command)
    local name = GetPlayerName(source)

    TriggerEvent('chatMessage', source, name, '/' .. command)

    if not WasEventCanceled() then
        TriggerClientEvent('chatMessage', -1, name, false, '/' .. command) 
    end

    CancelEvent()
end)

AddEventHandler('__cfx_internal:commandFallback', function(command)
    local name = GetPlayerName(source)

    TriggerEvent('chatMessage', source, name, '' .. command)

    if not WasEventCanceled() then
        TriggerClientEvent('chatMessage', -1, name, false, '' .. command) 
    end

    CancelEvent()
end)

-- player join messages
AddEventHandler('chat:init', function()
    --TriggerClientEvent('chatMessage', -1, '', { 255, 255, 255 }, '^2* ' .. GetPlayerName(source) .. ' joined.')
end)

AddEventHandler('playerDropped', function(reason)
    --TriggerClientEvent('chatMessage', -1, '', { 255, 255, 255 }, '^2* ' .. GetPlayerName(source) ..' left (' .. reason .. ')')
end)
-- command suggestions for clients
local function refreshCommands(player)
    if GetRegisteredCommands then
        local registeredCommands = GetRegisteredCommands()

        local suggestions = {}

        for _, command in ipairs(registeredCommands) do
            if IsPlayerAceAllowed(player, ('command.%s'):format(command.name)) then
                table.insert(suggestions, {
                    name = '/' .. command.name,
                    help = ''
                })
            end
        end

        TriggerClientEvent('chat:addSuggestions', player, suggestions)
    end
end

RegisterNetEvent("911mesajisex", function(mesaj)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
	local job = Player.PlayerData.job.name

--[[     if job = "police" then ]]
    TriggerClientEvent("chat:addMessage", mesaj, polisler)
--[[     end ]]
end)

local function refreshCommands2(player)
    if GetRegisteredCommands then
        local registeredCommands = GetRegisteredCommands()

        local suggestions = {}

        for _, command in ipairs(registeredCommands) do
            if IsPlayerAceAllowed(player, ('command.%s'):format(command.name)) then
                table.insert(suggestions, {
                    name = '' .. command.name,
                    help = ''
                })
            end
        end

        TriggerClientEvent('chat:addSuggestions', player, suggestions)
    end
end

AddEventHandler('chat:init', function()
    refreshCommands(source)
    refreshCommands2(source)
end)

AddEventHandler('onServerResourceStart', function(resName)
    Wait(500)

    for _, player in ipairs(GetPlayers()) do
        refreshCommands(player)
        refreshCommands2(player)
    end
end)
--------------------------------------------------------------------
RegisterNetEvent("chat:typingStatus", function(isTyping)
    local src = source
    TriggerClientEvent("chat:displayTyping", -1, src, isTyping)
end)
