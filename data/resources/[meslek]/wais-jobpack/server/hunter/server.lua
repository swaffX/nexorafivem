local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1
L0_1 = Config
L0_1 = L0_1.Jobs
L0_1 = L0_1.hunter
L0_1 = L0_1.hunting_zones
L1_1 = {}
L2_1 = {}
L3_1 = {}
L4_1 = RegisterNetEvent
L5_1 = "wais:job:server:playerLoaded"
function L6_1(A0_2, A1_2)
  local L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2
  L2_2 = L2_1
  L2_2 = L2_2[A1_2]
  if L2_2 then
    L2_2 = Wait
    L3_2 = 5000
    L2_2(L3_2)
    L2_2 = pairs
    L3_2 = Config
    L3_2 = L3_2.Jobs
    L3_2 = L3_2.hunter
    L3_2 = L3_2.giveable_items
    L2_2, L3_2, L4_2, L5_2 = L2_2(L3_2)
    for L6_2, L7_2 in L2_2, L3_2, L4_2, L5_2 do
      L8_2 = ConfigSv
      L8_2 = L8_2.RemoveItem
      L9_2 = A0_2
      L10_2 = L6_2
      L11_2 = L7_2
      L8_2(L9_2, L10_2, L11_2)
    end
    L2_2 = L2_1
    L2_2[A1_2] = nil
  end
end
L4_1(L5_1, L6_1)
L4_1 = RegisterNetEvent
L5_1 = "wais:hunter:group:addAnimal"
function L6_1(A0_2, A1_2, A2_2, A3_2, A4_2)
  local L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2
  L5_2 = source
  L6_2 = tostring
  L7_2 = L5_2
  L6_2 = L6_2(L7_2)
  L7_2 = sourcesGroup
  L7_2 = L7_2[L6_2]
  if nil ~= L7_2 then
    L7_2 = L1_1
    L7_2 = #L7_2
    L8_2 = L7_2 + 1
    L7_2 = L1_1
    L9_2 = {}
    L9_2.zone = A3_2
    L9_2.animalIndex = A4_2
    L9_2.createdBy = L5_2
    L10_2 = os
    L10_2 = L10_2.time
    L10_2 = L10_2()
    L9_2.createdTime = L10_2
    L9_2.enetiyId = A1_2
    L7_2[L8_2] = L9_2
    L7_2 = Groups
    L8_2 = sourcesGroup
    L8_2 = L8_2[L6_2]
    L7_2 = L7_2[L8_2]
    L7_2 = L7_2.TriggerGroupEvent
    L8_2 = "wais:hunter:group:addAnimal"
    L9_2 = A0_2
    L10_2 = A1_2
    L11_2 = A2_2
    L12_2 = A3_2
    L13_2 = A4_2
    L7_2(L8_2, L9_2, L10_2, L11_2, L12_2, L13_2)
  end
end
L4_1(L5_1, L6_1)
L4_1 = RegisterNetEvent
L5_1 = "wais:hunter:group:animalDead"
function L6_1(A0_2)
  local L1_2, L2_2, L3_2, L4_2, L5_2
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
    L3_2 = L3_2.TriggerGroupEvent
    L4_2 = "wais:hunter:group:animalDead"
    L5_2 = A0_2
    L3_2(L4_2, L5_2)
  end
end
L4_1(L5_1, L6_1)
L4_1 = RegisterNetEvent
L5_1 = "wais:hunter:giveReward"
function L6_1(A0_2, A1_2, A2_2, A3_2)
  local L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2
  L4_2 = source
  L5_2 = tostring
  L6_2 = L4_2
  L5_2 = L5_2(L6_2)
  L6_2 = Config
  L6_2 = L6_2.Framework
  L6_2 = L6_2.Framework
  if "esx" == L6_2 then
    L6_2 = wFramework
    L6_2 = L6_2.GetPlayerFromId
    L7_2 = L4_2
    L6_2 = L6_2(L7_2)
    if L6_2 then
      goto lbl_31
    end
  end
  L6_2 = Config
  L6_2 = L6_2.Framework
  L6_2 = L6_2.Framework
  if "qbcore" == L6_2 then
    L6_2 = wFramework
    L6_2 = L6_2.Functions
    L6_2 = L6_2.GetPlayer
    L7_2 = L4_2
    L6_2 = L6_2(L7_2)
    if L6_2 then
      goto lbl_31
    end
  end
  L6_2 = getPlayerFromQbx
  L7_2 = L4_2
  L6_2 = L6_2(L7_2)
  ::lbl_31::
  L7_2 = getJob
  L8_2 = L6_2
  L9_2 = A0_2
  L7_2 = L7_2(L8_2, L9_2)
  if L7_2 == A0_2 then
    L7_2 = GetPlayerPed
    L8_2 = L4_2
    L7_2 = L7_2(L8_2)
    L8_2 = GetEntityCoords
    L9_2 = L7_2
    L8_2 = L8_2(L9_2)
    L9_2 = L0_1
    L9_2 = L9_2[A2_2]
    L9_2 = L9_2.zone
    L9_2 = L8_2 - L9_2
    L9_2 = #L9_2
    L10_2 = L0_1
    L10_2 = L10_2[A2_2]
    L10_2 = L10_2.radius
    if L9_2 <= L10_2 then
      L10_2 = math
      L10_2 = L10_2.randomseed
      L11_2 = GetGameTimer
      L11_2, L12_2, L13_2, L14_2 = L11_2()
      L10_2(L11_2, L12_2, L13_2, L14_2)
      L10_2 = type
      L11_2 = Config
      L11_2 = L11_2.Jobs
      L11_2 = L11_2.hunter
      L11_2 = L11_2.hunting_zones
      L11_2 = L11_2[A2_2]
      L11_2 = L11_2.hunting_animals
      L11_2 = L11_2[A3_2]
      L11_2 = L11_2.reward
      L10_2 = L10_2(L11_2)
      if "table" == L10_2 then
        L10_2 = math
        L10_2 = L10_2.random
        L11_2 = Config
        L11_2 = L11_2.Jobs
        L11_2 = L11_2.hunter
        L11_2 = L11_2.hunting_zones
        L11_2 = L11_2[A2_2]
        L11_2 = L11_2.hunting_animals
        L11_2 = L11_2[A3_2]
        L11_2 = L11_2.reward
        L11_2 = L11_2.min
        L12_2 = Config
        L12_2 = L12_2.Jobs
        L12_2 = L12_2.hunter
        L12_2 = L12_2.hunting_zones
        L12_2 = L12_2[A2_2]
        L12_2 = L12_2.hunting_animals
        L12_2 = L12_2[A3_2]
        L12_2 = L12_2.reward
        L12_2 = L12_2.max
        L10_2 = L10_2(L11_2, L12_2)
        if L10_2 then
          goto lbl_102
        end
      end
      L10_2 = Config
      L10_2 = L10_2.Jobs
      L10_2 = L10_2.hunter
      L10_2 = L10_2.hunting_zones
      L10_2 = L10_2[A2_2]
      L10_2 = L10_2.hunting_animals
      L10_2 = L10_2[A3_2]
      L10_2 = L10_2.reward
      ::lbl_102::
      L11_2 = ConfigSv
      L11_2 = L11_2.AddMoney
      L12_2 = L4_2
      L13_2 = L10_2
      L14_2 = "hunter"
      L11_2(L12_2, L13_2, L14_2)
      L11_2 = sourcesGroup
      L11_2 = L11_2[L5_2]
      if nil ~= L11_2 then
        L11_2 = Groups
        L12_2 = sourcesGroup
        L12_2 = L12_2[L5_2]
        L11_2 = L11_2[L12_2]
        L11_2 = L11_2.TriggerGroupEvent
        L12_2 = "wais:hunter:group:deleteAnimal"
        L13_2 = A1_2
        L11_2(L12_2, L13_2)
      end
    else
      L10_2 = print
      L11_2 = "The player is too far away from the menu and tried to take money. Could be cheating. Source: %s - Distance: %s"
      L12_2 = L11_2
      L11_2 = L11_2.format
      L13_2 = L4_2
      L14_2 = L9_2
      L11_2, L12_2, L13_2, L14_2 = L11_2(L12_2, L13_2, L14_2)
      L10_2(L11_2, L12_2, L13_2, L14_2)
      L10_2 = DropPlayer
      L11_2 = L4_2
      L12_2 = "Something went wrong"
      L10_2(L11_2, L12_2)
    end
  else
    L7_2 = print
    L8_2 = "The user's Job is not the same as the job for which it wants to receive the award. Source: %s - Coming Job: %s"
    L9_2 = L8_2
    L8_2 = L8_2.format
    L10_2 = L4_2
    L11_2 = A0_2
    L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2 = L8_2(L9_2, L10_2, L11_2)
    L7_2(L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2)
    L7_2 = DropPlayer
    L8_2 = L4_2
    L9_2 = "Something went wrong"
    L7_2(L8_2, L9_2)
  end
end
L4_1(L5_1, L6_1)
L4_1 = RegisterNetEvent
L5_1 = "wais:hunter:group:addWeaponTargetToVehicle"
function L6_1(A0_2)
  local L1_2, L2_2, L3_2, L4_2, L5_2
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
    L3_2 = L3_2.TriggerGroupEvent
    L4_2 = "wais:hunter:group:addWeaponTargetToVehicle"
    L5_2 = A0_2
    L3_2(L4_2, L5_2)
  end
end
L4_1(L5_1, L6_1)
L4_1 = RegisterNetEvent
L5_1 = "wais:hunter:giveWeapon"
function L6_1(A0_2, A1_2, A2_2)
  local L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2
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
    L7_2 = GetEntityCoords
    L8_2 = NetworkGetEntityFromNetworkId
    L9_2 = A2_2
    L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2 = L8_2(L9_2)
    L7_2 = L7_2(L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2)
    L8_2 = L6_2 - L7_2
    L8_2 = #L8_2
    L9_2 = L0_1
    L9_2 = L9_2[A1_2]
    L9_2 = L9_2.radius
    if L8_2 <= L9_2 then
      L9_2 = Config
      L9_2 = L9_2.Framework
      L9_2 = L9_2.Framework
      if "esx" == L9_2 then
        L9_2 = L4_2.identifier
        if L9_2 then
          goto lbl_63
        end
      end
      L9_2 = L4_2.PlayerData
      L9_2 = L9_2.citizenid
      ::lbl_63::
      L10_2 = pairs
      L11_2 = Config
      L11_2 = L11_2.Jobs
      L11_2 = L11_2.hunter
      L11_2 = L11_2.giveable_items
      L10_2, L11_2, L12_2, L13_2 = L10_2(L11_2)
      for L14_2, L15_2 in L10_2, L11_2, L12_2, L13_2 do
        L16_2 = ConfigSv
        L16_2 = L16_2.AddItem
        L17_2 = L3_2
        L18_2 = L14_2
        L19_2 = L15_2
        L16_2(L17_2, L18_2, L19_2)
      end
      L10_2 = L2_1
      L10_2[L9_2] = true
      L10_2 = TriggerClientEvent
      L11_2 = "wais:showNotification"
      L12_2 = L3_2
      L13_2 = Lang
      L14_2 = "weapon_received"
      L13_2 = L13_2(L14_2)
      L14_2 = "success"
      L15_2 = 7500
      L10_2(L11_2, L12_2, L13_2, L14_2, L15_2)
    else
      L9_2 = print
      L10_2 = "The player is too far away from the vehicle and tried to take hunter weapons. Could be cheating. Source: %s - Distance: %s"
      L11_2 = L10_2
      L10_2 = L10_2.format
      L12_2 = L3_2
      L13_2 = L8_2
      L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2 = L10_2(L11_2, L12_2, L13_2)
      L9_2(L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2)
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
    L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2 = L6_2(L7_2, L8_2, L9_2)
    L5_2(L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2)
    L5_2 = DropPlayer
    L6_2 = L3_2
    L7_2 = "Something went wrong"
    L5_2(L6_2, L7_2)
  end
end
L4_1(L5_1, L6_1)
L4_1 = RegisterNetEvent
L5_1 = "wais:hunter:removeWeapon"
function L6_1()
  local L0_2, L1_2, L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2
  L0_2 = source
  L1_2 = pairs
  L2_2 = Config
  L2_2 = L2_2.Jobs
  L2_2 = L2_2.hunter
  L2_2 = L2_2.giveable_items
  L1_2, L2_2, L3_2, L4_2 = L1_2(L2_2)
  for L5_2, L6_2 in L1_2, L2_2, L3_2, L4_2 do
    L7_2 = ConfigSv
    L7_2 = L7_2.GetItemAmount
    L8_2 = L0_2
    L9_2 = L5_2
    L7_2 = L7_2(L8_2, L9_2)
    if L7_2 then
      L8_2 = ConfigSv
      L8_2 = L8_2.RemoveItem
      L9_2 = L0_2
      L10_2 = L5_2
      L11_2 = L7_2
      L8_2(L9_2, L10_2, L11_2)
    end
  end
end
L4_1(L5_1, L6_1)
L4_1 = RegisterNetEvent
L5_1 = "wais:hunter:collectingAnimal"
function L6_1(A0_2)
  local L1_2
  L1_2 = L3_1
  L1_2[A0_2] = true
end
L4_1(L5_1, L6_1)
L4_1 = RegisterNetEvent
L5_1 = "wais:hunter:deleteCollected"
function L6_1(A0_2)
  local L1_2
  L1_2 = L3_1
  L1_2[A0_2] = nil
end
L4_1(L5_1, L6_1)
L4_1 = AddEventHandler
L5_1 = "playerDropped"
function L6_1(A0_2)
  local L1_2
  L1_2 = source
end
L4_1(L5_1, L6_1)
L4_1 = CreateThread
function L5_1()
  local L0_2, L1_2, L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2
  while true do
    L0_2 = 5000
    L1_2 = next
    L2_2 = L1_1
    L1_2 = L1_2(L2_2)
    if nil ~= L1_2 then
      L1_2 = pairs
      L2_2 = L1_1
      L1_2, L2_2, L3_2, L4_2 = L1_2(L2_2)
      for L5_2, L6_2 in L1_2, L2_2, L3_2, L4_2 do
        L7_2 = NetworkGetEntityFromNetworkId
        L8_2 = L6_2.enetiyId
        L7_2 = L7_2(L8_2)
        L8_2 = GetEntityCoords
        L9_2 = L7_2
        L8_2 = L8_2(L9_2)
        L10_2 = L6_2.zone
        L9_2 = L0_1
        L9_2 = L9_2[L10_2]
        L9_2 = L9_2.zone
        L9_2 = L8_2 - L9_2
        L9_2 = #L9_2
        L11_2 = L6_2.zone
        L10_2 = L0_1
        L10_2 = L10_2[L11_2]
        L10_2 = L10_2.radius
        if L9_2 >= L10_2 then
          L10_2 = DeleteEntity
          L11_2 = L7_2
          L10_2(L11_2)
          L10_2 = L1_1
          L10_2[L5_2] = nil
          L10_2 = tostring
          L11_2 = L6_2.createdBy
          L10_2 = L10_2(L11_2)
          L11_2 = Groups
          L12_2 = sourcesGroup
          L12_2 = L12_2[L10_2]
          L11_2 = L11_2[L12_2]
          L11_2 = L11_2.TriggerGroupEvent
          L12_2 = "wais:hunter:group:deleteAnimal"
          L13_2 = L6_2.enetiyId
          L11_2(L12_2, L13_2)
        else
          L10_2 = NetworkGetEntityFromNetworkId
          L11_2 = L6_2.enetiyId
          L10_2 = L10_2(L11_2)
          L12_2 = L6_2.entityId
          L11_2 = L3_1
          L11_2 = L11_2[L12_2]
          if nil == L11_2 then
            L11_2 = os
            L11_2 = L11_2.time
            L11_2 = L11_2()
            L12_2 = L6_2.createdTime
            L12_2 = L11_2 - L12_2
            L12_2 = L12_2 * 1000
            L14_2 = L6_2.zone
            L13_2 = L0_1
            L13_2 = L13_2[L14_2]
            L13_2 = L13_2.deleteAfter
            if L12_2 >= L13_2 then
              L12_2 = tostring
              L13_2 = L6_2.createdBy
              L12_2 = L12_2(L13_2)
              L13_2 = L1_1
              L13_2[L5_2] = nil
              L13_2 = DeleteEntity
              L14_2 = L10_2
              L13_2(L14_2)
              L13_2 = Groups
              L14_2 = sourcesGroup
              L14_2 = L14_2[L12_2]
              L13_2 = L13_2[L14_2]
              L13_2 = L13_2.TriggerGroupEvent
              L14_2 = "wais:hunter:group:deleteAnimal"
              L15_2 = L6_2.enetiyId
              L13_2(L14_2, L15_2)
            end
          end
        end
      end
    end
    L1_2 = Wait
    L2_2 = L0_2
    L1_2(L2_2)
  end
end
L4_1(L5_1)