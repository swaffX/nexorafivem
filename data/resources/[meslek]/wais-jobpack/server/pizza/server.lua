local L0_1, L1_1, L2_1
L0_1 = RegisterNetEvent
L1_1 = "wais:givePizza:Reward"
function L2_1(A0_2, A1_2, A2_2)
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
    L7_2 = vector3
    L8_2 = A1_2.x
    L9_2 = A1_2.y
    L10_2 = A1_2.z
    L7_2 = L7_2(L8_2, L9_2, L10_2)
    L7_2 = L7_2 - L6_2
    L7_2 = #L7_2
    L8_2 = hasCoordsValid
    L9_2 = A0_2
    L10_2 = A1_2
    L8_2 = L8_2(L9_2, L10_2)
    if L8_2 and L7_2 <= 3.0 then
      L8_2 = math
      L8_2 = L8_2.randomseed
      L9_2 = GetGameTimer
      L9_2, L10_2, L11_2, L12_2 = L9_2()
      L8_2(L9_2, L10_2, L11_2, L12_2)
      L8_2 = type
      L9_2 = Config
      L9_2 = L9_2.Jobs
      L9_2 = L9_2.pizza_delivery
      L9_2 = L9_2.reward
      L8_2 = L8_2(L9_2)
      if "table" == L8_2 then
        L8_2 = math
        L8_2 = L8_2.random
        L9_2 = Config
        L9_2 = L9_2.Jobs
        L9_2 = L9_2.pizza_delivery
        L9_2 = L9_2.reward
        L9_2 = L9_2.min
        L10_2 = Config
        L10_2 = L10_2.Jobs
        L10_2 = L10_2.pizza_delivery
        L10_2 = L10_2.reward
        L10_2 = L10_2.max
        L8_2 = L8_2(L9_2, L10_2)
        if L8_2 then
          goto lbl_88
        end
      end
      L8_2 = Config
      L8_2 = L8_2.Jobs
      L8_2 = L8_2.pizza_delivery
      L8_2 = L8_2.reward
      ::lbl_88::
      L9_2 = L8_2 - A2_2
      if L9_2 then
      end
      L9_2 = ConfigSv
      L9_2 = L9_2.AddMoney
      L10_2 = L3_2
      L11_2 = L8_2 - A2_2
      L12_2 = "pizza delivery"
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
L0_1(L1_1, L2_1)