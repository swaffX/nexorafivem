local Slots = {}

-- Add the user's rockstar license: and how many slots they want to have in total
-- Example: char1:f93d82ae5f7682220105f4c73076b22176b84e372
-- Replace to (delete prefix): f93d82ae5f76222280105f4c73076b22176b84e372

-- @ If Slots.DiscordPerm.status is false | for manuel license works
-- This does not include Config.DefaultSlots, it sets the direct slot limit of the character

Slots.List = {
    -- {license = "xxxx1", totalSlot = 9},
    -- {license = "xxxx2", totalSlot = 7},
    -- {license = "xxxx3", totalSlot = 3},
    -- {license = "xxxx4", totalSlot = 4},
    -- {license = "xxxx5", totalSlot = 1},
}

-- This structure configures extra slot allocations based on Discord roles.
-- The `Slots.DiscordPerm` structure allows you to assign additional slots to users
-- based on specific Discord roles that they possess

Slots.DiscordPerm = {
    status = false,                           -- Set to true to enable this feature, or false to disable it.
    role = {
        { id = "roleid", addExtraSlot = 20 }, -- Example: Users with this role will have 20 + Config.DefaultSlots = 25 in total.
        { id = "roleid", addExtraSlot = 3 },  -- Replace 'roleid' with your Discord role ID and specify the total extra slots.
        { id = "roleid", addExtraSlot = 4 },  -- Repeat this pattern for as many roles as you need.
        { id = "roleid", addExtraSlot = 5 },
        { id = "roleid", addExtraSlot = 6 },
    }
}

Slots.CustomDeleteCharacterAccess = {
    status = false, -- Set to true to enable this feature, or false to disable it.
    list = {
        --"license:xxxxx1",
        --"license2:xxxxx3",
    }
}

return Slots
