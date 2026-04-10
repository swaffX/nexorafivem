-- SWX Admin Panel - Client Side

QBCore = exports['qb-core']:GetCoreObject()

local isOpen = false

-- J tuşu ile paneli aç/kapat
RegisterCommand('adminpanel', function()
    ToggleAdminPanel()
end, false)

RegisterKeyMapping('adminpanel', 'Admin Paneli Aç', 'keyboard', 'J')

-- Paneli aç/kapat
function ToggleAdminPanel()
    if isOpen then
        CloseAdminPanel()
    else
        OpenAdminPanel()
    end
end

-- Paneli aç
function OpenAdminPanel()
    isOpen = true
    SetNuiFocus(true, true)
    SetNuiFocusKeepInput(true)
    SendNUIMessage({
        action = 'open',
        visible = true
    })
    
    -- Oyuncu listesini al
    QBCore.Functions.TriggerCallback('swx_admin:server:getPlayers', function(players)
        SendNUIMessage({
            action = 'updatePlayers',
            players = players
        })
    end)
end

-- Paneli kapat
function CloseAdminPanel()
    isOpen = false
    SetNuiFocus(false, false)
    SetNuiFocusKeepInput(false)
    SendNUIMessage({
        action = 'close',
        visible = false
    })
end

-- NUI mesajlarını dinle
RegisterNUICallback('close', function(data, cb)
    CloseAdminPanel()
    cb({})
end)

RegisterNUICallback('refreshPlayers', function(data, cb)
    QBCore.Functions.TriggerCallback('swx_admin:server:getPlayers', function(players)
        SendNUIMessage({
            action = 'updatePlayers',
            players = players
        })
    end)
    cb({})
end)

RegisterNUICallback('getPlayerDetails', function(data, cb)
    QBCore.Functions.TriggerCallback('swx_admin:server:getPlayerDetails', function(playerDetails)
        SendNUIMessage({
            action = 'showPlayerDetails',
            playerDetails = playerDetails
        })
    end, data.playerId)
    cb({})
end)

-- ESC tuşu ile paneli kapat
CreateThread(function()
    while true do
        Wait(0)
        if isOpen then
            if IsControlJustPressed(0, 200) then -- ESC
                CloseAdminPanel()
            end
        end
    end
end)
