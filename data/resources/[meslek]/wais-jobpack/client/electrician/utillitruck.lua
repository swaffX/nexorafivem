local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1, L10_1, L11_1, L12_1, L13_1, L14_1, L15_1, L16_1, L17_1, L18_1, L19_1, L20_1, L21_1, L22_1, L23_1, L24_1
L0_1 = {}
L1_1 = {}
L1_1.dict = "va_utillitruck"
L1_1.anim = "crane"
L2_1 = {}
L2_1.dict = "v_boomtruck"
L2_1.anim = "rotate_crane_base"
L0_1[1] = L1_1
L0_1[2] = L2_1
L1_1 = {}
L1_1.ambient = "Crane"
L1_1.script = "Container_Lifter"
L1_1.scene = "DOCKS_HEIST_USING_CRANE"
L1_1.name = "Move_U_D"
L1_1.ref = "CRANE_SOUNDS"
L2_1 = false
L3_1 = 1
L4_1 = L0_1[L3_1]
L4_1 = L4_1.dict
L5_1 = L0_1[L3_1]
L5_1 = L5_1.anim
L6_1 = {}
L6_1[1] = 0.0
L6_1[2] = 0.0
L7_1 = -1
L8_1 = false
L9_1 = false
L10_1 = 0
L11_1 = 0
L12_1 = {}
L13_1 = nil
inElectricianFixZone = false
function L14_1()
  local L0_2, L1_2, L2_2
  L0_2 = lib
  L0_2 = L0_2.array
  L0_2 = L0_2.forEach
  L1_2 = L0_1
  function L2_2(A0_3)
    local L1_3, L2_3
    L1_3 = lib
    L1_3 = L1_3.requestAnimDict
    L2_3 = A0_3.dict
    L1_3(L2_3)
  end
  L0_2(L1_2, L2_2)
  L0_2 = RequestAmbientAudioBank
  L1_2 = L1_1.ambient
  L2_2 = false
  L0_2(L1_2, L2_2)
  L0_2 = lib
  L0_2 = L0_2.requestAudioBank
  L1_2 = L1_1.script
  L0_2(L1_2)
end
function L15_1(A0_2)
  local L1_2, L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2
  L1_2 = L3_1
  if 1 ~= L1_2 then
    L1_2 = L0_1
    L1_2 = L1_2[1]
    L1_2 = L1_2.anim
    L5_1 = L1_2
    L1_2 = L0_1
    L1_2 = L1_2[1]
    L1_2 = L1_2.dict
    L4_1 = L1_2
    L1_2 = 1
    L3_1 = L1_2
  end
  L1_2 = IsEntityPlayingAnim
  L2_2 = L2_1
  L3_2 = L4_1
  L4_2 = L5_1
  L5_2 = 3
  L1_2 = L1_2(L2_2, L3_2, L4_2, L5_2)
  if not L1_2 then
    L1_2 = PlayEntityAnim
    L2_2 = L2_1
    L3_2 = L5_1
    L4_2 = L4_1
    L5_2 = 8.0
    L6_2 = false
    L7_2 = true
    L8_2 = false
    L9_2 = 0.0
    L10_2 = 3
    L1_2(L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2)
    L1_2 = Wait
    L2_2 = 0
    L1_2(L2_2)
    L1_2 = SetEntityAnimCurrentTime
    L2_2 = L2_1
    L3_2 = L4_1
    L4_2 = L5_1
    L6_2 = L3_1
    L5_2 = L6_1
    L5_2 = L5_2[L6_2]
    L1_2(L2_2, L3_2, L4_2, L5_2)
  end
  L1_2 = SetEntityAnimSpeed
  L2_2 = L2_1
  L3_2 = L4_1
  L4_2 = L5_1
  L5_2 = 0.1 * A0_2
  L1_2(L2_2, L3_2, L4_2, L5_2)
  L2_2 = L3_1
  L1_2 = L6_1
  L3_2 = GetEntityAnimCurrentTime
  L4_2 = L2_1
  L5_2 = L4_1
  L6_2 = L5_1
  L3_2 = L3_2(L4_2, L5_2, L6_2)
  L1_2[L2_2] = L3_2
end
function L16_1(A0_2)
  local L1_2, L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2
  L1_2 = L3_1
  if 2 ~= L1_2 then
    L1_2 = L0_1
    L1_2 = L1_2[2]
    L1_2 = L1_2.anim
    L5_1 = L1_2
    L1_2 = L0_1
    L1_2 = L1_2[2]
    L1_2 = L1_2.dict
    L4_1 = L1_2
    L1_2 = 2
    L3_1 = L1_2
  end
  L1_2 = IsEntityPlayingAnim
  L2_2 = L2_1
  L3_2 = L4_1
  L4_2 = L5_1
  L5_2 = 3
  L1_2 = L1_2(L2_2, L3_2, L4_2, L5_2)
  if not L1_2 then
    L1_2 = PlayEntityAnim
    L2_2 = L2_1
    L3_2 = L5_1
    L4_2 = L4_1
    L5_2 = 8.0
    L6_2 = false
    L7_2 = true
    L8_2 = false
    L9_2 = 0.0
    L10_2 = 3
    L1_2(L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2)
    L1_2 = Wait
    L2_2 = 0
    L1_2(L2_2)
    L1_2 = SetEntityAnimCurrentTime
    L2_2 = L2_1
    L3_2 = L4_1
    L4_2 = L5_1
    L6_2 = L3_1
    L5_2 = L6_1
    L5_2 = L5_2[L6_2]
    L1_2(L2_2, L3_2, L4_2, L5_2)
  end
  L1_2 = L6_1
  L1_2 = L1_2[2]
  if (1 == A0_2 and L1_2 >= 1) or (-1 == A0_2 and 0 == L1_2) then
    if 1 == A0_2 then
      L1_2 = 0.0
    else
      L1_2 = 1.0
    end
    L2_2 = L6_1
    L2_2[2] = L1_2
    L2_2 = SetEntityAnimCurrentTime
    L3_2 = L2_1
    L4_2 = L4_1
    L5_2 = L5_1
    L6_2 = L1_2
    L2_2(L3_2, L4_2, L5_2, L6_2)
    L2_2 = Wait
    L3_2 = 0
    L2_2(L3_2)
  end
  L1_2 = SetEntityAnimSpeed
  L2_2 = L2_1
  L3_2 = L4_1
  L4_2 = L5_1
  L5_2 = 0.1 * A0_2
  L1_2(L2_2, L3_2, L4_2, L5_2)
  L2_2 = L3_1
  L1_2 = L6_1
  L3_2 = GetEntityAnimCurrentTime
  L4_2 = L2_1
  L5_2 = L4_1
  L6_2 = L5_1
  L3_2 = L3_2(L4_2, L5_2, L6_2)
  L1_2[L2_2] = L3_2
end
function L17_1(A0_2)
  local L1_2, L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2
  L1_2 = false
  L2_2 = GetEntityCoords
  L3_2 = A0_2
  L2_2 = L2_2(L3_2)
  L3_2 = lib
  L3_2 = L3_2.getNearbyPlayers
  L4_2 = L2_2
  L5_2 = 3.0
  L3_2 = L3_2(L4_2, L5_2)
  L4_2 = GetEntityBoneIndexByName
  L5_2 = A0_2
  L6_2 = Config
  L6_2 = L6_2.Jobs
  L6_2 = L6_2.electrician
  L6_2 = L6_2.bucket_ped_positions
  L6_2 = L6_2.bone
  L4_2 = L4_2(L5_2, L6_2)
  L5_2 = GetWorldPositionOfEntityBone
  L6_2 = A0_2
  L7_2 = L4_2
  L5_2 = L5_2(L6_2, L7_2)
  L6_2 = pairs
  L7_2 = L3_2
  L6_2, L7_2, L8_2, L9_2 = L6_2(L7_2)
  for L10_2, L11_2 in L6_2, L7_2, L8_2, L9_2 do
    L12_2 = GetEntityCoords
    L13_2 = L11_2.ped
    L12_2 = L12_2(L13_2)
    L13_2 = L12_2 - L5_2
    L13_2 = #L13_2
    L14_2 = 1.5
    if L13_2 < L14_2 then
      L1_2 = true
      break
    end
  end
  return L1_2
end
function L18_1(A0_2)
  local L1_2, L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2
  L1_2 = false
  L2_2 = -1
  L3_2 = 0
  L4_2 = 1
  for L5_2 = L2_2, L3_2, L4_2 do
    L6_2 = IsVehicleSeatFree
    L7_2 = A0_2
    L8_2 = L5_2
    L6_2 = L6_2(L7_2, L8_2)
    if L6_2 then
      L6_2 = SetPedIntoVehicle
      L7_2 = PlayerPedId
      L7_2 = L7_2()
      L8_2 = A0_2
      L9_2 = L5_2
      L6_2(L7_2, L8_2, L9_2)
      L1_2 = true
      break
    end
  end
  return L1_2
end
function L19_1(A0_2)
  local L1_2, L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2
  L1_2 = PlayerPedId
  L1_2 = L1_2()
  L13_1 = A0_2
  L2_2 = TaskLeaveVehicle
  L3_2 = L1_2
  L4_2 = A0_2
  L5_2 = 16
  L2_2(L3_2, L4_2, L5_2)
  while true do
    L2_2 = GetVehiclePedIsIn
    L3_2 = L1_2
    L4_2 = false
    L2_2 = L2_2(L3_2, L4_2)
    if L2_2 ~= A0_2 then
      break
    end
    L2_2 = Wait
    L3_2 = 250
    L2_2(L3_2)
  end
  L2_2 = Config
  L2_2 = L2_2.Jobs
  L2_2 = L2_2.electrician
  L2_2 = L2_2.bucket_ped_positions
  L2_2 = L2_2.coords
  L3_2 = Config
  L3_2 = L3_2.Jobs
  L3_2 = L3_2.electrician
  L3_2 = L3_2.bucket_ped_positions
  L3_2 = L3_2.rotation
  L4_2 = AttachEntityToEntity
  L5_2 = L1_2
  L6_2 = L13_1
  L7_2 = GetEntityBoneIndexByName
  L8_2 = L13_1
  L9_2 = Config
  L9_2 = L9_2.Jobs
  L9_2 = L9_2.electrician
  L9_2 = L9_2.bucket_ped_positions
  L9_2 = L9_2.bone
  L7_2 = L7_2(L8_2, L9_2)
  L8_2 = L2_2.x
  L9_2 = L2_2.y
  L10_2 = L2_2.z
  L11_2 = L3_2.x
  L12_2 = L3_2.y
  L13_2 = L3_2.z
  L14_2 = true
  L15_2 = true
  L16_2 = true
  L17_2 = true
  L18_2 = 1
  L19_2 = true
  L4_2(L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2)
  L4_2 = ClearPedTasks
  L5_2 = L1_2
  L4_2(L5_2)
  L4_2 = ClearPedTasksImmediately
  L5_2 = L1_2
  L4_2(L5_2)
  L4_2 = true
  L9_1 = L4_2
end
function L20_1()
  local L0_2, L1_2
  L0_2 = nil
  L13_1 = L0_2
  L0_2 = false
  L9_1 = L0_2
  L0_2 = lib
  L0_2 = L0_2.hideTextUI
  L0_2()
end
L21_1 = AddStateBagChangeHandler
L22_1 = "craneData"
L23_1 = nil
function L24_1(A0_2, A1_2, A2_2)
  local L3_2, L4_2, L5_2, L6_2, L7_2, L8_2
  if not A2_2 then
    return
  end
  L3_2 = GetEntityFromStateBagName
  L4_2 = A0_2
  L3_2 = L3_2(L4_2)
  L4_2 = DoesEntityExist
  L5_2 = L3_2
  L4_2 = L4_2(L5_2)
  if not L4_2 then
    return
  end
  L4_2 = GetPedInVehicleSeat
  L5_2 = L3_2
  L6_2 = -1
  L4_2 = L4_2(L5_2, L6_2)
  L5_2 = PlayerPedId
  L5_2 = L5_2()
  if L4_2 == L5_2 then
    return
  end
  L4_2 = L12_1
  L4_2 = L4_2[L3_2]
  if nil == L4_2 then
    L4_2 = L12_1
    L5_2 = {}
    L6_2 = {}
    L6_2.mode = 0
    L6_2.time = 0.0
    L5_2.x = L6_2
    L6_2 = {}
    L6_2.mode = 0
    L6_2.time = 0.0
    L5_2.y = L6_2
    L4_2[L3_2] = L5_2
  end
  function L4_2(A0_3, A1_3)
    local L2_3, L3_3, L4_3, L5_3, L6_3, L7_3, L8_3, L9_3, L10_3, L11_3, L12_3, L13_3
    L2_3 = L0_1
    L2_3 = L2_3[1]
    L2_3 = L2_3.dict
    L3_3 = L0_1
    L3_3 = L3_3[1]
    L3_3 = L3_3.anim
    L4_3 = PlayEntityAnim
    L5_3 = L3_2
    L6_3 = L3_3
    L7_3 = L2_3
    L8_3 = 8.0
    L9_3 = false
    L10_3 = true
    L11_3 = false
    L12_3 = 0.0
    L13_3 = 3
    L4_3(L5_3, L6_3, L7_3, L8_3, L9_3, L10_3, L11_3, L12_3, L13_3)
    L4_3 = Wait
    L5_3 = 0
    L4_3(L5_3)
    L4_3 = SetEntityAnimCurrentTime
    L5_3 = L3_2
    L6_3 = L2_3
    L7_3 = L3_3
    L8_3 = A1_3
    L4_3(L5_3, L6_3, L7_3, L8_3)
    L4_3 = Wait
    L5_3 = 0
    L4_3(L5_3)
    L4_3 = SetEntityAnimSpeed
    L5_3 = L3_2
    L6_3 = L2_3
    L7_3 = L3_3
    L8_3 = 0.0
    L4_3(L5_3, L6_3, L7_3, L8_3)
    L5_3 = L3_2
    L4_3 = L12_1
    L4_3 = L4_3[L5_3]
    L4_3 = L4_3.x
    L4_3.time = A1_3
    L5_3 = L3_2
    L4_3 = L12_1
    L4_3 = L4_3[L5_3]
    L4_3 = L4_3.x
    L4_3.mode = A0_3
  end
  function L5_2(A0_3, A1_3)
    local L2_3, L3_3, L4_3, L5_3, L6_3, L7_3, L8_3, L9_3, L10_3, L11_3, L12_3, L13_3
    L2_3 = L0_1
    L2_3 = L2_3[2]
    L2_3 = L2_3.dict
    L3_3 = L0_1
    L3_3 = L3_3[2]
    L3_3 = L3_3.anim
    L4_3 = PlayEntityAnim
    L5_3 = L3_2
    L6_3 = L3_3
    L7_3 = L2_3
    L8_3 = 8.0
    L9_3 = false
    L10_3 = true
    L11_3 = false
    L12_3 = 0.0
    L13_3 = 3
    L4_3(L5_3, L6_3, L7_3, L8_3, L9_3, L10_3, L11_3, L12_3, L13_3)
    L4_3 = Wait
    L5_3 = 0
    L4_3(L5_3)
    if 1 == A0_3 and A1_3 >= 1 or -1 == A0_3 and 0 == A1_3 then
      if 1 == A0_3 then
        L4_3 = 0.0
        if L4_3 then
          goto lbl_35
        end
      end
      L4_3 = 1.0
      ::lbl_35::
      L5_3 = SetEntityAnimCurrentTime
      L6_3 = L3_2
      L7_3 = L2_3
      L8_3 = L3_3
      L9_3 = L4_3
      L5_3(L6_3, L7_3, L8_3, L9_3)
    else
      L4_3 = SetEntityAnimCurrentTime
      L5_3 = L3_2
      L6_3 = L2_3
      L7_3 = L3_3
      L8_3 = A1_3
      L4_3(L5_3, L6_3, L7_3, L8_3)
    end
    L4_3 = Wait
    L5_3 = 0
    L4_3(L5_3)
    L4_3 = SetEntityAnimSpeed
    L5_3 = L3_2
    L6_3 = L2_3
    L7_3 = L3_3
    L8_3 = 0.0
    L4_3(L5_3, L6_3, L7_3, L8_3)
    L5_3 = L3_2
    L4_3 = L12_1
    L4_3 = L4_3[L5_3]
    L4_3 = L4_3.y
    L4_3.time = A1_3
    L5_3 = L3_2
    L4_3 = L12_1
    L4_3 = L4_3[L5_3]
    L4_3 = L4_3.y
    L4_3.mode = A0_3
  end
  L6_2 = L12_1
  L6_2 = L6_2[L3_2]
  L6_2 = L6_2.x
  L6_2 = L6_2.time
  L7_2 = A2_2.x
  L7_2 = L7_2.time
  if L6_2 ~= L7_2 then
    L6_2 = L4_2
    L7_2 = A2_2.x
    L7_2 = L7_2.mode
    L8_2 = A2_2.x
    L8_2 = L8_2.time
    L6_2(L7_2, L8_2)
  end
  L6_2 = L12_1
  L6_2 = L6_2[L3_2]
  L6_2 = L6_2.y
  L6_2 = L6_2.time
  L7_2 = A2_2.y
  L7_2 = L7_2.time
  if L6_2 ~= L7_2 then
    L6_2 = L5_2
    L7_2 = A2_2.y
    L7_2 = L7_2.mode
    L8_2 = A2_2.y
    L8_2 = L8_2.time
    L6_2(L7_2, L8_2)
  end
end
L21_1(L22_1, L23_1, L24_1)
L21_1 = CreateThread
function L22_1()
  local L0_2, L1_2, L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2
  L0_2 = L14_1
  L0_2()
  while true do
    L0_2 = 1000
    L1_2 = PlayerPedId
    L1_2 = L1_2()
    L2_2 = L13_1
    if not L2_2 then
      L2_2 = GetVehiclePedIsIn
      L3_2 = L1_2
      L4_2 = false
      L2_2 = L2_2(L3_2, L4_2)
    end
    L3_2 = CurrentJob
    if "electrician" == L3_2 and L2_2 > 0 then
      L3_2 = GetEntityModel
      L4_2 = L2_2
      L3_2 = L3_2(L4_2)
      L4_2 = joaat
      L5_2 = "utillitruck4"
      L4_2 = L4_2(L5_2)
      if L3_2 == L4_2 then
        L3_2 = AreOutriggerLegsDeployed
        L4_2 = L2_2
        L3_2 = L3_2(L4_2)
        if not L3_2 then
          L4_2 = lib
          L4_2 = L4_2.hideTextUI
          L4_2()
        end
        L4_2 = Group
        L4_2 = L4_2.active
        if L4_2 then
          L4_2 = GetPedInVehicleSeat
          L5_2 = L2_2
          L6_2 = -1
          L4_2 = L4_2(L5_2, L6_2)
          if L4_2 == L1_2 then
            goto lbl_57
          end
        end
        L4_2 = IsEntityAttachedToEntity
        L5_2 = L1_2
        L6_2 = L2_2
        L4_2 = L4_2(L5_2, L6_2)
        if L4_2 then
          L4_2 = L9_1
          if L4_2 then
            L4_2 = Group
            L4_2 = L4_2.active
            ::lbl_57::
            if not L4_2 and L3_2 then
              L0_2 = 1
              L5_2 = L3_1
              L4_2 = L0_1
              L4_2 = L4_2[L5_2]
              L4_2 = L4_2.dict
              L4_1 = L4_2
              L5_2 = L3_1
              L4_2 = L0_1
              L4_2 = L4_2[L5_2]
              L4_2 = L4_2.anim
              L5_1 = L4_2
              L4_2 = lib
              L4_2 = L4_2.showTextUI
              L5_2 = Lang
              L6_2 = "bucket_control"
              L5_2 = L5_2(L6_2)
              L6_2 = Lang
              L7_2 = "bucket_up_down"
              L6_2 = L6_2(L7_2)
              L7_2 = Lang
              L8_2 = "bucket_left_right"
              L7_2 = L7_2(L8_2)
              L8_2 = Lang
              L9_2 = "bucket_sync_key"
              L8_2 = L8_2(L9_2)
              L9_2 = Group
              L9_2 = L9_2.active
              if L9_2 then
                L9_2 = ""
                if L9_2 then
                  goto lbl_94
                end
              end
              L9_2 = Lang
              L10_2 = "bucket_exit"
              L9_2 = L9_2(L10_2)
              ::lbl_94::
              L10_2 = "           \n"
              L11_2 = inElectricianFixZone
              if L11_2 then
                L11_2 = Lang
                L12_2 = "electrician_fix"
                L11_2 = L11_2(L12_2)
                if L11_2 then
                  goto lbl_104
                end
              end
              L11_2 = ""
              ::lbl_104::
              L5_2 = L5_2 .. L6_2 .. L7_2 .. L8_2 .. L9_2 .. L10_2 .. L11_2
              L6_2 = {}
              L6_2.position = "left-center"
              L7_2 = {}
              L7_2.color = "white"
              L6_2.style = L7_2
              L4_2(L5_2, L6_2)
              L4_2 = SetEntityAnimSpeed
              L5_2 = L2_1
              L6_2 = L4_1
              L7_2 = L5_1
              L8_2 = 0.0
              L4_2(L5_2, L6_2, L7_2, L8_2)
              L4_2 = DisableControlAction
              L5_2 = 0
              L6_2 = 172
              L7_2 = true
              L4_2(L5_2, L6_2, L7_2)
              L4_2 = DisableControlAction
              L5_2 = 0
              L6_2 = 173
              L7_2 = true
              L4_2(L5_2, L6_2, L7_2)
              L4_2 = DisableControlAction
              L5_2 = 0
              L6_2 = 174
              L7_2 = true
              L4_2(L5_2, L6_2, L7_2)
              L4_2 = DisableControlAction
              L5_2 = 0
              L6_2 = 175
              L7_2 = true
              L4_2(L5_2, L6_2, L7_2)
              L4_2 = DisableControlAction
              L5_2 = 0
              L6_2 = 47
              L7_2 = true
              L4_2(L5_2, L6_2, L7_2)
              L4_2 = DisableControlAction
              L5_2 = 0
              L6_2 = 23
              L7_2 = true
              L4_2(L5_2, L6_2, L7_2)
              L4_2 = IsDisabledControlPressed
              L5_2 = 0
              L6_2 = 172
              L4_2 = L4_2(L5_2, L6_2)
              if L4_2 then
                L4_2 = L15_1
                L5_2 = 1
                L4_2(L5_2)
                L4_2 = 1
                L10_1 = L4_2
              else
                L4_2 = IsDisabledControlPressed
                L5_2 = 0
                L6_2 = 173
                L4_2 = L4_2(L5_2, L6_2)
                if L4_2 then
                  L4_2 = L15_1
                  L5_2 = -1
                  L4_2(L5_2)
                  L4_2 = -1
                  L10_1 = L4_2
                else
                  L4_2 = IsDisabledControlPressed
                  L5_2 = 0
                  L6_2 = 174
                  L4_2 = L4_2(L5_2, L6_2)
                  if L4_2 then
                    L4_2 = L16_1
                    L5_2 = 1
                    L4_2(L5_2)
                    L4_2 = 1
                    L11_1 = L4_2
                  else
                    L4_2 = IsDisabledControlPressed
                    L5_2 = 0
                    L6_2 = 175
                    L4_2 = L4_2(L5_2, L6_2)
                    if L4_2 then
                      L4_2 = L16_1
                      L5_2 = -1
                      L4_2(L5_2)
                      L4_2 = -1
                      L11_1 = L4_2
                    else
                      L4_2 = IsDisabledControlJustPressed
                      L5_2 = 0
                      L6_2 = 47
                      L4_2 = L4_2(L5_2, L6_2)
                      if L4_2 then
                        L4_2 = L8_1
                        if L4_2 then
                          L4_2 = Config
                          L4_2 = L4_2.Notification
                          L5_2 = Lang
                          L6_2 = "job"
                          L5_2 = L5_2(L6_2)
                          L6_2 = Lang
                          L7_2 = "bucket_sync_cooldown"
                          L6_2 = L6_2(L7_2)
                          L7_2 = "error"
                          L8_2 = 5000
                          L4_2(L5_2, L6_2, L7_2, L8_2)
                        else
                          L4_2 = true
                          L8_1 = L4_2
                          L4_2 = TriggerServerEvent
                          L5_2 = "wais:electrician:sync:crane"
                          L6_2 = NetworkGetNetworkIdFromEntity
                          L7_2 = L2_1
                          L6_2 = L6_2(L7_2)
                          L7_2 = {}
                          L8_2 = {}
                          L9_2 = L10_1
                          L8_2.mode = L9_2
                          L9_2 = L6_1
                          L9_2 = L9_2[1]
                          L8_2.time = L9_2
                          L7_2.x = L8_2
                          L8_2 = {}
                          L9_2 = L11_1
                          L8_2.mode = L9_2
                          L9_2 = L6_1
                          L9_2 = L9_2[2]
                          L8_2.time = L9_2
                          L7_2.y = L8_2
                          L8_2 = NetworkGetNetworkIdFromEntity
                          L9_2 = L2_1
                          L8_2 = L8_2(L9_2)
                          L7_2.netId = L8_2
                          L4_2(L5_2, L6_2, L7_2)
                          L4_2 = Config
                          L4_2 = L4_2.Notification
                          L5_2 = Lang
                          L6_2 = "job"
                          L5_2 = L5_2(L6_2)
                          L6_2 = Lang
                          L7_2 = "bucket_synced"
                          L6_2 = L6_2(L7_2)
                          L7_2 = "success"
                          L8_2 = 5000
                          L4_2(L5_2, L6_2, L7_2, L8_2)
                          L4_2 = SetTimeout
                          L5_2 = Config
                          L5_2 = L5_2.Jobs
                          L5_2 = L5_2.electrician
                          L5_2 = L5_2.bucket_sync_cooldown
                          function L6_2()
                            local L0_3, L1_3
                            L0_3 = false
                            L8_1 = L0_3
                          end
                          L4_2(L5_2, L6_2)
                        end
                      else
                        L4_2 = IsDisabledControlJustPressed
                        L5_2 = 0
                        L6_2 = 23
                        L4_2 = L4_2(L5_2, L6_2)
                        if L4_2 then
                          L4_2 = Group
                          L4_2 = L4_2.active
                          if not L4_2 then
                            L4_2 = L9_1
                            if L4_2 then
                              L4_2 = IsEntityAttachedToEntity
                              L5_2 = L1_2
                              L6_2 = L2_2
                              L4_2 = L4_2(L5_2, L6_2)
                              if L4_2 then
                                L4_2 = DetachEntity
                                L5_2 = L1_2
                                L6_2 = true
                                L7_2 = true
                                L4_2(L5_2, L6_2, L7_2)
                                L4_2 = L18_1
                                L5_2 = L2_2
                                L4_2 = L4_2(L5_2)
                                if not L4_2 then
                                  L4_2 = GetEntityCoords
                                  L5_2 = L2_2
                                  L4_2 = L4_2(L5_2)
                                  L5_2 = SetEntityCoords
                                  L6_2 = L1_2
                                  L7_2 = L4_2.x
                                  L7_2 = L7_2 + 1.0
                                  L8_2 = L4_2.y
                                  L8_2 = L8_2 + 2.0
                                  L9_2 = L4_2.z
                                  L10_2 = false
                                  L11_2 = false
                                  L12_2 = false
                                  L13_2 = true
                                  L5_2(L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2)
                                  L5_2 = Config
                                  L5_2 = L5_2.Notification
                                  L6_2 = Lang
                                  L7_2 = "job"
                                  L6_2 = L6_2(L7_2)
                                  L7_2 = Lang
                                  L8_2 = "electrician_cant_find_free_seat"
                                  L7_2 = L7_2(L8_2)
                                  L8_2 = "error"
                                  L9_2 = 5000
                                  L5_2(L6_2, L7_2, L8_2, L9_2)
                                end
                                L4_2 = L20_1
                                L4_2()
                              end
                            end
                          end
                        end
                      end
                    end
                  end
                end
              end
            end
          end
        end
      end
    end
    L3_2 = Wait
    L4_2 = L0_2
    L3_2(L4_2)
  end
end
L21_1(L22_1)
L21_1 = CreateThread
function L22_1()
  local L0_2, L1_2, L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2
  while true do
    L0_2 = 1000
    L1_2 = PlayerPedId
    L1_2 = L1_2()
    L2_2 = GetVehiclePedIsIn
    L3_2 = L1_2
    L4_2 = false
    L2_2 = L2_2(L3_2, L4_2)
    L3_2 = CurrentJob
    if "electrician" == L3_2 then
      if L2_2 > 0 then
        L3_2 = GetEntityModel
        L4_2 = L2_2
        L3_2 = L3_2(L4_2)
        L4_2 = joaat
        L5_2 = "utillitruck4"
        L4_2 = L4_2(L5_2)
        if L3_2 == L4_2 then
          L3_2 = Group
          L3_2 = L3_2.active
          if L3_2 then
            L3_2 = GetPedInVehicleSeat
            L4_2 = L2_2
            L5_2 = -1
            L3_2 = L3_2(L4_2, L5_2)
            if L3_2 then
              goto lbl_35
            end
          end
          L3_2 = GetPedInVehicleSeat
          L4_2 = L2_2
          L5_2 = 1
          L3_2 = L3_2(L4_2, L5_2)
          ::lbl_35::
          if L3_2 ~= L1_2 then
            L4_2 = AreOutriggerLegsDeployed
            L5_2 = L2_2
            L4_2 = L4_2(L5_2)
            if L4_2 then
              L0_2 = 1
              L4_2 = lib
              L4_2 = L4_2.showTextUI
              L5_2 = Lang
              L6_2 = "bucket_enter"
              L5_2 = L5_2(L6_2)
              L6_2 = {}
              L6_2.position = "right-center"
              L7_2 = {}
              L7_2.color = "white"
              L6_2.style = L7_2
              L4_2(L5_2, L6_2)
              L4_2 = IsControlJustPressed
              L5_2 = 0
              L6_2 = 38
              L4_2 = L4_2(L5_2, L6_2)
              if L4_2 then
                L4_2 = IsEntityAttachedToEntity
                L5_2 = L1_2
                L6_2 = L13_1
                L4_2 = L4_2(L5_2, L6_2)
                if not L4_2 then
                  L4_2 = L17_1
                  L5_2 = L2_2
                  L4_2 = L4_2(L5_2)
                  if not L4_2 then
                    L4_2 = L19_1
                    L5_2 = L2_2
                    L4_2(L5_2)
                  else
                    L4_2 = Config
                    L4_2 = L4_2.Notification
                    L5_2 = Lang
                    L6_2 = "job"
                    L5_2 = L5_2(L6_2)
                    L6_2 = Lang
                    L7_2 = "bucket_not_available"
                    L6_2 = L6_2(L7_2)
                    L7_2 = "error"
                    L8_2 = 5000
                    L4_2(L5_2, L6_2, L7_2, L8_2)
                  end
                end
              end
            end
          end
      end
      else
        L3_2 = L13_1
        if nil ~= L3_2 then
          L3_2 = Group
          L3_2 = L3_2.active
          if L3_2 then
            L0_2 = 1
            L3_2 = lib
            L3_2 = L3_2.showTextUI
            L4_2 = Lang
            L5_2 = "bucket_exit"
            L4_2 = L4_2(L5_2)
            L5_2 = {}
            L5_2.position = "right-center"
            L6_2 = {}
            L6_2.color = "white"
            L5_2.style = L6_2
            L3_2(L4_2, L5_2)
            L3_2 = DisableControlAction
            L4_2 = 0
            L5_2 = 23
            L6_2 = true
            L3_2(L4_2, L5_2, L6_2)
            L3_2 = IsDisabledControlJustPressed
            L4_2 = 0
            L5_2 = 23
            L3_2 = L3_2(L4_2, L5_2)
            if L3_2 then
              L3_2 = IsEntityAttachedToEntity
              L4_2 = L1_2
              L5_2 = L13_1
              L3_2 = L3_2(L4_2, L5_2)
              if L3_2 then
                L3_2 = L9_1
                if L3_2 then
                  L3_2 = DetachEntity
                  L4_2 = L1_2
                  L5_2 = true
                  L6_2 = true
                  L3_2(L4_2, L5_2, L6_2)
                  L3_2 = L18_1
                  L4_2 = L13_1
                  L3_2 = L3_2(L4_2)
                  if not L3_2 then
                    L3_2 = GetEntityCoords
                    L4_2 = L13_1
                    L3_2 = L3_2(L4_2)
                    L4_2 = SetEntityCoords
                    L5_2 = L1_2
                    L6_2 = L3_2.x
                    L6_2 = L6_2 + 1.0
                    L7_2 = L3_2.y
                    L7_2 = L7_2 + 2.0
                    L8_2 = L3_2.z
                    L9_2 = false
                    L10_2 = false
                    L11_2 = false
                    L12_2 = true
                    L4_2(L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2)
                    L4_2 = Config
                    L4_2 = L4_2.Notification
                    L5_2 = Lang
                    L6_2 = "job"
                    L5_2 = L5_2(L6_2)
                    L6_2 = Lang
                    L7_2 = "electrician_cant_find_free_seat"
                    L6_2 = L6_2(L7_2)
                    L7_2 = "error"
                    L8_2 = 5000
                    L4_2(L5_2, L6_2, L7_2, L8_2)
                  end
                  L3_2 = L20_1
                  L3_2()
                end
              end
            end
          end
        end
      end
    end
    L3_2 = Wait
    L4_2 = L0_2
    L3_2(L4_2)
  end
end
L21_1(L22_1)
L21_1 = CreateThread
function L22_1()
  local L0_2, L1_2, L2_2, L3_2
  while true do
    L0_2 = 1000
    L1_2 = PlayerPedId
    L1_2 = L1_2()
    L2_2 = CurrentJob
    if "electrician" == L2_2 then
      L2_2 = L13_1
      if nil ~= L2_2 then
        L2_2 = DoesEntityExist
        L3_2 = L13_1
        L2_2 = L2_2(L3_2)
        if not L2_2 then
          L2_2 = L20_1
          L2_2()
        end
      end
    end
    L2_2 = Wait
    L3_2 = L0_2
    L2_2(L3_2)
  end
end
L21_1(L22_1)
L21_1 = lib
L21_1 = L21_1.onCache
L22_1 = "vehicle"
function L23_1(A0_2)
  local L1_2, L2_2, L3_2
  if A0_2 then
    L1_2 = GetEntityModel
    L2_2 = A0_2
    L1_2 = L1_2(L2_2)
    L2_2 = joaat
    L3_2 = "utillitruck4"
    L2_2 = L2_2(L3_2)
    if L1_2 == L2_2 then
      goto lbl_20
    end
  end
  L1_2 = lib
  L1_2 = L1_2.hideTextUI
  L1_2()
  L1_2 = {}
  L1_2[1] = 0.0
  L1_2[2] = 0.0
  L6_1 = L1_2
  do return end
  ::lbl_20::
  L2_1 = A0_2
end
L21_1(L22_1, L23_1)
L21_1 = RegisterNetEvent
L22_1 = "wais:setDefault:JobThings"
function L23_1()
  local L0_2, L1_2, L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2
  L0_2 = L9_1
  if L0_2 then
    L0_2 = PlayerPedId
    L0_2 = L0_2()
    L1_2 = DetachEntity
    L2_2 = L0_2
    L3_2 = true
    L4_2 = true
    L1_2(L2_2, L3_2, L4_2)
    L1_2 = L18_1
    L2_2 = L2_1
    L1_2 = L1_2(L2_2)
    if not L1_2 then
      L1_2 = GetEntityCoords
      L2_2 = L2_1
      L1_2 = L1_2(L2_2)
      L2_2 = SetEntityCoords
      L3_2 = L0_2
      L4_2 = L1_2.x
      L4_2 = L4_2 + 1.0
      L5_2 = L1_2.y
      L5_2 = L5_2 + 2.0
      L6_2 = L1_2.z
      L7_2 = false
      L8_2 = false
      L9_2 = false
      L10_2 = true
      L2_2(L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2)
      L2_2 = Config
      L2_2 = L2_2.Notification
      L3_2 = Lang
      L4_2 = "job"
      L3_2 = L3_2(L4_2)
      L4_2 = Lang
      L5_2 = "electrician_cant_find_free_seat"
      L4_2 = L4_2(L5_2)
      L5_2 = "error"
      L6_2 = 5000
      L2_2(L3_2, L4_2, L5_2, L6_2)
    end
    L1_2 = L20_1
    L1_2()
  end
end
L21_1(L22_1, L23_1)
