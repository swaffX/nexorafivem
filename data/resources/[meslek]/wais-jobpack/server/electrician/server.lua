local L0_1, L1_1, L2_1, L3_1, L4_1
L0_1 = Config
L0_1 = L0_1.Jobs
L0_1 = L0_1.electrician
L1_1 = {}
L2_1 = RegisterNetEvent
L3_1 = "wais:electrician:server:missionFinished"
function L4_1(A0_2, A1_2, A2_2)
  local L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2
  L3_2 = source
  L4_2 = tostring
  L5_2 = L3_2
  L4_2 = L4_2(L5_2)
  L5_2 = Config
  L5_2 = L5_2.Framework
  L5_2 = L5_2.Framework
  if "esx" == L5_2 then
    L5_2 = wFramework
    L5_2 = L5_2.GetPlayerFromId
    L6_2 = L3_2
    L5_2 = L5_2(L6_2)
    if L5_2 then
      goto lbl_31
    end
  end
  L5_2 = Config
  L5_2 = L5_2.Framework
  L5_2 = L5_2.Framework
  if "qbcore" == L5_2 then
    L5_2 = wFramework
    L5_2 = L5_2.Functions
    L5_2 = L5_2.GetPlayer
    L6_2 = L3_2
    L5_2 = L5_2(L6_2)
    if L5_2 then
      goto lbl_31
    end
  end
  L5_2 = getPlayerFromQbx
  L6_2 = L3_2
  L5_2 = L5_2(L6_2)
  ::lbl_31::
  if nil == A1_2 then
    L6_2 = print
    L7_2 = "The user has not selected a mission. Source: %s - Coming Job: %s"
    L8_2 = L7_2
    L7_2 = L7_2.format
    L9_2 = L3_2
    L10_2 = A0_2
    L7_2, L8_2, L9_2, L10_2, L11_2, L12_2 = L7_2(L8_2, L9_2, L10_2)
    L6_2(L7_2, L8_2, L9_2, L10_2, L11_2, L12_2)
    L6_2 = DropPlayer
    L7_2 = L3_2
    L8_2 = "Something went wrong"
    L6_2(L7_2, L8_2)
    return
  end
  L6_2 = getJob
  L7_2 = L5_2
  L8_2 = A0_2
  L6_2 = L6_2(L7_2, L8_2)
  if L6_2 == A0_2 then
    L6_2 = math
    L6_2 = L6_2.randomseed
    L7_2 = GetGameTimer
    L7_2, L8_2, L9_2, L10_2, L11_2, L12_2 = L7_2()
    L6_2(L7_2, L8_2, L9_2, L10_2, L11_2, L12_2)
    L6_2 = type
    L7_2 = L0_1.mission_list
    L7_2 = L7_2[A1_2]
    L7_2 = L7_2.reward
    L6_2 = L6_2(L7_2)
    if "table" == L6_2 then
      L6_2 = math
      L6_2 = L6_2.random
      L7_2 = L0_1.mission_list
      L7_2 = L7_2[A1_2]
      L7_2 = L7_2.reward
      L7_2 = L7_2.min
      L8_2 = L0_1.mission_list
      L8_2 = L8_2[A1_2]
      L8_2 = L8_2.reward
      L8_2 = L8_2.max
      L6_2 = L6_2(L7_2, L8_2)
      if L6_2 then
        goto lbl_79
      end
    end
    L6_2 = L0_1.mission_list
    L6_2 = L6_2[A1_2]
    L6_2 = L6_2.reward
    ::lbl_79::
    L7_2 = L6_2 - A2_2
    if L7_2 < 0 then
      L7_2 = TriggerClientEvent
      L8_2 = "wais:showNotification"
      L9_2 = L3_2
      L10_2 = Lang
      L11_2 = "money_reduced_destroyed"
      L10_2 = L10_2(L11_2)
      L11_2 = "inform"
      L12_2 = 5000
      L7_2(L8_2, L9_2, L10_2, L11_2, L12_2)
    end
    L7_2 = ConfigSv
    L7_2 = L7_2.AddMoney
    L8_2 = L3_2
    L9_2 = L6_2 - A2_2
    L10_2 = "electrician"
    L7_2(L8_2, L9_2, L10_2)
  else
    L6_2 = print
    L7_2 = "The user's Job is not the same as the job for which it wants to receive the award. Source: %s - Coming Job: %s"
    L8_2 = L7_2
    L7_2 = L7_2.format
    L9_2 = L3_2
    L10_2 = A0_2
    L7_2, L8_2, L9_2, L10_2, L11_2, L12_2 = L7_2(L8_2, L9_2, L10_2)
    L6_2(L7_2, L8_2, L9_2, L10_2, L11_2, L12_2)
    L6_2 = DropPlayer
    L7_2 = L3_2
    L8_2 = "Something went wrong"
    L6_2(L7_2, L8_2)
  end
end
L2_1(L3_1, L4_1)
L2_1 = RegisterNetEvent
L3_1 = "wais:electrician:server:acceptMission"
function L4_1(A0_2, A1_2, A2_2)
  local L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2
  L3_2 = source
  L4_2 = tostring
  L5_2 = L3_2
  L4_2 = L4_2(L5_2)
  L5_2 = sourcesGroup
  L5_2 = L5_2[L4_2]
  if L5_2 then
    L5_2 = {}
    L5_2.type = "group"
    L6_2 = sourcesGroup
    L6_2 = L6_2[L4_2]
    L5_2.id = L6_2
    if L5_2 then
      goto lbl_24
    end
  end
  L5_2 = {}
  L5_2.type = "player"
  L6_2 = tostring
  L7_2 = L3_2
  L6_2 = L6_2(L7_2)
  L5_2.id = L6_2
  ::lbl_24::
  L6_2 = sourcesGroup
  L6_2 = L6_2[L4_2]
  if nil ~= L6_2 then
    L6_2 = Groups
    L7_2 = sourcesGroup
    L7_2 = L7_2[L4_2]
    L6_2 = L6_2[L7_2]
    L7_2 = L6_2.SetEventIndex
    L8_2 = A0_2
    L7_2(L8_2)
    L7_2 = L6_2.TriggerGroupEvent
    L8_2 = "wais:electrician:server:createMission"
    L9_2 = A0_2
    L10_2 = L5_2
    L7_2(L8_2, L9_2, L10_2)
    L7_2 = L6_2.TriggerGroupEvent
    L8_2 = "wais:electrician:client:giveKeys"
    L9_2 = A1_2
    L10_2 = A2_2
    L7_2(L8_2, L9_2, L10_2)
    L7_2 = tostring
    L8_2 = sourcesGroup
    L8_2 = L8_2[L4_2]
    L7_2 = L7_2(L8_2)
    L8_2 = L1_1
    L9_2 = {}
    L10_2 = {}
    L9_2.progress = L10_2
    L9_2.fixed = 0
    L10_2 = L0_1.mission_list
    L10_2 = L10_2[A0_2]
    L10_2 = L10_2.maintenance_locations
    L10_2 = #L10_2
    L9_2.mustBeFixed = L10_2
    L8_2[L7_2] = L9_2
    L7_2 = pairs
    L8_2 = L0_1.mission_list
    L8_2 = L8_2[A0_2]
    L8_2 = L8_2.maintenance_locations
    L7_2, L8_2, L9_2, L10_2 = L7_2(L8_2)
    for L11_2, L12_2 in L7_2, L8_2, L9_2, L10_2 do
      L13_2 = tostring
      L14_2 = sourcesGroup
      L14_2 = L14_2[L4_2]
      L13_2 = L13_2(L14_2)
      L14_2 = L1_1
      L13_2 = L14_2[L13_2]
      L13_2 = L13_2.progress
      L14_2 = {}
      L14_2.isBusy = false
      L14_2.isFixed = false
      L13_2[L11_2] = L14_2
    end
  end
end
L2_1(L3_1, L4_1)
L2_1 = RegisterNetEvent
L3_1 = "wais:electrician:server:group:changeBusyState"
function L4_1(A0_2, A1_2, A2_2)
  local L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2
  L3_2 = source
  L4_2 = tostring
  L5_2 = L3_2
  L4_2 = L4_2(L5_2)
  L5_2 = sourcesGroup
  L5_2 = L5_2[L4_2]
  if nil ~= L5_2 then
    L5_2 = Groups
    L5_2 = L5_2[A0_2]
    L6_2 = tostring
    L7_2 = A0_2
    L6_2 = L6_2(L7_2)
    L7_2 = L1_1
    L6_2 = L7_2[L6_2]
    L6_2 = L6_2.progress
    L6_2 = L6_2[A1_2]
    L6_2.isBusy = A2_2
    L6_2 = L5_2.TriggerGroupEvent
    L7_2 = "wais:electrician:client:changeBusyState"
    L8_2 = A1_2
    L9_2 = A2_2
    L6_2(L7_2, L8_2, L9_2)
  end
end
L2_1(L3_1, L4_1)
L2_1 = RegisterNetEvent
L3_1 = "wais:electrician:server:group:changeFixedState"
function L4_1(A0_2, A1_2, A2_2, A3_2, A4_2)
  local L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2
  L5_2 = source
  L6_2 = tostring
  L7_2 = L5_2
  L6_2 = L6_2(L7_2)
  L7_2 = sourcesGroup
  L7_2 = L7_2[L6_2]
  if nil ~= L7_2 then
    L7_2 = Groups
    L7_2 = L7_2[A0_2]
    L8_2 = tostring
    L9_2 = A0_2
    L8_2 = L8_2(L9_2)
    L9_2 = L1_1
    L8_2 = L9_2[L8_2]
    L8_2 = L8_2.progress
    L8_2 = L8_2[A1_2]
    L8_2.isFixed = A2_2
    L8_2 = tostring
    L9_2 = A0_2
    L8_2 = L8_2(L9_2)
    L9_2 = L1_1
    L8_2 = L9_2[L8_2]
    L9_2 = tostring
    L10_2 = A0_2
    L9_2 = L9_2(L10_2)
    L10_2 = L1_1
    L9_2 = L10_2[L9_2]
    L9_2 = L9_2.fixed
    L9_2 = L9_2 + 1
    L8_2.fixed = L9_2
    L8_2 = tostring
    L9_2 = A0_2
    L8_2 = L8_2(L9_2)
    L9_2 = L1_1
    L8_2 = L9_2[L8_2]
    L8_2 = L8_2.fixed
    L9_2 = tostring
    L10_2 = A0_2
    L9_2 = L9_2(L10_2)
    L10_2 = L1_1
    L9_2 = L10_2[L9_2]
    L9_2 = L9_2.mustBeFixed
    if L8_2 >= L9_2 then
      L8_2 = L7_2.SetEventIndex
      L9_2 = nil
      L8_2(L9_2)
      L8_2 = L7_2.TriggerGroupEvent
      L9_2 = "wais:electrician:client:cancelMission"
      L8_2(L9_2)
      L8_2 = L7_2.sendGroupNotification
      L9_2 = Lang
      L10_2 = "electrician_mission_success_end"
      L9_2 = L9_2(L10_2)
      L10_2 = "success"
      L11_2 = 7500.0
      L8_2(L9_2, L10_2, L11_2)
      L8_2 = type
      L9_2 = L0_1.mission_list
      L9_2 = L9_2[A3_2]
      L9_2 = L9_2.reward
      L8_2 = L8_2(L9_2)
      if "table" == L8_2 then
        L8_2 = math
        L8_2 = L8_2.random
        L9_2 = L0_1.mission_list
        L9_2 = L9_2[A3_2]
        L9_2 = L9_2.reward
        L9_2 = L9_2.min
        L10_2 = L0_1.mission_list
        L10_2 = L10_2[A3_2]
        L10_2 = L10_2.reward
        L10_2 = L10_2.max
        L8_2 = L8_2(L9_2, L10_2)
        if L8_2 then
          goto lbl_83
        end
      end
      L8_2 = L0_1.mission_list
      L8_2 = L8_2[A3_2]
      L8_2 = L8_2.reward
      ::lbl_83::
      L9_2 = L8_2 - A4_2
      if L9_2 < 0 then
        L9_2 = L7_2.sendGroupNotification
        L10_2 = Lang
        L11_2 = "money_reduced_destroyed"
        L10_2 = L10_2(L11_2)
        L11_2 = "inform"
        L12_2 = 5000
        L9_2(L10_2, L11_2, L12_2)
      end
      L9_2 = ConfigSv
      L9_2 = L9_2.AddMoney
      L10_2 = L5_2
      L11_2 = L8_2 - A4_2
      L12_2 = "electrician"
      L9_2(L10_2, L11_2, L12_2)
      L9_2 = tostring
      L10_2 = A0_2
      L9_2 = L9_2(L10_2)
      L10_2 = L1_1
      L10_2[L9_2] = nil
    else
      L8_2 = L7_2.TriggerGroupEvent
      L9_2 = "wais:electrician:client:changeFixedState"
      L10_2 = A1_2
      L11_2 = A2_2
      L8_2(L9_2, L10_2, L11_2)
    end
  end
end
L2_1(L3_1, L4_1)
L2_1 = RegisterNetEvent
L3_1 = "wais:electrician:mission:cancel:group"
function L4_1(A0_2)
  local L1_2, L2_2, L3_2, L4_2, L5_2
  L1_2 = source
  L2_2 = tostring
  L3_2 = L1_2
  L2_2 = L2_2(L3_2)
  L3_2 = sourcesGroup
  L3_2 = L3_2[L2_2]
  if nil ~= L3_2 then
    L3_2 = Groups
    L3_2 = L3_2[A0_2]
    L4_2 = tostring
    L5_2 = A0_2
    L4_2 = L4_2(L5_2)
    L5_2 = L1_1
    L5_2[L4_2] = nil
    L4_2 = L3_2.SetEventIndex
    L5_2 = nil
    L4_2(L5_2)
    L4_2 = L3_2.TriggerGroupEvent
    L5_2 = "wais:electrician:client:cancelMission"
    L4_2(L5_2)
  end
end
L2_1(L3_1, L4_1)