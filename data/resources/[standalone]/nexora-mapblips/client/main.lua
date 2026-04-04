local CreatedBlips = {}

local BlipDefinitions = {
    {
        key = 'burton_customs',
        resource = 'LosSantosCustoms',
        label = 'Burton Customs',
        coords = vector3(-337.43, -136.89, 39.01),
        sprite = 72,
        colour = 47,
        scale = 0.75,
        shortRange = true,
    },
    {
        key = 'bennys_original',
        resource = 'exemech5',
        label = "Benny's Customs",
        coords = vector3(-205.73, -1307.17, 31.29),
        sprite = 446,
        colour = 5,
        scale = 0.75,
        shortRange = true,
    },
    {
        key = 'vinewood_pd',
        resource = 'VPD',
        label = 'Vinewood Police Department',
        coords = vector3(640.25, 1.12, 82.79),
        sprite = 60,
        colour = 29,
        scale = 0.75,
        shortRange = true,
    },
    {
        key = 'sandy_sheriff',
        resource = 'hedwig_sheriff',
        label = 'Sandy Shores Sheriff',
        coords = vector3(1853.17, 3689.51, 34.27),
        sprite = 60,
        colour = 29,
        scale = 0.75,
        shortRange = true,
    },
    {
        key = 'sahp_lamesa',
        resource = 'highwaypatrol',
        label = 'SAHP Station',
        coords = vector3(826.80, -1290.00, 28.24),
        sprite = 60,
        colour = 38,
        scale = 0.75,
        shortRange = true,
    },
    {
        key = 'fib_hq',
        resource = 'fibv',
        label = 'FIB Headquarters',
        coords = vector3(136.17, -761.76, 45.75),
        sprite = 475,
        colour = 26,
        scale = 0.75,
        shortRange = true,
    },
}

local function ResourceIsActive(resourceName)
    if not resourceName or resourceName == '' then
        return true
    end

    local state = GetResourceState(resourceName)
    return state == 'started' or state == 'starting'
end

local function RemoveManagedBlip(key)
    local blip = CreatedBlips[key]
    if blip and DoesBlipExist(blip) then
        RemoveBlip(blip)
    end
    CreatedBlips[key] = nil
end

local function CreateManagedBlip(definition)
    if CreatedBlips[definition.key] or not ResourceIsActive(definition.resource) then
        return
    end

    local blip = AddBlipForCoord(definition.coords.x, definition.coords.y, definition.coords.z)
    SetBlipSprite(blip, definition.sprite)
    SetBlipColour(blip, definition.colour)
    SetBlipScale(blip, definition.scale or 0.75)
    SetBlipDisplay(blip, 4)
    SetBlipAsShortRange(blip, definition.shortRange ~= false)
    BeginTextCommandSetBlipName('STRING')
    AddTextComponentSubstringPlayerName(definition.label)
    EndTextCommandSetBlipName(blip)
    CreatedBlips[definition.key] = blip
end

local function SyncManagedBlips()
    for _, definition in ipairs(BlipDefinitions) do
        if ResourceIsActive(definition.resource) then
            CreateManagedBlip(definition)
        else
            RemoveManagedBlip(definition.key)
        end
    end
end

AddEventHandler('onClientResourceStart', function(resourceName)
    if resourceName == GetCurrentResourceName() then
        Wait(15000)
        SyncManagedBlips()
        return
    end

    for _, definition in ipairs(BlipDefinitions) do
        if definition.resource == resourceName then
            Wait(1000)
            SyncManagedBlips()
            return
        end
    end
end)

AddEventHandler('onClientResourceStop', function(resourceName)
    for _, definition in ipairs(BlipDefinitions) do
        if definition.resource == resourceName then
            RemoveManagedBlip(definition.key)
            return
        end
    end
end)

CreateThread(function()
    Wait(20000)
    SyncManagedBlips()
end)
