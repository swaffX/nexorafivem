local L0_1, L1_1, L2_1, L3_1
L0_1 = Config
L0_1 = L0_1.Jobs
L0_1 = L0_1.electrician
currElectricianMission = nil
L1_1 = RegisterNetEvent
L2_1 = "wais:setDefault:JobThings"
function L3_1()
  local L0_2, L1_2
  L0_2 = currElectricianMission
  if nil ~= L0_2 then
    L0_2 = Group
    L0_2 = L0_2.active
    if not L0_2 then
      L0_2 = currElectricianMission
      L1_2 = L0_2
      L0_2 = L0_2.deleteSelf
      L0_2(L1_2)
      currElectricianMission = nil
    end
  end
end
L1_1(L2_1, L3_1)
L1_1 = RegisterNetEvent
L2_1 = "wais:electrician:clearEvent"
function L3_1()
  local L0_2, L1_2
  currElectricianMission = nil
end
L1_1(L2_1, L3_1)
L1_1 = RegisterNetEvent
L2_1 = "wais:electrician:client:cancelMission:self"
function L3_1()
  local L0_2, L1_2
  L0_2 = currElectricianMission
  if nil ~= L0_2 then
    L0_2 = currElectricianMission
    L1_2 = L0_2
    L0_2 = L0_2.deleteSelf
    L0_2(L1_2)
    currElectricianMission = nil
  end
end
L1_1(L2_1, L3_1)
L1_1 = RegisterNetEvent
L2_1 = "wais:electrician:server:createMission"
function L3_1(A0_2, A1_2)
  local L2_2, L3_2, L4_2, L5_2
  L2_2 = Electrician
  L3_2 = L2_2
  L2_2 = L2_2.CreateMaintenance
  L4_2 = A0_2
  L5_2 = A1_2
  L2_2 = L2_2(L3_2, L4_2, L5_2)
  currElectricianMission = L2_2
end
L1_1(L2_1, L3_1)
L1_1 = RegisterNetEvent
L2_1 = "wais:electrician:client:changeBusyState"
function L3_1(A0_2, A1_2)
  local L2_2, L3_2, L4_2, L5_2
  L2_2 = currElectricianMission
  if L2_2 then
    L2_2 = currElectricianMission
    L3_2 = L2_2
    L2_2 = L2_2.changeBusyState
    L4_2 = A0_2
    L5_2 = A1_2
    L2_2(L3_2, L4_2, L5_2)
  end
end
L1_1(L2_1, L3_1)
L1_1 = RegisterNetEvent
L2_1 = "wais:electrician:client:changeFixedState"
function L3_1(A0_2, A1_2)
  local L2_2, L3_2, L4_2, L5_2
  L2_2 = currElectricianMission
  if L2_2 then
    L2_2 = currElectricianMission
    L3_2 = L2_2
    L2_2 = L2_2.changeFixedState
    L4_2 = A0_2
    L5_2 = A1_2
    L2_2(L3_2, L4_2, L5_2)
  end
end
L1_1(L2_1, L3_1)
L1_1 = RegisterNetEvent
L2_1 = "wais:electrician:client:cancelMission"
function L3_1()
  local L0_2, L1_2
  L0_2 = currElectricianMission
  if nil ~= L0_2 then
    L0_2 = currElectricianMission
    L1_2 = L0_2
    L0_2 = L0_2.deleteSelf
    L0_2(L1_2)
    currElectricianMission = nil
  end
end
L1_1(L2_1, L3_1)
L1_1 = RegisterNetEvent
L2_1 = "wais:electrician:client:giveKeys"
function L3_1(A0_2, A1_2)
  local L2_2, L3_2, L4_2, L5_2
  L2_2 = NetworkGetEntityFromNetworkId
  L3_2 = A0_2
  L2_2 = L2_2(L3_2)
  L3_2 = Config
  L3_2 = L3_2.VehicleCreated
  L4_2 = L2_2
  L5_2 = A1_2
  L3_2(L4_2, L5_2)
end
L1_1(L2_1, L3_1)
function L1_1()
  local L0_2, L1_2, L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2
  L0_2 = L0_1.disabled
  if L0_2 then
    return
  end
  L0_2 = lib
  L0_2 = L0_2.zones
  L0_2 = L0_2.sphere
  L1_2 = {}
  L2_2 = L0_1.menu
  L2_2 = L2_2.job_menu
  L1_2.coords = L2_2
  L2_2 = L0_1.menu
  L2_2 = L2_2.interaction_distance
  L1_2.radius = L2_2
  L2_2 = L0_1.debug
  L1_2.debug = L2_2
  function L2_2(A0_3)
    local L1_3, L2_3, L3_3, L4_3, L5_3, L6_3
    L1_3 = PlayerPedId
    L1_3 = L1_3()
    L2_3 = GetEntityCoords
    L3_3 = L1_3
    L2_3 = L2_3(L3_3)
    L3_3 = L0_1.menu
    L3_3 = L3_3.job_menu
    L3_3 = L2_3 - L3_3
    L3_3 = #L3_3
    L4_3 = L0_1.menu
    L4_3 = L4_3.interaction_distance
    if L3_3 <= L4_3 then
      L4_3 = isDead
      if not L4_3 then
        L4_3 = IsControlJustPressed
        L5_3 = 0
        L6_3 = 38
        L4_3 = L4_3(L5_3, L6_3)
        if L4_3 then
          L4_3 = openJobMenu
          L5_3 = "electrician"
          L6_3 = L0_1.name
          L4_3(L5_3, L6_3)
        end
      end
    end
  end
  L1_2.inside = L2_2
  L2_2 = showJobMenuTextUI
  L1_2.onEnter = L2_2
  L2_2 = exitJobMenuPoint
  L1_2.onExit = L2_2
  L0_2 = L0_2(L1_2)
  L1_2 = L0_1.debug
  if L1_2 then
    L1_2 = print
    L2_2 = "[^2INFO^7] Electrician Job Center has been initialized."
    L1_2(L2_2)
  end
  L1_2 = L0_1.menu
  L1_2 = L1_2.blips
  L1_2 = L1_2.show
  if L1_2 then
    L1_2 = AddBlipForCoord
    L2_2 = L0_1.menu
    L2_2 = L2_2.job_menu
    L2_2 = L2_2.x
    L3_2 = L0_1.menu
    L3_2 = L3_2.job_menu
    L3_2 = L3_2.y
    L4_2 = L0_1.menu
    L4_2 = L4_2.job_menu
    L4_2 = L4_2.z
    L1_2 = L1_2(L2_2, L3_2, L4_2)
    L2_2 = SetBlipSprite
    L3_2 = L1_2
    L4_2 = L0_1.menu
    L4_2 = L4_2.blips
    L4_2 = L4_2.sprite
    L2_2(L3_2, L4_2)
    L2_2 = SetBlipDisplay
    L3_2 = L1_2
    L4_2 = 4
    L2_2(L3_2, L4_2)
    L2_2 = SetBlipScale
    L3_2 = L1_2
    L4_2 = L0_1.menu
    L4_2 = L4_2.blips
    L4_2 = L4_2.scale
    L2_2(L3_2, L4_2)
    L2_2 = SetBlipColour
    L3_2 = L1_2
    L4_2 = L0_1.menu
    L4_2 = L4_2.blips
    L4_2 = L4_2.color
    L2_2(L3_2, L4_2)
    L2_2 = SetBlipAsShortRange
    L3_2 = L1_2
    L4_2 = true
    L2_2(L3_2, L4_2)
    L2_2 = BeginTextCommandSetBlipName
    L3_2 = "STRING"
    L2_2(L3_2)
    L2_2 = AddTextComponentString
    L3_2 = L0_1.menu
    L3_2 = L3_2.blips
    L3_2 = L3_2.label
    L2_2(L3_2)
    L2_2 = EndTextCommandSetBlipName
    L3_2 = L1_2
    L2_2(L3_2)
    L2_2 = blips
    L3_2 = blips
    L3_2 = #L3_2
    L3_2 = L3_2 + 1
    L2_2[L3_2] = L1_2
    L2_2 = L0_1.debug
    if L2_2 then
      L2_2 = print
      L3_2 = "[^2INFO^7] Electrician Job Center Blip has been initialized."
      L2_2(L3_2)
    end
  end
  L1_2 = points
  L2_2 = points
  L2_2 = #L2_2
  L2_2 = L2_2 + 1
  L1_2[L2_2] = L0_2
  L1_2 = {}
  L2_2 = pairs
  L3_2 = L0_1.mission_list
  L2_2, L3_2, L4_2, L5_2 = L2_2(L3_2)
  for L6_2, L7_2 in L2_2, L3_2, L4_2, L5_2 do
    L8_2 = #L1_2
    L8_2 = L8_2 + 1
    L9_2 = {}
    L10_2 = L7_2.title
    L9_2.title = L10_2
    L10_2 = Lang
    L11_2 = "electrician_item_desc"
    L12_2 = formatNumberToMinSec
    L13_2 = L7_2.timer
    L13_2 = L13_2.mission_time
    L12_2 = L12_2(L13_2)
    L13_2 = L7_2.reward
    L10_2 = L10_2(L11_2, L12_2, L13_2)
    L9_2.description = L10_2
    L9_2.icon = "bolt"
    function L10_2()
      local L0_3, L1_3, L2_3, L3_3, L4_3, L5_3
      L0_3 = currElectricianMission
      if L0_3 then
        L0_3 = Config
        L0_3 = L0_3.Notification
        L1_3 = Lang
        L2_3 = "job"
        L1_3 = L1_3(L2_3)
        L2_3 = Lang
        L3_3 = "electrician_already_have_mission"
        L2_3 = L2_3(L3_3)
        L3_3 = "error"
        L4_3 = 5000
        return L0_3(L1_3, L2_3, L3_3, L4_3)
      end
      L0_3 = Group
      L0_3 = L0_3.active
      if L0_3 then
        L0_3 = Group
        L0_3 = L0_3.ownerId
        L1_3 = GetPlayerServerId
        L2_3 = PlayerId
        L2_3, L3_3, L4_3, L5_3 = L2_3()
        L1_3 = L1_3(L2_3, L3_3, L4_3, L5_3)
        if L0_3 ~= L1_3 then
          L0_3 = Config
          L0_3 = L0_3.Notification
          L1_3 = Lang
          L2_3 = "job"
          L1_3 = L1_3(L2_3)
          L2_3 = Lang
          L3_3 = "electrician_group_not_owner"
          L2_3 = L2_3(L3_3)
          L3_3 = "error"
          L4_3 = 5000
          return L0_3(L1_3, L2_3, L3_3, L4_3)
        end
      end
      L0_3 = spawnJobCar
      L1_3 = "electrician"
      L2_3 = nil
      L0_3 = L0_3(L1_3, L2_3)
      if L0_3 then
        L0_3 = Group
        L0_3 = L0_3.active
        if L0_3 then
          L0_3 = TriggerServerEvent
          L1_3 = "wais:electrician:server:acceptMission"
          L2_3 = L6_2
          L3_3 = NetworkGetNetworkIdFromEntity
          L4_3 = vehicle
          L3_3 = L3_3(L4_3)
          L4_3 = GetVehicleNumberPlateText
          L5_3 = vehicle
          L4_3, L5_3 = L4_3(L5_3)
          L0_3(L1_3, L2_3, L3_3, L4_3, L5_3)
        else
          L0_3 = Electrician
          L1_3 = L0_3
          L0_3 = L0_3.CreateMaintenance
          L2_3 = L6_2
          L3_3 = {}
          L3_3.type = "player"
          L4_3 = GetPlayerServerId
          L5_3 = PlayerId
          L5_3 = L5_3()
          L4_3 = L4_3(L5_3)
          L3_3.id = L4_3
          L0_3 = L0_3(L1_3, L2_3, L3_3)
          currElectricianMission = L0_3
        end
      end
    end
    L9_2.onSelect = L10_2
    L1_2[L8_2] = L9_2
  end
  L2_2 = lib
  L2_2 = L2_2.registerContext
  L3_2 = {}
  L4_2 = menus
  L4_2 = L4_2.electrician_missions
  L5_2 = L4_2
  L4_2 = L4_2.format
  L6_2 = "electrician"
  L4_2 = L4_2(L5_2, L6_2)
  L3_2.id = L4_2
  L4_2 = Lang
  L5_2 = "electrician_menu_title"
  L4_2 = L4_2(L5_2)
  L3_2.title = L4_2
  L3_2.options = L1_2
  L4_2 = menus
  L4_2 = L4_2.job_menu
  L5_2 = L4_2
  L4_2 = L4_2.format
  L6_2 = "electrician"
  L4_2 = L4_2(L5_2, L6_2)
  L3_2.menu = L4_2
  L2_2(L3_2)
end
initElectrician = L1_1
L1_1 = CreateThread
function L2_1()
  local L0_2, L1_2, L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2, L20_2, L21_2, L22_2, L23_2, L24_2, L25_2, L26_2, L27_2, L28_2
  while true do
    L0_2 = PlayerPedId
    L0_2 = L0_2()
    L1_2 = GetEntityCoords
    L2_2 = L0_2
    L1_2 = L1_2(L2_2)
    L2_2 = 1000
    L3_2 = CurrentJob
    if "electrician" == L3_2 then
      L3_2 = L0_1.disabled
      if not L3_2 then
        L3_2 = L0_1.menu
        L3_2 = L3_2.job_menu
        L3_2 = L1_2 - L3_2
        L3_2 = #L3_2
        L4_2 = Config
        L4_2 = L4_2.DrawMarkerInteractDistance
        if L3_2 <= L4_2 then
          L2_2 = 5
          L4_2 = DrawMarker
          L5_2 = 1
          L6_2 = L0_1.menu
          L6_2 = L6_2.job_menu
          L6_2 = L6_2.x
          L7_2 = L0_1.menu
          L7_2 = L7_2.job_menu
          L7_2 = L7_2.y
          L8_2 = L0_1.menu
          L8_2 = L8_2.job_menu
          L8_2 = L8_2.z
          L8_2 = L8_2 - 0.95
          L9_2 = 0
          L10_2 = 0
          L11_2 = 0
          L12_2 = 0
          L13_2 = 0
          L14_2 = 0
          L15_2 = 1.0
          L16_2 = 1.0
          L17_2 = 1.0
          L18_2 = 255
          L19_2 = 255
          L20_2 = 0
          L21_2 = 200
          L22_2 = false
          L23_2 = false
          L24_2 = 2
          L25_2 = false
          L26_2 = false
          L27_2 = false
          L28_2 = false
          L4_2(L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2, L20_2, L21_2, L22_2, L23_2, L24_2, L25_2, L26_2, L27_2, L28_2)
        end
      end
    end
    L3_2 = Wait
    L4_2 = L2_2
    L3_2(L4_2)
  end
end
L1_1(L2_1)