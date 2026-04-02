local L0_1, L1_1, L2_1
L0_1 = RegisterNetEvent
L1_1 = "wais:giveHotdog:Reward"
function L2_1(A0_2, A1_2)
  local L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2
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
    L6_2 = L5_2 - A1_2
    L6_2 = #L6_2
    if L6_2 <= 5.0 then
      L7_2 = type
      L8_2 = Config
      L8_2 = L8_2.Jobs
      L8_2 = L8_2.mobile_hotdog
      L8_2 = L8_2.reward
      L7_2 = L7_2(L8_2)
      if "table" == L7_2 then
        L7_2 = math
        L7_2 = L7_2.random
        L8_2 = Config
        L8_2 = L8_2.Jobs
        L8_2 = L8_2.mobile_hotdog
        L8_2 = L8_2.reward
        L8_2 = L8_2.min
        L9_2 = Config
        L9_2 = L9_2.Jobs
        L9_2 = L9_2.mobile_hotdog
        L9_2 = L9_2.reward
        L9_2 = L9_2.max
        L7_2 = L7_2(L8_2, L9_2)
        if L7_2 then
          goto lbl_72
        end
      end
      L7_2 = Config
      L7_2 = L7_2.Jobs
      L7_2 = L7_2.hotdog
      L7_2 = L7_2.reward
      ::lbl_72::
      L8_2 = ConfigSv
      L8_2 = L8_2.AddMoney
      L9_2 = L2_2
      L10_2 = L7_2
      L11_2 = "mobile hotdog"
      L8_2(L9_2, L10_2, L11_2)
    else
      L7_2 = print
      L8_2 = "The player is too far away from the menu and tried to take money. Could be cheating. Source: %s - Distance: %s"
      L9_2 = L8_2
      L8_2 = L8_2.format
      L10_2 = L2_2
      L11_2 = L6_2
      L8_2, L9_2, L10_2, L11_2 = L8_2(L9_2, L10_2, L11_2)
      L7_2(L8_2, L9_2, L10_2, L11_2)
      L7_2 = DropPlayer
      L8_2 = L2_2
      L9_2 = "Something went wrong"
      L7_2(L8_2, L9_2)
    end
  else
    L4_2 = print
    L5_2 = "The user's Job is not the same as the job for which it wants to receive the award. Source: %s - Coming Job: %s"
    L6_2 = L5_2
    L5_2 = L5_2.format
    L7_2 = L2_2
    L8_2 = A0_2
    L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2 = L5_2(L6_2, L7_2, L8_2)
    L4_2(L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2)
    L4_2 = DropPlayer
    L5_2 = L2_2
    L6_2 = "Something went wrong"
    L4_2(L5_2, L6_2)
  end
end
L0_1(L1_1, L2_1)