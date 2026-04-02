local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1
L0_1 = Config
L0_1 = L0_1.Jobs
L0_1 = L0_1.project_car
L1_1 = {}
L2_1 = {}
L3_1 = RegisterNetEvent
L4_1 = "wais:projectcar:startProject"
function L5_1(A0_2)
  local L1_2, L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2
  L1_2 = source
  L2_2 = tostring
  L3_2 = L1_2
  L2_2 = L2_2(L3_2)
  L3_2 = sourcesGroup
  L3_2 = L3_2[L2_2]
  if nil ~= L3_2 then
    L3_2 = Groups
    L4_2 = sourcesGroup
    L4_2 = L4_2[L2_2]
    L3_2 = L3_2[L4_2]
    L3_2 = L3_2.groupId
    if L3_2 then
      goto lbl_17
    end
  end
  L3_2 = nil
  ::lbl_17::
  L4_2 = L1_1
  L4_2 = L4_2[A0_2]
  L4_2.source = L1_2
  L4_2 = L1_1
  L4_2 = L4_2[A0_2]
  L4_2.groupId = L3_2
  if L3_2 then
    L4_2 = Groups
    L5_2 = sourcesGroup
    L5_2 = L5_2[L2_2]
    L4_2 = L4_2[L5_2]
    L4_2 = L4_2.SetEventIndex
    L5_2 = A0_2
    L4_2(L5_2)
    L4_2 = pairs
    L5_2 = L0_1.car_list
    L5_2 = L5_2[A0_2]
    L5_2 = L5_2.project_details
    L5_2 = L5_2.tyre_positions
    L4_2, L5_2, L6_2, L7_2 = L4_2(L5_2)
    for L8_2, L9_2 in L4_2, L5_2, L6_2, L7_2 do
      L10_2 = L1_1
      L10_2 = L10_2[A0_2]
      L10_2 = L10_2.tyres
      L11_2 = {}
      L12_2 = L9_2.tyre_index
      L11_2.index = L12_2
      L11_2.isBusy = false
      L11_2.isFixed = false
      L10_2[L8_2] = L11_2
    end
    L4_2 = pairs
    L5_2 = L0_1.car_list
    L5_2 = L5_2[A0_2]
    L5_2 = L5_2.project_details
    L5_2 = L5_2.door_positions
    L4_2, L5_2, L6_2, L7_2 = L4_2(L5_2)
    for L8_2, L9_2 in L4_2, L5_2, L6_2, L7_2 do
      L10_2 = L1_1
      L10_2 = L10_2[A0_2]
      L10_2 = L10_2.doors
      L11_2 = {}
      L12_2 = L9_2.door_index
      L11_2.index = L12_2
      L11_2.isFixed = false
      L10_2[L8_2] = L11_2
    end
  end
  L4_2 = TriggerClientEvent
  L5_2 = "wais:projectcar:startProject"
  L6_2 = -1
  L7_2 = A0_2
  if L3_2 then
    L8_2 = {}
    L8_2.type = "group"
    L8_2.id = L3_2
    if L8_2 then
      goto lbl_90
    end
  end
  L8_2 = {}
  L8_2.type = "player"
  L9_2 = tostring
  L10_2 = L1_2
  L9_2 = L9_2(L10_2)
  L8_2.id = L9_2
  ::lbl_90::
  L4_2(L5_2, L6_2, L7_2, L8_2)
end
L3_1(L4_1, L5_1)
L3_1 = RegisterNetEvent
L4_1 = "wais:projectcar:group:changeWheel:busyState"
function L5_1(A0_2, A1_2, A2_2, A3_2)
  local L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2
  L4_2 = source
  L5_2 = tostring
  L6_2 = L4_2
  L5_2 = L5_2(L6_2)
  L6_2 = sourcesGroup
  L6_2 = L6_2[L5_2]
  if nil ~= L6_2 then
    L6_2 = Groups
    L7_2 = sourcesGroup
    L7_2 = L7_2[L5_2]
    L6_2 = L6_2[L7_2]
    L6_2 = L6_2.groupId
    if L6_2 then
      goto lbl_17
    end
  end
  L6_2 = nil
  ::lbl_17::
  if L6_2 then
    L7_2 = Groups
    L8_2 = sourcesGroup
    L8_2 = L8_2[L5_2]
    L7_2 = L7_2[L8_2]
    L7_2 = L7_2.TriggerGroupEvent
    L8_2 = "wais:projectcar:group:changeWheel:busyState"
    L9_2 = A0_2
    L10_2 = A1_2
    L11_2 = A2_2
    L12_2 = A3_2
    L7_2(L8_2, L9_2, L10_2, L11_2, L12_2)
  end
end
L3_1(L4_1, L5_1)
L3_1 = RegisterNetEvent
L4_1 = "wais:projectcar:changeWheel:fixState"
function L5_1(A0_2, A1_2, A2_2, A3_2)
  local L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2
  L4_2 = source
  L5_2 = tostring
  L6_2 = L4_2
  L5_2 = L5_2(L6_2)
  L6_2 = sourcesGroup
  L6_2 = L6_2[L5_2]
  if nil ~= L6_2 then
    L6_2 = Groups
    L7_2 = sourcesGroup
    L7_2 = L7_2[L5_2]
    L6_2 = L6_2[L7_2]
    L6_2 = L6_2.groupId
    if L6_2 then
      goto lbl_17
    end
  end
  L6_2 = nil
  ::lbl_17::
  L7_2 = TriggerClientEvent
  L8_2 = "wais:projectcar:changeWheel:fixState"
  L9_2 = -1
  L10_2 = A0_2
  L11_2 = A1_2
  L12_2 = A2_2
  L13_2 = A3_2
  L7_2(L8_2, L9_2, L10_2, L11_2, L12_2, L13_2)
  if L6_2 then
    L7_2 = true
    L8_2 = L1_1
    L8_2 = L8_2[A1_2]
    L8_2 = L8_2.tyres
    L8_2 = L8_2[A2_2]
    L8_2.isFixed = A3_2
    L8_2 = pairs
    L9_2 = L1_1
    L9_2 = L9_2[A1_2]
    L9_2 = L9_2.tyres
    L8_2, L9_2, L10_2, L11_2 = L8_2(L9_2)
    for L12_2, L13_2 in L8_2, L9_2, L10_2, L11_2 do
      L14_2 = L13_2.isFixed
      if not L14_2 then
        L7_2 = false
        break
      end
    end
    if L7_2 then
      L8_2 = L1_1
      L8_2 = L8_2[A1_2]
      L8_2.tyresFixed = true
      L8_2 = Groups
      L9_2 = sourcesGroup
      L9_2 = L9_2[L5_2]
      L8_2 = L8_2[L9_2]
      L8_2 = L8_2.TriggerGroupEvent
      L9_2 = "wais:showNotification"
      L10_2 = Lang
      L11_2 = "all_tyres_mounted"
      L10_2 = L10_2(L11_2)
      L11_2 = "success"
      L12_2 = 7500
      L8_2(L9_2, L10_2, L11_2, L12_2)
      L8_2 = L1_1
      L8_2 = L8_2[A1_2]
      L8_2 = L8_2.doorsFixed
      if L8_2 then
        L8_2 = math
        L8_2 = L8_2.randomseed
        L9_2 = GetGameTimer
        L9_2, L10_2, L11_2, L12_2, L13_2, L14_2 = L9_2()
        L8_2(L9_2, L10_2, L11_2, L12_2, L13_2, L14_2)
        L8_2 = type
        L9_2 = L0_1.car_list
        L9_2 = L9_2[A1_2]
        L9_2 = L9_2.project_details
        L9_2 = L9_2.reward
        L8_2 = L8_2(L9_2)
        if "table" == L8_2 then
          L8_2 = math
          L8_2 = L8_2.random
          L9_2 = L0_1.car_list
          L9_2 = L9_2[A1_2]
          L9_2 = L9_2.project_details
          L9_2 = L9_2.reward
          L9_2 = L9_2.min
          L10_2 = L0_1.car_list
          L10_2 = L10_2[A1_2]
          L10_2 = L10_2.project_details
          L10_2 = L10_2.reward
          L10_2 = L10_2.max
          L8_2 = L8_2(L9_2, L10_2)
          if L8_2 then
            goto lbl_101
          end
        end
        L8_2 = L0_1.car_list
        L8_2 = L8_2[A1_2]
        L8_2 = L8_2.project_details
        L8_2 = L8_2.reward
        ::lbl_101::
        L9_2 = print
        L10_2 = "Reward for project %s: %s"
        L11_2 = L10_2
        L10_2 = L10_2.format
        L12_2 = A1_2
        L13_2 = L8_2
        L10_2, L11_2, L12_2, L13_2, L14_2 = L10_2(L11_2, L12_2, L13_2)
        L9_2(L10_2, L11_2, L12_2, L13_2, L14_2)
        L9_2 = Groups
        L10_2 = sourcesGroup
        L10_2 = L10_2[L5_2]
        L9_2 = L9_2[L10_2]
        L9_2 = L9_2.GiveGroupReward
        L10_2 = L8_2
        L11_2 = L0_1.car_list
        L11_2 = L11_2[A1_2]
        L11_2 = L11_2.project_details
        L11_2 = L11_2.split_reward_members
        L9_2(L10_2, L11_2)
        L9_2 = Groups
        L10_2 = sourcesGroup
        L10_2 = L10_2[L5_2]
        L9_2 = L9_2[L10_2]
        L9_2 = L9_2.SetEventIndex
        L10_2 = nil
        L9_2(L10_2)
        L9_2 = L1_1
        L9_2[A1_2] = nil
        L9_2 = tostring
        L10_2 = Groups
        L11_2 = sourcesGroup
        L11_2 = L11_2[L5_2]
        L10_2 = L10_2[L11_2]
        L10_2 = L10_2.ownerId
        L9_2 = L9_2(L10_2)
        L10_2 = L2_1
        L10_2[L9_2] = nil
        L9_2 = TriggerClientEvent
        L10_2 = "wais:projectcar:projectFinished"
        L11_2 = -1
        L12_2 = A0_2
        L13_2 = A1_2
        L9_2(L10_2, L11_2, L12_2, L13_2)
      end
    end
  end
end
L3_1(L4_1, L5_1)
L3_1 = RegisterNetEvent
L4_1 = "wais:projectcar:group:changeDoor:busyState"
function L5_1(A0_2, A1_2, A2_2, A3_2)
  local L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2
  L4_2 = source
  L5_2 = tostring
  L6_2 = L4_2
  L5_2 = L5_2(L6_2)
  L6_2 = sourcesGroup
  L6_2 = L6_2[L5_2]
  if nil ~= L6_2 then
    L6_2 = Groups
    L7_2 = sourcesGroup
    L7_2 = L7_2[L5_2]
    L6_2 = L6_2[L7_2]
    L6_2 = L6_2.groupId
    if L6_2 then
      goto lbl_17
    end
  end
  L6_2 = nil
  ::lbl_17::
  if L6_2 then
    L7_2 = Groups
    L8_2 = sourcesGroup
    L8_2 = L8_2[L5_2]
    L7_2 = L7_2[L8_2]
    L7_2 = L7_2.TriggerGroupEvent
    L8_2 = "wais:projectcar:group:changeDoor:busyState"
    L9_2 = A0_2
    L10_2 = A1_2
    L11_2 = A2_2
    L12_2 = A3_2
    L7_2(L8_2, L9_2, L10_2, L11_2, L12_2)
  end
end
L3_1(L4_1, L5_1)
L3_1 = RegisterNetEvent
L4_1 = "wais:projectcar:changeDoor:fixState"
function L5_1(A0_2, A1_2, A2_2, A3_2)
  local L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2
  L4_2 = source
  L5_2 = tostring
  L6_2 = L4_2
  L5_2 = L5_2(L6_2)
  L6_2 = sourcesGroup
  L6_2 = L6_2[L5_2]
  if nil ~= L6_2 then
    L6_2 = Groups
    L7_2 = sourcesGroup
    L7_2 = L7_2[L5_2]
    L6_2 = L6_2[L7_2]
    L6_2 = L6_2.groupId
    if L6_2 then
      goto lbl_17
    end
  end
  L6_2 = nil
  ::lbl_17::
  L7_2 = TriggerClientEvent
  L8_2 = "wais:projectcar:changeDoor:fixState"
  L9_2 = -1
  L10_2 = A0_2
  L11_2 = A1_2
  L12_2 = A2_2
  L13_2 = A3_2
  L7_2(L8_2, L9_2, L10_2, L11_2, L12_2, L13_2)
  if L6_2 then
    L7_2 = true
    L8_2 = L1_1
    L8_2 = L8_2[A1_2]
    L8_2 = L8_2.doors
    L8_2 = L8_2[A2_2]
    L8_2.isFixed = A3_2
    L8_2 = pairs
    L9_2 = L1_1
    L9_2 = L9_2[A1_2]
    L9_2 = L9_2.doors
    L8_2, L9_2, L10_2, L11_2 = L8_2(L9_2)
    for L12_2, L13_2 in L8_2, L9_2, L10_2, L11_2 do
      L14_2 = L13_2.isFixed
      if not L14_2 then
        L7_2 = false
        break
      end
    end
    if L7_2 then
      L8_2 = L1_1
      L8_2 = L8_2[A1_2]
      L8_2.doorsFixed = true
      L8_2 = Groups
      L9_2 = sourcesGroup
      L9_2 = L9_2[L5_2]
      L8_2 = L8_2[L9_2]
      L8_2 = L8_2.TriggerGroupEvent
      L9_2 = "wais:showNotification"
      L10_2 = Lang
      L11_2 = "all_doors_fixed"
      L10_2 = L10_2(L11_2)
      L11_2 = "success"
      L12_2 = 7500
      L8_2(L9_2, L10_2, L11_2, L12_2)
      L8_2 = L1_1
      L8_2 = L8_2[A1_2]
      L8_2 = L8_2.tyresFixed
      if L8_2 then
        L8_2 = math
        L8_2 = L8_2.randomseed
        L9_2 = GetGameTimer
        L9_2, L10_2, L11_2, L12_2, L13_2, L14_2 = L9_2()
        L8_2(L9_2, L10_2, L11_2, L12_2, L13_2, L14_2)
        L8_2 = type
        L9_2 = L0_1.car_list
        L9_2 = L9_2[A1_2]
        L9_2 = L9_2.project_details
        L9_2 = L9_2.reward
        L8_2 = L8_2(L9_2)
        if "table" == L8_2 then
          L8_2 = math
          L8_2 = L8_2.random
          L9_2 = L0_1.car_list
          L9_2 = L9_2[A1_2]
          L9_2 = L9_2.project_details
          L9_2 = L9_2.reward
          L9_2 = L9_2.min
          L10_2 = L0_1.car_list
          L10_2 = L10_2[A1_2]
          L10_2 = L10_2.project_details
          L10_2 = L10_2.reward
          L10_2 = L10_2.max
          L8_2 = L8_2(L9_2, L10_2)
          if L8_2 then
            goto lbl_101
          end
        end
        L8_2 = L0_1.car_list
        L8_2 = L8_2[A1_2]
        L8_2 = L8_2.project_details
        L8_2 = L8_2.reward
        ::lbl_101::
        L9_2 = print
        L10_2 = "Reward for project %s: %s"
        L11_2 = L10_2
        L10_2 = L10_2.format
        L12_2 = A1_2
        L13_2 = L8_2
        L10_2, L11_2, L12_2, L13_2, L14_2 = L10_2(L11_2, L12_2, L13_2)
        L9_2(L10_2, L11_2, L12_2, L13_2, L14_2)
        L9_2 = Groups
        L10_2 = sourcesGroup
        L10_2 = L10_2[L5_2]
        L9_2 = L9_2[L10_2]
        L9_2 = L9_2.GiveGroupReward
        L10_2 = L8_2
        L11_2 = L0_1.car_list
        L11_2 = L11_2[A1_2]
        L11_2 = L11_2.project_details
        L11_2 = L11_2.split_reward_members
        L9_2(L10_2, L11_2)
        L9_2 = Groups
        L10_2 = sourcesGroup
        L10_2 = L10_2[L5_2]
        L9_2 = L9_2[L10_2]
        L9_2 = L9_2.SetEventIndex
        L10_2 = nil
        L9_2(L10_2)
        L9_2 = L1_1
        L9_2[A1_2] = nil
        L9_2 = tostring
        L10_2 = Groups
        L11_2 = sourcesGroup
        L11_2 = L11_2[L5_2]
        L10_2 = L10_2[L11_2]
        L10_2 = L10_2.ownerId
        L9_2 = L9_2(L10_2)
        L10_2 = L2_1
        L10_2[L9_2] = nil
        L9_2 = TriggerClientEvent
        L10_2 = "wais:projectcar:projectFinished"
        L11_2 = -1
        L12_2 = A0_2
        L13_2 = A1_2
        L9_2(L10_2, L11_2, L12_2, L13_2)
      end
    end
  end
end
L3_1(L4_1, L5_1)
L3_1 = RegisterNetEvent
L4_1 = "wais:projectcar:components:buy"
function L5_1(A0_2, A1_2, A2_2, A3_2)
  local L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2
  L4_2 = source
  L5_2 = Config
  L5_2 = L5_2.Framework
  L5_2 = L5_2.Framework
  if "esx" == L5_2 then
    L5_2 = wFramework
    L5_2 = L5_2.GetPlayerFromId
    L6_2 = L4_2
    L5_2 = L5_2(L6_2)
    if L5_2 then
      goto lbl_28
    end
  end
  L5_2 = Config
  L5_2 = L5_2.Framework
  L5_2 = L5_2.Framework
  if "qbcore" == L5_2 then
    L5_2 = wFramework
    L5_2 = L5_2.Functions
    L5_2 = L5_2.GetPlayer
    L6_2 = L4_2
    L5_2 = L5_2(L6_2)
    if L5_2 then
      goto lbl_28
    end
  end
  L5_2 = getPlayerFromQbx
  L6_2 = L4_2
  L5_2 = L5_2(L6_2)
  ::lbl_28::
  L6_2 = getJob
  L7_2 = L5_2
  L8_2 = A0_2
  L6_2 = L6_2(L7_2, L8_2)
  if L6_2 == A0_2 then
    L6_2 = L0_1.car_list
    L6_2 = L6_2[A1_2]
    if nil == L6_2 then
      L6_2 = print
      L7_2 = "The project index is not found in the configuration file. Source: %s - Project Index: %s"
      L8_2 = L7_2
      L7_2 = L7_2.format
      L9_2 = L4_2
      L10_2 = A1_2
      L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2 = L7_2(L8_2, L9_2, L10_2)
      L6_2(L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2)
      L6_2 = DropPlayer
      L7_2 = L4_2
      L8_2 = "Something went wrong"
      return L6_2(L7_2, L8_2)
    end
    L6_2 = GetPlayerPed
    L7_2 = L4_2
    L6_2 = L6_2(L7_2)
    L7_2 = GetEntityCoords
    L8_2 = L6_2
    L7_2 = L7_2(L8_2)
    L8_2 = L0_1.car_list
    L8_2 = L8_2[A1_2]
    L8_2 = L8_2.vehicle_parts_store
    L8_2 = L8_2.npc
    L8_2 = L8_2.coords
    L9_2 = vec3
    L10_2 = L8_2.x
    L11_2 = L8_2.y
    L12_2 = L8_2.z
    L9_2 = L9_2(L10_2, L11_2, L12_2)
    L9_2 = L7_2 - L9_2
    L9_2 = #L9_2
    if L9_2 <= 7.0 then
      L10_2 = L0_1.car_list
      L10_2 = L10_2[A1_2]
      L10_2 = L10_2.vehicle_parts_store
      L10_2 = L10_2.parts
      L10_2 = L10_2[A2_2]
      L11_2 = L10_2.price
      L11_2 = L11_2 * A3_2
      L12_2 = ConfigSv
      L12_2 = L12_2.GetMoney
      L13_2 = L4_2
      L12_2 = L12_2(L13_2)
      if L11_2 <= L12_2 then
        L12_2 = ConfigSv
        L12_2 = L12_2.RemoveMoney
        L13_2 = L4_2
        L14_2 = L11_2
        L12_2 = L12_2(L13_2, L14_2)
        if L12_2 then
          L12_2 = ConfigSv
          L12_2 = L12_2.AddItem
          L13_2 = L4_2
          L14_2 = L10_2.item_name
          L15_2 = A3_2
          L12_2(L13_2, L14_2, L15_2)
          L12_2 = TriggerClientEvent
          L13_2 = "wais:showNotification"
          L14_2 = L4_2
          L15_2 = Lang
          L16_2 = "item_bought"
          L15_2 = L15_2(L16_2)
          L16_2 = "success"
          L17_2 = 7500
          L12_2(L13_2, L14_2, L15_2, L16_2, L17_2)
        end
      else
        L12_2 = TriggerClientEvent
        L13_2 = "wais:showNotification"
        L14_2 = L4_2
        L15_2 = Lang
        L16_2 = "not_enough_money"
        L15_2 = L15_2(L16_2)
        L16_2 = "error"
        L17_2 = 7500
        L12_2(L13_2, L14_2, L15_2, L16_2, L17_2)
      end
    else
      L10_2 = print
      L11_2 = "The player is too far away from the menu and tried to take money. Could be cheating. Source: %s - Distance: %s"
      L12_2 = L11_2
      L11_2 = L11_2.format
      L13_2 = L4_2
      L14_2 = L9_2
      L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2 = L11_2(L12_2, L13_2, L14_2)
      L10_2(L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2)
      L10_2 = DropPlayer
      L11_2 = L4_2
      L12_2 = "Something went wrong"
      L10_2(L11_2, L12_2)
    end
  else
    L6_2 = print
    L7_2 = "The user's Job is not the same as the job for which it wants to receive the award. Source: %s - Coming Job: %s"
    L8_2 = L7_2
    L7_2 = L7_2.format
    L9_2 = L4_2
    L10_2 = A0_2
    L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2 = L7_2(L8_2, L9_2, L10_2)
    L6_2(L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2)
    L6_2 = DropPlayer
    L7_2 = L4_2
    L8_2 = "Something went wrong"
    L6_2(L7_2, L8_2)
  end
end
L3_1(L4_1, L5_1)
L3_1 = RegisterNetEvent
L4_1 = "wais:projectcar:projectFinished"
function L5_1(A0_2, A1_2, A2_2)
  local L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2
  L3_2 = source
  L4_2 = Config
  L4_2 = L4_2.Framework
  L4_2 = L4_2.Framework
  if "esx" == L4_2 then
    L4_2 = wFramework
    L4_2 = L4_2.GetPlayerFromId
    L5_2 = L3_2
    L4_2 = L4_2(L5_2)
    if L4_2 then
      goto lbl_28
    end
  end
  L4_2 = Config
  L4_2 = L4_2.Framework
  L4_2 = L4_2.Framework
  if "qbcore" == L4_2 then
    L4_2 = wFramework
    L4_2 = L4_2.Functions
    L4_2 = L4_2.GetPlayer
    L5_2 = L3_2
    L4_2 = L4_2(L5_2)
    if L4_2 then
      goto lbl_28
    end
  end
  L4_2 = getPlayerFromQbx
  L5_2 = L3_2
  L4_2 = L4_2(L5_2)
  ::lbl_28::
  L5_2 = getJob
  L6_2 = L4_2
  L7_2 = A0_2
  L5_2 = L5_2(L6_2, L7_2)
  if L5_2 == A0_2 then
    L5_2 = L0_1.car_list
    L5_2 = L5_2[A2_2]
    if nil == L5_2 then
      L5_2 = print
      L6_2 = "The project index is not found in the configuration file. Source: %s - Project Index: %s"
      L7_2 = L6_2
      L6_2 = L6_2.format
      L8_2 = L3_2
      L9_2 = A2_2
      L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2 = L6_2(L7_2, L8_2, L9_2)
      L5_2(L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2)
      L5_2 = DropPlayer
      L6_2 = L3_2
      L7_2 = "Something went wrong"
      return L5_2(L6_2, L7_2)
    end
    L5_2 = GetPlayerPed
    L6_2 = L3_2
    L5_2 = L5_2(L6_2)
    L6_2 = GetEntityCoords
    L7_2 = L5_2
    L6_2 = L6_2(L7_2)
    L7_2 = L0_1.car_list
    L7_2 = L7_2[A2_2]
    L7_2 = L7_2.project_details
    L7_2 = L7_2.craft_coord
    L8_2 = vec3
    L9_2 = L7_2.x
    L10_2 = L7_2.y
    L11_2 = L7_2.z
    L8_2 = L8_2(L9_2, L10_2, L11_2)
    L8_2 = L6_2 - L8_2
    L8_2 = #L8_2
    if L8_2 <= 20.0 then
      L9_2 = type
      L10_2 = L0_1.car_list
      L10_2 = L10_2[A2_2]
      L10_2 = L10_2.project_details
      L10_2 = L10_2.reward
      L9_2 = L9_2(L10_2)
      if "table" == L9_2 then
        L9_2 = math
        L9_2 = L9_2.random
        L10_2 = L0_1.car_list
        L10_2 = L10_2[A2_2]
        L10_2 = L10_2.project_details
        L10_2 = L10_2.reward
        L10_2 = L10_2.min
        L11_2 = L0_1.car_list
        L11_2 = L11_2[A2_2]
        L11_2 = L11_2.project_details
        L11_2 = L11_2.reward
        L11_2 = L11_2.max
        L9_2 = L9_2(L10_2, L11_2)
        if L9_2 then
          goto lbl_97
        end
      end
      L9_2 = L0_1.car_list
      L9_2 = L9_2[A2_2]
      L9_2 = L9_2.project_details
      L9_2 = L9_2.reward
      ::lbl_97::
      L10_2 = ConfigSv
      L10_2 = L10_2.AddMoney
      L11_2 = L3_2
      L12_2 = L9_2
      L13_2 = "project car"
      L10_2(L11_2, L12_2, L13_2)
    else
      L9_2 = print
      L10_2 = "The player is too far away from the menu and tried to take money. Could be cheating. Source: %s - Distance: %s"
      L11_2 = L10_2
      L10_2 = L10_2.format
      L12_2 = L3_2
      L13_2 = L8_2
      L10_2, L11_2, L12_2, L13_2 = L10_2(L11_2, L12_2, L13_2)
      L9_2(L10_2, L11_2, L12_2, L13_2)
      L9_2 = DropPlayer
      L10_2 = L3_2
      L11_2 = "Something went wrong"
      L9_2(L10_2, L11_2)
    end
  else
    L5_2 = print
    L6_2 = "The user's Job is not the same as the job for which it wants to receive the award. Source: %s - Coming Job: %s"
    L7_2 = L6_2
    L6_2 = L6_2.format
    L8_2 = L3_2
    L9_2 = A0_2
    L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2 = L6_2(L7_2, L8_2, L9_2)
    L5_2(L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2)
    L5_2 = DropPlayer
    L6_2 = L3_2
    L7_2 = "Something went wrong"
    L5_2(L6_2, L7_2)
  end
  L5_2 = L1_1
  L5_2[A2_2] = nil
  L5_2 = tostring
  L6_2 = L3_2
  L5_2 = L5_2(L6_2)
  L6_2 = L2_1
  L6_2[L5_2] = nil
  L5_2 = TriggerClientEvent
  L6_2 = "wais:projectcar:projectFinished"
  L7_2 = -1
  L8_2 = A1_2
  L9_2 = A2_2
  L5_2(L6_2, L7_2, L8_2, L9_2)
end
L3_1(L4_1, L5_1)
L3_1 = RegisterNetEvent
L4_1 = "wais:projectcar:groupDeleted"
function L5_1(A0_2, A1_2)
  local L2_2, L3_2, L4_2, L5_2, L6_2, L7_2
  L2_2 = L1_1
  L2_2[A1_2] = nil
  L2_2 = tostring
  L3_2 = A0_2
  L2_2 = L2_2(L3_2)
  L3_2 = L2_1
  L3_2[L2_2] = nil
  L2_2 = TriggerClientEvent
  L3_2 = "wais:projectcar:projectFinished"
  L4_2 = -1
  L5_2 = src
  L6_2 = nil
  L7_2 = A1_2
  L2_2(L3_2, L4_2, L5_2, L6_2, L7_2)
end
L3_1(L4_1, L5_1)
L3_1 = RegisterNetEvent
L4_1 = "wais:projectcar:cancelProject"
function L5_1(A0_2, A1_2)
  local L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2
  L2_2 = source
  L3_2 = L1_1
  L3_2[A1_2] = nil
  L3_2 = tostring
  L4_2 = L2_2
  L3_2 = L3_2(L4_2)
  L4_2 = L2_1
  L4_2[L3_2] = nil
  L3_2 = TriggerClientEvent
  L4_2 = "wais:projectcar:projectFinished"
  L5_2 = -1
  L6_2 = A0_2
  L7_2 = A1_2
  L8_2 = true
  L3_2(L4_2, L5_2, L6_2, L7_2, L8_2)
end
L3_1(L4_1, L5_1)
L3_1 = AddEventHandler
L4_1 = "playerDropped"
function L5_1(A0_2)
  local L1_2, L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2
  L1_2 = source
  L2_2 = tostring
  L3_2 = L1_2
  L2_2 = L2_2(L3_2)
  L3_2 = L2_1
  L2_2 = L3_2[L2_2]
  if nil ~= L2_2 then
    L2_2 = tostring
    L3_2 = L1_2
    L2_2 = L2_2(L3_2)
    L3_2 = L2_1
    L3_2 = L3_2[L2_2]
    L2_2 = L1_1
    L2_2[L3_2] = nil
    L2_2 = TriggerClientEvent
    L3_2 = "wais:projectcar:projectFinished"
    L4_2 = -1
    L5_2 = L1_2
    L6_2 = nil
    L7_2 = tostring
    L8_2 = L1_2
    L7_2 = L7_2(L8_2)
    L8_2 = L2_1
    L7_2 = L8_2[L7_2]
    L2_2(L3_2, L4_2, L5_2, L6_2, L7_2)
  end
end
L3_1(L4_1, L5_1)
L3_1 = lib
L3_1 = L3_1.callback
L3_1 = L3_1.register
L4_1 = "wais:projectcar:checkBusy"
function L5_1(A0_2, A1_2)
  local L2_2, L3_2, L4_2, L5_2
  L2_2 = L1_1
  L2_2 = L2_2[A1_2]
  if nil ~= L2_2 then
    L2_2 = true
    return L2_2
  end
  L2_2 = L1_1
  L3_2 = {}
  L3_2.index = A1_2
  L3_2.source = A0_2
  L3_2.tyresFixed = false
  L3_2.doorsFixed = false
  L4_2 = {}
  L3_2.doors = L4_2
  L4_2 = {}
  L3_2.tyres = L4_2
  L4_2 = sourcesGroup
  L4_2 = L4_2[A0_2]
  if nil ~= L4_2 then
    L4_2 = Groups
    L5_2 = sourcesGroup
    L5_2 = L5_2[A0_2]
    L4_2 = L4_2[L5_2]
    L4_2 = L4_2.groupId
    if L4_2 then
      goto lbl_32
    end
  end
  L4_2 = nil
  ::lbl_32::
  L3_2.groupId = L4_2
  L2_2[A1_2] = L3_2
  L2_2 = tostring
  L3_2 = A0_2
  L2_2 = L2_2(L3_2)
  L3_2 = L2_1
  L3_2[L2_2] = A1_2
  L2_2 = false
  return L2_2
end
L3_1(L4_1, L5_1)