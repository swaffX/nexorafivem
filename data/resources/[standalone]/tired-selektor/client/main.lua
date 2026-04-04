Config = {}
Config.Keybind = 37 -- TAB
Config.FlashCount = 3
Config.FlashSpeed = 150

local isFlashing = false

RegisterCommand('selektorFlash', function()
    local ped = PlayerPedId()
    if IsPedInAnyVehicle(ped, false) then
        local vehicle = GetVehiclePedIsIn(ped, false)
        
        if GetPedInVehicleSeat(vehicle, -1) == ped then
            if not isFlashing then
                PerformFlashSequence(vehicle)
            end
        end
    end
end, false)

RegisterKeyMapping('selektorFlash', 'Selektor (Flash Lights)', 'keyboard', 'TAB')

function PerformFlashSequence(vehicle)
    isFlashing = true
    
    local _, lightsOn, highbeamsOn = GetVehicleLightsState(vehicle)
    
    local originalState = 0
    
    if (lightsOn == 1 or lightsOn == true) or (highbeamsOn == 1 or highbeamsOn == true) then
        originalState = 1  
        if highbeamsOn == 1 or highbeamsOn == true then
            originalState = 2 
        end
    end
    
    local lowState = 0
    if originalState >= 1 then
        lowState = 1
    end

    Citizen.CreateThread(function()
        for i = 1, Config.FlashCount do
            if not DoesEntityExist(vehicle) then 
                isFlashing = false
                return 
            end 

            SetVehicleFullbeam(vehicle, true)
            Citizen.Wait(Config.FlashSpeed)

            SetVehicleFullbeam(vehicle, false)
            Citizen.Wait(Config.FlashSpeed)
        end
        
        Citizen.Wait(50) 
        
        if originalState == 0 then
            SetVehicleLights(vehicle, 0)
        elseif originalState == 1 then
            SetVehicleFullbeam(vehicle, false)
        elseif originalState == 2 then
            SetVehicleFullbeam(vehicle, true)
        end
        
        isFlashing = false
    end)
end
