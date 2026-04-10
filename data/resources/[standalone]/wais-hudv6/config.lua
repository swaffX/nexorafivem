-- =====================================================
--  decrypted by https://discord.gg/6NCbAv2VNK 𝐀𝐤 𝐋𝐞𝐚𝐤𝐬 
--		Cleaned By Said Ak Using Claude Sonnet 4.5
-- =====================================================

Config = {}
Config.Framework = {
    ["Framework"] = "auto", -- auto, esx, qbcore or qbox
    ["ResourceName"] = "auto", -- auto, es_extended or qb-core or your resource name. If you using qbx you should write qb-core
    ["SharedEvent"] = "" -- Event name for old cores.
}

Config.Language = "tr" -- ar, cz, ro, it, fr, de, tr (Türkçe)
Config.ShowDebug = false -- If you set this to `true`, the debug messages will be printed in the console. If you set it to `false`, no debug messages will be printed.
Config.ShowMapOnFoot = true -- If `true` is set, the player can see the map when not in the vehicle. If `false`, the map will only be visible when in the vehicle.
Config.SendStatusAlert = false -- If this option is `true`, the player will be notified if the hunger or thirst value falls below 20. Tick `false` if you do not want to use this system
Config.StressSystem = true -- If you make `true`, stress will come next to the status bars. You will be able to see your stress values. You need to use a script for qb-stress esx for QBCore
Config.DisableRightCorner = false -- If you want to disable the top right corner, set it to `true`. This will hide all server and player information. If set to `false`, users can see and customize the top right corner.
Config.DisableMapAnimation = true -- Harita animasyonunu kapat (beyaz kaplama)
Config.MusicSystem = {
    ["disable"] = false, -- Müzik sistemi aktif (xsound entegrasyonu ile)
    ["distance"] = 30.0, -- 30 metre mesafe
}

Config.PostalMap = {
    --[[
        ⚠️ If you have a postal map, the following enabled must be true. Otherwise problems may occur.
    --]]

    ["enabled"] = false, -- If you are using PostalMap on your server, you should set this to `true`. Otherwise, the map may disappear, visibility problems or mask problems may occur.
    ["showNearPostal"] = true, -- If you do `true`, the code of the postal you are close to will appear just opposite your location information. (It may increase resmon, albeit very little)
}

Config.Commands = {
    --[[ 
        ⁉️ VERY IMPORTANT: 
        ⚠️ When the keymapping system is activated, it will create a command in users with the current key. 
        ⚠️ When you change the Key or Command, this process will change for people entering the server for the first time. 
        ⚠️ Key and Command will not change for players already on the server. 
        ⚠️ Changing this setting does not change the key assignment in the game, it only changes the default. In the game, the key assignment is changed in settings / fivem / keybinds.
    --]]

    ["cinematic"] = { -- For those who want to activate cinematic mode by command
        ["disabled"] = false, -- If you set this variable to `true`, the cinematic mode code will be completely disabled.
        ["command"] = "cinematic",
    },
    ["belt"] = { -- You can use these button settings to fasten your seat belt in the vehicle.
        ["disabled"] = false, -- If you set this variable to `true`, the belt system will be completely disabled.
        ["notification"] = true, -- If you set it to `true`, you will receive a notification for the seatbelt connection. If it is `false`, you will not see a notification, only hear a sound.
        ["keymapping"] = {
            ["key"] = "B",
            ["usable"] = true,
            ["command"] = "belt",
            ["description"] = "Emniyet Kemeri",
        },
    },
    ["settings"] = { -- You can make the necessary command or key links to open Hud's settings menu here.
        ["disabled"] = false, -- If you set this variable to `true`, the settings menu will be completely disabled.
        ["keymapping"] = {
            ["key"] = "G",
            ["usable"] = false,
            ["command"] = "hud",
            ["description"] = "HUD Ayarlarını Aç",
        },
    },
    ["editor"] = { -- If you change the key, enter the equivalent of the key you changed here in this way or it will not work!
        ["disabled"] = false, -- If you set this variable to `true`, editor mode will be completely disabled.
        ["closeKey"] = "PageUp", -- https://www.toptal.com/developers/keycode => Keys such as F1-2-3-3-4-5-6-7-8-9 should be written in upper case and other keys should be written in lower case!
        ["keymapping"] = {
            ["key"] = "PageUp",
            ["usable"] = true,
            ["command"] = "editormode",
            ["description"] = "Editör Modunu Aç",
        },
    },
    ["carcontrol"] = {
        ["key"] = "M", -- Q ( RADIO KEYBIND )
        ["command"] = "carcontrol", -- Command to open car control menu
        ["disabled"] = true, -- MENÜ TAMAMEN DEVRE DIŞI BIRAKILDI
        ["openevent"] = "wais:hudv6:client:openCarControl", -- Event to open car control menu
        ["disableKey"] = true, -- Keymapping devre dışı
        ["description"] = "Araç Kontrol Menüsünü Aç", -- Description of the command
        ["mouseControl"] = false, -- Allows you to control both the mouse and keyboard simultaneously. If you set this to `true`, you can control car control without splitting the game. If set to `false`, the game will split because your keyboard will only focus on car control.
    },
    ["postal"] = {
        ["disabled"] = false, -- If you set this variable to `true`, postal code will be completely disabled.
        ["command"] = "postal", -- Command to mark postal
    }
}

Config.MoneySettings = {
    ["name"] = "cash",
    ["isItem"] = true, -- If your money is in the form of items, make it `true`. If you are using ox_inventory, make it `false`.
    ["isOldType"] = false, -- If you have an old ESX Version or Chezza Inventory etc. If you are using esx with an old infrastructure, make `true`. If you do not know what you are doing, please leave it as `false`

    -- [[ 🟢 Inventory detections, to work automatically compatible with some inventories. 🟢 ]]
    ["qs_inventory"] = GetResourceState("qs-inventory"):find("start") and true or false,
    ["ox_inventory"] = GetResourceState("ox_inventory"):find("start") and true or false,
}

Config.RefreshTimes = {
    --[[
        ⚠️ If you lower the refresh values here, hud will use more resmon. ⚠️
    --]]

    ["carhud"] = {  -- How often to refresh carhud
        ["balanced"] = 200,
        ["performance"] = 100,
    },
    ["status"] = { -- How often to refresh status
        ["balanced"] = 250,
        ["performance"] = 100,
    },
    ["compass"] = { -- How often to refresh compass
        ["balanced"] = 750,
        ["performance"] = 500,
    },
    ["players"] = 10 * 1000, -- How often to refresh player counts
    ["statusControl"] = 1 * 60 * 1000, -- Control time of the system that checks the user hunger thirst value and sends notifications.
    ["sysControllers"] = {
        ["screenRes"] = 2 * 1000, -- The duration of the control structure that detects the screen resolution and rebuilds things accordingly
        ["beltAlarm"] = 7.5 * 1000, -- Control time for belt fastening tone and warning
    }
}

Config.BlacklistedVehicles = {
    --[[
        ⚠️ There is a special hiding and blocking feature for some tools. It works with Class or Specific Model. ⚠️
        🟢 ["belt"] = true, -- If you set this to `true`, the seat belt system will not work in this vehicle or class.
        🟢 ["music"] = true, -- If you set this to `true`, the music system will not work in this vehicle or class.
        🟢 ["carhud"] = true, -- If you set this to `true`, the carhud will not be visible in this vehicle or class.
    --]]

    ["class"] = {
        [8] = {
            ["belt"] = true,
            ["music"] = true,
        },
        [13] = {
            ["belt"] = true,
            ["music"] = true,
            ["carhud"] = true,
        },
        [14] = {
            ["belt"] = true,
        },
        [15] = {
            ["belt"] = true,
        },
        [16] = {
            ["belt"] = true,
        },
    },
    ["models"] = {
        [`t20`] = {
            ["carhud"] = true,
        },
    }
}

Config.VoiceSettings = {
    ["totalRange"] = 3,
    ["defaultRange"] = 2,
}

Config.Notification = function(title, text, type, time)
    title = title or "Hud"
    time = time or 5000

    if Config.Framework.Framework == "qbcore" then
        TriggerEvent('QBCore:Notify', text, type, time)
    elseif Config.Framework.Framework == "esx" then
        lib.notify({
            title = title,
            type = type,
            duration = time,
            description = text,
            iconAnimation = "beatFade",
            position = "center-right"
        })
    elseif GetResourceState("okokNotify"):find("start") then
        exports['okokNotify']:Alert(title, text, time, type, true)
    elseif Config.Framework.Framework == "qbox" then
        lib.notify({
            title = title,
            type = type,
            duration = time,
            description = text,
            iconAnimation = "beatFade",
            position = "center-right"
        })
    end
end

Config.Debug = function(...)
    if not Config.ShowDebug then return end
    print(...)
end

Config.GetVehicleFuel = function(vehicle)
    return GetVehicleFuelLevel(vehicle) or 0.0
end

Config.MapFactor = {
    ["1280x720"] = {
        ["square"] = {
            ["x"] = 1.65,
            ["y"] = 530,
        },
        ["circle"] = {
            ["x"] = 1.65,
            ["y"] = 550,
        }
    },
    ["1366x768"] = {
        ["square"] = {
            ["x"] = 1.65,
            ["y"] = 605,
        },
        ["circle"] = {
            ["x"] = 1.65,
            ["y"] = 625,
        }
    },
    ["1920x1080"] = {
        ["square"] = {
            ["x"] = 1.65,
            ["y"] = 1200,
        },
        ["circle"] = {
            ["x"] = 1.65,
            ["y"] = 1235,
        }
    },
    ["2560x1440"] = {
        ["square"] = {
            ["x"] = 1.65,
            ["y"] = 2125,
        },
        ["circle"] = {
            ["x"] = 1.65,
            ["y"] = 2185,
        }
    },
    
    getFactor = function(resolution, maptype)
        if Config.MapFactor[resolution] ~= nil then
            return Config.MapFactor[resolution][maptype].x, Config.MapFactor[resolution][maptype].y
        end

        Config.Debug(("MapFactor: Resolution not found, can't use the positionable feature. %s"):format(resolution))
        return nil
    end
}