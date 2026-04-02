local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1
L0_1 = Config
L0_1 = L0_1.Jobs
L0_1 = L0_1.diver
L1_1 = {}
L2_1 = {}
L3_1 = RegisterNetEvent
L4_1 = "wais:diver:server:CreateMission"
function L5_1(A0_2)
  local L1_2, L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2
  L1_2 = source
  L2_2 = tostring
  L3_2 = L1_2
  L2_2 = L2_2(L3_2)
  L3_2 = L1_1
  L3_2 = L3_2[A0_2]
  if L3_2 then
    L3_2 = L1_1
    L3_2 = L3_2[A0_2]
    L3_2 = L3_2.groupId
    if L3_2 then
      goto lbl_15
    end
  end
  L3_2 = nil
  ::lbl_15::
  L4_2 = TriggerClientEvent
  L5_2 = "wais:diver:client:CreateMission"
  L6_2 = -1
  L7_2 = A0_2
  if L3_2 then
    L8_2 = {}
    L8_2.type = "group"
    L8_2.id = L3_2
    if L8_2 then
      goto lbl_34
    end
  end
  L8_2 = {}
  L8_2.type = "player"
  L9_2 = tostring
  L10_2 = L1_2
  L9_2 = L9_2(L10_2)
  L8_2.id = L9_2
  ::lbl_34::
  L4_2(L5_2, L6_2, L7_2, L8_2)
end
L3_1(L4_1, L5_1)
L3_1 = RegisterNetEvent
L4_1 = "wais:diver:groupDeleted"
function L5_1(A0_2, A1_2)
  local L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2
  L2_2 = tostring
  L3_2 = A0_2
  L2_2 = L2_2(L3_2)
  L3_2 = L2_1
  L3_2 = L3_2[L2_2]
  if L3_2 then
    L3_2 = L2_1
    L3_2 = L3_2[L2_2]
    L4_2 = TriggerClientEvent
    L5_2 = "wais:diver:mission:deleteMission"
    L6_2 = -1
    L7_2 = L2_2
    L8_2 = L3_2
    L4_2(L5_2, L6_2, L7_2, L8_2)
    L4_2 = L2_1
    L4_2[L2_2] = nil
    L4_2 = L1_1
    L4_2[L3_2] = nil
  end
end
L3_1(L4_1, L5_1)
L3_1 = RegisterNetEvent
L4_1 = "wais:diver:mission:setBusy"
function L5_1(A0_2, A1_2, A2_2, A3_2)
  local L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2
  L4_2 = tostring
  L5_2 = source
  L4_2 = L4_2(L5_2)
  L5_2 = TriggerClientEvent
  L6_2 = "wais:diver:mission:setBusy"
  L7_2 = -1
  L8_2 = A0_2
  L9_2 = A1_2
  L10_2 = A2_2
  L11_2 = A3_2
  L5_2(L6_2, L7_2, L8_2, L9_2, L10_2, L11_2)
end
L3_1(L4_1, L5_1)
L3_1 = RegisterNetEvent
L4_1 = "wais:diver:mission:deleteProp"
function L5_1(A0_2, A1_2, A2_2, A3_2, A4_2)
  local L5_2, L6_2, L7_2, L8_2, L9_2, L10_2
  L5_2 = TriggerClientEvent
  L6_2 = "wais:diver:mission:deleteProp"
  L7_2 = -1
  L8_2 = A0_2
  L9_2 = A1_2
  L10_2 = A2_2
  L5_2(L6_2, L7_2, L8_2, L9_2, L10_2)
  L5_2 = L1_1
  L5_2 = L5_2[A3_2]
  L6_2 = L1_1
  L6_2 = L6_2[A3_2]
  L6_2 = L6_2.collected
  L6_2 = L6_2 + 1
  L5_2.collected = L6_2
  L5_2 = L1_1
  L5_2 = L5_2[A3_2]
  L5_2 = L5_2.collected
  L6_2 = L1_1
  L6_2 = L6_2[A3_2]
  L6_2 = L6_2.mustCollected
  if L5_2 == L6_2 then
    L5_2 = math
    L5_2 = L5_2.randomseed
    L6_2 = GetGameTimer
    L6_2, L7_2, L8_2, L9_2, L10_2 = L6_2()
    L5_2(L6_2, L7_2, L8_2, L9_2, L10_2)
    L5_2 = type
    L6_2 = L0_1.mission_list
    L6_2 = L6_2[A3_2]
    L6_2 = L6_2.reward
    L5_2 = L5_2(L6_2)
    if "table" == L5_2 then
      L5_2 = math
      L5_2 = L5_2.random
      L6_2 = L0_1.mission_list
      L6_2 = L6_2[A3_2]
      L6_2 = L6_2.reward
      L6_2 = L6_2.min
      L7_2 = L0_1.mission_list
      L7_2 = L7_2[A3_2]
      L7_2 = L7_2.reward
      L7_2 = L7_2.max
      L5_2 = L5_2(L6_2, L7_2)
      if L5_2 then
        goto lbl_52
      end
    end
    L5_2 = L0_1.mission_list
    L5_2 = L5_2[A3_2]
    L5_2 = L5_2.reward
    ::lbl_52::
    L6_2 = L5_2 - A4_2
    if L6_2 < 0 then
      L6_2 = Groups
      L6_2 = L6_2[A0_2]
      L6_2 = L6_2.sendGroupNotification
      L7_2 = "wais:showNotification"
      L8_2 = Lang
      L9_2 = "money_reduced_destroyed"
      L8_2 = L8_2(L9_2)
      L9_2 = "inform"
      L10_2 = 5000
      L6_2(L7_2, L8_2, L9_2, L10_2)
    end
    L6_2 = Groups
    L6_2 = L6_2[A0_2]
    L6_2 = L6_2.sendGroupNotification
    L7_2 = Lang
    L8_2 = "diver_mission_completed"
    L7_2 = L7_2(L8_2)
    L8_2 = "success"
    L9_2 = 7500
    L6_2(L7_2, L8_2, L9_2)
    L6_2 = Groups
    L6_2 = L6_2[A0_2]
    L6_2 = L6_2.GiveGroupReward
    L7_2 = L5_2 - A4_2
    L8_2 = L0_1.mission_list
    L8_2 = L8_2[A3_2]
    L8_2 = L8_2.split_reward_members
    L6_2(L7_2, L8_2)
    L6_2 = Groups
    L6_2 = L6_2[A0_2]
    L6_2 = L6_2.SetEvent
    L7_2 = nil
    L6_2(L7_2)
    L6_2 = TriggerClientEvent
    L7_2 = "wais:diver:mission:deleteMission"
    L8_2 = -1
    L9_2 = A0_2
    L10_2 = A1_2
    L6_2(L7_2, L8_2, L9_2, L10_2)
    L6_2 = L1_1
    L6_2 = L6_2[A3_2]
    L7_2 = L6_2.owner
    L6_2 = L2_1
    L6_2[L7_2] = nil
    L6_2 = L1_1
    L6_2[A3_2] = nil
  end
end
L3_1(L4_1, L5_1)
L3_1 = RegisterNetEvent
L4_1 = "wais:diver:mission:finishedSelf"
function L5_1(A0_2, A1_2)
  local L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2
  L2_2 = source
  L3_2 = tostring
  L4_2 = L2_2
  L3_2 = L3_2(L4_2)
  L4_2 = L1_1
  L4_2 = L4_2[A0_2]
  if nil ~= L4_2 then
    L4_2 = L2_1
    L4_2 = L4_2[L3_2]
    if nil ~= L4_2 then
      L4_2 = math
      L4_2 = L4_2.randomseed
      L5_2 = GetGameTimer
      L5_2, L6_2, L7_2, L8_2, L9_2, L10_2 = L5_2()
      L4_2(L5_2, L6_2, L7_2, L8_2, L9_2, L10_2)
      L4_2 = type
      L5_2 = L0_1.mission_list
      L5_2 = L5_2[A0_2]
      L5_2 = L5_2.reward
      L4_2 = L4_2(L5_2)
      if "table" == L4_2 then
        L4_2 = math
        L4_2 = L4_2.random
        L5_2 = L0_1.mission_list
        L5_2 = L5_2[A0_2]
        L5_2 = L5_2.reward
        L5_2 = L5_2.min
        L6_2 = L0_1.mission_list
        L6_2 = L6_2[A0_2]
        L6_2 = L6_2.reward
        L6_2 = L6_2.max
        L4_2 = L4_2(L5_2, L6_2)
        if L4_2 then
          goto lbl_41
        end
      end
      L4_2 = L0_1.mission_list
      L4_2 = L4_2[A0_2]
      L4_2 = L4_2.reward
      ::lbl_41::
      L5_2 = L4_2 - A1_2
      if L5_2 < 0 then
        L5_2 = TriggerClientEvent
        L6_2 = "wais:showNotification"
        L7_2 = L2_2
        L8_2 = Lang
        L9_2 = "money_reduced_destroyed"
        L8_2 = L8_2(L9_2)
        L9_2 = "inform"
        L10_2 = 5000
        L5_2(L6_2, L7_2, L8_2, L9_2, L10_2)
      end
      L5_2 = ConfigSv
      L5_2 = L5_2.AddMoney
      L6_2 = L2_2
      L7_2 = L4_2 - A1_2
      L8_2 = "diver"
      L5_2(L6_2, L7_2, L8_2)
      L5_2 = L1_1
      L5_2[A0_2] = nil
      L5_2 = L2_1
      L5_2[L3_2] = nil
      L5_2 = TriggerClientEvent
      L6_2 = "wais:showNotification"
      L7_2 = L2_2
      L8_2 = Lang
      L9_2 = "diver_mission_completed"
      L8_2 = L8_2(L9_2)
      L9_2 = "success"
      L10_2 = 7500.0
      L5_2(L6_2, L7_2, L8_2, L9_2, L10_2)
    else
      L4_2 = print
      L5_2 = "The player ID was kicked from the server because it could not be found in the divers table. Presumably he tried to get money by cheating. ID: %s"
      L6_2 = L5_2
      L5_2 = L5_2.format
      L7_2 = L2_2
      L5_2, L6_2, L7_2, L8_2, L9_2, L10_2 = L5_2(L6_2, L7_2)
      L4_2(L5_2, L6_2, L7_2, L8_2, L9_2, L10_2)
      L4_2 = DropPlayer
      L5_2 = L2_2
      L6_2 = "Something went wrong"
      L4_2(L5_2, L6_2)
    end
  else
    L4_2 = print
    L5_2 = "The mission index could not be found in the divers table. Presumably he tried to get money by cheating. Mission Index: %s"
    L6_2 = L5_2
    L5_2 = L5_2.format
    L7_2 = A0_2
    L5_2, L6_2, L7_2, L8_2, L9_2, L10_2 = L5_2(L6_2, L7_2)
    L4_2(L5_2, L6_2, L7_2, L8_2, L9_2, L10_2)
    L4_2 = DropPlayer
    L5_2 = L2_2
    L6_2 = "Something went wrong"
    L4_2(L5_2, L6_2)
  end
  L4_2 = L1_1
  L4_2 = L4_2[A0_2]
  if L4_2 then
    L4_2 = L1_1
    L4_2[A0_2] = nil
  end
  L4_2 = L2_1
  L4_2[L3_2] = nil
  L4_2 = TriggerClientEvent
  L5_2 = "wais:diver:mission:deleteMission"
  L6_2 = -1
  L7_2 = L3_2
  L8_2 = A0_2
  L4_2(L5_2, L6_2, L7_2, L8_2)
end
L3_1(L4_1, L5_1)
L3_1 = RegisterNetEvent
L4_1 = "wais:diver:mission:cancel:group"
function L5_1(A0_2)
  local L1_2, L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2
  L1_2 = source
  L2_2 = tostring
  L3_2 = L1_2
  L2_2 = L2_2(L3_2)
  L3_2 = L2_1
  L3_2 = L3_2[L2_2]
  if nil ~= L3_2 then
    L3_2 = L2_1
    L3_2 = L3_2[L2_2]
    L4_2 = L1_1
    L4_2 = L4_2[L3_2]
    L4_2 = L4_2.groupId
    if A0_2 == L4_2 then
      L5_2 = TriggerClientEvent
      L6_2 = "wais:diver:mission:deleteMission"
      L7_2 = -1
      L8_2 = L4_2
      L9_2 = L3_2
      L5_2(L6_2, L7_2, L8_2, L9_2)
      L5_2 = L1_1
      L5_2[L3_2] = nil
      L5_2 = L2_1
      L5_2[L2_2] = nil
    end
  end
end
L3_1(L4_1, L5_1)
L3_1 = RegisterNetEvent
L4_1 = "wais:diver:mission:cancel:self"
function L5_1()
  local L0_2, L1_2, L2_2, L3_2, L4_2, L5_2, L6_2, L7_2
  L0_2 = source
  L1_2 = tostring
  L2_2 = L0_2
  L1_2 = L1_2(L2_2)
  L2_2 = L2_1
  L2_2 = L2_2[L1_2]
  if nil ~= L2_2 then
    L2_2 = L2_1
    L2_2 = L2_2[L1_2]
    L3_2 = TriggerClientEvent
    L4_2 = "wais:diver:mission:deleteMission"
    L5_2 = -1
    L6_2 = L1_2
    L7_2 = L2_2
    L3_2(L4_2, L5_2, L6_2, L7_2)
    L3_2 = L1_1
    L3_2[L2_2] = nil
    L3_2 = L2_1
    L3_2[L1_2] = nil
  end
end
L3_1(L4_1, L5_1)
L3_1 = RegisterNetEvent
L4_1 = "wais:diver:clearBusy"
function L5_1(A0_2)
  local L1_2, L2_2, L3_2
  L1_2 = source
  L2_2 = tostring
  L3_2 = L1_2
  L2_2 = L2_2(L3_2)
  L3_2 = L1_1
  L3_2[A0_2] = nil
end
L3_1(L4_1, L5_1)
L3_1 = AddEventHandler
L4_1 = "playerDropped"
function L5_1(A0_2)
  local L1_2, L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2
  L1_2 = tostring
  L2_2 = source
  L1_2 = L1_2(L2_2)
  L2_2 = L2_1
  L2_2 = L2_2[L1_2]
  if L2_2 then
    L2_2 = L2_1
    L2_2 = L2_2[L1_2]
    L3_2 = L1_1
    L3_2 = L3_2[L2_2]
    L3_2 = L3_2.groupId
    if nil == L3_2 then
      L4_2 = TriggerClientEvent
      L5_2 = "wais:diver:mission:deleteMission"
      L6_2 = -1
      L7_2 = L1_2
      L8_2 = L2_2
      L4_2(L5_2, L6_2, L7_2, L8_2)
      L4_2 = L1_1
      L4_2[L2_2] = nil
      L4_2 = L2_1
      L4_2[L1_2] = nil
    end
  end
end
L3_1(L4_1, L5_1)
L3_1 = lib
L3_1 = L3_1.callback
L3_1 = L3_1.register
L4_1 = "wais:diver:checkIndexIsFree"
function L5_1(A0_2, A1_2)
  local L2_2, L3_2, L4_2, L5_2, L6_2
  L2_2 = L1_1
  L2_2 = L2_2[A1_2]
  if nil == L2_2 then
    L2_2 = tostring
    L3_2 = A0_2
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
        goto lbl_20
      end
    end
    L3_2 = nil
    ::lbl_20::
    if L3_2 then
      L4_2 = Groups
      L4_2 = L4_2[L3_2]
      L4_2 = L4_2.SetEventIndex
      L5_2 = A1_2
      L4_2(L5_2)
    end
    L4_2 = L1_1
    L5_2 = {}
    L5_2.index = A1_2
    L5_2.owner = A0_2
    L5_2.groupId = L3_2
    L6_2 = L0_1.mission_list
    L6_2 = L6_2[A1_2]
    L6_2 = L6_2.coords
    L6_2 = #L6_2
    L5_2.mustCollected = L6_2
    L5_2.collected = 0
    L4_2[A1_2] = L5_2
    L4_2 = L2_1
    L4_2[L2_2] = A1_2
    L4_2 = true
    return L4_2
  else
    L2_2 = false
    return L2_2
  end
end
L3_1(L4_1, L5_1)