local L0_1, L1_1, L2_1, L3_1
L0_1 = Config
L0_1 = L0_1.Jobs
L0_1 = L0_1.detectorist
L1_1 = RegisterNetEvent
L2_1 = "wais:detectorist:reward"
function L3_1(A0_2, A1_2, A2_2)
  local L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2
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
  L6_2 = getJob
  L7_2 = L5_2
  L8_2 = A0_2
  L6_2 = L6_2(L7_2, L8_2)
  if L6_2 == A0_2 then
    L6_2 = GetPlayerPed
    L7_2 = L3_2
    L6_2 = L6_2(L7_2)
    L7_2 = GetEntityCoords
    L8_2 = L6_2
    L7_2 = L7_2(L8_2)
    L8_2 = L0_1.detectorist_zones
    L8_2 = L8_2[A1_2]
    L8_2 = L8_2.zone
    L8_2 = L7_2 - L8_2
    L8_2 = #L8_2
    L9_2 = L0_1.detectorist_zones
    L9_2 = L9_2[A1_2]
    L9_2 = L9_2.radius
    if L8_2 <= L9_2 then
      L9_2 = vector3
      L10_2 = L0_1.detectorist_zones
      L10_2 = L10_2[A1_2]
      L10_2 = L10_2.detecable_coords
      L10_2 = L10_2[A2_2]
      L10_2 = L10_2.x
      L11_2 = L0_1.detectorist_zones
      L11_2 = L11_2[A1_2]
      L11_2 = L11_2.detecable_coords
      L11_2 = L11_2[A2_2]
      L11_2 = L11_2.y
      L12_2 = L0_1.detectorist_zones
      L12_2 = L12_2[A1_2]
      L12_2 = L12_2.detecable_coords
      L12_2 = L12_2[A2_2]
      L12_2 = L12_2.z
      L9_2 = L9_2(L10_2, L11_2, L12_2)
      L9_2 = L7_2 - L9_2
      L9_2 = #L9_2
      L10_2 = 2.5
      if L9_2 <= L10_2 then
        L10_2 = findRandom
        L11_2 = L0_1.giveable_items
        L10_2 = L10_2(L11_2)
        L11_2 = ConfigSv
        L11_2 = L11_2.AddItem
        L12_2 = L3_2
        L13_2 = L10_2.name
        L14_2 = L10_2.amount
        L11_2(L12_2, L13_2, L14_2)
        L11_2 = TriggerClientEvent
        L12_2 = "wais:showNotification"
        L13_2 = Lang
        L14_2 = "you_got_reward"
        L15_2 = L10_2.amount
        L16_2 = L10_2.label
        L13_2 = L13_2(L14_2, L15_2, L16_2)
        L14_2 = "success"
        L15_2 = 7500
        L11_2(L12_2, L13_2, L14_2, L15_2)
      else
        L10_2 = print
        L11_2 = "The player is too far away from the detecable coords and tried to take random item. Could be cheating. Source: %s - Distance: %s"
        L12_2 = L11_2
        L11_2 = L11_2.format
        L13_2 = L3_2
        L14_2 = L9_2
        L11_2, L12_2, L13_2, L14_2, L15_2, L16_2 = L11_2(L12_2, L13_2, L14_2)
        L10_2(L11_2, L12_2, L13_2, L14_2, L15_2, L16_2)
        L10_2 = DropPlayer
        L11_2 = L3_2
        L12_2 = "Something went wrong"
        L10_2(L11_2, L12_2)
      end
    else
      L9_2 = print
      L10_2 = "The player is too far away from the menu and tried to take money. Could be cheating. Source: %s - Distance: %s"
      L11_2 = L10_2
      L10_2 = L10_2.format
      L12_2 = L3_2
      L13_2 = L8_2
      L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2 = L10_2(L11_2, L12_2, L13_2)
      L9_2(L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2)
      L9_2 = DropPlayer
      L10_2 = L3_2
      L11_2 = "Something went wrong"
      L9_2(L10_2, L11_2)
    end
  else
    L6_2 = print
    L7_2 = "The user's Job is not the same as the job for which it wants to receive the award. Source: %s - Coming Job: %s"
    L8_2 = L7_2
    L7_2 = L7_2.format
    L9_2 = L3_2
    L10_2 = A0_2
    L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2 = L7_2(L8_2, L9_2, L10_2)
    L6_2(L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2)
    L6_2 = DropPlayer
    L7_2 = L3_2
    L8_2 = "Something went wrong"
    L6_2(L7_2, L8_2)
  end
end
L1_1(L2_1, L3_1)