local QBCore = exports['qb-core']:GetCoreObject()

local playerSkills = {}
local isRunning = false
local isDriving = false
local lastXPTime = 0

-- Skill verilerini yükle
RegisterNetEvent('swx_skills:loadSkills', function(skills)
    playerSkills = skills
    print('[SWX Skills] Skill verileri yüklendi')
end)

-- Skill güncelleme
RegisterNetEvent('swx_skills:updateSkill', function(skillName, level, xp, requiredXP)
    if not playerSkills[skillName] then return end
    if not Config or not Config.Skills or not Config.Skills[skillName] then return end
    
    playerSkills[skillName] = level
    playerSkills[skillName .. '_xp'] = xp
    
    -- UI güncelle
    SendNUIMessage({
        type = 'updateSkill',
        skill = skillName,
        level = level,
        xp = xp,
        requiredXP = requiredXP,
        config = Config.Skills[skillName]
    })
end)

-- Level atlayınca skill bar göster
RegisterNetEvent('swx_skills:levelUp', function(skillName, level)
    if not Config or not Config.Skills or not Config.Skills[skillName] then return end
    if not Config.ShowSkillBarDuration then return end
    
    local skillConfig = Config.Skills[skillName]
    local requiredXP = math.floor(skillConfig.baseXP * math.pow(skillConfig.xpMultiplier, level - 1))
    
    SendNUIMessage({
        type = 'showSkillBar',
        skill = skillName,
        level = level,
        xp = 0,
        requiredXP = requiredXP,
        config = skillConfig
    })
    
    -- Belirli süre sonra gizle
    SetTimeout(Config.ShowSkillBarDuration, function()
        SendNUIMessage({
            type = 'hideSkillBar',
            skill = skillName
        })
    end)
end)

-- XP kazanma kontrolü
local function CheckXPGain(skillName, activity)
    if not Config or not Config.XPActivities or not Config.XPActivities[skillName] then return end
    
    local activityConfig = Config.XPActivities[skillName]
    if not activityConfig or not activityConfig[activity] then return end
    
    local xpAmount = activityConfig[activity]
    local currentTime = GetGameTimer()
    
    -- 1 saniye bekleme süresi
    if currentTime - lastXPTime >= 1000 then
        lastXPTime = currentTime
        TriggerServerEvent('swx_skills:addXP', skillName, xpAmount)
    end
end

-- Koşma kontrolü (stamina XP)
CreateThread(function()
    while true do
        Wait(1000)
        local ped = PlayerPedId()
        
        if IsPedRunning(ped) then
            CheckXPGain('stamina', 'running')
        elseif IsPedSwimming(ped) then
            CheckXPGain('stamina', 'swimming')
        end
    end
end)

-- Sürüş kontrolü (driving XP)
CreateThread(function()
    while true do
        Wait(1000)
        local ped = PlayerPedId()
        local vehicle = GetVehiclePedIsIn(ped, false)
        
        if vehicle ~= 0 and GetPedInVehicleSeat(vehicle, -1) == ped then
            isDriving = true
            local speed = GetEntitySpeed(vehicle) * 3.6 -- km/h
            
            if speed > 50 then
                CheckXPGain('driving', 'driving')
            elseif speed > 100 then
                CheckXPGain('driving', 'racing')
            end
        else
            isDriving = false
        end
    end
end)

-- Dövüş kontrolü (strength XP)
CreateThread(function()
    while true do
        Wait(1000)
        local ped = PlayerPedId()
        
        if IsPedInMeleeCombat(ped) then
            CheckXPGain('strength', 'fighting')
        end
    end
end)

-- Silah kontrolü (shooting XP)
CreateThread(function()
    while true do
        Wait(0)
        local ped = PlayerPedId()
        
        if IsPedShooting(ped) then
            Wait(500)
            -- Hedef vurdu mu kontrolü (basit versiyon)
            -- Gelişmiş versiyon için raycast kullanılabilir
            CheckXPGain('shooting', 'target_hit')
        end
    end
end)

-- Tüm skill barlarını göster (test komutu için)
RegisterCommand('showskills', function()
    if not Config or not Config.Skills then 
        print('[SWX Skills] Config yüklenmedi!')
        return 
    end
    
    local skills = {}
    
    for skillName, skillData in pairs(Config.Skills) do
        local level = playerSkills[skillName] or 1
        local xp = playerSkills[skillName .. '_xp'] or 0
        local requiredXP = math.floor(skillData.baseXP * math.pow(skillData.xpMultiplier, level - 1))
        
        table.insert(skills, {
            name = skillName,
            level = level,
            xp = xp,
            requiredXP = requiredXP,
            config = skillData
        })
    end
    
    SendNUIMessage({
        type = 'showAllSkills',
        skills = skills
    })
    
    -- 10 saniye sonra gizle
    SetTimeout(10000, function()
        SendNUIMessage({
            type = 'hideAllSkills'
        })
    end)
end, false)

-- NUI callback
RegisterNUICallback('closeUI', function(data, cb)
    cb({})
end)

-- Login olduğunda skill verilerini iste
RegisterNetEvent('QBCore:Client:OnPlayerLoaded', function()
    Wait(2000)
    QBCore.Functions.TriggerCallback('swx_skills:getSkills', function(skills)
        if skills then
            playerSkills = skills
        end
    end)
end)

print('[SWX Skills] Client yüklendi!')
