local L0_1, L1_1, L2_1
L0_1 = RegisterNetEvent
L1_1 = "wais:giveBusDriver:reward"
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
  L5_2 = Config
  L5_2 = L5_2.Jobs
  L5_2 = L5_2.bus_driver
  L5_2 = L5_2.lines
  L5_2 = L5_2[A1_2]
  if nil == L5_2 then
    L5_2 = print
    L6_2 = "The event index is not found in the configuration file. Source: %s - Event Index: %s"
    L7_2 = L6_2
    L6_2 = L6_2.format
    L8_2 = L3_2
    L9_2 = eventIndex
    L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2 = L6_2(L7_2, L8_2, L9_2)
    L5_2(L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2)
    L5_2 = DropPlayer
    L6_2 = L3_2
    L7_2 = "Something went wrong"
    return L5_2(L6_2, L7_2)
  end
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
    L7_2 = L7_2.bus_driver
    L7_2 = L7_2.car_settings
    L7_2 = L7_2.spawnCoords
    L8_2 = vec3
    L9_2 = L7_2.x
    L10_2 = L7_2.y
    L11_2 = L7_2.z
    L8_2 = L8_2(L9_2, L10_2, L11_2)
    L8_2 = L6_2 - L8_2
    L8_2 = #L8_2
    if L8_2 <= 20.0 then
      L9_2 = math
      L9_2 = L9_2.randomseed
      L10_2 = GetGameTimer
      L10_2, L11_2, L12_2, L13_2, L14_2, L15_2 = L10_2()
      L9_2(L10_2, L11_2, L12_2, L13_2, L14_2, L15_2)
      L9_2 = type
      L10_2 = Config
      L10_2 = L10_2.Jobs
      L10_2 = L10_2.bus_driver
      L10_2 = L10_2.lines
      L10_2 = L10_2[A1_2]
      L10_2 = L10_2.reward
      L9_2 = L9_2(L10_2)
      if "table" == L9_2 then
        L9_2 = math
        L9_2 = L9_2.random
        L10_2 = Config
        L10_2 = L10_2.Jobs
        L10_2 = L10_2.bus_driver
        L10_2 = L10_2.lines
        L10_2 = L10_2[A1_2]
        L10_2 = L10_2.reward
        L10_2 = L10_2.min
        L11_2 = Config
        L11_2 = L11_2.Jobs
        L11_2 = L11_2.bus_driver
        L11_2 = L11_2.lines
        L11_2 = L11_2[A1_2]
        L11_2 = L11_2.reward
        L11_2 = L11_2.max
        L9_2 = L9_2(L10_2, L11_2)
        if L9_2 then
          goto lbl_114
        end
      end
      L9_2 = Config
      L9_2 = L9_2.Jobs
      L9_2 = L9_2.bus_driver
      L9_2 = L9_2.lines
      L9_2 = L9_2[A1_2]
      L9_2 = L9_2.reward
      ::lbl_114::
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
      L13_2 = "busdriver"
      L10_2(L11_2, L12_2, L13_2)
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