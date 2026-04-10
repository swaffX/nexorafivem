-- SWX Admin Panel Client Script
-- J tuşuna basınca admin paneli açılır

local isOpen = false

-- NUI Callback'leri
RegisterNUICallback('getPlayers', function(data, cb)
    TriggerServerEvent('swx_admin:server:getPlayers')
    -- Server'dan yanıt bekleyeceğiz
    cb({})
end)

RegisterNUICallback('teleportToPlayer', function(data, cb)
    TriggerServerEvent('swx_admin:server:teleportToPlayer', data.playerId)
    cb({})
end)

RegisterNUICallback('bringPlayer', function(data, cb)
    TriggerServerEvent('swx_admin:server:bringPlayer', data.playerId)
    cb({})
end)

RegisterNUICallback('kickPlayer', function(data, cb)
    TriggerServerEvent('swx_admin:server:kickPlayer', data.playerId, data.reason)
    cb({})
end)

RegisterNUICallback('banPlayer', function(data, cb)
    TriggerServerEvent('swx_admin:server:banPlayer', data.playerId, data.reason)
    cb({})
end)

-- Server'dan oyuncu listesini al
RegisterNetEvent('swx_admin:client:receivePlayers', function(players)
    SendNUIMessage({
        action = 'updatePlayers',
        players = players
    })
end)

-- Admin panelini aç/kapat
local function ToggleAdminPanel()
    isOpen = not isOpen
    
    if isOpen then
        SetNuiFocus(true, true)
        SendNUIMessage({
            action = 'show'
        })
    else
        SetNuiFocus(false, false)
        SendNUIMessage({
            action = 'hide'
        })
    end
end

-- J tuşuna basınca paneli aç
RegisterCommand('adminpanel', function()
    ToggleAdminPanel()
end, false)

-- Key mapping
RegisterKeyMapping('adminpanel', 'Admin Panel', 'keyboard', 'J')

-- Oyuncu spawn olduğunda paneli kapat
RegisterNetEvent('QBCore:Client:OnPlayerSpawn', function()
    if isOpen then
        ToggleAdminPanel()
    end
end)

-- Oyuncu öldüğünde paneli kapat
RegisterNetEvent('QBCore:Client:OnPlayerDeath', function()
    if isOpen then
        ToggleAdminPanel()
    end
end)

-- Kaynak durduğunda paneli kapat
AddEventHandler('onResourceStop', function(resourceName)
    if GetCurrentResourceName() == resourceName and isOpen then
        SetNuiFocus(false, false)
    end
end)
