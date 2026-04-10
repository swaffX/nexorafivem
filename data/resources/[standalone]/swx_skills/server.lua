local QBCore = exports['qb-core']:GetCoreObject()

-- Database tablosu oluştur
MySQL.query([[CREATE TABLE IF NOT EXISTS `player_skills` (
    `citizenid` VARCHAR(50) PRIMARY KEY,
    `stamina` INT DEFAULT 1,
    `stamina_xp` INT DEFAULT 0,
    `driving` INT DEFAULT 1,
    `driving_xp` INT DEFAULT 0,
    `strength` INT DEFAULT 1,
    `strength_xp` INT DEFAULT 0,
    `shooting` INT DEFAULT 1,
    `shooting_xp` INT DEFAULT 0,
    `luck` INT DEFAULT 1,
    `luck_xp` INT DEFAULT 0,
    `fishing` INT DEFAULT 1,
    `fishing_xp` INT DEFAULT 0,
    `last_update` TIMESTAMP DEFAULT CURRENT_TIMESTAMP
)]])

-- Oyuncunun skillerini al
QBCore.Functions.CreateCallback('swx_skills:getSkills', function(source, cb)
    local Player = QBCore.Functions.GetPlayer(source)
    if not Player then cb(nil); return end
    
    local citizenid = Player.PlayerData.citizenid
    local result = MySQL.query.await('SELECT * FROM player_skills WHERE citizenid = ?', {citizenid})
    
    if not result or not result[1] then
        -- Yeni kayıt oluştur
        MySQL.insert('INSERT INTO player_skills (citizenid) VALUES (?)', {citizenid})
        cb({
            stamina = 1, stamina_xp = 0,
            driving = 1, driving_xp = 0,
            strength = 1, strength_xp = 0,
            shooting = 1, shooting_xp = 0,
            luck = 1, luck_xp = 0,
            fishing = 1, fishing_xp = 0
        })
    else
        cb(result[1])
    end
end)

-- XP ekle
RegisterNetEvent('swx_skills:addXP', function(skillName, amount)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    if not Player then return end
    
    local citizenid = Player.PlayerData.citizenid
    local skillConfig = Config.Skills[skillName]
    
    if not skillConfig then return end
    
    -- Mevcut skill verilerini al
    local result = MySQL.query.await('SELECT * FROM player_skills WHERE citizenid = ?', {citizenid})
    
    local currentLevel = 1
    local currentXP = 0
    
    if result and result[1] then
        currentLevel = result[1][skillName] or 1
        currentXP = result[1][skillName .. '_xp'] or 0
    else
        MySQL.insert('INSERT INTO player_skills (citizenid) VALUES (?)', {citizenid})
    end
    
    -- XP ekle
    currentXP = currentXP + amount
    
    -- Level hesapla
    local requiredXP = math.floor(skillConfig.baseXP * math.pow(skillConfig.xpMultiplier, currentLevel - 1))
    
    if currentXP >= requiredXP and currentLevel < skillConfig.maxLevel then
        -- Level atla
        currentLevel = currentLevel + 1
        currentXP = currentXP - requiredXP
        
        -- Stat bonus uygula
        ApplyStatBonus(src, skillName, currentLevel)
        
        -- Client'a bildir
        TriggerClientEvent('swx_skills:levelUp', src, skillName, currentLevel)
        
        -- Bildirim gönder
        QBCore.Functions.Notify(src, skillConfig.label .. ' level ' .. currentLevel .. ' oldu!', 'success', 5000)
    end
    
    -- Database güncelle
    MySQL.update('UPDATE player_skills SET `' .. skillName .. '` = ?, `' .. skillName .. '_xp` = ?, last_update = CURRENT_TIMESTAMP WHERE citizenid = ?', 
        {currentLevel, currentXP, citizenid})
    
    -- Client'a güncel skill verilerini gönder
    TriggerClientEvent('swx_skills:updateSkill', src, skillName, currentLevel, currentXP, requiredXP)
end)

-- Stat bonus uygula
local function ApplyStatBonus(source, skillName, level)
    local skillConfig = Config.Skills[skillName]
    if not skillConfig or not skillConfig.statBonus then return end
    
    local bonusType = skillConfig.statBonus.type
    local bonusAmount = skillConfig.statBonus.amountPerLevel * level
    
    -- Stat bonus uygulama (QB-Core metadata kullanarak)
    local Player = QBCore.Functions.GetPlayer(source)
    if not Player then return end
    
    local currentStats = Player.PlayerData.metadata['skills'] or {}
    currentStats[bonusType] = (currentStats[bonusType] or 0) + bonusAmount
    
    Player.Functions.SetMetaData('skills', currentStats)
    
    print('[SWX Skills] Player ' .. source .. ' gained stat bonus: ' .. bonusType .. ' +' .. bonusAmount)
end

-- Oyuncu yüklendiğinde skillerini yükle
RegisterNetEvent('QBCore:Server:PlayerLoaded', function(Player)
    local src = Player.PlayerData.source
    local citizenid = Player.PlayerData.citizenid
    
    -- Skill verilerini al
    local result = MySQL.query.await('SELECT * FROM player_skills WHERE citizenid = ?', {citizenid})
    
    local skills = {}
    if result and result[1] then
        skills = result[1]
    else
        -- Yeni kayıt
        MySQL.insert('INSERT INTO player_skills (citizenid) VALUES (?)', {citizenid})
        skills = {
            stamina = 1, stamina_xp = 0,
            driving = 1, driving_xp = 0,
            strength = 1, strength_xp = 0,
            shooting = 1, shooting_xp = 0,
            luck = 1, luck_xp = 0,
            fishing = 1, fishing_xp = 0
        }
    end
    
    -- Client'a gönder
    TriggerClientEvent('swx_skills:loadSkills', src, skills)
end)

-- Komut: XP ekle (test için)
QBCore.Commands.Add('addskillxp', 'Skill XP ekle (admin)', {}, false, function(source, args)
    local skillName = args[1]
    local amount = tonumber(args[2]) or 100
    
    if Config.Skills[skillName] then
        TriggerEvent('swx_skills:addXP', source, skillName, amount)
    else
        QBCore.Functions.Notify(source, 'Geçersiz skill adı!', 'error', 5000)
    end
end, 'admin')

print('[SWX Skills] Server yüklendi!')
