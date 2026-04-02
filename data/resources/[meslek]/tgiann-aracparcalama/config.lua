Config = {}


Config.DrawDistance       = 3.0 -- Change the distance before you can see the marker. Less is better performance.
Config.EnableBlips        = false -- Set to false to disable blips.
Config.MarkerType         = 27    -- Change to -1 to disable marker.
Config.MarkerColor        = { r = 255, g = 0, b = 0 } -- Change the marker color.

Config.CallCops           = true -- Set to true if you want cops to be alerted when chopping is in progress
Config.CallCopsPercent    = 2 -- (min1) if 1 then cops will be called every time=100%, 2=50%, 3=33%, 4=25%, 5=20%.

Config.NPCEnable          = true -- Set to false to disable NPC Ped at shop location.
Config.NPCHash			  = 68070371 --Hash of the npc ped. Change only if you know what you are doing.
Config.NPCShop	          = { x = -168.22, y = 6167.42, z = 30.32, h = 42.24 } -- Location of the shop For the npc.

Config.Items = {
    "battery",
    "airbag",
    "lowradio",
    "stockrim",
    "highradio",
    "highrim",
    "kapi",
    "speaker"
}

Config.Zones = {
    Shop = {coords = vector3(-168.22, 6167.42, 30.32)}
}