local L0_1, L1_1, L2_1
L0_1 = RegisterNetEvent
L1_1 = "wais:electrician:sync:crane"
function L2_1(A0_2, A1_2)
  local L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2
  L2_2 = source
  L3_2 = NetworkGetEntityFromNetworkId
  L4_2 = A0_2
  L3_2 = L3_2(L4_2)
  L4_2 = DoesEntityExist
  L5_2 = L3_2
  L4_2 = L4_2(L5_2)
  if L4_2 then
    L4_2 = Entity
    L5_2 = L3_2
    L4_2 = L4_2(L5_2)
    L4_2 = L4_2.state
    L5_2 = L4_2
    L4_2 = L4_2.set
    L6_2 = "craneData"
    L7_2 = A1_2
    L8_2 = true
    L4_2(L5_2, L6_2, L7_2, L8_2)
  end
end
L0_1(L1_1, L2_1)