local QBCore = exports['qb-core']:GetCoreObject()

local playerSkills = {}
local isRunning = false
local isDriving = false
local lastXPTime = { stamina = 0, driving = 0 } -- Her skill için ayrı cooldown
local accumulatedXP = {} -- Her skill için biriktirilen XP
local inVehicle = false
local drivingStartTime = 0

-- Skill verilerini yükle
RegisterNetEvent('swx_skills:loadSkills', function(skills)
    playerSkills = skills
end)

-- Skill güncelleme
RegisterNetEvent('swx_skills:updateSkill', function(skillName, level, xp, requiredXP)
    if not Config or not Config.Skills or not Config.Skills[skillName] then return end
    
    -- playerSkills'i başlat (eğer boşsa)
    if not playerSkills then
        playerSkills = {}
    end
    
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

-- Skill bar güncelleme göster
local function ShowSkillBarUpdate(skillName)
    if not Config or not Config.Skills or not Config.Skills[skillName] then return end
    if not playerSkills then playerSkills = {} end
    
    local skillConfig = Config.Skills[skillName]
    local level     = playerSkills[skillName] or 1
    local currentXP = playerSkills[skillName .. '_xp'] or 0
    local requiredXP = math.floor(skillConfig.baseXP * math.pow(skillConfig.xpMultiplier, level - 1))
    
    SendNUIMessage({
        type = 'showSkillBar',
        skill = skillName,
        level = level,
        xp = currentXP,
        requiredXP = requiredXP,
        config = skillConfig
    })
    
    -- 3 saniye sonra gizle
    SetTimeout(3000, function()
        SendNUIMessage({
            type = 'hideSkillBar',
            skill = skillName
        })
    end)
end

-- XP kazanma kontrolü
local function CheckXPGain(skillName, activity)
    if not Config or not Config.XPActivities or not Config.XPActivities[skillName] then return end
    
    local activityConfig = Config.XPActivities[skillName]
    if not activityConfig or not activityConfig[activity] then return end
    
    local xpAmount = activityConfig[activity]
    local currentTime = GetGameTimer()
    
    -- Her skill için ayrı 1 saniyelik cooldown
    if not lastXPTime[skillName] then lastXPTime[skillName] = 0 end
    if currentTime - lastXPTime[skillName] >= 1000 then
        lastXPTime[skillName] = currentTime
        
        -- XP biriktir
        if not accumulatedXP[skillName] then
            accumulatedXP[skillName] = 0
        end
        accumulatedXP[skillName] = accumulatedXP[skillName] + xpAmount
        
        -- Threshold'a ulaştıysa server'a gönder ve bar göster
        if accumulatedXP[skillName] >= (Config.XPThreshold or 10) then
            local xpToSend = accumulatedXP[skillName] -- Kaydet
            accumulatedXP[skillName] = 0 -- Hemen sıfırla
            
            -- Lokalde hemen güncelle (server cevabı beklemeden)
            if not playerSkills then playerSkills = {} end
            playerSkills[skillName] = playerSkills[skillName] or 1
            playerSkills[skillName .. '_xp'] = (playerSkills[skillName .. '_xp'] or 0) + xpToSend
            
            -- Skill bar göster
            ShowSkillBarUpdate(skillName)
            
            -- Server'a gönder (database kayıt + doğrulama için)
            TriggerServerEvent('swx_skills:addXP', skillName, xpToSend)
        end
    end
end

-- Dayanıklılık kontrolü (koşu / sprint / yüzme / bisiklet)
CreateThread(function()
    while true do
        Wait(1000)
        local ped = PlayerPedId()
        local vehicle = GetVehiclePedIsIn(ped, false)
        local inVehicle = vehicle ~= 0

        if IsPedSwimming(ped) then
            CheckXPGain('stamina', 'swimming')
        elseif inVehicle and GetVehicleClass(vehicle) == 13 and GetEntitySpeed(vehicle) * 3.6 > 5 then
            -- Sadece bisiklet (class 13), motorsiklet (class 8) değil
            CheckXPGain('stamina', 'cycling')
        elseif not inVehicle and IsPedSprinting(ped) then
            -- Araçta değilken sprint
            CheckXPGain('stamina', 'sprinting')
        elseif not inVehicle and IsPedRunning(ped) then
            -- Araçta değilken koşu
            CheckXPGain('stamina', 'running')
        end
    end
end)

-- Sürüş kontrolü (hız kademesine göre XP)
CreateThread(function()
    while true do
        Wait(1000)
        local ped     = PlayerPedId()
        local vehicle = GetVehiclePedIsIn(ped, false)

        if vehicle ~= 0 and GetPedInVehicleSeat(vehicle, -1) == ped then
            if not inVehicle then
                inVehicle = true
                drivingStartTime = GetGameTimer()
            end

            local speed = GetEntitySpeed(vehicle) * 3.6 -- km/h

            if speed > 150 then
                CheckXPGain('driving', 'racing')
            elseif speed > 100 then
                CheckXPGain('driving', 'fast')
            elseif speed > 50 then
                CheckXPGain('driving', 'cruising')
            end
        elseif inVehicle then
            -- Araçtan indiğinde XP ver
            local drivingTime = (GetGameTimer() - drivingStartTime) / 1000 -- saniye
            if drivingTime >= 10 then -- En az 10 saniye sürmüş olmalı
                local bonusXP = math.floor(drivingTime / 10) * 50 -- Her 10 saniye için 50 XP
                if bonusXP > 0 then
                    -- XP biriktir
                    if not accumulatedXP['driving'] then
                        accumulatedXP['driving'] = 0
                    end
                    accumulatedXP['driving'] = accumulatedXP['driving'] + bonusXP

                    -- Threshold'a ulaştıysa server'a gönder
                    if accumulatedXP['driving'] >= (Config.XPThreshold or 10) then
                        local xpToSend = accumulatedXP['driving']
                        accumulatedXP['driving'] = 0

                        if not playerSkills then playerSkills = {} end
                        playerSkills['driving'] = playerSkills['driving'] or 1
                        playerSkills['driving_xp'] = (playerSkills['driving_xp'] or 0) + xpToSend

                        ShowSkillBarUpdate('driving')
                        TriggerServerEvent('swx_skills:addXP', 'driving', xpToSend)
                    end
                end
            end
            inVehicle = false
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

local function LoadSkills()
    Wait(2000)
    QBCore.Functions.TriggerCallback('swx_skills:getSkills', function(skills)
        if skills then
            playerSkills = skills
        end
    end)
end

-- Login olduğunda skill verilerini iste
RegisterNetEvent('QBCore:Client:OnPlayerLoaded', function()
    LoadSkills()
end)

-- Resource restart olduğunda verileri koru
AddEventHandler('onResourceStart', function(resourceName)
    if resourceName ~= GetCurrentResourceName() then return end
    if LocalPlayer.state.isLoggedIn then
        LoadSkills()
    end
end)

