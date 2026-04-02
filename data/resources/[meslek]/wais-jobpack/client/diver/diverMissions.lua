local L0_1, L1_1, L2_1
L0_1 = {}
Diver = L0_1
L0_1 = Diver
L1_1 = Diver
L0_1.__index = L1_1
L0_1 = Config
L0_1 = L0_1.Jobs
L0_1 = L0_1.diver
L1_1 = Diver
function L2_1(A0_2)
  local L1_2, L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2
  A0_2.deleted = true
  L1_2 = pairs
  L2_2 = A0_2.props
  L1_2, L2_2, L3_2, L4_2 = L1_2(L2_2)
  for L5_2, L6_2 in L1_2, L2_2, L3_2, L4_2 do
    L7_2 = L6_2.zone
    if L7_2 then
      L7_2 = L6_2.zone
      L8_2 = L7_2
      L7_2 = L7_2.remove
      L7_2(L8_2)
    end
    L7_2 = DeleteEntity
    L8_2 = L6_2.prop
    L7_2(L8_2)
    L7_2 = L6_2.blip
    if nil ~= L7_2 then
      L7_2 = RemoveBlip
      L8_2 = L6_2.blip
      L7_2(L8_2)
    end
  end
  L1_2 = A0_2.timer
  if L1_2 then
    L1_2 = A0_2.timer
    L2_2 = L1_2
    L1_2 = L1_2.delete
    L1_2(L2_2)
  end
  L1_2 = A0_2.canControl
  if L1_2 then
    L1_2 = PlayerPedId
    L1_2 = L1_2()
    L2_2 = L0_1.teleport_when_mission_finished
    if L2_2 then
      L2_2 = SetEntityCoords
      L3_2 = L1_2
      L4_2 = L0_1.menu
      L4_2 = L4_2.job_menu
      L4_2 = L4_2.x
      L5_2 = L0_1.menu
      L5_2 = L5_2.job_menu
      L5_2 = L5_2.y
      L6_2 = L0_1.menu
      L6_2 = L6_2.job_menu
      L6_2 = L6_2.z
      L2_2(L3_2, L4_2, L5_2, L6_2)
    else
      L2_2 = SetTimeout
      L3_2 = L0_1.oxygen_finish
      function L4_2()
        local L0_3, L1_3, L2_3, L3_3
        L0_3 = SetPedConfigFlag
        L1_3 = L1_2
        L2_3 = 3
        L3_3 = true
        L0_3(L1_3, L2_3, L3_3)
      end
      L2_2(L3_2, L4_2)
    end
  end
  A0_2 = nil
end
L1_1.Delete = L2_1
L1_1 = Diver
function L2_1(A0_2, A1_2, A2_2)
  local L3_2
  L3_2 = A0_2.progress
  L3_2 = L3_2[A1_2]
  L3_2.isBusy = A2_2
end
L1_1.changeIndexBusy = L2_1
L1_1 = Diver
function L2_1(A0_2, A1_2, A2_2)
  local L3_2
  L3_2 = A0_2.progress
  L3_2 = L3_2[A1_2]
  L3_2.collected = A2_2
end
L1_1.setCollected = L2_1
L1_1 = Diver
function L2_1(A0_2, A1_2)
  local L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2
  L2_2 = A0_2.props
  L2_2 = L2_2[A1_2]
  if L2_2 then
    L2_2 = A0_2.props
    L2_2 = L2_2[A1_2]
    L2_2 = L2_2.zone
    L3_2 = L2_2
    L2_2 = L2_2.remove
    L2_2(L3_2)
    L2_2 = A0_2.progress
    L2_2 = L2_2[A1_2]
    L2_2.collected = true
    L2_2 = DeleteEntity
    L3_2 = A0_2.props
    L3_2 = L3_2[A1_2]
    L3_2 = L3_2.prop
    L2_2(L3_2)
    L2_2 = A0_2.props
    L2_2 = L2_2[A1_2]
    L2_2 = L2_2.blip
    if nil ~= L2_2 then
      L2_2 = RemoveBlip
      L3_2 = A0_2.props
      L3_2 = L3_2[A1_2]
      L3_2 = L3_2.blip
      L2_2(L3_2)
    end
    L2_2 = A0_2.props
    L2_2[A1_2] = nil
    L2_2 = A0_2.canControl
    if L2_2 then
      L2_2 = 0
      L3_2 = pairs
      L4_2 = A0_2.progress
      L3_2, L4_2, L5_2, L6_2 = L3_2(L4_2)
      for L7_2, L8_2 in L3_2, L4_2, L5_2, L6_2 do
        L9_2 = L8_2.collected
        if not L9_2 then
          L2_2 = L2_2 + 1
        end
      end
      L3_2 = Config
      L3_2 = L3_2.Notification
      L4_2 = Lang
      L5_2 = "job"
      L4_2 = L4_2(L5_2)
      L5_2 = Lang
      L6_2 = "diver_remain"
      L7_2 = L2_2
      L5_2 = L5_2(L6_2, L7_2)
      L6_2 = "inform"
      L7_2 = 5000
      L3_2(L4_2, L5_2, L6_2, L7_2)
      L3_2 = A0_2.missionOwner
      L3_2 = L3_2.type
      if "player" == L3_2 and 0 == L2_2 then
        L3_2 = calcuteDeductedMoney
        L4_2 = A0_2.timer
        L4_2 = L4_2.extraTimeEnabled
        L5_2 = A0_2.config
        L5_2 = L5_2.timer
        L5_2 = L5_2.mission_time
        L6_2 = A0_2.timer
        L7_2 = L6_2
        L6_2 = L6_2.getDuration
        L6_2 = L6_2(L7_2)
        L7_2 = A0_2.config
        L7_2 = L7_2.timer
        L7_2 = L7_2.deducted_per_min
        L3_2 = L3_2(L4_2, L5_2, L6_2, L7_2)
        L4_2 = TriggerServerEvent
        L5_2 = "wais:diver:mission:finishedSelf"
        L6_2 = A0_2.index
        L7_2 = L3_2
        L4_2(L5_2, L6_2, L7_2)
      end
    end
  end
end
L1_1.deleteProp = L2_1
L1_1 = Diver
function L2_1(A0_2, A1_2, A2_2, A3_2)
  local L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2
  L4_2 = setmetatable
  L5_2 = {}
  L6_2 = Diver
  L4_2 = L4_2(L5_2, L6_2)
  L5_2 = lib
  L5_2 = L5_2.string
  L5_2 = L5_2.random
  L6_2 = "aaaaaa"
  L5_2 = L5_2(L6_2)
  L4_2.id = L5_2
  L4_2.index = A1_2
  L5_2 = L0_1.mission_list
  L5_2 = L5_2[A1_2]
  L4_2.config = L5_2
  L4_2.canControl = A2_2
  L4_2.missionOwner = A3_2
  L5_2 = {}
  L4_2.props = L5_2
  L5_2 = L4_2.config
  L6_2 = L4_2.config
  L6_2 = L6_2.coords
  L6_2 = #L6_2
  L5_2 = L5_2[L6_2]
  L6_2 = {}
  L4_2.progress = L6_2
  L4_2.mustColledted = L5_2
  L5_2 = false
  L4_2.propsCreated = false
  L4_2.deleted = L5_2
  if A2_2 then
    L5_2 = JobTimer
    L6_2 = L5_2
    L5_2 = L5_2.New
    L7_2 = L4_2.config
    L7_2 = L7_2.timer
    L7_2 = L7_2.mission_time
    L8_2 = L4_2.config
    L8_2 = L8_2.timer
    L8_2 = L8_2.extra_time
    L9_2 = false
    L5_2 = L5_2(L6_2, L7_2, L8_2, L9_2)
    if L5_2 then
      goto lbl_48
    end
  end
  L5_2 = nil
  ::lbl_48::
  L4_2.timer = L5_2
  L5_2 = loadModel
  L6_2 = L4_2.config
  L6_2 = L6_2.model
  L5_2 = L5_2(L6_2)
  if not L5_2 then
    L6_2 = L4_2
    L5_2 = L4_2.Delete
    return L5_2(L6_2)
  end
  L5_2 = pairs
  L6_2 = L4_2.config
  L6_2 = L6_2.coords
  L5_2, L6_2, L7_2, L8_2 = L5_2(L6_2)
  for L9_2, L10_2 in L5_2, L6_2, L7_2, L8_2 do
    L11_2 = L4_2.progress
    L12_2 = {}
    L12_2.collected = false
    L12_2.isBusy = false
    L11_2[L9_2] = L12_2
  end
  L5_2 = CreateThread
  function L6_2()
    local L0_3, L1_3, L2_3, L3_3, L4_3, L5_3, L6_3, L7_3, L8_3, L9_3, L10_3, L11_3, L12_3, L13_3, L14_3, L15_3
    while true do
      L0_3 = L4_2.deleted
      if L0_3 then
        break
      end
      L0_3 = PlayerPedId
      L0_3 = L0_3()
      L1_3 = GetEntityCoords
      L2_3 = L0_3
      L1_3 = L1_3(L2_3)
      L2_3 = L4_2.config
      L2_3 = L2_3.area
      L2_3 = L1_3 - L2_3
      L2_3 = #L2_3
      L3_3 = 424
      if L2_3 <= L3_3 then
        L3_3 = L4_2.propsCreated
        if not L3_3 then
          L3_3 = pairs
          L4_3 = L4_2.config
          L4_3 = L4_3.coords
          L3_3, L4_3, L5_3, L6_3 = L3_3(L4_3)
          for L7_3, L8_3 in L3_3, L4_3, L5_3, L6_3 do
            L9_3 = L4_2.progress
            L9_3 = L9_3[L7_3]
            L9_3 = L9_3.collected
            if not L9_3 then
              L9_3 = L4_2.props
              L10_3 = L4_2
              L11_3 = L10_3
              L10_3 = L10_3.CreateProp
              L12_3 = L7_3
              L13_3 = joaat
              L14_3 = L4_2.config
              L14_3 = L14_3.model
              L13_3 = L13_3(L14_3)
              L14_3 = L8_3
              L15_3 = L4_2.canControl
              L10_3 = L10_3(L11_3, L12_3, L13_3, L14_3, L15_3)
              L9_3[L7_3] = L10_3
            end
          end
          L4_2.propsCreated = true
        end
      end
      L3_3 = Wait
      L4_3 = 1000
      L3_3(L4_3)
    end
  end
  L5_2(L6_2)
  return L4_2
end
L1_1.CreateMission = L2_1
L1_1 = Diver
function L2_1(A0_2, A1_2, A2_2, A3_2, A4_2)
  local L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2
  L5_2 = {}
  L6_2 = GetGroundZFor_3dCoord
  L7_2 = A3_2.x
  L8_2 = A3_2.y
  L9_2 = A3_2.z
  L10_2 = 0
  L6_2, L7_2 = L6_2(L7_2, L8_2, L9_2, L10_2)
  L8_2 = CreateObject
  L9_2 = A2_2
  L10_2 = A3_2
  L11_2 = false
  L12_2 = false
  L13_2 = false
  L8_2 = L8_2(L9_2, L10_2, L11_2, L12_2, L13_2)
  L5_2.prop = L8_2
  while true do
    L8_2 = DoesEntityExist
    L9_2 = L5_2.prop
    L8_2 = L8_2(L9_2)
    if L8_2 then
      break
    end
    L8_2 = Wait
    L9_2 = 10
    L8_2(L9_2)
  end
  L8_2 = FreezeEntityPosition
  L9_2 = L5_2.prop
  L10_2 = true
  L8_2(L9_2, L10_2)
  L8_2 = SetEntityInvincible
  L9_2 = L5_2.prop
  L10_2 = true
  L8_2(L9_2, L10_2)
  L8_2 = SetEntityCoordsNoOffset
  L9_2 = L5_2.prop
  L10_2 = A3_2.x
  L11_2 = A3_2.y
  L12_2 = L7_2 or L12_2
  if not L6_2 or not L7_2 then
    L12_2 = A3_2.z
  end
  L13_2 = false
  L14_2 = false
  L15_2 = false
  L8_2(L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2)
  L8_2 = PlaceObjectOnGroundProperly
  L9_2 = L5_2.prop
  L8_2(L9_2)
  L8_2 = A0_2.config
  L8_2 = L8_2.blip
  L8_2 = L8_2.show
  if L8_2 then
    L8_2 = AddBlipForEntity
    L9_2 = L5_2.prop
    L8_2 = L8_2(L9_2)
    L5_2.blip = L8_2
    L8_2 = SetBlipSprite
    L9_2 = L5_2.blip
    L10_2 = A0_2.config
    L10_2 = L10_2.blip
    L10_2 = L10_2.sprite
    L8_2(L9_2, L10_2)
    L8_2 = SetBlipColour
    L9_2 = L5_2.blip
    L10_2 = A0_2.config
    L10_2 = L10_2.blip
    L10_2 = L10_2.color
    L8_2(L9_2, L10_2)
    L8_2 = SetBlipScale
    L9_2 = L5_2.blip
    L10_2 = A0_2.config
    L10_2 = L10_2.blip
    L10_2 = L10_2.scale
    L8_2(L9_2, L10_2)
    L8_2 = BeginTextCommandSetBlipName
    L9_2 = "STRING"
    L8_2(L9_2)
    L8_2 = AddTextComponentString
    L9_2 = A0_2.config
    L9_2 = L9_2.blip
    L9_2 = L9_2.label
    L8_2(L9_2)
    L8_2 = EndTextCommandSetBlipName
    L9_2 = L5_2.blip
    L8_2(L9_2)
  end
  L5_2.zone = nil
  L5_2.index = A1_2
  L5_2.model = A2_2
  L5_2.collected = false
  if not A4_2 then
    return L5_2
  end
  L8_2 = GetEntityCoords
  L9_2 = L5_2.prop
  L8_2 = L8_2(L9_2)
  L8_2 = L8_2.z
  L9_2 = lib
  L9_2 = L9_2.zones
  L9_2 = L9_2.sphere
  L10_2 = {}
  L11_2 = vec3
  L12_2 = A3_2.x
  L13_2 = A3_2.y
  L14_2 = L7_2 or L14_2
  if not L6_2 or not L7_2 then
    L14_2 = L8_2
  end
  L14_2 = L14_2 + 0.5
  L11_2 = L11_2(L12_2, L13_2, L14_2)
  L10_2.coords = L11_2
  L10_2.radius = 2.0
  L11_2 = L0_1.debug
  L10_2.debug = L11_2
  function L11_2()
    local L0_3, L1_3, L2_3, L3_3, L4_3, L5_3, L6_3, L7_3, L8_3, L9_3, L10_3
    L0_3 = PlayerPedId
    L0_3 = L0_3()
    L1_3 = GetEntityCoords
    L2_3 = L0_3
    L1_3 = L1_3(L2_3)
    L2_3 = vec3
    L3_3 = A3_2.x
    L4_3 = A3_2.y
    L5_3 = L6_2
    if L5_3 then
      L5_3 = L7_2
      if L5_3 then
        goto lbl_16
      end
    end
    L5_3 = L8_2
    ::lbl_16::
    L5_3 = L5_3 + 0.5
    L2_3 = L2_3(L3_3, L4_3, L5_3)
    L2_3 = L1_3 - L2_3
    L2_3 = #L2_3
    if L2_3 <= 2.0 then
      L3_3 = IsControlJustPressed
      L4_3 = 0
      L5_3 = 38
      L3_3 = L3_3(L4_3, L5_3)
      if L3_3 then
        L3_3 = IsPedInAnyVehicle
        L4_3 = L0_3
        L5_3 = false
        L3_3 = L3_3(L4_3, L5_3)
        if not L3_3 then
          L3_3 = A0_2.progress
          L4_3 = A1_2
          L3_3 = L3_3[L4_3]
          L3_3 = L3_3.isBusy
          if L3_3 then
            L3_3 = Config
            L3_3 = L3_3.Notification
            L4_3 = Lang
            L5_3 = "job"
            L4_3 = L4_3(L5_3)
            L5_3 = Lang
            L6_3 = "diver_collect_busy"
            L5_3 = L5_3(L6_3)
            L6_3 = "error"
            L7_3 = 5000
            return L3_3(L4_3, L5_3, L6_3, L7_3)
          end
          L3_3 = A0_2.missionOwner
          L3_3 = L3_3.type
          if "player" == L3_3 then
            L3_3 = A0_2.progress
            L4_3 = A1_2
            L3_3 = L3_3[L4_3]
            L3_3.isBusy = true
          else
            L3_3 = TriggerServerEvent
            L4_3 = "wais:diver:mission:setBusy"
            L5_3 = A0_2.missionOwner
            L5_3 = L5_3.groupId
            L6_3 = A0_2.id
            L7_3 = A1_2
            L8_3 = true
            L3_3(L4_3, L5_3, L6_3, L7_3, L8_3)
          end
          L3_3 = lib
          L3_3 = L3_3.progressBar
          L4_3 = {}
          L5_3 = A0_2.config
          L5_3 = L5_3.collecting_duration
          L4_3.duration = L5_3
          L5_3 = Lang
          L6_3 = "diver_collecting"
          L5_3 = L5_3(L6_3)
          L4_3.label = L5_3
          L4_3.canCancel = true
          L4_3.allowSwimming = true
          L5_3 = {}
          L5_3.car = true
          L5_3.move = true
          L5_3.combat = true
          L4_3.disable = L5_3
          L5_3 = {}
          L5_3.scenario = "world_human_gardener_plant"
          L4_3.anim = L5_3
          L5_3 = {}
          L6_3 = joaat
          L7_3 = "bkr_prop_coke_spatula_04"
          L6_3 = L6_3(L7_3)
          L5_3.model = L6_3
          L6_3 = vec3
          L7_3 = -0.005
          L8_3 = 0.0
          L9_3 = 0.0
          L6_3 = L6_3(L7_3, L8_3, L9_3)
          L5_3.pos = L6_3
          L6_3 = vec3
          L7_3 = 190.0
          L8_3 = 190.0
          L9_3 = -50.0
          L6_3 = L6_3(L7_3, L8_3, L9_3)
          L5_3.rot = L6_3
          L5_3.bone = 28422
          L4_3.prop = L5_3
          L3_3 = L3_3(L4_3)
          if L3_3 then
            L3_3 = A0_2.missionOwner
            L3_3 = L3_3.type
            if "player" == L3_3 then
              L3_3 = A0_2
              L4_3 = L3_3
              L3_3 = L3_3.deleteProp
              L5_3 = A1_2
              L3_3(L4_3, L5_3)
            else
              L3_3 = calcuteDeductedMoney
              L4_3 = A0_2.timer
              L4_3 = L4_3.extraTimeEnabled
              L5_3 = A0_2.config
              L5_3 = L5_3.timer
              L5_3 = L5_3.mission_time
              L6_3 = A0_2.timer
              L7_3 = L6_3
              L6_3 = L6_3.getDuration
              L6_3 = L6_3(L7_3)
              L7_3 = A0_2.config
              L7_3 = L7_3.timer
              L7_3 = L7_3.deducted_per_min
              L3_3 = L3_3(L4_3, L5_3, L6_3, L7_3)
              L4_3 = TriggerServerEvent
              L5_3 = "wais:diver:mission:deleteProp"
              L6_3 = A0_2.missionOwner
              L6_3 = L6_3.groupId
              L7_3 = A0_2.id
              L8_3 = A1_2
              L9_3 = A0_2.index
              L10_3 = L3_3
              L4_3(L5_3, L6_3, L7_3, L8_3, L9_3, L10_3)
            end
            L3_3 = lib
            L3_3 = L3_3.hideTextUI
            L3_3()
          else
            L3_3 = A0_2.missionOwner
            L3_3 = L3_3.type
            if "player" == L3_3 then
              L3_3 = A0_2.progress
              L4_3 = A1_2
              L3_3 = L3_3[L4_3]
              L3_3.isBusy = false
            else
              L3_3 = TriggerServerEvent
              L4_3 = "wais:diver:mission:setBusy"
              L5_3 = A0_2.missionOwner
              L5_3 = L5_3.groupId
              L6_3 = A0_2.id
              L7_3 = A1_2
              L8_3 = false
              L3_3(L4_3, L5_3, L6_3, L7_3, L8_3)
            end
          end
        end
      end
    end
  end
  L10_2.inside = L11_2
  function L11_2()
    local L0_3, L1_3, L2_3, L3_3
    L0_3 = lib
    L0_3 = L0_3.showTextUI
    L1_3 = Lang
    L2_3 = "diver_collect"
    L1_3 = L1_3(L2_3)
    L2_3 = {}
    L2_3.position = "left-center"
    L2_3.icon = "hands-holding"
    L3_3 = {}
    L3_3.color = "white"
    L2_3.style = L3_3
    L0_3(L1_3, L2_3)
  end
  L10_2.onEnter = L11_2
  function L11_2()
    local L0_3, L1_3
    L0_3 = lib
    L0_3 = L0_3.hideTextUI
    L0_3()
  end
  L10_2.onExit = L11_2
  L9_2 = L9_2(L10_2)
  L5_2.zone = L9_2
  L9_2 = CreateThread
  function L10_2()
    local L0_3, L1_3, L2_3, L3_3, L4_3, L5_3, L6_3, L7_3, L8_3, L9_3, L10_3, L11_3, L12_3, L13_3, L14_3, L15_3, L16_3, L17_3, L18_3, L19_3, L20_3, L21_3, L22_3, L23_3, L24_3, L25_3, L26_3, L27_3, L28_3, L29_3
    while true do
      L0_3 = L5_2.collected
      if L0_3 then
        break
      end
      L0_3 = 1000
      L1_3 = PlayerPedId
      L1_3 = L1_3()
      L2_3 = GetEntityCoords
      L3_3 = L1_3
      L2_3 = L2_3(L3_3)
      L3_3 = GetEntityCoords
      L4_3 = L5_2.prop
      L3_3 = L3_3(L4_3)
      L4_3 = L2_3 - L3_3
      L4_3 = #L4_3
      if L4_3 <= 50.0 then
        L0_3 = 1
        L5_3 = DrawMarker
        L6_3 = 2
        L7_3 = L3_3.x
        L8_3 = L3_3.y
        L9_3 = L3_3.z
        L9_3 = L9_3 + 0.5
        L10_3 = 0
        L11_3 = 0
        L12_3 = 0
        L13_3 = 0
        L14_3 = -180
        L15_3 = 0
        L16_3 = 0.5
        L17_3 = 0.5
        L18_3 = 0.5
        L19_3 = 98
        L20_3 = 255
        L21_3 = 114
        L22_3 = 200
        L23_3 = true
        L24_3 = false
        L25_3 = 2
        L26_3 = false
        L27_3 = false
        L28_3 = false
        L29_3 = false
        L5_3(L6_3, L7_3, L8_3, L9_3, L10_3, L11_3, L12_3, L13_3, L14_3, L15_3, L16_3, L17_3, L18_3, L19_3, L20_3, L21_3, L22_3, L23_3, L24_3, L25_3, L26_3, L27_3, L28_3, L29_3)
      end
      L5_3 = Wait
      L6_3 = L0_3
      L5_3(L6_3)
    end
  end
  L9_2(L10_2)
  return L5_2
end
L1_1.CreateProp = L2_1