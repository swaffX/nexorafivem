
local QBCore = exports['qb-core']:GetCoreObject()
local kazma, vehicle, plate = false, nil, nil
local sesler = { "rockhit1", "rockhit2", "rockhit3", "rockhit4" }

local Blips = {
    {name = "Maden", id = 237, Location = vector3(2953.65, 2788.89, 41.54)},
    {name = "Kaya Eritim & Satım", id = 237, Location = vector3(1080.22, -1982.46, 31.47)},
}

CreateThread(function()
    for _, v in pairs(Blips) do
        local blip = AddBlipForCoord(v.Location)
        SetBlipSprite(blip, v.id)
        SetBlipScale(blip, 0.8)
        SetBlipColour(blip, 0)
        SetBlipAsShortRange(blip, true) 
        BeginTextCommandSetBlipName("STRING")
        AddTextComponentString(v.name)
        EndTextCommandSetBlipName(blip)
    end
end)


local function SpawnPed(model, coords, heading)
    RequestModel(model)
    while not HasModelLoaded(model) do Wait(0) end
    local ped = CreatePed(4, model, coords.x, coords.y, coords.z - 1.0, heading, false, true)
    FreezeEntityPosition(ped, true)
    SetEntityInvincible(ped, true)
    SetBlockingOfNonTemporaryEvents(ped, true)
    return ped
end

CreateThread(function()
    SpawnPed(`s_m_m_migrant_01`, vector3(1080.15, -1982.4, 31.48), 0.0)
    SpawnPed(`s_m_m_migrant_01`, vector3(1115.38, -2003.96, 35.52), 0.0)
    SpawnPed(`s_m_m_migrant_01`, vector3(1054.59, -1952.74, 32.12), 261.1)
    exports['qb-target']:AddBoxZone("tokenal", vector3(1080.15, -1982.4, 30.48), 1.5, 1.5, {
        name = "tokenal",
        heading = 0,
        debugPoly = false,
        minZ = 29.48,
        maxZ = 32.0
    }, {
        options = {
            {
                icon = "fas fa-coins",
                label = "Bugün biraz yoruldum, tokenlerimi alabilir miyim?",
                action = function()
                    if eritmeHakki then
                        TriggerServerEvent('hb_miner:giveToken', math.random(3, 7))
                        eritmeHakki = false
                        QBCore.Functions.Notify("İşte tokenlerin.", "success")
                    else
                        QBCore.Functions.Notify("Token almak için önce taş eritmen gerekiyor", "error")
                    end
                end
            }
        },
        distance = 2.0
    })


    exports['qb-target']:AddBoxZone("kayaver", vector3(1115.38, -2003.96, 34.52), 1.5, 1.5, {
        name = "kayaver",
        heading = 0,
        debugPoly = false,
        minZ = 33.52,
        maxZ = 35.52
    }, {
        options = {
            {
                icon = "fas fa-fire",
                label = "Şu elimdeki kayaları eritebilir miyiz",
                action = function()
                    QBCore.Functions.TriggerCallback('hb_miner:hasStone', function(hasItem)
                        if hasItem then
                            QBCore.Functions.Progressbar("eritim", "Kayalar eritiliyor...", 10000, false, true, {
                                disableMovement = true,
                                disableCarMovement = true,
                                disableMouse = false,
                                disableCombat = true
                            }, {}, {}, {}, function()
                                TriggerServerEvent('hb_miner:kayalariver')
                                Wait(500)
                                QBCore.Functions.Notify("Tamamdır, tokenlerini girişten alabilirsin.", "success")
                                eritmeHakki = true
                            end, function()
                                QBCore.Functions.Notify("İşlem iptal edildi", "error")
                            end)
                        else
                            QBCore.Functions.Notify("Üzerinde eritilecek taş yok!", "error")
                        end
                    end)
                end
            }
        },
        distance = 2.0
    })

    exports['qb-target']:AddBoxZone("tokensat", vector3(1054.59, -1952.74, 31.52), 1.5, 1.5, {
        name = "tokensat",
        heading = 0,
        debugPoly = false,
        minZ = 30.12,
        maxZ = 32.12
    }, {
        options = {
            {
                icon = "fas fa-hand-paper",
                label = "Merhaba, işlemleri sizinle mi sürdüreceğiz?",
                action = function()
                    OpenMenu()
                end
            }
        },
        distance = 3.0
    })


    local barCoords = {
        { name = "bar1", coords = vector3(2938.46, 2812.81, 42.45)  },
        { name = "bar2", coords = vector3(2926.02, 2792.32, 40.27)  },
        { name = "bar3", coords = vector3(2934.49, 2784.25, 39.16)    },
        { name = "bar4", coords = vector3(2937.5, 2771.8, 38.91)  },
        { name = "bar5", coords = vector3(2947.95, 2820.74, 42.51)   },
        { name = "bar6", coords = vector3(2921.37, 2799.16, 41.15)  },
        { name = "bar7", coords = vector3(2974.06, 2745.7, 42.85)   },
        { name = "bar8", coords = vector3(2999.2, 2757.48, 43.31)   },
        { name = "bar9", coords = vector3(2972.27, 2775.08, 38.27)  },
        { name = "bar10", coords = vector3(2969.05, 2775.79, 38.68) },
        { name = "bar11", coords = vector3(2978.99, 2790.81, 40.63) },
        { name = "bar12", coords = vector3(2972.22, 2798.96, 41.21) },
        { name = "bar13", coords = vector3(2944.49, 2818.18, 42.53) },
        { name = "bar14", coords = vector3(2931.29, 2816.81, 44.59) },
        { name = "bar15", coords = vector3(2926.51, 2813.24, 44.62) },
        { name = "bar16", coords = vector3(2925.55, 2794.89, 40.55) },
        { name = "bar17", coords = vector3(2928.13, 2789.08, 39.65) },
        { name = "bar18", coords = vector3(2930.94, 2786.76, 39.13) },
        { name = "bar19", coords = vector3(2952.75, 2767.89, 39.07) },
        

    }

    CreateThread(function()
        while true do
            local sleep = 1000
            local pedCoords = GetEntityCoords(PlayerPedId())

            for _, bar in pairs(barCoords) do
                local dist = #(pedCoords - bar.coords)
                if dist < 3.0 then
                    sleep = 0
                    DrawMarker(2, bar.coords.x, bar.coords.y, bar.coords.z + 0.3, 0, 0, 0, 0, 0, 0, 0.35, 0.25, 0.15, 139, 0, 0, 80, false, true, 2, false, false, false, false)
                end
            end

            Wait(sleep)
        end
    end)

    for _, bar in ipairs(barCoords) do
        exports['qb-target']:AddCircleZone(bar.name, bar.coords, 1.0, {
            name = bar.name,
            debugPoly = false,
        }, {
            options = {
                {
                    icon = "fas fa-hammer",
                    label = "Taşı kırmaya başla",
                    action = function()
                        QBCore.Functions.TriggerCallback('hb_miner:hasPickaxe', function(hasItem)
                            if hasItem then
                                StartMining()
                            else
                                QBCore.Functions.Notify("Üzerinde kazma yok!", "error")
                            end
                        end)
                    end
                }
            },
            distance = 2.5
        })
    end
end)


function OpenMenu()
    exports['qb-menu']:openMenu({
        { header = "Merhaba, nasıl yardımcı olabilirim?", isMenuHeader = true },
        { header = "Araç kiralamak istiyorum",    txt = "Depozito ücreti var", params = { event = 'hb_miner:aracAl' } },
        { header = "Tokenlerimi satmak istiyorum",  txt = "", params = { event = 'hb_miner:tokenSat' } },
        { header = "Aracımı teslim etmek istiyorum",   txt = "", params = { event = 'hb_miner:aracKoy' } },
    })
end


RegisterNetEvent('hb_miner:tokenSat', function()
    local result = exports['qb-input']:ShowInput({
        header = "Kaç token satacaksın?",
        submitText = "Sat",
        inputs = {
            { text = "Token Miktarı", name = "amount", type = "number", isRequired = true }
        }
    })
    if result and tonumber(result.amount) then
        local amt = tonumber(result.amount)
        TriggerServerEvent('hb_miner:givePara', amt)
    else
        QBCore.Functions.Notify("Geçerli bir sayı girin", "error")
    end
end)


RegisterNetEvent('hb_miner:aracAl', function()
    if not vehicle then
        TriggerServerEvent('hb_miner:arac')
    else
        QBCore.Functions.Notify("Zaten bir aracınız var", "error")
    end
end)
RegisterNetEvent('hb_miner:AracOlustur', function()
    if vehicle then return end

    local spawnCoords = vector3(1073.89, -1949.66, 31.01)
    local heading = 135.98
    local existingVeh = GetClosestVehicle(spawnCoords.x, spawnCoords.y, spawnCoords.z, 3.0, 0, 71)

    if existingVeh ~= 0 then
        QBCore.Functions.Notify("Araç çıkış noktasında başka bir araç var!", "error")
        return
    end

    QBCore.Functions.SpawnVehicle("rebel", function(veh)
        vehicle = veh
        plate = "HBM"..math.random(100,999)
        SetVehicleNumberPlateText(veh, plate)
        TriggerEvent("vehiclekeys:client:SetOwner", plate)
        QBCore.Functions.Notify("Aracınız oluşturuldu ve anahtar teslim edildi", "success")
    end, vector4(spawnCoords.x, spawnCoords.y, spawnCoords.z, heading), true)
end)


RegisterNetEvent('hb_miner:aracKoy', function()
    if vehicle then
        local ped = PlayerPedId()
        local pedCoords = GetEntityCoords(ped)
        local vehCoords = GetEntityCoords(vehicle)
        local dist = #(pedCoords - vehCoords)

        if dist < 20.0 then
            QBCore.Functions.DeleteVehicle(vehicle)
            vehicle = nil
            plate = nil
            TriggerServerEvent('hb_miner:paraver')

            QBCore.Functions.Notify("Aracınız kaldırıldı ve paranız iade edildi.", "success")
        else
            QBCore.Functions.Notify("Aracın yanına yaklaşmalısın.", "error")
        end
    else
        QBCore.Functions.Notify("Silinecek aracınız yok.", "error")
    end
end)

function StartMining()
    if kazma then return end
    kazma = true
    local ped = PlayerPedId()
    local pickaxe = CreateObject(`prop_tool_pickaxe`, 0, 0, 0, true, true, true)
    AttachEntityToEntity(pickaxe, ped, GetPedBoneIndex(ped, 57005), 0.09, 0.03, -0.02, -78.0, 13.0, 28.0, false, false, false, false, 1, true)
    SetCurrentPedWeapon(ped, `WEAPON_UNARMED`, true)
        
    
    QBCore.Functions.Progressbar("mining_rock", "Taş kırılıyor...", 10000, false, true, {
        disableMovement = true,
        disableCarMovement = true,
        disableMouse = false,
        disableCombat = true
    }, {
        animDict = "melee@large_wpn@streamed_core",
        anim = "ground_attack_on_spot",
        flags = 49
    }, {}, {}, function()
        DeleteEntity(pickaxe)
        pickaxe = nil
        kazma = false
        TriggerServerEvent('hb_miner:givekaya')
        QBCore.Functions.Notify("Taşı başarıyla kırdın!", "success")
    end, function()
        DeleteEntity(pickaxe)
        pickaxe = nil
        kazma = false
        QBCore.Functions.Notify("İşlem iptal edildi", "error")
    end)
end