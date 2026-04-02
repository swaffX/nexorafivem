local L0_1, L1_1, L2_1, L3_1, L4_1
L0_1 = {}
L1_1 = {}
L2_1 = RegisterNetEvent
L3_1 = "wais:giveGardener:reward"
function L4_1(A0_2, A1_2, A2_2)
  local L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2
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
    L5_2 = GetPlayerPed
    L6_2 = L3_2
    L5_2 = L5_2(L6_2)
    L6_2 = GetEntityCoords
    L7_2 = L5_2
    L6_2 = L6_2(L7_2)
    L7_2 = L6_2 - A1_2
    L7_2 = #L7_2
    if L7_2 <= 5.0 then
      L8_2 = math
      L8_2 = L8_2.randomseed
      L9_2 = GetGameTimer
      L9_2, L10_2, L11_2, L12_2 = L9_2()
      L8_2(L9_2, L10_2, L11_2, L12_2)
      L8_2 = type
      L9_2 = Config
      L9_2 = L9_2.Jobs
      L9_2 = L9_2.gardener
      L9_2 = L9_2.gardens
      L9_2 = L9_2[A2_2]
      L9_2 = L9_2.reward
      L8_2 = L8_2(L9_2)
      if "table" == L8_2 then
        L8_2 = math
        L8_2 = L8_2.random
        L9_2 = Config
        L9_2 = L9_2.Jobs
        L9_2 = L9_2.gardener
        L9_2 = L9_2.gardens
        L9_2 = L9_2[A2_2]
        L9_2 = L9_2.reward
        L9_2 = L9_2.min
        L10_2 = Config
        L10_2 = L10_2.Jobs
        L10_2 = L10_2.gardener
        L10_2 = L10_2.gardens
        L10_2 = L10_2[A2_2]
        L10_2 = L10_2.reward
        L10_2 = L10_2.max
        L8_2 = L8_2(L9_2, L10_2)
        if L8_2 then
          goto lbl_85
        end
      end
      L8_2 = Config
      L8_2 = L8_2.Jobs
      L8_2 = L8_2.gardener
      L8_2 = L8_2.gardens
      L8_2 = L8_2[A2_2]
      L8_2 = L8_2.reward
      ::lbl_85::
      L9_2 = ConfigSv
      L9_2 = L9_2.AddMoney
      L10_2 = L3_2
      L11_2 = L8_2
      L12_2 = "gardener"
      L9_2(L10_2, L11_2, L12_2)
    else
      L8_2 = print
      L9_2 = "The player is too far away from the menu and tried to take money. Could be cheating. Source: %s - Distance: %s"
      L10_2 = L9_2
      L9_2 = L9_2.format
      L11_2 = L3_2
      L12_2 = L7_2
      L9_2, L10_2, L11_2, L12_2 = L9_2(L10_2, L11_2, L12_2)
      L8_2(L9_2, L10_2, L11_2, L12_2)
      L8_2 = DropPlayer
      L9_2 = L3_2
      L10_2 = "Something went wrong"
      L8_2(L9_2, L10_2)
    end
  else
    L5_2 = print
    L6_2 = "The user's Job is not the same as the job for which it wants to receive the award. Source: %s - Coming Job: %s"
    L7_2 = L6_2
    L6_2 = L6_2.format
    L8_2 = L3_2
    L9_2 = A0_2
    L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2 = L6_2(L7_2, L8_2, L9_2)
    L5_2(L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2)
    L5_2 = DropPlayer
    L6_2 = L3_2
    L7_2 = "Something went wrong"
    L5_2(L6_2, L7_2)
  end
end
L2_1(L3_1, L4_1)
L2_1 = lib
L2_1 = L2_1.callback
L2_1 = L2_1.register
L3_1 = "wais:checkGarden:available"
function L4_1(A0_2, A1_2)
  local L2_2, L3_2, L4_2, L5_2
  L2_2 = A0_2
  L3_2 = L0_1
  L3_2 = L3_2[A1_2]
  if nil == L3_2 then
    L3_2 = L0_1
    L4_2 = {}
    L4_2.source = L2_2
    L5_2 = os
    L5_2 = L5_2.time
    L5_2 = L5_2()
    L4_2.time = L5_2
    L3_2[A1_2] = L4_2
    L3_2 = L1_1
    L3_2[L2_2] = A1_2
    L3_2 = true
    return L3_2
  else
    L3_2 = false
    return L3_2
  end
end
L2_1(L3_1, L4_1)
L2_1 = RegisterNetEvent
L3_1 = "wais:changeGarden:status"
function L4_1(A0_2)
  local L1_2, L2_2
  L1_2 = source
  L2_2 = L0_1
  L2_2[A0_2] = nil
  L2_2 = L1_1
  L2_2[L1_2] = nil
end
L2_1(L3_1, L4_1)
L2_1 = AddEventHandler
L3_1 = "playerDropped"
function L4_1(A0_2)
  local L1_2, L2_2, L3_2
  L1_2 = source
  L2_2 = L1_1
  L2_2 = L2_2[L1_2]
  if nil ~= L2_2 then
    L2_2 = L1_1
    L2_2 = L2_2[L1_2]
    L3_2 = L0_1
    L3_2[L2_2] = nil
    L3_2 = L1_1
    L3_2[L1_2] = nil
  end
end
L2_1(L3_1, L4_1)