local globalBlips = {}
local playersBlips = {}

local function isAdmin(playerId)
    return IsPlayerAceAllowed(playerId, "blipcreator")
end

local function getPlayerIdentifier(playerId)
    local licenseToUse = "license:"
    for i=1, GetNumPlayerIdentifiers(playerId) do
        local license = GetPlayerIdentifier(playerId, i)
        
        if(license) then
            if(license:sub(1, #licenseToUse) == licenseToUse) then
                return license:sub(#licenseToUse + 1, #license)
            end
        end
    end
end
-- ██████╗  ██████╗ ██╗  ██╗   ██╗    ██╗     ███████╗ █████╗ ██╗  ██╗███████╗ 
-- ██╔══██╗██╔═══██╗██║  ╚██╗ ██╔╝    ██║     ██╔════╝██╔══██╗██║ ██╔╝██╔════╝ 
-- ██████╔╝██║   ██║██║   ╚████╔╝     ██║     █████╗  ███████║█████╔╝ ███████╗ 
-- ██╔═══╝ ██║   ██║██║    ╚██╔╝      ██║     ██╔══╝  ██╔══██║██╔═██╗ ╚════██║ 
-- ██║     ╚██████╔╝███████╗██║       ███████╗███████╗██║  ██║██║  ██╗███████║ 
-- ╚═╝      ╚═════╝ ╚══════╝╚═╝       ╚══════╝╚══════╝╚═╝  ╚═╝╚═╝  ╚═╝╚══════╝ 
-- [discord.gg/gaJJjnKGpg] 
RegisterNetEvent('blips_creator:shareBlipToPlayerId')
AddEventHandler('blips_creator:shareBlipToPlayerId', function(playerId, blipData)
    TriggerClientEvent('blips_creator:giveNewBlip', playerId, GetPlayerName(playerId), blipData)
end)

RegisterNetEvent('blips_creator:isAdmin')
AddEventHandler('blips_creator:isAdmin', function()
    local playerId = source
    TriggerClientEvent('blips_creator:isAdmin', playerId, isAdmin(playerId))
end)

local function createGlobalBlip(blipData)
    MySQL.Async.fetchAll(
        'INSERT INTO global_blips (name, x, y, z, streetName, sprite, scale, alpha, color, ticked, outline, display) VALUES (@name, @x, @y, @z, @streetName, @sprite, @scale, @alpha, @color, @ticked, @outline, @display)',
        {
            ['@name'] = blipData.name,
            ['@x'] = blipData.x,
            ['@y'] = blipData.y,
            ['@z'] = blipData.z,
            ['@streetName'] = blipData.streetName,
            ['@sprite'] = blipData.sprite,
            ['@scale'] = blipData.scale,
            ['@alpha'] = blipData.alpha,
            ['@color'] = blipData.color,
            ['@ticked'] = blipData.ticked,
            ['@outline'] = blipData.outline,
            ['@display'] = blipData.display
        }, function(result)
            if (result.affectedRows > 0) then
                local blipId = result.insertId

                globalBlips[blipId] = blipData

                TriggerClientEvent('blips_creator:refreshBlips', -1)
            end
        end)
end

RegisterNetEvent('blips_creator:createGlobalBlip')
AddEventHandler('blips_creator:createGlobalBlip', function(blipData)
    local playerId = source

    if (isAdmin(playerId)) then
        createGlobalBlip(blipData)
    end
end)

local function getPlayerBlips()
    local playerId = source

    local license = getPlayerIdentifier(playerId)

    playersBlips[license] = playersBlips[license] or {}

    local allBlips = {}
    
    for blipId, blipData in pairs(playersBlips[license]) do
        allBlips[blipId] = blipData
    end

    for blipId, blipData in pairs(globalBlips) do
        allBlips[blipId] = blipData
    end

    TriggerClientEvent('blips_creator:loadPlayerBlips', playerId, allBlips)
end
RegisterNetEvent('blips_creator:getPlayerBlips', getPlayerBlips)

function getAllBlips(cb)
    MySQL.Async.fetchAll('SELECT * FROM global_blips', {}, function(blips)
        for k, blipData in pairs(blips) do
            if(blipData.identifier) then
                if(not playersBlips[blipData.identifier]) then
                    playersBlips[blipData.identifier] = {}
                end

                playersBlips[blipData.identifier][blipData.id] = blipData
            else
                globalBlips[blipData.id] = blipData
            end
        end

        cb()
    end)
end

local function saveBlip(blipId, blipData)
    local playerId = source
    local license = getPlayerIdentifier(playerId)

    if(playersBlips[license][blipId]) then        
        MySQL.Async.execute([[
            UPDATE global_blips SET 
            name=@name,
            sprite=@sprite,
            scale=@scale,
            alpha=@alpha,
            color=@color,
            ticked=@ticked,
            outline=@outline,
            display=@display
            WHERE id=@id AND identifier=@identifier
            ]],
        {
            ['@name'] = blipData.name,
            ['@sprite'] = blipData.sprite,
            ['@scale'] = blipData.scale,
            ['@alpha'] = blipData.alpha,
            ['@color'] = blipData.color,
            ['@ticked'] = blipData.ticked,
            ['@outline'] = blipData.outline,
            ['@display'] = blipData.display,
            ['@id'] = blipId,
            ['@identifier'] = license,
        }, function(affectedRows)
            if(affectedRows > 0) then
                playersBlips[license][blipId] = blipData

                TriggerClientEvent('blips_creator:refreshBlips', playerId)
            end
        end)
    elseif(globalBlips[blipId]) then
        if(isAdmin(playerId)) then
            MySQL.Async.execute([[
                UPDATE global_blips SET 
                name=@name,
                sprite=@sprite,
                scale=@scale,
                alpha=@alpha,
                color=@color,
                ticked=@ticked,
                outline=@outline,
                display=@display
                WHERE id=@id
                ]],
            {
                ['@name'] = blipData.name,
                ['@sprite'] = blipData.sprite,
                ['@scale'] = blipData.scale,
                ['@alpha'] = blipData.alpha,
                ['@color'] = blipData.color,
                ['@ticked'] = blipData.ticked,
                ['@outline'] = blipData.outline,
                ['@display'] = blipData.display,
                ['@id'] = blipId,
            }, function(affectedRows)
                if(affectedRows > 0) then
                    globalBlips[blipId] = blipData

                    TriggerClientEvent('blips_creator:refreshBlips', -1)
                end
            end)
        end
    end
end
RegisterNetEvent('blips_creator:saveBlip', saveBlip)


local function createPlayerBlip(blipData)
    local playerId = source
    local license = getPlayerIdentifier(playerId)

    if(not playersBlips[license]) then
        playersBlips[license] = {}
    end

    blipData.identifier = license

    MySQL.Async.fetchAll([[INSERT INTO global_blips(name, x, y, z, streetName, sprite, scale, alpha, color, ticked, outline, display, identifier)
        VALUES(@name, @x, @y, @z, @streetName, @sprite, @scale, @alpha, @color, @ticked, @outline, @display, @identifier)
    ]], {
        ['@name'] = blipData.name,
        ['@x'] = blipData.x,
        ['@y'] = blipData.y,
        ['@z'] = blipData.z,
        ['@streetName'] = blipData.streetName,
        ['@sprite'] = blipData.sprite,
        ['@scale'] = blipData.scale,
        ['@alpha'] = blipData.alpha,
        ['@color'] = blipData.color,
        ['@ticked'] = blipData.ticked,
        ['@outline'] = blipData.outline,
        ['@display'] = blipData.display,
        ['@identifier'] = blipData.identifier,
    }, function(result)
        if(result.affectedRows > 0) then
            local blipId = result.insertId

            playersBlips[license][blipId] = blipData

            TriggerClientEvent('blips_creator:refreshBlips', playerId)
            TriggerClientEvent('blips_creator:editBlip', playerId, blipId)
        end
    end)
end
RegisterNetEvent('blips_creator:createPlayerBlip', createPlayerBlip)

local function deleteBlip(blipId)
    local playerId = source
    local identifier = getPlayerIdentifier(playerId)

    -- If the blip is of the player
    if(playersBlips[identifier] and playersBlips[identifier][blipId]) then
        MySQL.Async.execute("DELETE FROM global_blips WHERE id=@id and identifier=@identifier", {
            ['@id'] = blipId,
            ['@identifier'] = identifier
        }, function(affectedRows)
            if(affectedRows > 0) then
                playersBlips[identifier][blipId] = nil

                TriggerClientEvent('blips_creator:refreshBlips', playerId)
            end
        end)
    elseif(globalBlips[blipId]) then -- If the blip is global
        if(isAdmin(playerId)) then
            MySQL.Async.execute("DELETE FROM global_blips WHERE id=@id", {
                ['@id'] = blipId,
            }, function(affectedRows)
                if(affectedRows > 0) then
                    globalBlips[blipId] = nil

                    TriggerClientEvent('blips_creator:refreshBlips', -1)
                end
            end)
        end
    end
end
RegisterNetEvent('blips_creator:deleteBlip', deleteBlip)

Citizen.CreateThread(function()
    setupDatabase(function() 
        getAllBlips(function()
            TriggerClientEvent('blips_creator:init', -1)
        end)
    end)
end)