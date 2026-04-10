-- SWX Admin Panel Server Script
-- Oyuncu listesi ve admin işlemleri

local QBCore = exports['qb-core']:GetCoreObject()

-- Admin yetkisi kontrolü
local function IsAdmin(playerId)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    
    if not Player then return false end
    
    local group = Player.PlayerData.group
    return group == 'admin' or group == 'superadmin' or group == 'god'
end

-- Oyuncu listesini al
RegisterNetEvent('swx_admin:server:getPlayers')
AddEventHandler('swx_admin:server:getPlayers', function()
    local src = source
    
    if not IsAdmin(src) then
        return
    end
    
    local players = {}
    
    for _, playerId in ipairs(GetPlayers()) do
        local Player = QBCore.Functions.GetPlayer(tonumber(playerId))
        
        if Player then
            table.insert(players, {
                id = tonumber(playerId),
                name = Player.PlayerData.charinfo.firstname .. ' ' .. Player.PlayerData.charinfo.lastname,
                ping = GetPlayerPing(tonumber(playerId)),
                money = Player.PlayerData.money.cash,
                bank = Player.PlayerData.money.bank,
                blackMoney = Player.PlayerData.money.black,
                group = Player.PlayerData.group,
                job = Player.PlayerData.job.label,
                jobGrade = Player.PlayerData.job.grade.level,
                gang = Player.PlayerData.gang.label,
                gangGrade = Player.PlayerData.gang.grade.level
            })
        end
    end
    
    TriggerClientEvent('swx_admin:client:receivePlayers', src, players)
end)

-- Oyuncuya ışınla
RegisterNetEvent('swx_admin:server:teleportToPlayer')
AddEventHandler('swx_admin:server:teleportToPlayer', function(targetId)
    local src = source
    
    if not IsAdmin(src) then
        return
    end
    
    local AdminPed = GetPlayerPed(src)
    local TargetPed = GetPlayerPed(targetId)
    
    if AdminPed and TargetPed then
        local targetCoords = GetEntityCoords(TargetPed)
        SetEntityCoords(AdminPed, targetCoords.x, targetCoords.y, targetCoords.z, false, false, false, false)
    end
end)

-- Oyuncuyu getir
RegisterNetEvent('swx_admin:server:bringPlayer')
AddEventHandler('swx_admin:server:bringPlayer', function(targetId)
    local src = source
    
    if not IsAdmin(src) then
        return
    end
    
    local AdminPed = GetPlayerPed(src)
    local TargetPed = GetPlayerPed(targetId)
    
    if AdminPed and TargetPed then
        local adminCoords = GetEntityCoords(AdminPed)
        SetEntityCoords(TargetPed, adminCoords.x, adminCoords.y, adminCoords.z, false, false, false, false)
    end
end)

-- Oyuncuyu at
RegisterNetEvent('swx_admin:server:kickPlayer')
AddEventHandler('swx_admin:server:kickPlayer', function(targetId, reason)
    local src = source
    
    if not IsAdmin(src) then
        return
    end
    
    DropPlayer(targetId, reason or 'Admin tarafından atıldın')
end)

-- Oyuncuyu yasakla
RegisterNetEvent('swx_admin:server:banPlayer')
AddEventHandler('swx_admin:server:banPlayer', function(targetId, reason)
    local src = source
    
    if not IsAdmin(src) then
        return
    end
    
    local Player = QBCore.Functions.GetPlayer(targetId)
    
    if Player then
        local license = Player.PlayerData.license
        local name = Player.PlayerData.charinfo.firstname .. ' ' .. Player.PlayerData.charinfo.lastname
        
        -- Ban kaydı oluştur
        MySQL.Async.insert('INSERT INTO bans (name, license, reason, banned_by, expire) VALUES (?, ?, ?, ?, ?)', {
            name,
            license,
            reason or 'Admin tarafından yasaklandı',
            GetPlayerName(src),
            2147483647 -- Kalıcı ban
        })
        
        DropPlayer(targetId, reason or 'Admin tarafından yasaklandın')
    end
end)

-- Kaynak başladığında
AddEventHandler('onResourceStart', function(resourceName)
    if GetCurrentResourceName() == resourceName then
        print('[SWX Admin] Script başlatıldı')
    end
end)
