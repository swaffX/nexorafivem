Config.Functions = {}

Config.Functions.GetFrameworkObject = function()
    local object = nil
    if Config.Framework == "esx" then
        while object == nil do
            object = exports['es_extended']:getSharedObject()
            Citizen.Wait(0)
        end
    end
    if Config.Framework == "new-qb" then
        object = exports["qb-core"]:GetCoreObject()
    end
    if Config.Framework == "old-qb" then
        while object == nil do
            TriggerEvent('QBCore:GetObject', function(obj)object = obj end)
            Citizen.Wait(200)
        end
    end
    return object
end

Config.Functions.GetPlayer = function(source)
    if Config.Framework == "new-qb" or Config.Framework == "old-qb" then
        return Framework.Functions.GetPlayer(source)
    elseif Config.Framework == "esx" then
        return Framework.GetPlayerFromId(source)
    end
end


Citizen.CreateThread(function()
    while not Framework do
        Citizen.Wait(10)
    end
    if Config.Framework == "new-qb" or Config.Framework == "old-qb" then
        Framework.Functions.CreateCallback("cylex_garage:CheckVehicles", function(source, cb, plate, createdlocalveh)
            local vehiclePool = GetAllVehicles() 
            for i = 1, #vehiclePool do 
                if GetVehicleNumberPlateText(vehiclePool[i]) == plate then 
                    if vehiclePool[i] ~= createdlocalveh then
                        cb('false')
                        return 
                    end
                end
            end
            cb(true)
        end)
    else
        Framework.RegisterServerCallback("cylex_garage:CheckVehicles", function(source, cb) 
            local vehiclePool = GetAllVehicles() 
            for i = 1, #vehiclePool do 
                if GetVehicleNumberPlateText(vehiclePool[i]) == plate then 
                    if vehiclePool[i] ~= createdlocalveh then
                        cb('false')
                        return 
                    end
                end
            end
            cb(true)
        end)
    end
end)


Config.Functions.GetVehiclesFromPlayer = function(source)
    if Config.Framework == "new-qb" or Config.Framework == "old-qb" then
        local citizenid = Config.Functions.GetPlayer(source).PlayerData.citizenid
        local result = ExecuteSql("SELECT * FROM player_vehicles WHERE citizenid = '" .. citizenid .. "'")
        local vehicles = {}
        for k, v in pairs(result) do
            local mods = json.decode(v.mods)

            local data = {
                name = "Unknown",
                hash = v.vehicle,
                isowner = v.isowner == nil and true or v.isowner == 1 and true or false,
                plate = v.plate,
                stored = v.state == 1 and true or false,
                gas = mods and mods.fuelLevel or 0,
                engine = mods.engineHealth and math.floor(mods.engineHealth / 10) or 0,
                repair = mods.bodyHealth and math.floor(mods.bodyHealth / 10) or 0,
                isfavourite = v.isfavourite == 1 and true or false,
                fuel = mods.fuelLevel and math.floor(mods.fuelLevel) or 0,
                oil = mods and mods.oilLevel or 0,
                tankhealth = mods.tankHealth and math.floor(mods.tankHealth) / 10 or 0,
                fuellitre = 40,
                oillitre = 30,
                allmods = mods,
                garage = v.garage or 1,
                
            }
            table.insert(vehicles, data)
        end
        return vehicles
    elseif Config.Framework == "esx" then
        local vehicles = {}
        local xPlayer = Config.Functions.GetPlayer(source)
        local result = ExecuteSql("SELECT * FROM owned_vehicles WHERE owner = '" .. xPlayer.identifier .. "'")
        for k, v in pairs(result) do
            local mods = json.decode(v.vehicle)
            mods.plate = v.plate
            local data = {
                name = "Unknown",
                hash = mods.model,
                isowner = v.isowner == nil and true or v.isowner == 1 and true or false,
                plate = v.plate,
                stored = v.stored == 1 and true or false,
                gas = mods and mods.fuelLevel or 0,
                engine = mods.engineHealth and math.floor(mods.engineHealth / 10) or 0,
                repair = mods.bodyHealth and math.floor(mods.bodyHealth / 10) or 0,
                isfavourite = v.isfavourite == 1 and true or false,
                fuel = mods.fuelLevel and math.floor(mods.fuelLevel) or 0,
                oil = mods and mods.oilLevel or 0,
                tankhealth = mods.tankHealth and math.floor(mods.tankHealth) / 10 or 0,
                fuellitre = 40,
                oillitre = 30,
                allmods = mods,
                garage = v.garage or 1,
                
            }
            table.insert(vehicles, data)
        end
        return vehicles
    end
end