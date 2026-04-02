local L0_1, L1_1, L2_1, L3_1, L4_1
L0_1 = {}
L1_1 = {}
L2_1 = RegisterNetEvent
L3_1 = "wais:setDefault:FireState"
function L4_1(A0_2)
  local L1_2
  L1_2 = L0_1
  L1_2 = L1_2[A0_2]
  if nil ~= L1_2 then
    L1_2 = L0_1
    L1_2[A0_2] = nil
  end
end
L2_1(L3_1, L4_1)
L2_1 = RegisterNetEvent
L3_1 = "wais:fire:startFire"
function L4_1(A0_2)
  local L1_2, L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2
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
  if not L3_2 then
    L4_2 = pairs
    L5_2 = Config
    L5_2 = L5_2.Jobs
    L5_2 = L5_2.fire_department
    L5_2 = L5_2.giveable_items
    L4_2, L5_2, L6_2, L7_2 = L4_2(L5_2)
    for L8_2, L9_2 in L4_2, L5_2, L6_2, L7_2 do
      L10_2 = ConfigSv
      L10_2 = L10_2.AddItem
      L11_2 = L1_2
      L12_2 = L8_2
      L13_2 = L9_2
      L10_2(L11_2, L12_2, L13_2)
    end
    L4_2 = L1_1
    L4_2[L2_2] = A0_2
  else
    L4_2 = Groups
    L5_2 = sourcesGroup
    L5_2 = L5_2[L2_2]
    L4_2 = L4_2[L5_2]
    L4_2 = L4_2.SetEventIndex
    L5_2 = A0_2
    L4_2(L5_2)
    L4_2 = pairs
    L5_2 = Config
    L5_2 = L5_2.Jobs
    L5_2 = L5_2.fire_department
    L5_2 = L5_2.giveable_items
    L4_2, L5_2, L6_2, L7_2 = L4_2(L5_2)
    for L8_2, L9_2 in L4_2, L5_2, L6_2, L7_2 do
      L10_2 = Groups
      L11_2 = sourcesGroup
      L11_2 = L11_2[L2_2]
      L10_2 = L10_2[L11_2]
      L10_2 = L10_2.GiveGroupItem
      L11_2 = L8_2
      L12_2 = L9_2
      L10_2(L11_2, L12_2)
    end
  end
  L4_2 = TriggerClientEvent
  L5_2 = "wais:firedepartment:startFire"
  L6_2 = -1
  L7_2 = A0_2
  if L3_2 then
    L8_2 = {}
    L8_2.type = "group"
    L8_2.id = L3_2
    if L8_2 then
      goto lbl_82
    end
  end
  L8_2 = {}
  L8_2.type = "player"
  L9_2 = tostring
  L10_2 = L1_2
  L9_2 = L9_2(L10_2)
  L8_2.id = L9_2
  ::lbl_82::
  L4_2(L5_2, L6_2, L7_2, L8_2)
end
L2_1(L3_1, L4_1)
L2_1 = RegisterNetEvent
L3_1 = "wais:fire:extinguish"
function L4_1(A0_2, A1_2, A2_2, A3_2)
  local L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2
  L4_2 = source
  L5_2 = tostring
  L6_2 = L4_2
  L5_2 = L5_2(L6_2)
  L6_2 = TriggerClientEvent
  L7_2 = "wais:firedepartment:extinguish"
  L8_2 = -1
  L9_2 = A0_2
  L10_2 = A1_2
  L11_2 = A2_2
  L6_2(L7_2, L8_2, L9_2, L10_2, L11_2)
  L6_2 = L0_1
  L6_2 = L6_2[A0_2]
  L7_2 = L0_1
  L7_2 = L7_2[A0_2]
  L7_2 = L7_2.extinguishedCount
  L7_2 = L7_2 + 1
  L6_2.extinguishedCount = L7_2
  L6_2 = L0_1
  L6_2 = L6_2[A0_2]
  L6_2 = L6_2.extinguishedCount
  L7_2 = L0_1
  L7_2 = L7_2[A0_2]
  L7_2 = L7_2.totalFlames
  if L6_2 == L7_2 then
    L6_2 = L0_1
    L6_2[A0_2] = nil
    L6_2 = math
    L6_2 = L6_2.randomseed
    L7_2 = GetGameTimer
    L7_2, L8_2, L9_2, L10_2, L11_2 = L7_2()
    L6_2(L7_2, L8_2, L9_2, L10_2, L11_2)
    L6_2 = type
    L7_2 = Config
    L7_2 = L7_2.Jobs
    L7_2 = L7_2.fire_department
    L7_2 = L7_2.random_fires
    L7_2 = L7_2.fires
    L7_2 = L7_2[A0_2]
    L7_2 = L7_2.reward
    L6_2 = L6_2(L7_2)
    if "table" == L6_2 then
      L6_2 = math
      L6_2 = L6_2.random
      L7_2 = Config
      L7_2 = L7_2.Jobs
      L7_2 = L7_2.fire_department
      L7_2 = L7_2.random_fires
      L7_2 = L7_2.fires
      L7_2 = L7_2[A0_2]
      L7_2 = L7_2.reward
      L7_2 = L7_2.min
      L8_2 = Config
      L8_2 = L8_2.Jobs
      L8_2 = L8_2.fire_department
      L8_2 = L8_2.random_fires
      L8_2 = L8_2.fires
      L8_2 = L8_2[A0_2]
      L8_2 = L8_2.reward
      L8_2 = L8_2.max
      L6_2 = L6_2(L7_2, L8_2)
      if L6_2 then
        goto lbl_74
      end
    end
    L6_2 = Config
    L6_2 = L6_2.Jobs
    L6_2 = L6_2.fire_department
    L6_2 = L6_2.random_fires
    L6_2 = L6_2.fires
    L6_2 = L6_2[A0_2]
    L6_2 = L6_2.reward
    ::lbl_74::
    L7_2 = L6_2 - A3_2
    if L7_2 < 0 then
      L7_2 = Groups
      L8_2 = sourcesGroup
      L8_2 = L8_2[L5_2]
      L7_2 = L7_2[L8_2]
      L7_2 = L7_2.sendGroupNotification
      L8_2 = "wais:showNotification"
      L9_2 = Lang
      L10_2 = "money_reduced_destroyed"
      L9_2 = L9_2(L10_2)
      L10_2 = "inform"
      L11_2 = 5000
      L7_2(L8_2, L9_2, L10_2, L11_2)
    end
    L7_2 = Groups
    L8_2 = sourcesGroup
    L8_2 = L8_2[L5_2]
    L7_2 = L7_2[L8_2]
    if nil ~= L7_2 then
      L7_2 = Groups
      L8_2 = sourcesGroup
      L8_2 = L8_2[L5_2]
      L7_2 = L7_2[L8_2]
      L7_2 = L7_2.GiveGroupReward
      L8_2 = L6_2 - A3_2
      L9_2 = Config
      L9_2 = L9_2.Jobs
      L9_2 = L9_2.fire_department
      L9_2 = L9_2.random_fires
      L9_2 = L9_2.fires
      L9_2 = L9_2[A0_2]
      L9_2 = L9_2.split_reward_members
      L7_2(L8_2, L9_2)
      L7_2 = Groups
      L8_2 = sourcesGroup
      L8_2 = L8_2[L5_2]
      L7_2 = L7_2[L8_2]
      L7_2 = L7_2.SetEvent
      L8_2 = nil
      L7_2(L8_2)
    else
      L7_2 = L1_1
      L7_2[L5_2] = nil
      L7_2 = ConfigSv
      L7_2 = L7_2.AddMoney
      L8_2 = L4_2
      L9_2 = L6_2 - A3_2
      L10_2 = "fire department"
      L7_2(L8_2, L9_2, L10_2)
    end
    L7_2 = TriggerClientEvent
    L8_2 = "wais:firedepartment:deleteSelf"
    L9_2 = -1
    L10_2 = A0_2
    L11_2 = A2_2
    L7_2(L8_2, L9_2, L10_2, L11_2)
  end
end
L2_1(L3_1, L4_1)
L2_1 = RegisterNetEvent
L3_1 = "wais:fire:deleteSelf"
function L4_1(A0_2, A1_2)
  local L2_2, L3_2, L4_2, L5_2, L6_2
  L2_2 = TriggerClientEvent
  L3_2 = "wais:firedepartment:deleteSelf"
  L4_2 = -1
  L5_2 = A0_2
  L6_2 = A1_2
  L2_2(L3_2, L4_2, L5_2, L6_2)
end
L2_1(L3_1, L4_1)
L2_1 = AddEventHandler
L3_1 = "playerDropped"
function L4_1(A0_2)
  local L1_2, L2_2, L3_2, L4_2, L5_2, L6_2, L7_2
  L1_2 = source
  L2_2 = tostring
  L3_2 = L1_2
  L2_2 = L2_2(L3_2)
  L3_2 = L1_1
  L3_2 = L3_2[L2_2]
  if L3_2 then
    L3_2 = TriggerClientEvent
    L4_2 = "wais:firedepartment:deleteSelf"
    L5_2 = -1
    L6_2 = L1_1
    L6_2 = L6_2[L2_2]
    L7_2 = L2_2
    L3_2(L4_2, L5_2, L6_2, L7_2)
    L3_2 = L1_1
    L4_2 = L3_2[L2_2]
    L3_2 = L0_1
    L3_2[L4_2] = nil
    L3_2 = L1_1
    L3_2[L2_2] = nil
  end
end
L2_1(L3_1, L4_1)
L2_1 = lib
L2_1 = L2_1.callback
L2_1 = L2_1.register
L3_1 = "wais:firedepartment:checkBusy"
function L4_1(A0_2, A1_2)
  local L2_2, L3_2, L4_2, L5_2
  L2_2 = L0_1
  L2_2 = L2_2[A1_2]
  if L2_2 then
    L2_2 = true
    return L2_2
  end
  L2_2 = L0_1
  L3_2 = {}
  L3_2.source = A0_2
  L4_2 = sourcesGroup
  L4_2 = L4_2[A0_2]
  if nil ~= L4_2 then
    L4_2 = Groups
    L5_2 = sourcesGroup
    L5_2 = L5_2[A0_2]
    L4_2 = L4_2[L5_2]
    L4_2 = L4_2.groupId
    if L4_2 then
      goto lbl_23
    end
  end
  L4_2 = nil
  ::lbl_23::
  L3_2.groupId = L4_2
  L4_2 = Config
  L4_2 = L4_2.Jobs
  L4_2 = L4_2.fire_department
  L4_2 = L4_2.random_fires
  L4_2 = L4_2.fires
  L4_2 = L4_2[A1_2]
  L4_2 = L4_2.flame_coords
  L4_2 = #L4_2
  L3_2.totalFlames = L4_2
  L3_2.extinguishedCount = 0
  L2_2[A1_2] = L3_2
  L2_2 = false
  return L2_2
end
L2_1(L3_1, L4_1)