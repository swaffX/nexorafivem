local QBCore = exports['qb-core']:GetCoreObject()
local spawnedProps = {}
local lastHarvested = {}


CreateThread(function()
    for _, farm in pairs(Config.FarmZones) do
        local blip = AddBlipForCoord(farm.center)

        SetBlipSprite(blip, 237)
        SetBlipDisplay(blip, 4)
        SetBlipScale(blip, 0.8)
        SetBlipColour(blip, 0)
        SetBlipAsShortRange(blip, true)

        BeginTextCommandSetBlipName("STRING")
        AddTextComponentString(farm.name)
        EndTextCommandSetBlipName(blip)
    end
end)


CreateThread(function()
    while true do
        Wait(3000)
        local playerCoords = GetEntityCoords(PlayerPedId())
        for i, zone in ipairs(Config.FarmZones) do
            local distance = #(playerCoords - zone.center)
            if distance <= 30.0 then
                if not spawnedProps[i] then
                    spawnedProps[i] = {}
                    SpawnFarmProps(i, zone)
                end
            else
                if spawnedProps[i] then
                    RemoveFarmProps(i)
                end
            end
        end
    end
end)

function SpawnFarmProps(index, zone)
    for n = 1, zone.propCount do
        local offsetX = math.random(-zone.radius, zone.radius)
        local offsetY = math.random(-zone.radius, zone.radius)
        local propCoords = vector3(zone.center.x + offsetX, zone.center.y + offsetY, zone.center.z)
        local key = string.format("%.2f_%.2f_%.2f", propCoords.x, propCoords.y, propCoords.z)
        if not lastHarvested[key] or (GetGameTimer() - lastHarvested[key]) >= Config.RespawnTime then
            local prop = CreatePropAt(propCoords, zone.propModel)
            if prop then
                table.insert(spawnedProps[index], {entity = prop, coords = propCoords})
                AddPropTarget(prop, index, zone, propCoords)
            end
        end
    end
end

function RemoveFarmProps(index)
    for _, data in pairs(spawnedProps[index]) do
        if DoesEntityExist(data.entity) then
            DeleteEntity(data.entity)
        end
    end
    spawnedProps[index] = nil
end

function CreatePropAt(coords, propModel)
    local propHash = propModel
    RequestModel(propHash)
    while not HasModelLoaded(propHash) do Wait(10) end
    local obj = CreateObject(propHash, coords.x, coords.y, coords.z - 1.0, false, true, false)
    PlaceObjectOnGroundProperly(obj)
    FreezeEntityPosition(obj, true)
    return obj
end

function AddPropTarget(prop, index, zone, coords)
    exports['qb-target']:AddTargetEntity(prop, {
        options = {
            {
                icon = "fas fa-seedling",
                label = "Topla ("..zone.name..")",
                action = function()
                    HarvestProduct(prop, index, zone, coords)
                end
            }
        },
        distance = 2.0
    })
end

-- Yeni: Animasyon oynatma fonksiyonu
local function PlayHarvestAnim(animDict, animName, duration)
    local ped = PlayerPedId()
    RequestAnimDict(animDict)
    while not HasAnimDictLoaded(animDict) do Wait(10) end
    -- flag 49: loop + upperbody + controllable, duration ms olarak ayarlandı
    TaskPlayAnim(ped, animDict, animName, 8.0, -8.0, duration, 49, 0, false, false, false)
end

function HarvestProduct(prop, index, zone, coords)
    QBCore.Functions.TriggerCallback("qb-farmjob:checkOrak", function(hasOrak)
        if not hasOrak then
            QBCore.Functions.Notify("Orak yok!", "error")
            return
        end

        exports['ps-ui']:Circle(function(success)
            if success then
                -- Animasyon varsa yükle ve başlat
                if zone.anim and zone.anim.dict and zone.anim.name then
                    local ped = PlayerPedId()
                    RequestAnimDict(zone.anim.dict)
                    while not HasAnimDictLoaded(zone.anim.dict) do Wait(10) end
                    -- Progress bar süresi ile aynı süre (5000 ms)
                    TaskPlayAnim(ped, zone.anim.dict, zone.anim.name, 8.0, -8.0, 5000, 49, 0, false, false, false)
                end

                -- Progress bar başla
                QBCore.Functions.Progressbar("harvesting", "Ürün toplanıyor...", 5000, false, true, {
                    disableMovement = true,
                    disableCarMovement = true,
                    disableMouse = false,
                    disableCombat = true,
                }, {}, {}, {}, function()  -- onFinish
                    ClearPedTasks(PlayerPedId())
                    TriggerServerEvent("qb-farmjob:harvestProduct", zone.product)
                    local key = string.format("%.2f_%.2f_%.2f", coords.x, coords.y, coords.z)
                    lastHarvested[key] = GetGameTimer()
                    DeleteEntity(prop)
                    QBCore.Functions.Notify((zone.label or zone.name).." toplandı. 1 saat sonra tekrar çıkacak.", "success")
                end, function() -- onCancel
                    ClearPedTasks(PlayerPedId())
                    QBCore.Functions.Notify("Toplama iptal edildi.", "error")
                end)
            else
                QBCore.Functions.Notify("Başarısız oldun!", "error")
            end
        end, 3, 15)
    end, Config.RequiredItem)
end


CreateThread(function()
    for _, wash in ipairs(Config.WashStations) do
        exports['qb-target']:AddBoxZone("wash_station"..wash.label, wash.coords, wash.radius, wash.radius, {
            name="wash_station"..wash.label,
            heading=0,
            debugPoly=false,
            minZ=wash.coords.z-1,
            maxZ=wash.coords.z+1
        }, {
            options = {
                {
                    icon = "fas fa-water",
                    label = wash.label,
                    action = function()
                        WashProduct()
                    end
                }
            },
            distance = 2.5
        })
    end
end)

function WashProduct()
    exports['ps-ui']:Circle(function(success)
        if success then
            QBCore.Functions.Progressbar("washing", "Sebzeler yıkanıyor...", 4000, false, true, {
                disableMovement = true,
                disableCarMovement = true,
                disableMouse = false,
                disableCombat = true,
            }, {}, {}, {}, function()
                TriggerServerEvent("qb-farmjob:washProduct")
            end)
        else
            QBCore.Functions.Notify("Başarısız oldun!", "error")
        end
    end, 4, 12)
end
