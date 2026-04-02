local L0_1, L1_1, L2_1, L3_1, L4_1
L0_1 = Config
L0_1 = L0_1.Jobs
L0_1 = L0_1.project_car
L1_1 = {}
CurrentProject = nil
ProjectCars = L1_1
L1_1 = nil
L2_1 = RegisterNetEvent
L3_1 = "wais:setDefault:JobThings"
function L4_1()
  local L0_2, L1_2, L2_2, L3_2
  L0_2 = Group
  L0_2 = L0_2.active
  if not L0_2 then
    L0_2 = CurrentProject
    if nil ~= L0_2 then
      L0_2 = TriggerServerEvent
      L1_2 = "wais:projectcar:cancelProject"
      L2_2 = CurrentProject
      L2_2 = L2_2.id
      L3_2 = CurrentProject
      L3_2 = L3_2.projectId
      L0_2(L1_2, L2_2, L3_2)
    end
  else
    L0_2 = Group
    L0_2 = L0_2.active
    if L0_2 then
      L0_2 = Group
      L0_2 = L0_2.ownerId
      L1_2 = GetPlayerServerId
      L2_2 = PlayerId
      L2_2, L3_2 = L2_2()
      L1_2 = L1_2(L2_2, L3_2)
      if L0_2 == L1_2 then
        L0_2 = CurrentProject
        if nil ~= L0_2 then
          L0_2 = CurrentProject
          L0_2 = L0_2.projectType
          L0_2 = L0_2.type
          if "group" == L0_2 then
            L0_2 = CurrentProject
            L0_2 = L0_2.projectType
            L0_2 = L0_2.id
            L1_2 = Group
            L1_2 = L1_2.groupId
            if L0_2 == L1_2 then
              L0_2 = TriggerServerEvent
              L1_2 = "wais:projectcar:cancelProject"
              L2_2 = CurrentProject
              L2_2 = L2_2.id
              L3_2 = CurrentProject
              L3_2 = L3_2.projectId
              L0_2(L1_2, L2_2, L3_2)
            end
          end
        end
      end
    end
  end
  L0_2 = nil
  L1_1 = L0_2
end
L2_1(L3_1, L4_1)
L2_1 = RegisterNetEvent
L3_1 = "wais:projectcar:startProject"
function L4_1(A0_2, A1_2)
  local L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2
  L2_2 = A1_2.type
  if "player" == L2_2 then
    L2_2 = GetPlayerServerId
    L3_2 = PlayerId
    L3_2, L4_2, L5_2, L6_2, L7_2, L8_2 = L3_2()
    L2_2 = L2_2(L3_2, L4_2, L5_2, L6_2, L7_2, L8_2)
    L3_2 = tonumber
    L4_2 = A1_2.id
    L3_2 = L3_2(L4_2)
    if L2_2 == L3_2 then
      goto lbl_25
    end
  end
  L2_2 = A1_2.type
  if "group" == L2_2 then
    L2_2 = Group
    L2_2 = L2_2.active
    if L2_2 then
      L2_2 = Group
      L2_2 = L2_2.groupId
      L3_2 = A1_2.id
      ::lbl_25::
      if L2_2 == L3_2 then
        L2_2 = ProjectCar
        L3_2 = L2_2
        L2_2 = L2_2.newProject
        L4_2 = A0_2
        L5_2 = A1_2
        L6_2 = true
        L2_2 = L2_2(L3_2, L4_2, L5_2, L6_2)
        CurrentProject = L2_2
    end
  end
  else
    L2_2 = ProjectCars
    L3_2 = tostring
    L4_2 = A0_2
    L3_2 = L3_2(L4_2)
    L4_2 = ProjectCar
    L5_2 = L4_2
    L4_2 = L4_2.newProject
    L6_2 = A0_2
    L7_2 = A1_2
    L8_2 = false
    L4_2 = L4_2(L5_2, L6_2, L7_2, L8_2)
    L2_2[L3_2] = L4_2
  end
end
L2_1(L3_1, L4_1)
L2_1 = RegisterNetEvent
L3_1 = "wais:projectcar:group:changeWheel:busyState"
function L4_1(A0_2, A1_2, A2_2, A3_2)
  local L4_2, L5_2, L6_2, L7_2
  L4_2 = CurrentProject
  if L4_2 then
    L4_2 = CurrentProject
    L4_2 = L4_2.projectId
    if L4_2 == A1_2 then
      L4_2 = CurrentProject
      L5_2 = L4_2
      L4_2 = L4_2.changeWheelBusyState
      L6_2 = A2_2
      L7_2 = A3_2
      L4_2(L5_2, L6_2, L7_2)
    end
  end
end
L2_1(L3_1, L4_1)
L2_1 = RegisterNetEvent
L3_1 = "wais:projectcar:changeWheel:fixState"
function L4_1(A0_2, A1_2, A2_2, A3_2)
  local L4_2, L5_2, L6_2, L7_2
  L4_2 = CurrentProject
  if L4_2 then
    L4_2 = CurrentProject
    L4_2 = L4_2.projectId
    if L4_2 == A1_2 then
      L4_2 = CurrentProject
      L5_2 = L4_2
      L4_2 = L4_2.fixVehicleTyre
      L6_2 = A2_2
      L7_2 = A3_2
      L4_2(L5_2, L6_2, L7_2)
  end
  else
    L4_2 = ProjectCars
    L5_2 = tostring
    L6_2 = A1_2
    L5_2 = L5_2(L6_2)
    L4_2 = L4_2[L5_2]
    if nil ~= L4_2 then
      L4_2 = ProjectCars
      L5_2 = tostring
      L6_2 = A1_2
      L5_2 = L5_2(L6_2)
      L4_2 = L4_2[L5_2]
      L5_2 = L4_2
      L4_2 = L4_2.fixVehicleTyre
      L6_2 = A2_2
      L7_2 = A3_2
      L4_2(L5_2, L6_2, L7_2)
    end
  end
end
L2_1(L3_1, L4_1)
L2_1 = RegisterNetEvent
L3_1 = "wais:projectcar:group:changeDoor:busyState"
function L4_1(A0_2, A1_2, A2_2, A3_2)
  local L4_2, L5_2, L6_2, L7_2
  L4_2 = CurrentProject
  if L4_2 then
    L4_2 = CurrentProject
    L4_2 = L4_2.projectId
    if L4_2 == A1_2 then
      L4_2 = CurrentProject
      L5_2 = L4_2
      L4_2 = L4_2.changeDoorBusyState
      L6_2 = A2_2
      L7_2 = A3_2
      L4_2(L5_2, L6_2, L7_2)
    end
  end
end
L2_1(L3_1, L4_1)
L2_1 = RegisterNetEvent
L3_1 = "wais:projectcar:changeDoor:fixState"
function L4_1(A0_2, A1_2, A2_2, A3_2)
  local L4_2, L5_2, L6_2, L7_2
  L4_2 = CurrentProject
  if L4_2 then
    L4_2 = CurrentProject
    L4_2 = L4_2.projectId
    if L4_2 == A1_2 then
      L4_2 = CurrentProject
      L5_2 = L4_2
      L4_2 = L4_2.fixVehicleDoor
      L6_2 = A2_2
      L7_2 = A3_2
      L4_2(L5_2, L6_2, L7_2)
  end
  else
    L4_2 = ProjectCars
    L5_2 = tostring
    L6_2 = A1_2
    L5_2 = L5_2(L6_2)
    L4_2 = L4_2[L5_2]
    if nil ~= L4_2 then
      L4_2 = ProjectCars
      L5_2 = tostring
      L6_2 = A1_2
      L5_2 = L5_2(L6_2)
      L4_2 = L4_2[L5_2]
      L5_2 = L4_2
      L4_2 = L4_2.fixVehicleDoor
      L6_2 = A2_2
      L7_2 = A3_2
      L4_2(L5_2, L6_2, L7_2)
    end
  end
end
L2_1(L3_1, L4_1)
L2_1 = RegisterNetEvent
L3_1 = "wais:projectcar:projectFinished"
function L4_1(A0_2, A1_2, A2_2)
  local L3_2, L4_2, L5_2, L6_2, L7_2, L8_2
  L3_2 = CurrentProject
  if L3_2 then
    L3_2 = CurrentProject
    L3_2 = L3_2.projectId
    if L3_2 == A1_2 then
      if nil ~= A2_2 then
        L3_2 = showAnnouncement
        L4_2 = Lang
        L5_2 = "project_car"
        L4_2 = L4_2(L5_2)
        L5_2 = Lang
        L6_2 = "project_cancelled"
        L5_2 = L5_2(L6_2)
        L6_2 = 10000
        L3_2(L4_2, L5_2, L6_2)
      else
        L3_2 = showAnnouncement
        L4_2 = Lang
        L5_2 = "project_car"
        L4_2 = L4_2(L5_2)
        L5_2 = Lang
        L6_2 = "project_finished"
        L5_2 = L5_2(L6_2)
        L6_2 = 10000
        L3_2(L4_2, L5_2, L6_2)
        L3_2 = Config
        L3_2 = L3_2.Notification
        L4_2 = Lang
        L5_2 = "job"
        L4_2 = L4_2(L5_2)
        L5_2 = Lang
        L6_2 = "project_finished"
        L5_2 = L5_2(L6_2)
        L6_2 = "success"
        L7_2 = nil
        L3_2(L4_2, L5_2, L6_2, L7_2)
        L3_2 = Config
        L3_2 = L3_2.JobSuccess
        L4_2 = CurrentJob
        L5_2 = L0_1.car_list
        L5_2 = L5_2[A1_2]
        L5_2 = L5_2.project_details
        L5_2 = L5_2.reward
        L6_2 = A1_2
        L7_2 = CurrentProject
        L7_2 = L7_2.timer
        L8_2 = L7_2
        L7_2 = L7_2.getDuration
        L7_2 = L7_2(L8_2)
        L8_2 = CurrentProject
        L8_2 = L8_2.timer
        L8_2 = L8_2.extraTimeEnabled
        L3_2(L4_2, L5_2, L6_2, L7_2, L8_2)
      end
      L3_2 = CurrentProject
      L4_2 = L3_2
      L3_2 = L3_2.finishProject
      L3_2 = L3_2(L4_2)
      if L3_2 then
        CurrentProject = nil
      end
  end
  else
    L3_2 = ProjectCars
    L4_2 = tostring
    L5_2 = A1_2
    L4_2 = L4_2(L5_2)
    L3_2 = L3_2[L4_2]
    if nil ~= L3_2 then
      L3_2 = ProjectCars
      L4_2 = tostring
      L5_2 = A1_2
      L4_2 = L4_2(L5_2)
      L3_2 = L3_2[L4_2]
      L4_2 = L3_2
      L3_2 = L3_2.finishProject
      L3_2 = L3_2(L4_2)
      if L3_2 then
        L3_2 = ProjectCars
        L4_2 = tostring
        L5_2 = A1_2
        L4_2 = L4_2(L5_2)
        L3_2[L4_2] = nil
      end
    end
  end
end
L2_1(L3_1, L4_1)
function L2_1()
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
          L5_3 = "project_car"
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
    L2_2 = "[^2INFO^7] Project Car Job Center has been initialized."
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
      L3_2 = "[^2INFO^7] Project Car Job Center Blip has been initialized."
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
  L3_2 = L0_1.car_list
  L2_2, L3_2, L4_2, L5_2 = L2_2(L3_2)
  for L6_2, L7_2 in L2_2, L3_2, L4_2, L5_2 do
    L8_2 = #L1_2
    L8_2 = L8_2 + 1
    L9_2 = {}
    L10_2 = "%s %s"
    L11_2 = L10_2
    L10_2 = L10_2.format
    L12_2 = Lang
    L13_2 = "project"
    L12_2 = L12_2(L13_2)
    L13_2 = L7_2.project_details
    L13_2 = L13_2.car_model
    L10_2 = L10_2(L11_2, L12_2, L13_2)
    L9_2.title = L10_2
    L10_2 = Lang
    L11_2 = "project_car_desc"
    L12_2 = formatNumberToMinSec
    L13_2 = L7_2.project_details
    L13_2 = L13_2.mission_time
    L12_2 = L12_2(L13_2)
    L13_2 = L7_2.project_details
    L13_2 = L13_2.reward
    L10_2 = L10_2(L11_2, L12_2, L13_2)
    L9_2.description = L10_2
    L9_2.icon = "car"
    function L10_2()
      local L0_3, L1_3, L2_3, L3_3, L4_3
      L0_3 = CurrentProject
      if nil ~= L0_3 then
        L0_3 = Config
        L0_3 = L0_3.Notification
        L1_3 = Lang
        L2_3 = "job"
        L1_3 = L1_3(L2_3)
        L2_3 = Lang
        L3_3 = "already_have_a_project"
        L2_3 = L2_3(L3_3)
        L3_3 = "error"
        L4_3 = nil
        return L0_3(L1_3, L2_3, L3_3, L4_3)
      end
      L0_3 = Group
      L0_3 = L0_3.active
      if L0_3 then
        L0_3 = Group
        L0_3 = L0_3.ownerId
        L1_3 = GetPlayerServerId
        L2_3 = PlayerId
        L2_3, L3_3, L4_3 = L2_3()
        L1_3 = L1_3(L2_3, L3_3, L4_3)
        if L0_3 ~= L1_3 then
          L0_3 = Config
          L0_3 = L0_3.Notification
          L1_3 = Lang
          L2_3 = "job"
          L1_3 = L1_3(L2_3)
          L2_3 = Lang
          L3_3 = "only_owner_can_do"
          L2_3 = L2_3(L3_3)
          L3_3 = "error"
          L4_3 = nil
          return L0_3(L1_3, L2_3, L3_3, L4_3)
        end
      end
      L0_3 = lib
      L0_3 = L0_3.callback
      L1_3 = "wais:projectcar:checkBusy"
      L2_3 = false
      function L3_3(A0_4)
        local L1_4, L2_4, L3_4, L4_4, L5_4
        if A0_4 then
          L1_4 = Config
          L1_4 = L1_4.Notification
          L2_4 = Lang
          L3_4 = "job"
          L2_4 = L2_4(L3_4)
          L3_4 = Lang
          L4_4 = "project_busy"
          L3_4 = L3_4(L4_4)
          L4_4 = "error"
          L5_4 = nil
          return L1_4(L2_4, L3_4, L4_4, L5_4)
        end
        L1_4 = TriggerServerEvent
        L2_4 = "wais:projectcar:startProject"
        L3_4 = L6_2
        L1_4(L2_4, L3_4)
      end
      L4_3 = L6_2
      L0_3(L1_3, L2_3, L3_3, L4_3)
    end
    L9_2.onSelect = L10_2
    L1_2[L8_2] = L9_2
  end
  L2_2 = lib
  L2_2 = L2_2.registerContext
  L3_2 = {}
  L4_2 = menus
  L4_2 = L4_2.project_car_list
  L5_2 = L4_2
  L4_2 = L4_2.format
  L6_2 = "project_car"
  L4_2 = L4_2(L5_2, L6_2)
  L3_2.id = L4_2
  L4_2 = Lang
  L5_2 = "car_list"
  L4_2 = L4_2(L5_2)
  L3_2.title = L4_2
  L3_2.options = L1_2
  L4_2 = menus
  L4_2 = L4_2.job_menu
  L5_2 = L4_2
  L4_2 = L4_2.format
  L6_2 = "project_car"
  L4_2 = L4_2(L5_2, L6_2)
  L3_2.menu = L4_2
  L2_2(L3_2)
end
initProjectCar = L2_1
function L2_1(A0_2)
  local L1_2, L2_2, L3_2
  L1_2 = SetNuiFocus
  L2_2 = true
  L3_2 = true
  L1_2(L2_2, L3_2)
  L1_2 = SendNUIMessage
  L2_2 = {}
  L2_2.type = "SHOW_MINIGAME"
  L2_2.minigame = "wheel_screw"
  L1_2(L2_2)
  while true do
    L1_2 = L1_1
    if nil ~= L1_2 then
      break
    end
    L1_2 = Wait
    L2_2 = 100
    L1_2(L2_2)
  end
  L1_2 = A0_2
  L2_2 = L1_1
  L1_2(L2_2)
  L1_2 = nil
  L1_1 = L1_2
end
screwMinigame = L2_1
L2_1 = RegisterNUICallback
L3_1 = "screw"
function L4_1(A0_2, A1_2)
  local L2_2, L3_2, L4_2
  L2_2 = SetNuiFocus
  L3_2 = false
  L4_2 = false
  L2_2(L3_2, L4_2)
  L2_2 = SendNUIMessage
  L3_2 = {}
  L3_2.type = "HIDE_MINIGAME"
  L3_2.minigame = "wheel_screw"
  L2_2(L3_2)
  L2_2 = A0_2.finished
  L1_1 = L2_2
  L2_2 = A1_2
  L3_2 = true
  L2_2(L3_2)
end
L2_1(L3_1, L4_1)
L2_1 = CreateThread
function L3_1()
  local L0_2, L1_2, L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2, L20_2, L21_2, L22_2, L23_2, L24_2, L25_2, L26_2, L27_2, L28_2
  while true do
    L0_2 = PlayerPedId
    L0_2 = L0_2()
    L1_2 = GetEntityCoords
    L2_2 = L0_2
    L1_2 = L1_2(L2_2)
    L2_2 = 1000
    L3_2 = CurrentJob
    if "project_car" == L3_2 then
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
L2_1(L3_1)