Config = {}

Config.Debug = false           -- If you want to see the debug messages in the console, you can make it true.

Config.Lang = 'pt'             -- [locales/.lua] (en, de, es, fr, pt, tr, zh)

Config.PerformanceMode = false --  true (optional)

Config.CleanZone = false       --  true (optional)

Config.HideRadar = false       --  true (optional)

Config.Identifier = 'license'  -- license or steam or discord [check your SQL > users table > identifier type]

Config.Prefix = 'char'

Config.DeleteButton = false                                               -- true or false everyone the ability to delete their own characters

Config.DefaultSlots = 1                                                  -- How many total character slots everyone will have by default

Config.DefaultSpawn = vector4(-206.9042, -1015.6588, 30.1381, 337.7682) -- [new character here]

Config.CutSceneAndGTANative = false                                      -- If you want to use the cutscene and gta native for default spawn, you can make it true.

Config.Logs = {
    Status = true,    --  true (optional)
    Logger = 'discord' -- 'discord', 'fivemerr', 'ox' (ox support: fivemanage, datadog, grafana loki logging )
}

--[[
   If your hud appears in multicharacters,
   this is nonsense, remember that hud is not shown without playerLoaded or LocalPlayer loaded,
   but that's ok, that's what this function was made for
--]]
Config.CustomHud = function(bool)
    if bool then
        -- Example: exports['hud']:SetDisplay(false)
        Debug('Hud is hidden', 'debug')
    else
        -- Example: exports['hud']:SetDisplay(true)
        Debug('Hud is show', 'debug')
    end
end

Config.Identity = {
    DobYear = {
        Lowest = 1900,  -- 112 years old is the oldest you can be.
        Highest = 2005, -- 18 years old is the youngest you can be.
    },
    CharacterName = {
        Min = 3,  -- Min Name Length.
        Max = 30, -- Max Name Length.
    },
    Errors = {
        Firstname = 'Firstname contains potentially unsafe characters',
        Lastname = 'Lastname contains potentially unsafe characters',
        LowestDob = 'Year cannot be earlier than',
        HighestDob = 'Year cannot be later than',
    }
}

--[[
    customExport = true, comp: um-idcard bl_idcard or custom
    for custom: server > editable > functions.lua
]]
Config.StarterItems = {
    { item = 'phone',          amount = 1 },
    { item = 'bmx',          amount = 1 },
    { item = 'water',          amount = 10 },
    { item = 'bread',          amount = 10 },
    { item = 'id_card',        amount = 1, customExport = false },
    { item = 'driver_license', amount = 1, customExport = false },   
}

Config.Relog = {
    Status = true,
    DeadCheck = true,  -- If you want to check if the player is dead, you can make it true.
    Command = 'offrelog', -- If you want to use relog, you can change the command.
}

-- This is the clothing numbers for new characters
Config.DefaultClothes = {
    -- Male
    ["m"] = {
        hair = 0,
        tshirt = 0,
        arms = 2,
        torso = 0,
        pants = 0,
        shoes = 0
    },
    -- Female
    ["f"] = {
        hair = 0,
        tshirt = 0,
        arms = 2,
        torso = 0,
        pants = 0,
        shoes = 0
    },
}

-----------------------------------------------------------------------------------------------------------------
-- UM - Multi Character | Customize Settings
-----------------------------------------------------------------------------------------------------------------
Config.CinematicMode = false -- If you want to use cinematic mode, you can make it true (um special?)

Config.BackgroundMusic = {
    Status = false,       -- If you want to use background music, you can make it true.
    Name = 'bgmusic.mp3', -- [web/build/audio/]
    Volume = 0.2
}

Config.Pages = {
    Credits = {
        Status = true,
        List = Credits.List -- [list/creditslist.lua]
    },
    Store = {
        Status = false,
        URL = 'https://uyuyorumstore.com'
    }
}

Config.Coords = {
    Single = Coords.List[15], -- If random false [list/coordslist.lua] | all coords = https://alp1x.github.io/um-multi-coords/
    Random = false
}

Config.Effects = {
    Status = false,          -- If you want to use effects, you can make it true.
    Single = Effect.List[6], -- If random false [list/effectlist.lua]
    Random = false
}

Config.Animation = {
    -- If you have a custom animation menu, customize the export in animationlist.lua or use scenario
    Status = false,             -- If you want to use animations, you can make it true.
    Single = Animation.List[1], -- If random false [list/animationlist.lua]
    Random = false,
    Scenario = {
        Status = false,                     -- If you want to use scenario, you can make it true.
        Single = Animation.ScenarioList[1], -- If random false [list/animationlist.lua]
        Random = false
    }
}

Config.TimeSettings = {
    --[[
       [SyncStatus]: if you are (not using vSync, or cd_easytime etc) set this to true
       this will use the weather and time on your server without any weather synchronisation

       [Any issue]: https://docs.uyuyorumstore.com/scripts/um-multicharacter/syntaxerror#other
    ]]
    SyncStatus = false,                    -- false custom weather um-multi and use event | true server current weather and time
    Event = function(bool)
        TriggerEvent('cd_easytime', bool) -- vSync or cd_easytime
    end,
    Time = 23,                             -- recommended 10-23 | not 00 or 00:00
    Weather =
    'CLEAR'                                -- CLEAR, EXTRASUNNY, CLOUDS, OVERCAST, RAIN, CLEARING , THUNDER, SMOG, FOGGY, XMAS , SNOWLIGHT, BLIZZARD
}

-----------------------------------------------------------------------------------------------------------------
-- UM - Multi Character | UM Speech
-----------------------------------------------------------------------------------------------------------------

Config.Speech = {
    Status = false, -- or true
    Volume = 1,     -- A float that represents the volume value, between 0 (lowest) and 1 (highest.)
    Rate = 2,       -- This feature is used to adjust the loudness or tone of speech. | Default 1
    Pitch = 0,      -- This feature is used to adjust the speed of speech. | Default 1

    -- I suggest using commas
    -- Think of [name] as a variable and don't change its name, you can only change where it is, for example
    -- exp: 오늘 기분이 너무 안 좋아, [name] 넌 어때?
    Texts = {
        "Hello [name], how are you today?",
        "I love you [name], maybe you've never heard that before"
    }
}

Config.ESXEvents = {
    --[[ Dont Touch This!!]]
    customizationMenu = 'esx_skin:openSaveableMenu',

    --[[ Dont Touch This!!]]
    createCharacter = 'esx_identity:completedRegistration'
}
