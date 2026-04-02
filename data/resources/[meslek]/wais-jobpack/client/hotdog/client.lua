local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1
L0_1 = Config
L0_1 = L0_1.Jobs
L0_1 = L0_1.mobile_hotdog
L1_1 = false
L2_1 = nil
stand = nil
L3_1 = RegisterNetEvent
L4_1 = "wais:setDefault:JobThings"
function L5_1()
  local L0_2, L1_2
  L0_2 = CurrentJob
  if "mobile_hotdog" ~= L0_2 then
    return
  end
  L0_2 = LoopState
  L1_2 = false
  L0_2(L1_2)
  L0_2 = L1_1
  if L0_2 then
    L0_2 = deattachStand
    L0_2()
  end
  L0_2 = stand
  if nil ~= L0_2 then
    L0_2 = DeleteEntity
    L1_2 = stand
    L0_2(L1_2)
    stand = nil
  end
end
L3_1(L4_1, L5_1)
function L3_1()
  local L0_2, L1_2, L2_2
  L0_2 = Config
  L0_2 = L0_2.AbuseController
  L0_2 = L0_2.warning_count
  L1_2 = CreateThread
  function L2_2()
    local L0_3, L1_3, L2_3, L3_3, L4_3
    while true do
      L0_3 = L2_1
      if not L0_3 then
        break
      end
      L0_3 = L0_2
      L0_3 = L0_3 - 1
      L0_2 = L0_3
      L0_3 = Config
      L0_3 = L0_3.Notification
      L1_3 = Lang
      L2_3 = "job"
      L1_3 = L1_3(L2_3)
      L2_3 = Lang
      L3_3 = "too_far_hotdogstand"
      L2_3 = L2_3(L3_3)
      L3_3 = "warning"
      L4_3 = nil
      L0_3(L1_3, L2_3, L3_3, L4_3)
      L0_3 = L0_2
      if L0_3 <= 0 then
        L0_3 = TriggerEvent
        L1_3 = "wais:setDefault:JobThings"
        L0_3(L1_3)
        L0_3 = TriggerServerEvent
        L1_3 = "wais:delete:Entitys"
        L0_3(L1_3)
        L0_3 = Config
        L0_3 = L0_3.Notification
        L1_3 = Lang
        L2_3 = "job"
        L1_3 = L1_3(L2_3)
        L2_3 = Lang
        L3_3 = "cancelled"
        L2_3 = L2_3(L3_3)
        L3_3 = "error"
        L4_3 = nil
        L0_3(L1_3, L2_3, L3_3, L4_3)
        break
      end
      L0_3 = Wait
      L1_3 = Config
      L1_3 = L1_3.AbuseController
      L1_3 = L1_3.controller
      L0_3(L1_3)
    end
  end
  L1_2(L2_2)
end
function L4_1()
  local L0_2, L1_2, L2_2, L3_2, L4_2
  L0_2 = L0_1.disabled
  if L0_2 then
    return
  end
  L0_2 = lib
  L0_2 = L0_2.zones
  L0_2 = L0_2.sphere
  L1_2 = {}
  L2_2 = L0_1.menu
  L2_2 = L2_2.job_menu
  L1_2.coords = L2_2
  L2_2 = L0_1.menu
  L2_2 = L2_2.interaction_distance
  L1_2.radius = L2_2
  L2_2 = L0_1.debug
  L1_2.debug = L2_2
  function L2_2(A0_3)
    local L1_3, L2_3, L3_3, L4_3, L5_3, L6_3
    L1_3 = PlayerPedId
    L1_3 = L1_3()
    L2_3 = GetEntityCoords
    L3_3 = L1_3
    L2_3 = L2_3(L3_3)
    L3_3 = L0_1.menu
    L3_3 = L3_3.job_menu
    L3_3 = L2_3 - L3_3
    L3_3 = #L3_3
    L4_3 = L0_1.menu
    L4_3 = L4_3.interaction_distance
    if L3_3 <= L4_3 then
      L4_3 = isDead
      if not L4_3 then
        L4_3 = IsControlJustPressed
        L5_3 = 0
        L6_3 = 38
        L4_3 = L4_3(L5_3, L6_3)
        if L4_3 then
          L4_3 = openJobMenu
          L5_3 = "mobile_hotdog"
          L6_3 = L0_1.name
          L4_3(L5_3, L6_3)
        end
      end
    end
  end
  L1_2.inside = L2_2
  L2_2 = showJobMenuTextUI
  L1_2.onEnter = L2_2
  L2_2 = exitJobMenuPoint
  L1_2.onExit = L2_2
  L0_2 = L0_2(L1_2)
  L1_2 = L0_1.debug
  if L1_2 then
    L1_2 = print
    L2_2 = "[^2INFO^7] Mobile Hotdog Job Center has been initialized."
    L1_2(L2_2)
  end
  L1_2 = L0_1.menu
  L1_2 = L1_2.blips
  L1_2 = L1_2.show
  if L1_2 then
    L1_2 = AddBlipForCoord
    L2_2 = L0_1.menu
    L2_2 = L2_2.job_menu
    L2_2 = L2_2.x
    L3_2 = L0_1.menu
    L3_2 = L3_2.job_menu
    L3_2 = L3_2.y
    L4_2 = L0_1.menu
    L4_2 = L4_2.job_menu
    L4_2 = L4_2.z
    L1_2 = L1_2(L2_2, L3_2, L4_2)
    L2_2 = SetBlipSprite
    L3_2 = L1_2
    L4_2 = L0_1.menu
    L4_2 = L4_2.blips
    L4_2 = L4_2.sprite
    L2_2(L3_2, L4_2)
    L2_2 = SetBlipDisplay
    L3_2 = L1_2
    L4_2 = 4
    L2_2(L3_2, L4_2)
    L2_2 = SetBlipScale
    L3_2 = L1_2
    L4_2 = L0_1.menu
    L4_2 = L4_2.blips
    L4_2 = L4_2.scale
    L2_2(L3_2, L4_2)
    L2_2 = SetBlipColour
    L3_2 = L1_2
    L4_2 = L0_1.menu
    L4_2 = L4_2.blips
    L4_2 = L4_2.color
    L2_2(L3_2, L4_2)
    L2_2 = SetBlipAsShortRange
    L3_2 = L1_2
    L4_2 = true
    L2_2(L3_2, L4_2)
    L2_2 = BeginTextCommandSetBlipName
    L3_2 = "STRING"
    L2_2(L3_2)
    L2_2 = AddTextComponentString
    L3_2 = L0_1.menu
    L3_2 = L3_2.blips
    L3_2 = L3_2.label
    L2_2(L3_2)
    L2_2 = EndTextCommandSetBlipName
    L3_2 = L1_2
    L2_2(L3_2)
    L2_2 = blips
    L3_2 = blips
    L3_2 = #L3_2
    L3_2 = L3_2 + 1
    L2_2[L3_2] = L1_2
    L2_2 = L0_1.debug
    if L2_2 then
      L2_2 = print
      L3_2 = "[^2INFO^7] Mobile Hotdog Job Center Blip has been initialized."
      L2_2(L3_2)
    end
  end
  L1_2 = points
  L2_2 = points
  L2_2 = #L2_2
  L2_2 = L2_2 + 1
  L1_2[L2_2] = L0_2
end
initHotdog = L4_1
function L4_1()
  local L0_2, L1_2, L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2
  L0_2 = L1_1
  if L0_2 then
    L0_2 = deattachStand
    L0_2()
  end
  L0_2 = joaat
  L1_2 = L0_1.prop
  L1_2 = L1_2.model
  L0_2 = L0_2(L1_2)
  L1_2 = loadModel
  L2_2 = L0_2
  L1_2 = L1_2(L2_2)
  if not L1_2 then
    return
  end
  L1_2 = CreateObject
  L2_2 = L0_2
  L3_2 = L0_1.prop
  L3_2 = L3_2.spawn_coords
  L3_2 = L3_2.x
  L4_2 = L0_1.prop
  L4_2 = L4_2.spawn_coords
  L4_2 = L4_2.y
  L5_2 = L0_1.prop
  L5_2 = L5_2.spawn_coords
  L5_2 = L5_2.z
  L6_2 = true
  L7_2 = false
  L8_2 = false
  L1_2 = L1_2(L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2)
  stand = L1_2
  L1_2 = SetEntityHeading
  L2_2 = stand
  L3_2 = L0_1.prop
  L3_2 = L3_2.spawn_coords
  L3_2 = L3_2.w
  L1_2(L2_2, L3_2)
  L1_2 = PlaceObjectOnGroundProperly
  L2_2 = stand
  L1_2(L2_2)
  L1_2 = SetEntityAsMissionEntity
  L2_2 = stand
  L3_2 = true
  L4_2 = true
  L1_2(L2_2, L3_2, L4_2)
  L1_2 = FreezeEntityPosition
  L2_2 = stand
  L3_2 = true
  L1_2(L2_2, L3_2)
  L1_2 = L0_1.debug
  if L1_2 then
    L1_2 = print
    L2_2 = "[^2INFO^7] Mobile Hotdog Stand has been initialized. EntityId: %s - Network Id: %s"
    L3_2 = L2_2
    L2_2 = L2_2.format
    L4_2 = stand
    L5_2 = NetworkGetNetworkIdFromEntity
    L6_2 = stand
    L5_2, L6_2, L7_2, L8_2 = L5_2(L6_2)
    L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2 = L2_2(L3_2, L4_2, L5_2, L6_2, L7_2, L8_2)
    L1_2(L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2)
  end
  L1_2 = TriggerServerEvent
  L2_2 = "wais:addProp"
  L3_2 = stand
  L4_2 = NetworkGetNetworkIdFromEntity
  L5_2 = stand
  L4_2, L5_2, L6_2, L7_2, L8_2 = L4_2(L5_2)
  L1_2(L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2)
  L1_2 = AddTargetEntity
  L2_2 = stand
  L3_2 = {}
  L4_2 = {}
  L4_2.icon = "fa-solid fa-dolly"
  L5_2 = Lang
  L6_2 = "stand_drive"
  L5_2 = L5_2(L6_2)
  L4_2.label = L5_2
  function L5_2()
    local L0_3, L1_3
    L0_3 = CurrentJob
    if "mobile_hotdog" ~= L0_3 then
      return
    end
    L0_3 = attachStand
    L0_3()
  end
  L4_2.action = L5_2
  L5_2 = {}
  L5_2.icon = "fa-solid fa-comments-dollar"
  L6_2 = Lang
  L7_2 = "open_close_sale"
  L6_2 = L6_2(L7_2)
  L5_2.label = L6_2
  function L6_2()
    local L0_3, L1_3
    L0_3 = CurrentJob
    if "mobile_hotdog" ~= L0_3 then
      return
    end
    L0_3 = LoopState
    L0_3()
  end
  L5_2.action = L6_2
  L3_2[1] = L4_2
  L3_2[2] = L5_2
  L4_2 = true
  L5_2 = 3.0
  L1_2(L2_2, L3_2, L4_2, L5_2)
  L1_2 = props
  L2_2 = props
  L2_2 = #L2_2
  L2_2 = L2_2 + 1
  L3_2 = stand
  L1_2[L2_2] = L3_2
  L1_2 = Config
  L1_2 = L1_2.Notification
  L2_2 = Lang
  L3_2 = "job"
  L2_2 = L2_2(L3_2)
  L3_2 = Lang
  L4_2 = "stand_spawned"
  L3_2 = L3_2(L4_2)
  L4_2 = "success"
  L5_2 = nil
  L1_2(L2_2, L3_2, L4_2, L5_2)
end
spawnHotdogStand = L4_1
function L4_1()
  local L0_2, L1_2, L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2
  L0_2 = LoopState
  L1_2 = false
  L0_2(L1_2)
  L0_2 = PlayerPedId
  L0_2 = L0_2()
  L1_2 = L0_1.prop
  L1_2 = L1_2.attach_settings
  L1_2 = L1_2.animName
  L2_2 = L0_1.prop
  L2_2 = L2_2.attach_settings
  L2_2 = L2_2.animDict
  L3_2 = loadDict
  L4_2 = L2_2
  L3_2 = L3_2(L4_2)
  if not L3_2 then
    return
  end
  L3_2 = TaskPlayAnim
  L4_2 = PlayerPedId
  L4_2 = L4_2()
  L5_2 = L2_2
  L6_2 = L1_2
  L7_2 = 8.0
  L8_2 = 8.0
  L9_2 = -1
  L10_2 = 50
  L11_2 = 0
  L12_2 = false
  L13_2 = false
  L14_2 = false
  L3_2(L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2)
  L3_2 = Wait
  L4_2 = 250
  L3_2(L4_2)
  L3_2 = AttachEntityToEntity
  L4_2 = stand
  L5_2 = L0_2
  L6_2 = GetPedBoneIndex
  L7_2 = L0_2
  L8_2 = L0_1.prop
  L8_2 = L8_2.attach_settings
  L8_2 = L8_2.bone
  L6_2 = L6_2(L7_2, L8_2)
  L7_2 = L0_1.prop
  L7_2 = L7_2.attach_settings
  L7_2 = L7_2.coords
  L7_2 = L7_2.x
  L8_2 = L0_1.prop
  L8_2 = L8_2.attach_settings
  L8_2 = L8_2.coords
  L8_2 = L8_2.y
  L9_2 = L0_1.prop
  L9_2 = L9_2.attach_settings
  L9_2 = L9_2.coords
  L9_2 = L9_2.z
  L10_2 = L0_1.prop
  L10_2 = L10_2.attach_settings
  L10_2 = L10_2.rotation
  L10_2 = L10_2.x
  L11_2 = L0_1.prop
  L11_2 = L11_2.attach_settings
  L11_2 = L11_2.rotation
  L11_2 = L11_2.y
  L12_2 = L0_1.prop
  L12_2 = L12_2.attach_settings
  L12_2 = L12_2.rotation
  L12_2 = L12_2.z
  L13_2 = false
  L14_2 = true
  L15_2 = false
  L16_2 = false
  L17_2 = 1
  L18_2 = true
  L3_2(L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2)
  L3_2 = FreezeEntityPosition
  L4_2 = stand
  L5_2 = false
  L3_2(L4_2, L5_2)
  L3_2 = true
  L1_1 = L3_2
  L3_2 = L0_1.debug
  if L3_2 then
    L3_2 = print
    L4_2 = "[^2INFO^7] Mobile Hotdog Stand has been attached to the player."
    L3_2(L4_2)
  end
end
attachStand = L4_1
function L4_1()
  local L0_2, L1_2, L2_2, L3_2, L4_2
  L0_2 = L1_1
  if not L0_2 then
    return
  end
  L0_2 = PlayerPedId
  L0_2 = L0_2()
  L1_2 = ClearPedTasks
  L2_2 = L0_2
  L1_2(L2_2)
  L1_2 = ClearPedTasksImmediately
  L2_2 = L0_2
  L1_2(L2_2)
  L1_2 = FreezeEntityPosition
  L2_2 = stand
  L3_2 = true
  L1_2(L2_2, L3_2)
  L1_2 = DetachEntity
  L2_2 = stand
  L3_2 = false
  L4_2 = false
  L1_2(L2_2, L3_2, L4_2)
  L1_2 = SetEntityCollision
  L2_2 = stand
  L3_2 = true
  L4_2 = true
  L1_2(L2_2, L3_2, L4_2)
  L1_2 = false
  L1_1 = L1_2
  L1_2 = L0_1.debug
  if L1_2 then
    L1_2 = print
    L2_2 = "[^2INFO^7] Mobile Hotdog Stand has been deattached from the player."
    L1_2(L2_2)
  end
end
deattachStand = L4_1
L4_1 = CreateThread
function L5_1()
  local L0_2, L1_2, L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2
  while true do
    L0_2 = PlayerPedId
    L0_2 = L0_2()
    L1_2 = 1000
    L2_2 = L1_1
    if L2_2 then
      L1_2 = 5
      L2_2 = GetEntityCoords
      L3_2 = stand
      L2_2 = L2_2(L3_2)
      L3_2 = IsPedShooting
      L4_2 = L0_2
      L3_2 = L3_2(L4_2)
      if not L3_2 then
        L3_2 = IsPlayerFreeAiming
        L4_2 = pId
        L3_2 = L3_2(L4_2)
        if not L3_2 then
          L3_2 = IsPedInMeleeCombat
          L4_2 = L0_2
          L3_2 = L3_2(L4_2)
          if not L3_2 then
            goto lbl_28
          end
        end
      end
      L3_2 = deattachStand
      L3_2()
      ::lbl_28::
      L3_2 = IsPedDeadOrDying
      L4_2 = L0_2
      L5_2 = false
      L3_2 = L3_2(L4_2, L5_2)
      if L3_2 then
        L3_2 = deattachStand
        L3_2()
      end
      L3_2 = IsPedRagdoll
      L4_2 = L0_2
      L3_2 = L3_2(L4_2)
      if L3_2 then
        L3_2 = deattachStand
        L3_2()
      end
      L3_2 = IsControlJustPressed
      L4_2 = 0
      L5_2 = 46
      L3_2 = L3_2(L4_2, L5_2)
      if L3_2 then
        L3_2 = deattachStand
        L3_2()
      end
      L3_2 = DisableControlAction
      L4_2 = 0
      L5_2 = 23
      L6_2 = true
      L3_2(L4_2, L5_2, L6_2)
      L3_2 = DisableControlAction
      L4_2 = 0
      L5_2 = 44
      L6_2 = true
      L3_2(L4_2, L5_2, L6_2)
      L3_2 = DrawText3D
      L4_2 = L2_2.x
      L5_2 = L2_2.y
      L6_2 = L2_2.z
      L6_2 = L6_2 + 0.5
      L7_2 = Lang
      L8_2 = "cancel_stand_drive"
      L7_2, L8_2 = L7_2(L8_2)
      L3_2(L4_2, L5_2, L6_2, L7_2, L8_2)
    end
    L2_2 = Wait
    L3_2 = L1_2
    L2_2(L3_2)
  end
end
L4_1(L5_1)
L4_1 = CreateThread
function L5_1()
  local L0_2, L1_2, L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2, L20_2, L21_2, L22_2, L23_2, L24_2, L25_2, L26_2, L27_2, L28_2
  while true do
    L0_2 = PlayerPedId
    L0_2 = L0_2()
    L1_2 = GetEntityCoords
    L2_2 = L0_2
    L1_2 = L1_2(L2_2)
    L2_2 = 1000
    L3_2 = CurrentJob
    if "mobile_hotdog" == L3_2 then
      L3_2 = L0_1.disabled
      if not L3_2 then
        L3_2 = L0_1.menu
        L3_2 = L3_2.job_menu
        L3_2 = L1_2 - L3_2
        L3_2 = #L3_2
        L4_2 = Config
        L4_2 = L4_2.DrawMarkerInteractDistance
        if L3_2 <= L4_2 then
          L2_2 = 5
          L4_2 = DrawMarker
          L5_2 = 1
          L6_2 = L0_1.menu
          L6_2 = L6_2.job_menu
          L6_2 = L6_2.x
          L7_2 = L0_1.menu
          L7_2 = L7_2.job_menu
          L7_2 = L7_2.y
          L8_2 = L0_1.menu
          L8_2 = L8_2.job_menu
          L8_2 = L8_2.z
          L8_2 = L8_2 - 0.95
          L9_2 = 0
          L10_2 = 0
          L11_2 = 0
          L12_2 = 0
          L13_2 = 0
          L14_2 = 0
          L15_2 = 1.0
          L16_2 = 1.0
          L17_2 = 1.0
          L18_2 = 255
          L19_2 = 255
          L20_2 = 0
          L21_2 = 200
          L22_2 = false
          L23_2 = false
          L24_2 = 2
          L25_2 = false
          L26_2 = false
          L27_2 = false
          L28_2 = false
          L4_2(L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2, L20_2, L21_2, L22_2, L23_2, L24_2, L25_2, L26_2, L27_2, L28_2)
        end
        L4_2 = stand
        if nil ~= L4_2 then
          L4_2 = GetEntityCoords
          L5_2 = stand
          L4_2 = L4_2(L5_2)
          L5_2 = L1_2 - L4_2
          L5_2 = #L5_2
          if L5_2 >= 60.0 then
            L6_2 = L2_1
            if nil == L6_2 then
              L6_2 = true
              L2_1 = L6_2
              L6_2 = L3_1
              L6_2()
            end
          else
            L6_2 = L2_1
            if L6_2 then
              L6_2 = nil
              L2_1 = L6_2
            end
          end
        end
      end
    end
    L3_2 = Wait
    L4_2 = L2_2
    L3_2(L4_2)
  end
end
L4_1(L5_1)