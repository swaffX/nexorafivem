-- SWX Admin Panel Server Script
-- Oyuncu listesi ve admin işlemleri

local QBCore = exports['qb-core']:GetCoreObject()

-- Loglama fonksiyonu
local function Log(message)
    print('[SWX Admin Server] ' .. message)
end

-- Admin yetkisi kontrolü
local function IsAdmin(playerId)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    
    if not Player then 
        Log('IsAdmin kontrolü başarısız - Player bulunamadı - Source: ' .. tostring(src))
        return false 
    end
    
    local group = Player.PlayerData.group
    local isAdmin = group == 'admin' or group == 'superadmin' or group == 'god'
    Log('IsAdmin kontrolü - Source: ' .. tostring(src) .. ', Group: ' .. tostring(group) .. ', IsAdmin: ' .. tostring(isAdmin))
    return isAdmin
end

-- Oyuncu listesini al
RegisterNetEvent('swx_admin:server:getPlayers')
AddEventHandler('swx_admin:server:getPlayers', function()
    local src = source
    
    Log('getPlayers event tetiklendi - Source: ' .. tostring(src))
    
    if not IsAdmin(src) then
        Log('getPlayers - Yetki reddedildi')
        return
    end
    
    local players = {}
    local allPlayers = GetPlayers()
    Log('Toplam oyuncu sayısı: ' .. tostring(#allPlayers))
    
    for _, playerId in ipairs(allPlayers) do
        local Player = QBCore.Functions.GetPlayer(tonumber(playerId))
        
        if Player then
            Log('Oyuncu eklendi - ID: ' .. tostring(playerId) .. ', Name: ' .. (Player.PlayerData.charinfo.firstname .. ' ' .. Player.PlayerData.charinfo.lastname))
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
        else
            Log('Oyuncu bulunamadı - ID: ' .. tostring(playerId))
        end
    end
    
    Log('Oyuncu listesi gönderiliyor - Source: ' .. tostring(src) .. ', Oyuncu sayısı: ' .. tostring(#players))
    TriggerClientEvent('swx_admin:client:receivePlayers', src, players)
end)

-- Oyuncuya ışınla
RegisterNetEvent('swx_admin:server:teleportToPlayer')
AddEventHandler('swx_admin:server:teleportToPlayer', function(targetId)
    local src = source
    
    Log('teleportToPlayer event tetiklendi - Source: ' .. tostring(src) .. ', TargetID: ' .. tostring(targetId))
    
    if not IsAdmin(src) then
        Log('teleportToPlayer - Yetki reddedildi')
        return
    end
    
    local AdminPed = GetPlayerPed(src)
    local TargetPed = GetPlayerPed(targetId)
    
    if AdminPed and TargetPed then
        local targetCoords = GetEntityCoords(TargetPed)
        SetEntityCoords(AdminPed, targetCoords.x, targetCoords.y, targetCoords.z, false, false, false, false)
        Log('Işınlama başarılı')
    else
        Log('Işınlama başarısız - Ped bulunamadı')
    end
end)

-- Oyuncuyu getir
RegisterNetEvent('swx_admin:server:bringPlayer')
AddEventHandler('swx_admin:server:bringPlayer', function(targetId)
    local src = source
    
    Log('bringPlayer event tetiklendi - Source: ' .. tostring(src) .. ', TargetID: ' .. tostring(targetId))
    
    if not IsAdmin(src) then
        Log('bringPlayer - Yetki reddedildi')
        return
    end
    
    local AdminPed = GetPlayerPed(src)
    local TargetPed = GetPlayerPed(targetId)
    
    if AdminPed and TargetPed then
        local adminCoords = GetEntityCoords(AdminPed)
        SetEntityCoords(TargetPed, adminCoords.x, adminCoords.y, adminCoords.z, false, false, false, false)
        Log('Getirme başarılı')
    else
        Log('Getirme başarısız - Ped bulunamadı')
    end
end)

-- Oyuncuyu at
RegisterNetEvent('swx_admin:server:kickPlayer')
AddEventHandler('swx_admin:server:kickPlayer', function(targetId, reason)
    local src = source
    
    Log('kickPlayer event tetiklendi - Source: ' .. tostring(src) .. ', TargetID: ' .. tostring(targetId) .. ', Reason: ' .. tostring(reason))
    
    if not IsAdmin(src) then
        Log('kickPlayer - Yetki reddedildi')
        return
    end
    
    DropPlayer(targetId, reason or 'Admin tarafından atıldın')
    Log('Oyuncu atıldı - ID: ' .. tostring(targetId))
end)

-- Oyuncuyu yasakla
RegisterNetEvent('swx_admin:server:banPlayer')
AddEventHandler('swx_admin:server:banPlayer', function(targetId, reason)
    local src = source
    
    Log('banPlayer event tetiklendi - Source: ' .. tostring(src) .. ', TargetID: ' .. tostring(targetId) .. ', Reason: ' .. tostring(reason))
    
    if not IsAdmin(src) then
        Log('banPlayer - Yetki reddedildi')
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
        Log('Oyuncu yasaklandı - ID: ' .. tostring(targetId))
    else
        Log('Yasaklama başarısız - Player bulunamadı')
    end
end)

-- Kaynak başladığında
AddEventHandler('onResourceStart', function(resourceName)
    if GetCurrentResourceName() == resourceName then
        Log('SWX Admin script başlatıldı')
    end
end)
