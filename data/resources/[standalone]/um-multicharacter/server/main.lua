local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1
L0_1 = Framework
L1_1 = L0_1
L0_1 = L0_1.ReadySQLGetJobs
L0_1(L1_1)
function L0_1(A0_2, A1_2)
  local L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2, L20_2, L21_2, L22_2, L23_2, L24_2
  L3_2 = A1_2
  L2_2 = A1_2.match
  L4_2 = Config
  L4_2 = L4_2.Prefix
  L5_2 = "(%d):"
  L4_2 = L4_2 .. L5_2
  L2_2 = L2_2(L3_2, L4_2)
  L3_2 = "%s%s:%s"
  L4_2 = L3_2
  L3_2 = L3_2.format
  L5_2 = Config
  L5_2 = L5_2.Prefix
  L6_2 = L2_2
  L7_2 = Framework
  L8_2 = L7_2
  L7_2 = L7_2.GetIdentifier
  L9_2 = A0_2
  L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2, L20_2, L21_2, L22_2, L23_2, L24_2 = L7_2(L8_2, L9_2)
  L3_2 = L3_2(L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2, L20_2, L21_2, L22_2, L23_2, L24_2)
  L4_2 = MySQL
  L4_2 = L4_2.scalar
  L4_2 = L4_2.await
  L5_2 = "SELECT identifier FROM users where identifier = ?"
  L6_2 = {}
  L7_2 = L3_2
  L6_2[1] = L7_2
  L4_2 = L4_2(L5_2, L6_2)
  L5_2 = #L4_2
  if L5_2 < 5 then
    L5_2 = AddLogs
    L6_2 = A0_2
    L7_2 = "[EXPLOIT!!!!]"
    L8_2 = "[2] User tried to delete character that does not belong to him"
    L9_2 = "red"
    L10_2 = "exploit"
    L5_2(L6_2, L7_2, L8_2, L9_2, L10_2)
    L5_2 = SetTimeout
    L6_2 = 5000
    function L7_2()
      local L0_3, L1_3, L2_3
      L0_3 = DropPlayer
      L1_3 = A0_2
      L2_3 = "Exploit Attempt 2"
      L0_3(L1_3, L2_3)
    end
    L5_2(L6_2, L7_2)
    return
  end
  if A1_2 == L4_2 then
    L5_2 = "SHOW TABLES LIKE ?"
    L6_2 = "SHOW COLUMNS FROM %s LIKE ?"
    L7_2 = "DELETE FROM %s WHERE %s = ?"
    L8_2 = DeleteTableList
    L8_2 = L8_2.Tables
    L8_2 = #L8_2
    L9_2 = {}
    L10_2 = 1
    L11_2 = L8_2
    L12_2 = 1
    for L13_2 = L10_2, L11_2, L12_2 do
      L14_2 = DeleteTableList
      L14_2 = L14_2.Tables
      L14_2 = L14_2[L13_2]
      L15_2 = MySQL
      L15_2 = L15_2.scalar
      L15_2 = L15_2.await
      L16_2 = L5_2
      L17_2 = {}
      L18_2 = L14_2.table
      L17_2[1] = L18_2
      L15_2 = L15_2(L16_2, L17_2)
      L16_2 = L14_2.table
      if L15_2 == L16_2 then
        L16_2 = MySQL
        L16_2 = L16_2.scalar
        L16_2 = L16_2.await
        L18_2 = L6_2
        L17_2 = L6_2.format
        L19_2 = L14_2.table
        L17_2 = L17_2(L18_2, L19_2)
        L18_2 = {}
        L19_2 = L14_2.column
        L18_2[1] = L19_2
        L16_2 = L16_2(L17_2, L18_2)
        if L16_2 then
          L17_2 = L14_2.type
          L17_2 = A1_2 or L17_2
          if "identifier" ~= L17_2 or not A1_2 then
            L17_2 = Framework
            L18_2 = L17_2
            L17_2 = L17_2.getPlayerIdentifierType
            L19_2 = A0_2
            L20_2 = L14_2.type
            L17_2 = L17_2(L18_2, L19_2, L20_2)
          end
          L18_2 = table
          L18_2 = L18_2.insert
          L19_2 = L9_2
          L20_2 = {}
          L22_2 = L7_2
          L21_2 = L7_2.format
          L23_2 = L14_2.table
          L24_2 = L14_2.column
          L21_2 = L21_2(L22_2, L23_2, L24_2)
          L20_2.query = L21_2
          L21_2 = {}
          L22_2 = L17_2
          L21_2[1] = L22_2
          L20_2.values = L21_2
          L18_2(L19_2, L20_2)
        else
          L17_2 = Debug
          L18_2 = "Column "
          L19_2 = L14_2.column
          L20_2 = " does not exist in table "
          L21_2 = L14_2.table
          L18_2 = L18_2 .. L19_2 .. L20_2 .. L21_2
          L17_2(L18_2)
        end
      else
        L16_2 = Debug
        L17_2 = "Table "
        L18_2 = L14_2.table
        L19_2 = " does not exist."
        L17_2 = L17_2 .. L18_2 .. L19_2
        L16_2(L17_2)
      end
    end
    L10_2 = #L9_2
    if L10_2 > 0 then
      L10_2 = MySQL
      L10_2 = L10_2.transaction
      L11_2 = L9_2
      function L12_2(A0_3)
        local L1_3, L2_3, L3_3, L4_3, L5_3, L6_3
        if A0_3 then
          L1_3 = TriggerClientEvent
          L2_3 = "um-multicharacter:client:chooseChar"
          L3_3 = A0_2
          L1_3(L2_3, L3_3)
          L1_3 = Debug
          L2_3 = "Character Deleted"
          L3_3 = A1_2
          L2_3 = L2_3 .. L3_3
          L1_3(L2_3)
          L1_3 = AddLogs
          L2_3 = A0_2
          L3_3 = "[DELETE]"
          L4_3 = "Character Deleted | Identifier: "
          L5_3 = A1_2
          L4_3 = L4_3 .. L5_3
          L5_3 = "red"
          L6_3 = "deletecharacter"
          L1_3(L2_3, L3_3, L4_3, L5_3, L6_3)
        end
      end
      L10_2(L11_2, L12_2)
    end
  else
    L5_2 = AddLogs
    L6_2 = A0_2
    L7_2 = "[EXPLOIT!!!!]"
    L8_2 = "User tried to delete character that does not belong to him"
    L9_2 = "red"
    L10_2 = "exploit"
    L5_2(L6_2, L7_2, L8_2, L9_2, L10_2)
    L5_2 = SetTimeout
    L6_2 = 5000
    function L7_2()
      local L0_3, L1_3, L2_3
      L0_3 = DropPlayer
      L1_3 = A0_2
      L2_3 = "Exploit Attempt 2"
      L0_3(L1_3, L2_3)
    end
    L5_2(L6_2, L7_2)
  end
end
L1_1 = lib
L1_1 = L1_1.callback
L1_1 = L1_1.register
L2_1 = "um-multicharacter:server:GetCharacters"
function L3_1(A0_2)
  local L1_2, L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2
  if not A0_2 then
    return
  end
  L1_2 = A0_2
  L2_2 = {}
  L3_2 = GetNumberCharactersSlot
  L4_2 = L1_2
  L3_2 = L3_2(L4_2)
  L4_2 = Debug
  L5_2 = "Total Number of Slots: "
  L6_2 = L3_2
  L5_2 = L5_2 .. L6_2
  L4_2(L5_2)
  L4_2 = Framework
  L5_2 = L4_2
  L4_2 = L4_2.SQLQuery
  L6_2 = L1_2
  L4_2 = L4_2(L5_2, L6_2)
  if nil ~= L4_2 then
    L5_2 = next
    L6_2 = L4_2
    L5_2 = L5_2(L6_2)
    if L5_2 then
      L5_2 = 1
      L6_2 = #L4_2
      L7_2 = 1
      for L8_2 = L5_2, L6_2, L7_2 do
        L9_2 = tonumber
        L10_2 = string
        L10_2 = L10_2.sub
        L11_2 = L4_2[L8_2]
        L11_2 = L11_2.identifier
        L12_2 = Config
        L12_2 = L12_2.Prefix
        L12_2 = #L12_2
        L12_2 = L12_2 + 1
        L13_2 = string
        L13_2 = L13_2.find
        L14_2 = L4_2[L8_2]
        L14_2 = L14_2.identifier
        L15_2 = ":"
        L13_2 = L13_2(L14_2, L15_2)
        L13_2 = L13_2 - 1
        L10_2, L11_2, L12_2, L13_2, L14_2, L15_2 = L10_2(L11_2, L12_2, L13_2)
        L9_2 = L9_2(L10_2, L11_2, L12_2, L13_2, L14_2, L15_2)
        L10_2 = L4_2[L8_2]
        L11_2 = json
        L11_2 = L11_2.decode
        L12_2 = L4_2[L8_2]
        L12_2 = L12_2.accounts
        L11_2 = L11_2(L12_2)
        L10_2.accounts = L11_2
        L10_2 = L4_2[L8_2]
        L10_2.cid = L9_2
        L10_2 = L4_2[L8_2]
        L11_2 = Framework
        L12_2 = L11_2
        L11_2 = L11_2.GetJobLabel
        L13_2 = L4_2[L8_2]
        L13_2 = L13_2.job
        L14_2 = L4_2[L8_2]
        L14_2 = L14_2.job_grade
        L11_2 = L11_2(L12_2, L13_2, L14_2)
        if not L11_2 then
          L11_2 = "unemployed"
        end
        L10_2.job = L11_2
        L10_2 = tonumber
        L11_2 = L9_2
        L10_2 = L10_2(L11_2)
        L11_2 = L4_2[L8_2]
        L2_2[L10_2] = L11_2
      end
      L5_2 = Debug
      L6_2 = "Characters loaded for "
      L7_2 = GetPlayerName
      L8_2 = L1_2
      L7_2 = L7_2(L8_2)
      L8_2 = " ("
      L9_2 = L1_2
      L10_2 = ")"
      L6_2 = L6_2 .. L7_2 .. L8_2 .. L9_2 .. L10_2
      L5_2(L6_2)
      L5_2 = L2_2
      L6_2 = L3_2
      return L5_2, L6_2
  end
  else
    L5_2 = Debug
    L6_2 = "Not Characters Data | New Player"
    L5_2(L6_2)
    L5_2 = nil
    L6_2 = Config
    L6_2 = L6_2.DefaultSlots
    return L5_2, L6_2
  end
end
L1_1(L2_1, L3_1)
L1_1 = {}
function L2_1(A0_2)
  local L1_2, L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2
  L1_2 = A0_2
  L2_2 = 0
  while true do
    L3_2 = Framework
    L4_2 = L3_2
    L3_2 = L3_2.GetPlayer
    L5_2 = L1_2
    L3_2 = L3_2(L4_2, L5_2)
    if L3_2 then
      break
    end
    L3_2 = 1000
    if not (L2_2 < L3_2) then
      break
    end
    L2_2 = L2_2 + 1
    L3_2 = Wait
    L4_2 = 0
    L3_2(L4_2)
  end
  L3_2 = Player
  L4_2 = L1_2
  L3_2 = L3_2(L4_2)
  L3_2 = L3_2.state
  L4_2 = Framework
  L5_2 = L4_2
  L4_2 = L4_2.GetPlayer
  L6_2 = L1_2
  L4_2 = L4_2(L5_2, L6_2)
  L4_2 = L4_2.identifier
  if L4_2 then
    L5_2 = Debug
    L6_2 = "Identifier set"
    L5_2(L6_2)
    L6_2 = L3_2
    L5_2 = L3_2.set
    L7_2 = "identifier"
    L8_2 = Framework
    L9_2 = L8_2
    L8_2 = L8_2.GetPlayer
    L10_2 = L1_2
    L8_2 = L8_2(L9_2, L10_2)
    L8_2 = L8_2.identifier
    L9_2 = true
    L5_2(L6_2, L7_2, L8_2, L9_2)
  end
  L5_2 = true
  return L5_2
end
L3_1 = lib
L3_1 = L3_1.callback
L3_1 = L3_1.register
L4_1 = "um-multicharacter:server:loadUserData"
function L5_1(A0_2, A1_2)
  local L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2
  if not A0_2 then
    return
  end
  L2_2 = A0_2
  L3_2 = tonumber
  L4_2 = string
  L4_2 = L4_2.sub
  L5_2 = A1_2.identifier
  L6_2 = Config
  L6_2 = L6_2.Prefix
  L6_2 = #L6_2
  L6_2 = L6_2 + 1
  L7_2 = string
  L7_2 = L7_2.find
  L8_2 = A1_2.identifier
  L9_2 = ":"
  L7_2 = L7_2(L8_2, L9_2)
  L7_2 = L7_2 - 1
  L4_2, L5_2, L6_2, L7_2, L8_2, L9_2 = L4_2(L5_2, L6_2, L7_2)
  L3_2 = L3_2(L4_2, L5_2, L6_2, L7_2, L8_2, L9_2)
  L4_2 = Framework
  L5_2 = L4_2
  L4_2 = L4_2.GetPlayerFromIdentifier
  L6_2 = L3_2
  L4_2 = L4_2(L5_2, L6_2)
  if L4_2 then
    L4_2 = DropPlayer
    L5_2 = A0_2
    L6_2 = "Your identifier "
    L7_2 = A1_2.identifier
    L8_2 = " is already on the server!"
    L6_2 = L6_2 .. L7_2 .. L8_2
    L4_2(L5_2, L6_2)
    return
  end
  L4_2 = print
  L5_2 = "^2[PLAY GAME]^7 "
  L6_2 = GetPlayerName
  L7_2 = L2_2
  L6_2 = L6_2(L7_2)
  L7_2 = " (CharID: "
  L8_2 = L3_2
  L9_2 = ") user has joined the server "
  L5_2 = L5_2 .. L6_2 .. L7_2 .. L8_2 .. L9_2
  L4_2(L5_2)
  L4_2 = SetPlayerRoutingBucket
  L5_2 = L2_2
  L6_2 = 0
  L4_2(L5_2, L6_2)
  L4_2 = TriggerEvent
  L5_2 = "esx:onPlayerJoined"
  L6_2 = L2_2
  L7_2 = Config
  L7_2 = L7_2.Prefix
  L8_2 = L3_2
  L7_2 = L7_2 .. L8_2
  L4_2(L5_2, L6_2, L7_2)
  L4_2 = L2_1
  L5_2 = L2_2
  L4_2(L5_2)
  L4_2 = AddLogs
  L5_2 = L2_2
  L6_2 = "[PLAY GAME]"
  L7_2 = "User has joined the server | CharID: "
  L8_2 = L3_2
  L7_2 = L7_2 .. L8_2
  L8_2 = "green"
  L9_2 = "playgame"
  L4_2(L5_2, L6_2, L7_2, L8_2, L9_2)
end
L3_1(L4_1, L5_1)
L3_1 = RegisterNetEvent
L4_1 = Config
L4_1 = L4_1.ESXEvents
L4_1 = L4_1.createCharacter
function L5_1(A0_2, A1_2)
  local L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2
  L2_2 = A0_2
  L3_2 = L1_1
  L3_2 = L3_2[L2_2]
  if L3_2 then
    return
  end
  L3_2 = L1_1
  L4_2 = GetPlayerIdentifierByType
  L5_2 = L2_2
  L6_2 = "license2"
  L4_2 = L4_2(L5_2, L6_2)
  L3_2[L2_2] = L4_2
  L3_2 = print
  L4_2 = "^2[CREATE CHARACTER]^7 "
  L5_2 = GetPlayerName
  L6_2 = L2_2
  L5_2 = L5_2(L6_2)
  L6_2 = " User has created new character"
  L4_2 = L4_2 .. L5_2 .. L6_2
  L3_2(L4_2)
  L3_2 = SetPlayerRoutingBucket
  L4_2 = L2_2
  L5_2 = 0
  L3_2(L4_2, L5_2)
  L3_2 = TriggerEvent
  L4_2 = "esx:onPlayerJoined"
  L5_2 = L2_2
  L6_2 = Config
  L6_2 = L6_2.Prefix
  L7_2 = A1_2.cid
  L6_2 = L6_2 .. L7_2
  L7_2 = A1_2
  L3_2(L4_2, L5_2, L6_2, L7_2)
  L3_2 = L2_1
  L4_2 = L2_2
  L3_2(L4_2)
  L3_2 = GiveStarterItems
  L4_2 = L2_2
  L3_2(L4_2)
  L3_2 = AddLogs
  L4_2 = L2_2
  L5_2 = "[CREATE]"
  L6_2 = "Character Created | CharID: "
  L7_2 = Config
  L7_2 = L7_2.Prefix
  L8_2 = A1_2.cid
  L6_2 = L6_2 .. L7_2 .. L8_2
  L7_2 = "purple"
  L8_2 = "createcharacter"
  L3_2(L4_2, L5_2, L6_2, L7_2, L8_2)
end
L3_1(L4_1, L5_1)
L3_1 = lib
L3_1 = L3_1.callback
L3_1 = L3_1.register
L4_1 = "um-multicharacter:server:deleteCharacter"
function L5_1(A0_2, A1_2)
  local L2_2, L3_2, L4_2
  if not A0_2 or not A1_2 then
    return
  end
  L2_2 = L0_1
  L3_2 = A0_2
  L4_2 = A1_2
  L2_2(L3_2, L4_2)
end
L3_1(L4_1, L5_1)
L3_1 = RegisterNetEvent
L4_1 = "um-multicharacter:server:disconnect"
function L5_1()
  local L0_2, L1_2, L2_2, L3_2
  L0_2 = source
  L1_2 = DropPlayer
  L2_2 = L0_2
  L3_2 = "Multicharacter Disconnect"
  L1_2(L2_2, L3_2)
end
L3_1(L4_1, L5_1)
L3_1 = {}
L4_1 = {}
function L5_1(A0_2, A1_2)
  local L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2
  L2_2 = "%s %s"
  L3_2 = L2_2
  L2_2 = L2_2.format
  L4_2 = A1_2.firstName
  L5_2 = A1_2.lastName
  L2_2 = L2_2(L3_2, L4_2, L5_2)
  L3_2 = A0_2.setName
  L4_2 = L2_2
  L3_2(L4_2)
  L3_2 = A0_2.set
  L4_2 = "firstName"
  L5_2 = A1_2.firstName
  L3_2(L4_2, L5_2)
  L3_2 = A0_2.set
  L4_2 = "lastName"
  L5_2 = A1_2.lastName
  L3_2(L4_2, L5_2)
  L3_2 = A0_2.set
  L4_2 = "dateofbirth"
  L5_2 = A1_2.dateOfBirth
  L3_2(L4_2, L5_2)
  L3_2 = A0_2.set
  L4_2 = "sex"
  L5_2 = A1_2.sex
  L3_2(L4_2, L5_2)
  L3_2 = A0_2.set
  L4_2 = "height"
  L5_2 = A1_2.height
  L3_2(L4_2, L5_2)
  L3_2 = Player
  L4_2 = A0_2.source
  L3_2 = L3_2(L4_2)
  L3_2 = L3_2.state
  L5_2 = L3_2
  L4_2 = L3_2.set
  L6_2 = "name"
  L7_2 = L2_2
  L8_2 = true
  L4_2(L5_2, L6_2, L7_2, L8_2)
  L5_2 = L3_2
  L4_2 = L3_2.set
  L6_2 = "firstName"
  L7_2 = A1_2.firstName
  L8_2 = true
  L4_2(L5_2, L6_2, L7_2, L8_2)
  L5_2 = L3_2
  L4_2 = L3_2.set
  L6_2 = "lastName"
  L7_2 = A1_2.lastName
  L8_2 = true
  L4_2(L5_2, L6_2, L7_2, L8_2)
  L5_2 = L3_2
  L4_2 = L3_2.set
  L6_2 = "dateofbirth"
  L7_2 = A1_2.dateOfBirth
  L8_2 = true
  L4_2(L5_2, L6_2, L7_2, L8_2)
  L5_2 = L3_2
  L4_2 = L3_2.set
  L6_2 = "sex"
  L7_2 = A1_2.sex
  L8_2 = true
  L4_2(L5_2, L6_2, L7_2, L8_2)
  L5_2 = L3_2
  L4_2 = L3_2.set
  L6_2 = "height"
  L7_2 = A1_2.height
  L8_2 = true
  L4_2(L5_2, L6_2, L7_2, L8_2)
end
function L6_1(A0_2, A1_2)
  local L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2
  L2_2 = MySQL
  L2_2 = L2_2.update
  L2_2 = L2_2.await
  L3_2 = "UPDATE users SET firstname = ?, lastname = ?, dateofbirth = ?, sex = ?, height = ? WHERE identifier = ?"
  L4_2 = {}
  L5_2 = A1_2.firstName
  L6_2 = A1_2.lastName
  L7_2 = A1_2.dateOfBirth
  L8_2 = A1_2.sex
  L9_2 = A1_2.height
  L10_2 = A0_2
  L4_2[1] = L5_2
  L4_2[2] = L6_2
  L4_2[3] = L7_2
  L4_2[4] = L8_2
  L4_2[5] = L9_2
  L4_2[6] = L10_2
  L2_2(L3_2, L4_2)
end
L7_1 = lib
L7_1 = L7_1.callback
L7_1 = L7_1.register
L8_1 = "um-multicharacter:register"
function L9_1(A0_2, A1_2)
  local L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2
  if not A0_2 then
    return
  end
  L2_2 = A0_2
  L3_2 = Framework
  L4_2 = L3_2
  L3_2 = L3_2.GetPlayer
  L5_2 = L2_2
  L3_2 = L3_2(L4_2, L5_2)
  L4_2 = ValidateRegistration
  L5_2 = A1_2
  L4_2, L5_2 = L4_2(L5_2)
  if not L4_2 then
    L6_2 = type
    L7_2 = L5_2
    L6_2 = L6_2(L7_2)
    if "table" == L6_2 then
      L6_2 = pairs
      L7_2 = L5_2
      L6_2, L7_2, L8_2, L9_2 = L6_2(L7_2)
      for L10_2, L11_2 in L6_2, L7_2, L8_2, L9_2 do
        L12_2 = TriggerClientEvent
        L13_2 = "esx:showNotification"
        L14_2 = L2_2
        L15_2 = L11_2
        L16_2 = "error"
        L12_2(L13_2, L14_2, L15_2, L16_2)
      end
      return
    end
  end
  L6_2 = Debug
  L7_2 = L5_2
  L8_2 = [[
 
 ]]
  L9_2 = json
  L9_2 = L9_2.encode
  L10_2 = A1_2
  L9_2 = L9_2(L10_2)
  L7_2 = L7_2 .. L8_2 .. L9_2
  L6_2(L7_2)
  if L3_2 then
    L6_2 = Debug
    L7_2 = "xPlayer found first steps working"
    L8_2 = json
    L8_2 = L8_2.encode
    L9_2 = L3_2.identifier
    L8_2 = L8_2(L9_2)
    L7_2 = L7_2 .. L8_2
    L6_2(L7_2)
    L7_2 = L3_2.identifier
    L6_2 = L4_1
    L6_2 = L6_2[L7_2]
    if L6_2 then
      L6_2 = TriggerClientEvent
      L7_2 = "esx:showNotification"
      L8_2 = L2_2
      L9_2 = "Already Registered"
      L10_2 = "error"
      L6_2(L7_2, L8_2, L9_2, L10_2)
      L6_2 = false
      return L6_2
    end
    L7_2 = L3_2.identifier
    L6_2 = L3_1
    L8_2 = {}
    L9_2 = A1_2.firstname
    L8_2.firstName = L9_2
    L9_2 = A1_2.lastname
    L8_2.lastName = L9_2
    L9_2 = A1_2.dateofbirth
    L8_2.dateOfBirth = L9_2
    L9_2 = A1_2.sex
    L8_2.sex = L9_2
    L9_2 = A1_2.height
    L8_2.height = L9_2
    L6_2[L7_2] = L8_2
    L7_2 = L3_2.identifier
    L6_2 = L3_1
    L6_2 = L6_2[L7_2]
    L7_2 = L5_1
    L8_2 = L3_2
    L9_2 = L6_2
    L7_2(L8_2, L9_2)
    L7_2 = TriggerClientEvent
    L8_2 = "esx_identity:setPlayerData"
    L9_2 = L3_2.source
    L10_2 = L6_2
    L7_2(L8_2, L9_2, L10_2)
    L7_2 = L6_1
    L8_2 = L3_2.identifier
    L9_2 = L6_2
    L7_2(L8_2, L9_2)
    L8_2 = L3_2.identifier
    L7_2 = L4_1
    L7_2[L8_2] = true
    L8_2 = L3_2.identifier
    L7_2 = L3_1
    L7_2[L8_2] = nil
    L7_2 = true
    return L7_2
  end
  L6_2 = Debug
  L7_2 = "xPlayer not found, second step working"
  L6_2(L7_2)
  L6_2 = {}
  L7_2 = A1_2.firstname
  L6_2.firstName = L7_2
  L7_2 = A1_2.lastname
  L6_2.lastName = L7_2
  L7_2 = A1_2.dateofbirth
  L6_2.dateOfBirth = L7_2
  L7_2 = A1_2.sex
  L6_2.sex = L7_2
  L7_2 = A1_2.height
  L6_2.height = L7_2
  L7_2 = TriggerEvent
  L8_2 = Config
  L8_2 = L8_2.ESXEvents
  L8_2 = L8_2.createCharacter
  L9_2 = A0_2
  L10_2 = A1_2
  L7_2(L8_2, L9_2, L10_2)
  L7_2 = TriggerClientEvent
  L8_2 = "um-multicharacter:setPlayerData"
  L9_2 = A0_2
  L10_2 = L6_2
  L7_2(L8_2, L9_2, L10_2)
  L7_2 = true
  return L7_2
end
L7_1(L8_1, L9_1)
