-- SWX Admin Panel - Server Side

QBCore = exports['qb-core']:GetCoreObject()

-- Oyuncu listesini al
QBCore.Functions.CreateCallback('swx_admin:server:getPlayers', function(source, cb)
    local players = {}
    local QBPlayers = QBCore.Functions.GetQBPlayers()
    
    for src, Player in pairs(QBPlayers) do
        local ped = GetPlayerPed(src)
        local coords = GetEntityCoords(ped)
        
        players[#players + 1] = {
            id = src,
            name = Player.PlayerData.charinfo.firstname .. ' ' .. Player.PlayerData.charinfo.lastname,
            cash = Player.PlayerData.money['cash'],
            bank = Player.PlayerData.money['bank'],
            job = Player.PlayerData.job.label,
            grade = Player.PlayerData.job.grade.name,
            ping = GetPlayerPing(src),
            coords = { x = coords.x, y = coords.y, z = coords.z }
        }
    end
    
    cb(players)
end)

-- Oyuncu detaylarını al
QBCore.Functions.CreateCallback('swx_admin:server:getPlayerDetails', function(source, cb, targetId)
    local target = QBCore.Functions.GetPlayer(targetId)
    
    if not target then
        cb(nil)
        return
    end
    
    local ped = GetPlayerPed(targetId)
    local coords = GetEntityCoords(ped)
    
    cb({
        id = targetId,
        name = target.PlayerData.charinfo.firstname .. ' ' .. target.PlayerData.charinfo.lastname,
        cash = target.PlayerData.money['cash'],
        bank = target.PlayerData.money['bank'],
        job = target.PlayerData.job.label,
        grade = target.PlayerData.job.grade.name,
        ping = GetPlayerPing(targetId),
        coords = { x = coords.x, y = coords.y, z = coords.z },
        citizenid = target.PlayerData.citizenid,
        license = target.PlayerData.license,
        steam = target.PlayerData.steam
    })
end)
