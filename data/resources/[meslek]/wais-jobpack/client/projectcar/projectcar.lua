local L0_1, L1_1, L2_1, L3_1
L0_1 = {}
ProjectCar = L0_1
L0_1 = ProjectCar
L1_1 = ProjectCar
L0_1.__index = L1_1
L0_1 = Config
L0_1 = L0_1.Jobs
L0_1 = L0_1.project_car
function L1_1(A0_2, A1_2, A2_2, A3_2)
  local L4_2, L5_2, L6_2, L7_2
  L4_2 = lib
  L4_2 = L4_2.progressBar
  L5_2 = {}
  L5_2.duration = A0_2
  L5_2.label = A1_2
  L5_2.useWhileDead = false
  L5_2.canCancel = true
  L6_2 = {}
  L7_2 = A2_2.dict
  L6_2.dict = L7_2
  L7_2 = A2_2.clip
  L6_2.clip = L7_2
  L7_2 = A2_2.flag
  if nil ~= L7_2 then
    L7_2 = A2_2.flag
    if L7_2 then
      goto lbl_22
    end
  end
  L7_2 = 49
  ::lbl_22::
  L6_2.flag = L7_2
  L5_2.anim = L6_2
  if nil ~= A3_2 then
    L6_2 = {}
    L7_2 = A3_2.model
    L6_2.model = L7_2
    L7_2 = A3_2.bone
    L6_2.bone = L7_2
    L7_2 = A3_2.coords
    L6_2.coords = L7_2
    L7_2 = A3_2.rotation
    L6_2.rotation = L7_2
    if L6_2 then
      goto lbl_39
    end
  end
  L6_2 = nil
  ::lbl_39::
  L5_2.prop = L6_2
  L6_2 = {}
  L6_2.car = true
  L6_2.move = true
  L6_2.combat = true
  L5_2.disable = L6_2
  return L4_2(L5_2)
end
L2_1 = ProjectCar
function L3_1(A0_2, A1_2, A2_2)
  local L3_2
  L3_2 = A0_2.tyres
  L3_2 = L3_2[A1_2]
  L3_2.isBusy = A2_2
end
L2_1.changeWheelBusyState = L3_1
L2_1 = ProjectCar
function L3_1(A0_2, A1_2, A2_2)
  local L3_2
  L3_2 = A0_2.doors
  L3_2 = L3_2[A1_2]
  L3_2.isBusy = A2_2
end
L2_1.changeDoorBusyState = L3_1
L2_1 = ProjectCar
function L3_1(A0_2)
  local L1_2, L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2
  L1_2 = SetVehicleFixed
  L2_2 = A0_2.vehicle
  L3_2 = true
  L1_2(L2_2, L3_2)
  L1_2 = pairs
  L2_2 = A0_2.tyres
  L1_2, L2_2, L3_2, L4_2 = L1_2(L2_2)
  for L5_2, L6_2 in L1_2, L2_2, L3_2, L4_2 do
    L7_2 = L6_2.isFixed
    if not L7_2 then
      L7_2 = BreakOffVehicleWheel
      L8_2 = A0_2.vehicle
      L9_2 = L6_2.index
      L10_2 = false
      L11_2 = true
      L12_2 = true
      L13_2 = false
      L7_2(L8_2, L9_2, L10_2, L11_2, L12_2, L13_2)
    end
  end
  L1_2 = pairs
  L2_2 = A0_2.doors
  L1_2, L2_2, L3_2, L4_2 = L1_2(L2_2)
  for L5_2, L6_2 in L1_2, L2_2, L3_2, L4_2 do
    L7_2 = L6_2.isFixed
    if not L7_2 then
      L7_2 = SetVehicleDoorBroken
      L8_2 = A0_2.vehicle
      L9_2 = L6_2.index
      L10_2 = true
      L7_2(L8_2, L9_2, L10_2)
    end
  end
end
L2_1.buildVehicleParts = L3_1
L2_1 = ProjectCar
function L3_1(A0_2, A1_2, A2_2)
  local L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2
  L3_2 = A0_2.tyres
  L3_2 = L3_2[A1_2]
  L3_2.isFixed = A2_2
  L3_2 = A0_2.vehicle
  if nil == L3_2 then
    return
  end
  L4_2 = A0_2
  L3_2 = A0_2.buildVehicleParts
  L3_2(L4_2)
  L3_2 = A0_2.projectType
  L3_2 = L3_2.type
  if "player" == L3_2 then
    L3_2 = {}
    L3_2.count = 0
    L3_2.allFixed = true
    L4_2 = pairs
    L5_2 = A0_2.tyres
    L4_2, L5_2, L6_2, L7_2 = L4_2(L5_2)
    for L8_2, L9_2 in L4_2, L5_2, L6_2, L7_2 do
      L10_2 = L9_2.isFixed
      if not L10_2 then
        L10_2 = L3_2.count
        L10_2 = L10_2 + 1
        L3_2.count = L10_2
        L3_2.allFixed = false
      end
    end
    L4_2 = L3_2.allFixed
    if L4_2 then
      L4_2 = CurrentProject
      L4_2 = L4_2.id
      L5_2 = A0_2.id
      if L4_2 == L5_2 then
        A0_2.allTyresFixed = true
        L4_2 = Config
        L4_2 = L4_2.Notification
        L5_2 = Lang
        L6_2 = "job"
        L5_2 = L5_2(L6_2)
        L6_2 = Lang
        L7_2 = "all_tyres_mounted"
        L6_2 = L6_2(L7_2)
        L7_2 = "success"
        L8_2 = 5000
        L4_2(L5_2, L6_2, L7_2, L8_2)
        L4_2 = A0_2.allDoorsFixed
        if L4_2 then
          L4_2 = TriggerServerEvent
          L5_2 = "wais:projectcar:projectFinished"
          L6_2 = CurrentJob
          L7_2 = A0_2.id
          L8_2 = A0_2.projectId
          L4_2(L5_2, L6_2, L7_2, L8_2)
        end
      end
    end
  end
end
L2_1.fixVehicleTyre = L3_1
L2_1 = ProjectCar
function L3_1(A0_2, A1_2, A2_2)
  local L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2
  L3_2 = A0_2.doors
  L3_2 = L3_2[A1_2]
  L3_2.isFixed = A2_2
  L3_2 = A0_2.vehicle
  if nil == L3_2 then
    return
  end
  L4_2 = A0_2
  L3_2 = A0_2.buildVehicleParts
  L3_2(L4_2)
  L3_2 = A0_2.projectType
  L3_2 = L3_2.type
  if "player" == L3_2 then
    L3_2 = {}
    L3_2.count = 0
    L3_2.allFixed = true
    L4_2 = pairs
    L5_2 = A0_2.doors
    L4_2, L5_2, L6_2, L7_2 = L4_2(L5_2)
    for L8_2, L9_2 in L4_2, L5_2, L6_2, L7_2 do
      L10_2 = L9_2.isFixed
      if not L10_2 then
        L10_2 = L3_2.count
        L10_2 = L10_2 + 1
        L3_2.count = L10_2
        L3_2.allFixed = false
      end
    end
    L4_2 = L3_2.allFixed
    if L4_2 then
      L4_2 = CurrentProject
      L4_2 = L4_2.id
      L5_2 = A0_2.id
      if L4_2 == L5_2 then
        A0_2.allDoorsFixed = true
        L4_2 = Config
        L4_2 = L4_2.Notification
        L5_2 = Lang
        L6_2 = "job"
        L5_2 = L5_2(L6_2)
        L6_2 = Lang
        L7_2 = "all_doors_mounted"
        L6_2 = L6_2(L7_2)
        L7_2 = "success"
        L8_2 = 5000
        L4_2(L5_2, L6_2, L7_2, L8_2)
        L4_2 = A0_2.allTyresFixed
        if L4_2 then
          L4_2 = TriggerServerEvent
          L5_2 = "wais:projectcar:projectFinished"
          L6_2 = CurrentJob
          L7_2 = A0_2.id
          L8_2 = A0_2.projectId
          L4_2(L5_2, L6_2, L7_2, L8_2)
        end
      end
    end
  end
end
L2_1.fixVehicleDoor = L3_1
L2_1 = ProjectCar
function L3_1(A0_2)
  local L1_2, L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2
  A0_2.projectShowed = true
  L1_2 = PlayerPedId
  L1_2 = L1_2()
  L2_2 = GetEntityCoords
  L3_2 = L1_2
  L2_2 = L2_2(L3_2)
  L3_2 = false
  L4_2 = SetEntityVisible
  L5_2 = L1_2
  L6_2 = false
  L4_2(L5_2, L6_2)
  L4_2 = SetEntityCoords
  L5_2 = L1_2
  L6_2 = A0_2.projectConfig
  L6_2 = L6_2.project_details
  L6_2 = L6_2.cam_stuff
  L6_2 = L6_2.hidded_ped
  L6_2 = L6_2.x
  L7_2 = A0_2.projectConfig
  L7_2 = L7_2.project_details
  L7_2 = L7_2.cam_stuff
  L7_2 = L7_2.hidded_ped
  L7_2 = L7_2.y
  L8_2 = A0_2.projectConfig
  L8_2 = L8_2.project_details
  L8_2 = L8_2.cam_stuff
  L8_2 = L8_2.hidded_ped
  L8_2 = L8_2.z
  L4_2(L5_2, L6_2, L7_2, L8_2)
  L4_2 = FreezeEntityPosition
  L5_2 = L1_2
  L6_2 = true
  L4_2(L5_2, L6_2)
  while true do
    L4_2 = DoesEntityExist
    L5_2 = A0_2.vehicle
    L4_2 = L4_2(L5_2)
    if L4_2 then
      break
    end
    L4_2 = Wait
    L5_2 = 100
    L4_2(L5_2)
  end
  L4_2 = Wait
  L5_2 = 500
  L4_2(L5_2)
  L4_2 = CreateCamWithParams
  L5_2 = "DEFAULT_SCRIPTED_CAMERA"
  L6_2 = A0_2.projectConfig
  L6_2 = L6_2.project_details
  L6_2 = L6_2.cam_stuff
  L6_2 = L6_2.cam_pos
  L6_2 = L6_2.x
  L7_2 = A0_2.projectConfig
  L7_2 = L7_2.project_details
  L7_2 = L7_2.cam_stuff
  L7_2 = L7_2.cam_pos
  L7_2 = L7_2.y
  L8_2 = A0_2.projectConfig
  L8_2 = L8_2.project_details
  L8_2 = L8_2.cam_stuff
  L8_2 = L8_2.cam_pos
  L8_2 = L8_2.z
  L9_2 = A0_2.projectConfig
  L9_2 = L9_2.project_details
  L9_2 = L9_2.cam_stuff
  L9_2 = L9_2.cam_rot
  L9_2 = L9_2.x
  L10_2 = A0_2.projectConfig
  L10_2 = L10_2.project_details
  L10_2 = L10_2.cam_stuff
  L10_2 = L10_2.cam_rot
  L10_2 = L10_2.y
  L11_2 = A0_2.projectConfig
  L11_2 = L11_2.project_details
  L11_2 = L11_2.cam_stuff
  L11_2 = L11_2.cam_rot
  L11_2 = L11_2.z
  L12_2 = A0_2.projectConfig
  L12_2 = L12_2.project_details
  L12_2 = L12_2.cam_stuff
  L12_2 = L12_2.cam_fov
  L13_2 = false
  L14_2 = 0
  L4_2 = L4_2(L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2)
  A0_2.cam = L4_2
  L4_2 = SetCamActive
  L5_2 = A0_2.cam
  L6_2 = true
  L4_2(L5_2, L6_2)
  L4_2 = RenderScriptCams
  L5_2 = true
  L6_2 = true
  L7_2 = 550
  L8_2 = true
  L9_2 = true
  L4_2(L5_2, L6_2, L7_2, L8_2, L9_2)
  L4_2 = SetCamUseShallowDofMode
  L5_2 = A0_2.cam
  L6_2 = true
  L4_2(L5_2, L6_2)
  L4_2 = SetCamNearDof
  L5_2 = A0_2.cam
  L6_2 = 0.7
  L4_2(L5_2, L6_2)
  L4_2 = SetCamFarDof
  L5_2 = A0_2.cam
  L6_2 = 1.3
  L4_2(L5_2, L6_2)
  L4_2 = SetCamDofStrength
  L5_2 = A0_2.cam
  L6_2 = 1
  L4_2(L5_2, L6_2)
  L4_2 = SetCamDofFocalLengthMultiplier
  L5_2 = A0_2.cam
  L6_2 = 100.0
  L4_2(L5_2, L6_2)
  L4_2 = SetCamRot
  L5_2 = A0_2.cam
  L6_2 = A0_2.projectConfig
  L6_2 = L6_2.project_details
  L6_2 = L6_2.cam_stuff
  L6_2 = L6_2.cam_rot
  L6_2 = L6_2.x
  L7_2 = A0_2.projectConfig
  L7_2 = L7_2.project_details
  L7_2 = L7_2.cam_stuff
  L7_2 = L7_2.cam_rot
  L7_2 = L7_2.y
  L8_2 = A0_2.projectConfig
  L8_2 = L8_2.project_details
  L8_2 = L8_2.cam_stuff
  L8_2 = L8_2.cam_rot
  L8_2 = L8_2.z
  L9_2 = 0
  L4_2(L5_2, L6_2, L7_2, L8_2, L9_2)
  L4_2 = DoScreenFadeIn
  L5_2 = 1000
  L4_2(L5_2)
  while true do
    L4_2 = IsScreenFadedIn
    L4_2 = L4_2()
    if L4_2 then
      break
    end
    L4_2 = Wait
    L5_2 = 1000
    L4_2(L5_2)
  end
  L4_2 = showAnnouncement
  L5_2 = Lang
  L6_2 = "project_car"
  L5_2 = L5_2(L6_2)
  L6_2 = Lang
  L7_2 = "project_started"
  L6_2 = L6_2(L7_2)
  L7_2 = 5000
  L4_2(L5_2, L6_2, L7_2)
  L4_2 = Wait
  L5_2 = 5000
  L4_2(L5_2)
  L5_2 = A0_2
  L4_2 = A0_2.deleteCinematic
  L6_2 = L2_2
  L4_2(L5_2, L6_2)
end
L2_1.showCinematic = L3_1
L2_1 = ProjectCar
function L3_1(A0_2, A1_2)
  local L2_2, L3_2, L4_2, L5_2, L6_2, L7_2
  L2_2 = DoScreenFadeOut
  L3_2 = 1000
  L2_2(L3_2)
  while true do
    L2_2 = IsScreenFadedOut
    L2_2 = L2_2()
    if L2_2 then
      break
    end
    L2_2 = Wait
    L3_2 = 1000
    L2_2(L3_2)
  end
  L2_2 = SetCamActive
  L3_2 = A0_2.cam
  L4_2 = false
  L2_2(L3_2, L4_2)
  L2_2 = RenderScriptCams
  L3_2 = false
  L4_2 = true
  L5_2 = 550
  L6_2 = true
  L7_2 = true
  L2_2(L3_2, L4_2, L5_2, L6_2, L7_2)
  L2_2 = DestroyCam
  L3_2 = A0_2.cam
  L4_2 = false
  L2_2(L3_2, L4_2)
  A0_2.cam = nil
  L2_2 = PlayerPedId
  L2_2 = L2_2()
  L3_2 = FreezeEntityPosition
  L4_2 = L2_2
  L5_2 = false
  L3_2(L4_2, L5_2)
  L3_2 = SetEntityCoords
  L4_2 = L2_2
  L5_2 = A1_2.x
  L6_2 = A1_2.y
  L7_2 = A1_2.z
  L3_2(L4_2, L5_2, L6_2, L7_2)
  L3_2 = SetEntityVisible
  L4_2 = L2_2
  L5_2 = true
  L3_2(L4_2, L5_2)
  L3_2 = DoScreenFadeIn
  L4_2 = 1000
  L3_2(L4_2)
end
L2_1.deleteCinematic = L3_1
L2_1 = ProjectCar
function L3_1(A0_2)
  local L1_2, L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2
  L1_2 = joaat
  L2_2 = A0_2.projectConfig
  L2_2 = L2_2.vehicle_parts_store
  L2_2 = L2_2.npc
  L2_2 = L2_2.model
  L1_2 = L1_2(L2_2)
  L2_2 = A0_2.projectConfig
  L2_2 = L2_2.vehicle_parts_store
  L2_2 = L2_2.npc
  L2_2 = L2_2.coords
  L3_2 = loadModel
  L4_2 = L1_2
  L3_2 = L3_2(L4_2)
  if not L3_2 then
    return
  end
  L3_2 = CreatePed
  L4_2 = 4
  L5_2 = L1_2
  L6_2 = L2_2.x
  L7_2 = L2_2.y
  L8_2 = L2_2.z
  L9_2 = L2_2.w
  L10_2 = false
  L11_2 = false
  L3_2 = L3_2(L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2)
  A0_2.seller = L3_2
  L3_2 = SetEntityAsMissionEntity
  L4_2 = A0_2.seller
  L5_2 = true
  L6_2 = true
  L3_2(L4_2, L5_2, L6_2)
  L3_2 = SetBlockingOfNonTemporaryEvents
  L4_2 = A0_2.seller
  L5_2 = true
  L3_2(L4_2, L5_2)
  L3_2 = SetEntityInvincible
  L4_2 = A0_2.seller
  L5_2 = true
  L3_2(L4_2, L5_2)
  L3_2 = FreezeEntityPosition
  L4_2 = A0_2.seller
  L5_2 = true
  L3_2(L4_2, L5_2)
  L3_2 = TaskStartScenarioInPlace
  L4_2 = A0_2.seller
  L5_2 = A0_2.projectConfig
  L5_2 = L5_2.project_details
  L5_2 = L5_2.seller_scenario
  L6_2 = 0
  L7_2 = true
  L3_2(L4_2, L5_2, L6_2, L7_2)
  L3_2 = props
  L4_2 = props
  L4_2 = #L4_2
  L4_2 = L4_2 + 1
  L5_2 = A0_2.seller
  L3_2[L4_2] = L5_2
  L3_2 = {}
  L4_2 = pairs
  L5_2 = A0_2.projectConfig
  L5_2 = L5_2.vehicle_parts_store
  L5_2 = L5_2.parts
  L4_2, L5_2, L6_2, L7_2 = L4_2(L5_2)
  for L8_2, L9_2 in L4_2, L5_2, L6_2, L7_2 do
    L10_2 = #L3_2
    L10_2 = L10_2 + 1
    L11_2 = {}
    L12_2 = L9_2.label
    L13_2 = L12_2
    L12_2 = L12_2.format
    L14_2 = L9_2.price
    L12_2 = L12_2(L13_2, L14_2)
    L11_2.title = L12_2
    L12_2 = L9_2.description
    L11_2.description = L12_2
    L11_2.icon = "box"
    function L12_2()
      local L0_3, L1_3, L2_3, L3_3, L4_3, L5_3, L6_3
      L0_3 = lib
      L0_3 = L0_3.inputDialog
      L1_3 = Lang
      L2_3 = buy_component
      L1_3 = L1_3(L2_3)
      L2_3 = {}
      L3_3 = {}
      L3_3.type = "number"
      L4_3 = L9_2.label
      L5_3 = L4_3
      L4_3 = L4_3.format
      L6_3 = L9_2.price
      L4_3 = L4_3(L5_3, L6_3)
      L3_3.label = L4_3
      L4_3 = L9_2.description
      L3_3.description = L4_3
      L3_3.required = true
      L3_3.min = 1
      L3_3.max = 4
      L3_3.icon = "hashtag"
      L2_3[1] = L3_3
      L0_3 = L0_3(L1_3, L2_3)
      if nil == L0_3 then
        L1_3 = Config
        L1_3 = L1_3.Notification
        L2_3 = Lang
        L3_3 = "job"
        L2_3 = L2_3(L3_3)
        L3_3 = Lang
        L4_3 = "wrong_amount"
        L3_3 = L3_3(L4_3)
        L4_3 = "error"
        L5_3 = 5000
        return L1_3(L2_3, L3_3, L4_3, L5_3)
      end
      L1_3 = SetNewWaypoint
      L2_3 = A0_2.projectConfig
      L2_3 = L2_3.project_details
      L2_3 = L2_3.craft_coord
      L2_3 = L2_3.x
      L3_3 = A0_2.projectConfig
      L3_3 = L3_3.project_details
      L3_3 = L3_3.craft_coord
      L3_3 = L3_3.y
      L1_3(L2_3, L3_3)
      L1_3 = TriggerServerEvent
      L2_3 = "wais:projectcar:components:buy"
      L3_3 = CurrentJob
      L4_3 = A0_2.projectId
      L5_3 = L8_2
      L6_3 = L0_3[1]
      L1_3(L2_3, L3_3, L4_3, L5_3, L6_3)
    end
    L11_2.onSelect = L12_2
    L3_2[L10_2] = L11_2
  end
  L4_2 = lib
  L4_2 = L4_2.registerContext
  L5_2 = {}
  L6_2 = menus
  L6_2 = L6_2.vehicle_componenets
  L7_2 = L6_2
  L6_2 = L6_2.format
  L8_2 = "project_car"
  L6_2 = L6_2(L7_2, L8_2)
  L5_2.id = L6_2
  L6_2 = Lang
  L7_2 = "car_list"
  L6_2 = L6_2(L7_2)
  L5_2.title = L6_2
  L5_2.options = L3_2
  L4_2(L5_2)
  L4_2 = AddTargetEntity
  L5_2 = A0_2.seller
  L6_2 = {}
  L7_2 = {}
  L7_2.icon = "fa-solid fa-basket-shopping"
  L8_2 = Lang
  L9_2 = "buy_component"
  L8_2 = L8_2(L9_2)
  L7_2.label = L8_2
  function L8_2()
    local L0_3, L1_3, L2_3, L3_3
    L0_3 = lib
    L0_3 = L0_3.showContext
    L1_3 = menus
    L1_3 = L1_3.vehicle_componenets
    L2_3 = L1_3
    L1_3 = L1_3.format
    L3_3 = "project_car"
    L1_3, L2_3, L3_3 = L1_3(L2_3, L3_3)
    L0_3(L1_3, L2_3, L3_3)
  end
  L7_2.action = L8_2
  L6_2[1] = L7_2
  L7_2 = true
  L8_2 = 3.0
  L4_2(L5_2, L6_2, L7_2, L8_2)
end
L2_1.createSeller = L3_1
L2_1 = ProjectCar
function L3_1(A0_2)
  local L1_2, L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2
  A0_2.deleted = true
  L1_2 = A0_2.cam
  if nil ~= L1_2 then
    L2_2 = A0_2
    L1_2 = A0_2.deleteCinematic
    L3_2 = L0_1.menu
    L3_2 = L3_2.job_menu
    L1_2(L2_2, L3_2)
  end
  L1_2 = pairs
  L2_2 = A0_2.jacks
  L1_2, L2_2, L3_2, L4_2 = L1_2(L2_2)
  for L5_2, L6_2 in L1_2, L2_2, L3_2, L4_2 do
    L7_2 = DoesEntityExist
    L8_2 = L6_2
    L7_2 = L7_2(L8_2)
    if L7_2 then
      L7_2 = DeleteEntity
      L8_2 = L6_2
      L7_2(L8_2)
    end
  end
  L1_2 = DoesEntityExist
  L2_2 = A0_2.vehicle
  L1_2 = L1_2(L2_2)
  if L1_2 then
    L1_2 = DeleteEntity
    L2_2 = A0_2.vehicle
    L1_2(L2_2)
    A0_2.vehicle = nil
  end
  L1_2 = DoesBlipExist
  L2_2 = A0_2.blip
  L1_2 = L1_2(L2_2)
  if L1_2 then
    L1_2 = RemoveBlip
    L2_2 = A0_2.blip
    L1_2(L2_2)
  end
  L1_2 = DoesBlipExist
  L2_2 = A0_2.sellerBlips
  L1_2 = L1_2(L2_2)
  if L1_2 then
    L1_2 = RemoveBlip
    L2_2 = A0_2.sellerBlips
    L1_2(L2_2)
  end
  L1_2 = pairs
  L2_2 = A0_2.boxZones
  L1_2, L2_2, L3_2, L4_2 = L1_2(L2_2)
  for L5_2, L6_2 in L1_2, L2_2, L3_2, L4_2 do
    L7_2 = RemoveBoxZone
    L8_2 = L6_2
    L7_2(L8_2)
  end
  L1_2 = A0_2.timer
  L2_2 = L1_2
  L1_2 = L1_2.delete
  L1_2(L2_2)
  A0_2 = nil
  L1_2 = true
  return L1_2
end
L2_1.finishProject = L3_1
L2_1 = ProjectCar
function L3_1(A0_2, A1_2, A2_2, A3_2)
  local L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2
  L4_2 = setmetatable
  L5_2 = {}
  L6_2 = ProjectCar
  L4_2 = L4_2(L5_2, L6_2)
  L5_2 = lib
  L5_2 = L5_2.string
  L5_2 = L5_2.random
  L6_2 = "aaaaaa"
  L5_2 = L5_2(L6_2)
  L4_2.id = L5_2
  L5_2 = A1_2
  L6_2 = false
  L4_2.projectType = A2_2
  L4_2.deleted = L6_2
  L4_2.projectId = L5_2
  L5_2 = L0_1.car_list
  L5_2 = L5_2[A1_2]
  L4_2.projectConfig = L5_2
  L5_2 = {}
  L6_2 = {}
  L7_2 = {}
  L4_2.boxZones = L7_2
  L4_2.tyres = L6_2
  L4_2.doors = L5_2
  L5_2 = {}
  L4_2.vehicle = nil
  L4_2.jacks = L5_2
  L5_2 = pairs
  L6_2 = L4_2.projectConfig
  L6_2 = L6_2.project_details
  L6_2 = L6_2.tyre_positions
  L5_2, L6_2, L7_2, L8_2 = L5_2(L6_2)
  for L9_2, L10_2 in L5_2, L6_2, L7_2, L8_2 do
    L11_2 = L4_2.tyres
    L12_2 = {}
    L13_2 = L10_2.tyre_index
    L12_2.index = L13_2
    L12_2.isBusy = false
    L12_2.isFixed = false
    L11_2[L9_2] = L12_2
  end
  L5_2 = pairs
  L6_2 = L4_2.projectConfig
  L6_2 = L6_2.project_details
  L6_2 = L6_2.door_positions
  L5_2, L6_2, L7_2, L8_2 = L5_2(L6_2)
  for L9_2, L10_2 in L5_2, L6_2, L7_2, L8_2 do
    L11_2 = L4_2.doors
    L12_2 = {}
    L13_2 = L10_2.door_index
    L12_2.index = L13_2
    L12_2.isBusy = false
    L12_2.isFixed = false
    L11_2[L9_2] = L12_2
  end
  L5_2 = CreateThread
  function L6_2()
    local L0_3, L1_3, L2_3, L3_3, L4_3, L5_3, L6_3, L7_3, L8_3, L9_3, L10_3, L11_3, L12_3, L13_3, L14_3, L15_3, L16_3, L17_3, L18_3, L19_3, L20_3, L21_3, L22_3, L23_3, L24_3, L25_3, L26_3, L27_3, L28_3, L29_3
    while true do
      L0_3 = L4_2
      if not L0_3 then
        break
      end
      L0_3 = L4_2.deleted
      if L0_3 then
        break
      end
      L0_3 = PlayerPedId
      L0_3 = L0_3()
      L1_3 = GetEntityCoords
      L2_3 = L0_3
      L1_3 = L1_3(L2_3)
      L2_3 = L4_2.projectConfig
      L2_3 = L2_3.project_details
      L2_3 = L2_3.craft_coord
      L2_3 = L2_3 - L1_3
      L2_3 = #L2_3
      L3_3 = 424
      if L2_3 <= L3_3 then
        L3_3 = joaat
        L4_3 = L4_2.projectConfig
        L4_3 = L4_3.project_details
        L4_3 = L4_3.jack_model
        L3_3 = L3_3(L4_3)
        L4_3 = joaat
        L5_3 = L4_2.projectConfig
        L5_3 = L5_3.project_details
        L5_3 = L5_3.car_model
        L4_3 = L4_3(L5_3)
        L5_3 = L0_1.debug
        if L5_3 then
          L5_3 = print
          L6_3 = "[^2INFO^7] Requesting vehicle and jack model."
          L5_3(L6_3)
        end
        L5_3 = loadModel
        L6_3 = L3_3
        L5_3 = L5_3(L6_3)
        if not L5_3 then
          return
        end
        L5_3 = loadModel
        L6_3 = L4_3
        L5_3 = L5_3(L6_3)
        if not L5_3 then
          return
        end
        L5_3 = CreateVehicle
        L6_3 = L4_3
        L7_3 = L4_2.projectConfig
        L7_3 = L7_3.project_details
        L7_3 = L7_3.jack_coord
        L7_3 = L7_3.x
        L8_3 = L4_2.projectConfig
        L8_3 = L8_3.project_details
        L8_3 = L8_3.jack_coord
        L8_3 = L8_3.y
        L9_3 = L4_2.projectConfig
        L9_3 = L9_3.project_details
        L9_3 = L9_3.jack_coord
        L9_3 = L9_3.z
        L10_3 = L4_2.projectConfig
        L10_3 = L10_3.project_details
        L10_3 = L10_3.jack_coord
        L10_3 = L10_3.w
        L11_3 = false
        L12_3 = false
        L5_3 = L5_3(L6_3, L7_3, L8_3, L9_3, L10_3, L11_3, L12_3)
        L4_2.vehicle = L5_3
        while true do
          L5_3 = DoesEntityExist
          L6_3 = L4_2.vehicle
          L5_3 = L5_3(L6_3)
          if L5_3 then
            break
          end
          L5_3 = Wait
          L6_3 = 100
          L5_3(L6_3)
        end
        L5_3 = L0_1.debug
        if L5_3 then
          L5_3 = print
          L6_3 = "[^2INFO^7] Local vehicle created. %s"
          L7_3 = L6_3
          L6_3 = L6_3.format
          L8_3 = L4_2.vehicle
          L6_3, L7_3, L8_3, L9_3, L10_3, L11_3, L12_3, L13_3, L14_3, L15_3, L16_3, L17_3, L18_3, L19_3, L20_3, L21_3, L22_3, L23_3, L24_3, L25_3, L26_3, L27_3, L28_3, L29_3 = L6_3(L7_3, L8_3)
          L5_3(L6_3, L7_3, L8_3, L9_3, L10_3, L11_3, L12_3, L13_3, L14_3, L15_3, L16_3, L17_3, L18_3, L19_3, L20_3, L21_3, L22_3, L23_3, L24_3, L25_3, L26_3, L27_3, L28_3, L29_3)
        end
        L5_3 = SetEntityCoordsNoOffset
        L6_3 = L4_2.vehicle
        L7_3 = L4_2.projectConfig
        L7_3 = L7_3.project_details
        L7_3 = L7_3.jack_coord
        L7_3 = L7_3.x
        L8_3 = L4_2.projectConfig
        L8_3 = L8_3.project_details
        L8_3 = L8_3.jack_coord
        L8_3 = L8_3.y
        L9_3 = L4_2.projectConfig
        L9_3 = L9_3.project_details
        L9_3 = L9_3.jack_coord
        L9_3 = L9_3.z
        L10_3 = true
        L11_3 = false
        L12_3 = false
        L5_3(L6_3, L7_3, L8_3, L9_3, L10_3, L11_3, L12_3)
        L5_3 = FreezeEntityPosition
        L6_3 = L4_2.vehicle
        L7_3 = true
        L5_3(L6_3, L7_3)
        L5_3 = SetVehicleDoorsLocked
        L6_3 = L4_2.vehicle
        L7_3 = 2
        L5_3(L6_3, L7_3)
        L5_3 = SetEntityInvincible
        L6_3 = L4_2.vehicle
        L7_3 = true
        L5_3(L6_3, L7_3)
        L5_3 = RequestCollisionAtCoord
        L6_3 = L4_2.projectConfig
        L6_3 = L6_3.project_details
        L6_3 = L6_3.jack_coord
        L5_3(L6_3)
        while true do
          L5_3 = HasCollisionLoadedAroundEntity
          L6_3 = L4_2.vehicle
          L5_3 = L5_3(L6_3)
          if L5_3 then
            break
          end
          L5_3 = Wait
          L6_3 = 0
          L5_3(L6_3)
        end
        L5_3 = pairs
        L6_3 = L4_2.projectConfig
        L6_3 = L6_3.project_details
        L6_3 = L6_3.tyre_positions
        L5_3, L6_3, L7_3, L8_3 = L5_3(L6_3)
        for L9_3, L10_3 in L5_3, L6_3, L7_3, L8_3 do
          L11_3 = GetWorldPositionOfEntityBone
          L12_3 = L4_2.vehicle
          L13_3 = L10_3.bone
          L11_3 = L11_3(L12_3, L13_3)
          L12_3 = L4_2.tyres
          L12_3 = L12_3[L9_3]
          L13_3 = L12_3.itsFixed
          if not L13_3 then
            L13_3 = BreakOffVehicleWheel
            L14_3 = L4_2.vehicle
            L15_3 = L12_3.index
            L16_3 = false
            L17_3 = true
            L18_3 = true
            L19_3 = false
            L13_3(L14_3, L15_3, L16_3, L17_3, L18_3, L19_3)
            L13_3 = A3_2
            if L13_3 then
              L13_3 = L10_3.target
              L13_3 = L13_3.coords
              L11_3 = L11_3 + L13_3
              L13_3 = AddBoxZone
              L14_3 = "%s_index:%s"
              L15_3 = L14_3
              L14_3 = L14_3.format
              L16_3 = L9_3
              L17_3 = L12_3.index
              L14_3 = L14_3(L15_3, L16_3, L17_3)
              L15_3 = L11_3
              L16_3 = L10_3.target
              L16_3 = L16_3.radius
              L16_3 = L16_3 + 0.5
              L17_3 = 2.5
              L18_3 = L0_1.debug
              L19_3 = {}
              L20_3 = {}
              L21_3 = Lang
              L22_3 = "tyre_mount"
              L21_3 = L21_3(L22_3)
              L20_3.label = L21_3
              L20_3.icon = "fa-solid fa-screwdriver-wrench"
              function L21_3()
                local L0_4, L1_4, L2_4, L3_4, L4_4, L5_4
                L0_4 = L12_3.isBusy
                if not L0_4 then
                  L0_4 = L12_3.itsFixed
                  if not L0_4 then
                    goto lbl_19
                  end
                end
                L0_4 = Config
                L0_4 = L0_4.Notification
                L1_4 = Lang
                L2_4 = "job"
                L1_4 = L1_4(L2_4)
                L2_4 = Lang
                L3_4 = "tyre_not_available"
                L2_4 = L2_4(L3_4)
                L3_4 = "error"
                L4_4 = 5000
                do return L0_4(L1_4, L2_4, L3_4, L4_4) end
                ::lbl_19::
                L0_4 = DoesPlayerHaveItem
                L1_4 = L4_2.projectConfig
                L1_4 = L1_4.vehicle_parts_store
                L1_4 = L1_4.parts
                L1_4 = L1_4.tyre
                L1_4 = L1_4.item_name
                L0_4 = L0_4(L1_4)
                if not L0_4 then
                  L0_4 = Config
                  L0_4 = L0_4.Notification
                  L1_4 = Lang
                  L2_4 = "job"
                  L1_4 = L1_4(L2_4)
                  L2_4 = Lang
                  L3_4 = "no_tyre"
                  L2_4 = L2_4(L3_4)
                  L3_4 = "error"
                  L4_4 = 5000
                  return L0_4(L1_4, L2_4, L3_4, L4_4)
                end
                L0_4 = L4_2.projectType
                L0_4 = L0_4.type
                if "player" == L0_4 then
                  L0_4 = L4_2
                  L1_4 = L0_4
                  L0_4 = L0_4.changeWheelBusyState
                  L2_4 = L9_3
                  L3_4 = true
                  L0_4(L1_4, L2_4, L3_4)
                else
                  L0_4 = TriggerServerEvent
                  L1_4 = "wais:projectcar:group:changeWheel:busyState"
                  L2_4 = L4_2.id
                  L3_4 = A1_2
                  L4_4 = L9_3
                  L5_4 = true
                  L0_4(L1_4, L2_4, L3_4, L4_4, L5_4)
                end
                L0_4 = L1_1
                L1_4 = L4_2.projectConfig
                L1_4 = L1_4.project_details
                L1_4 = L1_4.tyre_animations
                L1_4 = L1_4.time
                L2_4 = Lang
                L3_4 = "tyre_mounting"
                L2_4 = L2_4(L3_4)
                L3_4 = {}
                L4_4 = L4_2.projectConfig
                L4_4 = L4_4.project_details
                L4_4 = L4_4.tyre_animations
                L4_4 = L4_4.animDict
                L3_4.dict = L4_4
                L4_4 = L4_2.projectConfig
                L4_4 = L4_4.project_details
                L4_4 = L4_4.tyre_animations
                L4_4 = L4_4.animName
                L3_4.clip = L4_4
                L4_4 = L4_2.projectConfig
                L4_4 = L4_4.project_details
                L4_4 = L4_4.tyre_animations
                L4_4 = L4_4.flag
                L3_4.flag = L4_4
                L4_4 = {}
                L0_4 = L0_4(L1_4, L2_4, L3_4, L4_4)
                if L0_4 then
                  L0_4 = L11_3
                  L1_4 = L10_3.pedOffset
                  L0_4 = L0_4 + L1_4
                  L1_4 = SetEntityCoords
                  L2_4 = PlayerPedId
                  L2_4 = L2_4()
                  L3_4 = L0_4.x
                  L4_4 = L0_4.y
                  L5_4 = L0_4.z
                  L1_4(L2_4, L3_4, L4_4, L5_4)
                  L1_4 = screwMinigame
                  function L2_4(A0_5)
                    local L1_5, L2_5, L3_5, L4_5, L5_5, L6_5
                    if A0_5 then
                      L1_5 = TriggerServerEvent
                      L2_5 = "wais:projectcar:changeWheel:fixState"
                      L3_5 = L4_2.id
                      L4_5 = A1_2
                      L5_5 = L9_3
                      L6_5 = true
                      L1_5(L2_5, L3_5, L4_5, L5_5, L6_5)
                      L1_5 = Config
                      L1_5 = L1_5.Notification
                      L2_5 = Lang
                      L3_5 = "job"
                      L2_5 = L2_5(L3_5)
                      L3_5 = Lang
                      L4_5 = "tyre_mounting_success"
                      L3_5 = L3_5(L4_5)
                      L4_5 = "success"
                      L5_5 = 5000
                      L1_5(L2_5, L3_5, L4_5, L5_5)
                    else
                      L1_5 = Config
                      L1_5 = L1_5.Notification
                      L2_5 = Lang
                      L3_5 = "job"
                      L2_5 = L2_5(L3_5)
                      L3_5 = Lang
                      L4_5 = "tyre_mounting_failed"
                      L3_5 = L3_5(L4_5)
                      L4_5 = "error"
                      L5_5 = 5000
                      L1_5(L2_5, L3_5, L4_5, L5_5)
                      L1_5 = L4_2.projectType
                      L1_5 = L1_5.type
                      if "player" == L1_5 then
                        L1_5 = L4_2
                        L2_5 = L1_5
                        L1_5 = L1_5.changeWheelBusyState
                        L3_5 = L9_3
                        L4_5 = false
                        L1_5(L2_5, L3_5, L4_5)
                      else
                        L1_5 = TriggerServerEvent
                        L2_5 = "wais:projectcar:group:changeWheel:busyState"
                        L3_5 = L4_2.id
                        L4_5 = A1_2
                        L5_5 = L9_3
                        L6_5 = false
                        L1_5(L2_5, L3_5, L4_5, L5_5, L6_5)
                      end
                    end
                    L1_5 = TriggerServerEvent
                    L2_5 = "wais:deleteItem"
                    L3_5 = L4_2.projectConfig
                    L3_5 = L3_5.vehicle_parts_store
                    L3_5 = L3_5.parts
                    L3_5 = L3_5.tyre
                    L3_5 = L3_5.item_name
                    L4_5 = 1
                    L1_5(L2_5, L3_5, L4_5)
                  end
                  L1_4(L2_4)
                else
                  L0_4 = Config
                  L0_4 = L0_4.Notification
                  L1_4 = Lang
                  L2_4 = "job"
                  L1_4 = L1_4(L2_4)
                  L2_4 = Lang
                  L3_4 = "tyre_mounting_failed"
                  L2_4 = L2_4(L3_4)
                  L3_4 = "error"
                  L4_4 = 5000
                  L0_4(L1_4, L2_4, L3_4, L4_4)
                  L0_4 = L4_2.projectType
                  L0_4 = L0_4.type
                  if "player" == L0_4 then
                    L0_4 = L4_2
                    L1_4 = L0_4
                    L0_4 = L0_4.changeWheelBusyState
                    L2_4 = L9_3
                    L3_4 = false
                    L0_4(L1_4, L2_4, L3_4)
                  else
                    L0_4 = TriggerServerEvent
                    L1_4 = "wais:projectcar:group:changeWheel:busyState"
                    L2_4 = L4_2.id
                    L3_4 = A1_2
                    L4_4 = L9_3
                    L5_4 = false
                    L0_4(L1_4, L2_4, L3_4, L4_4, L5_4)
                  end
                end
              end
              L20_3.action = L21_3
              L19_3[1] = L20_3
              L13_3 = L13_3(L14_3, L15_3, L16_3, L17_3, L18_3, L19_3)
              L14_3 = L4_2.boxZones
              L15_3 = L4_2.boxZones
              L15_3 = #L15_3
              L15_3 = L15_3 + 1
              L14_3[L15_3] = L13_3
            end
          end
          L13_3 = CreateObject
          L14_3 = L3_3
          L15_3 = L11_3.x
          L16_3 = L11_3.y
          L17_3 = L11_3.z
          L18_3 = false
          L19_3 = false
          L20_3 = false
          L13_3 = L13_3(L14_3, L15_3, L16_3, L17_3, L18_3, L19_3, L20_3)
          L14_3 = SetEntityAsMissionEntity
          L15_3 = L13_3
          L16_3 = false
          L17_3 = false
          L14_3(L15_3, L16_3, L17_3)
          L14_3 = SetEntityCollision
          L15_3 = L13_3
          L16_3 = false
          L17_3 = false
          L14_3(L15_3, L16_3, L17_3)
          L14_3 = FreezeEntityPosition
          L15_3 = L13_3
          L16_3 = true
          L14_3(L15_3, L16_3)
          L14_3 = SetEntityHeading
          L15_3 = L13_3
          L16_3 = L4_2.projectConfig
          L16_3 = L16_3.project_details
          L16_3 = L16_3.jack_coord
          L16_3 = L16_3.w
          L14_3(L15_3, L16_3)
          L14_3 = AttachEntityToEntity
          L15_3 = L13_3
          L16_3 = L4_2.vehicle
          L17_3 = L10_3.bone
          L18_3 = L10_3.jackOffset
          L18_3 = L18_3.x
          L19_3 = L10_3.jackOffset
          L19_3 = L19_3.y
          L20_3 = L10_3.jackOffset
          L20_3 = L20_3.z
          L21_3 = 0.0
          L22_3 = 0.0
          L23_3 = 0.0
          L24_3 = false
          L25_3 = true
          L26_3 = true
          L27_3 = false
          L28_3 = 2
          L29_3 = true
          L14_3(L15_3, L16_3, L17_3, L18_3, L19_3, L20_3, L21_3, L22_3, L23_3, L24_3, L25_3, L26_3, L27_3, L28_3, L29_3)
          L14_3 = L4_2.jacks
          L15_3 = L4_2.jacks
          L15_3 = #L15_3
          L15_3 = L15_3 + 1
          L14_3[L15_3] = L13_3
        end
        L5_3 = pairs
        L6_3 = L4_2.projectConfig
        L6_3 = L6_3.project_details
        L6_3 = L6_3.door_positions
        L5_3, L6_3, L7_3, L8_3 = L5_3(L6_3)
        for L9_3, L10_3 in L5_3, L6_3, L7_3, L8_3 do
          L11_3 = L10_3.itsFixed
          if not L11_3 then
            L11_3 = SetVehicleDoorBroken
            L12_3 = L4_2.vehicle
            L13_3 = L10_3.door_index
            L14_3 = true
            L11_3(L12_3, L13_3, L14_3)
            L11_3 = A3_2
            if L11_3 then
              L11_3 = L4_2.doors
              L11_3 = L11_3[L9_3]
              L12_3 = GetWorldPositionOfEntityBone
              L13_3 = L4_2.vehicle
              L14_3 = 0
              L12_3 = L12_3(L13_3, L14_3)
              L13_3 = L10_3.target
              L13_3 = L13_3.coords
              L12_3 = L12_3 + L13_3
              L13_3 = AddBoxZone
              L14_3 = "%s_index:%s"
              L15_3 = L14_3
              L14_3 = L14_3.format
              L16_3 = L9_3
              L17_3 = L11_3.index
              L14_3 = L14_3(L15_3, L16_3, L17_3)
              L15_3 = L12_3
              L16_3 = L10_3.target
              L16_3 = L16_3.radius
              L16_3 = L16_3 + 0.5
              L17_3 = 2.5
              L18_3 = L0_1.debug
              L19_3 = {}
              L20_3 = {}
              L21_3 = Lang
              L22_3 = "door_mount"
              L21_3 = L21_3(L22_3)
              L20_3.label = L21_3
              L20_3.icon = "fa-solid fa-screwdriver-wrench"
              function L21_3()
                local L0_4, L1_4, L2_4, L3_4, L4_4, L5_4, L6_4
                L0_4 = L11_3.isBusy
                if not L0_4 then
                  L0_4 = L11_3.itsFixed
                  if not L0_4 then
                    goto lbl_19
                  end
                end
                L0_4 = Config
                L0_4 = L0_4.Notification
                L1_4 = Lang
                L2_4 = "job"
                L1_4 = L1_4(L2_4)
                L2_4 = Lang
                L3_4 = "door_not_available"
                L2_4 = L2_4(L3_4)
                L3_4 = "error"
                L4_4 = 5000
                do return L0_4(L1_4, L2_4, L3_4, L4_4) end
                ::lbl_19::
                L0_4 = DoesPlayerHaveItem
                L1_4 = L4_2.projectConfig
                L1_4 = L1_4.vehicle_parts_store
                L1_4 = L1_4.parts
                L1_4 = L1_4.door
                L1_4 = L1_4.item_name
                L0_4 = L0_4(L1_4)
                if not L0_4 then
                  L0_4 = Config
                  L0_4 = L0_4.Notification
                  L1_4 = Lang
                  L2_4 = "job"
                  L1_4 = L1_4(L2_4)
                  L2_4 = Lang
                  L3_4 = "no_door"
                  L2_4 = L2_4(L3_4)
                  L3_4 = "error"
                  L4_4 = 5000
                  return L0_4(L1_4, L2_4, L3_4, L4_4)
                end
                L0_4 = L4_2.projectType
                L0_4 = L0_4.type
                if "player" == L0_4 then
                  L0_4 = L4_2
                  L1_4 = L0_4
                  L0_4 = L0_4.changeDoorBusyState
                  L2_4 = L9_3
                  L3_4 = true
                  L0_4(L1_4, L2_4, L3_4)
                else
                  L0_4 = TriggerServerEvent
                  L1_4 = "wais:projectcar:group:changeDoor:busyState"
                  L2_4 = L4_2.id
                  L3_4 = A1_2
                  L4_4 = L9_3
                  L5_4 = true
                  L0_4(L1_4, L2_4, L3_4, L4_4, L5_4)
                end
                L0_4 = skillCheck
                L1_4 = "project_car"
                L0_4 = L0_4(L1_4)
                if L0_4 then
                  L0_4 = L1_1
                  L1_4 = L4_2.projectConfig
                  L1_4 = L1_4.project_details
                  L1_4 = L1_4.door_animations
                  L1_4 = L1_4.time
                  L2_4 = Lang
                  L3_4 = "door_mounting"
                  L2_4 = L2_4(L3_4)
                  L3_4 = {}
                  L4_4 = L4_2.projectConfig
                  L4_4 = L4_4.project_details
                  L4_4 = L4_4.door_animations
                  L4_4 = L4_4.animDict
                  L3_4.dict = L4_4
                  L4_4 = L4_2.projectConfig
                  L4_4 = L4_4.project_details
                  L4_4 = L4_4.door_animations
                  L4_4 = L4_4.animName
                  L3_4.clip = L4_4
                  L4_4 = L4_2.projectConfig
                  L4_4 = L4_4.project_details
                  L4_4 = L4_4.door_animations
                  L4_4 = L4_4.flag
                  L3_4.flag = L4_4
                  L4_4 = {}
                  L0_4 = L0_4(L1_4, L2_4, L3_4, L4_4)
                  if L0_4 then
                    L0_4 = L12_3
                    L1_4 = L10_3.pedOffset
                    L0_4 = L0_4 + L1_4
                    L1_4 = SetEntityCoords
                    L2_4 = PlayerPedId
                    L2_4 = L2_4()
                    L3_4 = L0_4.x
                    L4_4 = L0_4.y
                    L5_4 = L0_4.z
                    L5_4 = L5_4 - 0.95
                    L1_4(L2_4, L3_4, L4_4, L5_4)
                    L1_4 = TriggerServerEvent
                    L2_4 = "wais:projectcar:changeDoor:fixState"
                    L3_4 = L4_2.id
                    L4_4 = A1_2
                    L5_4 = L9_3
                    L6_4 = true
                    L1_4(L2_4, L3_4, L4_4, L5_4, L6_4)
                    L1_4 = TriggerServerEvent
                    L2_4 = "wais:deleteItem"
                    L3_4 = L4_2.projectConfig
                    L3_4 = L3_4.vehicle_parts_store
                    L3_4 = L3_4.parts
                    L3_4 = L3_4.door
                    L3_4 = L3_4.item_name
                    L4_4 = 1
                    L1_4(L2_4, L3_4, L4_4)
                    L1_4 = Config
                    L1_4 = L1_4.Notification
                    L2_4 = Lang
                    L3_4 = "job"
                    L2_4 = L2_4(L3_4)
                    L3_4 = Lang
                    L4_4 = "door_mounting_success"
                    L3_4 = L3_4(L4_4)
                    L4_4 = "success"
                    L5_4 = 5000
                    L1_4(L2_4, L3_4, L4_4, L5_4)
                  else
                    L0_4 = Config
                    L0_4 = L0_4.Notification
                    L1_4 = Lang
                    L2_4 = "job"
                    L1_4 = L1_4(L2_4)
                    L2_4 = Lang
                    L3_4 = "door_mounting_failed"
                    L2_4 = L2_4(L3_4)
                    L3_4 = "error"
                    L4_4 = 5000
                    L0_4(L1_4, L2_4, L3_4, L4_4)
                    L0_4 = L4_2.projectType
                    L0_4 = L0_4.type
                    if "player" == L0_4 then
                      L0_4 = L4_2
                      L1_4 = L0_4
                      L0_4 = L0_4.changeDoorBusyState
                      L2_4 = L9_3
                      L3_4 = false
                      L0_4(L1_4, L2_4, L3_4)
                    else
                      L0_4 = TriggerServerEvent
                      L1_4 = "wais:projectcar:group:changeDoor:busyState"
                      L2_4 = L4_2.id
                      L3_4 = A1_2
                      L4_4 = L9_3
                      L5_4 = false
                      L0_4(L1_4, L2_4, L3_4, L4_4, L5_4)
                    end
                  end
                else
                  L0_4 = Config
                  L0_4 = L0_4.Notification
                  L1_4 = Lang
                  L2_4 = "job"
                  L1_4 = L1_4(L2_4)
                  L2_4 = Lang
                  L3_4 = "door_mounting_failed"
                  L2_4 = L2_4(L3_4)
                  L3_4 = "error"
                  L4_4 = 5000
                  L0_4(L1_4, L2_4, L3_4, L4_4)
                  L0_4 = L4_2.projectType
                  L0_4 = L0_4.type
                  if "player" == L0_4 then
                    L0_4 = L4_2
                    L1_4 = L0_4
                    L0_4 = L0_4.changeDoorBusyState
                    L2_4 = L9_3
                    L3_4 = false
                    L0_4(L1_4, L2_4, L3_4)
                  else
                    L0_4 = TriggerServerEvent
                    L1_4 = "wais:projectcar:group:changeDoor:busyState"
                    L2_4 = L4_2.id
                    L3_4 = A1_2
                    L4_4 = L9_3
                    L5_4 = false
                    L0_4(L1_4, L2_4, L3_4, L4_4, L5_4)
                  end
                end
              end
              L20_3.action = L21_3
              L19_3[1] = L20_3
              L13_3 = L13_3(L14_3, L15_3, L16_3, L17_3, L18_3, L19_3)
              L14_3 = L4_2.boxZones
              L15_3 = L4_2.boxZones
              L15_3 = #L15_3
              L15_3 = L15_3 + 1
              L14_3[L15_3] = L13_3
            end
          end
        end
        break
      end
      L3_3 = Wait
      L4_3 = 1000
      L3_3(L4_3)
    end
  end
  L5_2(L6_2)
  if A3_2 then
    L4_2.cam = nil
    L4_2.projectShowed = false
    L5_2 = JobTimer
    L6_2 = L5_2
    L5_2 = L5_2.New
    L7_2 = L4_2.projectConfig
    L7_2 = L7_2.project_details
    L7_2 = L7_2.mission_time
    L8_2 = L4_2.projectConfig
    L8_2 = L8_2.project_details
    L8_2 = L8_2.extra_time
    L9_2 = false
    L5_2 = L5_2(L6_2, L7_2, L8_2, L9_2)
    L4_2.timer = L5_2
    L5_2 = L4_2.projectType
    L5_2 = L5_2.type
    if "player" == L5_2 then
      L4_2.allTyresFixed = false
      L4_2.allDoorsFixed = false
    end
    L5_2 = AddBlipForCoord
    L6_2 = L4_2.projectConfig
    L6_2 = L6_2.project_details
    L6_2 = L6_2.craft_coord
    L6_2 = L6_2.x
    L7_2 = L4_2.projectConfig
    L7_2 = L7_2.project_details
    L7_2 = L7_2.craft_coord
    L7_2 = L7_2.y
    L8_2 = L4_2.projectConfig
    L8_2 = L8_2.project_details
    L8_2 = L8_2.craft_coord
    L8_2 = L8_2.z
    L5_2 = L5_2(L6_2, L7_2, L8_2)
    L4_2.blip = L5_2
    L5_2 = SetBlipSprite
    L6_2 = L4_2.blip
    L7_2 = L4_2.projectConfig
    L7_2 = L7_2.project_details
    L7_2 = L7_2.blips
    L7_2 = L7_2.sprite
    L5_2(L6_2, L7_2)
    L5_2 = SetBlipDisplay
    L6_2 = L4_2.blip
    L7_2 = 4
    L5_2(L6_2, L7_2)
    L5_2 = SetBlipScale
    L6_2 = L4_2.blip
    L7_2 = L4_2.projectConfig
    L7_2 = L7_2.project_details
    L7_2 = L7_2.blips
    L7_2 = L7_2.scale
    L5_2(L6_2, L7_2)
    L5_2 = SetBlipColour
    L6_2 = L4_2.blip
    L7_2 = L4_2.projectConfig
    L7_2 = L7_2.project_details
    L7_2 = L7_2.blips
    L7_2 = L7_2.color
    L5_2(L6_2, L7_2)
    L5_2 = BeginTextCommandSetBlipName
    L6_2 = "STRING"
    L5_2(L6_2)
    L5_2 = AddTextComponentString
    L6_2 = L4_2.projectConfig
    L6_2 = L6_2.project_details
    L6_2 = L6_2.blips
    L6_2 = L6_2.label
    L5_2(L6_2)
    L5_2 = EndTextCommandSetBlipName
    L6_2 = L4_2.blip
    L5_2(L6_2)
    L5_2 = blips
    L6_2 = blips
    L6_2 = #L6_2
    L6_2 = L6_2 + 1
    L7_2 = L4_2.blip
    L5_2[L6_2] = L7_2
    L5_2 = AddBlipForCoord
    L6_2 = L4_2.projectConfig
    L6_2 = L6_2.vehicle_parts_store
    L6_2 = L6_2.npc
    L6_2 = L6_2.coords
    L6_2 = L6_2.x
    L7_2 = L4_2.projectConfig
    L7_2 = L7_2.vehicle_parts_store
    L7_2 = L7_2.npc
    L7_2 = L7_2.coords
    L7_2 = L7_2.y
    L8_2 = L4_2.projectConfig
    L8_2 = L8_2.vehicle_parts_store
    L8_2 = L8_2.npc
    L8_2 = L8_2.coords
    L8_2 = L8_2.z
    L5_2 = L5_2(L6_2, L7_2, L8_2)
    L4_2.sellerBlips = L5_2
    L5_2 = SetBlipSprite
    L6_2 = L4_2.sellerBlips
    L7_2 = L4_2.projectConfig
    L7_2 = L7_2.vehicle_parts_store
    L7_2 = L7_2.npc
    L7_2 = L7_2.blip
    L7_2 = L7_2.sprite
    L5_2(L6_2, L7_2)
    L5_2 = SetBlipDisplay
    L6_2 = L4_2.sellerBlips
    L7_2 = 4
    L5_2(L6_2, L7_2)
    L5_2 = SetBlipScale
    L6_2 = L4_2.sellerBlips
    L7_2 = L4_2.projectConfig
    L7_2 = L7_2.vehicle_parts_store
    L7_2 = L7_2.npc
    L7_2 = L7_2.blip
    L7_2 = L7_2.scale
    L5_2(L6_2, L7_2)
    L5_2 = SetBlipColour
    L6_2 = L4_2.sellerBlips
    L7_2 = L4_2.projectConfig
    L7_2 = L7_2.vehicle_parts_store
    L7_2 = L7_2.npc
    L7_2 = L7_2.blip
    L7_2 = L7_2.color
    L5_2(L6_2, L7_2)
    L5_2 = BeginTextCommandSetBlipName
    L6_2 = "STRING"
    L5_2(L6_2)
    L5_2 = AddTextComponentString
    L6_2 = L4_2.projectConfig
    L6_2 = L6_2.vehicle_parts_store
    L6_2 = L6_2.npc
    L6_2 = L6_2.blip
    L6_2 = L6_2.label
    L5_2(L6_2)
    L5_2 = EndTextCommandSetBlipName
    L6_2 = L4_2.sellerBlips
    L5_2(L6_2)
    L5_2 = blips
    L6_2 = blips
    L6_2 = #L6_2
    L6_2 = L6_2 + 1
    L7_2 = L4_2.sellerBlips
    L5_2[L6_2] = L7_2
    L5_2 = SetNewWaypoint
    L6_2 = L4_2.projectConfig
    L6_2 = L6_2.vehicle_parts_store
    L6_2 = L6_2.npc
    L6_2 = L6_2.coords
    L6_2 = L6_2.x
    L7_2 = L4_2.projectConfig
    L7_2 = L7_2.vehicle_parts_store
    L7_2 = L7_2.npc
    L7_2 = L7_2.coords
    L7_2 = L7_2.y
    L5_2(L6_2, L7_2)
    L5_2 = Config
    L5_2 = L5_2.Notification
    L6_2 = Lang
    L7_2 = "job"
    L6_2 = L6_2(L7_2)
    L7_2 = Lang
    L8_2 = "project_started_marked"
    L7_2 = L7_2(L8_2)
    L8_2 = "inform"
    L9_2 = 5000
    L5_2(L6_2, L7_2, L8_2, L9_2)
    L5_2 = SetEntityCoords
    L6_2 = ped
    L7_2 = L4_2.projectConfig
    L7_2 = L7_2.project_details
    L7_2 = L7_2.craft_coord
    L7_2 = L7_2.x
    L8_2 = L4_2.projectConfig
    L8_2 = L8_2.project_details
    L8_2 = L8_2.craft_coord
    L8_2 = L8_2.y
    L9_2 = L4_2.projectConfig
    L9_2 = L9_2.project_details
    L9_2 = L9_2.craft_coord
    L9_2 = L9_2.z
    L5_2(L6_2, L7_2, L8_2, L9_2)
    L5_2 = CreateThread
    function L6_2()
      local L0_3, L1_3, L2_3, L3_3, L4_3
      while true do
        L0_3 = L4_2
        if not L0_3 then
          break
        end
        L0_3 = L4_2.deleted
        if L0_3 then
          break
        end
        L0_3 = L4_2.projectShowed
        if L0_3 then
          break
        end
        L0_3 = PlayerPedId
        L0_3 = L0_3()
        L1_3 = GetEntityCoords
        L2_3 = L0_3
        L1_3 = L1_3(L2_3)
        L2_3 = GetVehiclePedIsIn
        L3_3 = L0_3
        L4_3 = false
        L2_3 = L2_3(L3_3, L4_3)
        if 0 == L2_3 then
          L2_3 = isDead
          if not L2_3 then
            L2_3 = DoScreenFadeOut
            L3_3 = 250
            L2_3(L3_3)
            while true do
              L2_3 = IsScreenFadedOut
              L2_3 = L2_3()
              if L2_3 then
                break
              end
              L2_3 = Wait
              L3_3 = 1000
              L2_3(L3_3)
            end
            L2_3 = L4_2
            L3_3 = L2_3
            L2_3 = L2_3.showCinematic
            L2_3(L3_3)
          end
        end
        L2_3 = Wait
        L3_3 = 1000
        L2_3(L3_3)
      end
    end
    L5_2(L6_2)
    L5_2 = CreateThread
    function L6_2()
      local L0_3, L1_3, L2_3, L3_3, L4_3, L5_3
      while true do
        L0_3 = L4_2
        if not L0_3 then
          break
        end
        L0_3 = L4_2.deleted
        if L0_3 then
          break
        end
        L0_3 = L4_2.seller
        if nil ~= L0_3 then
          break
        end
        L0_3 = PlayerPedId
        L0_3 = L0_3()
        L1_3 = GetEntityCoords
        L2_3 = L0_3
        L1_3 = L1_3(L2_3)
        L2_3 = vec3
        L3_3 = L4_2.projectConfig
        L3_3 = L3_3.vehicle_parts_store
        L3_3 = L3_3.npc
        L3_3 = L3_3.coords
        L3_3 = L3_3.x
        L4_3 = L4_2.projectConfig
        L4_3 = L4_3.vehicle_parts_store
        L4_3 = L4_3.npc
        L4_3 = L4_3.coords
        L4_3 = L4_3.y
        L5_3 = L4_2.projectConfig
        L5_3 = L5_3.vehicle_parts_store
        L5_3 = L5_3.npc
        L5_3 = L5_3.coords
        L5_3 = L5_3.z
        L2_3 = L2_3(L3_3, L4_3, L5_3)
        L2_3 = L2_3 - L1_3
        L2_3 = #L2_3
        L3_3 = 424
        if L2_3 <= L3_3 then
          L3_3 = L4_2
          L4_3 = L3_3
          L3_3 = L3_3.createSeller
          L3_3(L4_3)
          break
        end
        L3_3 = Wait
        L4_3 = 1000
        L3_3(L4_3)
      end
    end
    L5_2(L6_2)
    L5_2 = CreateThread
    function L6_2()
      local L0_3, L1_3, L2_3, L3_3, L4_3, L5_3, L6_3, L7_3, L8_3, L9_3, L10_3, L11_3, L12_3, L13_3, L14_3, L15_3, L16_3, L17_3, L18_3, L19_3, L20_3, L21_3, L22_3, L23_3, L24_3, L25_3, L26_3, L27_3, L28_3, L29_3, L30_3, L31_3, L32_3, L33_3, L34_3, L35_3, L36_3
      while true do
        L0_3 = L4_2
        if not L0_3 then
          break
        end
        L0_3 = L4_2.deleted
        if L0_3 then
          break
        end
        L0_3 = 1000
        L1_3 = PlayerPedId
        L1_3 = L1_3()
        L2_3 = GetEntityCoords
        L3_3 = L1_3
        L2_3 = L2_3(L3_3)
        L3_3 = vec3
        L4_3 = L4_2.projectConfig
        L4_3 = L4_3.project_details
        L4_3 = L4_3.craft_coord
        L4_3 = L4_3.x
        L5_3 = L4_2.projectConfig
        L5_3 = L5_3.project_details
        L5_3 = L5_3.craft_coord
        L5_3 = L5_3.y
        L6_3 = L4_2.projectConfig
        L6_3 = L6_3.project_details
        L6_3 = L6_3.craft_coord
        L6_3 = L6_3.z
        L3_3 = L3_3(L4_3, L5_3, L6_3)
        L3_3 = L3_3 - L2_3
        L3_3 = #L3_3
        L4_3 = L4_2.vehicle
        if nil ~= L4_3 and L3_3 <= 50.0 then
          L4_3 = L4_2.cam
          if nil == L4_3 then
            L0_3 = 5
            L4_3 = pairs
            L5_3 = L4_2.projectConfig
            L5_3 = L5_3.project_details
            L5_3 = L5_3.tyre_positions
            L4_3, L5_3, L6_3, L7_3 = L4_3(L5_3)
            for L8_3, L9_3 in L4_3, L5_3, L6_3, L7_3 do
              L10_3 = L4_2.tyres
              L10_3 = L10_3[L8_3]
              L11_3 = GetWorldPositionOfEntityBone
              L12_3 = L4_2.vehicle
              L13_3 = L9_3.bone
              L11_3 = L11_3(L12_3, L13_3)
              L12_3 = L9_3.target
              L12_3 = L12_3.coords
              L11_3 = L11_3 + L12_3
              L12_3 = L10_3.isBusy
              if not L12_3 then
                L12_3 = L10_3.isFixed
                if not L12_3 then
                  L0_3 = 0
                  L12_3 = DrawMarker
                  L13_3 = 2
                  L14_3 = L11_3.x
                  L15_3 = L11_3.y
                  L16_3 = L11_3.z
                  L16_3 = L16_3 + 0.5
                  L17_3 = 0
                  L18_3 = 0
                  L19_3 = 0
                  L20_3 = 0
                  L21_3 = -180
                  L22_3 = 0
                  L23_3 = 0.25
                  L24_3 = 0.25
                  L25_3 = 0.25
                  L26_3 = 98
                  L27_3 = 255
                  L28_3 = 114
                  L29_3 = 200
                  L30_3 = true
                  L31_3 = false
                  L32_3 = 2
                  L33_3 = false
                  L34_3 = false
                  L35_3 = false
                  L36_3 = false
                  L12_3(L13_3, L14_3, L15_3, L16_3, L17_3, L18_3, L19_3, L20_3, L21_3, L22_3, L23_3, L24_3, L25_3, L26_3, L27_3, L28_3, L29_3, L30_3, L31_3, L32_3, L33_3, L34_3, L35_3, L36_3)
                end
              end
            end
            L4_3 = pairs
            L5_3 = L4_2.projectConfig
            L5_3 = L5_3.project_details
            L5_3 = L5_3.door_positions
            L4_3, L5_3, L6_3, L7_3 = L4_3(L5_3)
            for L8_3, L9_3 in L4_3, L5_3, L6_3, L7_3 do
              L10_3 = L4_2.doors
              L10_3 = L10_3[L8_3]
              L11_3 = GetWorldPositionOfEntityBone
              L12_3 = L4_2.vehicle
              L13_3 = 0
              L11_3 = L11_3(L12_3, L13_3)
              L12_3 = L9_3.target
              L12_3 = L12_3.coords
              L11_3 = L11_3 + L12_3
              L12_3 = L10_3.isBusy
              if not L12_3 then
                L12_3 = L10_3.isFixed
                if not L12_3 then
                  L0_3 = 0
                  L12_3 = DrawMarker
                  L13_3 = 2
                  L14_3 = L11_3.x
                  L15_3 = L11_3.y
                  L16_3 = L11_3.z
                  L16_3 = L16_3 + 0.5
                  L17_3 = 0
                  L18_3 = 0
                  L19_3 = 0
                  L20_3 = 0
                  L21_3 = -180
                  L22_3 = 0
                  L23_3 = 0.25
                  L24_3 = 0.25
                  L25_3 = 0.25
                  L26_3 = 98
                  L27_3 = 255
                  L28_3 = 114
                  L29_3 = 200
                  L30_3 = true
                  L31_3 = false
                  L32_3 = 2
                  L33_3 = false
                  L34_3 = false
                  L35_3 = false
                  L36_3 = false
                  L12_3(L13_3, L14_3, L15_3, L16_3, L17_3, L18_3, L19_3, L20_3, L21_3, L22_3, L23_3, L24_3, L25_3, L26_3, L27_3, L28_3, L29_3, L30_3, L31_3, L32_3, L33_3, L34_3, L35_3, L36_3)
                end
              end
            end
          end
        end
        L4_3 = Wait
        L5_3 = L0_3
        L4_3(L5_3)
      end
    end
    L5_2(L6_2)
  end
  return L4_2
end
L2_1.newProject = L3_1