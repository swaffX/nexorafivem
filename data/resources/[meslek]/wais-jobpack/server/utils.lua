local L0_1, L1_1, L2_1
L0_1 = RegisterNetEvent
L1_1 = "wais:outJob:car"
function L2_1(A0_2, A1_2)
  local L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2
  L2_2 = source
  L3_2 = spawnedVehicles
  L4_2 = tostring
  L5_2 = L2_2
  L4_2 = L4_2(L5_2)
  L3_2 = L3_2[L4_2]
  if not L3_2 then
    L3_2 = spawnedVehicles
    L4_2 = tostring
    L5_2 = L2_2
    L4_2 = L4_2(L5_2)
    L5_2 = {}
    L3_2[L4_2] = L5_2
  end
  L3_2 = table
  L3_2 = L3_2.insert
  L4_2 = spawnedVehicles
  L5_2 = tostring
  L6_2 = L2_2
  L5_2 = L5_2(L6_2)
  L4_2 = L4_2[L5_2]
  L5_2 = {}
  L5_2.entity = A0_2
  L5_2.id = A1_2
  L6_2 = GetVehicleNumberPlateText
  L7_2 = NetworkGetEntityFromNetworkId
  L8_2 = A1_2
  L7_2, L8_2 = L7_2(L8_2)
  L6_2 = L6_2(L7_2, L8_2)
  L5_2.plate = L6_2
  L3_2(L4_2, L5_2)
end
L0_1(L1_1, L2_1)
L0_1 = RegisterNetEvent
L1_1 = "wais:addProp"
function L2_1(A0_2, A1_2)
  local L2_2, L3_2, L4_2, L5_2, L6_2
  L2_2 = source
  L3_2 = spawnedProps
  L4_2 = tostring
  L5_2 = L2_2
  L4_2 = L4_2(L5_2)
  L3_2 = L3_2[L4_2]
  if not L3_2 then
    L3_2 = spawnedProps
    L4_2 = tostring
    L5_2 = L2_2
    L4_2 = L4_2(L5_2)
    L5_2 = {}
    L3_2[L4_2] = L5_2
  end
  L3_2 = table
  L3_2 = L3_2.insert
  L4_2 = spawnedProps
  L5_2 = tostring
  L6_2 = L2_2
  L5_2 = L5_2(L6_2)
  L4_2 = L4_2[L5_2]
  L5_2 = {}
  L5_2.entity = A0_2
  L5_2.id = A1_2
  L3_2(L4_2, L5_2)
end
L0_1(L1_1, L2_1)
L0_1 = RegisterNetEvent
L1_1 = "wais:addProp:table"
function L2_1(A0_2)
  local L1_2, L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2
  L1_2 = source
  L2_2 = pairs
  L3_2 = A0_2
  L2_2, L3_2, L4_2, L5_2 = L2_2(L3_2)
  for L6_2, L7_2 in L2_2, L3_2, L4_2, L5_2 do
    L8_2 = spawnedProps
    L9_2 = tostring
    L10_2 = L1_2
    L9_2 = L9_2(L10_2)
    L8_2 = L8_2[L9_2]
    if not L8_2 then
      L8_2 = spawnedProps
      L9_2 = tostring
      L10_2 = L1_2
      L9_2 = L9_2(L10_2)
      L10_2 = {}
      L8_2[L9_2] = L10_2
    end
    L8_2 = table
    L8_2 = L8_2.insert
    L9_2 = spawnedProps
    L10_2 = tostring
    L11_2 = L1_2
    L10_2 = L10_2(L11_2)
    L9_2 = L9_2[L10_2]
    L10_2 = {}
    L11_2 = L7_2.entity
    L10_2.entity = L11_2
    L11_2 = L7_2.id
    L10_2.id = L11_2
    L8_2(L9_2, L10_2)
  end
end
L0_1(L1_1, L2_1)
L0_1 = RegisterNetEvent
L1_1 = "wais:deleteProp"
function L2_1()
  local L0_2, L1_2, L2_2
  L0_2 = source
  L1_2 = deleteProp
  L2_2 = L0_2
  L1_2(L2_2)
end
L0_1(L1_1, L2_1)
L0_1 = RegisterNetEvent
L1_1 = "wais:deleteProp:Id"
function L2_1(A0_2)
  local L1_2, L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2
  L1_2 = source
  L2_2 = spawnedProps
  L3_2 = tostring
  L4_2 = L1_2
  L3_2 = L3_2(L4_2)
  L2_2 = L2_2[L3_2]
  if L2_2 then
    L2_2 = pairs
    L3_2 = spawnedProps
    L4_2 = tostring
    L5_2 = L1_2
    L4_2 = L4_2(L5_2)
    L3_2 = L3_2[L4_2]
    L2_2, L3_2, L4_2, L5_2 = L2_2(L3_2)
    for L6_2, L7_2 in L2_2, L3_2, L4_2, L5_2 do
      L8_2 = L7_2.id
      if L8_2 == A0_2 then
        L8_2 = DoesEntityExist
        L9_2 = NetworkGetEntityFromNetworkId
        L10_2 = L7_2.id
        L9_2, L10_2 = L9_2(L10_2)
        L8_2 = L8_2(L9_2, L10_2)
        if L8_2 then
          L8_2 = DeleteEntity
          L9_2 = NetworkGetEntityFromNetworkId
          L10_2 = L7_2.id
          L9_2, L10_2 = L9_2(L10_2)
          L8_2(L9_2, L10_2)
        end
        L8_2 = spawnedProps
        L9_2 = tostring
        L10_2 = L1_2
        L9_2 = L9_2(L10_2)
        L8_2 = L8_2[L9_2]
        L8_2[L6_2] = nil
        break
      end
    end
  end
end
L0_1(L1_1, L2_1)
L0_1 = RegisterNetEvent
L1_1 = "wais:deleteProp:table"
function L2_1(A0_2)
  local L1_2, L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2
  L1_2 = source
  L2_2 = spawnedProps
  L3_2 = tostring
  L4_2 = L1_2
  L3_2 = L3_2(L4_2)
  L2_2 = L2_2[L3_2]
  if L2_2 then
    L2_2 = pairs
    L3_2 = spawnedProps
    L4_2 = tostring
    L5_2 = L1_2
    L4_2 = L4_2(L5_2)
    L3_2 = L3_2[L4_2]
    L2_2, L3_2, L4_2, L5_2 = L2_2(L3_2)
    for L6_2, L7_2 in L2_2, L3_2, L4_2, L5_2 do
      L8_2 = pairs
      L9_2 = A0_2
      L8_2, L9_2, L10_2, L11_2 = L8_2(L9_2)
      for L12_2, L13_2 in L8_2, L9_2, L10_2, L11_2 do
        L14_2 = L7_2.id
        L15_2 = L13_2.id
        if L14_2 == L15_2 then
          L14_2 = DoesEntityExist
          L15_2 = NetworkGetEntityFromNetworkId
          L16_2 = L7_2.id
          L15_2, L16_2 = L15_2(L16_2)
          L14_2 = L14_2(L15_2, L16_2)
          if L14_2 then
            L14_2 = DeleteEntity
            L15_2 = NetworkGetEntityFromNetworkId
            L16_2 = L7_2.id
            L15_2, L16_2 = L15_2(L16_2)
            L14_2(L15_2, L16_2)
          end
          L14_2 = spawnedProps
          L15_2 = tostring
          L16_2 = L1_2
          L15_2 = L15_2(L16_2)
          L14_2 = L14_2[L15_2]
          L14_2[L6_2] = nil
        end
      end
    end
  end
end
L0_1(L1_1, L2_1)
L0_1 = RegisterNetEvent
L1_1 = "wais:deleteJob:car"
function L2_1(A0_2)
  local L1_2, L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2
  L1_2 = source
  L2_2 = spawnedVehicles
  L3_2 = tostring
  L4_2 = L1_2
  L3_2 = L3_2(L4_2)
  L2_2 = L2_2[L3_2]
  if L2_2 then
    L2_2 = pairs
    L3_2 = spawnedVehicles
    L4_2 = tostring
    L5_2 = L1_2
    L4_2 = L4_2(L5_2)
    L3_2 = L3_2[L4_2]
    L2_2, L3_2, L4_2, L5_2 = L2_2(L3_2)
    for L6_2, L7_2 in L2_2, L3_2, L4_2, L5_2 do
      L8_2 = L7_2.id
      if L8_2 == A0_2 then
        L8_2 = DoesEntityExist
        L9_2 = NetworkGetEntityFromNetworkId
        L10_2 = L7_2.id
        L9_2, L10_2 = L9_2(L10_2)
        L8_2 = L8_2(L9_2, L10_2)
        if L8_2 then
          L8_2 = DeleteEntity
          L9_2 = NetworkGetEntityFromNetworkId
          L10_2 = L7_2.id
          L9_2, L10_2 = L9_2(L10_2)
          L8_2(L9_2, L10_2)
        end
        L8_2 = spawnedVehicles
        L9_2 = tostring
        L10_2 = L1_2
        L9_2 = L9_2(L10_2)
        L8_2 = L8_2[L9_2]
        L8_2[L6_2] = nil
        break
      end
    end
  end
end
L0_1(L1_1, L2_1)
L0_1 = RegisterNetEvent
L1_1 = "wais:delete:Entitys"
function L2_1()
  local L0_2, L1_2, L2_2
  L0_2 = source
  L1_2 = deleteVehicle
  L2_2 = L0_2
  L1_2(L2_2)
  L1_2 = deleteProp
  L2_2 = L0_2
  L1_2(L2_2)
end
L0_1(L1_1, L2_1)
L0_1 = RegisterNetEvent
L1_1 = "wais:delete:Entitys:server"
function L2_1(A0_2)
  local L1_2, L2_2, L3_2
  L1_2 = A0_2
  L2_2 = deleteVehicle
  L3_2 = L1_2
  L2_2(L3_2)
  L2_2 = deleteProp
  L3_2 = L1_2
  L2_2(L3_2)
end
L0_1(L1_1, L2_1)
L0_1 = AddEventHandler
L1_1 = "playerDropped"
function L2_1(A0_2)
  local L1_2, L2_2, L3_2
  L1_2 = source
  L2_2 = deleteVehicle
  L3_2 = L1_2
  L2_2(L3_2)
  L2_2 = deleteProp
  L3_2 = L1_2
  L2_2(L3_2)
end
L0_1(L1_1, L2_1)
L0_1 = lib
L0_1 = L0_1.callback
L0_1 = L0_1.register
L1_1 = "wais:getAppearance"
function L2_1(A0_2)
  local L1_2, L2_2, L3_2
  L1_2 = A0_2
  L2_2 = ConfigSv
  L2_2 = L2_2.GetAppearance
  L3_2 = L1_2
  return L2_2(L3_2)
end
L0_1(L1_1, L2_1)
L0_1 = lib
L0_1 = L0_1.callback
L0_1 = L0_1.register
L1_1 = "wais:deleteJob:car"
function L2_1(A0_2)
  local L1_2, L2_2, L3_2, L4_2
  L1_2 = A0_2
  L2_2 = spawnedVehicles
  L3_2 = tostring
  L4_2 = L1_2
  L3_2 = L3_2(L4_2)
  L2_2 = L2_2[L3_2]
  if L2_2 then
    L2_2 = deleteVehicle
    L3_2 = L1_2
    L2_2 = L2_2(L3_2)
    if L2_2 then
      goto lbl_15
    end
  end
  L2_2 = true
  ::lbl_15::
  return L2_2
end
L0_1(L1_1, L2_1)
function L0_1(A0_2)
  local L1_2, L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2
  L1_2 = spawnedVehicles
  L2_2 = tostring
  L3_2 = A0_2
  L2_2 = L2_2(L3_2)
  L1_2 = L1_2[L2_2]
  if L1_2 then
    L1_2 = {}
    L2_2 = pairs
    L3_2 = spawnedVehicles
    L4_2 = tostring
    L5_2 = A0_2
    L4_2 = L4_2(L5_2)
    L3_2 = L3_2[L4_2]
    L2_2, L3_2, L4_2, L5_2 = L2_2(L3_2)
    for L6_2, L7_2 in L2_2, L3_2, L4_2, L5_2 do
      L8_2 = DoesEntityExist
      L9_2 = NetworkGetEntityFromNetworkId
      L10_2 = L7_2.id
      L9_2, L10_2, L11_2, L12_2 = L9_2(L10_2)
      L8_2 = L8_2(L9_2, L10_2, L11_2, L12_2)
      if L8_2 then
        L8_2 = #L1_2
        L8_2 = L8_2 + 1
        L9_2 = {}
        L10_2 = GetVehicleNumberPlateText
        L11_2 = NetworkGetEntityFromNetworkId
        L12_2 = L7_2.id
        L11_2, L12_2 = L11_2(L12_2)
        L10_2 = L10_2(L11_2, L12_2)
        L9_2.plate = L10_2
        L10_2 = GetEntityModel
        L11_2 = NetworkGetEntityFromNetworkId
        L12_2 = L7_2.id
        L11_2, L12_2 = L11_2(L12_2)
        L10_2 = L10_2(L11_2, L12_2)
        L9_2.model = L10_2
        L1_2[L8_2] = L9_2
        L8_2 = DeleteEntity
        L9_2 = NetworkGetEntityFromNetworkId
        L10_2 = L7_2.id
        L9_2, L10_2, L11_2, L12_2 = L9_2(L10_2)
        L8_2(L9_2, L10_2, L11_2, L12_2)
      end
      L8_2 = spawnedVehicles
      L9_2 = tostring
      L10_2 = A0_2
      L9_2 = L9_2(L10_2)
      L8_2 = L8_2[L9_2]
      L8_2[L6_2] = nil
    end
    L2_2 = spawnedVehicles
    L3_2 = tostring
    L4_2 = A0_2
    L3_2 = L3_2(L4_2)
    L2_2[L3_2] = nil
    L2_2 = TriggerClientEvent
    L3_2 = "wais:jobcar:removekeys"
    L4_2 = A0_2
    L5_2 = L1_2
    L2_2(L3_2, L4_2, L5_2)
  end
  L1_2 = true
  return L1_2
end
deleteVehicle = L0_1
function L0_1(A0_2)
  local L1_2, L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2
  L1_2 = spawnedProps
  L2_2 = tostring
  L3_2 = A0_2
  L2_2 = L2_2(L3_2)
  L1_2 = L1_2[L2_2]
  if L1_2 then
    L1_2 = pairs
    L2_2 = spawnedProps
    L3_2 = tostring
    L4_2 = A0_2
    L3_2 = L3_2(L4_2)
    L2_2 = L2_2[L3_2]
    L1_2, L2_2, L3_2, L4_2 = L1_2(L2_2)
    for L5_2, L6_2 in L1_2, L2_2, L3_2, L4_2 do
      L7_2 = DoesEntityExist
      L8_2 = NetworkGetEntityFromNetworkId
      L9_2 = L6_2.id
      L8_2, L9_2 = L8_2(L9_2)
      L7_2 = L7_2(L8_2, L9_2)
      if L7_2 then
        L7_2 = DeleteEntity
        L8_2 = NetworkGetEntityFromNetworkId
        L9_2 = L6_2.id
        L8_2, L9_2 = L8_2(L9_2)
        L7_2(L8_2, L9_2)
      end
      L7_2 = spawnedProps
      L8_2 = tostring
      L9_2 = A0_2
      L8_2 = L8_2(L9_2)
      L7_2 = L7_2[L8_2]
      L7_2[L5_2] = nil
    end
    L1_2 = spawnedProps
    L2_2 = tostring
    L3_2 = A0_2
    L2_2 = L2_2(L3_2)
    L1_2[L2_2] = nil
  end
  L1_2 = true
  return L1_2
end
deleteProp = L0_1
function L0_1(A0_2)
  local L1_2, L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2
  L1_2 = 0
  L2_2 = pairs
  L3_2 = A0_2
  L2_2, L3_2, L4_2, L5_2 = L2_2(L3_2)
  for L6_2, L7_2 in L2_2, L3_2, L4_2, L5_2 do
    L8_2 = L7_2.rarity
    L1_2 = L1_2 + L8_2
  end
  if L1_2 <= 0 then
    L2_2 = print
    L3_2 = "Reward problem, total rarity is less than or equal to 0"
    L2_2(L3_2)
    L2_2 = nil
    return L2_2
  end
  L2_2 = math
  L2_2 = L2_2.randomseed
  L3_2 = GetGameTimer
  L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2 = L3_2()
  L2_2(L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2)
  L2_2 = math
  L2_2 = L2_2.random
  L2_2 = L2_2()
  L2_2 = L2_2 * L1_2
  L3_2 = 0
  L4_2 = pairs
  L5_2 = A0_2
  L4_2, L5_2, L6_2, L7_2 = L4_2(L5_2)
  for L8_2, L9_2 in L4_2, L5_2, L6_2, L7_2 do
    L10_2 = L9_2.rarity
    L3_2 = L3_2 + L10_2
    if L2_2 <= L3_2 then
      L10_2 = {}
      L10_2.name = L8_2
      L11_2 = L9_2.label
      L10_2.label = L11_2
      L11_2 = L9_2.amount
      L10_2.amount = L11_2
      return L10_2
    end
  end
  L4_2 = print
  L5_2 = "Reward problem, total rarity not equal to sum of all items rarity"
  L4_2(L5_2)
  L4_2 = nil
  return L4_2
end
findRandom = L0_1
function L0_1(A0_2, A1_2)
  local L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2
  L2_2 = false
  if "pizza_delivery" == A0_2 then
    L3_2 = pairs
    L4_2 = Config
    L4_2 = L4_2.Jobs
    L4_2 = L4_2[A0_2]
    L4_2 = L4_2.delivery_coords
    L4_2 = L4_2.coords
    L3_2, L4_2, L5_2, L6_2 = L3_2(L4_2)
    for L7_2, L8_2 in L3_2, L4_2, L5_2, L6_2 do
      if L8_2 == A1_2 then
        L2_2 = true
        break
      end
    end
  end
  return L2_2
end
hasCoordsValid = L0_1