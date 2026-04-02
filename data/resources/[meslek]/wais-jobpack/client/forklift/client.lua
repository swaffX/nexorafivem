local L0_1, L1_1, L2_1, L3_1
L0_1 = Config
L0_1 = L0_1.Jobs
L0_1 = L0_1.forklifter
currCargos = nil
L1_1 = RegisterNetEvent
L2_1 = "wais:setDefault:JobThings"
function L3_1()
  local L0_2, L1_2
  L0_2 = deleteForklifterCargo
  L0_2()
end
L1_1(L2_1, L3_1)
function L1_1()
  local L0_2, L1_2, L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2
  L0_2 = L0_1.disabled
  if L0_2 then
    return
  end
  L0_2 = {}
  L1_2 = lib
  L1_2 = L1_2.zones
  L1_2 = L1_2.sphere
  L2_2 = {}
  L3_2 = L0_1.menu
  L3_2 = L3_2.job_menu
  L2_2.coords = L3_2
  L3_2 = L0_1.menu
  L3_2 = L3_2.interaction_distance
  L2_2.radius = L3_2
  L3_2 = L0_1.debug
  L2_2.debug = L3_2
  function L3_2(A0_3)
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
          L5_3 = "forklifter"
          L6_3 = L0_1.name
          L4_3(L5_3, L6_3)
        end
      end
    end
  end
  L2_2.inside = L3_2
  L3_2 = showJobMenuTextUI
  L2_2.onEnter = L3_2
  L3_2 = exitJobMenuPoint
  L2_2.onExit = L3_2
  L1_2 = L1_2(L2_2)
  L2_2 = L0_1.debug
  if L2_2 then
    L2_2 = print
    L3_2 = "[^2INFO^7] Forklifter Job Center has been initialized."
    L2_2(L3_2)
  end
  L2_2 = L0_1.menu
  L2_2 = L2_2.blips
  L2_2 = L2_2.show
  if L2_2 then
    L2_2 = AddBlipForCoord
    L3_2 = L0_1.menu
    L3_2 = L3_2.job_menu
    L3_2 = L3_2.x
    L4_2 = L0_1.menu
    L4_2 = L4_2.job_menu
    L4_2 = L4_2.y
    L5_2 = L0_1.menu
    L5_2 = L5_2.job_menu
    L5_2 = L5_2.z
    L2_2 = L2_2(L3_2, L4_2, L5_2)
    L3_2 = SetBlipSprite
    L4_2 = L2_2
    L5_2 = L0_1.menu
    L5_2 = L5_2.blips
    L5_2 = L5_2.sprite
    L3_2(L4_2, L5_2)
    L3_2 = SetBlipDisplay
    L4_2 = L2_2
    L5_2 = 4
    L3_2(L4_2, L5_2)
    L3_2 = SetBlipScale
    L4_2 = L2_2
    L5_2 = L0_1.menu
    L5_2 = L5_2.blips
    L5_2 = L5_2.scale
    L3_2(L4_2, L5_2)
    L3_2 = SetBlipColour
    L4_2 = L2_2
    L5_2 = L0_1.menu
    L5_2 = L5_2.blips
    L5_2 = L5_2.color
    L3_2(L4_2, L5_2)
    L3_2 = SetBlipAsShortRange
    L4_2 = L2_2
    L5_2 = true
    L3_2(L4_2, L5_2)
    L3_2 = BeginTextCommandSetBlipName
    L4_2 = "STRING"
    L3_2(L4_2)
    L3_2 = AddTextComponentString
    L4_2 = L0_1.menu
    L4_2 = L4_2.blips
    L4_2 = L4_2.label
    L3_2(L4_2)
    L3_2 = EndTextCommandSetBlipName
    L4_2 = L2_2
    L3_2(L4_2)
    L3_2 = blips
    L4_2 = blips
    L4_2 = #L4_2
    L4_2 = L4_2 + 1
    L3_2[L4_2] = L2_2
    L3_2 = L0_1.debug
    if L3_2 then
      L3_2 = print
      L4_2 = "[^2INFO^7] Forklifter Job Center Blip has been initialized."
      L3_2(L4_2)
    end
  end
  L2_2 = points
  L3_2 = points
  L3_2 = #L3_2
  L3_2 = L3_2 + 1
  L2_2[L3_2] = L1_2
  L2_2 = pairs
  L3_2 = L0_1.cargo_list
  L2_2, L3_2, L4_2, L5_2 = L2_2(L3_2)
  for L6_2, L7_2 in L2_2, L3_2, L4_2, L5_2 do
    L8_2 = #L0_2
    L8_2 = L8_2 + 1
    L9_2 = {}
    L10_2 = L7_2.menuTitle
    L9_2.title = L10_2
    L10_2 = Lang
    L11_2 = "cargo_desc"
    L12_2 = L7_2.reward
    L10_2 = L10_2(L11_2, L12_2)
    L9_2.description = L10_2
    L10_2 = {}
    L11_2 = {}
    L12_2 = Lang
    L13_2 = "trailer_delivery_time"
    L12_2 = L12_2(L13_2)
    L11_2.label = L12_2
    L12_2 = formatNumberToMinSec
    L13_2 = L7_2.timer
    L13_2 = L13_2.mission_time
    L12_2 = L12_2(L13_2)
    L11_2.value = L12_2
    L10_2[1] = L11_2
    L9_2.metadata = L10_2
    L9_2.icon = "boxes-stacked"
    function L10_2()
      local L0_3, L1_3, L2_3, L3_3, L4_3
      L0_3 = lib
      L0_3 = L0_3.callback
      L1_3 = "wais:forklifter:checkBusy"
      L2_3 = false
      function L3_3(A0_4)
        local L1_4, L2_4, L3_4, L4_4, L5_4, L6_4
        if A0_4 then
          L1_4 = Config
          L1_4 = L1_4.Notification
          L2_4 = Lang
          L3_4 = "job"
          L2_4 = L2_4(L3_4)
          L3_4 = Lang
          L4_4 = "busy_cargo"
          L3_4 = L3_4(L4_4)
          L4_4 = "error"
          L5_4 = nil
          return L1_4(L2_4, L3_4, L4_4, L5_4)
        end
        L1_4 = currCargos
        if nil ~= L1_4 then
          L1_4 = Config
          L1_4 = L1_4.Notification
          L2_4 = Lang
          L3_4 = "job"
          L2_4 = L2_4(L3_4)
          L3_4 = Lang
          L4_4 = "already_have_cargo"
          L3_4 = L3_4(L4_4)
          L4_4 = "error"
          L5_4 = nil
          return L1_4(L2_4, L3_4, L4_4, L5_4)
        end
        L1_4 = lib
        L1_4 = L1_4.getClosestVehicle
        L2_4 = L0_1.cargo_list
        L3_4 = L6_2
        L2_4 = L2_4[L3_4]
        L2_4 = L2_4.forkliftCoords
        L2_4 = L2_4.x
        L3_4 = L0_1.cargo_list
        L4_4 = L6_2
        L3_4 = L3_4[L4_4]
        L3_4 = L3_4.forkliftCoords
        L3_4 = L3_4.y
        L4_4 = L0_1.cargo_list
        L5_4 = L6_2
        L4_4 = L4_4[L5_4]
        L4_4 = L4_4.forkliftCoords
        L4_4 = L4_4.z
        L5_4 = 3.0
        L6_4 = true
        L1_4 = L1_4(L2_4, L3_4, L4_4, L5_4, L6_4)
        if L1_4 then
          L1_4 = Config
          L1_4 = L1_4.Notification
          L2_4 = Lang
          L3_4 = "job"
          L2_4 = L2_4(L3_4)
          L3_4 = Lang
          L4_4 = "car_spawn_blocked_shipping"
          L3_4 = L3_4(L4_4)
          L4_4 = "warning"
          L5_4 = nil
          return L1_4(L2_4, L3_4, L4_4, L5_4)
        end
        L1_4 = spawnJobCar
        L2_4 = "forklifter"
        L3_4 = L0_1.cargo_list
        L4_4 = L6_2
        L3_4 = L3_4[L4_4]
        L3_4 = L3_4.forkliftCoords
        L1_4 = L1_4(L2_4, L3_4)
        if not L1_4 then
          L1_4 = TriggerServerEvent
          L2_4 = "wais:forklifter:delBusyIndex"
          L3_4 = L6_2
          return L1_4(L2_4, L3_4)
        end
        L1_4 = Cargos
        L1_4 = L1_4.CreateMission
        L2_4 = L6_2
        L1_4 = L1_4(L2_4)
        currCargos = L1_4
        L1_4 = Config
        L1_4 = L1_4.Notification
        L2_4 = Lang
        L3_4 = "job"
        L2_4 = L2_4(L3_4)
        L3_4 = Lang
        L4_4 = "load_pallets"
        L3_4 = L3_4(L4_4)
        L4_4 = "success"
        L5_4 = 5000
        L1_4(L2_4, L3_4, L4_4, L5_4)
      end
      L4_3 = L6_2
      L0_3(L1_3, L2_3, L3_3, L4_3)
    end
    L9_2.onSelect = L10_2
    L0_2[L8_2] = L9_2
  end
  L2_2 = lib
  L2_2 = L2_2.registerContext
  L3_2 = {}
  L4_2 = menus
  L4_2 = L4_2.cargo_list
  L5_2 = L4_2
  L4_2 = L4_2.format
  L6_2 = "forklifter"
  L4_2 = L4_2(L5_2, L6_2)
  L3_2.id = L4_2
  L4_2 = Lang
  L5_2 = "cargo_list"
  L4_2 = L4_2(L5_2)
  L3_2.title = L4_2
  L3_2.options = L0_2
  L4_2 = menus
  L4_2 = L4_2.job_menu
  L5_2 = L4_2
  L4_2 = L4_2.format
  L6_2 = "forklifter"
  L4_2 = L4_2(L5_2, L6_2)
  L3_2.menu = L4_2
  L2_2(L3_2)
end
initForklift = L1_1
function L1_1()
  local L0_2, L1_2, L2_2
  L0_2 = currCargos
  if nil ~= L0_2 then
    L0_2 = currCargos
    L1_2 = L0_2
    L0_2 = L0_2.deleteSelf
    L2_2 = false
    L0_2(L1_2, L2_2)
    currCargos = nil
  end
end
deleteForklifterCargo = L1_1
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
    if "forklifter" == L3_2 then
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