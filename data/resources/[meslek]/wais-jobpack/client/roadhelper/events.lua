local L0_1, L1_1, L2_1, L3_1, L4_1
L0_1 = {}
RandomEvents = L0_1
L0_1 = RandomEvents
L1_1 = RandomEvents
L0_1.__index = L1_1
L0_1 = RandomEvents
L1_1 = {}
L0_1.Events = L1_1
L0_1 = Config
L0_1 = L0_1.Jobs
L0_1 = L0_1.roadhelper
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
function L2_1(A0_2, A1_2, A2_2)
  local L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2
  L3_2 = calcuteDeductedMoney
  L4_2 = A0_2.extraTimeEnabled
  L5_2 = L0_1.randomEvents
  L5_2 = L5_2.events
  L5_2 = L5_2[A1_2]
  L5_2 = L5_2.mission_time
  L6_2 = formatNumberToMin
  L8_2 = A0_2
  L7_2 = A0_2.getDuration
  L7_2, L8_2, L9_2 = L7_2(L8_2)
  L6_2 = L6_2(L7_2, L8_2, L9_2)
  L7_2 = L0_1.randomEvents
  L7_2 = L7_2.events
  L7_2 = L7_2[A1_2]
  L7_2 = L7_2.deducted_per_min
  L3_2 = L3_2(L4_2, L5_2, L6_2, L7_2)
  L4_2 = Config
  L4_2 = L4_2.JobSuccess
  L5_2 = CurrentJob
  L6_2 = A2_2 - L3_2
  L7_2 = nil
  L9_2 = A0_2
  L8_2 = A0_2.getDuration
  L8_2 = L8_2(L9_2)
  L9_2 = A0_2.extraTimeEnabled
  L4_2(L5_2, L6_2, L7_2, L8_2, L9_2)
  L4_2 = TriggerServerEvent
  L5_2 = "wais:giveRoadhelper:reward"
  L6_2 = CurrentJob
  L7_2 = A1_2
  L8_2 = L3_2
  L4_2(L5_2, L6_2, L7_2, L8_2)
  L4_2 = Config
  L4_2 = L4_2.Notification
  L5_2 = Lang
  L6_2 = "job"
  L5_2 = L5_2(L6_2)
  L6_2 = Lang
  L7_2 = "job_end"
  L6_2 = L6_2(L7_2)
  L7_2 = "success"
  L8_2 = 10000
  L4_2(L5_2, L6_2, L7_2, L8_2)
end
L3_1 = RandomEvents
function L4_1(A0_2)
  local L1_2, L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2
  L1_2 = A0_2.deleted
  if L1_2 then
    return
  end
  A0_2.warningAttempt = false
  A0_2.deleted = true
  L1_2 = TriggerServerEvent
  L2_2 = "wais:deleteProp:table"
  L3_2 = A0_2.props
  L1_2(L2_2, L3_2)
  L1_2 = pairs
  L2_2 = A0_2.props
  L1_2, L2_2, L3_2, L4_2 = L1_2(L2_2)
  for L5_2, L6_2 in L1_2, L2_2, L3_2, L4_2 do
    L7_2 = DoesEntityExist
    L8_2 = L6_2.entity
    L7_2 = L7_2(L8_2)
    if L7_2 then
      L7_2 = DeleteEntity
      L8_2 = L6_2.entity
      L7_2(L8_2)
    end
  end
  L1_2 = DoesEntityExist
  L2_2 = A0_2.car
  L1_2 = L1_2(L2_2)
  if L1_2 then
    L1_2 = DeleteEntity
    L2_2 = A0_2.car
    L1_2(L2_2)
  end
  L1_2 = DoesEntityExist
  L2_2 = A0_2.driver
  L1_2 = L1_2(L2_2)
  if L1_2 then
    L1_2 = DeleteEntity
    L2_2 = A0_2.driver
    L1_2(L2_2)
  end
  L1_2 = DoesBlipExist
  L2_2 = A0_2.blip
  L1_2 = L1_2(L2_2)
  if L1_2 then
    L1_2 = RemoveBlip
    L2_2 = A0_2.blip
    L1_2(L2_2)
  end
  L1_2 = A0_2.deliveryBlip
  if nil ~= L1_2 then
    L1_2 = RemoveBlip
    L2_2 = A0_2.deliveryBlip
    L1_2(L2_2)
  end
  L1_2 = pairs
  L2_2 = RandomEvents
  L2_2 = L2_2.Events
  L1_2, L2_2, L3_2, L4_2 = L1_2(L2_2)
  for L5_2, L6_2 in L1_2, L2_2, L3_2, L4_2 do
    L7_2 = L6_2.id
    L8_2 = A0_2.id
    if L7_2 == L8_2 then
      L7_2 = table
      L7_2 = L7_2.remove
      L8_2 = RandomEvents
      L8_2 = L8_2.Events
      L9_2 = L5_2
      L7_2(L8_2, L9_2)
      break
    end
  end
  L1_2 = RoadPoint
  if nil ~= L1_2 then
    L1_2 = RoadPoint
    L2_2 = L1_2
    L1_2 = L1_2.remove
    L1_2(L2_2)
    RoadPoint = nil
  end
  L1_2 = A0_2.timer
  if nil ~= L1_2 then
    L1_2 = A0_2.timer
    L2_2 = L1_2
    L1_2 = L1_2.delete
    L1_2(L2_2)
  end
  L1_2 = TriggerServerEvent
  L2_2 = "wais:setDefault:RoadState"
  L3_2 = RoadIndex
  L1_2(L2_2, L3_2)
  RoadIndex = nil
  RoadEvent = nil
  A0_2 = nil
end
L3_1.deleteSelf = L4_1
L3_1 = RandomEvents
function L4_1(A0_2)
  local L1_2, L2_2, L3_2
  L1_2 = Config
  L1_2 = L1_2.AbuseController
  L1_2 = L1_2.warning_count
  L2_2 = CreateThread
  function L3_2()
    local L0_3, L1_3, L2_3, L3_3, L4_3
    while true do
      L0_3 = A0_2
      if not L0_3 then
        break
      end
      L0_3 = A0_2.warningAttempt
      if not L0_3 then
        break
      end
      L0_3 = L1_2
      L0_3 = L0_3 - 1
      L1_2 = L0_3
      L0_3 = Config
      L0_3 = L0_3.Notification
      L1_3 = Lang
      L2_3 = "job"
      L1_3 = L1_3(L2_3)
      L2_3 = Lang
      L3_3 = "attach_car_to_towtruck"
      L2_3 = L2_3(L3_3)
      L3_3 = "warning"
      L4_3 = nil
      L0_3(L1_3, L2_3, L3_3, L4_3)
      L0_3 = L1_2
      if L0_3 <= 0 then
        L0_3 = A0_2
        L1_3 = L0_3
        L0_3 = L0_3.deleteSelf
        L0_3(L1_3)
        L0_3 = Config
        L0_3 = L0_3.Notification
        L1_3 = Lang
        L2_3 = "job"
        L1_3 = L1_3(L2_3)
        L2_3 = Lang
        L3_3 = "cancelled"
        L2_3 = L2_3(L3_3)
        L3_3 = "error"
        L4_3 = nil
        L0_3(L1_3, L2_3, L3_3, L4_3)
        break
      end
      L0_3 = Wait
      L1_3 = Config
      L1_3 = L1_3.AbuseController
      L1_3 = L1_3.controller
      L0_3(L1_3)
    end
  end
  L2_2(L3_2)
end
L3_1.warningAttemptF = L4_1
L3_1 = RandomEvents
function L4_1(A0_2, A1_2)
  local L2_2, L3_2, L4_2, L5_2, L6_2
  L2_2 = math
  L2_2 = L2_2.randomseed
  L3_2 = GetGameTimer
  L3_2, L4_2, L5_2, L6_2 = L3_2()
  L2_2(L3_2, L4_2, L5_2, L6_2)
  L2_2 = DeleteEntity
  L3_2 = A0_2.hiddedProp
  L2_2(L3_2)
  L2_2 = FreezeEntityPosition
  L3_2 = A0_2.car
  L4_2 = false
  L2_2(L3_2, L4_2)
  L2_2 = PlayPedAmbientSpeechNative
  L3_2 = A0_2.driver
  L4_2 = "GENERIC_THANKS"
  L5_2 = "SPEECH_PARAMS_STANDARD"
  L2_2(L3_2, L4_2, L5_2)
  L2_2 = Wait
  L3_2 = 750
  L2_2(L3_2)
  L2_2 = TaskVehicleDriveWander
  L3_2 = A0_2.driver
  L4_2 = A0_2.car
  L5_2 = 80.0
  L6_2 = 786603
  L2_2(L3_2, L4_2, L5_2, L6_2)
  L2_2 = StartVehicleHorn
  L3_2 = A0_2.car
  L4_2 = 100
  L5_2 = GetHashKey
  L6_2 = "HELDDOWN"
  L5_2 = L5_2(L6_2)
  L6_2 = false
  L2_2(L3_2, L4_2, L5_2, L6_2)
  L2_2 = L2_1
  L3_2 = A0_2.timer
  L4_2 = A1_2
  L5_2 = A0_2.roadConfig
  L5_2 = L5_2.reward
  L2_2(L3_2, L4_2, L5_2)
  L2_2 = math
  L2_2 = L2_2.random
  L3_2 = 3
  L4_2 = 7
  L2_2 = L2_2(L3_2, L4_2)
  L3_2 = SetTimeout
  L4_2 = L2_2 * 1000
  function L5_2()
    local L0_3, L1_3
    L0_3 = A0_2
    L1_3 = L0_3
    L0_3 = L0_3.deleteSelf
    L0_3(L1_3)
  end
  L3_2(L4_2, L5_2)
end
L3_1.TaskGoAndDeleteSelf = L4_1
L3_1 = RandomEvents
function L4_1(A0_2, A1_2)
  local L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2
  L2_2 = setmetatable
  L3_2 = {}
  L4_2 = RandomEvents
  L2_2 = L2_2(L3_2, L4_2)
  L3_2 = {}
  L4_2 = L0_1.randomEvents
  L4_2 = L4_2.events
  L4_2 = L4_2[A1_2]
  L2_2.roadConfig = L4_2
  L4_2 = lib
  L4_2 = L4_2.string
  L4_2 = L4_2.random
  L5_2 = "aaaaaa"
  L4_2 = L4_2(L5_2)
  L2_2.id = L4_2
  L2_2.car = nil
  L4_2 = {}
  L2_2.props = L4_2
  L2_2.driver = nil
  L2_2.deleted = false
  L4_2 = JobTimer
  L5_2 = L4_2
  L4_2 = L4_2.New
  L6_2 = L2_2.roadConfig
  L6_2 = L6_2.mission_time
  L7_2 = L2_2.roadConfig
  L7_2 = L7_2.extra_time
  L8_2 = false
  L4_2 = L4_2(L5_2, L6_2, L7_2, L8_2)
  L2_2.timer = L4_2
  L4_2 = AddBlipForCoord
  L5_2 = L2_2.roadConfig
  L5_2 = L5_2.car_stuff
  L5_2 = L5_2.coords
  L5_2 = L5_2.x
  L6_2 = L2_2.roadConfig
  L6_2 = L6_2.car_stuff
  L6_2 = L6_2.coords
  L6_2 = L6_2.y
  L7_2 = L2_2.roadConfig
  L7_2 = L7_2.car_stuff
  L7_2 = L7_2.coords
  L7_2 = L7_2.z
  L4_2 = L4_2(L5_2, L6_2, L7_2)
  L2_2.blip = L4_2
  L4_2 = SetBlipSprite
  L5_2 = L2_2.blip
  L6_2 = L2_2.roadConfig
  L6_2 = L6_2.blips
  L6_2 = L6_2.sprite
  L4_2(L5_2, L6_2)
  L4_2 = SetBlipScale
  L5_2 = L2_2.blip
  L6_2 = L2_2.roadConfig
  L6_2 = L6_2.blips
  L6_2 = L6_2.scale
  L4_2(L5_2, L6_2)
  L4_2 = SetBlipColour
  L5_2 = L2_2.blip
  L6_2 = L2_2.roadConfig
  L6_2 = L6_2.blips
  L6_2 = L6_2.color
  L4_2(L5_2, L6_2)
  L4_2 = SetBlipDisplay
  L5_2 = L2_2.blip
  L6_2 = 4
  L4_2(L5_2, L6_2)
  L4_2 = SetBlipAsShortRange
  L5_2 = L2_2.blip
  L6_2 = true
  L4_2(L5_2, L6_2)
  L4_2 = BeginTextCommandSetBlipName
  L5_2 = "STRING"
  L4_2(L5_2)
  L4_2 = AddTextComponentString
  L5_2 = L2_2.roadConfig
  L5_2 = L5_2.blips
  L5_2 = L5_2.label
  L4_2(L5_2)
  L4_2 = EndTextCommandSetBlipName
  L5_2 = L2_2.blip
  L4_2(L5_2)
  L4_2 = CreateThread
  function L5_2()
    local L0_3, L1_3, L2_3, L3_3, L4_3, L5_3, L6_3, L7_3, L8_3, L9_3, L10_3, L11_3, L12_3, L13_3, L14_3, L15_3, L16_3, L17_3, L18_3
    while true do
      L0_3 = L2_2
      if not L0_3 then
        break
      end
      L0_3 = L2_2.deleted
      if L0_3 then
        break
      end
      L0_3 = L2_2.car
      if nil ~= L0_3 then
        break
      end
      L0_3 = 1000
      L1_3 = PlayerPedId
      L1_3 = L1_3()
      L2_3 = GetEntityCoords
      L3_3 = L1_3
      L2_3 = L2_3(L3_3)
      L3_3 = vec3
      L4_3 = L2_2.roadConfig
      L4_3 = L4_3.car_stuff
      L4_3 = L4_3.coords
      L4_3 = L4_3.x
      L5_3 = L2_2.roadConfig
      L5_3 = L5_3.car_stuff
      L5_3 = L5_3.coords
      L5_3 = L5_3.y
      L6_3 = L2_2.roadConfig
      L6_3 = L6_3.car_stuff
      L6_3 = L6_3.coords
      L6_3 = L6_3.z
      L3_3 = L3_3(L4_3, L5_3, L6_3)
      L3_3 = L2_3 - L3_3
      L3_3 = #L3_3
      L4_3 = 424
      if L3_3 <= L4_3 then
        L4_3 = loadModel
        L5_3 = L2_2.roadConfig
        L5_3 = L5_3.car_stuff
        L5_3 = L5_3.model
        L4_3 = L4_3(L5_3)
        if not L4_3 then
          return
        end
        L4_3 = PedModels
        L5_3 = math
        L5_3 = L5_3.random
        L6_3 = 1
        L7_3 = PedModels
        L7_3 = #L7_3
        L5_3 = L5_3(L6_3, L7_3)
        L4_3 = L4_3[L5_3]
        L5_3 = GetGroundZFor_3dCoord
        L6_3 = L2_2.roadConfig
        L6_3 = L6_3.car_stuff
        L6_3 = L6_3.coords
        L6_3 = L6_3.x
        L7_3 = L2_2.roadConfig
        L7_3 = L7_3.car_stuff
        L7_3 = L7_3.coords
        L7_3 = L7_3.y
        L8_3 = L2_2.roadConfig
        L8_3 = L8_3.car_stuff
        L8_3 = L8_3.coords
        L8_3 = L8_3.z
        L9_3 = 0
        L5_3, L6_3 = L5_3(L6_3, L7_3, L8_3, L9_3)
        while not L5_3 do
          L7_3 = GetGroundZFor_3dCoord
          L8_3 = L2_2.roadConfig
          L8_3 = L8_3.car_stuff
          L8_3 = L8_3.coords
          L8_3 = L8_3.x
          L9_3 = L2_2.roadConfig
          L9_3 = L9_3.car_stuff
          L9_3 = L9_3.coords
          L9_3 = L9_3.y
          L10_3 = L2_2.roadConfig
          L10_3 = L10_3.car_stuff
          L10_3 = L10_3.coords
          L10_3 = L10_3.z
          L11_3 = 0
          L7_3, L8_3 = L7_3(L8_3, L9_3, L10_3, L11_3)
          L6_3 = L8_3
          L5_3 = L7_3
          L7_3 = Wait
          L8_3 = 250
          L7_3(L8_3)
        end
        L7_3 = CreateVehicle
        L8_3 = L2_2.roadConfig
        L8_3 = L8_3.car_stuff
        L8_3 = L8_3.model
        L9_3 = L2_2.roadConfig
        L9_3 = L9_3.car_stuff
        L9_3 = L9_3.coords
        L9_3 = L9_3.x
        L10_3 = L2_2.roadConfig
        L10_3 = L10_3.car_stuff
        L10_3 = L10_3.coords
        L10_3 = L10_3.y
        L11_3 = L6_3 or L11_3
        if not L5_3 or not L6_3 then
          L11_3 = L2_2.roadConfig
          L11_3 = L11_3.car_stuff
          L11_3 = L11_3.coords
          L11_3 = L11_3.z
        end
        L12_3 = L2_2.roadConfig
        L12_3 = L12_3.car_stuff
        L12_3 = L12_3.heading
        L13_3 = true
        L14_3 = false
        L7_3 = L7_3(L8_3, L9_3, L10_3, L11_3, L12_3, L13_3, L14_3)
        L2_2.car = L7_3
        while true do
          L7_3 = DoesEntityExist
          L8_3 = L2_2.car
          L7_3 = L7_3(L8_3)
          if L7_3 then
            break
          end
          L7_3 = Wait
          L8_3 = 10
          L7_3(L8_3)
        end
        L7_3 = SetVehicleDoorsLocked
        L8_3 = L2_2.car
        L9_3 = 2
        L7_3(L8_3, L9_3)
        L7_3 = SetVehicleEngineOn
        L8_3 = L2_2.car
        L9_3 = true
        L10_3 = true
        L11_3 = false
        L7_3(L8_3, L9_3, L10_3, L11_3)
        L7_3 = SetVehicleUndriveable
        L8_3 = L2_2.car
        L9_3 = true
        L7_3(L8_3, L9_3)
        L7_3 = RollDownWindows
        L8_3 = L2_2.car
        L7_3(L8_3)
        L7_3 = NetworkRequestControlOfEntity
        L8_3 = L2_2.car
        L7_3(L8_3)
        L7_3 = FreezeEntityPosition
        L8_3 = L2_2.car
        L9_3 = true
        L7_3(L8_3, L9_3)
        L7_3 = RequestCollisionAtCoord
        L8_3 = L2_2.roadConfig
        L8_3 = L8_3.car_stuff
        L8_3 = L8_3.coords
        L8_3 = L8_3.x
        L9_3 = L2_2.roadConfig
        L9_3 = L9_3.car_stuff
        L9_3 = L9_3.coords
        L9_3 = L9_3.y
        L10_3 = L2_2.roadConfig
        L10_3 = L10_3.car_stuff
        L10_3 = L10_3.coords
        L10_3 = L10_3.z
        L7_3(L8_3, L9_3, L10_3)
        while true do
          L7_3 = HasCollisionLoadedAroundEntity
          L8_3 = L2_2.car
          L7_3 = L7_3(L8_3)
          if L7_3 then
            break
          end
          L7_3 = Wait
          L8_3 = 0
          L7_3(L8_3)
        end
        while true do
          L7_3 = NetworkHasControlOfEntity
          L8_3 = L2_2.car
          L7_3 = L7_3(L8_3)
          if L7_3 then
            break
          end
          L7_3 = NetworkRequestControlOfEntity
          L8_3 = L2_2.car
          L7_3(L8_3)
          L7_3 = Wait
          L8_3 = 0
          L7_3(L8_3)
        end
        L7_3 = L2_2.roadConfig
        L7_3 = L7_3.type
        if "change_wheel" == L7_3 then
          L7_3 = joaat
          L8_3 = "prop_elecbox_02b"
          L7_3 = L7_3(L8_3)
          L8_3 = loadModel
          L9_3 = L7_3
          L8_3 = L8_3(L9_3)
          if not L8_3 then
            return
          end
          L8_3 = GetWorldPositionOfEntityBone
          L9_3 = L2_2.car
          L10_3 = L2_2.roadConfig
          L10_3 = L10_3.car_stuff
          L10_3 = L10_3.tyre_bone
          L8_3 = L8_3(L9_3, L10_3)
          L9_3 = CreateObject
          L10_3 = L7_3
          L11_3 = L8_3.x
          L12_3 = L8_3.y
          L12_3 = L12_3 - 0.75
          L13_3 = L8_3.z
          L13_3 = L13_3 - 1.85
          L14_3 = true
          L15_3 = false
          L16_3 = false
          L9_3 = L9_3(L10_3, L11_3, L12_3, L13_3, L14_3, L15_3, L16_3)
          L2_2.hiddedProp = L9_3
          L9_3 = FreezeEntityPosition
          L10_3 = L2_2.hiddedProp
          L11_3 = true
          L9_3(L10_3, L11_3)
          L9_3 = SetEntityCollision
          L10_3 = L2_2.hiddedProp
          L11_3 = false
          L12_3 = false
          L9_3(L10_3, L11_3, L12_3)
          L9_3 = SetEntityAlpha
          L10_3 = L2_2.hiddedProp
          L11_3 = 0
          L12_3 = false
          L9_3(L10_3, L11_3, L12_3)
          L9_3 = L2_2.props
          L10_3 = L2_2.props
          L10_3 = #L10_3
          L10_3 = L10_3 + 1
          L11_3 = {}
          L12_3 = L2_2.hiddedProp
          L11_3.entity = L12_3
          L12_3 = NetworkGetNetworkIdFromEntity
          L13_3 = L2_2.hiddedProp
          L12_3 = L12_3(L13_3)
          L11_3.id = L12_3
          L9_3[L10_3] = L11_3
        else
          L7_3 = L2_2.roadConfig
          L7_3 = L7_3.type
          if "towing" == L7_3 then
            L7_3 = SetVehicleBrake
            L8_3 = L2_2.car
            L9_3 = false
            L7_3(L8_3, L9_3)
            L7_3 = SetVehicleHandbrake
            L8_3 = L2_2.car
            L9_3 = false
            L7_3(L8_3, L9_3)
          end
        end
        L7_3 = L2_2.props
        L8_3 = L2_2.props
        L8_3 = #L8_3
        L8_3 = L8_3 + 1
        L9_3 = {}
        L10_3 = L2_2.car
        L9_3.entity = L10_3
        L10_3 = NetworkGetNetworkIdFromEntity
        L11_3 = L2_2.car
        L10_3 = L10_3(L11_3)
        L9_3.id = L10_3
        L7_3[L8_3] = L9_3
        L7_3 = L2_2.roadConfig
        L7_3 = L7_3.closestProps
        if nil ~= L7_3 then
          L7_3 = pairs
          L8_3 = L2_2.roadConfig
          L8_3 = L8_3.closestProps
          L7_3, L8_3, L9_3, L10_3 = L7_3(L8_3)
          for L11_3, L12_3 in L7_3, L8_3, L9_3, L10_3 do
            L13_3 = loadModel
            L14_3 = L12_3.model
            L13_3 = L13_3(L14_3)
            if not L13_3 then
              return
            end
            L13_3 = CreateObject
            L14_3 = L12_3.model
            L15_3 = L12_3.coords
            L16_3 = false
            L17_3 = false
            L18_3 = false
            L13_3 = L13_3(L14_3, L15_3, L16_3, L17_3, L18_3)
            L14_3 = PlaceObjectOnGroundProperly
            L15_3 = L13_3
            L14_3(L15_3)
            L14_3 = SetEntityInvincible
            L15_3 = L13_3
            L16_3 = true
            L14_3(L15_3, L16_3)
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
            L16_3 = L12_3.coords
            L16_3 = L16_3.w
            L14_3(L15_3, L16_3)
            L14_3 = L2_2.props
            L15_3 = L2_2.props
            L15_3 = #L15_3
            L15_3 = L15_3 + 1
            L16_3 = {}
            L16_3.entity = L13_3
            L17_3 = NetworkGetNetworkIdFromEntity
            L18_3 = L13_3
            L17_3 = L17_3(L18_3)
            L16_3.id = L17_3
            L14_3[L15_3] = L16_3
          end
        end
        L7_3 = L2_2.roadConfig
        L7_3 = L7_3.type
        if "towing" ~= L7_3 then
          L7_3 = loadModel
          L8_3 = L4_3
          L7_3 = L7_3(L8_3)
          if not L7_3 then
            return
          end
          L7_3 = CreatePedInsideVehicle
          L8_3 = L2_2.car
          L9_3 = 26
          L10_3 = L4_3
          L11_3 = -1
          L12_3 = true
          L13_3 = false
          L7_3 = L7_3(L8_3, L9_3, L10_3, L11_3, L12_3, L13_3)
          L2_2.driver = L7_3
          L7_3 = SetBlockingOfNonTemporaryEvents
          L8_3 = L2_2.driver
          L9_3 = true
          L7_3(L8_3, L9_3)
          L7_3 = SetPedCanBeKnockedOffVehicle
          L8_3 = L2_2.driver
          L9_3 = false
          L7_3(L8_3, L9_3)
          L7_3 = SetPedCanPlayAmbientAnims
          L8_3 = L2_2.driver
          L9_3 = true
          L7_3(L8_3, L9_3)
          L7_3 = SetEntityAsMissionEntity
          L8_3 = L2_2.driver
          L9_3 = true
          L10_3 = true
          L7_3(L8_3, L9_3, L10_3)
          L7_3 = SetPedCanBeDraggedOut
          L8_3 = L2_2.driver
          L9_3 = false
          L7_3(L8_3, L9_3)
          L7_3 = SetEntityInvincible
          L8_3 = L2_2.driver
          L9_3 = true
          L7_3(L8_3, L9_3)
          L7_3 = FreezeEntityPosition
          L8_3 = L2_2.driver
          L9_3 = true
          L7_3(L8_3, L9_3)
          L7_3 = L2_2.props
          L8_3 = L2_2.props
          L8_3 = #L8_3
          L8_3 = L8_3 + 1
          L9_3 = {}
          L10_3 = L2_2.driver
          L9_3.entity = L10_3
          L10_3 = NetworkGetNetworkIdFromEntity
          L11_3 = L2_2.driver
          L10_3 = L10_3(L11_3)
          L9_3.id = L10_3
          L7_3[L8_3] = L9_3
        end
        L7_3 = TriggerServerEvent
        L8_3 = "wais:addProp:table"
        L9_3 = L2_2.props
        L7_3(L8_3, L9_3)
      end
      L4_3 = Wait
      L5_3 = L0_3
      L4_3(L5_3)
    end
  end
  L4_2(L5_2)
  L4_2 = L2_2.roadConfig
  L4_2 = L4_2.type
  if "fuel_help" == L4_2 then
    L2_2.playerNearFuelTank = false
    L2_2.fuelFilled = false
    L4_2 = SetNewWaypoint
    L5_2 = L2_2.roadConfig
    L5_2 = L5_2.car_stuff
    L5_2 = L5_2.coords
    L5_2 = L5_2.x
    L6_2 = L2_2.roadConfig
    L6_2 = L6_2.car_stuff
    L6_2 = L6_2.coords
    L6_2 = L6_2.y
    L4_2(L5_2, L6_2)
    L4_2 = Config
    L4_2 = L4_2.Notification
    L5_2 = Lang
    L6_2 = "job"
    L5_2 = L5_2(L6_2)
    L6_2 = Lang
    L7_2 = "car_point_marked"
    L6_2 = L6_2(L7_2)
    L7_2 = "inform"
    L8_2 = nil
    L4_2(L5_2, L6_2, L7_2, L8_2)
    while true do
      L4_2 = DoesEntityExist
      L5_2 = L2_2.car
      L4_2 = L4_2(L5_2)
      if L4_2 then
        break
      end
      L4_2 = Wait
      L5_2 = 0
      L4_2(L5_2)
    end
    L4_2 = #L3_2
    L4_2 = L4_2 + 1
    L5_2 = {}
    L5_2.icon = "fa-solid fa-gas-pump"
    L6_2 = Lang
    L7_2 = "jerry_can"
    L6_2 = L6_2(L7_2)
    L5_2.label = L6_2
    function L6_2()
      local L0_3, L1_3, L2_3, L3_3, L4_3
      L0_3 = L2_2.playerNearFuelTank
      if not L0_3 then
        L0_3 = Config
        L0_3 = L0_3.Notification
        L1_3 = Lang
        L2_3 = "job"
        L1_3 = L1_3(L2_3)
        L2_3 = Lang
        L3_3 = "not_near_fuel"
        L2_3 = L2_3(L3_3)
        L3_3 = "error"
        L4_3 = nil
        return L0_3(L1_3, L2_3, L3_3, L4_3)
      end
      L0_3 = JerryAttached
      if not L0_3 then
        L0_3 = Config
        L0_3 = L0_3.Notification
        L1_3 = Lang
        L2_3 = "job"
        L1_3 = L1_3(L2_3)
        L2_3 = Lang
        L3_3 = "no_jerry_can"
        L2_3 = L2_3(L3_3)
        L3_3 = "error"
        L4_3 = nil
        return L0_3(L1_3, L2_3, L3_3, L4_3)
      end
      L0_3 = L1_1
      L1_3 = L2_2.roadConfig
      L1_3 = L1_3.progress
      L1_3 = L1_3.time
      L2_3 = Lang
      L3_3 = "filling_tank"
      L2_3 = L2_3(L3_3)
      L3_3 = {}
      L4_3 = L2_2.roadConfig
      L4_3 = L4_3.progress
      L4_3 = L4_3.animDict
      L3_3.dict = L4_3
      L4_3 = L2_2.roadConfig
      L4_3 = L4_3.progress
      L4_3 = L4_3.animName
      L3_3.clip = L4_3
      L4_3 = nil
      L0_3 = L0_3(L1_3, L2_3, L3_3, L4_3)
      if L0_3 then
        L2_2.fuelFilled = true
        L0_3 = L2_2
        L1_3 = L0_3
        L0_3 = L0_3.TaskGoAndDeleteSelf
        L2_3 = A1_2
        L0_3(L1_3, L2_3)
      else
        L0_3 = Config
        L0_3 = L0_3.Notification
        L1_3 = Lang
        L2_3 = "job"
        L1_3 = L1_3(L2_3)
        L2_3 = Lang
        L3_3 = "cancelled_progress"
        L2_3 = L2_3(L3_3)
        L3_3 = "error"
        L4_3 = nil
        return L0_3(L1_3, L2_3, L3_3, L4_3)
      end
    end
    L5_2.action = L6_2
    L3_2[L4_2] = L5_2
    L4_2 = CreateThread
    function L5_2()
      local L0_3, L1_3, L2_3, L3_3, L4_3, L5_3, L6_3, L7_3, L8_3, L9_3, L10_3, L11_3, L12_3, L13_3, L14_3, L15_3, L16_3, L17_3, L18_3, L19_3, L20_3, L21_3, L22_3, L23_3, L24_3, L25_3, L26_3, L27_3, L28_3, L29_3, L30_3
      while true do
        L0_3 = L2_2
        if not L0_3 then
          break
        end
        L0_3 = L2_2.deleted
        if L0_3 then
          break
        end
        L0_3 = DoesEntityExist
        L1_3 = L2_2.car
        L0_3 = L0_3(L1_3)
        if not L0_3 then
          break
        end
        L0_3 = L2_2.fuelFilled
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
        L4_3 = L2_2.car
        L3_3 = L3_3(L4_3)
        L4_3 = L2_3 - L3_3
        L4_3 = #L4_3
        if L4_3 <= 25.0 then
          L0_3 = 5
          L5_3 = GetWorldPositionOfEntityBone
          L6_3 = L2_2.car
          L7_3 = L2_2.roadConfig
          L7_3 = L7_3.car_stuff
          L7_3 = L7_3.fuel_bone
          L5_3 = L5_3(L6_3, L7_3)
          L6_3 = DrawMarker
          L7_3 = 1
          L8_3 = L5_3.x
          L8_3 = L8_3 - 0.15
          L9_3 = L5_3.y
          L9_3 = L9_3 + 0.15
          L10_3 = L5_3.z
          L10_3 = L10_3 - 0.95
          L11_3 = 0
          L12_3 = 0
          L13_3 = 0
          L14_3 = 0
          L15_3 = 0
          L16_3 = 0
          L17_3 = 1.0
          L18_3 = 1.0
          L19_3 = 1.0
          L20_3 = 255
          L21_3 = 255
          L22_3 = 0
          L23_3 = 200
          L24_3 = false
          L25_3 = false
          L26_3 = 2
          L27_3 = false
          L28_3 = false
          L29_3 = false
          L30_3 = false
          L6_3(L7_3, L8_3, L9_3, L10_3, L11_3, L12_3, L13_3, L14_3, L15_3, L16_3, L17_3, L18_3, L19_3, L20_3, L21_3, L22_3, L23_3, L24_3, L25_3, L26_3, L27_3, L28_3, L29_3, L30_3)
          L6_3 = L2_3 - L5_3
          L6_3 = #L6_3
          L7_3 = 1.5
          if L6_3 <= L7_3 then
            L2_2.playerNearFuelTank = true
          else
            L2_2.playerNearFuelTank = false
          end
        end
        L5_3 = Wait
        L6_3 = L0_3
        L5_3(L6_3)
      end
    end
    L4_2(L5_2)
  else
    L4_2 = L2_2.roadConfig
    L4_2 = L4_2.type
    if "change_wheel" == L4_2 then
      L2_2.wheelChanged = false
      L2_2.playerNearWheel = false
      L2_2.jackAttachedToCar = false
      L2_2.wheelDeleted = false
      L2_2.boneCoords = nil
      L4_2 = SetNewWaypoint
      L5_2 = L2_2.roadConfig
      L5_2 = L5_2.car_stuff
      L5_2 = L5_2.coords
      L5_2 = L5_2.x
      L6_2 = L2_2.roadConfig
      L6_2 = L6_2.car_stuff
      L6_2 = L6_2.coords
      L6_2 = L6_2.y
      L4_2(L5_2, L6_2)
      L4_2 = Config
      L4_2 = L4_2.Notification
      L5_2 = Lang
      L6_2 = "job"
      L5_2 = L5_2(L6_2)
      L6_2 = Lang
      L7_2 = "car_point_marked"
      L6_2 = L6_2(L7_2)
      L7_2 = "inform"
      L8_2 = nil
      L4_2(L5_2, L6_2, L7_2, L8_2)
      while true do
        L4_2 = DoesEntityExist
        L5_2 = L2_2.car
        L4_2 = L4_2(L5_2)
        if L4_2 then
          break
        end
        L4_2 = Wait
        L5_2 = 0
        L4_2(L5_2)
      end
      L4_2 = {}
      L5_2 = {}
      L5_2.icon = "fa-solid fa-angles-up"
      L6_2 = Lang
      L7_2 = "lift_vehicle"
      L6_2 = L6_2(L7_2)
      L5_2.label = L6_2
      function L6_2()
        local L0_3, L1_3, L2_3, L3_3, L4_3, L5_3, L6_3, L7_3, L8_3, L9_3, L10_3, L11_3, L12_3, L13_3, L14_3, L15_3
        L0_3 = L2_2.playerNearWheel
        if not L0_3 then
          L0_3 = Config
          L0_3 = L0_3.Notification
          L1_3 = Lang
          L2_3 = "job"
          L1_3 = L1_3(L2_3)
          L2_3 = Lang
          L3_3 = "not_near_wheel"
          L2_3 = L2_3(L3_3)
          L3_3 = "error"
          L4_3 = nil
          return L0_3(L1_3, L2_3, L3_3, L4_3)
        end
        L0_3 = JackAttached
        if not L0_3 then
          L0_3 = Config
          L0_3 = L0_3.Notification
          L1_3 = Lang
          L2_3 = "job"
          L1_3 = L1_3(L2_3)
          L2_3 = Lang
          L3_3 = "no_carjack_can"
          L2_3 = L2_3(L3_3)
          L3_3 = "error"
          L4_3 = nil
          return L0_3(L1_3, L2_3, L3_3, L4_3)
        end
        L0_3 = FreezeEntityPosition
        L1_3 = L2_2.car
        L2_3 = false
        L0_3(L1_3, L2_3)
        JackAttached = false
        L0_3 = ClearPedTasks
        L1_3 = PlayerPedId
        L1_3, L2_3, L3_3, L4_3, L5_3, L6_3, L7_3, L8_3, L9_3, L10_3, L11_3, L12_3, L13_3, L14_3, L15_3 = L1_3()
        L0_3(L1_3, L2_3, L3_3, L4_3, L5_3, L6_3, L7_3, L8_3, L9_3, L10_3, L11_3, L12_3, L13_3, L14_3, L15_3)
        L0_3 = DetachEntity
        L1_3 = JackStand
        L0_3(L1_3)
        L0_3 = SetEntityCollision
        L1_3 = L2_2.hiddedProp
        L2_3 = true
        L3_3 = true
        L0_3(L1_3, L2_3, L3_3)
        L0_3 = ApplyForceToEntity
        L1_3 = L2_2.car
        L2_3 = 1
        L3_3 = 0.0
        L4_3 = 0.0
        L5_3 = 1.4
        L6_3 = 0.0
        L7_3 = 0.0
        L8_3 = 0.0
        L9_3 = 0
        L10_3 = false
        L11_3 = false
        L12_3 = true
        L13_3 = false
        L14_3 = false
        L0_3(L1_3, L2_3, L3_3, L4_3, L5_3, L6_3, L7_3, L8_3, L9_3, L10_3, L11_3, L12_3, L13_3, L14_3)
        L0_3 = AttachEntityToEntity
        L1_3 = JackStand
        L2_3 = L2_2.car
        L3_3 = L2_2.roadConfig
        L3_3 = L3_3.car_stuff
        L3_3 = L3_3.tyre_bone
        L4_3 = L2_2.roadConfig
        L4_3 = L4_3.car_stuff
        L4_3 = L4_3.jack_attach
        L4_3 = L4_3.coords
        L4_3 = L4_3.x
        L5_3 = L2_2.roadConfig
        L5_3 = L5_3.car_stuff
        L5_3 = L5_3.jack_attach
        L5_3 = L5_3.coords
        L5_3 = L5_3.y
        L6_3 = L2_2.roadConfig
        L6_3 = L6_3.car_stuff
        L6_3 = L6_3.jack_attach
        L6_3 = L6_3.coords
        L6_3 = L6_3.z
        L7_3 = L2_2.roadConfig
        L7_3 = L7_3.car_stuff
        L7_3 = L7_3.jack_attach
        L7_3 = L7_3.rotation
        L7_3 = L7_3.x
        L8_3 = L2_2.roadConfig
        L8_3 = L8_3.car_stuff
        L8_3 = L8_3.jack_attach
        L8_3 = L8_3.rotation
        L8_3 = L8_3.y
        L9_3 = L2_2.roadConfig
        L9_3 = L9_3.car_stuff
        L9_3 = L9_3.jack_attach
        L9_3 = L9_3.rotation
        L9_3 = L9_3.z
        L10_3 = false
        L11_3 = false
        L12_3 = true
        L13_3 = false
        L14_3 = 0
        L15_3 = false
        L0_3(L1_3, L2_3, L3_3, L4_3, L5_3, L6_3, L7_3, L8_3, L9_3, L10_3, L11_3, L12_3, L13_3, L14_3, L15_3)
        L0_3 = FreezeEntityPosition
        L1_3 = JackStand
        L2_3 = true
        L0_3(L1_3, L2_3)
        L0_3 = FreezeEntityPosition
        L1_3 = L2_2.car
        L2_3 = true
        L0_3(L1_3, L2_3)
        L2_2.jackAttachedToCar = true
        L0_3 = Config
        L0_3 = L0_3.Notification
        L1_3 = Lang
        L2_3 = "job"
        L1_3 = L1_3(L2_3)
        L2_3 = Lang
        L3_3 = "take_tyre"
        L2_3 = L2_3(L3_3)
        L3_3 = "success"
        L4_3 = nil
        L0_3(L1_3, L2_3, L3_3, L4_3)
      end
      L5_2.action = L6_2
      L6_2 = {}
      L6_2.icon = "fa-solid fa-hand-back-fist"
      L7_2 = Lang
      L8_2 = "take_tyre_option"
      L7_2 = L7_2(L8_2)
      L6_2.label = L7_2
      function L7_2()
        local L0_3, L1_3, L2_3, L3_3, L4_3, L5_3, L6_3, L7_3, L8_3, L9_3
        L0_3 = L2_2.jackAttachedToCar
        if not L0_3 then
          L0_3 = Config
          L0_3 = L0_3.Notification
          L1_3 = Lang
          L2_3 = "job"
          L1_3 = L1_3(L2_3)
          L2_3 = Lang
          L3_3 = "jack_not_setup"
          L2_3 = L2_3(L3_3)
          L3_3 = "error"
          L4_3 = nil
          return L0_3(L1_3, L2_3, L3_3, L4_3)
        end
        L0_3 = L2_2.playerNearWheel
        if not L0_3 then
          L0_3 = Config
          L0_3 = L0_3.Notification
          L1_3 = Lang
          L2_3 = "job"
          L1_3 = L1_3(L2_3)
          L2_3 = Lang
          L3_3 = "not_near_wheel"
          L2_3 = L2_3(L3_3)
          L3_3 = "error"
          L4_3 = nil
          return L0_3(L1_3, L2_3, L3_3, L4_3)
        end
        L0_3 = L2_2.wheelDeleted
        if L0_3 then
          L0_3 = SpareAttached
          if not L0_3 then
            L0_3 = Config
            L0_3 = L0_3.Notification
            L1_3 = Lang
            L2_3 = "job"
            L1_3 = L1_3(L2_3)
            L2_3 = Lang
            L3_3 = "no_spare_tyre"
            L2_3 = L2_3(L3_3)
            L3_3 = "error"
            L4_3 = nil
            return L0_3(L1_3, L2_3, L3_3, L4_3)
          end
        end
        L0_3 = L2_2.wheelDeleted
        if L0_3 then
          L0_3 = L2_2.boneCoords
          if L0_3 then
            goto lbl_61
          end
        end
        L0_3 = GetWorldPositionOfEntityBone
        L1_3 = L2_2.car
        L2_3 = L2_2.roadConfig
        L2_3 = L2_3.car_stuff
        L2_3 = L2_3.tyre_bone
        L0_3 = L0_3(L1_3, L2_3)
        ::lbl_61::
        L1_3 = GetGroundZFor_3dCoord
        L2_3 = L0_3.x
        L3_3 = L0_3.y
        L4_3 = L0_3.z
        L5_3 = 0
        L1_3, L2_3 = L1_3(L2_3, L3_3, L4_3, L5_3)
        L3_3 = SetEntityCoords
        L4_3 = PlayerPedId
        L4_3 = L4_3()
        L5_3 = L0_3.x
        L5_3 = L5_3 - 0.75
        L6_3 = L0_3.y
        L7_3 = L2_3 or L7_3
        if not L1_3 or not L2_3 then
          L7_3 = L0_3.z
          L7_3 = L7_3 - 0.35
        end
        L3_3(L4_3, L5_3, L6_3, L7_3)
        L3_3 = L2_2.wheelDeleted
        if L3_3 then
          L3_3 = SetVehicleFixed
          L4_3 = L2_2.car
          L3_3(L4_3)
          L3_3 = putPropToVehicle
          L4_3 = SpareWheel
          L5_3 = L0_1.attachable_things
          L5_3 = L5_3.spare_wheel
          L5_3 = L5_3.car_attach
          L3_3(L4_3, L5_3)
          SpareAttached = false
        end
        L3_3 = L1_1
        L4_3 = L2_2.roadConfig
        L4_3 = L4_3.progress
        L4_3 = L4_3.time
        L5_3 = L2_2.wheelDeleted
        if L5_3 then
          L5_3 = Lang
          L6_3 = "puting_tyre"
          L5_3 = L5_3(L6_3)
          if L5_3 then
            goto lbl_110
          end
        end
        L5_3 = Lang
        L6_3 = "taking_tyre"
        L5_3 = L5_3(L6_3)
        ::lbl_110::
        L6_3 = {}
        L7_3 = L2_2.roadConfig
        L7_3 = L7_3.progress
        L7_3 = L7_3.animDict
        L6_3.dict = L7_3
        L7_3 = L2_2.roadConfig
        L7_3 = L7_3.progress
        L7_3 = L7_3.animName
        L6_3.clip = L7_3
        L7_3 = L2_2.roadConfig
        L7_3 = L7_3.progress
        L7_3 = L7_3.flag
        L6_3.flag = L7_3
        L7_3 = nil
        L3_3 = L3_3(L4_3, L5_3, L6_3, L7_3)
        if L3_3 then
          L3_3 = L2_2.wheelDeleted
          if not L3_3 then
            L2_2.boneCoords = L0_3
            L3_3 = BreakOffVehicleWheel
            L4_3 = L2_2.car
            L5_3 = L2_2.roadConfig
            L5_3 = L5_3.car_stuff
            L5_3 = L5_3.tyre_index
            L6_3 = false
            L7_3 = true
            L8_3 = true
            L9_3 = false
            L3_3(L4_3, L5_3, L6_3, L7_3, L8_3, L9_3)
            L2_2.wheelDeleted = true
            L3_3 = Config
            L3_3 = L3_3.Notification
            L4_3 = Lang
            L5_3 = "job"
            L4_3 = L4_3(L5_3)
            L5_3 = Lang
            L6_3 = "tyre_taked"
            L5_3 = L5_3(L6_3)
            L6_3 = "success"
            L7_3 = nil
            L3_3(L4_3, L5_3, L6_3, L7_3)
          else
            L2_2.wheelChanged = true
            L3_3 = Config
            L3_3 = L3_3.Notification
            L4_3 = Lang
            L5_3 = "job"
            L4_3 = L4_3(L5_3)
            L5_3 = Lang
            L6_3 = "trye_puted"
            L5_3 = L5_3(L6_3)
            L6_3 = "success"
            L7_3 = nil
            L3_3(L4_3, L5_3, L6_3, L7_3)
          end
        else
          L3_3 = L2_2.wheelDeleted
          if L3_3 then
            L3_3 = BreakOffVehicleWheel
            L4_3 = L2_2.car
            L5_3 = L2_2.roadConfig
            L5_3 = L5_3.car_stuff
            L5_3 = L5_3.tyre_index
            L6_3 = false
            L7_3 = true
            L8_3 = true
            L9_3 = false
            L3_3(L4_3, L5_3, L6_3, L7_3, L8_3, L9_3)
          end
          L3_3 = Config
          L3_3 = L3_3.Notification
          L4_3 = Lang
          L5_3 = "job"
          L4_3 = L4_3(L5_3)
          L5_3 = Lang
          L6_3 = "cancelled_progress"
          L5_3 = L5_3(L6_3)
          L6_3 = "error"
          L7_3 = nil
          return L3_3(L4_3, L5_3, L6_3, L7_3)
        end
      end
      L6_2.action = L7_2
      L7_2 = {}
      L7_2.icon = "fa-solid fa-angles-down"
      L8_2 = Lang
      L9_2 = "take_jack"
      L8_2 = L8_2(L9_2)
      L7_2.label = L8_2
      function L8_2()
        local L0_3, L1_3, L2_3, L3_3, L4_3
        L0_3 = L2_2.jackAttachedToCar
        if not L0_3 then
          L0_3 = Config
          L0_3 = L0_3.Notification
          L1_3 = Lang
          L2_3 = "job"
          L1_3 = L1_3(L2_3)
          L2_3 = Lang
          L3_3 = "jack_not_setup"
          L2_3 = L2_3(L3_3)
          L3_3 = "error"
          L4_3 = nil
          return L0_3(L1_3, L2_3, L3_3, L4_3)
        end
        L0_3 = DetachEntity
        L1_3 = JackStand
        L0_3(L1_3)
        L0_3 = FreezeEntityPosition
        L1_3 = JackStand
        L2_3 = false
        L0_3(L1_3, L2_3)
        L0_3 = takePropFromVehicle
        L1_3 = JackStand
        L2_3 = L0_1.attachable_things
        L2_3 = L2_3.jack_stand
        L2_3 = L2_3.player_attach
        L0_3(L1_3, L2_3)
        JackAttached = true
        L0_3 = L2_2.wheelChanged
        if L0_3 then
          L0_3 = L2_2
          L1_3 = L0_3
          L0_3 = L0_3.TaskGoAndDeleteSelf
          L2_3 = A1_2
          L0_3(L1_3, L2_3)
        end
      end
      L7_2.action = L8_2
      L4_2[1] = L5_2
      L4_2[2] = L6_2
      L4_2[3] = L7_2
      L3_2 = L4_2
      L4_2 = CreateThread
      function L5_2()
        local L0_3, L1_3, L2_3, L3_3, L4_3, L5_3, L6_3, L7_3, L8_3, L9_3, L10_3, L11_3, L12_3, L13_3, L14_3, L15_3, L16_3, L17_3, L18_3, L19_3, L20_3, L21_3, L22_3, L23_3, L24_3, L25_3, L26_3, L27_3, L28_3, L29_3, L30_3, L31_3
        while true do
          L0_3 = L2_2
          if not L0_3 then
            break
          end
          L0_3 = L2_2.deleted
          if L0_3 then
            break
          end
          L0_3 = DoesEntityExist
          L1_3 = L2_2.car
          L0_3 = L0_3(L1_3)
          if not L0_3 then
            break
          end
          L0_3 = L2_2.jackAttachedToCar
          if L0_3 then
            break
          end
          L0_3 = 1000
          L1_3 = PlayerPedId
          L1_3 = L1_3()
          L2_3 = GetEntityCoords
          L3_3 = L1_3
          L2_3 = L2_3(L3_3)
          L3_3 = GetWorldPositionOfEntityBone
          L4_3 = L2_2.car
          L5_3 = L2_2.roadConfig
          L5_3 = L5_3.car_stuff
          L5_3 = L5_3.tyre_bone
          L3_3 = L3_3(L4_3, L5_3)
          L4_3 = L2_3 - L3_3
          L4_3 = #L4_3
          if L4_3 <= 25.0 then
            L5_3 = L2_2.jackAttachedToCar
            if not L5_3 then
              L0_3 = 5
              L5_3 = GetGroundZFor_3dCoord
              L6_3 = L3_3.x
              L7_3 = L3_3.y
              L8_3 = L3_3.z
              L9_3 = 0
              L5_3, L6_3 = L5_3(L6_3, L7_3, L8_3, L9_3)
              L7_3 = DrawMarker
              L8_3 = 1
              L9_3 = L3_3.x
              L9_3 = L9_3 - 0.5
              L10_3 = L3_3.y
              L11_3 = L6_3 or L11_3
              if not L5_3 or not L6_3 then
                L11_3 = L3_3.z
                L11_3 = L11_3 - 0.35
              end
              L12_3 = 0
              L13_3 = 0
              L14_3 = 0
              L15_3 = 0
              L16_3 = 0
              L17_3 = 0
              L18_3 = 1.25
              L19_3 = 1.25
              L20_3 = 1.25
              L21_3 = 255
              L22_3 = 255
              L23_3 = 0
              L24_3 = 50
              L25_3 = false
              L26_3 = false
              L27_3 = 2
              L28_3 = false
              L29_3 = false
              L30_3 = false
              L31_3 = false
              L7_3(L8_3, L9_3, L10_3, L11_3, L12_3, L13_3, L14_3, L15_3, L16_3, L17_3, L18_3, L19_3, L20_3, L21_3, L22_3, L23_3, L24_3, L25_3, L26_3, L27_3, L28_3, L29_3, L30_3, L31_3)
            else
              L0_3 = 250
            end
            if L4_3 <= 2.0 then
              L2_2.playerNearWheel = true
            else
              L2_2.playerNearWheel = false
            end
          end
          L5_3 = Wait
          L6_3 = L0_3
          L5_3(L6_3)
        end
      end
      L4_2(L5_2)
    else
      L4_2 = L2_2.roadConfig
      L4_2 = L4_2.type
      if "towing" == L4_2 then
        L2_2.attachedFirstTime = false
        L2_2.carAttachedToFrame = false
        L2_2.warningAttempt = false
        L2_2.freezeCar = false
        L4_2 = AddBlipForCoord
        L5_2 = L2_2.roadConfig
        L5_2 = L5_2.delivery_coords
        L5_2 = L5_2.x
        L6_2 = L2_2.roadConfig
        L6_2 = L6_2.delivery_coords
        L6_2 = L6_2.y
        L7_2 = L2_2.roadConfig
        L7_2 = L7_2.delivery_coords
        L7_2 = L7_2.z
        L4_2 = L4_2(L5_2, L6_2, L7_2)
        L2_2.deliveryBlip = L4_2
        L4_2 = SetBlipSprite
        L5_2 = L2_2.deliveryBlip
        L6_2 = L2_2.roadConfig
        L6_2 = L6_2.blips
        L6_2 = L6_2.sprite
        L4_2(L5_2, L6_2)
        L4_2 = SetBlipScale
        L5_2 = L2_2.deliveryBlip
        L6_2 = L2_2.roadConfig
        L6_2 = L6_2.blips
        L6_2 = L6_2.scale
        L4_2(L5_2, L6_2)
        L4_2 = SetBlipColour
        L5_2 = L2_2.deliveryBlip
        L6_2 = L2_2.roadConfig
        L6_2 = L6_2.blips
        L6_2 = L6_2.color
        L4_2(L5_2, L6_2)
        L4_2 = SetBlipDisplay
        L5_2 = L2_2.deliveryBlip
        L6_2 = 4
        L4_2(L5_2, L6_2)
        L4_2 = SetBlipAsShortRange
        L5_2 = L2_2.deliveryBlip
        L6_2 = true
        L4_2(L5_2, L6_2)
        L4_2 = BeginTextCommandSetBlipName
        L5_2 = "STRING"
        L4_2(L5_2)
        L4_2 = AddTextComponentString
        L5_2 = Lang
        L6_2 = "delivery_point"
        L5_2, L6_2, L7_2, L8_2, L9_2 = L5_2(L6_2)
        L4_2(L5_2, L6_2, L7_2, L8_2, L9_2)
        L4_2 = EndTextCommandSetBlipName
        L5_2 = L2_2.deliveryBlip
        L4_2(L5_2)
        L4_2 = SetNewWaypoint
        L5_2 = L2_2.roadConfig
        L5_2 = L5_2.car_stuff
        L5_2 = L5_2.coords
        L5_2 = L5_2.x
        L6_2 = L2_2.roadConfig
        L6_2 = L6_2.car_stuff
        L6_2 = L6_2.coords
        L6_2 = L6_2.y
        L4_2(L5_2, L6_2)
        L4_2 = Config
        L4_2 = L4_2.Notification
        L5_2 = Lang
        L6_2 = "job"
        L5_2 = L5_2(L6_2)
        L6_2 = Lang
        L7_2 = "car_delivery_marked"
        L6_2 = L6_2(L7_2)
        L7_2 = "inform"
        L8_2 = nil
        L4_2(L5_2, L6_2, L7_2, L8_2)
        while true do
          L4_2 = DoesEntityExist
          L5_2 = L2_2.car
          L4_2 = L4_2(L5_2)
          if L4_2 then
            break
          end
          L4_2 = Wait
          L5_2 = 0
          L4_2(L5_2)
        end
        L4_2 = CreateThread
        function L5_2()
          local L0_3, L1_3, L2_3, L3_3, L4_3, L5_3, L6_3, L7_3, L8_3, L9_3, L10_3, L11_3, L12_3, L13_3, L14_3, L15_3, L16_3, L17_3, L18_3, L19_3, L20_3, L21_3, L22_3, L23_3, L24_3, L25_3, L26_3, L27_3, L28_3
          while true do
            L0_3 = L2_2
            if not L0_3 then
              break
            end
            L0_3 = L2_2.deleted
            if L0_3 then
              break
            end
            L0_3 = 1000
            L1_3 = PlayerPedId
            L1_3 = L1_3()
            L2_3 = GetEntityCoords
            L3_3 = L1_3
            L2_3 = L2_3(L3_3)
            L3_3 = L2_2.roadConfig
            L3_3 = L3_3.delivery_coords
            L3_3 = L2_3 - L3_3
            L3_3 = #L3_3
            if L3_3 <= 50.0 then
              L0_3 = 5
              L4_3 = DrawMarker
              L5_3 = 0
              L6_3 = L2_2.roadConfig
              L6_3 = L6_3.delivery_coords
              L6_3 = L6_3.x
              L7_3 = L2_2.roadConfig
              L7_3 = L7_3.delivery_coords
              L7_3 = L7_3.y
              L8_3 = L2_2.roadConfig
              L8_3 = L8_3.delivery_coords
              L8_3 = L8_3.z
              L8_3 = L8_3 + 2.5
              L9_3 = 0
              L10_3 = 0
              L11_3 = 0
              L12_3 = 0
              L13_3 = 0
              L14_3 = 0
              L15_3 = 1.0
              L16_3 = 1.0
              L17_3 = 1.0
              L18_3 = 255
              L19_3 = 255
              L20_3 = 0
              L21_3 = 200
              L22_3 = true
              L23_3 = false
              L24_3 = 2
              L25_3 = false
              L26_3 = false
              L27_3 = false
              L28_3 = false
              L4_3(L5_3, L6_3, L7_3, L8_3, L9_3, L10_3, L11_3, L12_3, L13_3, L14_3, L15_3, L16_3, L17_3, L18_3, L19_3, L20_3, L21_3, L22_3, L23_3, L24_3, L25_3, L26_3, L27_3, L28_3)
            end
            L4_3 = Wait
            L5_3 = L0_3
            L4_3(L5_3)
          end
        end
        L4_2(L5_2)
        L4_2 = CreateThread
        function L5_2()
          local L0_3, L1_3, L2_3, L3_3, L4_3, L5_3, L6_3, L7_3
          while true do
            L0_3 = L2_2
            if not L0_3 then
              break
            end
            L0_3 = L2_2.deleted
            if L0_3 then
              break
            end
            L0_3 = 1000
            L1_3 = PlayerPedId
            L1_3 = L1_3()
            L2_3 = GetEntityCoords
            L3_3 = L1_3
            L2_3 = L2_3(L3_3)
            L3_3 = L2_2.roadConfig
            L3_3 = L3_3.delivery_coords
            L3_3 = L2_3 - L3_3
            L3_3 = #L3_3
            if L3_3 >= 5.0 then
              L4_3 = L2_2.attachedFirstTime
              if L4_3 then
                L4_3 = L2_2.carAttachedToFrame
                if not L4_3 then
                  L4_3 = L2_2.warningAttempt
                  if not L4_3 then
                    L2_2.warningAttempt = true
                    L4_3 = L2_2
                    L5_3 = L4_3
                    L4_3 = L4_3.warningAttemptF
                    L4_3(L5_3)
                end
              end
              else
                L4_3 = L2_2.attachedFirstTime
                if L4_3 then
                  L4_3 = L2_2.carAttachedToFrame
                  if L4_3 then
                    L4_3 = L2_2.warningAttempt
                    if L4_3 then
                      L2_2.warningAttempt = false
                    end
                  end
                end
              end
            else
              L4_3 = L2_2.attachedFirstTime
              if L4_3 then
                L4_3 = L2_2.carAttachedToFrame
                if L4_3 then
                  L4_3 = L2_2.warningAttempt
                  if not L4_3 then
                    L4_3 = L2_1
                    L5_3 = L2_2.timer
                    L6_3 = A1_2
                    L7_3 = L2_2.roadConfig
                    L7_3 = L7_3.reward
                    L4_3(L5_3, L6_3, L7_3)
                    L4_3 = L2_2
                    L5_3 = L4_3
                    L4_3 = L4_3.deleteSelf
                    L4_3(L5_3)
                  end
                end
              end
            end
            L4_3 = Wait
            L5_3 = L0_3
            L4_3(L5_3)
          end
        end
        L4_2(L5_2)
        L4_2 = CreateThread
        function L5_2()
          local L0_3, L1_3, L2_3, L3_3, L4_3, L5_3, L6_3, L7_3, L8_3, L9_3, L10_3, L11_3, L12_3, L13_3, L14_3, L15_3, L16_3, L17_3, L18_3, L19_3, L20_3, L21_3, L22_3, L23_3, L24_3, L25_3, L26_3
          while true do
            L0_3 = L2_2
            if not L0_3 then
              break
            end
            L0_3 = L2_2.deleted
            if L0_3 then
              break
            end
            L0_3 = 1000
            L1_3 = IsVehicleAttachedToTowTruck
            L2_3 = TowTruck
            L3_3 = L2_2.car
            L1_3 = L1_3(L2_3, L3_3)
            L2_2.carAttachedToFrame = L1_3
            L1_3 = L2_2.carAttachedToFrame
            if not L1_3 then
              L1_3 = L2_2.freezeCar
              if not L1_3 then
                L1_3 = FreezeEntityPosition
                L2_3 = L2_2.car
                L3_3 = true
                L1_3(L2_3, L3_3)
                L1_3 = PlaceObjectOnGroundProperly
                L2_3 = L2_2.car
                L1_3(L2_3)
                L1_3 = SetVehicleOnGroundProperly
                L2_3 = L2_2.car
                L1_3(L2_3)
                L2_2.freezeCar = true
              end
              L0_3 = 5
              L1_3 = GetEntityCoords
              L2_3 = L2_2.car
              L1_3 = L1_3(L2_3)
              L2_3 = DrawMarker
              L3_3 = 0
              L4_3 = L1_3.x
              L5_3 = L1_3.y
              L6_3 = L1_3.z
              L6_3 = L6_3 + 3.0
              L7_3 = 0
              L8_3 = 0
              L9_3 = 0
              L10_3 = 0
              L11_3 = 0
              L12_3 = 0
              L13_3 = 1.0
              L14_3 = 1.0
              L15_3 = 1.0
              L16_3 = 255
              L17_3 = 255
              L18_3 = 0
              L19_3 = 200
              L20_3 = true
              L21_3 = false
              L22_3 = 2
              L23_3 = false
              L24_3 = false
              L25_3 = false
              L26_3 = false
              L2_3(L3_3, L4_3, L5_3, L6_3, L7_3, L8_3, L9_3, L10_3, L11_3, L12_3, L13_3, L14_3, L15_3, L16_3, L17_3, L18_3, L19_3, L20_3, L21_3, L22_3, L23_3, L24_3, L25_3, L26_3)
            else
              L1_3 = L2_2.attachedFirstTime
              if not L1_3 then
                L1_3 = FreezeEntityPosition
                L2_3 = L2_2.car
                L3_3 = false
                L1_3(L2_3, L3_3)
                L2_2.attachedFirstTime = true
                L1_3 = SetNewWaypoint
                L2_3 = L2_2.roadConfig
                L2_3 = L2_3.delivery_coords
                L2_3 = L2_3.x
                L3_3 = L2_2.roadConfig
                L3_3 = L3_3.delivery_coords
                L3_3 = L3_3.y
                L1_3(L2_3, L3_3)
                L1_3 = Config
                L1_3 = L1_3.Notification
                L2_3 = Lang
                L3_3 = "job"
                L2_3 = L2_3(L3_3)
                L3_3 = Lang
                L4_3 = "car_delivery_marked"
                L3_3 = L3_3(L4_3)
                L4_3 = "inform"
                L5_3 = nil
                L1_3(L2_3, L3_3, L4_3, L5_3)
              end
              L1_3 = L2_2.freezeCar
              if L1_3 then
                L1_3 = FreezeEntityPosition
                L2_3 = L2_2.car
                L3_3 = false
                L1_3(L2_3, L3_3)
                L2_2.freezeCar = false
              end
            end
            L1_3 = Wait
            L2_3 = L0_3
            L1_3(L2_3)
          end
        end
        L4_2(L5_2)
      end
    end
  end
  L4_2 = L2_2.roadConfig
  L4_2 = L4_2.type
  if "towing" ~= L4_2 then
    L4_2 = lib
    L4_2 = L4_2.zones
    L4_2 = L4_2.sphere
    L5_2 = {}
    L6_2 = L2_2.roadConfig
    L6_2 = L6_2.car_stuff
    L6_2 = L6_2.coords
    L5_2.coords = L6_2
    L5_2.radius = 30.0
    L6_2 = L0_1.debug
    L5_2.debug = L6_2
    function L6_2(A0_3)
      local L1_3
    end
    L5_2.inside = L6_2
    function L6_2()
      local L0_3, L1_3
      inRoadArea = true
    end
    L5_2.onEnter = L6_2
    function L6_2()
      local L0_3, L1_3
      inRoadArea = false
      L0_3 = playetOutTheRoadhelperArea
      L0_3()
    end
    L5_2.onExit = L6_2
    L4_2 = L4_2(L5_2)
    RoadPoint = L4_2
  end
  L4_2 = #L3_2
  if L4_2 >= 1 then
    L4_2 = AddTargetEntity
    L5_2 = L2_2.car
    L6_2 = L3_2
    L7_2 = true
    L8_2 = 3.0
    L4_2(L5_2, L6_2, L7_2, L8_2)
  end
  L4_2 = points
  L5_2 = points
  L5_2 = #L5_2
  L5_2 = L5_2 + 1
  L6_2 = RoadPoint
  L4_2[L5_2] = L6_2
  L4_2 = RandomEvents
  L4_2 = L4_2.Events
  L5_2 = RandomEvents
  L5_2 = L5_2.Events
  L5_2 = #L5_2
  L5_2 = L5_2 + 1
  L4_2[L5_2] = L2_2
  return L2_2
end
L3_1.NewEvent = L4_1