local L0_1, L1_1, L2_1, L3_1
L0_1 = Config
L0_1 = L0_1.Jobs
L0_1 = L0_1.roadhelper
TowTruck = nil
L1_1 = nil
L2_1 = nil
L3_1 = nil
inRoadArea = false
RoadPoint = L3_1
RoadIndex = L2_1
RoadEvent = L1_1
L1_1 = nil
L2_1 = nil
SpareWheel = nil
JerryCan = L2_1
JackStand = L1_1
L1_1 = false
L2_1 = false
SpareAttached = false
JerryAttached = L2_1
JackAttached = L1_1
L1_1 = RegisterNetEvent
L2_1 = "wais:setDefault:JobThings"
function L3_1()
  local L0_2, L1_2
  L0_2 = RoadEvent
  if nil ~= L0_2 then
    L0_2 = RoadEvent
    L1_2 = L0_2
    L0_2 = L0_2.deleteSelf
    L0_2(L1_2)
    RoadEvent = nil
  end
  L0_2 = RoadPoint
  if nil ~= L0_2 then
    L0_2 = RoadPoint
    L1_2 = L0_2
    L0_2 = L0_2.remove
    L0_2(L1_2)
    RoadPoint = nil
  end
  L0_2 = JackStand
  if nil ~= L0_2 then
    L0_2 = DeleteEntity
    L1_2 = JackStand
    L0_2(L1_2)
    JackStand = nil
  end
  L0_2 = SpareWheel
  if nil ~= L0_2 then
    L0_2 = DeleteEntity
    L1_2 = SpareWheel
    L0_2(L1_2)
    SpareWheel = nil
  end
  L0_2 = JerryCan
  if nil ~= L0_2 then
    L0_2 = DeleteEntity
    L1_2 = JerryCan
    L0_2(L1_2)
    JerryCan = nil
  end
  L0_2 = false
  L1_2 = false
  SpareAttached = false
  JerryAttached = L1_2
  JackAttached = L0_2
  inRoadArea = false
end
L1_1(L2_1, L3_1)
function L1_1()
  local L0_2, L1_2, L2_2, L3_2, L4_2, L5_2, L6_2, L7_2
  L0_2 = math
  L0_2 = L0_2.randomseed
  L1_2 = GetGameTimer
  L1_2, L2_2, L3_2, L4_2, L5_2, L6_2, L7_2 = L1_2()
  L0_2(L1_2, L2_2, L3_2, L4_2, L5_2, L6_2, L7_2)
  L0_2 = math
  L0_2 = L0_2.random
  L1_2 = 1
  L2_2 = L0_1.randomEvents
  L2_2 = L2_2.events
  L2_2 = #L2_2
  L0_2 = L0_2(L1_2, L2_2)
  RoadIndex = L0_2
  L0_2 = lib
  L0_2 = L0_2.callback
  L1_2 = "wais:raodhelper:checkBusy"
  L2_2 = false
  function L3_2(A0_3)
    local L1_3, L2_3, L3_3, L4_3, L5_3
    if A0_3 then
      RoadIndex = nil
      L1_3 = Config
      L1_3 = L1_3.Notification
      L2_3 = Lang
      L3_3 = "job"
      L2_3 = L2_3(L3_3)
      L3_3 = Lang
      L4_3 = "answered_someone"
      L3_3 = L3_3(L4_3)
      L4_3 = "error"
      L5_3 = nil
      return L1_3(L2_3, L3_3, L4_3, L5_3)
    end
  end
  L4_2 = RoadIndex
  L0_2(L1_2, L2_2, L3_2, L4_2)
  L0_2 = 5
  L1_2 = nil
  L2_2 = lib
  L2_2 = L2_2.hideTextUI
  L2_2()
  L2_2 = lib
  L2_2 = L2_2.showTextUI
  L3_2 = Lang
  L4_2 = "road_call"
  L3_2 = L3_2(L4_2)
  L4_2 = Lang
  L5_2 = "road_type"
  L6_2 = L0_1.randomEvents
  L6_2 = L6_2.events
  L7_2 = RoadIndex
  L6_2 = L6_2[L7_2]
  L6_2 = L6_2.label
  L4_2 = L4_2(L5_2, L6_2)
  L5_2 = Lang
  L6_2 = "road_accept"
  L5_2 = L5_2(L6_2)
  L6_2 = Lang
  L7_2 = "road_reject"
  L6_2 = L6_2(L7_2)
  L3_2 = L3_2 .. L4_2 .. L5_2 .. L6_2
  L4_2 = {}
  L4_2.position = "left-center"
  L5_2 = {}
  L5_2.color = "white"
  L4_2.style = L5_2
  L2_2(L3_2, L4_2)
  L2_2 = CreateThread
  function L3_2()
    local L0_3, L1_3, L2_3, L3_3, L4_3
    while true do
      L0_3 = RoadEvent
      if nil ~= L0_3 then
        break
      end
      L0_3 = L1_2
      if nil ~= L0_3 then
        break
      end
      L0_3 = L0_2
      L0_3 = L0_3 - 1
      L0_2 = L0_3
      L0_3 = L0_2
      if L0_3 <= 0 then
        L0_3 = lib
        L0_3 = L0_3.hideTextUI
        L0_3()
        L0_3 = TriggerServerEvent
        L1_3 = "wais:setDefault:RoadState"
        L2_3 = RoadIndex
        L0_3(L1_3, L2_3)
        RoadIndex = nil
        L0_3 = Config
        L0_3 = L0_3.Notification
        L1_3 = Lang
        L2_3 = "job"
        L1_3 = L1_3(L2_3)
        L2_3 = Lang
        L3_3 = "not_answered"
        L2_3 = L2_3(L3_3)
        L3_3 = "error"
        L4_3 = nil
        L0_3(L1_3, L2_3, L3_3, L4_3)
        break
      end
      L0_3 = Wait
      L1_3 = 1000
      L0_3(L1_3)
    end
  end
  L2_2(L3_2)
  L2_2 = CreateThread
  function L3_2()
    local L0_3, L1_3, L2_3, L3_3, L4_3
    while true do
      L0_3 = RoadIndex
      if nil == L0_3 then
        break
      end
      L0_3 = L0_2
      if not (L0_3 >= 1) then
        break
      end
      L0_3 = IsControlJustPressed
      L1_3 = 0
      L2_3 = 38
      L0_3 = L0_3(L1_3, L2_3)
      if L0_3 then
        L0_3 = true
        L1_2 = L0_3
        L0_3 = lib
        L0_3 = L0_3.hideTextUI
        L0_3()
        L0_3 = RandomEvents
        L1_3 = L0_3
        L0_3 = L0_3.NewEvent
        L2_3 = RoadIndex
        L0_3 = L0_3(L1_3, L2_3)
        RoadEvent = L0_3
        L0_3 = Config
        L0_3 = L0_3.Notification
        L1_3 = Lang
        L2_3 = "job"
        L1_3 = L1_3(L2_3)
        L2_3 = Lang
        L3_3 = "call_accepted"
        L2_3 = L2_3(L3_3)
        L3_3 = "success"
        L4_3 = nil
        L0_3(L1_3, L2_3, L3_3, L4_3)
        break
      else
        L0_3 = IsControlJustPressed
        L1_3 = 0
        L2_3 = 44
        L0_3 = L0_3(L1_3, L2_3)
        if L0_3 then
          L0_3 = false
          L1_2 = L0_3
          L0_3 = lib
          L0_3 = L0_3.hideTextUI
          L0_3()
          L0_3 = TriggerServerEvent
          L1_3 = "wais:setDefault:RoadState"
          L2_3 = RoadIndex
          L0_3(L1_3, L2_3)
          RoadIndex = nil
          L0_3 = Config
          L0_3 = L0_3.Notification
          L1_3 = Lang
          L2_3 = "job"
          L1_3 = L1_3(L2_3)
          L2_3 = Lang
          L3_3 = "call_rejected"
          L2_3 = L2_3(L3_3)
          L3_3 = "inform"
          L4_3 = nil
          L0_3(L1_3, L2_3, L3_3, L4_3)
          break
        end
      end
      L0_3 = Wait
      L1_3 = 0
      L0_3(L1_3)
    end
  end
  L2_2(L3_2)
end
function L2_1()
  local L0_2, L1_2, L2_2, L3_2, L4_2
  L0_2 = RoadEvent
  if nil ~= L0_2 then
    L0_2 = RoadEvent
    L1_2 = L0_2
    L0_2 = L0_2.deleteSelf
    L0_2(L1_2)
    L0_2 = Config
    L0_2 = L0_2.Notification
    L1_2 = Lang
    L2_2 = "job"
    L1_2 = L1_2(L2_2)
    L2_2 = Lang
    L3_2 = "cancelled"
    L2_2 = L2_2(L3_2)
    L3_2 = "error"
    L4_2 = nil
    L0_2(L1_2, L2_2, L3_2, L4_2)
  end
end
checkRoadhelperHaveEvent = L2_1
function L2_1()
  local L0_2, L1_2, L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2
  L0_2 = GetEntityCoords
  L1_2 = PlayerPedId
  L1_2, L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2 = L1_2()
  L0_2 = L0_2(L1_2, L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2)
  L1_2 = joaat
  L2_2 = L0_1.attachable_things
  L2_2 = L2_2.jack_stand
  L2_2 = L2_2.model
  L1_2 = L1_2(L2_2)
  L2_2 = joaat
  L3_2 = L0_1.attachable_things
  L3_2 = L3_2.spare_wheel
  L3_2 = L3_2.model
  L2_2 = L2_2(L3_2)
  L3_2 = joaat
  L4_2 = L0_1.attachable_things
  L4_2 = L4_2.jerry_can
  L4_2 = L4_2.model
  L3_2 = L3_2(L4_2)
  L4_2 = loadModel
  L5_2 = L1_2
  L4_2 = L4_2(L5_2)
  if not L4_2 then
    return
  end
  L4_2 = loadModel
  L5_2 = L2_2
  L4_2 = L4_2(L5_2)
  if not L4_2 then
    return
  end
  L4_2 = loadModel
  L5_2 = L3_2
  L4_2 = L4_2(L5_2)
  if not L4_2 then
    return
  end
  L4_2 = CreateObject
  L5_2 = L1_2
  L6_2 = L0_2.x
  L7_2 = L0_2.y
  L8_2 = L0_2.z
  L9_2 = true
  L10_2 = false
  L11_2 = false
  L4_2 = L4_2(L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2)
  JackStand = L4_2
  L4_2 = SetEntityAsMissionEntity
  L5_2 = JackStand
  L6_2 = false
  L7_2 = false
  L4_2(L5_2, L6_2, L7_2)
  L4_2 = AttachEntityToEntity
  L5_2 = JackStand
  L6_2 = vehicle
  L7_2 = L0_1.attachable_things
  L7_2 = L7_2.jack_stand
  L7_2 = L7_2.car_attach
  L7_2 = L7_2.bone
  L8_2 = L0_1.attachable_things
  L8_2 = L8_2.jack_stand
  L8_2 = L8_2.car_attach
  L8_2 = L8_2.coords
  L8_2 = L8_2.x
  L9_2 = L0_1.attachable_things
  L9_2 = L9_2.jack_stand
  L9_2 = L9_2.car_attach
  L9_2 = L9_2.coords
  L9_2 = L9_2.y
  L10_2 = L0_1.attachable_things
  L10_2 = L10_2.jack_stand
  L10_2 = L10_2.car_attach
  L10_2 = L10_2.coords
  L10_2 = L10_2.z
  L11_2 = L0_1.attachable_things
  L11_2 = L11_2.jack_stand
  L11_2 = L11_2.car_attach
  L11_2 = L11_2.rotation
  L11_2 = L11_2.x
  L12_2 = L0_1.attachable_things
  L12_2 = L12_2.jack_stand
  L12_2 = L12_2.car_attach
  L12_2 = L12_2.rotation
  L12_2 = L12_2.y
  L13_2 = L0_1.attachable_things
  L13_2 = L13_2.jack_stand
  L13_2 = L13_2.car_attach
  L13_2 = L13_2.rotation
  L13_2 = L13_2.z
  L14_2 = false
  L15_2 = false
  L16_2 = true
  L17_2 = false
  L18_2 = 2
  L19_2 = true
  L4_2(L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2)
  L4_2 = CreateObject
  L5_2 = L2_2
  L6_2 = L0_2.x
  L7_2 = L0_2.y
  L8_2 = L0_2.z
  L9_2 = true
  L10_2 = false
  L11_2 = false
  L4_2 = L4_2(L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2)
  SpareWheel = L4_2
  L4_2 = SetEntityAsMissionEntity
  L5_2 = SpareWheel
  L6_2 = false
  L7_2 = false
  L4_2(L5_2, L6_2, L7_2)
  L4_2 = AttachEntityToEntity
  L5_2 = SpareWheel
  L6_2 = vehicle
  L7_2 = L0_1.attachable_things
  L7_2 = L7_2.spare_wheel
  L7_2 = L7_2.car_attach
  L7_2 = L7_2.bone
  L8_2 = L0_1.attachable_things
  L8_2 = L8_2.spare_wheel
  L8_2 = L8_2.car_attach
  L8_2 = L8_2.coords
  L8_2 = L8_2.x
  L9_2 = L0_1.attachable_things
  L9_2 = L9_2.spare_wheel
  L9_2 = L9_2.car_attach
  L9_2 = L9_2.coords
  L9_2 = L9_2.y
  L10_2 = L0_1.attachable_things
  L10_2 = L10_2.spare_wheel
  L10_2 = L10_2.car_attach
  L10_2 = L10_2.coords
  L10_2 = L10_2.z
  L11_2 = L0_1.attachable_things
  L11_2 = L11_2.spare_wheel
  L11_2 = L11_2.car_attach
  L11_2 = L11_2.rotation
  L11_2 = L11_2.x
  L12_2 = L0_1.attachable_things
  L12_2 = L12_2.spare_wheel
  L12_2 = L12_2.car_attach
  L12_2 = L12_2.rotation
  L12_2 = L12_2.y
  L13_2 = L0_1.attachable_things
  L13_2 = L13_2.spare_wheel
  L13_2 = L13_2.car_attach
  L13_2 = L13_2.rotation
  L13_2 = L13_2.z
  L14_2 = false
  L15_2 = false
  L16_2 = true
  L17_2 = false
  L18_2 = 2
  L19_2 = true
  L4_2(L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2)
  L4_2 = CreateObject
  L5_2 = L3_2
  L6_2 = L0_2.x
  L7_2 = L0_2.y
  L8_2 = L0_2.z
  L9_2 = true
  L10_2 = false
  L11_2 = false
  L4_2 = L4_2(L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2)
  JerryCan = L4_2
  L4_2 = SetEntityAsMissionEntity
  L5_2 = JerryCan
  L6_2 = false
  L7_2 = false
  L4_2(L5_2, L6_2, L7_2)
  L4_2 = AttachEntityToEntity
  L5_2 = JerryCan
  L6_2 = vehicle
  L7_2 = L0_1.attachable_things
  L7_2 = L7_2.jerry_can
  L7_2 = L7_2.car_attach
  L7_2 = L7_2.bone
  L8_2 = L0_1.attachable_things
  L8_2 = L8_2.jerry_can
  L8_2 = L8_2.car_attach
  L8_2 = L8_2.coords
  L8_2 = L8_2.x
  L9_2 = L0_1.attachable_things
  L9_2 = L9_2.jerry_can
  L9_2 = L9_2.car_attach
  L9_2 = L9_2.coords
  L9_2 = L9_2.y
  L10_2 = L0_1.attachable_things
  L10_2 = L10_2.jerry_can
  L10_2 = L10_2.car_attach
  L10_2 = L10_2.coords
  L10_2 = L10_2.z
  L11_2 = L0_1.attachable_things
  L11_2 = L11_2.jerry_can
  L11_2 = L11_2.car_attach
  L11_2 = L11_2.rotation
  L11_2 = L11_2.x
  L12_2 = L0_1.attachable_things
  L12_2 = L12_2.jerry_can
  L12_2 = L12_2.car_attach
  L12_2 = L12_2.rotation
  L12_2 = L12_2.y
  L13_2 = L0_1.attachable_things
  L13_2 = L13_2.jerry_can
  L13_2 = L13_2.car_attach
  L13_2 = L13_2.rotation
  L13_2 = L13_2.z
  L14_2 = false
  L15_2 = false
  L16_2 = true
  L17_2 = false
  L18_2 = 2
  L19_2 = true
  L4_2(L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2)
  L4_2 = vehicle
  TowTruck = L4_2
  L4_2 = addTargetTowTruck
  L4_2()
  L4_2 = TriggerServerEvent
  L5_2 = "wais:addProp:table"
  L6_2 = {}
  L7_2 = {}
  L8_2 = JackStand
  L7_2.entity = L8_2
  L8_2 = NetworkGetNetworkIdFromEntity
  L9_2 = JackStand
  L8_2 = L8_2(L9_2)
  L7_2.id = L8_2
  L8_2 = {}
  L9_2 = SpareWheel
  L8_2.entity = L9_2
  L9_2 = NetworkGetNetworkIdFromEntity
  L10_2 = SpareWheel
  L9_2 = L9_2(L10_2)
  L8_2.id = L9_2
  L6_2[1] = L7_2
  L6_2[2] = L8_2
  L4_2(L5_2, L6_2)
end
createAttachableHelperThings = L2_1
function L2_1()
  local L0_2, L1_2, L2_2
  L0_2 = Config
  L0_2 = L0_2.AbuseController
  L0_2 = L0_2.warning_count
  L1_2 = CreateThread
  function L2_2()
    local L0_3, L1_3, L2_3, L3_3, L4_3
    while true do
      L0_3 = inGarden
      if L0_3 then
        break
      end
      L0_3 = L0_2
      L0_3 = L0_3 - 1
      L0_2 = L0_3
      L0_3 = Config
      L0_3 = L0_3.Notification
      L1_3 = Lang
      L2_3 = "job"
      L1_3 = L1_3(L2_3)
      L2_3 = Lang
      L3_3 = "go_call_area"
      L2_3 = L2_3(L3_3)
      L3_3 = "warning"
      L4_3 = nil
      L0_3(L1_3, L2_3, L3_3, L4_3)
      L0_3 = L0_2
      if L0_3 <= 0 then
        L0_3 = RoadEvent
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
  L1_2(L2_2)
end
playetOutTheRoadhelperArea = L2_1
function L2_1()
  local L0_2, L1_2, L2_2, L3_2, L4_2, L5_2, L6_2, L7_2
  L0_2 = AddTargetEntity
  L1_2 = vehicle
  L2_2 = {}
  L3_2 = {}
  L3_2.icon = "fa-solid fa-hand"
  L4_2 = Lang
  L5_2 = "take_put_jack"
  L4_2 = L4_2(L5_2)
  L3_2.label = L4_2
  function L4_2()
    local L0_3, L1_3, L2_3, L3_3, L4_3
    L0_3 = JackAttached
    if not L0_3 then
      L0_3 = inRoadArea
      if not L0_3 then
        L0_3 = JackAttached
        if not L0_3 then
          L0_3 = Config
          L0_3 = L0_3.Notification
          L1_3 = Lang
          L2_3 = "job"
          L1_3 = L1_3(L2_3)
          L2_3 = Lang
          L3_3 = "mus_in_road_area"
          L2_3 = L2_3(L3_3)
          L3_3 = "error"
          L4_3 = nil
          return L0_3(L1_3, L2_3, L3_3, L4_3)
        end
      end
      L0_3 = RoadEvent
      if nil == L0_3 then
        L0_3 = Config
        L0_3 = L0_3.Notification
        L1_3 = Lang
        L2_3 = "job"
        L1_3 = L1_3(L2_3)
        L2_3 = Lang
        L3_3 = "no_call"
        L2_3 = L2_3(L3_3)
        L3_3 = "error"
        L4_3 = nil
        return L0_3(L1_3, L2_3, L3_3, L4_3)
      end
      L0_3 = RoadEvent
      L0_3 = L0_3.jackAttachedToCar
      if L0_3 then
        L0_3 = Config
        L0_3 = L0_3.Notification
        L1_3 = Lang
        L2_3 = "job"
        L1_3 = L1_3(L2_3)
        L2_3 = Lang
        L3_3 = "jack_already_attached"
        L2_3 = L2_3(L3_3)
        L3_3 = "error"
        L4_3 = nil
        return L0_3(L1_3, L2_3, L3_3, L4_3)
      end
    end
    L0_3 = IsEntityAttachedToAnyPed
    L1_3 = JackStand
    L0_3 = L0_3(L1_3)
    if L0_3 then
      L0_3 = putPropToVehicle
      L1_3 = JackStand
      L2_3 = L0_1.attachable_things
      L2_3 = L2_3.jack_stand
      L2_3 = L2_3.car_attach
      L0_3(L1_3, L2_3)
      JackAttached = false
    else
      L0_3 = takePropFromVehicle
      L1_3 = JackStand
      L2_3 = L0_1.attachable_things
      L2_3 = L2_3.jack_stand
      L2_3 = L2_3.player_attach
      L0_3(L1_3, L2_3)
      JackAttached = true
    end
  end
  L3_2.action = L4_2
  L4_2 = {}
  L4_2.icon = "fa-solid fa-hand"
  L5_2 = Lang
  L6_2 = "take_put_wheel"
  L5_2 = L5_2(L6_2)
  L4_2.label = L5_2
  function L5_2()
    local L0_3, L1_3, L2_3, L3_3, L4_3
    L0_3 = SpareAttached
    if not L0_3 then
      L0_3 = RoadEvent
      if nil == L0_3 then
        L0_3 = Config
        L0_3 = L0_3.Notification
        L1_3 = Lang
        L2_3 = "job"
        L1_3 = L1_3(L2_3)
        L2_3 = Lang
        L3_3 = "no_call"
        L2_3 = L2_3(L3_3)
        L3_3 = "error"
        L4_3 = nil
        return L0_3(L1_3, L2_3, L3_3, L4_3)
      end
      L0_3 = inRoadArea
      if not L0_3 then
        L0_3 = SpareAttached
        if not L0_3 then
          L0_3 = Config
          L0_3 = L0_3.Notification
          L1_3 = Lang
          L2_3 = "job"
          L1_3 = L1_3(L2_3)
          L2_3 = Lang
          L3_3 = "mus_in_road_area"
          L2_3 = L2_3(L3_3)
          L3_3 = "error"
          L4_3 = nil
          return L0_3(L1_3, L2_3, L3_3, L4_3)
        end
      end
      L0_3 = RoadEvent
      L0_3 = L0_3.wheelDeleted
      if not L0_3 then
        L0_3 = Config
        L0_3 = L0_3.Notification
        L1_3 = Lang
        L2_3 = "job"
        L1_3 = L1_3(L2_3)
        L2_3 = Lang
        L3_3 = "tyre_not_removed"
        L2_3 = L2_3(L3_3)
        L3_3 = "error"
        L4_3 = nil
        return L0_3(L1_3, L2_3, L3_3, L4_3)
      end
    end
    L0_3 = IsEntityAttachedToAnyPed
    L1_3 = SpareWheel
    L0_3 = L0_3(L1_3)
    if L0_3 then
      L0_3 = putPropToVehicle
      L1_3 = SpareWheel
      L2_3 = L0_1.attachable_things
      L2_3 = L2_3.spare_wheel
      L2_3 = L2_3.car_attach
      L0_3(L1_3, L2_3)
      SpareAttached = false
    else
      L0_3 = takePropFromVehicle
      L1_3 = SpareWheel
      L2_3 = L0_1.attachable_things
      L2_3 = L2_3.spare_wheel
      L2_3 = L2_3.player_attach
      L0_3(L1_3, L2_3)
      SpareAttached = true
    end
  end
  L4_2.action = L5_2
  L5_2 = {}
  L5_2.icon = "fa-solid fa-hand"
  L6_2 = Lang
  L7_2 = "take_put_jerrycan"
  L6_2 = L6_2(L7_2)
  L5_2.label = L6_2
  function L6_2()
    local L0_3, L1_3, L2_3, L3_3, L4_3
    L0_3 = JerryAttached
    if not L0_3 then
      L0_3 = RoadEvent
      if nil == L0_3 then
        L0_3 = Config
        L0_3 = L0_3.Notification
        L1_3 = Lang
        L2_3 = "job"
        L1_3 = L1_3(L2_3)
        L2_3 = Lang
        L3_3 = "no_call"
        L2_3 = L2_3(L3_3)
        L3_3 = "error"
        L4_3 = nil
        return L0_3(L1_3, L2_3, L3_3, L4_3)
      end
      L0_3 = inRoadArea
      if not L0_3 then
        L0_3 = JerryAttached
        if not L0_3 then
          L0_3 = Config
          L0_3 = L0_3.Notification
          L1_3 = Lang
          L2_3 = "job"
          L1_3 = L1_3(L2_3)
          L2_3 = Lang
          L3_3 = "mus_in_road_area"
          L2_3 = L2_3(L3_3)
          L3_3 = "error"
          L4_3 = nil
          return L0_3(L1_3, L2_3, L3_3, L4_3)
        end
      end
    end
    L0_3 = IsEntityAttachedToAnyPed
    L1_3 = JerryCan
    L0_3 = L0_3(L1_3)
    if L0_3 then
      L0_3 = putPropToVehicle
      L1_3 = JerryCan
      L2_3 = L0_1.attachable_things
      L2_3 = L2_3.jerry_can
      L2_3 = L2_3.car_attach
      L0_3(L1_3, L2_3)
      JerryAttached = false
    else
      L0_3 = takePropFromVehicle
      L1_3 = JerryCan
      L2_3 = L0_1.attachable_things
      L2_3 = L2_3.jerry_can
      L2_3 = L2_3.player_attach
      L0_3(L1_3, L2_3)
      JerryAttached = true
    end
  end
  L5_2.action = L6_2
  L2_2[1] = L3_2
  L2_2[2] = L4_2
  L2_2[3] = L5_2
  L3_2 = true
  L4_2 = 3.0
  L0_2(L1_2, L2_2, L3_2, L4_2)
end
addTargetTowTruck = L2_1
function L2_1()
  local L0_2, L1_2, L2_2, L3_2, L4_2
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
          L5_3 = "roadhelper"
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
    L2_2 = "[^2INFO^7] Roadhelper Job Center has been initialized."
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
      L3_2 = "[^2INFO^7] Roadhelper Job Center Blip has been initialized."
      L2_2(L3_2)
    end
  end
  L1_2 = points
  L2_2 = points
  L2_2 = #L2_2
  L2_2 = L2_2 + 1
  L1_2[L2_2] = L0_2
end
initRoadhelper = L2_1
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
    if "roadhelper" == L3_2 then
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
L2_1 = CreateThread
function L3_1()
  local L0_2, L1_2, L2_2
  while true do
    L0_2 = math
    L0_2 = L0_2.randomseed
    L1_2 = GetGameTimer
    L1_2, L2_2 = L1_2()
    L0_2(L1_2, L2_2)
    L0_2 = L0_1.randomEvents
    L0_2 = L0_2.event_timer
    L0_2 = L0_2 * 30
    L0_2 = L0_2 * 1000
    L1_2 = Wait
    L2_2 = L0_2
    L1_2(L2_2)
    L1_2 = CurrentJob
    if "roadhelper" == L1_2 then
      L1_2 = RoadIndex
      if nil == L1_2 then
        L1_2 = RoadEvent
        if nil == L1_2 then
          L1_2 = L1_1
          L1_2()
        end
      end
    end
  end
end
L2_1(L3_1)