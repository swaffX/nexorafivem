local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1
L0_1 = {}
AI = L0_1
L0_1 = AI
L1_1 = AI
L0_1.__index = L1_1
L0_1 = {}
L1_1 = 0
L2_1 = false
Timeout = nil
Loop = L2_1
CurrentPeds = L1_1
Selfs = L0_1
L0_1 = {}
L1_1 = "GENERIC_CURSE_MED"
L2_1 = "GENERIC_INSULT_HIGH"
L3_1 = "GENERIC_SHOCKED_HIGH"
L4_1 = "GENERIC_FRIGHTENED_HIGH"
L5_1 = "GENERIC_ANGRY_SHOUT"
L0_1[1] = L1_1
L0_1[2] = L2_1
L0_1[3] = L3_1
L0_1[4] = L4_1
L0_1[5] = L5_1
L1_1 = {}
L2_1 = "GENERIC_THANKS"
L3_1 = "GENERIC_HAPPY"
L4_1 = "GENERIC_YES"
L5_1 = "GENERIC_GOODBYE"
L6_1 = "GENERIC_HURRAH"
L1_1[1] = L2_1
L1_1[2] = L3_1
L1_1[3] = L4_1
L1_1[4] = L5_1
L1_1[5] = L6_1
L2_1 = {}
L3_1 = {}
L3_1.dict = "gestures@m@standing@casual"
L3_1.name = "gesture_bring_it_on"
L4_1 = {}
L4_1.dict = "gestures@m@standing@casual"
L4_1.name = "gesture_damn"
L5_1 = {}
L5_1.dict = "gestures@m@standing@casual"
L5_1.name = "gesture_f_you"
L6_1 = {}
L6_1.dict = "gestures@m@standing@casual"
L6_1.name = "gesture_nod_yes_hard"
L7_1 = {}
L7_1.dict = "anim@mp_player_intcelebrationmale@face_palm"
L7_1.name = "face_palm"
L2_1[1] = L3_1
L2_1[2] = L4_1
L2_1[3] = L5_1
L2_1[4] = L6_1
L2_1[5] = L7_1
function L3_1(A0_2)
  local L1_2, L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2
  L1_2 = Loop
  L1_2 = not L1_2
  Loop = L1_2
  if nil ~= A0_2 then
    Loop = A0_2
  end
  L1_2 = Loop
  if L1_2 then
    L1_2 = StartLoop
    L1_2()
  else
    L1_2 = CurrentPeds
    if L1_2 > 0 then
      Timeout = nil
      L1_2 = pairs
      L2_2 = Selfs
      L1_2, L2_2, L3_2, L4_2 = L1_2(L2_2)
      for L5_2, L6_2 in L1_2, L2_2, L3_2, L4_2 do
        L7_2 = L6_2.deleted
        if not L7_2 then
          L8_2 = L6_2
          L7_2 = L6_2.DeleteSelf
          L7_2(L8_2)
        end
      end
    end
  end
  L1_2 = Config
  L1_2 = L1_2.Notification
  L2_2 = Lang
  L3_2 = "job"
  L2_2 = L2_2(L3_2)
  L3_2 = Lang
  L4_2 = "%s_stand"
  L5_2 = L4_2
  L4_2 = L4_2.format
  L6_2 = Loop
  if L6_2 then
    L6_2 = "opened"
    if L6_2 then
      goto lbl_44
    end
  end
  L6_2 = "closed"
  ::lbl_44::
  L4_2, L5_2, L6_2, L7_2, L8_2 = L4_2(L5_2, L6_2)
  L3_2 = L3_2(L4_2, L5_2, L6_2, L7_2, L8_2)
  L4_2 = "inform"
  L5_2 = 5000
  L1_2(L2_2, L3_2, L4_2, L5_2)
end
LoopState = L3_1
function L3_1()
  local L0_2, L1_2, L2_2
  L0_2 = Loop
  if not L0_2 then
    return
  end
  L0_2 = CurrentPeds
  if L0_2 >= 1 then
    return
  end
  L0_2 = math
  L0_2 = L0_2.randomseed
  L1_2 = GetGameTimer
  L1_2, L2_2 = L1_2()
  L0_2(L1_2, L2_2)
  L0_2 = SetTimeout
  L1_2 = Config
  L1_2 = L1_2.Jobs
  L1_2 = L1_2.mobile_hotdog
  L1_2 = L1_2.randomPedTime
  L1_2 = L1_2 * 1000
  function L2_2()
    local L0_3, L1_3, L2_3
    L0_3 = CreateCustomer
    L0_3 = L0_3()
    if L0_3 then
      L1_3 = Selfs
      L2_3 = L0_3.id
      L1_3[L2_3] = L0_3
    end
  end
  L0_2 = L0_2(L1_2, L2_2)
  Timeout = L0_2
end
StartLoop = L3_1
function L3_1()
  local L0_2, L1_2, L2_2, L3_2, L4_2
  L0_2 = joaat
  L1_2 = PedModels
  L2_2 = math
  L2_2 = L2_2.random
  L3_2 = 1
  L4_2 = PedModels
  L4_2 = #L4_2
  L2_2 = L2_2(L3_2, L4_2)
  L1_2 = L1_2[L2_2]
  L0_2 = L0_2(L1_2)
  L1_2 = loadModel
  L2_2 = L0_2
  L1_2 = L1_2(L2_2)
  if not L1_2 then
    L1_2 = nil
    return L1_2
  end
  return L0_2
end
LoadCustomerModel = L3_1
function L3_1(A0_2)
  local L1_2, L2_2, L3_2, L4_2, L5_2, L6_2
  L1_2 = GetSafeCoordForPed
  L2_2 = A0_2.x
  L3_2 = A0_2.y
  L4_2 = A0_2.z
  L5_2 = false
  L6_2 = 16
  L1_2, L2_2 = L1_2(L2_2, L3_2, L4_2, L5_2, L6_2)
  return L1_2
end
isSpawnPointValid = L3_1
function L3_1()
  local L0_2, L1_2, L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2
  L0_2 = GetEntityCoords
  L1_2 = stand
  L0_2 = L0_2(L1_2)
  L1_2 = false
  L2_2 = nil
  L3_2 = nil
  L4_2 = nil
  while not L1_2 do
    L5_2 = math
    L5_2 = L5_2.random
    L5_2 = L5_2()
    L5_2 = L5_2 * 2
    L6_2 = math
    L6_2 = L6_2.pi
    L5_2 = L5_2 * L6_2
    L6_2 = math
    L6_2 = L6_2.random
    L7_2 = 15
    L8_2 = 30
    L6_2 = L6_2(L7_2, L8_2)
    L7_2 = L0_2.x
    L8_2 = math
    L8_2 = L8_2.cos
    L9_2 = L5_2
    L8_2 = L8_2(L9_2)
    L8_2 = L6_2 * L8_2
    L2_2 = L7_2 + L8_2
    L7_2 = L0_2.y
    L8_2 = math
    L8_2 = L8_2.sin
    L9_2 = L5_2
    L8_2 = L8_2(L9_2)
    L8_2 = L6_2 * L8_2
    L3_2 = L7_2 + L8_2
    L7_2 = GetGroundZFor_3dCoord
    L8_2 = L2_2
    L9_2 = L3_2
    L10_2 = L0_2.z
    L11_2 = false
    L7_2, L8_2 = L7_2(L8_2, L9_2, L10_2, L11_2)
    L4_2 = L8_2 or L4_2
    if not L8_2 then
      L4_2 = L0_2.z
    end
    L9_2 = isSpawnPointValid
    L10_2 = vector3
    L11_2 = L2_2
    L12_2 = L3_2
    L13_2 = L4_2
    L10_2, L11_2, L12_2, L13_2 = L10_2(L11_2, L12_2, L13_2)
    L9_2 = L9_2(L10_2, L11_2, L12_2, L13_2)
    L1_2 = L9_2
  end
  L5_2 = vector3
  L6_2 = L2_2
  L7_2 = L3_2
  L8_2 = L4_2
  return L5_2(L6_2, L7_2, L8_2)
end
randomAreaCoords = L3_1
function L3_1()
  local L0_2, L1_2, L2_2, L3_2
  L0_2 = math
  L0_2 = L0_2.randomseed
  L1_2 = GetGameTimer
  L1_2, L2_2, L3_2 = L1_2()
  L0_2(L1_2, L2_2, L3_2)
  L0_2 = Config
  L0_2 = L0_2.Jobs
  L0_2 = L0_2.mobile_hotdog
  L0_2 = L0_2.requestable_items
  L1_2 = math
  L1_2 = L1_2.random
  L2_2 = 1
  L3_2 = Config
  L3_2 = L3_2.Jobs
  L3_2 = L3_2.mobile_hotdog
  L3_2 = L3_2.requestable_items
  L3_2 = #L3_2
  L1_2 = L1_2(L2_2, L3_2)
  L0_2 = L0_2[L1_2]
  return L0_2
end
randomItem = L3_1
function L3_1(A0_2, A1_2, A2_2)
  local L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2
  L3_2 = FreezeEntityPosition
  L4_2 = PlayerPedId
  L4_2 = L4_2()
  L5_2 = true
  L3_2(L4_2, L5_2)
  if "drink" == A0_2 then
    L3_2 = lib
    L3_2 = L3_2.progressBar
    L4_2 = {}
    L4_2.duration = A2_2
    L5_2 = Lang
    L6_2 = "delivering_order"
    L5_2 = L5_2(L6_2)
    L4_2.label = L5_2
    L4_2.useWhileDead = false
    L4_2.canCancel = true
    L5_2 = {}
    L5_2.dict = "mp_common"
    L5_2.clip = "givetake1_a"
    L4_2.anim = L5_2
    L5_2 = {}
    L5_2.model = A1_2
    L6_2 = vec3
    L7_2 = 0.03
    L8_2 = 0.03
    L9_2 = 0.02
    L6_2 = L6_2(L7_2, L8_2, L9_2)
    L5_2.pos = L6_2
    L6_2 = vec3
    L7_2 = 0.0
    L8_2 = 0.0
    L9_2 = -1.5
    L6_2 = L6_2(L7_2, L8_2, L9_2)
    L5_2.rot = L6_2
    L4_2.prop = L5_2
    L5_2 = {}
    L5_2.car = true
    L5_2.move = true
    L5_2.combat = true
    L4_2.disable = L5_2
    return L3_2(L4_2)
  elseif "food" == A0_2 then
    L3_2 = lib
    L3_2 = L3_2.progressBar
    L4_2 = {}
    L4_2.duration = A2_2
    L5_2 = Lang
    L6_2 = "preparing_order"
    L5_2 = L5_2(L6_2)
    L4_2.label = L5_2
    L4_2.useWhileDead = false
    L4_2.canCancel = true
    L5_2 = {}
    L5_2.dict = "amb@prop_human_bbq@male@idle_a"
    L5_2.clip = "idle_b"
    L4_2.anim = L5_2
    L5_2 = {}
    L6_2 = joaat
    L7_2 = "prop_fish_slice_01"
    L6_2 = L6_2(L7_2)
    L5_2.model = L6_2
    L6_2 = vec3
    L7_2 = 0.08
    L8_2 = 0.0
    L9_2 = -0.02
    L6_2 = L6_2(L7_2, L8_2, L9_2)
    L5_2.pos = L6_2
    L6_2 = vec3
    L7_2 = 0.0
    L8_2 = -25.0
    L9_2 = 130.0
    L6_2 = L6_2(L7_2, L8_2, L9_2)
    L5_2.rot = L6_2
    L4_2.prop = L5_2
    L5_2 = {}
    L5_2.car = true
    L5_2.move = true
    L5_2.combat = true
    L4_2.disable = L5_2
    return L3_2(L4_2)
  end
end
createProgressBar = L3_1
L3_1 = AI
function L4_1(A0_2)
  local L1_2, L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2
  L1_2 = math
  L1_2 = L1_2.random
  L2_2 = L0_1
  L2_2 = #L2_2
  L1_2 = L1_2(L2_2)
  L2_2 = L0_1
  L1_2 = L2_2[L1_2]
  L2_2 = math
  L2_2 = L2_2.random
  L3_2 = L2_1
  L3_2 = #L3_2
  L2_2 = L2_2(L3_2)
  L3_2 = L2_1
  L2_2 = L3_2[L2_2]
  L3_2 = loadDict
  L4_2 = L2_2.dict
  L3_2 = L3_2(L4_2)
  if not L3_2 then
    return
  end
  L3_2 = PlayAmbientSpeech1
  L4_2 = A0_2.ped
  L5_2 = L1_2
  L6_2 = "SPEECH_PARAMS_FORCE"
  L3_2(L4_2, L5_2, L6_2)
  L3_2 = TaskPlayAnim
  L4_2 = A0_2.ped
  L5_2 = L2_2.dict
  L6_2 = L2_2.name
  L7_2 = 8.0
  L8_2 = 8.0
  L9_2 = -1
  L10_2 = 50
  L11_2 = 0
  L12_2 = false
  L13_2 = false
  L14_2 = false
  L3_2(L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2)
  L3_2 = TaskWanderStandard
  L4_2 = A0_2.ped
  L5_2 = 10.0
  L6_2 = 10
  L3_2(L4_2, L5_2, L6_2)
  L3_2 = SetTimeout
  L4_2 = math
  L4_2 = L4_2.random
  L5_2 = 5
  L6_2 = 15
  L4_2 = L4_2(L5_2, L6_2)
  L4_2 = L4_2 * 1000
  function L5_2()
    local L0_3, L1_3
    L0_3 = A0_2
    L1_3 = L0_3
    L0_3 = L0_3.DeleteSelf
    L0_3(L1_3)
  end
  L3_2(L4_2, L5_2)
end
L3_1.playNegativeResponse = L4_1
L3_1 = AI
function L4_1(A0_2)
  local L1_2, L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2
  L1_2 = joaat
  L2_2 = A0_2.product
  L2_2 = L2_2.prop
  L2_2 = L2_2.model
  L1_2 = L1_2(L2_2)
  L2_2 = loadModel
  L3_2 = L1_2
  L2_2 = L2_2(L3_2)
  if not L2_2 then
    return
  end
  L2_2 = CreateObject
  L3_2 = L1_2
  L4_2 = A0_2.coords
  L4_2 = L4_2.x
  L5_2 = A0_2.coords
  L5_2 = L5_2.y
  L6_2 = A0_2.coords
  L6_2 = L6_2.z
  L7_2 = Config
  L7_2 = L7_2.Jobs
  L7_2 = L7_2.mobile_hotdog
  L7_2 = L7_2.syncPeds
  L8_2 = false
  L9_2 = false
  L2_2 = L2_2(L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2)
  A0_2.prop = L2_2
  L2_2 = AttachEntityToEntity
  L3_2 = A0_2.prop
  L4_2 = A0_2.ped
  L5_2 = GetPedBoneIndex
  L6_2 = A0_2.ped
  L7_2 = A0_2.product
  L7_2 = L7_2.prop
  L7_2 = L7_2.bone
  L5_2 = L5_2(L6_2, L7_2)
  L6_2 = A0_2.product
  L6_2 = L6_2.prop
  L6_2 = L6_2.coords
  L6_2 = L6_2.x
  L7_2 = A0_2.product
  L7_2 = L7_2.prop
  L7_2 = L7_2.coords
  L7_2 = L7_2.y
  L8_2 = A0_2.product
  L8_2 = L8_2.prop
  L8_2 = L8_2.coords
  L8_2 = L8_2.z
  L9_2 = A0_2.product
  L9_2 = L9_2.prop
  L9_2 = L9_2.rotation
  L9_2 = L9_2.x
  L10_2 = A0_2.product
  L10_2 = L10_2.prop
  L10_2 = L10_2.rotation
  L10_2 = L10_2.y
  L11_2 = A0_2.product
  L11_2 = L11_2.prop
  L11_2 = L11_2.rotation
  L11_2 = L11_2.z
  L12_2 = false
  L13_2 = false
  L14_2 = false
  L15_2 = false
  L16_2 = 2
  L17_2 = true
  L2_2(L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2)
end
L3_1.CreateAndAttachProp = L4_1
L3_1 = AI
function L4_1(A0_2)
  local L1_2, L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2
  L1_2 = math
  L1_2 = L1_2.random
  L2_2 = L1_1
  L2_2 = #L2_2
  L1_2 = L1_2(L2_2)
  L2_2 = L1_1
  L1_2 = L2_2[L1_2]
  L2_2 = loadDict
  L3_2 = A0_2.product
  L3_2 = L3_2.animDict
  L2_2 = L2_2(L3_2)
  if not L2_2 then
    return
  end
  L2_2 = TaskPlayAnim
  L3_2 = A0_2.ped
  L4_2 = A0_2.product
  L4_2 = L4_2.animDict
  L5_2 = A0_2.product
  L5_2 = L5_2.animName
  L6_2 = 8.0
  L7_2 = 8.0
  L8_2 = -1
  L9_2 = 50
  L10_2 = 0
  L11_2 = false
  L12_2 = false
  L13_2 = false
  L2_2(L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2)
  L3_2 = A0_2
  L2_2 = A0_2.CreateAndAttachProp
  L2_2(L3_2)
  L2_2 = PlayAmbientSpeech1
  L3_2 = A0_2.ped
  L4_2 = L1_2
  L5_2 = "SPEECH_PARAMS_FORCE"
  L2_2(L3_2, L4_2, L5_2)
  L2_2 = TaskWanderStandard
  L3_2 = A0_2.ped
  L4_2 = 10.0
  L5_2 = 10
  L2_2(L3_2, L4_2, L5_2)
  L2_2 = SetTimeout
  L3_2 = math
  L3_2 = L3_2.random
  L4_2 = 5
  L5_2 = 15
  L3_2 = L3_2(L4_2, L5_2)
  L3_2 = L3_2 * 1000
  function L4_2()
    local L0_3, L1_3
    L0_3 = A0_2
    L1_3 = L0_3
    L0_3 = L0_3.DeleteSelf
    L0_3(L1_3)
  end
  L2_2(L3_2, L4_2)
end
L3_1.playPossitiveResponse = L4_1
L3_1 = AI
function L4_1(A0_2)
  local L1_2, L2_2
  A0_2.deleted = true
  L1_2 = CurrentPeds
  L1_2 = L1_2 - 1
  if L1_2 < 0 then
    CurrentPeds = 0
  else
    L1_2 = CurrentPeds
    L1_2 = L1_2 - 1
    CurrentPeds = L1_2
  end
  L1_2 = DoesEntityExist
  L2_2 = A0_2.ped
  L1_2 = L1_2(L2_2)
  if L1_2 then
    L1_2 = DeleteEntity
    L2_2 = A0_2.ped
    L1_2(L2_2)
  end
  L1_2 = A0_2.prop
  if L1_2 then
    L1_2 = DoesEntityExist
    L2_2 = A0_2.prop
    L1_2 = L1_2(L2_2)
    if L1_2 then
      L1_2 = DeleteEntity
      L2_2 = A0_2.prop
      L1_2(L2_2)
    end
  end
  L1_2 = Selfs
  L2_2 = A0_2.id
  L1_2[L2_2] = nil
  A0_2 = nil
  L1_2 = collectgarbage
  L2_2 = "collect"
  L1_2(L2_2)
  L1_2 = StartLoop
  L1_2()
end
L3_1.DeleteSelf = L4_1
function L3_1()
  local L0_2, L1_2, L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2
  L0_2 = CurrentPeds
  if L0_2 >= 1 then
    L0_2 = false
    return L0_2
  end
  L0_2 = Loop
  if not L0_2 then
    L0_2 = false
    return L0_2
  end
  L0_2 = setmetatable
  L1_2 = {}
  L2_2 = AI
  L0_2 = L0_2(L1_2, L2_2)
  L1_2 = LoadCustomerModel
  L1_2 = L1_2()
  L0_2.model = L1_2
  L1_2 = randomAreaCoords
  L1_2 = L1_2()
  L0_2.coords = L1_2
  L1_2 = CreatePed
  L2_2 = 4
  L3_2 = L0_2.model
  L4_2 = L0_2.coords
  L4_2 = L4_2.x
  L5_2 = L0_2.coords
  L5_2 = L5_2.y
  L6_2 = L0_2.coords
  L6_2 = L6_2.z
  L7_2 = 0.0
  L8_2 = Config
  L8_2 = L8_2.Jobs
  L8_2 = L8_2.mobile_hotdog
  L8_2 = L8_2.syncPeds
  L9_2 = true
  L1_2 = L1_2(L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2)
  L0_2.ped = L1_2
  L1_2 = randomItem
  L1_2 = L1_2()
  L0_2.product = L1_2
  L0_2.lookingFace = false
  L0_2.cantInteract = false
  L0_2.waitInteraction = 0
  L0_2.prop = nil
  L0_2.deleted = false
  L1_2 = lib
  L1_2 = L1_2.string
  L1_2 = L1_2.random
  L2_2 = "aaaaaa"
  L1_2 = L1_2(L2_2)
  L0_2.id = L1_2
  L1_2 = GetEntityCoords
  L2_2 = stand
  L1_2 = L1_2(L2_2)
  L2_2 = math
  L2_2 = L2_2.random
  L3_2 = 13
  L4_2 = 25
  L2_2 = L2_2(L3_2, L4_2)
  L3_2 = PlaceObjectOnGroundProperly
  L4_2 = L0_2.ped
  L3_2(L4_2)
  L3_2 = SetPedRandomComponentVariation
  L4_2 = L0_2.ped
  L5_2 = true
  L3_2(L4_2, L5_2)
  L3_2 = SetBlockingOfNonTemporaryEvents
  L4_2 = L0_2.ped
  L5_2 = true
  L3_2(L4_2, L5_2)
  L3_2 = TaskWanderStandard
  L4_2 = L0_2.ped
  L5_2 = 10.0
  L6_2 = 10
  L3_2(L4_2, L5_2, L6_2)
  L3_2 = TaskGoToCoordAnyMeans
  L4_2 = L0_2.ped
  L5_2 = L1_2.x
  L6_2 = L1_2.y
  L7_2 = L1_2.z
  L8_2 = 1.0
  L9_2 = 0
  L10_2 = false
  L11_2 = 0
  L12_2 = 0
  L3_2(L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2)
  L3_2 = CurrentPeds
  L3_2 = L3_2 + 1
  CurrentPeds = L3_2
  L3_2 = AddBlipForEntity
  L4_2 = L0_2.ped
  L3_2 = L3_2(L4_2)
  L0_2.blip = L3_2
  L3_2 = BeginTextCommandSetBlipName
  L4_2 = "STRING"
  L3_2(L4_2)
  L3_2 = AddTextComponentString
  L4_2 = Lang
  L5_2 = "hotdog_customer"
  L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2 = L4_2(L5_2)
  L3_2(L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2)
  L3_2 = EndTextCommandSetBlipName
  L4_2 = L0_2.blip
  L3_2(L4_2)
  L3_2 = CreateThread
  function L4_2()
    local L0_3, L1_3, L2_3, L3_3, L4_3, L5_3
    while true do
      L0_3 = L0_2
      if not L0_3 then
        break
      end
      L0_3 = L0_2.deleted
      if L0_3 then
        break
      end
      L0_3 = 1000
      L1_3 = GetEntityHealth
      L2_3 = L0_2.ped
      L1_3 = L1_3(L2_3)
      if not (L1_3 <= 0) then
        L1_3 = IsEntityDead
        L2_3 = L0_2.ped
        L1_3 = L1_3(L2_3)
        if not L1_3 then
          goto lbl_21
        end
      end
      L1_3 = L0_2
      L2_3 = L1_3
      L1_3 = L1_3.DeleteSelf
      L1_3(L2_3)
      ::lbl_21::
      L1_3 = L0_2.lookingFace
      if L1_3 then
        L1_3 = L0_2.cantInteract
        if not L1_3 then
          L1_3 = L0_2.waitInteraction
          L1_3 = L1_3 + 1000
          L0_2.waitInteraction = L1_3
          L1_3 = L0_2.waitInteraction
          L2_3 = L2_2
          L2_3 = L2_3 * 1000
          if L1_3 >= L2_3 then
            L1_3 = L0_2
            L2_3 = L1_3
            L1_3 = L1_3.playNegativeResponse
            L1_3(L2_3)
            L1_3 = Config
            L1_3 = L1_3.Notification
            L2_3 = Lang
            L3_3 = "job"
            L2_3 = L2_3(L3_3)
            L3_3 = Lang
            L4_3 = "customer_left"
            L3_3 = L3_3(L4_3)
            L4_3 = "inform"
            L5_3 = 5000
            L1_3(L2_3, L3_3, L4_3, L5_3)
            break
          end
        end
      end
      L1_3 = Wait
      L2_3 = L0_3
      L1_3(L2_3)
    end
  end
  L3_2(L4_2)
  L3_2 = CreateThread
  function L4_2()
    local L0_3, L1_3, L2_3, L3_3, L4_3, L5_3, L6_3, L7_3, L8_3, L9_3, L10_3, L11_3
    while true do
      L0_3 = L0_2
      if not L0_3 then
        break
      end
      L0_3 = L0_2.deleted
      if L0_3 then
        break
      end
      L0_3 = 1000
      L1_3 = PlayerPedId
      L1_3 = L1_3()
      L2_3 = GetEntityCoords
      L3_3 = L1_3
      L2_3 = L2_3(L3_3)
      L3_3 = GetEntityCoords
      L4_3 = L0_2.ped
      L3_3 = L3_3(L4_3)
      L4_3 = GetEntityCoords
      L5_3 = stand
      L4_3 = L4_3(L5_3)
      L5_3 = L4_3 - L3_3
      L5_3 = #L5_3
      if L5_3 <= 3.0 then
        L0_3 = 5
        L5_3 = L0_2.lookingFace
        if not L5_3 then
          L0_2.lookingFace = true
          L5_3 = TaskTurnPedToFaceEntity
          L6_3 = L0_2.ped
          L7_3 = stand
          L8_3 = 1000
          L5_3(L6_3, L7_3, L8_3)
        end
        L5_3 = L0_2.cantInteract
        if not L5_3 then
          L5_3 = L2_3 - L4_3
          L5_3 = #L5_3
          if L5_3 <= 3.0 then
            L5_3 = DrawText3D
            L6_3 = L3_3.x
            L7_3 = L3_3.y
            L8_3 = L3_3.z
            L9_3 = Lang
            L10_3 = "buy_text"
            L11_3 = L0_2.product
            L11_3 = L11_3.label
            L9_3, L10_3, L11_3 = L9_3(L10_3, L11_3)
            L5_3(L6_3, L7_3, L8_3, L9_3, L10_3, L11_3)
            L5_3 = DrawText3D
            L6_3 = L3_3.x
            L7_3 = L3_3.y
            L8_3 = L3_3.z
            L8_3 = L8_3 - 0.17
            L9_3 = Lang
            L10_3 = "ai_controls"
            L9_3, L10_3, L11_3 = L9_3(L10_3)
            L5_3(L6_3, L7_3, L8_3, L9_3, L10_3, L11_3)
            L5_3 = IsControlJustPressed
            L6_3 = 0
            L7_3 = 38
            L5_3 = L5_3(L6_3, L7_3)
            if L5_3 then
              L0_2.cantInteract = true
              L5_3 = createProgressBar
              L6_3 = L0_2.product
              L6_3 = L6_3.type
              L7_3 = L0_2.product
              L7_3 = L7_3.prop
              L7_3 = L7_3.model
              L8_3 = L0_2.product
              L8_3 = L8_3.proggresstime
              L5_3 = L5_3(L6_3, L7_3, L8_3)
              if L5_3 then
                L5_3 = Config
                L5_3 = L5_3.JobSuccess
                L6_3 = CurrentJob
                L7_3 = nil
                L8_3 = nil
                L9_3 = nil
                L10_3 = nil
                L5_3(L6_3, L7_3, L8_3, L9_3, L10_3)
                L5_3 = TriggerServerEvent
                L6_3 = "wais:giveHotdog:Reward"
                L7_3 = CurrentJob
                L8_3 = L4_3
                L5_3(L6_3, L7_3, L8_3)
                L5_3 = FreezeEntityPosition
                L6_3 = PlayerPedId
                L6_3 = L6_3()
                L7_3 = false
                L5_3(L6_3, L7_3)
                L5_3 = L0_2
                L6_3 = L5_3
                L5_3 = L5_3.playPossitiveResponse
                L5_3(L6_3)
              else
                L0_2.cantInteract = true
                L5_3 = FreezeEntityPosition
                L6_3 = PlayerPedId
                L6_3 = L6_3()
                L7_3 = false
                L5_3(L6_3, L7_3)
                L5_3 = L0_2
                L6_3 = L5_3
                L5_3 = L5_3.playNegativeResponse
                L5_3(L6_3)
              end
            else
              L5_3 = IsControlJustPressed
              L6_3 = 0
              L7_3 = 47
              L5_3 = L5_3(L6_3, L7_3)
              if L5_3 then
                L0_2.cantInteract = true
                L5_3 = L0_2
                L6_3 = L5_3
                L5_3 = L5_3.playNegativeResponse
                L5_3(L6_3)
              end
            end
          end
        end
      end
      L5_3 = Wait
      L6_3 = L0_3
      L5_3(L6_3)
    end
  end
  L3_2(L4_2)
  return L0_2
end
CreateCustomer = L3_1