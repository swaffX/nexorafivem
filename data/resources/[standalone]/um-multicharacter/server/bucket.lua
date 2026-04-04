local L0_1, L1_1, L2_1, L3_1
function L0_1(A0_2, A1_2)
  local L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2
  if not A0_2 then
    L2_2 = Debug
    L3_2 = "Source is nil"
    L4_2 = "error"
    return L2_2(L3_2, L4_2)
  end
  L2_2 = tonumber
  L3_2 = A0_2
  L2_2 = L2_2(L3_2)
  L2_2 = L2_2 + 1000
  L3_2 = A1_2 or L3_2
  if not A1_2 then
    L3_2 = "UNKWN"
  end
  L4_2 = SetPlayerRoutingBucket
  L5_2 = A0_2
  L6_2 = L2_2
  L4_2(L5_2, L6_2)
  L4_2 = Debug
  L5_2 = L3_2
  L6_2 = " Player Routing Bucket Set: "
  L7_2 = tostring
  L8_2 = source
  L7_2 = L7_2(L8_2)
  L8_2 = " - "
  L9_2 = L2_2
  L10_2 = ""
  L5_2 = L5_2 .. L6_2 .. L7_2 .. L8_2 .. L9_2 .. L10_2
  L4_2(L5_2)
end
L1_1 = lib
L1_1 = L1_1.callback
L1_1 = L1_1.register
L2_1 = "um-multi:bucket:setRandomBucket"
function L3_1(A0_2)
  local L1_2, L2_2, L3_2
  L1_2 = L0_1
  L2_2 = A0_2
  L3_2 = "Started: "
  L1_2(L2_2, L3_2)
end
L1_1(L2_1, L3_1)
L1_1 = AddEventHandler
L2_1 = "onResourceStart"
function L3_1(A0_2)
  local L1_2, L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2
  L1_2 = GetCurrentResourceName
  L1_2 = L1_2()
  if A0_2 ~= L1_2 then
    return
  end
  L1_2 = Wait
  L2_2 = 100
  L1_2(L2_2)
  L1_2 = ipairs
  L2_2 = GetPlayers
  L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2 = L2_2()
  L1_2, L2_2, L3_2, L4_2 = L1_2(L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2)
  for L5_2, L6_2 in L1_2, L2_2, L3_2, L4_2 do
    if not L6_2 then
      return
    end
    L7_2 = L0_1
    L8_2 = tonumber
    L9_2 = L6_2
    L8_2 = L8_2(L9_2)
    L9_2 = "Restart "
    L7_2(L8_2, L9_2)
    L7_2 = TriggerEvent
    L8_2 = "esx:playerLogout"
    L9_2 = tonumber
    L10_2 = L6_2
    L9_2, L10_2 = L9_2(L10_2)
    L7_2(L8_2, L9_2, L10_2)
    L7_2 = print
    L8_2 = "^2 Player "
    L9_2 = L6_2
    L10_2 = " has been logged out"
    L8_2 = L8_2 .. L9_2 .. L10_2
    L7_2(L8_2)
  end
end
L1_1(L2_1, L3_1)
