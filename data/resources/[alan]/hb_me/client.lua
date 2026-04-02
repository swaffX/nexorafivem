local QBCore = exports['qb-core']:GetCoreObject()
local liczba = 0

local currentTime = "00:00"
local gotTime = false

RegisterNetEvent("hb_me:returnTime")
AddEventHandler("hb_me:returnTime", function(time)
    currentTime = time
    gotTime = true
end)

local function GetServerTime()
    gotTime = false
    TriggerServerEvent("hb_me:getTime")

    local tries = 0
    while not gotTime and tries < 10 do
        Citizen.Wait(50)
        tries = tries + 1
    end

    if not gotTime then
        currentTime = "??:??"
    end

    return currentTime
end

RegisterNetEvent("hb_me:me")
AddEventHandler("hb_me:me", function(text, source, fullName)
    local playerId = GetPlayerFromServerId(source)
    if playerId ~= -1 then
        local isDisplaying = true
        liczba = liczba + 1

        local timeNow = GetServerTime()

        TriggerEvent('chat:addMessage', {
            template = [[
                <div style="padding: 6px 10px; width: 15vw; margin: 0.2vw 0;
                background-color:   rgba(34, 34, 34, 0.7) ; border-radius: 4px;
                color: #cb73e6; font-size: 14px;">
                    <span style="color: #969494; font-weight: bold;">{0}</span> <b>{1}</b>: {2}
                </div>
            ]],
            args = { timeNow, fullName, text }
        })

        Citizen.CreateThread(function()
            local lasthtmlString = ""
            while isDisplaying do
                Citizen.Wait(0)
                local htmlString = ""
                local sourceCoords = GetEntityCoords(GetPlayerPed(playerId))
                local nearCoords = GetEntityCoords(PlayerPedId())
                local distance = Vdist2(sourceCoords, nearCoords)
                if distance < 25.0 then
                    local onScreen, xxx, yyy = GetHudScreenPositionFromWorldPosition(
                        sourceCoords.x + Config.CoordsX,
                        sourceCoords.y + Config.CoordsY,
                        sourceCoords.z + Config.CoordsZ)

                    htmlString = '<span style="position: absolute; left: ' ..
                        xxx * 100 .. '%;top: ' .. yyy * 100 ..
                        '%;"><div class="me-container"><div class="text-container">' .. text .. "</div></div></span>"
                end

                if lasthtmlString ~= htmlString then
                    SendNUIMessage({ toggle = true, html = htmlString })
                    lasthtmlString = htmlString
                end
            end

            SendNUIMessage({ toggle = false })
        end)

        Citizen.CreateThread(function()
            Citizen.Wait(Config.Duration)
            liczba = liczba - 1
            isDisplaying = false
        end)
    end
end)

RegisterNetEvent("hb_me:do")
AddEventHandler("hb_me:do", function(text, source, fullName)
    local playerId = GetPlayerFromServerId(source)
    if playerId ~= -1 then
        local isDisplaying = true
        liczba = liczba + 1

        local timeNow = GetServerTime()

        TriggerEvent('chat:addMessage', {
            template = [[
                <div style="padding: 6px 10px;width: 15vw; margin: 0.2vw 0;
                background-color: rgba(34, 34, 34, 0.7); border-radius: 4px;
                color: #54E3BA; font-size: 14px;">
                    <span style="font-weight: bold; color: #969494 ;">{0}</span> <b>{1}</b>: {2}
                </div>
            ]],
            args = { timeNow, fullName, text }
        })

        Citizen.CreateThread(function()
            local lasthtmlString = ""
            while isDisplaying do
                Citizen.Wait(0)
                local htmlString = ""
                local sourceCoords = GetEntityCoords(GetPlayerPed(playerId))
                local nearCoords = GetEntityCoords(PlayerPedId())
                local distance = Vdist2(sourceCoords, nearCoords)
                if distance < 25.0 then
                    local onScreen, xxx, yyy = GetHudScreenPositionFromWorldPosition(
                        sourceCoords.x + Config.CoordsX,
                        sourceCoords.y + Config.CoordsY,
                        sourceCoords.z + Config.CoordsZ)

                    htmlString = '<span style="position: absolute; left: ' ..
                        xxx * 100 .. '%;top: ' .. yyy * 100 ..
                        '%;"><div class="do-container"><div class="text-container">' .. text .. "</div></div></span>"
                end

                if lasthtmlString ~= htmlString then
                    SendNUIMessage({ toggle = true, html = htmlString })
                    lasthtmlString = htmlString
                end
            end

            SendNUIMessage({ toggle = false })
        end)

        Citizen.CreateThread(function()
            Citizen.Wait(Config.Duration)
            liczba = liczba - 1
            isDisplaying = false
        end)
    end
end)



RegisterNetEvent("hb_me:static")
AddEventHandler("hb_me:static", function(text, source, fullName)
    local playerId = GetPlayerFromServerId(source)
    if playerId ~= -1 then
        local isDisplaying = true
        liczba = liczba + 1

        local timeNow = GetServerTime()

        TriggerEvent('chat:addMessage', {
            template = [[
                <div style="padding: 6px 10px; width: 15vw; margin: 0.2vw 0;
                background-color:   rgba(34, 34, 34, 0.7) ; border-radius: 4px;
                color:rgb(92, 92, 92); font-size: 14px;">
                    <span style="color: #969494; font-weight: bold;">{0}</span> <b>{1}</b>: {2}
                </div>
            ]],
            args = { timeNow, fullName, text }
        })

        Citizen.CreateThread(function()
            local lasthtmlString = ""
            while isDisplaying do
                Citizen.Wait(0)
                local htmlString = ""
                local sourceCoords = GetEntityCoords(GetPlayerPed(playerId))
                local nearCoords = GetEntityCoords(PlayerPedId())
                local distance = Vdist2(sourceCoords, nearCoords)
                if distance < 25.0 then
                    local onScreen, xxx, yyy = GetHudScreenPositionFromWorldPosition(
                        sourceCoords.x + Config.CoordsX,
                        sourceCoords.y + Config.CoordsY,
                        sourceCoords.z + Config.CoordsZ)

                    htmlString = '<span style="position: absolute; left: ' ..
                        xxx * 100 .. '%;top: ' .. yyy * 100 ..
                        '%;"><div class="static-container"><div class="text-container">' .. text .. "</div></div></span>"
                end

                if lasthtmlString ~= htmlString then
                    SendNUIMessage({ toggle = true, html = htmlString })
                    lasthtmlString = htmlString
                end
            end

            SendNUIMessage({ toggle = false })
        end)

        Citizen.CreateThread(function()
            Citizen.Wait(Config.Duration)
            liczba = liczba - 1
        end)
    end
end)