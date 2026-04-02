QBCore = nil
local coreLoaded = false
Citizen.CreateThread(function()
    while QBCore == nil do
        TriggerEvent('QBCore:GetObject', function(obj) QBCore = obj end)
        Citizen.Wait(200)
    end
    coreLoaded = true
end)

local washingVehicle = false

RegisterNetEvent('qbshopsKeybindGeneral')
AddEventHandler('qbshopsKeybindGeneral', function()
    local PlayerPed = PlayerPedId()
    if IsPedInAnyVehicle(PlayerPed) and coreLoaded then
        for k, v in pairs(Config.Locations) do
            if GetPedInVehicleSeat(GetVehiclePedIsIn(PlayerPed), -1) == PlayerPed then
                if not washingVehicle then
                    if #(GetEntityCoords(PlayerPed) - vector3(Config.Locations[k]["coords"]["x"], Config.Locations[k]["coords"]["y"], Config.Locations[k]["coords"]["z"])) < 2 then
                        TriggerServerEvent('qb-carwash:server:washCar')
                    end
                end
            end
        end
    end
end)

-- Citizen.CreateThread(function()
--     for k, v in pairs(Config.Locations) do
--         exports["gr-base"]:addNotif("car", "E", 'Aracı Yıkat ($'..Config.DefaultPrice..')', 2, 2, vector3(Config.Locations[k]["coords"]["x"], Config.Locations[k]["coords"]["y"], Config.Locations[k]["coords"]["z"]), true)
--     end
-- end)

RegisterNetEvent('qb-carwash:client:washCar')
AddEventHandler('qb-carwash:client:washCar', function(item)
    local PlayerPed = PlayerPedId()
    local PedVehicle = GetVehiclePedIsIn(PlayerPed)
    local Driver = GetPedInVehicleSeat(PedVehicle, -1)

        washingVehicle = true
        QBCore.Functions.Progressbar("search_cabin", "Araç Temizleniyor", math.random(4000, 8000), false, true, {
            disableMovement = true,
            disableCarMovement = true,
            disableMouse = false,
            disableCombat = true,
        }, {}, {}, {}, function() -- Done
            SetVehicleDirtLevel(PedVehicle)
            SetVehicleUndriveable(PedVehicle, false)
            WashDecalsFromVehicle(PedVehicle, 1.0)
            washingVehicle = false
        end, function() -- Cancel
        washingVehicle = false
    end)
end)

RegisterNetEvent('qb-carwash:client:temizlikkiti')
AddEventHandler('qb-carwash:client:temizlikkiti', function(item)
    local vehicle = QBCore.Functions.GetVehicleInDirection()
    local PlayerPed = PlayerPedId()
    if DoesEntityExist(vehicle) then
    TaskStartScenarioInPlace(PlayerPed, 'WORLD_HUMAN_MAID_CLEAN', 0, true)
        QBCore.Functions.Progressbar("search_cabin", "Araç Temizleniyor", math.random(4000, 8000), false, true, {
            disableMovement = true,
            disableCarMovement = true,
            disableMouse = false,
            disableCombat = true,
        }, {}, {}, {}, function() -- Done
            SetVehicleDirtLevel(vehicle)
            SetVehicleUndriveable(vehicle, false)
            WashDecalsFromVehicle(vehicle, 1.0)
            washingVehicle = false
            TriggerServerEvent('QBCore:Server:RemoveItem', 'temizlikkiti', 1)
        end, function() -- Cancel
            washingVehicle = false
            ClearPedTasksImmediately(PlayerPed)
        end)
    end
end)