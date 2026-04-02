local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1, L10_1, L11_1, L12_1, L13_1, L14_1, L15_1, L16_1, L17_1, L18_1, L19_1, L20_1, L21_1, L22_1
wFramework = nil
L0_1 = Config
L0_1 = L0_1.Framework
L0_1 = L0_1.Framework
if "esx" == L0_1 then
  L0_1 = Config
  L0_1 = L0_1.Framework
  L0_1 = L0_1.NewCore
  if L0_1 then
    L0_1 = exports
    L1_1 = Config
    L1_1 = L1_1.Framework
    L1_1 = L1_1.ResourceName
    L0_1 = L0_1[L1_1]
    L1_1 = L0_1
    L0_1 = L0_1.getSharedObject
    L0_1 = L0_1(L1_1)
    wFramework = L0_1
  else
    while true do
      L0_1 = wFramework
      if nil ~= L0_1 then
        break
      end
      L0_1 = TriggerEvent
      L1_1 = Config
      L1_1 = L1_1.Framework
      L1_1 = L1_1.SharedEvent
      function L2_1(A0_2)
        local L1_2
        wFramework = A0_2
      end
      L0_1(L1_1, L2_1)
      L0_1 = Wait
      L1_1 = 10
      L0_1(L1_1)
    end
  end
else
  L0_1 = Config
  L0_1 = L0_1.Framework
  L0_1 = L0_1.Framework
  if "qbcore" ~= L0_1 then
    L0_1 = Config
    L0_1 = L0_1.Framework
    L0_1 = L0_1.Framework
    if "qbox" ~= L0_1 then
      goto lbl_73
    end
  end
  L0_1 = Config
  L0_1 = L0_1.Framework
  L0_1 = L0_1.NewCore
  if L0_1 then
    L0_1 = exports
    L1_1 = Config
    L1_1 = L1_1.Framework
    L1_1 = L1_1.ResourceName
    L0_1 = L0_1[L1_1]
    L1_1 = L0_1
    L0_1 = L0_1.GetCoreObject
    L0_1 = L0_1(L1_1)
    wFramework = L0_1
  else
    while true do
      L0_1 = wFramework
      if nil ~= L0_1 then
        break
      end
      L0_1 = TriggerEvent
      L1_1 = Config
      L1_1 = L1_1.Framework
      L1_1 = L1_1.SharedEvent
      function L2_1(A0_2)
        local L1_2
        wFramework = A0_2
      end
      L0_1(L1_1, L2_1)
      L0_1 = Wait
      L1_1 = 10
      L0_1(L1_1)
    end
  end
end
::lbl_73::
target = nil
L0_1 = PlayerId
L0_1 = L0_1()
pId = L0_1
L0_1 = {}
L1_1 = {}
L1_1.job_center = "job_center"
L1_1.job_menu = "job_menu_%s"
L1_1.trailer_list = "trailer_list_%s"
L1_1.line_list = "line_list_%s"
L1_1.group_menu = "group_menu_%s"
L1_1.group_members = "group_list_%s"
L1_1.project_car_list = "project_car_list_%s"
L1_1.vehicle_componenets = "project_vehicle_components_%s"
L1_1.cargo_list = "forklifter_cargo_list_%s"
L1_1.diver_missions = "diver_mission_list_%s"
L1_1.farmer_missions = "farmer_mission_list_%s"
L1_1.electrician_missions = "electrician_mission_list_%s"
L2_1 = {}
L3_1 = "a_m_m_bevhills_01"
L4_1 = "a_m_y_business_01"
L5_1 = "a_m_y_beach_01"
L6_1 = "s_m_m_highsec_01"
L7_1 = "a_m_y_smartcaspat_01"
L8_1 = "a_m_m_beach_01"
L9_1 = "a_m_y_genstreet_01"
L10_1 = "a_m_y_bevhills_02"
L11_1 = "s_m_m_ciasec_01"
L12_1 = "a_m_m_eastsa_02"
L13_1 = "a_f_m_bevhills_01"
L14_1 = "a_f_y_beach_01"
L15_1 = "a_f_y_business_02"
L16_1 = "a_f_y_bevhills_02"
L17_1 = "a_f_y_tourist_01"
L18_1 = "a_f_y_smartcaspat_01"
L19_1 = "a_f_y_fitness_01"
L20_1 = "a_f_y_vinewood_02"
L21_1 = "a_f_y_bevhills_03"
L22_1 = "a_f_y_tennis_01"
L2_1[1] = L3_1
L2_1[2] = L4_1
L2_1[3] = L5_1
L2_1[4] = L6_1
L2_1[5] = L7_1
L2_1[6] = L8_1
L2_1[7] = L9_1
L2_1[8] = L10_1
L2_1[9] = L11_1
L2_1[10] = L12_1
L2_1[11] = L13_1
L2_1[12] = L14_1
L2_1[13] = L15_1
L2_1[14] = L16_1
L2_1[15] = L17_1
L2_1[16] = L18_1
L2_1[17] = L19_1
L2_1[18] = L20_1
L2_1[19] = L21_1
L2_1[20] = L22_1
L3_1 = {}
L4_1 = "WORLD_HUMAN_STAND_MOBILE"
L5_1 = "WORLD_HUMAN_SMOKING"
L6_1 = "WORLD_HUMAN_CLIPBOARD"
L7_1 = "WORLD_HUMAN_AA_COFFEE"
L8_1 = "WORLD_HUMAN_HANG_OUT_STREET"
L9_1 = "WORLD_HUMAN_STAND_IMPATIENT"
L10_1 = "WORLD_HUMAN_TOURIST_MAP"
L11_1 = "WORLD_HUMAN_STAND_IMPATIENT_UPRIGHT"
L12_1 = "PROP_HUMAN_BUM_BIN"
L13_1 = "WORLD_HUMAN_MUSICIAN"
L3_1[1] = L4_1
L3_1[2] = L5_1
L3_1[3] = L6_1
L3_1[4] = L7_1
L3_1[5] = L8_1
L3_1[6] = L9_1
L3_1[7] = L10_1
L3_1[8] = L11_1
L3_1[9] = L12_1
L3_1[10] = L13_1
L4_1 = {}
L4_1.active = false
L4_1.ownerId = 0
L4_1.groupId = nil
L5_1 = {}
L4_1.players = L5_1
L4_1.job = nil
L4_1.showMembers = false
Group = L4_1
Scenarios = L3_1
PedModels = L2_1
menus = L1_1
PlayerData = L0_1
L0_1 = {}
L1_1 = {}
L2_1 = {}
L3_1 = {}
L4_1 = {}
memberBlips = L4_1
blips = L3_1
props = L2_1
targets = L1_1
points = L0_1
L0_1 = false
L1_1 = false
L2_1 = nil
L3_1 = false
sideJob = false
isDead = L3_1
vehicle = L2_1
takeJobOutfit = L1_1
CurrentJob = L0_1
L0_1 = nil
L1_1 = nil
L2_1 = nil
L3_1 = false
L4_1 = RegisterNetEvent
L5_1 = "QBCore:Client:OnPlayerUnload"
function L6_1()
  local L0_2, L1_2
  L0_2 = changeToDefaultAll
  L0_2()
end
L4_1(L5_1, L6_1)
L4_1 = RegisterNetEvent
L5_1 = "esx:onPlayerLogout"
function L6_1()
  local L0_2, L1_2
  L0_2 = changeToDefaultAll
  L0_2()
end
L4_1(L5_1, L6_1)
L4_1 = RegisterNetEvent
L5_1 = "esx:setJob"
function L6_1()
  local L0_2, L1_2
  L0_2 = Wait
  L1_2 = 1000
  L0_2(L1_2)
  L0_2 = initJobs
  L0_2()
end
L4_1(L5_1, L6_1)
L4_1 = RegisterNetEvent
L5_1 = "QBCore:Client:OnJobUpdate"
function L6_1()
  local L0_2, L1_2
  L0_2 = Wait
  L1_2 = 1000
  L0_2(L1_2)
  L0_2 = initJobs
  L0_2()
end
L4_1(L5_1, L6_1)
L4_1 = RegisterNetEvent
L5_1 = "wais:change:deadstate"
function L6_1(A0_2)
  local L1_2
  isDead = A0_2
  if A0_2 then
    L1_2 = playerDead
    L1_2()
  end
end
L4_1(L5_1, L6_1)
L4_1 = AddStateBagChangeHandler
L5_1 = "qbx_medical:deathState"
L6_1 = "player:%s"
L7_1 = L6_1
L6_1 = L6_1.format
L8_1 = cache
L8_1 = L8_1.serverId
L6_1 = L6_1(L7_1, L8_1)
function L7_1(A0_2, A1_2, A2_2)
  local L3_2, L4_2
  L3_2 = type
  L4_2 = A2_2
  L3_2 = L3_2(L4_2)
  if "number" == L3_2 then
    if A2_2 > 1 then
      L3_2 = true
      if L3_2 then
        goto lbl_12
      end
    end
    L3_2 = false
    ::lbl_12::
    isDead = L3_2
  else
    isDead = A2_2
  end
  if A2_2 then
    L3_2 = playerDead
    L3_2()
  end
end
L4_1(L5_1, L6_1, L7_1)
L4_1 = RegisterNetEvent
L5_1 = "wais:group:haveNewGroup"
function L6_1(A0_2, A1_2, A2_2, A3_2, A4_2)
  local L5_2, L6_2, L7_2, L8_2, L9_2
  L5_2 = Group
  L5_2.active = true
  L5_2 = Group
  L5_2.ownerId = A0_2
  L5_2 = Group
  L5_2.groupId = A1_2
  L5_2 = Group
  L5_2.players = A2_2
  L5_2 = Group
  L5_2.job = A3_2
  L5_2 = Group
  L5_2.showMembers = A4_2
  L5_2 = multiplayerMenus
  L6_2 = Group
  L6_2 = L6_2.job
  L5_2(L6_2)
  L5_2 = Config
  L5_2 = L5_2.Notification
  L6_2 = Lang
  L7_2 = "job"
  L6_2 = L6_2(L7_2)
  L7_2 = Lang
  L8_2 = "have_new_group"
  L9_2 = A3_2
  L7_2 = L7_2(L8_2, L9_2)
  L8_2 = "inform"
  L9_2 = 7500
  L5_2(L6_2, L7_2, L8_2, L9_2)
end
L4_1(L5_1, L6_1)
L4_1 = RegisterNetEvent
L5_1 = "wais:group:default"
function L6_1()
  local L0_2, L1_2, L2_2, L3_2, L4_2, L5_2, L6_2, L7_2
  L0_2 = next
  L1_2 = memberBlips
  L0_2 = L0_2(L1_2)
  if nil ~= L0_2 then
    L0_2 = pairs
    L1_2 = memberBlips
    L0_2, L1_2, L2_2, L3_2 = L0_2(L1_2)
    for L4_2, L5_2 in L0_2, L1_2, L2_2, L3_2 do
      L6_2 = DoesBlipExist
      L7_2 = L5_2
      L6_2 = L6_2(L7_2)
      if L6_2 then
        L6_2 = RemoveBlip
        L7_2 = L5_2
        L6_2(L7_2)
      end
    end
  end
  L0_2 = Group
  L0_2.active = false
  L0_2 = Group
  L0_2.ownerId = 0
  L0_2 = Group
  L0_2.groupId = nil
  L0_2 = Group
  L1_2 = {}
  L0_2.players = L1_2
  L0_2 = Group
  L0_2.showMembers = false
  L0_2 = multiplayerMenus
  L1_2 = Group
  L1_2 = L1_2.job
  L2_2 = Config
  L2_2 = L2_2.Jobs
  L3_2 = Group
  L3_2 = L3_2.job
  L2_2 = L2_2[L3_2]
  L2_2 = L2_2.label
  L0_2(L1_2, L2_2)
  L0_2 = Group
  L0_2.job = nil
  L0_2 = Config
  L0_2 = L0_2.Notification
  L1_2 = Lang
  L2_2 = "job"
  L1_2 = L1_2(L2_2)
  L2_2 = Lang
  L3_2 = "not_a_member"
  L2_2 = L2_2(L3_2)
  L3_2 = "inform"
  L4_2 = 7500
  L0_2(L1_2, L2_2, L3_2, L4_2)
end
L4_1(L5_1, L6_1)
L4_1 = RegisterNetEvent
L5_1 = "wais:group:addPlayer"
function L6_1(A0_2, A1_2)
  local L2_2, L3_2, L4_2, L5_2
  L2_2 = GetPlayerServerId
  L3_2 = PlayerId
  L3_2, L4_2, L5_2 = L3_2()
  L2_2 = L2_2(L3_2, L4_2, L5_2)
  if A0_2 == L2_2 then
    return
  end
  L2_2 = Group
  L2_2 = L2_2.active
  if L2_2 then
    L2_2 = Group
    L2_2 = L2_2.players
    L3_2 = {}
    L4_2 = tonumber
    L5_2 = A0_2
    L4_2 = L4_2(L5_2)
    L3_2.source = L4_2
    L3_2.name = A1_2
    L2_2[A0_2] = L3_2
    L2_2 = multiplayerMenus
    L3_2 = Group
    L3_2 = L3_2.job
    L4_2 = Config
    L4_2 = L4_2.Jobs
    L5_2 = Group
    L5_2 = L5_2.job
    L4_2 = L4_2[L5_2]
    L4_2 = L4_2.label
    L2_2(L3_2, L4_2)
  end
end
L4_1(L5_1, L6_1)
L4_1 = RegisterNetEvent
L5_1 = "wais:group:removePlayer"
function L6_1(A0_2)
  local L1_2, L2_2, L3_2, L4_2
  L1_2 = Group
  L1_2 = L1_2.active
  if L1_2 then
    L1_2 = Group
    L1_2 = L1_2.players
    L1_2[A0_2] = nil
    L1_2 = memberBlips
    L2_2 = tostring
    L3_2 = A0_2
    L2_2 = L2_2(L3_2)
    L1_2 = L1_2[L2_2]
    if L1_2 then
      L1_2 = RemoveBlip
      L2_2 = memberBlips
      L3_2 = tostring
      L4_2 = A0_2
      L3_2 = L3_2(L4_2)
      L2_2 = L2_2[L3_2]
      L1_2(L2_2)
      L1_2 = memberBlips
      L2_2 = tostring
      L3_2 = A0_2
      L2_2 = L2_2(L3_2)
      L1_2[L2_2] = nil
    end
    L1_2 = multiplayerMenus
    L2_2 = Group
    L2_2 = L2_2.job
    L3_2 = Config
    L3_2 = L3_2.Jobs
    L4_2 = Group
    L4_2 = L4_2.job
    L3_2 = L3_2[L4_2]
    L3_2 = L3_2.label
    L1_2(L2_2, L3_2)
  end
end
L4_1(L5_1, L6_1)
L4_1 = RegisterNetEvent
L5_1 = "wais:group:changeOwnerId"
function L6_1(A0_2)
  local L1_2, L2_2, L3_2, L4_2
  L1_2 = Group
  L1_2 = L1_2.active
  if L1_2 then
    L1_2 = Group
    L1_2.ownerId = A0_2
    L1_2 = multiplayerMenus
    L2_2 = Group
    L2_2 = L2_2.job
    L3_2 = Config
    L3_2 = L3_2.Jobs
    L4_2 = Group
    L4_2 = L4_2.job
    L3_2 = L3_2[L4_2]
    L3_2 = L3_2.label
    L1_2(L2_2, L3_2)
  end
end
L4_1(L5_1, L6_1)
L4_1 = RegisterNetEvent
L5_1 = "wais:showNotification"
function L6_1(A0_2, A1_2, A2_2)
  local L3_2, L4_2, L5_2, L6_2, L7_2
  L3_2 = Config
  L3_2 = L3_2.Notification
  L4_2 = Lang
  L5_2 = "job"
  L4_2 = L4_2(L5_2)
  L5_2 = A0_2
  L6_2 = A1_2
  L7_2 = A2_2
  L3_2(L4_2, L5_2, L6_2, L7_2)
end
L4_1(L5_1, L6_1)
function L4_1()
  local L0_2, L1_2, L2_2
  L0_2 = getPlayerJob
  L0_2 = L0_2()
  L1_2 = CurrentJob
  if L1_2 == L0_2 then
    return
  end
  L1_2 = CurrentJob
  if nil ~= L1_2 then
    L1_2 = CurrentJob
    if L1_2 ~= L0_2 then
      L1_2 = changeToDefaultAll
      L1_2()
    end
  end
  while true do
    L1_2 = Lang
    if L1_2 then
      break
    end
    L1_2 = Wait
    L2_2 = 100
    L1_2(L2_2)
  end
  if "pizza_delivery" == L0_2 then
    CurrentJob = "pizza_delivery"
    L1_2 = initPizza
    L1_2()
  elseif "news_delivery" == L0_2 then
    CurrentJob = "news_delivery"
    L1_2 = initNewspaper
    L1_2()
  elseif "mobile_hotdog" == L0_2 then
    CurrentJob = "mobile_hotdog"
    L1_2 = initHotdog
    L1_2()
  elseif "forklifter" == L0_2 then
    CurrentJob = "forklifter"
    L1_2 = initForklift
    L1_2()
  elseif "gardener" == L0_2 then
    CurrentJob = "gardener"
    L1_2 = initGardener
    L1_2()
  elseif "trucker" == L0_2 then
    CurrentJob = "trucker"
    L1_2 = initTrucker
    L1_2()
  elseif "roadhelper" == L0_2 then
    CurrentJob = "roadhelper"
    L1_2 = initRoadhelper
    L1_2()
  elseif "bus_driver" == L0_2 then
    CurrentJob = "bus_driver"
    L1_2 = initBusdriver
    L1_2()
  elseif "fire_department" == L0_2 then
    CurrentJob = "fire_department"
    L1_2 = initFireDepartment
    L1_2()
  elseif "hunter" == L0_2 then
    CurrentJob = "hunter"
    L1_2 = initHunter
    L1_2()
  elseif "detectorist" == L0_2 then
    CurrentJob = "detectorist"
    L1_2 = initDetectorist
    L1_2()
  elseif "project_car" == L0_2 then
    CurrentJob = "project_car"
    L1_2 = initProjectCar
    L1_2()
  elseif "diver" == L0_2 then
    CurrentJob = "diver"
    L1_2 = initDiver
    L1_2()
  elseif "farmer" == L0_2 then
    CurrentJob = "farmer"
    L1_2 = initFarmer
    L1_2()
  elseif "electrician" == L0_2 then
    CurrentJob = "electrician"
    L1_2 = initElectrician
    L1_2()
  end
end
initJobs = L4_1
function L4_1()
  local L0_2, L1_2, L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2
  CurrentJob = nil
  L0_2 = next
  L1_2 = blips
  L0_2 = L0_2(L1_2)
  if nil ~= L0_2 then
    L0_2 = pairs
    L1_2 = blips
    L0_2, L1_2, L2_2, L3_2 = L0_2(L1_2)
    for L4_2, L5_2 in L0_2, L1_2, L2_2, L3_2 do
      L6_2 = RemoveBlip
      L7_2 = L5_2
      L6_2(L7_2)
    end
  end
  L0_2 = next
  L1_2 = points
  L0_2 = L0_2(L1_2)
  if nil ~= L0_2 then
    L0_2 = pairs
    L1_2 = points
    L0_2, L1_2, L2_2, L3_2 = L0_2(L1_2)
    for L4_2, L5_2 in L0_2, L1_2, L2_2, L3_2 do
      L7_2 = L5_2
      L6_2 = L5_2.remove
      L6_2(L7_2)
    end
  end
  L0_2 = next
  L1_2 = targets
  L0_2 = L0_2(L1_2)
  if nil ~= L0_2 then
    L0_2 = pairs
    L1_2 = targets
    L0_2, L1_2, L2_2, L3_2 = L0_2(L1_2)
    for L4_2, L5_2 in L0_2, L1_2, L2_2, L3_2 do
      L6_2 = target
      if "ox" == L6_2 then
        L6_2 = exports
        L6_2 = L6_2.ox_target
        L7_2 = L6_2
        L6_2 = L6_2.removeZone
        L8_2 = L5_2
        L6_2(L7_2, L8_2)
      else
        L6_2 = exports
        L6_2 = L6_2["qb-target"]
        L7_2 = L6_2
        L6_2 = L6_2.RemoveZone
        L8_2 = L5_2
        L6_2(L7_2, L8_2)
      end
    end
  end
  L0_2 = next
  L1_2 = props
  L0_2 = L0_2(L1_2)
  if nil == L0_2 then
    L0_2 = vehicle
    if nil == L0_2 then
      goto lbl_72
    end
  end
  L0_2 = TriggerServerEvent
  L1_2 = "wais:delete:Entitys"
  L0_2(L1_2)
  L0_2 = {}
  vehicle = nil
  props = L0_2
  ::lbl_72::
  L0_2 = Group
  L0_2 = L0_2.active
  if L0_2 then
    L0_2 = Group
    L0_2 = L0_2.ownerId
    L1_2 = GetPlayerServerId
    L2_2 = PlayerId
    L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2 = L2_2()
    L1_2 = L1_2(L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2)
    if L0_2 == L1_2 then
      L0_2 = TriggerServerEvent
      L1_2 = "wais:group:delete"
      L2_2 = Group
      L2_2 = L2_2.groupId
      L0_2(L1_2, L2_2)
    else
      L0_2 = TriggerServerEvent
      L1_2 = "wais:group:leaveGroup"
      L0_2(L1_2)
    end
  end
  L0_2 = TriggerEvent
  L1_2 = "wais:setDefault:JobThings"
  L0_2(L1_2)
  L0_2 = exitJobMenuPoint
  L0_2()
end
changeToDefaultAll = L4_1
function L4_1()
  local L0_2, L1_2
  L0_2 = Config
  L0_2 = L0_2.WhenDeadCancelJob
  if not L0_2 then
    return
  end
  L0_2 = next
  L1_2 = props
  L0_2 = L0_2(L1_2)
  if nil == L0_2 then
    L0_2 = vehicle
    if nil == L0_2 then
      goto lbl_21
    end
  end
  L0_2 = TriggerServerEvent
  L1_2 = "wais:delete:Entitys"
  L0_2(L1_2)
  L0_2 = {}
  vehicle = nil
  props = L0_2
  ::lbl_21::
  L0_2 = TriggerEvent
  L1_2 = "wais:setDefault:JobThings"
  L0_2(L1_2)
end
playerDead = L4_1
function L4_1()
  local L0_2, L1_2, L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2
  L0_2 = joaat
  L1_2 = Config
  L1_2 = L1_2.JobCentre
  L1_2 = L1_2.interaction_ped
  L1_2 = L1_2.model
  L0_2 = L0_2(L1_2)
  while true do
    L1_2 = pcall
    L2_2 = loadModel
    L3_2 = L0_2
    L1_2 = L1_2(L2_2, L3_2)
    if L1_2 then
      break
    end
    L1_2 = print
    L2_2 = "Trying to load loadModel func."
    L1_2(L2_2)
    L1_2 = Wait
    L2_2 = 1000
    L1_2(L2_2)
  end
  while true do
    L1_2 = Lang
    if L1_2 then
      break
    end
    L1_2 = print
    L2_2 = "Trying to load Lang."
    L1_2(L2_2)
    L1_2 = Wait
    L2_2 = 1000
    L1_2(L2_2)
  end
  while true do
    L1_2 = loadModel
    L2_2 = L0_2
    L1_2 = L1_2(L2_2)
    if L1_2 then
      break
    end
    L1_2 = print
    L2_2 = "Trying to load model."
    L1_2(L2_2)
    L1_2 = Wait
    L2_2 = 3000
    L1_2(L2_2)
  end
  L1_2 = CreatePed
  L2_2 = 4
  L3_2 = L0_2
  L4_2 = Config
  L4_2 = L4_2.JobCentre
  L4_2 = L4_2.interaction_ped
  L4_2 = L4_2.coords
  L4_2 = L4_2.x
  L5_2 = Config
  L5_2 = L5_2.JobCentre
  L5_2 = L5_2.interaction_ped
  L5_2 = L5_2.coords
  L5_2 = L5_2.y
  L6_2 = Config
  L6_2 = L6_2.JobCentre
  L6_2 = L6_2.interaction_ped
  L6_2 = L6_2.coords
  L6_2 = L6_2.z
  L6_2 = L6_2 - 0.95
  L7_2 = Config
  L7_2 = L7_2.JobCentre
  L7_2 = L7_2.interaction_ped
  L7_2 = L7_2.coords
  L7_2 = L7_2.w
  L8_2 = false
  L9_2 = false
  L1_2 = L1_2(L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2)
  L0_1 = L1_2
  L1_2 = FreezeEntityPosition
  L2_2 = L0_1
  L3_2 = true
  L1_2(L2_2, L3_2)
  L1_2 = SetEntityInvincible
  L2_2 = L0_1
  L3_2 = true
  L1_2(L2_2, L3_2)
  L1_2 = SetEntityAsMissionEntity
  L2_2 = L0_1
  L3_2 = true
  L4_2 = true
  L1_2(L2_2, L3_2, L4_2)
  L1_2 = SetBlockingOfNonTemporaryEvents
  L2_2 = L0_1
  L3_2 = true
  L1_2(L2_2, L3_2)
  L1_2 = Config
  L1_2 = L1_2.JobCentre
  L1_2 = L1_2.blip
  L1_2 = L1_2.show
  if L1_2 then
    L1_2 = AddBlipForCoord
    L2_2 = Config
    L2_2 = L2_2.JobCentre
    L2_2 = L2_2.interaction_ped
    L2_2 = L2_2.coords
    L2_2 = L2_2.x
    L3_2 = Config
    L3_2 = L3_2.JobCentre
    L3_2 = L3_2.interaction_ped
    L3_2 = L3_2.coords
    L3_2 = L3_2.y
    L4_2 = Config
    L4_2 = L4_2.JobCentre
    L4_2 = L4_2.interaction_ped
    L4_2 = L4_2.coords
    L4_2 = L4_2.z
    L1_2 = L1_2(L2_2, L3_2, L4_2)
    L1_1 = L1_2
    L1_2 = SetBlipSprite
    L2_2 = L1_1
    L3_2 = Config
    L3_2 = L3_2.JobCentre
    L3_2 = L3_2.blip
    L3_2 = L3_2.sprite
    L1_2(L2_2, L3_2)
    L1_2 = SetBlipDisplay
    L2_2 = L1_1
    L3_2 = 4
    L1_2(L2_2, L3_2)
    L1_2 = SetBlipScale
    L2_2 = L1_1
    L3_2 = Config
    L3_2 = L3_2.JobCentre
    L3_2 = L3_2.blip
    L3_2 = L3_2.scale
    L1_2(L2_2, L3_2)
    L1_2 = SetBlipColour
    L2_2 = L1_1
    L3_2 = Config
    L3_2 = L3_2.JobCentre
    L3_2 = L3_2.blip
    L3_2 = L3_2.color
    L1_2(L2_2, L3_2)
    L1_2 = SetBlipAsShortRange
    L2_2 = L1_1
    L3_2 = true
    L1_2(L2_2, L3_2)
    L1_2 = BeginTextCommandSetBlipName
    L2_2 = "STRING"
    L1_2(L2_2)
    L1_2 = AddTextComponentString
    L2_2 = Config
    L2_2 = L2_2.JobCentre
    L2_2 = L2_2.blip
    L2_2 = L2_2.label
    L1_2(L2_2)
    L1_2 = EndTextCommandSetBlipName
    L2_2 = L1_1
    L1_2(L2_2)
  end
  L1_2 = {}
  L2_2 = {}
  L3_2 = pairs
  L4_2 = Config
  L4_2 = L4_2.Jobs
  L3_2, L4_2, L5_2, L6_2 = L3_2(L4_2)
  for L7_2, L8_2 in L3_2, L4_2, L5_2, L6_2 do
    L9_2 = L8_2.disabled
    if not L9_2 then
      L9_2 = L8_2.menu_informations
      if nil ~= L9_2 then
        L9_2 = #L2_2
        L9_2 = L9_2 + 1
        L2_2[L9_2] = L7_2
      end
    end
  end
  L3_2 = table
  L3_2 = L3_2.sort
  L4_2 = L2_2
  function L5_2(A0_3, A1_3)
    local L2_3
    L2_3 = A0_3 < A1_3
    return L2_3
  end
  L3_2(L4_2, L5_2)
  L3_2 = pairs
  L4_2 = L2_2
  L3_2, L4_2, L5_2, L6_2 = L3_2(L4_2)
  for L7_2, L8_2 in L3_2, L4_2, L5_2, L6_2 do
    L9_2 = Config
    L9_2 = L9_2.Jobs
    L9_2 = L9_2[L8_2]
    L9_2 = L9_2.menu_informations
    L10_2 = #L1_2
    L10_2 = L10_2 + 1
    L11_2 = {}
    L12_2 = "%s %s"
    L13_2 = L12_2
    L12_2 = L12_2.format
    L14_2 = L9_2.title
    L15_2 = L9_2.recommended
    if L15_2 then
      L15_2 = Lang
      L16_2 = "recommended"
      L15_2 = L15_2(L16_2)
      if L15_2 then
        goto lbl_205
      end
    end
    L15_2 = ""
    ::lbl_205::
    L12_2 = L12_2(L13_2, L14_2, L15_2)
    L11_2.title = L12_2
    L12_2 = L9_2.description
    L11_2.description = L12_2
    L11_2.icon = "briefcase"
    L12_2 = L9_2.recommended
    if L12_2 then
      L12_2 = "#FC7A07"
      if L12_2 then
        goto lbl_217
      end
    end
    L12_2 = nil
    ::lbl_217::
    L11_2.iconColor = L12_2
    L12_2 = L9_2.recommended
    if L12_2 then
      L12_2 = "shake"
      if L12_2 then
        goto lbl_225
      end
    end
    L12_2 = nil
    ::lbl_225::
    L11_2.iconAnimation = L12_2
    function L12_2()
      local L0_3, L1_3
      L0_3 = selectJob
      L1_3 = L8_2
      L0_3(L1_3)
    end
    L11_2.onSelect = L12_2
    L1_2[L10_2] = L11_2
  end
  L3_2 = lib
  L3_2 = L3_2.registerContext
  L4_2 = {}
  L5_2 = menus
  L5_2 = L5_2.job_center
  L4_2.id = L5_2
  L5_2 = Lang
  L6_2 = "job_list"
  L5_2 = L5_2(L6_2)
  L4_2.title = L5_2
  L4_2.options = L1_2
  L3_2(L4_2)
end
createJobCenter = L4_1
L4_1 = CreateThread
function L5_1()
  local L0_2, L1_2, L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2
  while true do
    L0_2 = 3000
    L1_2 = Group
    L1_2 = L1_2.active
    if L1_2 then
      L1_2 = Group
      L1_2 = L1_2.showMembers
      if L1_2 then
        L1_2 = pairs
        L2_2 = Group
        L2_2 = L2_2.players
        L1_2, L2_2, L3_2, L4_2 = L1_2(L2_2)
        for L5_2, L6_2 in L1_2, L2_2, L3_2, L4_2 do
          L7_2 = L6_2.source
          L8_2 = GetPlayerServerId
          L9_2 = PlayerId
          L9_2, L10_2, L11_2, L12_2 = L9_2()
          L8_2 = L8_2(L9_2, L10_2, L11_2, L12_2)
          if L7_2 ~= L8_2 then
            L7_2 = GetPlayerPed
            L8_2 = GetPlayerFromServerId
            L9_2 = L6_2.source
            L8_2, L9_2, L10_2, L11_2, L12_2 = L8_2(L9_2)
            L7_2 = L7_2(L8_2, L9_2, L10_2, L11_2, L12_2)
            L8_2 = GetEntityCoords
            L9_2 = PlayerPedId
            L9_2, L10_2, L11_2, L12_2 = L9_2()
            L8_2 = L8_2(L9_2, L10_2, L11_2, L12_2)
            L9_2 = GetEntityCoords
            L10_2 = L7_2
            L9_2 = L9_2(L10_2)
            L8_2 = L8_2 - L9_2
            L8_2 = #L8_2
            L9_2 = 424
            if L8_2 < L9_2 and L8_2 > 1 then
              L9_2 = memberBlips
              L10_2 = tostring
              L11_2 = L6_2.source
              L10_2 = L10_2(L11_2)
              L9_2 = L9_2[L10_2]
              if nil == L9_2 then
                L9_2 = AddBlipForEntity
                L10_2 = L7_2
                L9_2 = L9_2(L10_2)
                L10_2 = SetBlipSprite
                L11_2 = L9_2
                L12_2 = 1
                L10_2(L11_2, L12_2)
                L10_2 = SetBlipColour
                L11_2 = L9_2
                L12_2 = 1
                L10_2(L11_2, L12_2)
                L10_2 = SetBlipScale
                L11_2 = L9_2
                L12_2 = 0.8
                L10_2(L11_2, L12_2)
                L10_2 = SetBlipAsShortRange
                L11_2 = L9_2
                L12_2 = true
                L10_2(L11_2, L12_2)
                L10_2 = BeginTextCommandSetBlipName
                L11_2 = "STRING"
                L10_2(L11_2)
                L10_2 = AddTextComponentString
                L11_2 = L6_2.name
                L10_2(L11_2)
                L10_2 = EndTextCommandSetBlipName
                L11_2 = L9_2
                L10_2(L11_2)
                L10_2 = memberBlips
                L11_2 = tostring
                L12_2 = L6_2.source
                L11_2 = L11_2(L12_2)
                L10_2[L11_2] = L9_2
              end
            else
              L9_2 = memberBlips
              L10_2 = tostring
              L11_2 = L6_2.source
              L10_2 = L10_2(L11_2)
              L9_2 = L9_2[L10_2]
              if L9_2 then
                L9_2 = RemoveBlip
                L10_2 = memberBlips
                L11_2 = tostring
                L12_2 = L6_2.source
                L11_2 = L11_2(L12_2)
                L10_2 = L10_2[L11_2]
                L9_2(L10_2)
                L9_2 = memberBlips
                L10_2 = tostring
                L11_2 = L6_2.source
                L10_2 = L10_2(L11_2)
                L9_2[L10_2] = nil
              end
            end
          end
        end
      end
    end
    L1_2 = Wait
    L2_2 = L0_2
    L1_2(L2_2)
  end
end
L4_1(L5_1)
L4_1 = CreateThread
function L5_1()
  local L0_2, L1_2, L2_2, L3_2, L4_2, L5_2
  while true do
    L0_2 = Config
    L0_2 = L0_2.JobCentre
    L0_2 = L0_2.interaction_type
    if "target" ~= L0_2 then
      break
    end
    L0_2 = DoesEntityExist
    L1_2 = L0_1
    L0_2 = L0_2(L1_2)
    if not L0_2 then
      L0_2 = L2_1
      if L0_2 then
        L0_2 = target
        if "ox" == L0_2 then
          L0_2 = exports
          L0_2 = L0_2.ox_target
          L1_2 = L0_2
          L0_2 = L0_2.removeEntity
          L2_2 = L0_1
          L0_2(L1_2, L2_2)
        else
          L0_2 = target
          if "qb" == L0_2 then
            L0_2 = exports
            L0_2 = L0_2["qb-target"]
            L1_2 = L0_2
            L0_2 = L0_2.RemoveTargetEntity
            L2_2 = L0_1
            L0_2(L1_2, L2_2)
          end
        end
        L0_2 = false
        L2_1 = L0_2
    end
    else
      L0_2 = DoesEntityExist
      L1_2 = L0_1
      L0_2 = L0_2(L1_2)
      if L0_2 then
        L0_2 = L2_1
        if not L0_2 then
          L0_2 = true
          L2_1 = L0_2
          L0_2 = AddTargetEntity
          L1_2 = L0_1
          L2_2 = {}
          L3_2 = {}
          L3_2.icon = "fa-solid fa-clipboard-list"
          L4_2 = Lang
          L5_2 = "job_list"
          L4_2 = L4_2(L5_2)
          L3_2.label = L4_2
          function L4_2()
            local L0_3, L1_3, L2_3, L3_3, L4_3, L5_3, L6_3, L7_3, L8_3, L9_3, L10_3, L11_3
            L0_3 = loadDict
            L1_3 = "anim@mp_player_intcelebrationmale@wave"
            L0_3 = L0_3(L1_3)
            if not L0_3 then
              return
            end
            L0_3 = TaskPlayAnim
            L1_3 = L0_1
            L2_3 = "anim@mp_player_intcelebrationmale@wave"
            L3_3 = "wave"
            L4_3 = 2.0
            L5_3 = 2.0
            L6_3 = 3000
            L7_3 = 49
            L8_3 = 0
            L9_3 = false
            L10_3 = false
            L11_3 = false
            L0_3(L1_3, L2_3, L3_3, L4_3, L5_3, L6_3, L7_3, L8_3, L9_3, L10_3, L11_3)
            L0_3 = PlayAmbientSpeech1
            L1_3 = L0_1
            L2_3 = "GENERIC_HI"
            L3_3 = "SPEECH_PARAMS_FORCE"
            L0_3(L1_3, L2_3, L3_3)
            L0_3 = lib
            L0_3 = L0_3.showContext
            L1_3 = menus
            L1_3 = L1_3.job_center
            L0_3(L1_3)
          end
          L3_2.action = L4_2
          L2_2[1] = L3_2
          L3_2 = true
          L4_2 = 3.0
          L0_2(L1_2, L2_2, L3_2, L4_2)
        end
      end
    end
    L0_2 = Wait
    L1_2 = 1000
    L0_2(L1_2)
  end
end
L4_1(L5_1)
L4_1 = CreateThread
function L5_1()
  local L0_2, L1_2, L2_2, L3_2, L4_2, L5_2, L6_2
  while true do
    L0_2 = Config
    L0_2 = L0_2.JobCentre
    L0_2 = L0_2.interaction_type
    if "textUI" ~= L0_2 then
      break
    end
    L0_2 = 1000
    L1_2 = PlayerPedId
    L1_2 = L1_2()
    L2_2 = GetEntityCoords
    L3_2 = L1_2
    L2_2 = L2_2(L3_2)
    L3_2 = vector3
    L4_2 = Config
    L4_2 = L4_2.JobCentre
    L4_2 = L4_2.interaction_ped
    L4_2 = L4_2.coords
    L4_2 = L4_2.x
    L5_2 = Config
    L5_2 = L5_2.JobCentre
    L5_2 = L5_2.interaction_ped
    L5_2 = L5_2.coords
    L5_2 = L5_2.y
    L6_2 = Config
    L6_2 = L6_2.JobCentre
    L6_2 = L6_2.interaction_ped
    L6_2 = L6_2.coords
    L6_2 = L6_2.z
    L3_2 = L3_2(L4_2, L5_2, L6_2)
    L3_2 = L2_2 - L3_2
    L3_2 = #L3_2
    if L3_2 <= 3.0 then
      L0_2 = 5
      L4_2 = L3_1
      if not L4_2 then
        L4_2 = true
        L3_1 = L4_2
        L4_2 = showCenterTextUI
        L4_2()
      end
      L4_2 = IsControlJustPressed
      L5_2 = 0
      L6_2 = 38
      L4_2 = L4_2(L5_2, L6_2)
      if L4_2 then
        L4_2 = lib
        L4_2 = L4_2.showContext
        L5_2 = menus
        L5_2 = L5_2.job_center
        L4_2(L5_2)
      end
    else
      L4_2 = L3_1
      if L4_2 then
        L4_2 = false
        L3_1 = L4_2
        L4_2 = hideCenterTextUI
        L4_2()
      end
    end
    L4_2 = Wait
    L5_2 = L0_2
    L4_2(L5_2)
  end
end
L4_1(L5_1)
L4_1 = CreateThread
function L5_1()
  local L0_2, L1_2
  L0_2 = createJobCenter
  L0_2()
  L0_2 = initJobs
  L0_2()
end
L4_1(L5_1)