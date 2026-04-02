local L0_1, L1_1, L2_1
L0_1 = RegisterNetEvent
L1_1 = "wais:giveAcidPackage"
function L2_1()
  local L0_2, L1_2, L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2
  L0_2 = source
  L1_2 = pairs
  L2_2 = Config
  L2_2 = L2_2.Jobs
  L2_2 = L2_2.news_delivery
  L2_2 = L2_2.giveable_items
  L1_2, L2_2, L3_2, L4_2 = L1_2(L2_2)
  for L5_2, L6_2 in L1_2, L2_2, L3_2, L4_2 do
    L7_2 = ConfigSv
    L7_2 = L7_2.AddItem
    L8_2 = L0_2
    L9_2 = L5_2
    L10_2 = L6_2
    L7_2(L8_2, L9_2, L10_2)
  end
end
L0_1(L1_1, L2_1)
L0_1 = RegisterNetEvent
L1_1 = "wais:news:removeAcidpackage"
function L2_1()
  local L0_2, L1_2, L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2
  L0_2 = source
  L1_2 = pairs
  L2_2 = Config
  L2_2 = L2_2.Jobs
  L2_2 = L2_2.news_delivery
  L2_2 = L2_2.giveable_items
  L1_2, L2_2, L3_2, L4_2 = L1_2(L2_2)
  for L5_2, L6_2 in L1_2, L2_2, L3_2, L4_2 do
    L7_2 = ConfigSv
    L7_2 = L7_2.GetItemAmount
    L8_2 = L0_2
    L9_2 = L5_2
    L7_2 = L7_2(L8_2, L9_2)
    if L7_2 > 0 then
      L8_2 = ConfigSv
      L8_2 = L8_2.RemoveItem
      L9_2 = L0_2
      L10_2 = L5_2
      L11_2 = L7_2
      L8_2(L9_2, L10_2, L11_2)
    end
  end
end
L0_1(L1_1, L2_1)
L0_1 = RegisterNetEvent
L1_1 = "wais:giveNewsPaper:Reward"
function L2_1(A0_2, A1_2, A2_2)
  local L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2
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
    L7_2 = Config
    L7_2 = L7_2.Jobs
    L7_2 = L7_2.news_delivery
    L7_2 = L7_2.delivery_coords
    L7_2 = L7_2.coords
    L7_2 = L7_2[A1_2]
    L8_2 = L7_2 - L6_2
    L8_2 = #L8_2
    L9_2 = hasCoordsValidFromIndex
    L10_2 = A0_2
    L11_2 = A1_2
    L9_2 = L9_2(L10_2, L11_2)
    if L9_2 then
      L9_2 = Config
      L9_2 = L9_2.Jobs
      L9_2 = L9_2.news_delivery
      L9_2 = L9_2.delivery_coords
      L9_2 = L9_2.drawMarker_distance
      L9_2 = L9_2 + 5.0
      if L8_2 <= L9_2 then
        L9_2 = type
        L10_2 = Config
        L10_2 = L10_2.Jobs
        L10_2 = L10_2.news_delivery
        L10_2 = L10_2.delivery_reward
        L9_2 = L9_2(L10_2)
        if "table" == L9_2 then
          L9_2 = math
          L9_2 = L9_2.random
          L10_2 = Config
          L10_2 = L10_2.Jobs
          L10_2 = L10_2.news_delivery
          L10_2 = L10_2.delivery_reward
          L10_2 = L10_2.min
          L11_2 = Config
          L11_2 = L11_2.Jobs
          L11_2 = L11_2.news_delivery
          L11_2 = L11_2.delivery_reward
          L11_2 = L11_2.max
          L9_2 = L9_2(L10_2, L11_2)
          if L9_2 then
            goto lbl_91
          end
        end
        L9_2 = Config
        L9_2 = L9_2.Jobs
        L9_2 = L9_2.news_delivery
        L9_2 = L9_2.delivery_reward
        ::lbl_91::
        L10_2 = L9_2 - A2_2
        if L10_2 < 0 then
          L10_2 = TriggerClientEvent
          L11_2 = "wais:showNotification"
          L12_2 = L3_2
          L13_2 = Lang
          L14_2 = "money_reduced_destroyed"
          L13_2 = L13_2(L14_2)
          L14_2 = "inform"
          L15_2 = 5000
          L10_2(L11_2, L12_2, L13_2, L14_2, L15_2)
        end
        L10_2 = ConfigSv
        L10_2 = L10_2.AddMoney
        L11_2 = L3_2
        L12_2 = L9_2 - A2_2
        L13_2 = "news_delivery"
        L10_2(L11_2, L12_2, L13_2)
    end
    else
      L9_2 = print
      L10_2 = "The player is too far away from the menu and tried to take money. Could be cheating. Source: %s - Distance: %s"
      L11_2 = L10_2
      L10_2 = L10_2.format
      L12_2 = L3_2
      L13_2 = L8_2
      L10_2, L11_2, L12_2, L13_2, L14_2, L15_2 = L10_2(L11_2, L12_2, L13_2)
      L9_2(L10_2, L11_2, L12_2, L13_2, L14_2, L15_2)
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
    L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2 = L6_2(L7_2, L8_2, L9_2)
    L5_2(L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2)
    L5_2 = DropPlayer
    L6_2 = L3_2
    L7_2 = "Something went wrong"
    L5_2(L6_2, L7_2)
  end
end
L0_1(L1_1, L2_1)
function L0_1(A0_2, A1_2)
  local L2_2
  L2_2 = Config
  L2_2 = L2_2.Jobs
  L2_2 = L2_2[A0_2]
  L2_2 = L2_2.delivery_coords
  L2_2 = L2_2.coords
  L2_2 = L2_2[A1_2]
  if nil ~= L2_2 then
    L2_2 = true
    if L2_2 then
      goto lbl_13
    end
  end
  L2_2 = false
  ::lbl_13::
  return L2_2
end
hasCoordsValidFromIndex = L0_1