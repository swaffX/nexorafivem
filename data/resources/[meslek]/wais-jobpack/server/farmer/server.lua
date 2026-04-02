local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1
L0_1 = Config
L0_1 = L0_1.Jobs
L0_1 = L0_1.farmer
L1_1 = {}
L2_1 = {}
L3_1 = RegisterNetEvent
L4_1 = "wais:farmer:server:CreateMission"
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
  L5_2 = "wais:farmer:client:CreateMission"
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
L4_1 = "wais:farmer:group:addTrailer"
function L5_1(A0_2, A1_2, A2_2)
  local L3_2, L4_2, L5_2, L6_2, L7_2
  L3_2 = Groups
  L3_2 = L3_2[A0_2]
  if nil ~= L3_2 then
    L3_2 = Groups
    L3_2 = L3_2[A0_2]
    L3_2 = L3_2.TriggerGroupEvent
    L4_2 = "wais:farmer:group:client:addTarget"
    L5_2 = "trailer"
    L6_2 = A1_2
    L7_2 = A2_2
    L3_2(L4_2, L5_2, L6_2, L7_2)
  end
end
L3_1(L4_1, L5_1)
L3_1 = RegisterNetEvent
L4_1 = "wais:farmer:mission:deleteWheat"
function L5_1(A0_2, A1_2, A2_2)
  local L3_2, L4_2, L5_2, L6_2, L7_2, L8_2
  L3_2 = TriggerClientEvent
  L4_2 = "wais:farmer:client:mission:deleteWheat"
  L5_2 = -1
  L6_2 = A0_2
  L7_2 = A1_2
  L8_2 = A2_2
  L3_2(L4_2, L5_2, L6_2, L7_2, L8_2)
end
L3_1(L4_1, L5_1)
L3_1 = RegisterNetEvent
L4_1 = "wais:farmer:mission:makeBale"
function L5_1(A0_2, A1_2, A2_2)
  local L3_2, L4_2, L5_2, L6_2, L7_2, L8_2
  L3_2 = TriggerClientEvent
  L4_2 = "wais:farmer:client:mission:makeBale"
  L5_2 = -1
  L6_2 = A0_2
  L7_2 = A1_2
  L8_2 = A2_2
  L3_2(L4_2, L5_2, L6_2, L7_2, L8_2)
end
L3_1(L4_1, L5_1)
L3_1 = RegisterNetEvent
L4_1 = "wais:farmer:mission:sync:takeProp"
function L5_1(A0_2, A1_2, A2_2)
  local L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2
  L3_2 = source
  L4_2 = TriggerClientEvent
  L5_2 = "wais:farmer:client:mission:sync:takeProp"
  L6_2 = -1
  L7_2 = A0_2
  L8_2 = A1_2
  L9_2 = A2_2
  L10_2 = L3_2
  L4_2(L5_2, L6_2, L7_2, L8_2, L9_2, L10_2)
end
L3_1(L4_1, L5_1)
L3_1 = RegisterNetEvent
L4_1 = "wais:farmer:mission:addBaleToTrailer"
function L5_1(A0_2, A1_2, A2_2, A3_2, A4_2)
  local L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2
  L5_2 = source
  L6_2 = TriggerClientEvent
  L7_2 = "wais:farmer:client:mission:addBaleToTrailer"
  L8_2 = -1
  L9_2 = A0_2
  L10_2 = A1_2
  L11_2 = A2_2
  L12_2 = A4_2
  L13_2 = L5_2
  L6_2(L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2)
  L6_2 = L1_1
  L6_2 = L6_2[A3_2]
  if nil ~= L6_2 then
    L6_2 = L1_1
    L6_2 = L6_2[A3_2]
    L6_2 = L6_2.groupId
    if nil ~= L6_2 then
      L6_2 = L1_1
      L6_2 = L6_2[A3_2]
      L7_2 = L1_1
      L7_2 = L7_2[A3_2]
      L7_2 = L7_2.collected
      L7_2 = L7_2 + 1
      L6_2.collected = L7_2
      L6_2 = L1_1
      L6_2 = L6_2[A3_2]
      L6_2 = L6_2.collected
      L7_2 = L1_1
      L7_2 = L7_2[A3_2]
      L7_2 = L7_2.mustCollected
      if L6_2 == L7_2 then
        L6_2 = Groups
        L6_2 = L6_2[A2_2]
        if nil ~= L6_2 then
          L6_2 = Groups
          L6_2 = L6_2[A2_2]
          L6_2 = L6_2.TriggerGroupEvent
          L7_2 = "wais:farmer:client:deliveryBales"
          L8_2 = A3_2
          L6_2(L7_2, L8_2)
        end
      end
    end
  end
end
L3_1(L4_1, L5_1)
L3_1 = RegisterNetEvent
L4_1 = "wais:farmer:mission:cancel:group"
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
      L6_2 = "wais:farmer:mission:deleteMission"
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
L4_1 = "wais:farmer:mission:cancel:self"
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
    L4_2 = "wais:farmer:mission:deleteMission"
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
L4_1 = "wais:farmer:mission:finish"
function L5_1(A0_2, A1_2, A2_2, A3_2)
  local L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2
  L4_2 = Groups
  L4_2 = L4_2[A0_2]
  if nil ~= L4_2 then
    L4_2 = Groups
    L4_2 = L4_2[A0_2]
    L5_2 = type
    L6_2 = L0_1.field_list
    L6_2 = L6_2[A2_2]
    L6_2 = L6_2.reward
    L5_2 = L5_2(L6_2)
    if "table" == L5_2 then
      L5_2 = math
      L5_2 = L5_2.random
      L6_2 = L0_1.field_list
      L6_2 = L6_2[A2_2]
      L6_2 = L6_2.reward
      L6_2 = L6_2.min
      L7_2 = L0_1.field_list
      L7_2 = L7_2[A2_2]
      L7_2 = L7_2.reward
      L7_2 = L7_2.max
      L5_2 = L5_2(L6_2, L7_2)
      if L5_2 then
        goto lbl_30
      end
    end
    L5_2 = L0_1.field_list
    L5_2 = L5_2[A2_2]
    L5_2 = L5_2.reward
    ::lbl_30::
    L6_2 = L5_2 - A3_2
    if L6_2 < 0 then
      L6_2 = L4_2.sendGroupNotification
      L7_2 = "wais:showNotification"
      L8_2 = Lang
      L9_2 = "money_reduced_destroyed"
      L8_2 = L8_2(L9_2)
      L9_2 = "inform"
      L10_2 = 5000
      L6_2(L7_2, L8_2, L9_2, L10_2)
    end
    L7_2 = L4_2
    L6_2 = L4_2.GiveGroupReward
    L8_2 = L5_2 - A3_2
    L9_2 = L0_1.field_list
    L9_2 = L9_2[A2_2]
    L9_2 = L9_2.split_reward_members
    L6_2(L7_2, L8_2, L9_2)
    L7_2 = L4_2
    L6_2 = L4_2.SetEventIndex
    L8_2 = 0
    L6_2(L7_2, L8_2)
    L7_2 = L4_2
    L6_2 = L4_2.SetEvent
    L8_2 = nil
    L6_2(L7_2, L8_2)
    L6_2 = TriggerClientEvent
    L7_2 = "wais:farmer:mission:deleteMission"
    L8_2 = -1
    L9_2 = A0_2
    L10_2 = A2_2
    L6_2(L7_2, L8_2, L9_2, L10_2)
    L6_2 = tostring
    L7_2 = L1_1
    L7_2 = L7_2[A2_2]
    L7_2 = L7_2.owner
    L6_2 = L6_2(L7_2)
    L7_2 = L2_1
    L7_2[L6_2] = nil
    L6_2 = L1_1
    L6_2[A2_2] = nil
  else
    L4_2 = tostring
    L5_2 = A0_2
    L4_2 = L4_2(L5_2)
    L5_2 = L2_1
    L4_2 = L5_2[L4_2]
    if nil ~= L4_2 then
      L4_2 = math
      L4_2 = L4_2.randomseed
      L5_2 = GetGameTimer
      L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2 = L5_2()
      L4_2(L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2)
      L4_2 = source
      L5_2 = type
      L6_2 = L0_1.field_list
      L6_2 = L6_2[A2_2]
      L6_2 = L6_2.reward
      L5_2 = L5_2(L6_2)
      if "table" == L5_2 then
        L5_2 = math
        L5_2 = L5_2.random
        L6_2 = L0_1.field_list
        L6_2 = L6_2[A2_2]
        L6_2 = L6_2.reward
        L6_2 = L6_2.min
        L7_2 = L0_1.field_list
        L7_2 = L7_2[A2_2]
        L7_2 = L7_2.reward
        L7_2 = L7_2.max
        L5_2 = L5_2(L6_2, L7_2)
        if L5_2 then
          goto lbl_107
        end
      end
      L5_2 = L0_1.field_list
      L5_2 = L5_2[A2_2]
      L5_2 = L5_2.reward
      ::lbl_107::
      L6_2 = L5_2 - A3_2
      if L6_2 < 0 then
        L6_2 = TriggerClientEvent
        L7_2 = "wais:showNotification"
        L8_2 = L4_2
        L9_2 = Lang
        L10_2 = "money_reduced_destroyed"
        L9_2 = L9_2(L10_2)
        L10_2 = "inform"
        L11_2 = 5000
        L6_2(L7_2, L8_2, L9_2, L10_2, L11_2)
      end
      L6_2 = ConfigSv
      L6_2 = L6_2.AddMoney
      L7_2 = L4_2
      L8_2 = L5_2 - A3_2
      L9_2 = "farmer"
      L6_2(L7_2, L8_2, L9_2)
      L6_2 = TriggerClientEvent
      L7_2 = "wais:showNotification"
      L8_2 = source
      L9_2 = Lang
      L10_2 = "farmer_reward"
      L11_2 = L5_2 - A3_2
      L9_2 = L9_2(L10_2, L11_2)
      L10_2 = "success"
      L11_2 = 7500
      L6_2(L7_2, L8_2, L9_2, L10_2, L11_2)
      L6_2 = TriggerClientEvent
      L7_2 = "wais:farmer:mission:deleteMission"
      L8_2 = -1
      L9_2 = A0_2
      L10_2 = A2_2
      L6_2(L7_2, L8_2, L9_2, L10_2)
      L6_2 = tostring
      L7_2 = A0_2
      L6_2 = L6_2(L7_2)
      L7_2 = L2_1
      L7_2[L6_2] = nil
      L6_2 = L1_1
      L6_2[A2_2] = nil
    end
  end
end
L3_1(L4_1, L5_1)
L3_1 = RegisterNetEvent
L4_1 = "wais:farmer:groupDeleted"
function L5_1(A0_2, A1_2, A2_2)
  local L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2
  L3_2 = A0_2
  L4_2 = tostring
  L5_2 = L3_2
  L4_2 = L4_2(L5_2)
  L5_2 = L2_1
  L5_2 = L5_2[L4_2]
  if nil ~= L5_2 then
    L5_2 = groupId
    if A1_2 == L5_2 then
      L5_2 = TriggerEvent
      L6_2 = "wais:delete:Entitys:server"
      L7_2 = L3_2
      L5_2(L6_2, L7_2)
      L5_2 = TriggerClientEvent
      L6_2 = "wais:farmer:mission:deleteMission"
      L7_2 = -1
      L8_2 = groupId
      L9_2 = A2_2
      L5_2(L6_2, L7_2, L8_2, L9_2)
      L5_2 = L1_1
      L5_2[A2_2] = nil
      L5_2 = L2_1
      L5_2[L4_2] = nil
    end
  end
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
  L3_2 = L3_2[L2_2]
  if nil ~= L3_2 then
    L3_2 = L2_1
    L3_2 = L3_2[L2_2]
    L4_2 = TriggerClientEvent
    L5_2 = "wais:farmer:mission:deleteMission"
    L6_2 = -1
    L7_2 = L2_2
    L8_2 = L3_2
    L4_2(L5_2, L6_2, L7_2, L8_2)
    L4_2 = L1_1
    L4_2[L3_2] = nil
    L4_2 = L2_1
    L4_2[L2_2] = nil
  end
end
L3_1(L4_1, L5_1)
L3_1 = lib
L3_1 = L3_1.callback
L3_1 = L3_1.register
L4_1 = "wais:farmer:checkFieldIsFree"
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
    L6_2 = L0_1.field_list
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