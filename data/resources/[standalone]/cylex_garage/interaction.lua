Citizen.CreateThread(function()
    while playerjob == nil do
        Citizen.Wait(10)
    end
    while true do
        local wait = 300
        local ped = PlayerPedId()
        local coords = GetEntityCoords(ped)
        for k,v in pairs(Config.Garages) do
            local dist = #(coords - vector3(v.interaction.x, v.interaction.y, v.interaction.z))
            if v.allowedjobs ~= nil then
                if IsAllowedForGarage(v.allowedjobs) then
                    if dist <= 6.0 then
                        wait = 0   
                        DrawMarker(2, v.interaction.x, v.interaction.y, v.interaction.z, 0.0, 0.0, 0.0, 0.0, 0.0,0.0, 0.5, 0.5, 0.5, 220, 20, 60, 255, 0, 1, 0, 0, 0, 0, 0)
                        local text = "~r~[E]~w~ - Garage"
                        if IsPedInAnyVehicle(ped) then
                            text = "~r~[E]~w~ - Store Vehicle"
                        end
                        if v.impound then
                            text = "~r~[E]~w~ - Cekilmis"
                        end
                        DrawText3Ds(v.interaction.x, v.interaction.y, v.interaction.z + 0.3, text)
                        if IsControlJustPressed(0, 38) then
                            if IsPedInAnyVehicle(ped) then
                                StoreVehicle()
                            else
                                CurrentGarage = k
                                TriggerServerEvent("cylex_garage:Open")
                            end
                        end
                    end
                end
            else
                if dist <= 6.0 then
                    wait = 0   
                    DrawMarker(2, v.interaction.x, v.interaction.y, v.interaction.z, 0.0, 0.0, 0.0, 0.0, 0.0,0.0, 0.5, 0.5, 0.5, 220, 20, 60, 255, 0, 1, 0, 0, 0, 0, 0)
                    local text = "~r~[E]~w~ - Garage"
                    if IsPedInAnyVehicle(ped) then
                        text = "~r~[E]~w~ - Store Vehicle"
                    end
                    if v.impound then
                        text = "~r~[E]~w~ - Cekilmis"
                    end
                    DrawText3Ds(v.interaction.x, v.interaction.y, v.interaction.z + 0.3, text)
                    if IsControlJustPressed(0, 38) then
                        if IsPedInAnyVehicle(ped) then
                            StoreVehicle()
                        else
                            CurrentGarage = k
                            TriggerServerEvent("cylex_garage:Open")
                        end
                    end
                end
            end
        end
        Wait(wait)
    end
end)



local blips = {}
local blipsVisible = false

Citizen.CreateThread(function()
    for k,v in pairs(Config.Garages) do
        local Garage = AddBlipForCoord(v.interaction.x, v.interaction.y, v.interaction.z)
        SetBlipSprite(Garage, v.impound and Config.ImpoundBlip.sprite or Config.Blip.sprite)
        SetBlipDisplay(Garage, 4)
        SetBlipScale(Garage, v.impound and Config.ImpoundBlip.scale or Config.Blip.scale)
        SetBlipAsShortRange(Garage, true)
        SetBlipColour(Garage, v.impound and Config.ImpoundBlip.color or Config.Blip.color)
        BeginTextCommandSetBlipName('STRING')
        AddTextComponentSubstringPlayerName(v.impound and Config.ImpoundBlip.label or Config.Blip.label)
        EndTextCommandSetBlipName(Garage)
        SetBlipAlpha(Garage, 0) 
        table.insert(blips, Garage)
    end
end)

RegisterNetEvent('nahtuab:client:blipgaraj')
AddEventHandler('nahtuab:client:blipgaraj', function()
    blipsVisible = not blipsVisible
    for _, blip in pairs(blips) do
        if blipsVisible then
            SetBlipAlpha(blip, 255)
        else
            SetBlipAlpha(blip, 0)
        end
    end
    if blipsVisible then
        TriggerEvent('QBCore:Notify', "Garaj - Otopark noktaları haritana eklendi", "success", 2350)
    else
        TriggerEvent('QBCore:Notify', "Garaj - Otopark haritandan kaldırıldı", "error", 2350)
    end
end)



IsAllowedForGarage = function(jobs)
    for k,v in pairs(jobs) do
        if k == playerjob then
            return true
        end
    end
    return false
end

function DrawText3Ds(x, y, z, text)
	SetTextScale(0.35, 0.35)
	SetTextFont(4)
	SetTextProportional(1)
	SetTextColour(255, 255, 255, 215)
	SetTextEntry("STRING")
	SetTextCentre(true)
	AddTextComponentString(text)
	SetDrawOrigin(x, y, z, 0)
	DrawText(0.0, 0.0)
	local factor = string.len(text) / 370
	DrawRect(0.0, 0.0125, 0.017 + factor, 0.03, 0, 0, 0, 75)
	ClearDrawOrigin()
end

OnVehicleSpawn = function(veh, vehicledata)
    
    if GetResourceState(Config.FuelResource) == "started" then 
        exports[Config.FuelResource]:SetFuel(veh, vehicledata.fuel)
    end
    
    local vehModel = GetEntityModel(veh)
    local vehName = GetDisplayNameFromVehicleModel(vehModel)
    print(vehModel)
    print(vehicledata.plate)
    print(vehName)
     
print("samifix")


end