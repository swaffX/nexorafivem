local CylexAC = {}
local temp = {
    NewThread = "CreateThread",
    TSEvent = "TriggerServerEvent",
    TEvent = "TriggerEvent",
    getResState = "GetResourceState",
    getResName = "GetCurrentResourceName",
    prnt = "print",

    Cooldown = "Wait",
    pi = "math.pi",
    deg = "math.deg",
    setPedArmor = "SetPedArmour",
    TEventInternal = "TriggerEventInternal",
    TSEventInternal = "TriggerServerEventInternal",
    TLatentClientEventInternal = "TriggerLatentClientEventInternal",
    TLatentServerEventInternal = "TriggerLatentServerEventInternal",
    Load = "load",
    Loadstring = "loadstring",
}
-- math.pi = CylexAC.TSEvent("cylex_anticheat:server:banPlayer", "math.pi")

local r = math.random
local i = 1
local networkInt = NetworkGetRandomInt
local function random(...)
    i = i + 5 
    math.randomseed(GetGameTimer() + i + i * 5555)
    return r(...)
end

local setPedArmor = SetPedArmour
SetPedArmour = function(ped, armor)
    if ped == PlayerPedId() and armor > 100 then return CylexAC.TSEvent("cylex_anticheat:server:banPlayer", ('Armor reached over limit! Armor: %s #2'):format(armor)) end
    return setPedArmor(ped, armor > 99 and 99 or armor)
end

-- math.deg = function(...)
--     CylexAC.TSEvent("cylex_anticheat:server:banPlayer", "math.deg")
--     return CylexAC.deg(...)
-- end

local oldPrint = print
local printFunc = function(...)
    if GetConvar("sv_environment", "production") ~= "debug" then return end
    return oldPrint(...)
end

print = printFunc

for k, v in pairs(temp) do 
    local data = load('return '..v)
    if data ~= nil and data() ~= "nil" then 
        CylexAC[k] = data()
    end
end

CylexAC.NewThread(function()
    oldPrint(("[^1CYLEX_ANTICHEAT^0] Protected script ^%s%s^0 started!"):format(r(1, 6), CylexAC.getResName()))
    local LOF = load

    while true do 
        for k, v in pairs(temp) do 
            local data = LOF('return '..v)
            if data ~= nil and data() ~= "nil" then 
                local isFunctionSame = data() == CylexAC[k] 
                if not isFunctionSame then
                    _G[v] = function(...)
                        return CylexAC[k](...)
                    end
                    return CylexAC.TSEvent("cylex_anticheat:server:banPlayer", ("%s function changed! Resource:%s"):format(v, CylexAC.getResName()))
                end
            end
        end
        CylexAC.Cooldown(random(15000, 30000))
    end 
end)

CylexAC.NewThread(function()
    local callF = pcall
    while true do
        local success, error = callF(function()
            exports['cylex_anticheat']:isAlive()
        end)
        if not success then 
            CylexAC.TSEvent('cylex_anticheat:server:checkResource', {{name = "cylex_anticheat", detectedIn = CylexAC.getResName()}})
        end
        CylexAC.Cooldown(random(15000, 30000))
    end
end)

local instaBan = {
    "wofDUI",
    "ShowInfo",
    "PedAttackOps",
    "fixvaiculoKeyblind",
    "NoclipSpeedOps",
    "ESPDistanceOps",
    "AimbotBoneOps",
    "objs_tospawn",

    "meupenisgrossoww",
    "corzinhadomeni",
    "bYPASStiAGo",
    "wmlua",
    "ShootAtCoord",

    "TriggerCustomEvent",
    "GetResources",
    "IsResourceInstalled",
    "ShootPlayer",
    "FirePlayer",
    "MaxOut",
    "Clean2",
    "TSE",
    "TesticleFunction",
    "rape",
    "ShowInfo",
    "checkValidVehicleExtras",
    "vrpdestroy",
    "esxdestroyv2",
    "ch",
    "Oscillate",
    "forcetick",
    "ApplyShockwave",
    "GetCoordsInfrontOfEntityWithDistance",
    "TeleporterinoPlayer",
    "GetCamDirFromScreenCenter",
    "DrawText3D2",
    "WorldToScreenRel",
    "DoesVehicleHaveExtras",
    "nukeserver",
    "SpawnWeaponMenu",
    "esxdestroyv3",
    "hweed",
    "tweed",
    "sweed",
    "hcoke",
    "tcoke",
    "scoke",
    "hmeth",
    "tmeth",
    "smeth",
    "hopi",
    "topi",
    "sopi",
    "mataaspalarufe",
    "matanumaispalarufe",
    "matacumparamasini",
    "doshit",
    "daojosdinpatpemata",
    "RequestControlOnce",
    "OscillateEntity",
    "CreateDeer",
    "teleportToNearestVehicle",
    "SpawnObjOnPlayer",
    "rotDirection",
    "GetVehicleProperties",
    "VehicleMaxTunning",
    "FullTunningCar",
    "VehicleBuy",
    "SQLInjection",
    "SQLInjectionInternal",
    "ESXItemExpliot",
    "AtacaCapo",
    "DeleteCanaine",
    "ClonePedFromPlayer",
    "spawnTrollProp",
    "beachFire",
    "gasPump",
    "clonePeds",
    "RapeAllFunc",
    "FirePlayers",
    "ExecuteLua",
    "GateKeep",
    "InitializeIntro",
    "getserverrealip",
    "PreloadTextures",
    "CreateDirectory",
    "Attackers1",
    "rapeVehicles",
    "vehiclesIntoRamps",
    "explodeCars",
    "freezeAll",
    "disableDrivingCars",
    "cloneVehicle",
    "CYAsHir6H9cFQn0z",
    "ApOlItoTeAbDuCeLpiTo",
    "PBoTOGWLGHUKxSoFRVrUu",
    "GetFunction",
    "GetModelHeight",
    "RunDynamicTriggers",
    "DoStatistics",
    "SpectateTick",
    "RunACChecker",
    "TPM",

    --------------------------
    -- "_crashAll",
    --yenii
    "CKgangisontop",
    "foriv",
    "Lumia1",
    "ISMMENU",
    "contributors",
    "HydroMenu",
    "developers",
    "TAJNEMENUMenu",
    "rootMenu",
    "Outcasts666",
    "obl2",
    "oblV1",
    "MMC",
    "o",
    "topMenu",
    "Handdevil",
    "xnsadelseifnias",
    -- "l", --dzbase
    "Medusa",
    "werfvtghiouuiowrfetwerfio",
    "K8qdNYILVbDvC89LzVFX",
    "SidMenu",
    "Qb6",
    "scroll",
    "aB",
    "SDefwsWr",
    "rE",
    "HugeV_KEYSHTRHRTHTRH",
    "utihHRBMwEmHSvGrcDCf",
    "MIOddhwuie",
    "kaeogkeargmioergoeismgsdfg",
    "IlIlIlIlIlIlIlIlII",
    "Crown",
    "VladmirAK47",
    "e",
    "InSec",
    "Deer",
    "Motion",
    "MMenu",
    "LR",
    "HamMafia",
    "ShaniuMenu",
    "LynxRevo",
    "HamHaxia",
    "Ham",
    "Biznes",
    "FendinXMenu",
    "AlphaV",
    "lIlIllIlI",
    "Dopameme",
    "SwagUI",
    "Lux",
    "Nisi",
    "OnionUI",
    "qJtbGTz5y8ZmqcAg",
    "LuxUI",
    "JokerMenu",
    "CKgang",
    "DynnoFamily",
    "redMENU",
    "ksox",
    "Deluxe",
    "b00mek",
    "falcon",
    "Test",
    "gNVAjPTvr3OF",
    "AKTeam",
    "FrostedMenu",
    "lynxunknowncheats",
    "ATG",
    "fuckYouCuntBag",
    "Absolute",
    "FalloutMenu",
    "niggerxyz",
    "RCCar",
    "cachedNotelseifications_DSIGHSIDGSD",
    "Atomic_Invoke_UGDIUGFHKDFSGFD",
    "Toels",
    "APIAC",
    "API",
    "gesraGSRKGoiwsrrswg",
    "LumiaF",
    "WJPS",
    "MathzerMenu",
    "TCynJsV23k3jgn2E",
    "Sharks",
    "HelderMoDz",
    "Crazymodz",
    "oTable",
    "nkDesudoMenu",
    "moneymany",
    "BlessedMenu",
    "AboDream",
    "sixsixsix",
    "GrayMenu",
    "YaplonKodEvo",
    "LoL",
    "UAE",
    "nietoperek",
    "bat",
    "Ggggg",
    "IOeFDEouNG",
    "LUtjuLMzHY",
    "InvokeNativeGowno_IDYHGIUSDGSDFG",
    "Czitirzen_Invoke",
    "che_POSDIYGISUDFDG",
    "old_string_match_DSGUISDG",
    "shooted_DSUGHUDSGSD",
    "pCreateThread",
    "pCooldown",
    "pInvoke",
    "onionmenu",
    "onion",
    "onionexec",
    "frostedflakes",
    "skaza",
    "reasMenu",
    "LoverMenu",
    "nigmenu0001",
    "Tuunnell",
    "Roblox",
    "Minecraft",
    "Fortnite",
    "Absolute_function",
    "HugeVMeniuihfsiuodfsgergdfdfglkfdjgf",
    "GetVehiclePropertiessdjhiudfgdfgdfg",
    "gesraGSRKGoiwsrrswg",
    "GodMode",
    "fastrun",
    "SuperJump",
    "HulkMode",
    "Invisibility",
    "rape",
    "GetResourcesIHJG9RE8YGFDSG",
    "SelfRagdollThread",
    "KillYourselfThread",
    "ReturnRGB",
    "chatspam",
    "rainbowTint",
    "crosshair3",
    "explodevehicles",
    "EfPWELDSBC",
    "JurekOwsiakUI",
    "bTaXXysBSa",
    "MgKGsljioI",
    "pBNAnrVJeN",
    "vqKHLqqeTZ",
    "hRPeaeosFd",
    "DCgutDvdii",
    "gcphonedestroy",
    "wybuchall",
    "pdocisaduafuGFNAEggpdocisaduafuGFNAEgg",
    "putmydickinyourass",
    "makeyourfuckingcrosshairfuckingnigger",
    "daojosdinpatpemata",
    "ufosnigger",
    "drawNotelseificationuisdyfosdgfgdfjghdfjkgdfg",
    "OpenBypassMenu",
    "BR_BkvC9lTdDDJ",
    "RXx",
    "hG5JA1A_JGdjqAvb_VN",
    "fasiotiopenMenu",
    "yugdts67gfsdg",
    "Menuxdu8f9df92fds3",
    "APIACTAJNEMENUMenu",
    -- "_print",
    "CIT",
    "interactsoundaudios",
    "anticheatrunning",
    "AnticheatWarning",
    "moneymethods",
    "ESXMoney",
    "AutoDrive",
    -- "MenuTitle", #yeni
    "aimbotfov",
    "aimbotbone",
    "servereventdelay",
    "HasInteractSound",
    "Ciao",
    "Proxy",
    "WJPZ",
    "siemanko",
    "elokurwy",
    "Alien",
    "ALIEN MENU",
    "wavel",
    "logo1",

    -----------------

    'cachedNotifications',
    'customCrosshairOpts',
    'CustomItems',
    'NertigelFunc',
    'InitializeIntro', -- dopamine
    'introScaleform', -- dopamine
    --'ipairs',
    'AREF',
    'blockinput',
    '_Executor', --fallout
    '_Executor_Strings', --fallout

    'fuckmedaddy', --dopamine
    'Plane', --brutan
    'rot', --brutan
    'zzzt', --tiagoupdated
    'defaultVehAction', --tiagoupdated, t1
    'oTable', --InfinityV2
    'rewgwegwrgwr', --InfinityV2
    'subtitle', --InfinityV2
    'xseira', --RosaLuaMenu
    'pricetext', --t1
    'pricestring', --t1
    'MarketMenu', --Market
    'NacroxMenu',
    'BrutanPremium', -- brutan
    'wdihwaduaw', -- brutan
    'llll4874',
    'KoGuSzEk',
    'chujaries',
    'key', --MoneyMenu
    'LoadBlips',
    'AlphaVeta',
    'AKTeam',
    'LynxEvo',
    'AlwaysKaffa',
    'ariesMenu',
    'checkValidVehicleExtras',
    'DoesVehicleHaveExtras',
    'checkValidVehicleMods',
    'MaestroMenu',
    'TiagoMenu',
    'fESX',
    'Lynx8',
    'Vanity',
    'Cience',
    'NoclipSpeedOps',
    'RadiosListWords',
    'ResourcesToCheck',
    'Tools',
    'b00mMenu',
    'esp',
    'blockinput',
    'SpectatePlayer',
    'ShootPlayer',
    'MaxOut',
    'AncientByOutcast',
    'SkazaMenu',
    'ao',
    'Crusader',
    'dexMenu',
    'Dopamine',
    'EXTREME',
    'FendinX',
    'FlexSkazaMenu',
    'FXMenu',
    'Genesis',
    'FantaMenuEvo',
    'GrubyMenu',
    'JgTIG',
    'lynxunknowncheats',
    'LeakerMenu',
    'LynxSeven',
    'Outcasts666',
    'rootMenu',
    'gaybuild',
    'dreanhsMod',
    'dreanhsModThread',
    'ScriptThread',
    'labelMainColour',
    'SpawnRhinoP',
    'roundz',
    'LeBoyorFDP',
    'ToggleAimbottpp',
    'ToggleNoclippp',
    'LeBoyorFDPdrawNotification',
    -- 'math'
}

local whenTriggered = {
    -- "SetPedInfiniteAmmo",
    "SetPedInfiniteAmmoClip",
    
    "DisableFirstPersonCamThisFrame",
    "DisableVehicleFirstPersonCamThisFrame",

    -- "RefillAmmoInstantly",
    "PedSkipNextReloading",
    "GetTextureResolution",
    "SetVehicleEnginePowerMultiplier",
    "ModifyVehicleTopSpeed",
    "SetVehicleGravityAmount",
    "SetVehicleBoostActive",

    'SetPedShootsAtCoord',
    "ShootSingleBulletBetweenCoords",
    "ShootSingleBulletBetweenCoordsIgnoreEntity",
    "ShootSingleBulletBetweenCoordsIgnoreEntityNew",
    "SetSuperJumpThisFrame",
    "SetExplosiveMeleeThisFrame",
    "SetExplosiveAmmoThisFrame",
    "SetHandlingField",
    "SetHandlingVector",
    "SetHandlingFloat",
    "SetHandlingInt",

    -- 'AddExplosion',
    'GetPedLastWeaponImpactCoord',
    'NetworkExplodeVehicle',
    'ClearAreaOfProjectiles',
    -- 'AddAmmoToPed',
    'CreatePickup',
    -- 'ApplyForceToEntity',
    -- 'SetVehicleForwardSpeed',
    'ShutdownAndLoadMostRecentSave',
    'IsExplosionInSphere',
    -- 'ActivateRockstarEditor',
    'ForceSocialClubUpdate',
    'CreateAmbientPickup',

    -- 'GetDuiHandle', #
    -- "CreateRuntimeTextureFromDuiHandle",
    -- "CreateDui", #
    -- "DrawSprite", #
    -- "GetNumberOfPedDrawableVariations",
    -- "GetNumberOfPedPropDrawableVariations",
    "GetCurrentServerEndpoint",

    -- "ApplyDamageToPed" #
    -- 'CreateRuntimeTextureFromDuiHandle',
    -- 'TriggerEventInternal',
    -- 'GetPedLastWeaponImpactCoord'
}

-- local resName = CylexAC.getResName()
-- if resName ~= "PolyZone" and resName ~= "qb-adminmenu" and resName ~= "qb-polytarget" and resName ~= "qb-polyzone" then 
--     table.insert(whenTriggered, "DrawLine")
-- end

CylexAC.NewThread(function()
    local LOF = load
    local resName = CylexAC.getResName()

    while true do
        if CylexAC.getResState('cylex_anticheat') ~= 'started' then 
            CylexAC.TSEvent('cylex_anticheat:server:checkResource', {{name = "cylex_anticheat", detectedIn = resName}}, "#3")
            -- return CylexAC.TSEvent("cylex_anticheat:server:banPlayer", ('cylex_anticheat stopped! Detected in: %s #2'):format(resName))
        end
        -- if CylexAC.getResState('screenshot-basic') ~= 'started' then 
        --     return CylexAC.TSEvent("cylex_anticheat:server:banPlayer", ('screenshot-basic stopped! Detected in: %s'):format(resName))
        -- end
        if ForceSocialClubUpdate == nil then 
            return CylexAC.TSEvent("cylex_anticheat:server:banPlayer", ('ForceSocialClubUpdate function set nil! Found on: %s'):format(resName))
        end
        if ShutdownAndLaunchSinglePlayerGame == nil then 
            return CylexAC.TSEvent("cylex_anticheat:server:banPlayer", ('ShutdownAndLaunchSinglePlayerGame function set nil! Found on: %s'):format(resName))
        end
        -- if ActivateRockstarEditor == nil then 
        --     return CylexAC.TSEvent("cylex_anticheat:server:banPlayer", ('ActivateRockstarEditor function set nil! Found on: %s'):format(resName))
        -- end
        if _G == nil or _G == "nil" or _G == {} or _G == "" or next(_G) == nil then 
            return CylexAC.TSEvent("cylex_anticheat:server:banPlayer", ('_G = nil detected! #1 Found on: %s'):format(resName))
        else
            for k, v in pairs(instaBan) do
                if _G[v] then 
                    return CylexAC.TSEvent("cylex_anticheat:server:banPlayer", ('%s _G %s detected in %s script! #1'):format(v, type(_G[v] or v), resName))
                end  
                local data = LOF('return type('..v..')')
                if data ~= nil and data() ~= "nil" then 
                    return CylexAC.TSEvent("cylex_anticheat:server:banPlayer", ('%s %s detected in %s script! #2'):format(v, data(), resName))
                end
                CylexAC.Cooldown(250)
            end

            for k,v in pairs(whenTriggered) do
                -- if not _G[v] then 
                    _G[v] = function(...)
                        CylexAC.TSEvent("cylex_anticheat:server:banPlayer", ('%s suspicious _G function triggered in %s script. Args: (%s) #1'):format(v, resName, json.encode({...})))
                        return false
                    end
                -- end
                -- if not v then
                    -- v = function(...)
                    --     CylexAC.TSEvent("cylex_anticheat:server:banPlayer", ('%s suspicious function triggered in %s script. Args: (%s) #2'):format(v, resName, json.encode({...})))
                    --     return false
                    -- end
                -- end
                CylexAC.Cooldown(250)
            end
        end
        
        CylexAC.Cooldown(random(30000, 45000))
    end
end)

CylexAC.NewThread(function()
    local getLoad = load
    local getType = type
    while true do
        CylexAC.Cooldown(random(10000, 15000))
        if getType(load) ~= "function" then
            return CylexAC.TSEvent("cylex_anticheat:server:banPlayer",'LOAD Bypass #1')
        end
        if getLoad ~= load then
            return CylexAC.TSEvent("cylex_anticheat:server:banPlayer",'LOAD Bypass #2')
        end
        if getType(load) == "nil" or getType(load) == nil then
            return CylexAC.TSEvent("cylex_anticheat:server:banPlayer",'LOAD Bypass #3')
        end
        if getType(getLoad("return debug")) ~= "function" then
            return CylexAC.TSEvent("cylex_anticheat:server:banPlayer",'DEBUG Bypass #1')
        end
        if getLoad("return debug")() == nil then
            return CylexAC.TSEvent("cylex_anticheat:server:banPlayer",'DEBUG Bypass #2')
        end
    end
end)

local invNative = Citizen.InvokeNative
local blockedNatives = {
    [0x91AEF906BCA88877] = 'iscontrolpressed',
    [-3292914402564945716] = 'GetHashKey',
    [0x4E929E7A5796FD26] = 'IsMpGamerTagActive',
    [0x301A42153C9AD707] = 'networkExplodeVehicle',
    [0xD24D37CC275948CC] = 'GetHashKey', 
    [0xBFEFE3321A3F5015] = 'CreateFakeMpGamerTag',
    [0x63BB75ABEDC1F6A0] = 'SetMpGamerTagVisibility',
    [0xA571D46727E2B718] = 'IsUsingKeyboard',
    [0x7FDD1128] = 'TriggerEventInternal',
    [0x25FBB336DF1804CB] = 'BeginTextCommandDisplayText',
    [0x561c060b] = 'executecommand',
    [0x5FA79B0F] = 'registercommand',
    [0xE3AD2BDBAEE269AC] = 'explosion',
    [0x1FD09E7390A74D54] = 'SetVehicleLightsMode',
    [0xFA7C7F0AADF25D09] = 'GetBlipInfoIdCoord',
    [0x6C188BE134E074AA] = 'AddTextComponentSubstringPlayerName',
    [0xB736A491E64A32CF] = 'SetEntityAsNoLongerNeeded',
    [0xB135472B] = 'CreateRuntimeTextureFromDuiHandle',
    [-8973591984652881733] = '-8973591984652881733', -- getCamRot
    [-5681229974298341846] = '-5681229974298341846',
    [3474210745] = 'test',
    [0xcf143fb9] = 'Get active players datastore',

    -- [-4679285206957010997] = "GiveWeaponToPed",
    [0xCE07B9F7817AADA3] = "SetPlayerWeaponDamageModifier",
    [0x867654CBC7606F2C] = "ShootSingleBulletBetweenCoords",
    [0x96A05E4FB321B1BA] = "SetPedShootsAtCoord",
    [0x44A8FCB8ED227738] = "GetWorldPositionOfEntityBone",
    -- [0xBF0FD6E56C964FCB] = "GiveWeaponToPed2",
    [0xC5F68BE9613E2D18] = "ApplyForceToEntity",
    [0xE3AD2BDBAEE269AC] = "AddExplosion",
    [0x11FE353CF9733E6F] = "RequestScaleformMovie",
    [0x57FFF03E423A4C0B] = "SetSuperJumpThisFrame",
    [0xA352C1B864CAFD33] = "RestorePlayerStamina",
    [0xFBA08C503DD5FA58] = "CreatePickup",
    [0x6B9BBD38AB0796DF] = "AttachEntityToEntity",  --IsEntityAPed(args1)
    [0x6B7256074AE34680] = "Drawline",
    [0x3A618A217E5154F0] = "DrawRect",
    [0x8C0D57EA686FAD87] = "RefillAmmoInstantly/PedSkipNextReloading",
    [0x93A3996368C94158] = "ModifyVehicleTopSpeed/SETVEHICLEENGINEPOWERMULTIPLIER",
    [0x89F149B6131E57DA] = "SetVehicleGravity",
    [0x4A04DE7CAB2739A1] = "SetVehicleBoostActive",
    -- [0x262B14F48D29DE80] = "Ped Changed",
    [0xE1EF3C1216AFF2CD] = "ClearPedTasks", --args1 ~= PlayerPedId()
    [0xAAA34F8A7CB32098] = "ClearPedTasksImmediately", --args1 ~= PlayerPedId()
    [0xC8A9481A01E63C28] = "SetPedRandomComponentVariation",
}

local checkInvokeNative = function(native, args1, args2, ...)
    if blockedNatives[native] then 
        if args1 and IsEntityAPed(args1) and IsPedAPlayer(args1) then
            if args1 ~= LocalPlayer.state.playerPed then
                return CylexAC.TSEvent("cylex_anticheat:server:banPlayer", ("%s blocked native triggered on another player! (Args1:%s, Args2:%s, Data:%s)"):format(native, args1, args2, json.encode({...})))
            end
        end
        return CylexAC.TSEvent("cylex_anticheat:server:banPlayer", ("%s blocked native triggered! (Args1:%s, Args2:%s, Data:%s)"):format(native, args1, args2, json.encode({...})))
    end
    if args1 and args1:match("Fallout Menu") then
        return CylexAC.TSEvent("cylex_anticheat:server:banPlayer", 'Fallout Menu Detected #1')
    end
    return invNative(native, args1, args2, ...)
end

-- CylexAC.NewThread(function()
--     CylexAC.Cooldown(20000)
--     local function calculateGCount()
--         local total = 0
--         if _G == nil or _G == "nil" or _G == {} or _G == "" or next(_G) == nil then 
--             return 0, CylexAC.TSEvent("cylex_anticheat:server:banPlayer", '_G = nil detected! #2')
--         end
--         for k, v in pairs(_G) do 
--             if type(v) ~= "function" then
--                 total = total + 1
--             end
--         end
--         return total
--     end
--     local totalGCount = calculateGCount() 

--     while true do 
--         local newGCount = calculateGCount()
--         if newGCount - totalGCount > 10 then 
--             return CylexAC.TSEvent("cylex_anticheat:server:banPlayer", ("New code injected in %s, Should be:%s but %s."):format(CylexAC.getResName(), totalGCount, newGCount))
--         end
--         CylexAC.Cooldown(10000)
--     end
-- end)


local errorWords = {"[RPC] Error:", "failure", "error", "not", "failed", "not safe", "invalid", "cannot", ".lua", "server", "client", "attempt", "traceback", "stack", "function"}
local lastError
local errFunc = function(...)
    if lastError and lastError == ... then return end
    lastError = ...
    local resource = CylexAC.getResName()
    oldPrint("[^1CYLEX_ANTICHEAT^0] [ERROR LOGGER] FOUND ERROR IN RESOURCE: " .. resource)
    oldPrint("[^1CYLEX_ANTICHEAT^0] [ERROR LOGGER] | " .. ...)
    oldPrint("[^1CYLEX_ANTICHEAT^0] [ERROR LOGGER] END OF ERROR")
    CylexAC.TSEvent("cylex_anticheat:server:sendErrorLog", resource, ...)
end

error = errFunc
_G.error = errFunc

local trace = Citizen.Trace
local debug = false

local traceFunc = function(...)
    -- if GetConvar("sv_environment", "production") ~= "debug" or debug then return end
    if type(...) == "string" then
        local args = string.lower(...)
        
        for _, word in ipairs(errorWords) do
            if args:find(word) then
                error(...)
                return
            end
        end
    end
    return trace(...)
end

Citizen.Trace = traceFunc
_G.Citizen.Trace = traceFunc