local QBCore = exports['qb-core']:GetCoreObject()

local animPos = false
local MIN_SPEED = Config.AnimPose["MinSpeed"]
local MAX_SPEED = Config.AnimPose["MaxSpeed"]
local SPEED_STEP = Config.AnimPose["SpeedStep"]
local moveSpeed = Config.AnimPose["MoveSpeed"]
local OriginalPos = {
    coords = nil,
    heading = nil
}

function RotationToDirection(rot)
    local z = math.rad(rot.z)
    local x = math.rad(rot.x)
    local num = math.abs(math.cos(x))
    return vector3(-math.sin(z) * num, math.cos(z) * num, math.sin(x))
end

function getRaycastHit()
    local camCoords = GetGameplayCamCoord()
    local direction = RotationToDirection(GetGameplayCamRot(2))
    local target = camCoords + direction * 10.0
    local rayHandle = StartShapeTestRay(camCoords.x, camCoords.y, camCoords.z, target.x, target.y, target.z, 1, PlayerPedId(), 0)
    local _, hit, endCoords = GetShapeTestResult(rayHandle)
    if hit == 1 then return endCoords end
    return nil
end

function disableControls()
    DisableAllControlActions(0)

    -- CHAT
    EnableControlAction(0, 245, true) -- T

    -- KAMERA
    EnableControlAction(0, 0, true)   -- V 

    -- MOUSE / LOOK
    EnableControlAction(0, 270, true) -- Scroll Up
    EnableControlAction(0, 271, true) -- Scroll Down
    EnableControlAction(0, 272, true) -- Mouse Up
    EnableControlAction(0, 273, true) -- Mouse Down
    EnableControlAction(0, 1, true)   -- Mouse Left/Right
    EnableControlAction(0, 2, true)   -- Mouse Up/Down
    EnableControlAction(0, 4, true)
    EnableControlAction(0, 5, true)
end

RegisterNetEvent("gct-animpos:AnimPosition", function()
    if animPos then
        QBCore.Functions.Notify(Config.Language["notworking"], "error")
        return
    end
    
    -- Emote aktifse iptal et
    if exports['rpemotes'] then
        local success, result = pcall(function()
            exports['rpemotes']:EmoteCancel()
        end)
        if success then
            Wait(100) -- Emote'un tamamen iptal olması için kısa bir bekleme
        end
    end
    
    animPosition()
end)

function openUI()
    local lang = LoadResourceFile(GetCurrentResourceName(), "config/locale.json")
    if lang then
        SendNUIMessage({
            type = "setLanguage",
            data = json.decode(lang)
        })
    end

    SendNUIMessage({
        type = "showUI"
    })
end

function animPosition()
    openUI()

    local ped = PlayerPedId()
    local originalCoords = GetEntityCoords(ped)
    local originalHeading = GetEntityHeading(ped)

    OriginalPos.coords = originalCoords
    OriginalPos.heading = originalHeading

    animPos = true
    SetEntityAlpha(ped, 175, false)
    TriggerServerEvent(
        "gct-animpos:server:syncPed",
        OriginalPos.coords,
        OriginalPos.heading,
        175
    )

    FreezeEntityPosition(ped, true)
    local posChanged = false

    while true do
        disableControls()

        local coords = GetEntityCoords(ped)
        local heading = GetEntityHeading(ped)
        local dist = #(coords - OriginalPos.coords)

        SendNUIMessage({
            type = "setStatus",
            data = {
                current = math.min(dist, Config.AnimPose["MaxDist"]),
                max = Config.AnimPose["MaxDist"],
                speed = moveSpeed,
                maxSpeed = 0.5
            }
        })

        if IsDisabledControlJustReleased(0, 175) then -- Sağ Ok
            moveSpeed = math.min(moveSpeed + SPEED_STEP, MAX_SPEED)
        
            SendNUIMessage({
                type = "setStatus",
                speed = moveSpeed,
                maxSpeed = MAX_SPEED
            })
        
            SendNUIMessage({ type = "keyActive", key = "increase_speed" })
        end
        

        if IsDisabledControlJustReleased(0, 174) then -- Sol Ok
            moveSpeed = math.max(moveSpeed - SPEED_STEP, MIN_SPEED)
        
            SendNUIMessage({
                type = "setStatus",
                speed = moveSpeed,
                maxSpeed = MAX_SPEED
            })
        
            SendNUIMessage({ type = "keyActive", key = "decrease_speed" })
        end
        

        if dist <= Config.AnimPose["MaxDist"] then
            if IsDisabledControlJustReleased(0, 38) then -- E
                heading = heading - (moveSpeed * 50)            
                SetEntityHeading(ped, heading)
                SendNUIMessage({ type = "keyActive", key = "rotate_left" })

                TriggerServerEvent(
                    "gct-animpos:server:syncPed",
                    newPos,
                    GetEntityHeading(ped),
                    GetEntityAlpha(ped)
                )
            end

            if IsDisabledControlJustReleased(0, 205) then -- →
                heading = heading + (moveSpeed * 50)            
                SetEntityHeading(ped, heading)
                SendNUIMessage({ type = "keyActive", key = "rotate_right" })

                TriggerServerEvent(
                    "gct-animpos:server:syncPed",
                    newPos,
                    GetEntityHeading(ped),
                    GetEntityAlpha(ped)
                )
            end

            local rad = math.rad(heading)
            local forward = vector3(-math.sin(rad), math.cos(rad), 0)
            local right   = vector3(math.cos(rad), math.sin(rad), 0)

            if IsDisabledControlJustReleased(0, 32) then
                local newPos = coords + forward * moveSpeed
                if #(newPos - OriginalPos.coords) <= Config.AnimPose["MaxDist"] then
                    SetEntityCoordsNoOffset(ped, newPos.x, newPos.y, newPos.z, true, true)
                    SendNUIMessage({ type = "keyActive", key = "move_forward" })

                    TriggerServerEvent(
                        "gct-animpos:server:syncPed",
                        newPos,
                        GetEntityHeading(ped),
                        GetEntityAlpha(ped)
                    )
                end
            end

            if IsDisabledControlJustReleased(0, 33) then
                local newPos = coords - forward * moveSpeed
                if #(newPos - OriginalPos.coords) <= Config.AnimPose["MaxDist"] then
                    SetEntityCoordsNoOffset(ped, newPos.x, newPos.y, newPos.z, true, true)
                    SendNUIMessage({ type = "keyActive", key = "move_backward" })

                    TriggerServerEvent(
                        "gct-animpos:server:syncPed",
                        newPos,
                        GetEntityHeading(ped),
                        GetEntityAlpha(ped)
                    )
                end
            end

            if IsDisabledControlJustReleased(0, 34) then
                local newPos = coords - right * moveSpeed
                if #(newPos - OriginalPos.coords) <= Config.AnimPose["MaxDist"] then
                    SetEntityCoordsNoOffset(ped, newPos.x, newPos.y, newPos.z, true, true)
                    SendNUIMessage({ type = "keyActive", key = "move_left" })

                    TriggerServerEvent(
                        "gct-animpos:server:syncPed",
                        newPos,
                        GetEntityHeading(ped),
                        GetEntityAlpha(ped)
                    )
                end
            end

            if IsDisabledControlJustReleased(0, 35) then
                local newPos = coords + right * moveSpeed
                if #(newPos - OriginalPos.coords) <= Config.AnimPose["MaxDist"] then
                    SetEntityCoordsNoOffset(ped, newPos.x, newPos.y, newPos.z, true, true)
                    SendNUIMessage({ type = "keyActive", key = "move_right" })

                    TriggerServerEvent(
                        "gct-animpos:server:syncPed",
                        newPos,
                        GetEntityHeading(ped),
                        GetEntityAlpha(ped)
                    )
                end
            end

            if IsDisabledControlJustReleased(0, 172) then
                local newPos = vector3(coords.x, coords.y, coords.z + moveSpeed)
                if #(newPos - OriginalPos.coords) <= Config.AnimPose["MaxDist"] then
                    SetEntityCoordsNoOffset(ped, newPos.x, newPos.y, newPos.z, true, true)
                    SendNUIMessage({ type = "keyActive", key = "move_up" })

                    TriggerServerEvent(
                        "gct-animpos:server:syncPed",
                        newPos,
                        GetEntityHeading(ped),
                        GetEntityAlpha(ped)
                    )
                end
            end

            if IsDisabledControlJustReleased(0, 173) then
                local newPos = vector3(coords.x, coords.y, coords.z - moveSpeed)
                if #(newPos - OriginalPos.coords) <= Config.AnimPose["MaxDist"] then
                    SetEntityCoordsNoOffset(ped, newPos.x, newPos.y, newPos.z, true, true)
                    SendNUIMessage({ type = "keyActive", key = "move_down" })

                    TriggerServerEvent(
                        "gct-animpos:server:syncPed",
                        newPos,
                        GetEntityHeading(ped),
                        GetEntityAlpha(ped)
                    )
                end
            end

            -- CONFIRM / CANCEL
            if IsDisabledControlJustReleased(0, 191) then
                posChanged = true
                QBCore.Functions.Notify(Config.Language["confirmanim"], "success")
                SendNUIMessage({ type = "keyActive", key = "confirm" })

                SendNUIMessage({
                    type = "hideUI"
                })
                ResetEntityAlpha(ped)

                TriggerServerEvent(
                    "gct-animpos:server:syncPed",
                    coords,
                    heading,
                    0
                )
                break
            end

            if IsDisabledControlJustReleased(0, 73) then -- X
                SetEntityCoordsNoOffset(
                    ped,
                    OriginalPos.coords.x,  OriginalPos.coords.y,  OriginalPos.coords.z,
                    true, true, false
                )
                SetEntityHeading(ped, OriginalPos.heading)
                ResetEntityAlpha(ped)
                TriggerServerEvent(
                    "gct-animpos:server:syncPed",
                    OriginalPos.coords,
                    OriginalPos.heading,
                    0
                )
                FreezeEntityPosition(ped, false)
                QBCore.Functions.Notify(Config.Language["resetposition"], "error")
                posChanged = false
                animPos = false
                EnableAllControlActions(0)
                break
            end
        else
            posChanged = false
            break
        end

        Wait(1)

    end

    while posChanged do
        if IsControlJustReleased(0, 73) then -- X
            SetEntityCoordsNoOffset(
                ped,
                OriginalPos.coords.x,  OriginalPos.coords.y,  OriginalPos.coords.z,
                true, true, false
            )
            SetEntityHeading(ped, OriginalPos.heading)
            ResetEntityAlpha(ped)
            TriggerServerEvent(
                "gct-animpos:server:syncPed",
                OriginalPos.coords,
                OriginalPos.heading,
                0
            )
            QBCore.Functions.Notify(Config.Language["resetposition"], "error")
            posChanged = false
            animPos = false
            FreezeEntityPosition(ped, false)
            break
        end
        Wait(1)
    end

    if not posChanged then
        animPos = false
        ResetEntityAlpha(ped)
        TriggerServerEvent(
            "gct-animpos:server:syncPed",
            OriginalPos.coords,
            OriginalPos.heading,
            0
        )
    end

    if animPos == false then
        SendNUIMessage({
            type = "hideUI"
        })
    end
end

RegisterNetEvent("gct-animpos:client:syncPed", function(targetSrc, coords, heading, alpha)
    local targetId = GetPlayerFromServerId(targetSrc)
    if targetId == -1 then return end

    local targetPed = GetPlayerPed(targetId)
    if targetPed == PlayerPedId() then return end
    if not DoesEntityExist(targetPed) then return end

    SetEntityCoordsNoOffset(
        targetPed,
        coords.x, coords.y, coords.z,
        true, true, false
    )

    if heading then
        SetEntityHeading(targetPed, heading)
    end

    if alpha and alpha > 0 then
        SetEntityAlpha(targetPed, alpha, false)
    else
        ResetEntityAlpha(targetPed)
    end
end)