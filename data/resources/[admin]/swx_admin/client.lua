-- SWX Admin Panel Client Script
-- J tuşuna basınca admin paneli açılır

local QBCore = nil
local isOpen = false

-- Loglama fonksiyonu
local function Log(message)
    print('[SWX Admin] ' .. message)
end

-- QBCore başlatma
CreateThread(function()
    while QBCore == nil do
        QBCore = exports['qb-core']:GetCoreObject()
        Wait(100)
    end
    Log('QBCore başarıyla yüklendi')
end)

-- NUI Callback'leri
RegisterNUICallback('getPlayers', function(data, cb)
    Log('getPlayers callback tetiklendi')
    TriggerServerEvent('swx_admin:server:getPlayers')
    cb({})
end)

RegisterNUICallback('teleportToPlayer', function(data, cb)
    Log('teleportToPlayer callback tetiklendi - PlayerID: ' .. tostring(data.playerId))
    TriggerServerEvent('swx_admin:server:teleportToPlayer', data.playerId)
    cb({})
end)

RegisterNUICallback('bringPlayer', function(data, cb)
    Log('bringPlayer callback tetiklendi - PlayerID: ' .. tostring(data.playerId))
    TriggerServerEvent('swx_admin:server:bringPlayer', data.playerId)
    cb({})
end)

RegisterNUICallback('kickPlayer', function(data, cb)
    Log('kickPlayer callback tetiklendi - PlayerID: ' .. tostring(data.playerId) .. ', Reason: ' .. tostring(data.reason))
    TriggerServerEvent('swx_admin:server:kickPlayer', data.playerId, data.reason)
    cb({})
end)

RegisterNUICallback('banPlayer', function(data, cb)
    Log('banPlayer callback tetiklendi - PlayerID: ' .. tostring(data.playerId) .. ', Reason: ' .. tostring(data.reason))
    TriggerServerEvent('swx_admin:server:banPlayer', data.playerId, data.reason)
    cb({})
end)

-- Server'dan oyuncu listesini al
RegisterNetEvent('swx_admin:client:receivePlayers', function(players)
    Log('receivePlayers event tetiklendi - Oyuncu sayısı: ' .. tostring(#players))
    SendNUIMessage({
        action = 'updatePlayers',
        players = players
    })
end)

-- Admin panelini aç/kapat
local function ToggleAdminPanel()
    isOpen = not isOpen
    
    Log('ToggleAdminPanel çağrıldı - isOpen: ' .. tostring(isOpen))
    
    if isOpen then
        SetNuiFocus(true, true)
        SendNUIMessage({
            action = 'show'
        })
        Log('Panel açıldı - NUI focus aktif')
    else
        SetNuiFocus(false, false)
        SendNUIMessage({
            action = 'hide'
        })
        Log('Panel kapatıldı - NUI focus devre dışı')
        Wait(100)
        SetNuiFocus(false, false)
    end
end

-- ESC tuşu ile paneli kapat
CreateThread(function()
    while true do
        Wait(0)
        if isOpen and IsControlJustPressed(0, 194) then -- 194 = ESC
            Log('ESC tuşuna basıldı - Panel kapatılıyor')
            ToggleAdminPanel()
        end
    end
end)

-- J tuşuna basınca paneli aç
RegisterCommand('adminpanel', function()
    Log('adminpanel komutu tetiklendi')
    ToggleAdminPanel()
end, false)

-- Key mapping
RegisterKeyMapping('adminpanel', 'Admin Panel', 'keyboard', 'J')

-- Oyuncu spawn olduğunda paneli kapat
RegisterNetEvent('QBCore:Client:OnPlayerSpawn', function()
    if isOpen then
        Log('Oyuncu spawn oldu - Panel kapatılıyor')
        ToggleAdminPanel()
    end
end)

-- Oyuncu öldüğünde paneli kapat
RegisterNetEvent('QBCore:Client:OnPlayerDeath', function()
    if isOpen then
        Log('Oyuncu öldü - Panel kapatılıyor')
        ToggleAdminPanel()
    end
end)

-- Kaynak durduğunda paneli kapat
AddEventHandler('onResourceStop', function(resourceName)
    if GetCurrentResourceName() == resourceName and isOpen then
        Log('Kaynak duruyor - Panel kapatılıyor')
        SetNuiFocus(false, false)
    end
end)

-- Kaynak başladığında log
AddEventHandler('onResourceStart', function(resourceName)
    if GetCurrentResourceName() == resourceName then
        Log('SWX Admin script başlatıldı')
    end
end)
