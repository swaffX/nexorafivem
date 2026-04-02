local L0_1, L1_1, L2_1, L3_1, L4_1
L0_1 = {}
L1_1 = {}
L2_1 = RegisterNetEvent
L3_1 = "wais:giveRoadhelper:reward"
function L4_1(A0_2, A1_2)
  local L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2
  L2_2 = source
  L3_2 = Config
  L3_2 = L3_2.Framework
  L3_2 = L3_2.Framework
  if "esx" == L3_2 then
    L3_2 = wFramework
    L3_2 = L3_2.GetPlayerFromId
    L4_2 = L2_2
    L3_2 = L3_2(L4_2)
    if L3_2 then
      goto lbl_28
    end
  end
  L3_2 = Config
  L3_2 = L3_2.Framework
  L3_2 = L3_2.Framework
  if "qbcore" == L3_2 then
    L3_2 = wFramework
    L3_2 = L3_2.Functions
    L3_2 = L3_2.GetPlayer
    L4_2 = L2_2
    L3_2 = L3_2(L4_2)
    if L3_2 then
      goto lbl_28
    end
  end
  L3_2 = getPlayerFromQbx
  L4_2 = L2_2
  L3_2 = L3_2(L4_2)
  ::lbl_28::
  L4_2 = Config
  L4_2 = L4_2.Jobs
  L4_2 = L4_2.roadhelper
  L4_2 = L4_2.randomEvents
  L4_2 = L4_2.events
  L4_2 = L4_2[A1_2]
  if nil == L4_2 then
    L4_2 = print
    L5_2 = "The event index is not found in the configuration file. Source: %s - Event Index: %s"
    L6_2 = L5_2
    L5_2 = L5_2.format
    L7_2 = L2_2
    L8_2 = A1_2
    L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2 = L5_2(L6_2, L7_2, L8_2)
    L4_2(L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2)
    L4_2 = DropPlayer
    L5_2 = L2_2
    L6_2 = "Something went wrong"
    return L4_2(L5_2, L6_2)
  end
  L4_2 = getJob
  L5_2 = L3_2
  L6_2 = A0_2
  L4_2 = L4_2(L5_2, L6_2)
  if L4_2 == A0_2 then
    L4_2 = GetPlayerPed
    L5_2 = L2_2
    L4_2 = L4_2(L5_2)
    L5_2 = GetEntityCoords
    L6_2 = L4_2
    L5_2 = L5_2(L6_2)
    L6_2 = Config
    L6_2 = L6_2.Jobs
    L6_2 = L6_2.roadhelper
    L6_2 = L6_2.randomEvents
    L6_2 = L6_2.events
    L6_2 = L6_2[A1_2]
    L7_2 = L6_2.type
    if "towing" == L7_2 then
      L7_2 = L6_2.delivery_coords
      if L7_2 then
        goto lbl_80
      end
    end
    L7_2 = Config
    L7_2 = L7_2.Jobs
    L7_2 = L7_2.roadhelper
    L7_2 = L7_2.randomEvents
    L7_2 = L7_2.events
    L7_2 = L7_2[A1_2]
    L7_2 = L7_2.car_stuff
    L7_2 = L7_2.coords
    ::lbl_80::
    L8_2 = vec3
    L9_2 = L7_2.x
    L10_2 = L7_2.y
    L11_2 = L7_2.z
    L8_2 = L8_2(L9_2, L10_2, L11_2)
    L8_2 = L5_2 - L8_2
    L8_2 = #L8_2
    if L8_2 <= 20.0 then
      L9_2 = math
      L9_2 = L9_2.randomseed
      L10_2 = GetGameTimer
      L10_2, L11_2, L12_2, L13_2 = L10_2()
      L9_2(L10_2, L11_2, L12_2, L13_2)
      L9_2 = type
      L10_2 = Config
      L10_2 = L10_2.Jobs
      L10_2 = L10_2.roadhelper
      L10_2 = L10_2.randomEvents
      L10_2 = L10_2.events
      L10_2 = L10_2[A1_2]
      L10_2 = L10_2.reward
      L9_2 = L9_2(L10_2)
      if "table" == L9_2 then
        L9_2 = math
        L9_2 = L9_2.random
        L10_2 = Config
        L10_2 = L10_2.Jobs
        L10_2 = L10_2.roadhelper
        L10_2 = L10_2.randomEvents
        L10_2 = L10_2.events
        L10_2 = L10_2[A1_2]
        L10_2 = L10_2.reward
        L10_2 = L10_2.min
        L11_2 = Config
        L11_2 = L11_2.Jobs
        L11_2 = L11_2.roadhelper
        L11_2 = L11_2.randomEvents
        L11_2 = L11_2.events
        L11_2 = L11_2[A1_2]
        L11_2 = L11_2.reward
        L11_2 = L11_2.max
        L9_2 = L9_2(L10_2, L11_2)
        if L9_2 then
          goto lbl_134
        end
      end
      L9_2 = Config
      L9_2 = L9_2.Jobs
      L9_2 = L9_2.roadhelper
      L9_2 = L9_2.randomEvents
      L9_2 = L9_2.events
      L9_2 = L9_2[A1_2]
      L9_2 = L9_2.reward
      ::lbl_134::
      L10_2 = ConfigSv
      L10_2 = L10_2.AddMoney
      L11_2 = L2_2
      L12_2 = L9_2
      L13_2 = "roadhelper"
      L10_2(L11_2, L12_2, L13_2)
    else
      L9_2 = print
      L10_2 = "The player is too far away from the menu and tried to take money. Could be cheating. Source: %s - Distance: %s"
      L11_2 = L10_2
      L10_2 = L10_2.format
      L12_2 = L2_2
      L13_2 = L8_2
      L10_2, L11_2, L12_2, L13_2 = L10_2(L11_2, L12_2, L13_2)
      L9_2(L10_2, L11_2, L12_2, L13_2)
      L9_2 = DropPlayer
      L10_2 = L2_2
      L11_2 = "Something went wrong"
      L9_2(L10_2, L11_2)
    end
  else
    L4_2 = print
    L5_2 = "The user's Job is not the same as the job for which it wants to receive the award. Source: %s - Coming Job: %s"
    L6_2 = L5_2
    L5_2 = L5_2.format
    L7_2 = L2_2
    L8_2 = A0_2
    L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2 = L5_2(L6_2, L7_2, L8_2)
    L4_2(L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2)
    L4_2 = DropPlayer
    L5_2 = L2_2
    L6_2 = "Something went wrong"
    L4_2(L5_2, L6_2)
  end
end
L2_1(L3_1, L4_1)
L2_1 = RegisterNetEvent
L3_1 = "wais:setDefault:RoadState"
function L4_1(A0_2)
  local L1_2, L2_2
  L1_2 = source
  L2_2 = L0_1
  L2_2 = L2_2[A0_2]
  if nil ~= L2_2 then
    L2_2 = L1_1
    L2_2[L1_2] = nil
    L2_2 = L0_1
    L2_2[A0_2] = nil
  end
end
L2_1(L3_1, L4_1)
L2_1 = lib
L2_1 = L2_1.callback
L2_1 = L2_1.register
L3_1 = "wais:raodhelper:checkBusy"
function L4_1(A0_2, A1_2)
  local L2_2
  L2_2 = L0_1
  L2_2 = L2_2[A1_2]
  if nil == L2_2 then
    L2_2 = L0_1
    L2_2[A1_2] = A0_2
    L2_2 = L1_1
    L2_2[A0_2] = A1_2
    L2_2 = false
    return L2_2
  else
    L2_2 = true
    return L2_2
  end
end
L2_1(L3_1, L4_1)