local L0_1, L1_1, L2_1
L0_1 = {}
Groups = L0_1
L0_1 = {}
sourcesGroup = L0_1
L0_1 = RegisterNetEvent
L1_1 = "wais:group:create"
function L2_1(A0_2, A1_2)
  local L2_2, L3_2, L4_2, L5_2, L6_2, L7_2
  L2_2 = source
  L3_2 = tostring
  L4_2 = L2_2
  L3_2 = L3_2(L4_2)
  L4_2 = sourcesGroup
  L4_2 = L4_2[L3_2]
  if nil ~= L4_2 then
    L4_2 = print
    L5_2 = "Player already in group"
    return L4_2(L5_2)
  end
  L4_2 = CreateAGroup
  L5_2 = L2_2
  L6_2 = A0_2
  L7_2 = A1_2
  L4_2(L5_2, L6_2, L7_2)
end
L0_1(L1_1, L2_1)
L0_1 = RegisterNetEvent
L1_1 = "wais:group:delete"
function L2_1(A0_2)
  local L1_2, L2_2, L3_2, L4_2, L5_2
  L1_2 = source
  L2_2 = Groups
  L2_2 = L2_2[A0_2]
  if nil == L2_2 then
    L2_2 = print
    L3_2 = "Group not found %s"
    L4_2 = L3_2
    L3_2 = L3_2.format
    L5_2 = A0_2
    L3_2, L4_2, L5_2 = L3_2(L4_2, L5_2)
    return L2_2(L3_2, L4_2, L5_2)
  end
  L2_2 = Groups
  L2_2 = L2_2[A0_2]
  L2_2 = L2_2.ownerId
  if L2_2 == L1_2 then
    L2_2 = Groups
    L2_2 = L2_2[A0_2]
    L2_2 = L2_2.deleteGroup
    L2_2()
  end
end
L0_1(L1_1, L2_1)
L0_1 = RegisterNetEvent
L1_1 = "wais:group:kick"
function L2_1(A0_2, A1_2)
  local L2_2, L3_2, L4_2, L5_2, L6_2
  L2_2 = source
  L3_2 = Groups
  L3_2 = L3_2[A0_2]
  if nil == L3_2 then
    L3_2 = print
    L4_2 = "Group not found %s"
    L5_2 = L4_2
    L4_2 = L4_2.format
    L6_2 = A0_2
    L4_2, L5_2, L6_2 = L4_2(L5_2, L6_2)
    return L3_2(L4_2, L5_2, L6_2)
  end
  L3_2 = sourcesGroup
  L3_2 = L3_2[A1_2]
  if L3_2 == A0_2 then
    L3_2 = Groups
    L3_2 = L3_2[A0_2]
    L3_2 = L3_2.ownerId
    if L3_2 == L2_2 then
      L3_2 = Groups
      L3_2 = L3_2[A0_2]
      L3_2 = L3_2.removePlayer
      L4_2 = source
      L3_2(L4_2)
    end
  end
end
L0_1(L1_1, L2_1)
L0_1 = RegisterNetEvent
L1_1 = "wais:group:invite"
function L2_1(A0_2, A1_2)
  local L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2
  L2_2 = pairs
  L3_2 = A1_2
  L2_2, L3_2, L4_2, L5_2 = L2_2(L3_2)
  for L6_2, L7_2 in L2_2, L3_2, L4_2, L5_2 do
    L8_2 = L7_2[1]
    L9_2 = Groups
    L9_2 = L9_2[A0_2]
    if nil == L9_2 then
      L9_2 = print
      L10_2 = "Group not found %s"
      L11_2 = L10_2
      L10_2 = L10_2.format
      L12_2 = A0_2
      L10_2, L11_2, L12_2, L13_2, L14_2 = L10_2(L11_2, L12_2)
      return L9_2(L10_2, L11_2, L12_2, L13_2, L14_2)
    end
    L9_2 = sourcesGroup
    L9_2 = L9_2[L8_2]
    if nil == L9_2 then
      L9_2 = Groups
      L9_2 = L9_2[A0_2]
      L9_2 = L9_2.addPlayer
      L10_2 = L8_2
      L9_2 = L9_2(L10_2)
      if L9_2 then
        L9_2 = TriggerClientEvent
        L10_2 = "wais:showNotification"
        L11_2 = Groups
        L11_2 = L11_2[A0_2]
        L11_2 = L11_2.ownerId
        L12_2 = Lang
        L13_2 = "player_added_group"
        L12_2 = L12_2(L13_2)
        L13_2 = "success"
        L14_2 = 7500
        L9_2(L10_2, L11_2, L12_2, L13_2, L14_2)
      else
        L9_2 = TriggerClientEvent
        L10_2 = "wais:showNotification"
        L11_2 = Groups
        L11_2 = L11_2[A0_2]
        L11_2 = L11_2.ownerId
        L12_2 = Lang
        L13_2 = "already_in_group"
        L12_2 = L12_2(L13_2)
        L13_2 = "error"
        L14_2 = 7500
        L9_2(L10_2, L11_2, L12_2, L13_2, L14_2)
      end
    else
      L9_2 = TriggerClientEvent
      L10_2 = "wais:showNotification"
      L11_2 = Groups
      L11_2 = L11_2[A0_2]
      L11_2 = L11_2.ownerId
      L12_2 = Lang
      L13_2 = "already_in_group"
      L12_2 = L12_2(L13_2)
      L13_2 = "error"
      L14_2 = 7500
      L9_2(L10_2, L11_2, L12_2, L13_2, L14_2)
    end
  end
end
L0_1(L1_1, L2_1)
L0_1 = RegisterNetEvent
L1_1 = "wais:group:leaveGroup"
function L2_1()
  local L0_2, L1_2, L2_2, L3_2, L4_2, L5_2
  L0_2 = source
  L1_2 = sourcesGroup
  L1_2 = L1_2[L0_2]
  if nil == L1_2 then
    L1_2 = print
    L2_2 = "Player not in group"
    return L1_2(L2_2)
  end
  L1_2 = sourcesGroup
  L1_2 = L1_2[L0_2]
  L2_2 = Groups
  L2_2 = L2_2[L1_2]
  if nil == L2_2 then
    L2_2 = print
    L3_2 = "Group not found %s"
    L4_2 = L3_2
    L3_2 = L3_2.format
    L5_2 = L1_2
    L3_2, L4_2, L5_2 = L3_2(L4_2, L5_2)
    return L2_2(L3_2, L4_2, L5_2)
  end
  L2_2 = Groups
  L2_2 = L2_2[L1_2]
  L2_2 = L2_2.removePlayer
  L3_2 = L0_2
  L2_2(L3_2)
end
L0_1(L1_1, L2_1)
L0_1 = AddEventHandler
L1_1 = "playerDropped"
function L2_1(A0_2)
  local L1_2, L2_2, L3_2, L4_2
  L1_2 = source
  L2_2 = sourcesGroup
  L2_2 = L2_2[L1_2]
  if nil == L2_2 then
    return
  end
  L2_2 = sourcesGroup
  L2_2 = L2_2[L1_2]
  L3_2 = Groups
  L3_2 = L3_2[L2_2]
  if nil == L3_2 then
    return
  end
  L3_2 = Groups
  L3_2 = L3_2[L2_2]
  L3_2 = L3_2.removePlayer
  L4_2 = L1_2
  L3_2(L4_2)
end
L0_1(L1_1, L2_1)
L0_1 = lib
L0_1 = L0_1.callback
L0_1 = L0_1.register
L1_1 = "wais:getPlayer:names"
function L2_1(A0_2, A1_2)
  local L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2
  L2_2 = pairs
  L3_2 = A1_2
  L2_2, L3_2, L4_2, L5_2 = L2_2(L3_2)
  for L6_2, L7_2 in L2_2, L3_2, L4_2, L5_2 do
    L8_2 = A1_2[L6_2]
    L9_2 = ConfigSv
    L9_2 = L9_2.GetPlayerName
    L10_2 = L7_2.source
    L9_2 = L9_2(L10_2)
    L8_2.name = L9_2
  end
  return A1_2
end
L0_1(L1_1, L2_1)
function L0_1(A0_2, A1_2, A2_2)
  local L3_2, L4_2, L5_2, L6_2
  L3_2 = lib
  L3_2 = L3_2.string
  L3_2 = L3_2.random
  L4_2 = "aaaaaa"
  L3_2 = L3_2(L4_2)
  while true do
    L4_2 = Groups
    L4_2 = L4_2[L3_2]
    if nil == L4_2 then
      break
    end
    L4_2 = lib
    L4_2 = L4_2.string
    L4_2 = L4_2.random
    L5_2 = "aaaaaa"
    L4_2 = L4_2(L5_2)
    L3_2 = L4_2
    L4_2 = Wait
    L5_2 = 100
    L4_2(L5_2)
  end
  L4_2 = {}
  L4_2.job = A1_2
  L4_2.ownerId = A0_2
  L4_2.groupId = L3_2
  L5_2 = {}
  L4_2.players = L5_2
  L4_2.playerCount = 0
  L4_2.currentEvent = nil
  L4_2.currentEventIndex = 0
  L4_2.showPlayerBlips = A2_2
  function L5_2(A0_3)
    local L1_3, L2_3, L3_3, L4_3, L5_3, L6_3, L7_3, L8_3, L9_3, L10_3, L11_3
    L1_3 = tostring
    L2_3 = A0_3
    L1_3 = L1_3(L2_3)
    L2_3 = sourcesGroup
    L2_3 = L2_3[L1_3]
    if nil ~= L2_3 then
      L2_3 = false
      return L2_3
    end
    L2_3 = Config
    L2_3 = L2_3.Framework
    L2_3 = L2_3.Framework
    if "esx" == L2_3 then
      L2_3 = wFramework
      L2_3 = L2_3.GetPlayerFromId
      L3_3 = src
      L2_3 = L2_3(L3_3)
      if L2_3 then
        goto lbl_36
      end
    end
    L2_3 = Config
    L2_3 = L2_3.Framework
    L2_3 = L2_3.Framework
    if "qbcore" == L2_3 then
      L2_3 = wFramework
      L2_3 = L2_3.Functions
      L2_3 = L2_3.GetPlayer
      L3_3 = src
      L2_3 = L2_3(L3_3)
      if L2_3 then
        goto lbl_36
      end
    end
    L2_3 = getPlayerFromQbx
    L3_3 = src
    L2_3 = L2_3(L3_3)
    ::lbl_36::
    L3_3 = ConfigSv
    L3_3 = L3_3.GetPlayerName
    L4_3 = A0_3
    L3_3 = L3_3(L4_3)
    L4_3 = L4_2.players
    L5_3 = {}
    L5_3.source = A0_3
    L5_3.name = L3_3
    L4_3[L1_3] = L5_3
    L4_3 = sourcesGroup
    L5_3 = L3_2
    L4_3[L1_3] = L5_3
    L4_3 = L4_2.playerCount
    L4_3 = L4_3 + 1
    L4_2.playerCount = L4_3
    L4_3 = getJob
    L5_3 = L2_3
    L4_3 = L4_3(L5_3)
    L5_3 = L4_2.job
    if L4_3 ~= L5_3 then
      L4_3 = ConfigSv
      L4_3 = L4_3.SetJob
      L5_3 = A0_3
      L6_3 = L4_2.job
      L7_3 = 0
      L4_3(L5_3, L6_3, L7_3)
    end
    L4_3 = L4_2.TriggerGroupEvent
    L5_3 = "wais:group:addPlayer"
    L6_3 = L1_3
    L7_3 = L3_3
    L4_3(L5_3, L6_3, L7_3)
    L4_3 = TriggerClientEvent
    L5_3 = "wais:group:haveNewGroup"
    L6_3 = A0_3
    L7_3 = L4_2.ownerId
    L8_3 = L4_2.groupId
    L9_3 = L4_2.players
    L10_3 = L4_2.job
    L11_3 = L4_2.showPlayerBlips
    L4_3(L5_3, L6_3, L7_3, L8_3, L9_3, L10_3, L11_3)
    L4_3 = true
    return L4_3
  end
  L4_2.addPlayer = L5_2
  function L5_2(A0_3)
    local L1_3, L2_3, L3_3, L4_3, L5_3, L6_3, L7_3, L8_3, L9_3, L10_3
    L1_3 = tostring
    L2_3 = A0_3
    L1_3 = L1_3(L2_3)
    L2_3 = sourcesGroup
    L2_3 = L2_3[L1_3]
    if nil == L2_3 then
      L2_3 = false
      return L2_3
    end
    L2_3 = L4_2.playerCount
    L2_3 = L2_3 - 1
    if 0 == L2_3 then
      L2_3 = L4_2.deleteGroup
      return L2_3()
    else
      L2_3 = L4_2.ownerId
      if L2_3 == A0_3 then
        L2_3 = pairs
        L3_3 = L4_2.players
        L2_3, L3_3, L4_3, L5_3 = L2_3(L3_3)
        for L6_3, L7_3 in L2_3, L3_3, L4_3, L5_3 do
          L8_3 = L7_3.source
          if L8_3 ~= A0_3 then
            L8_3 = L7_3.source
            L4_2.ownerId = L8_3
            L8_3 = L4_2.TriggerGroupEvent
            L9_3 = "wais:group:changeOwnerId"
            L10_3 = L7_3.source
            L8_3(L9_3, L10_3)
            break
          end
        end
      end
      L2_3 = tostring
      L3_3 = A0_3
      L2_3 = L2_3(L3_3)
      L3_3 = L4_2.TriggerGroupEvent
      L4_3 = "wais:showNotification"
      L5_3 = Lang
      L6_3 = "member_left_the_group"
      L7_3 = L4_2.players
      L7_3 = L7_3[L2_3]
      L7_3 = L7_3.name
      L5_3 = L5_3(L6_3, L7_3)
      L6_3 = "inform"
      L7_3 = 7500
      L3_3(L4_3, L5_3, L6_3, L7_3)
      L3_3 = L4_2.players
      L3_3[L2_3] = nil
      L3_3 = sourcesGroup
      L3_3[L2_3] = nil
      L3_3 = L4_2.playerCount
      L3_3 = L3_3 - 1
      L4_2.playerCount = L3_3
    end
    L2_3 = TriggerClientEvent
    L3_3 = "wais:group:default"
    L4_3 = A0_3
    L2_3(L3_3, L4_3)
    L2_3 = L4_2.TriggerGroupEvent
    L3_3 = "wais:group:removePlayer"
    L4_3 = A0_3
    return L2_3(L3_3, L4_3)
  end
  L4_2.removePlayer = L5_2
  function L5_2(A0_3, A1_3)
    local L2_3, L3_3, L4_3, L5_3, L6_3, L7_3, L8_3, L9_3, L10_3, L11_3
    L2_3 = pairs
    L3_3 = L4_2.players
    L2_3, L3_3, L4_3, L5_3 = L2_3(L3_3)
    for L6_3, L7_3 in L2_3, L3_3, L4_3, L5_3 do
      L8_3 = ConfigSv
      L8_3 = L8_3.AddItem
      L9_3 = L7_3.source
      L10_3 = A0_3
      L11_3 = A1_3
      L8_3(L9_3, L10_3, L11_3)
    end
    L2_3 = true
    return L2_3
  end
  L4_2.GiveGroupItem = L5_2
  function L5_2(A0_3, A1_3)
    local L2_3, L3_3, L4_3, L5_3, L6_3, L7_3, L8_3, L9_3, L10_3, L11_3, L12_3, L13_3, L14_3
    L2_3 = pairs
    L3_3 = L4_2.players
    L2_3, L3_3, L4_3, L5_3 = L2_3(L3_3)
    for L6_3, L7_3 in L2_3, L3_3, L4_3, L5_3 do
      if A1_3 then
        L8_3 = math
        L8_3 = L8_3.floor
        L9_3 = L4_2.playerCount
        L9_3 = A0_3 / L9_3
        L8_3 = L8_3(L9_3)
        if L8_3 then
          goto lbl_16
        end
      end
      L8_3 = A0_3
      ::lbl_16::
      L9_3 = ConfigSv
      L9_3 = L9_3.AddMoney
      L10_3 = L7_3.source
      L11_3 = L8_3
      L12_3 = L4_2.job
      L9_3(L10_3, L11_3, L12_3)
      L9_3 = A1_2
      if "fire_department" == L9_3 then
        L9_3 = TriggerClientEvent
        L10_3 = "wais:showNotification"
        L11_3 = L7_3.source
        L12_3 = Lang
        L13_3 = "fire_reward"
        L14_3 = L8_3
        L12_3 = L12_3(L13_3, L14_3)
        L13_3 = "success"
        L14_3 = 7500
        L9_3(L10_3, L11_3, L12_3, L13_3, L14_3)
      else
        L9_3 = A1_2
        if "farmer" == L9_3 then
          L9_3 = TriggerClientEvent
          L10_3 = "wais:showNotification"
          L11_3 = L7_3.source
          L12_3 = Lang
          L13_3 = "farmer_reward"
          L14_3 = L8_3
          L12_3 = L12_3(L13_3, L14_3)
          L13_3 = "success"
          L14_3 = 7500
          L9_3(L10_3, L11_3, L12_3, L13_3, L14_3)
        end
      end
    end
    return
  end
  L4_2.GiveGroupReward = L5_2
  function L5_2(A0_3, ...)
    local L1_3, L2_3, L3_3, L4_3, L5_3, L6_3, L7_3, L8_3, L9_3, L10_3
    L1_3 = pairs
    L2_3 = L4_2.players
    L1_3, L2_3, L3_3, L4_3 = L1_3(L2_3)
    for L5_3, L6_3 in L1_3, L2_3, L3_3, L4_3 do
      L7_3 = TriggerClientEvent
      L8_3 = A0_3
      L9_3 = L6_3.source
      L10_3 = ...
      L7_3(L8_3, L9_3, L10_3)
    end
    L1_3 = true
    return L1_3
  end
  L4_2.TriggerGroupEvent = L5_2
  function L5_2(A0_3)
    local L1_3
    L4_2.currentEventIndex = A0_3
  end
  L4_2.SetEventIndex = L5_2
  function L5_2(A0_3)
    local L1_3
    L4_2.currentEvent = A0_3
  end
  L4_2.SetEvent = L5_2
  function L5_2()
    local L0_3, L1_3, L2_3, L3_3, L4_3, L5_3, L6_3, L7_3, L8_3
    L0_3 = L4_2.currentEventIndex
    if 0 ~= L0_3 then
      L0_3 = L4_2.job
      if "project_car" == L0_3 then
        L0_3 = TriggerEvent
        L1_3 = "wais:projectcar:groupDeleted"
        L2_3 = L4_2.ownerId
        L3_3 = L4_2.currentEventIndex
        L0_3(L1_3, L2_3, L3_3)
      else
        L0_3 = L4_2.job
        if "diver" == L0_3 then
          L0_3 = TriggerEvent
          L1_3 = "wais:diver:groupDeleted"
          L2_3 = L4_2.ownerId
          L3_3 = L4_2.currentEventIndex
          L0_3(L1_3, L2_3, L3_3)
        else
          L0_3 = L4_2.job
          if "farmer" == L0_3 then
            L0_3 = TriggerEvent
            L1_3 = "wais:farmer:groupDeleted"
            L2_3 = L4_2.ownerId
            L3_3 = L4_2.groupId
            L4_3 = L4_2.currentEventIndex
            L0_3(L1_3, L2_3, L3_3, L4_3)
          else
            L0_3 = L4_2.job
            if "electrician" == L0_3 then
              L0_3 = L4_2.TriggerGroupEvent
              L1_3 = "wais:electrician:client:cancelMission"
              L0_3(L1_3)
            end
          end
        end
      end
    end
    L0_3 = pairs
    L1_3 = L4_2.players
    L0_3, L1_3, L2_3, L3_3 = L0_3(L1_3)
    for L4_3, L5_3 in L0_3, L1_3, L2_3, L3_3 do
      if nil ~= L5_3 then
        L6_3 = sourcesGroup
        L7_3 = tostring
        L8_3 = L5_3.source
        L7_3 = L7_3(L8_3)
        L6_3[L7_3] = nil
        L6_3 = TriggerClientEvent
        L7_3 = "wais:group:default"
        L8_3 = L5_3.source
        L6_3(L7_3, L8_3)
      end
    end
    L0_3 = Groups
    L1_3 = L3_2
    L0_3[L1_3] = nil
    L0_3 = nil
    L4_2 = L0_3
  end
  L4_2.deleteGroup = L5_2
  function L5_2(A0_3, A1_3, A2_3)
    local L3_3, L4_3, L5_3, L6_3, L7_3, L8_3, L9_3, L10_3, L11_3, L12_3, L13_3, L14_3
    L3_3 = pairs
    L4_3 = L4_2.players
    L3_3, L4_3, L5_3, L6_3 = L3_3(L4_3)
    for L7_3, L8_3 in L3_3, L4_3, L5_3, L6_3 do
      L9_3 = TriggerClientEvent
      L10_3 = "wais:showNotification"
      L11_3 = L8_3.source
      L12_3 = A0_3
      L13_3 = A1_3
      L14_3 = A2_3
      L9_3(L10_3, L11_3, L12_3, L13_3, L14_3)
    end
  end
  L4_2.sendGroupNotification = L5_2
  L5_2 = L4_2.addPlayer
  L6_2 = A0_2
  L5_2(L6_2)
  L5_2 = Groups
  L5_2[L3_2] = L4_2
end
CreateAGroup = L0_1