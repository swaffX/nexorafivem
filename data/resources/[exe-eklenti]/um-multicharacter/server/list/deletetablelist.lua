DeleteTableList = {}

--[[

    List of SQL tables that you want to delete the character's records when the character is deleted by admin or user
    If you don't have some tables here, don't worry, you don't need to delete them, it won't give an error, you can add your own
    to see tables that are not there, you can see them in the server console if you set Config.Debug to true

--]]

-- Default ESX Tables
--[[
    example:
    steam: 'steam:xxx'
    license: 'license:xxx'
    discord: 'discord:xxx'
    identifier: 'char1:xxx'
]]
DeleteTableList.Tables = {
    {
        table = 'users',
        column = 'identifier',
        type = 'identifier' -- steam, license, discord, identifier (identifier example char1:xxxxx)
    },
    -- {
    --     table = 'spawnbookmarks',
    --     column = 'license',
    --     type = 'license' -- steam, license, discord, identifier (identifier example char1:xxxxx)
    -- },
}