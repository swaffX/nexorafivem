local L0_1, L1_1, L2_1
L0_1 = {}
Gardens = L0_1
L0_1 = Gardens
L1_1 = Gardens
L0_1.__index = L1_1
L0_1 = Gardens
L1_1 = {}
L0_1.Props = L1_1
L0_1 = Config
L0_1 = L0_1.Jobs
L0_1 = L0_1.gardener
L1_1 = Gardens
function L2_1(A0_2)
  local L1_2, L2_2, L3_2
  L1_2 = Config
  L1_2 = L1_2.AbuseController
  L1_2 = L1_2.warning_count
  L2_2 = CreateThread
  function L3_2()
    local L0_3, L1_3, L2_3, L3_3, L4_3
    while true do
      L0_3 = A0_2
      if not L0_3 then
        break
      end
      L0_3 = A0_2.outOfZone
      if not L0_3 then
        break
      end
      L0_3 = A0_2.deleted
      if L0_3 then
        break
      end
      L0_3 = L1_2
      L0_3 = L0_3 - 1
      L1_2 = L0_3
      L0_3 = Config
      L0_3 = L0_3.Notification
      L1_3 = Lang
      L2_3 = "job"
      L1_3 = L1_3(L2_3)
      L2_3 = Lang
      L3_3 = "go_garden"
      L2_3 = L2_3(L3_3)
      L3_3 = "warning"
      L4_3 = nil
      L0_3(L1_3, L2_3, L3_3, L4_3)
      L0_3 = L1_2
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
  L2_2(L3_2)
end
L1_1.outOfZoneAttempt = L2_1
L1_1 = Gardens
function L2_1(A0_2)
  local L1_2, L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2
  L1_2 = promise
  L2_2 = L1_2
  L1_2 = L1_2.new
  L1_2 = L1_2(L2_2)
  L2_2 = PlayerPedId
  L2_2 = L2_2()
  A0_2.playerBusy = true
  L3_2 = ClearPedTasks
  L4_2 = L2_2
  L3_2(L4_2)
  L3_2 = ClearPedTasksImmediately
  L4_2 = L2_2
  L3_2(L4_2)
  L3_2 = AttachEntityToEntity
  L4_2 = gardenerRake
  L5_2 = L2_2
  L6_2 = GetPedBoneIndex
  L7_2 = L2_2
  L8_2 = L0_1.gardener_entitys
  L8_2 = L8_2.rake_prop
  L8_2 = L8_2.player_animation
  L8_2 = L8_2.bone
  L6_2 = L6_2(L7_2, L8_2)
  L7_2 = L0_1.gardener_entitys
  L7_2 = L7_2.rake_prop
  L7_2 = L7_2.player_animation
  L7_2 = L7_2.coords
  L7_2 = L7_2.x
  L8_2 = L0_1.gardener_entitys
  L8_2 = L8_2.rake_prop
  L8_2 = L8_2.player_animation
  L8_2 = L8_2.coords
  L8_2 = L8_2.y
  L9_2 = L0_1.gardener_entitys
  L9_2 = L9_2.rake_prop
  L9_2 = L9_2.player_animation
  L9_2 = L9_2.coords
  L9_2 = L9_2.z
  L10_2 = L0_1.gardener_entitys
  L10_2 = L10_2.rake_prop
  L10_2 = L10_2.player_animation
  L10_2 = L10_2.rotation
  L10_2 = L10_2.x
  L11_2 = L0_1.gardener_entitys
  L11_2 = L11_2.rake_prop
  L11_2 = L11_2.player_animation
  L11_2 = L11_2.rotation
  L11_2 = L11_2.y
  L12_2 = L0_1.gardener_entitys
  L12_2 = L12_2.rake_prop
  L12_2 = L12_2.player_animation
  L12_2 = L12_2.rotation
  L12_2 = L12_2.z
  L13_2 = true
  L14_2 = true
  L15_2 = false
  L16_2 = false
  L17_2 = 1
  L18_2 = true
  L3_2(L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2)
  L3_2 = lib
  L3_2 = L3_2.progressBar
  L4_2 = {}
  L4_2.duration = 5000
  L5_2 = Lang
  L6_2 = "cleaning_rubbish"
  L5_2 = L5_2(L6_2)
  L4_2.label = L5_2
  L4_2.canCancel = false
  L5_2 = {}
  L6_2 = L0_1.gardener_entitys
  L6_2 = L6_2.rake_prop
  L6_2 = L6_2.player_animation
  L6_2 = L6_2.animDict
  L5_2.dict = L6_2
  L6_2 = L0_1.gardener_entitys
  L6_2 = L6_2.rake_prop
  L6_2 = L6_2.player_animation
  L6_2 = L6_2.animName
  L5_2.clip = L6_2
  L6_2 = L0_1.gardener_entitys
  L6_2 = L6_2.rake_prop
  L6_2 = L6_2.player_animation
  L6_2 = L6_2.flag
  L5_2.flag = L6_2
  L4_2.anim = L5_2
  L3_2 = L3_2(L4_2)
  if L3_2 then
    L4_2 = L1_2
    L3_2 = L1_2.resolve
    L5_2 = true
    L3_2(L4_2, L5_2)
  else
    L4_2 = L1_2
    L3_2 = L1_2.resolve
    L5_2 = false
    L3_2(L4_2, L5_2)
  end
  A0_2.playerBusy = false
  L3_2 = takePropFromVehicle
  L4_2 = gardenerRake
  L5_2 = L0_1.gardener_entitys
  L5_2 = L5_2.rake_prop
  L5_2 = L5_2.player_attach
  L3_2(L4_2, L5_2)
  L3_2 = Citizen
  L3_2 = L3_2.Await
  L4_2 = L1_2
  return L3_2(L4_2)
end
L1_1.clearRubbish = L2_1
L1_1 = Gardens
function L2_1(A0_2, A1_2)
  local L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2
  L2_2 = A0_2.Garden
  L2_2 = L2_2.rubbishes
  L2_2 = L2_2.props
  L2_2 = L2_2[A1_2]
  if not L2_2 then
    return
  end
  L2_2 = A0_2.Garden
  L2_2 = L2_2.rubbishes
  L2_2 = L2_2.props
  L2_2 = L2_2[A1_2]
  L2_2 = L2_2.prop
  L3_2 = TriggerServerEvent
  L4_2 = "wais:deleteProp:Id"
  L5_2 = NetworkGetNetworkIdFromEntity
  L6_2 = L2_2
  L5_2, L6_2, L7_2, L8_2 = L5_2(L6_2)
  L3_2(L4_2, L5_2, L6_2, L7_2, L8_2)
  L3_2 = DoesEntityExist
  L4_2 = L2_2
  L3_2 = L3_2(L4_2)
  if L3_2 then
    L3_2 = DeleteEntity
    L4_2 = L2_2
    L3_2(L4_2)
  end
  L3_2 = A0_2.Garden
  L3_2 = L3_2.rubbishes
  L3_2 = L3_2.props
  L3_2 = L3_2[A1_2]
  L3_2 = L3_2.zone
  if L3_2 then
    L3_2 = lib
    L3_2 = L3_2.hideTextUI
    L3_2()
    L3_2 = A0_2.Garden
    L3_2 = L3_2.rubbishes
    L3_2 = L3_2.props
    L3_2 = L3_2[A1_2]
    L3_2 = L3_2.zone
    L4_2 = L3_2
    L3_2 = L3_2.remove
    L3_2(L4_2)
  end
  L3_2 = A0_2.Garden
  L3_2 = L3_2.rubbishes
  L4_2 = A0_2.Garden
  L4_2 = L4_2.rubbishes
  L4_2 = L4_2.cleared
  L4_2 = L4_2 + 1
  L3_2.cleared = L4_2
  L3_2 = A0_2.Garden
  L3_2 = L3_2.rubbishes
  L3_2 = L3_2.props
  L3_2[A1_2] = nil
  L3_2 = A0_2.props
  L3_2[A1_2] = nil
  L3_2 = A0_2.Garden
  L3_2 = L3_2.rubbishes
  L3_2 = L3_2.cleared
  L4_2 = A0_2.Garden
  L4_2 = L4_2.rubbishes
  L4_2 = L4_2.total
  if L3_2 >= L4_2 then
    L3_2 = A0_2.Garden
    L3_2 = L3_2.bushes
    L3_2 = L3_2.cleared
    L4_2 = A0_2.Garden
    L4_2 = L4_2.bushes
    L4_2 = L4_2.total
    if L3_2 >= L4_2 then
      L3_2 = A0_2.Garden
      L3_2 = L3_2.allDone
      if not L3_2 then
        L3_2 = SetNewWaypoint
        L4_2 = L0_1.menu
        L4_2 = L4_2.job_menu
        L4_2 = L4_2.x
        L5_2 = L0_1.menu
        L5_2 = L5_2.job_menu
        L5_2 = L5_2.y
        L3_2(L4_2, L5_2)
        L3_2 = Config
        L3_2 = L3_2.Notification
        L4_2 = Lang
        L5_2 = "job"
        L4_2 = L4_2(L5_2)
        L5_2 = Lang
        L6_2 = "goto_menu_for_money"
        L5_2 = L5_2(L6_2)
        L6_2 = "success"
        L7_2 = 15000
        L3_2(L4_2, L5_2, L6_2, L7_2)
        L3_2 = A0_2.Garden
        L3_2.allDone = true
    end
  end
  else
    L3_2 = A0_2.Garden
    L3_2 = L3_2.rubbishes
    L3_2 = L3_2.total
    L4_2 = A0_2.Garden
    L4_2 = L4_2.rubbishes
    L4_2 = L4_2.cleared
    L3_2 = L3_2 - L4_2
    if L3_2 <= 0 then
      L3_2 = Config
      L3_2 = L3_2.Notification
      L4_2 = Lang
      L5_2 = "job"
      L4_2 = L4_2(L5_2)
      L5_2 = Lang
      L6_2 = "grass_cleared"
      L7_2 = A0_2.Garden
      L7_2 = L7_2.bushes
      L7_2 = L7_2.total
      L8_2 = A0_2.Garden
      L8_2 = L8_2.bushes
      L8_2 = L8_2.cleared
      L7_2 = L7_2 - L8_2
      L5_2 = L5_2(L6_2, L7_2)
      L6_2 = "inform"
      L7_2 = 5000
      L3_2(L4_2, L5_2, L6_2, L7_2)
    else
      L3_2 = Config
      L3_2 = L3_2.Notification
      L4_2 = Lang
      L5_2 = "job"
      L4_2 = L4_2(L5_2)
      L5_2 = Lang
      L6_2 = "rubbish_cleared"
      L7_2 = A0_2.Garden
      L7_2 = L7_2.rubbishes
      L7_2 = L7_2.total
      L8_2 = A0_2.Garden
      L8_2 = L8_2.rubbishes
      L8_2 = L8_2.cleared
      L7_2 = L7_2 - L8_2
      L5_2 = L5_2(L6_2, L7_2)
      L6_2 = "inform"
      L7_2 = 5000
      L3_2(L4_2, L5_2, L6_2, L7_2)
    end
  end
end
L1_1.deleteRubbish = L2_1
L1_1 = Gardens
function L2_1(A0_2, A1_2)
  local L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2
  L2_2 = A0_2.Garden
  L2_2 = L2_2.bushes
  L2_2 = L2_2.props
  L2_2 = L2_2[A1_2]
  if not L2_2 then
    return
  end
  L2_2 = A0_2.Garden
  L2_2 = L2_2.bushes
  L2_2 = L2_2.props
  L2_2 = L2_2[A1_2]
  L2_2 = L2_2.prop
  L3_2 = TriggerServerEvent
  L4_2 = "wais:deleteProp:Id"
  L5_2 = NetworkGetNetworkIdFromEntity
  L6_2 = L2_2
  L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2 = L5_2(L6_2)
  L3_2(L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2)
  L3_2 = DoesEntityExist
  L4_2 = L2_2
  L3_2 = L3_2(L4_2)
  if L3_2 then
    L3_2 = DeleteEntity
    L4_2 = L2_2
    L3_2(L4_2)
  end
  L3_2 = GetVehiclePedIsIn
  L4_2 = PlayerPedId
  L4_2 = L4_2()
  L5_2 = false
  L3_2 = L3_2(L4_2, L5_2)
  if L3_2 then
    L3_2 = loadPtfx
    L4_2 = L0_1.car_settings
    L4_2 = L4_2.cut_ptfx
    L4_2 = L4_2.class
    L3_2 = L3_2(L4_2)
    if L3_2 then
      L3_2 = UseParticleFxAsset
      L4_2 = L0_1.car_settings
      L4_2 = L4_2.cut_ptfx
      L4_2 = L4_2.class
      L3_2(L4_2)
      L3_2 = _ENV
      L4_2 = "StartNetworkedParticleFxLoopedOnEntityBone"
      L3_2 = L3_2[L4_2]
      L4_2 = L0_1.car_settings
      L4_2 = L4_2.cut_ptfx
      L4_2 = L4_2.name
      L5_2 = gardenerTractor
      L6_2 = L0_1.car_settings
      L6_2 = L6_2.cut_ptfx
      L6_2 = L6_2.coords
      L6_2 = L6_2.x
      L7_2 = L0_1.car_settings
      L7_2 = L7_2.cut_ptfx
      L7_2 = L7_2.coords
      L7_2 = L7_2.y
      L8_2 = L0_1.car_settings
      L8_2 = L8_2.cut_ptfx
      L8_2 = L8_2.coords
      L8_2 = L8_2.z
      L9_2 = L0_1.car_settings
      L9_2 = L9_2.cut_ptfx
      L9_2 = L9_2.rotation
      L9_2 = L9_2.x
      L10_2 = L0_1.car_settings
      L10_2 = L10_2.cut_ptfx
      L10_2 = L10_2.rotation
      L10_2 = L10_2.y
      L11_2 = L0_1.car_settings
      L11_2 = L11_2.cut_ptfx
      L11_2 = L11_2.rotation
      L11_2 = L11_2.z
      L12_2 = 0
      L13_2 = 1.0
      L14_2 = false
      L15_2 = false
      L16_2 = false
      L3_2(L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2)
    end
  end
  L3_2 = A0_2.Garden
  L3_2 = L3_2.bushes
  L4_2 = A0_2.Garden
  L4_2 = L4_2.bushes
  L4_2 = L4_2.cleared
  L4_2 = L4_2 + 1
  L3_2.cleared = L4_2
  L3_2 = A0_2.Garden
  L3_2 = L3_2.bushes
  L3_2 = L3_2.props
  L3_2[A1_2] = nil
  L3_2 = A0_2.props
  L3_2[A1_2] = nil
  L3_2 = A0_2.Garden
  L3_2 = L3_2.rubbishes
  L3_2 = L3_2.cleared
  L4_2 = A0_2.Garden
  L4_2 = L4_2.rubbishes
  L4_2 = L4_2.total
  if L3_2 >= L4_2 then
    L3_2 = A0_2.Garden
    L3_2 = L3_2.bushes
    L3_2 = L3_2.cleared
    L4_2 = A0_2.Garden
    L4_2 = L4_2.bushes
    L4_2 = L4_2.total
    if L3_2 >= L4_2 then
      L3_2 = A0_2.Garden
      L3_2 = L3_2.allDone
      if not L3_2 then
        L3_2 = SetNewWaypoint
        L4_2 = L0_1.menu
        L4_2 = L4_2.job_menu
        L4_2 = L4_2.x
        L5_2 = L0_1.menu
        L5_2 = L5_2.job_menu
        L5_2 = L5_2.y
        L3_2(L4_2, L5_2)
        L3_2 = Config
        L3_2 = L3_2.Notification
        L4_2 = Lang
        L5_2 = "job"
        L4_2 = L4_2(L5_2)
        L5_2 = Lang
        L6_2 = "goto_menu_for_money"
        L5_2 = L5_2(L6_2)
        L6_2 = "success"
        L7_2 = 15000
        L3_2(L4_2, L5_2, L6_2, L7_2)
        L3_2 = A0_2.Garden
        L3_2.allDone = true
    end
  end
  else
    L3_2 = A0_2.Garden
    L3_2 = L3_2.bushes
    L3_2 = L3_2.total
    L4_2 = A0_2.Garden
    L4_2 = L4_2.bushes
    L4_2 = L4_2.cleared
    L3_2 = L3_2 - L4_2
    if L3_2 <= 0 then
      L3_2 = Config
      L3_2 = L3_2.Notification
      L4_2 = Lang
      L5_2 = "job"
      L4_2 = L4_2(L5_2)
      L5_2 = Lang
      L6_2 = "rubbish_cleared"
      L7_2 = A0_2.Garden
      L7_2 = L7_2.rubbishes
      L7_2 = L7_2.total
      L8_2 = A0_2.Garden
      L8_2 = L8_2.rubbishes
      L8_2 = L8_2.cleared
      L7_2 = L7_2 - L8_2
      L5_2 = L5_2(L6_2, L7_2)
      L6_2 = "inform"
      L7_2 = 5000
      L3_2(L4_2, L5_2, L6_2, L7_2)
    else
      L3_2 = Config
      L3_2 = L3_2.Notification
      L4_2 = Lang
      L5_2 = "job"
      L4_2 = L4_2(L5_2)
      L5_2 = Lang
      L6_2 = "grass_cleared"
      L7_2 = A0_2.Garden
      L7_2 = L7_2.bushes
      L7_2 = L7_2.total
      L8_2 = A0_2.Garden
      L8_2 = L8_2.bushes
      L8_2 = L8_2.cleared
      L7_2 = L7_2 - L8_2
      L5_2 = L5_2(L6_2, L7_2)
      L6_2 = "inform"
      L7_2 = 5000
      L3_2(L4_2, L5_2, L6_2, L7_2)
    end
  end
end
L1_1.deleteBush = L2_1
L1_1 = Gardens
function L2_1(A0_2)
  local L1_2, L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2
  A0_2.deleted = true
  A0_2.outOfZone = false
  L1_2 = A0_2.Garden
  if L1_2 then
    L1_2 = DoesBlipExist
    L2_2 = A0_2.Garden
    L2_2 = L2_2.blip
    L1_2 = L1_2(L2_2)
    if L1_2 then
      L1_2 = RemoveBlip
      L2_2 = A0_2.Garden
      L2_2 = L2_2.blip
      L1_2(L2_2)
    end
    L1_2 = A0_2.Garden
    L1_2 = L1_2.zone
    if L1_2 then
      L1_2 = A0_2.Garden
      L1_2 = L1_2.zone
      L2_2 = L1_2
      L1_2 = L1_2.remove
      L1_2(L2_2)
    end
    L1_2 = pairs
    L2_2 = A0_2.Garden
    L2_2 = L2_2.rubbishes
    L2_2 = L2_2.props
    L1_2, L2_2, L3_2, L4_2 = L1_2(L2_2)
    for L5_2, L6_2 in L1_2, L2_2, L3_2, L4_2 do
      L7_2 = L6_2.zone
      if L7_2 then
        L7_2 = L6_2.zone
        L8_2 = L7_2
        L7_2 = L7_2.remove
        L7_2(L8_2)
      end
      L7_2 = L6_2.prop
      if nil ~= L7_2 then
        L7_2 = DoesEntityExist
        L8_2 = L6_2.prop
        L7_2 = L7_2(L8_2)
        if L7_2 then
          L7_2 = DeleteEntity
          L8_2 = L6_2.prop
          L7_2(L8_2)
        end
      end
    end
    L1_2 = pairs
    L2_2 = A0_2.Garden
    L2_2 = L2_2.bushes
    L2_2 = L2_2.props
    L1_2, L2_2, L3_2, L4_2 = L1_2(L2_2)
    for L5_2, L6_2 in L1_2, L2_2, L3_2, L4_2 do
      L7_2 = L6_2.zone
      if L7_2 then
        L7_2 = L6_2.zone
        L8_2 = L7_2
        L7_2 = L7_2.remove
        L7_2(L8_2)
      end
      L7_2 = L6_2.prop
      if nil ~= L7_2 then
        L7_2 = DoesEntityExist
        L8_2 = L6_2.prop
        L7_2 = L7_2(L8_2)
        if L7_2 then
          L7_2 = DeleteEntity
          L8_2 = L6_2.prop
          L7_2(L8_2)
        end
      end
    end
    A0_2.Garden = nil
  end
  L1_2 = pairs
  L2_2 = A0_2.props
  L1_2, L2_2, L3_2, L4_2 = L1_2(L2_2)
  for L5_2, L6_2 in L1_2, L2_2, L3_2, L4_2 do
    L7_2 = DoesEntityExist
    L8_2 = L6_2.entity
    L7_2 = L7_2(L8_2)
    if L7_2 then
      L7_2 = DeleteEntity
      L8_2 = L6_2.entity
      L7_2(L8_2)
    end
  end
  L1_2 = changeGardenerToDef
  L1_2()
  L1_2 = TriggerServerEvent
  L2_2 = "wais:changeGarden:status"
  L3_2 = A0_2.index
  L1_2(L2_2, L3_2)
  L1_2 = {}
  A0_2.props = L1_2
  A0_2 = nil
end
L1_1.deleteSelf = L2_1
L1_1 = Gardens
function L2_1(A0_2)
  local L1_2
  L1_2 = A0_2.Garden
  L1_2 = L1_2.allDone
  return L1_2
end
L1_1.hasCleared = L2_1
L1_1 = Gardens
function L2_1(A0_2, A1_2)
  local L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2
  L2_2 = setmetatable
  L3_2 = {}
  L4_2 = Gardens
  L2_2 = L2_2(L3_2, L4_2)
  L3_2 = lib
  L3_2 = L3_2.string
  L3_2 = L3_2.random
  L4_2 = "aaaaaa"
  L3_2 = L3_2(L4_2)
  L4_2 = A1_2
  L5_2 = L0_1.gardens
  L5_2 = L5_2[A1_2]
  L2_2.config = L5_2
  L2_2.index = L4_2
  L2_2.id = L3_2
  L3_2 = false
  L4_2 = false
  L5_2 = false
  L6_2 = false
  L2_2.playerBusy = false
  L2_2.deleted = L6_2
  L2_2.propsCreated = L5_2
  L2_2.deleted = L4_2
  L2_2.outOfZone = L3_2
  L3_2 = {}
  L3_2.blip = nil
  L4_2 = lib
  L4_2 = L4_2.zones
  L4_2 = L4_2.sphere
  L5_2 = {}
  L6_2 = vec3
  L7_2 = L2_2.config
  L7_2 = L7_2.coords
  L7_2 = L7_2.x
  L8_2 = L2_2.config
  L8_2 = L8_2.coords
  L8_2 = L8_2.y
  L9_2 = L2_2.config
  L9_2 = L9_2.coords
  L9_2 = L9_2.z
  L6_2 = L6_2(L7_2, L8_2, L9_2)
  L5_2.coords = L6_2
  L6_2 = L2_2.config
  L6_2 = L6_2.zoneRadius
  L5_2.radius = L6_2
  L6_2 = L0_1.debug
  L5_2.debug = L6_2
  function L6_2()
    local L0_3, L1_3
  end
  L5_2.inside = L6_2
  function L6_2()
    local L0_3, L1_3
    L2_2.outOfZone = false
    playerInGarden = true
  end
  L5_2.onEnter = L6_2
  function L6_2()
    local L0_3, L1_3
    L0_3 = L2_2.Garden
    L0_3 = L0_3.allDone
    if L0_3 then
      return
    end
    L2_2.outOfZone = true
    playerInGarden = false
    L0_3 = L2_2
    L1_3 = L0_3
    L0_3 = L0_3.outOfZoneAttempt
    L0_3(L1_3)
  end
  L5_2.onExit = L6_2
  L4_2 = L4_2(L5_2)
  L3_2.zone = L4_2
  L4_2 = {}
  L5_2 = {}
  L4_2.props = L5_2
  L4_2.total = 0
  L4_2.cleared = 0
  L3_2.bushes = L4_2
  L4_2 = {}
  L5_2 = {}
  L4_2.props = L5_2
  L4_2.total = 0
  L4_2.cleared = 0
  L3_2.rubbishes = L4_2
  L3_2.allDone = false
  L4_2 = {}
  L2_2.props = L4_2
  L2_2.Garden = L3_2
  L3_2 = L2_2.config
  L3_2 = L3_2.blips
  L3_2 = L3_2.show
  if L3_2 then
    L3_2 = L2_2.Garden
    L4_2 = AddBlipForCoord
    L5_2 = L2_2.config
    L5_2 = L5_2.coords
    L5_2 = L5_2.x
    L6_2 = L2_2.config
    L6_2 = L6_2.coords
    L6_2 = L6_2.y
    L7_2 = L2_2.config
    L7_2 = L7_2.coords
    L7_2 = L7_2.z
    L4_2 = L4_2(L5_2, L6_2, L7_2)
    L3_2.blip = L4_2
    L3_2 = SetBlipSprite
    L4_2 = L2_2.Garden
    L4_2 = L4_2.blip
    L5_2 = L2_2.config
    L5_2 = L5_2.blips
    L5_2 = L5_2.sprite
    L3_2(L4_2, L5_2)
    L3_2 = SetBlipScale
    L4_2 = L2_2.Garden
    L4_2 = L4_2.blip
    L5_2 = L2_2.config
    L5_2 = L5_2.blips
    L5_2 = L5_2.scale
    L3_2(L4_2, L5_2)
    L3_2 = SetBlipColour
    L4_2 = L2_2.Garden
    L4_2 = L4_2.blip
    L5_2 = L2_2.config
    L5_2 = L5_2.blips
    L5_2 = L5_2.color
    L3_2(L4_2, L5_2)
    L3_2 = SetBlipAsShortRange
    L4_2 = L2_2.Garden
    L4_2 = L4_2.blip
    L5_2 = true
    L3_2(L4_2, L5_2)
    L3_2 = BeginTextCommandSetBlipName
    L4_2 = "STRING"
    L3_2(L4_2)
    L3_2 = AddTextComponentString
    L4_2 = L2_2.config
    L4_2 = L4_2.blips
    L4_2 = L4_2.label
    L3_2(L4_2)
    L3_2 = EndTextCommandSetBlipName
    L4_2 = L2_2.Garden
    L4_2 = L4_2.blip
    L3_2(L4_2)
    L3_2 = blips
    L4_2 = blips
    L4_2 = #L4_2
    L4_2 = L4_2 + 1
    L5_2 = L2_2.Garden
    L5_2 = L5_2.blip
    L3_2[L4_2] = L5_2
  end
  L3_2 = CreateThread
  function L4_2()
    local L0_3, L1_3, L2_3, L3_3, L4_3, L5_3, L6_3, L7_3, L8_3, L9_3, L10_3, L11_3, L12_3, L13_3, L14_3, L15_3, L16_3, L17_3, L18_3, L19_3, L20_3
    while true do
      L0_3 = L2_2
      if not L0_3 then
        break
      end
      L0_3 = L2_2.deleted
      if L0_3 then
        break
      end
      L0_3 = L2_2.propsCreated
      if L0_3 then
        break
      end
      L0_3 = PlayerPedId
      L0_3 = L0_3()
      L1_3 = GetEntityCoords
      L2_3 = L0_3
      L1_3 = L1_3(L2_3)
      L2_3 = vec3
      L3_3 = L2_2.config
      L3_3 = L3_3.coords
      L3_3 = L3_3.x
      L4_3 = L2_2.config
      L4_3 = L4_3.coords
      L4_3 = L4_3.y
      L5_3 = L2_2.config
      L5_3 = L5_3.coords
      L5_3 = L5_3.z
      L2_3 = L2_3(L3_3, L4_3, L5_3)
      L2_3 = L1_3 - L2_3
      L2_3 = #L2_3
      L3_3 = 420
      if L2_3 <= L3_3 then
        L3_3 = L2_2.config
        L3_3 = L3_3.grass
        if nil ~= L3_3 then
          L3_3 = pairs
          L4_3 = L2_2.config
          L4_3 = L4_3.grass
          L3_3, L4_3, L5_3, L6_3 = L3_3(L4_3)
          for L7_3, L8_3 in L3_3, L4_3, L5_3, L6_3 do
            L9_3 = loadModel
            L10_3 = L8_3.model
            L9_3 = L9_3(L10_3)
            if not L9_3 then
              return
            end
            L9_3 = L2_2.Garden
            L9_3 = L9_3.bushes
            L10_3 = L2_2.Garden
            L10_3 = L10_3.bushes
            L10_3 = L10_3.total
            L10_3 = L10_3 + 1
            L9_3.total = L10_3
            L9_3 = 1000
            L10_3 = GetGroundZFor_3dCoord
            L11_3 = L8_3.x
            L12_3 = L8_3.y
            L13_3 = L8_3.z
            L14_3 = false
            L10_3, L11_3 = L10_3(L11_3, L12_3, L13_3, L14_3)
            while not L10_3 do
              L12_3 = GetGroundZFor_3dCoord
              L13_3 = L8_3.x
              L14_3 = L8_3.y
              L15_3 = L8_3.z
              L16_3 = false
              L12_3, L13_3 = L12_3(L13_3, L14_3, L15_3, L16_3)
              L11_3 = L13_3
              L10_3 = L12_3
              L9_3 = L9_3 - 100
              if L9_3 <= 0 then
                break
              end
              L12_3 = Wait
              L13_3 = 100
              L12_3(L13_3)
            end
            if L10_3 then
              L12_3 = L8_3.coords
              L12_3 = L12_3.z
              if L11_3 >= L12_3 then
                L12_3 = L8_3.coords
                L12_3 = L12_3.z
                if L12_3 then
                  goto lbl_100
                end
              end
            end
            L12_3 = L8_3.coords
            L12_3 = L12_3.z
            L12_3 = L12_3 - 0.25
            if not L12_3 then
              L12_3 = L8_3.coords
              L12_3 = L12_3.z
              L12_3 = L12_3 - 0.5
            end
            ::lbl_100::
            L13_3 = CreateObject
            L14_3 = joaat
            L15_3 = L8_3.model
            L14_3 = L14_3(L15_3)
            L15_3 = L8_3.coords
            L15_3 = L15_3.x
            L16_3 = L8_3.coords
            L16_3 = L16_3.y
            L17_3 = L12_3
            L18_3 = true
            L19_3 = false
            L20_3 = false
            L13_3 = L13_3(L14_3, L15_3, L16_3, L17_3, L18_3, L19_3, L20_3)
            L14_3 = FreezeEntityPosition
            L15_3 = L13_3
            L16_3 = true
            L14_3(L15_3, L16_3)
            L14_3 = L2_2.Garden
            L14_3 = L14_3.bushes
            L14_3 = L14_3.props
            L15_3 = {}
            L15_3.prop = L13_3
            L16_3 = L8_3.coords
            L15_3.coords = L16_3
            L16_3 = L8_3.model
            L15_3.model = L16_3
            L15_3.collected = false
            L14_3[L7_3] = L15_3
            L14_3 = L2_2.props
            L15_3 = {}
            L15_3.entity = L13_3
            L16_3 = NetworkGetNetworkIdFromEntity
            L17_3 = L13_3
            L16_3 = L16_3(L17_3)
            L15_3.id = L16_3
            L14_3[L7_3] = L15_3
          end
        end
        L3_3 = L2_2.config
        L3_3 = L3_3.rubbishes
        if nil ~= L3_3 then
          L3_3 = pairs
          L4_3 = L2_2.config
          L4_3 = L4_3.rubbishes
          L3_3, L4_3, L5_3, L6_3 = L3_3(L4_3)
          for L7_3, L8_3 in L3_3, L4_3, L5_3, L6_3 do
            L9_3 = loadModel
            L10_3 = L8_3.model
            L9_3 = L9_3(L10_3)
            if not L9_3 then
              return
            end
            L9_3 = L2_2.Garden
            L9_3 = L9_3.rubbishes
            L10_3 = L2_2.Garden
            L10_3 = L10_3.rubbishes
            L10_3 = L10_3.total
            L10_3 = L10_3 + 1
            L9_3.total = L10_3
            L9_3 = GetGroundZFor_3dCoord
            L10_3 = L8_3.x
            L11_3 = L8_3.y
            L12_3 = L8_3.z
            L13_3 = false
            L9_3, L10_3 = L9_3(L10_3, L11_3, L12_3, L13_3)
            if L9_3 then
              L11_3 = L8_3.coords
              L11_3 = L11_3.z
              if L10_3 <= L11_3 then
                L11_3 = L8_3.coords
                L11_3 = L11_3.z
                if L11_3 then
                  goto lbl_190
                end
              end
            end
            L11_3 = L8_3.coords
            L11_3 = L11_3.z
            L11_3 = L11_3 - 0.25
            if not L11_3 then
              L11_3 = L8_3.coords
              L11_3 = L11_3.z
              L11_3 = L11_3 - 0.25
            end
            ::lbl_190::
            L12_3 = CreateObject
            L13_3 = joaat
            L14_3 = L8_3.model
            L13_3 = L13_3(L14_3)
            L14_3 = L8_3.coords
            L14_3 = L14_3.x
            L15_3 = L8_3.coords
            L15_3 = L15_3.y
            L16_3 = L11_3
            L17_3 = true
            L18_3 = false
            L19_3 = false
            L12_3 = L12_3(L13_3, L14_3, L15_3, L16_3, L17_3, L18_3, L19_3)
            L13_3 = FreezeEntityPosition
            L14_3 = L12_3
            L15_3 = true
            L13_3(L14_3, L15_3)
            L13_3 = L2_2.Garden
            L13_3 = L13_3.rubbishes
            L13_3 = L13_3.props
            L14_3 = {}
            L14_3.prop = L12_3
            L15_3 = L8_3.coords
            L14_3.coords = L15_3
            L15_3 = L8_3.model
            L14_3.model = L15_3
            L14_3.collected = false
            L15_3 = lib
            L15_3 = L15_3.zones
            L15_3 = L15_3.sphere
            L16_3 = {}
            L17_3 = vec3
            L18_3 = L8_3.coords
            L18_3 = L18_3.x
            L19_3 = L8_3.coords
            L19_3 = L19_3.y
            L20_3 = L11_3 + 1.0
            L17_3 = L17_3(L18_3, L19_3, L20_3)
            L16_3.coords = L17_3
            L17_3 = L0_1.menu
            L17_3 = L17_3.interaction_distance
            L16_3.radius = L17_3
            L17_3 = L0_1.debug
            L16_3.debug = L17_3
            function L17_3()
              local L0_4, L1_4, L2_4, L3_4, L4_4, L5_4, L6_4, L7_4
              L0_4 = PlayerPedId
              L0_4 = L0_4()
              L1_4 = GetEntityCoords
              L2_4 = L0_4
              L1_4 = L1_4(L2_4)
              L2_4 = vec3
              L3_4 = L8_3.coords
              L3_4 = L3_4.x
              L4_4 = L8_3.coords
              L4_4 = L4_4.y
              L5_4 = L8_3.coords
              L5_4 = L5_4.z
              L5_4 = L5_4 + 1.0
              L2_4 = L2_4(L3_4, L4_4, L5_4)
              L2_4 = L1_4 - L2_4
              L2_4 = #L2_4
              L3_4 = isDead
              if not L3_4 then
                L3_4 = L2_2.playerBusy
                if not L3_4 then
                  L3_4 = mowerAttached
                  if not L3_4 then
                    L3_4 = IsControlJustPressed
                    L4_4 = 0
                    L5_4 = 38
                    L3_4 = L3_4(L4_4, L5_4)
                    if L3_4 then
                      L3_4 = rakeAttached
                      if not L3_4 then
                        L3_4 = Config
                        L3_4 = L3_4.Notification
                        L4_4 = Lang
                        L5_4 = "job"
                        L4_4 = L4_4(L5_4)
                        L5_4 = Lang
                        L6_4 = "rake_dont_attached"
                        L5_4 = L5_4(L6_4)
                        L6_4 = "inform"
                        L7_4 = 5000
                        return L3_4(L4_4, L5_4, L6_4, L7_4)
                      end
                      L3_4 = IsControlJustPressed
                      L4_4 = 0
                      L5_4 = 38
                      L3_4 = L3_4(L4_4, L5_4)
                      if L3_4 then
                        L3_4 = L2_2
                        L4_4 = L3_4
                        L3_4 = L3_4.clearRubbish
                        L3_4 = L3_4(L4_4)
                        if L3_4 then
                          L3_4 = L2_2
                          L4_4 = L3_4
                          L3_4 = L3_4.deleteRubbish
                          L5_4 = L7_3
                          L3_4(L4_4, L5_4)
                        end
                      end
                    end
                  end
                end
              end
            end
            L16_3.inside = L17_3
            function L17_3()
              local L0_4, L1_4, L2_4, L3_4
              L0_4 = L2_2.playerBusy
              if L0_4 then
                return
              end
              L0_4 = GetVehiclePedIsIn
              L1_4 = PlayerPedId
              L1_4 = L1_4()
              L2_4 = false
              L0_4 = L0_4(L1_4, L2_4)
              if 0 ~= L0_4 then
                return
              end
              L0_4 = lib
              L0_4 = L0_4.showTextUI
              L1_4 = Lang
              L2_4 = "clear_rubbish"
              L1_4 = L1_4(L2_4)
              L2_4 = {}
              L2_4.position = "left-center"
              L2_4.icon = "broom"
              L3_4 = {}
              L3_4.color = "white"
              L2_4.style = L3_4
              L0_4(L1_4, L2_4)
            end
            L16_3.onEnter = L17_3
            function L17_3()
              local L0_4, L1_4
              L0_4 = lib
              L0_4 = L0_4.hideTextUI
              L0_4()
            end
            L16_3.onExit = L17_3
            L15_3 = L15_3(L16_3)
            L14_3.zone = L15_3
            L13_3[L7_3] = L14_3
            L13_3 = L2_2.props
            L14_3 = {}
            L14_3.entity = L12_3
            L15_3 = NetworkGetNetworkIdFromEntity
            L16_3 = L12_3
            L15_3 = L15_3(L16_3)
            L14_3.id = L15_3
            L13_3[L7_3] = L14_3
          end
        end
        L2_2.propsCreated = true
        break
      end
      L3_3 = Wait
      L4_3 = 1000
      L3_3(L4_3)
    end
  end
  L3_2(L4_2)
  L3_2 = CreateThread
  function L4_2()
    local L0_3, L1_3, L2_3, L3_3, L4_3, L5_3, L6_3, L7_3, L8_3, L9_3, L10_3, L11_3, L12_3, L13_3, L14_3, L15_3, L16_3, L17_3, L18_3, L19_3, L20_3, L21_3, L22_3, L23_3, L24_3, L25_3, L26_3, L27_3, L28_3, L29_3, L30_3, L31_3, L32_3, L33_3, L34_3, L35_3, L36_3, L37_3
    while true do
      L0_3 = L2_2
      if not L0_3 then
        break
      end
      L0_3 = L2_2.deleted
      if L0_3 then
        break
      end
      L0_3 = 1000
      L1_3 = PlayerPedId
      L1_3 = L1_3()
      L2_3 = GetEntityCoords
      L3_3 = L1_3
      L2_3 = L2_3(L3_3)
      L3_3 = L0_1.gardens
      L4_3 = A1_2
      L3_3 = L3_3[L4_3]
      L3_3 = L3_3.useMarker
      if L3_3 then
        L3_3 = pairs
        L4_3 = L2_2.Garden
        L4_3 = L4_3.rubbishes
        L4_3 = L4_3.props
        L3_3, L4_3, L5_3, L6_3 = L3_3(L4_3)
        for L7_3, L8_3 in L3_3, L4_3, L5_3, L6_3 do
          L9_3 = DoesEntityExist
          L10_3 = gardenerRake
          L9_3 = L9_3(L10_3)
          if L9_3 then
            L9_3 = GetEntityCoords
            L10_3 = gardenerRake
            L9_3 = L9_3(L10_3)
            if L9_3 then
              goto lbl_40
            end
          end
          L9_3 = vec3
          L10_3 = 0
          L11_3 = 0
          L12_3 = 0
          L9_3 = L9_3(L10_3, L11_3, L12_3)
          ::lbl_40::
          L10_3 = L8_3.coords
          L10_3 = L10_3 - L9_3
          L10_3 = #L10_3
          if L10_3 <= 25.0 then
            L0_3 = 5
            L11_3 = DrawMarker
            L12_3 = 2
            L13_3 = L8_3.coords
            L13_3 = L13_3.x
            L14_3 = L8_3.coords
            L14_3 = L14_3.y
            L15_3 = L8_3.coords
            L15_3 = L15_3.z
            L15_3 = L15_3 + 1.0
            L16_3 = 0
            L17_3 = 0
            L18_3 = 0
            L19_3 = 0
            L20_3 = -180
            L21_3 = 0
            L22_3 = 0.25
            L23_3 = 0.25
            L24_3 = 0.25
            L25_3 = 98
            L26_3 = 255
            L27_3 = 114
            L28_3 = 150
            L29_3 = true
            L30_3 = false
            L31_3 = 2
            L32_3 = false
            L33_3 = false
            L34_3 = false
            L35_3 = false
            L11_3(L12_3, L13_3, L14_3, L15_3, L16_3, L17_3, L18_3, L19_3, L20_3, L21_3, L22_3, L23_3, L24_3, L25_3, L26_3, L27_3, L28_3, L29_3, L30_3, L31_3, L32_3, L33_3, L34_3, L35_3)
          end
        end
      end
      L3_3 = pairs
      L4_3 = L2_2.Garden
      L4_3 = L4_3.bushes
      L4_3 = L4_3.props
      L3_3, L4_3, L5_3, L6_3 = L3_3(L4_3)
      for L7_3, L8_3 in L3_3, L4_3, L5_3, L6_3 do
        L9_3 = L8_3.collected
        if not L9_3 then
          L9_3 = DoesEntityExist
          L10_3 = gardenerTractor
          L9_3 = L9_3(L10_3)
          if L9_3 then
            L9_3 = GetEntityCoords
            L10_3 = gardenerTractor
            L9_3 = L9_3(L10_3)
            if L9_3 then
              goto lbl_101
            end
          end
          L9_3 = nil
          ::lbl_101::
          L10_3 = DoesEntityExist
          L11_3 = gardenerMover
          L10_3 = L10_3(L11_3)
          if L10_3 then
            L10_3 = GetEntityCoords
            L11_3 = gardenerMover
            L10_3 = L10_3(L11_3)
            if L10_3 then
              goto lbl_112
            end
          end
          L10_3 = nil
          ::lbl_112::
          if L9_3 then
            L11_3 = vec2
            L12_3 = L8_3.coords
            L12_3 = L12_3.x
            L13_3 = L8_3.coords
            L13_3 = L13_3.y
            L11_3 = L11_3(L12_3, L13_3)
            L12_3 = vec2
            L13_3 = L9_3.x
            L14_3 = L9_3.y
            L12_3 = L12_3(L13_3, L14_3)
            L11_3 = L11_3 - L12_3
            L11_3 = #L11_3
            if L11_3 then
              goto lbl_130
            end
          end
          L11_3 = 99
          ::lbl_130::
          if L10_3 then
            L12_3 = vec2
            L13_3 = L8_3.coords
            L13_3 = L13_3.x
            L14_3 = L8_3.coords
            L14_3 = L14_3.y
            L12_3 = L12_3(L13_3, L14_3)
            L13_3 = vec2
            L14_3 = L10_3.x
            L15_3 = L10_3.y
            L13_3 = L13_3(L14_3, L15_3)
            L12_3 = L12_3 - L13_3
            L12_3 = #L12_3
            if L12_3 then
              goto lbl_148
            end
          end
          L12_3 = 99
          ::lbl_148::
          if L11_3 <= 25.0 or L12_3 <= 25.0 then
            L13_3 = L0_1.gardens
            L14_3 = A1_2
            L13_3 = L13_3[L14_3]
            L13_3 = L13_3.useMarker
            if L13_3 then
              L0_3 = 5
              L13_3 = DrawMarker
              L14_3 = 2
              L15_3 = L8_3.coords
              L15_3 = L15_3.x
              L16_3 = L8_3.coords
              L16_3 = L16_3.y
              L17_3 = L8_3.coords
              L17_3 = L17_3.z
              L17_3 = L17_3 + 2.0
              L18_3 = 0
              L19_3 = 0
              L20_3 = 0
              L21_3 = 0
              L22_3 = -180
              L23_3 = 0
              L24_3 = 0.25
              L25_3 = 0.25
              L26_3 = 0.25
              L27_3 = 98
              L28_3 = 255
              L29_3 = 114
              L30_3 = 150
              L31_3 = true
              L32_3 = false
              L33_3 = 2
              L34_3 = false
              L35_3 = false
              L36_3 = false
              L37_3 = false
              L13_3(L14_3, L15_3, L16_3, L17_3, L18_3, L19_3, L20_3, L21_3, L22_3, L23_3, L24_3, L25_3, L26_3, L27_3, L28_3, L29_3, L30_3, L31_3, L32_3, L33_3, L34_3, L35_3, L36_3, L37_3)
            else
              L0_3 = 250
            end
            L13_3 = 0.5
            if not (L11_3 <= L13_3) then
              L13_3 = 0.5
              if not (L12_3 <= L13_3) then
                goto lbl_203
              end
            end
            L8_3.collected = true
            L13_3 = L2_2
            L14_3 = L13_3
            L13_3 = L13_3.deleteBush
            L15_3 = L7_3
            L13_3(L14_3, L15_3)
          end
        end
        ::lbl_203::
      end
      L3_3 = Wait
      L4_3 = L0_3
      L3_3(L4_3)
    end
  end
  L3_2(L4_2)
  return L2_2
end
L1_1.NewGarden = L2_1