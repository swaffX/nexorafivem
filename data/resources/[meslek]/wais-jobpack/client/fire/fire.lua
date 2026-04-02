local L0_1, L1_1, L2_1
L0_1 = {}
Fire = L0_1
L0_1 = Fire
L1_1 = Fire
L0_1.__index = L1_1
L0_1 = Config
L0_1 = L0_1.Jobs
L0_1 = L0_1.fire_department
L1_1 = Fire
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
      L0_3 = A0_2.warningAttempt
      if not L0_3 then
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
      L3_3 = "go_fire_area"
      L2_3 = L2_3(L3_3)
      L3_3 = "warning"
      L4_3 = nil
      L0_3(L1_3, L2_3, L3_3, L4_3)
      L0_3 = L1_2
      if L0_3 <= 0 then
        L0_3 = A0_2.starterTable
        L0_3 = L0_3.type
        if "group" == L0_3 then
          L0_3 = TriggerServerEvent
          L1_3 = "wais:group:leaveGroup"
          L0_3(L1_3)
        else
          L0_3 = TriggerServerEvent
          L1_3 = "wais:fire:deleteSelf"
          L2_3 = A0_2.fireIndex
          L3_3 = A0_2.starterTable
          L3_3 = L3_3.id
          L0_3(L1_3, L2_3, L3_3)
        end
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
L1_1.waninrAttemptF = L2_1
L1_1 = Fire
function L2_1(A0_2, A1_2, A2_2)
  local L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2
  L3_2 = A0_2.fireIndex
  if L3_2 == A1_2 then
    L3_2 = A0_2.starterTable
    L3_2 = L3_2.id
    if L3_2 == A2_2 then
      goto lbl_9
    end
  end
  do return end
  ::lbl_9::
  A0_2.warningAttempt = false
  L3_2 = A0_2.canControl
  if L3_2 then
    L3_2 = TriggerServerEvent
    L4_2 = "wais:deleteItem"
    L5_2 = "weapon_fireextinguisher"
    L6_2 = L0_1.giveable_items
    L6_2 = L6_2.weapon_fireextinguisher
    L3_2(L4_2, L5_2, L6_2)
  end
  L3_2 = pairs
  L4_2 = A0_2.flames
  L3_2, L4_2, L5_2, L6_2 = L3_2(L4_2)
  for L7_2, L8_2 in L3_2, L4_2, L5_2, L6_2 do
    L9_2 = RemoveScriptFire
    L10_2 = L8_2.fire
    L9_2(L10_2)
    L9_2 = StopParticleFxLooped
    L10_2 = L8_2.particleFx
    L11_2 = false
    L9_2(L10_2, L11_2)
    L9_2 = RemoveParticleFx
    L10_2 = L8_2.particleFx
    L11_2 = false
    L9_2(L10_2, L11_2)
  end
  L3_2 = A0_2.timer
  if L3_2 then
    L3_2 = A0_2.timer
    L4_2 = L3_2
    L3_2 = L3_2.delete
    L3_2(L4_2)
  end
  L3_2 = A0_2.point
  if nil ~= L3_2 then
    L3_2 = A0_2.point
    L4_2 = L3_2
    L3_2 = L3_2.remove
    L3_2(L4_2)
  end
  L3_2 = DoesBlipExist
  L4_2 = A0_2.blips
  L3_2 = L3_2(L4_2)
  if L3_2 then
    L3_2 = RemoveBlip
    L4_2 = A0_2.blips
    L3_2(L4_2)
  end
  A0_2.deleted = true
  A0_2 = nil
end
L1_1.removeAll = L2_1
L1_1 = Fire
function L2_1(A0_2, A1_2, A2_2, A3_2)
  local L4_2, L5_2, L6_2
  L4_2 = A0_2.fireIndex
  if L4_2 == A1_2 then
    L4_2 = A0_2.flames
    L4_2 = L4_2[A2_2]
    L4_2.isExtinguished = A3_2
    L4_2 = RemoveScriptFire
    L5_2 = A0_2.flames
    L5_2 = L5_2[A2_2]
    L5_2 = L5_2.fire
    L4_2(L5_2)
    L4_2 = A0_2.fireConfig
    L4_2 = L4_2.ptfx
    L4_2 = L4_2.scale
    L5_2 = CreateThread
    function L6_2()
      local L0_3, L1_3, L2_3, L3_3
      while true do
        L0_3 = 1000
        L1_3 = L4_2
        if L1_3 > 0.0 then
          L1_3 = L4_2
          L1_3 = L1_3 - 0.1
          L4_2 = L1_3
          L1_3 = SetParticleFxLoopedScale
          L2_3 = A0_2.flames
          L3_3 = A2_2
          L2_3 = L2_3[L3_3]
          L2_3 = L2_3.particleFx
          L3_3 = L4_2
          L1_3(L2_3, L3_3)
        else
          L1_3 = StopParticleFxLooped
          L2_3 = A0_2.flames
          L3_3 = A2_2
          L2_3 = L2_3[L3_3]
          L2_3 = L2_3.particleFx
          L3_3 = false
          L1_3(L2_3, L3_3)
          L1_3 = RemoveParticleFx
          L2_3 = A0_2.flames
          L3_3 = A2_2
          L2_3 = L2_3[L3_3]
          L2_3 = L2_3.particleFx
          L3_3 = false
          L1_3(L2_3, L3_3)
          break
        end
        L1_3 = Wait
        L2_3 = L0_3
        L1_3(L2_3)
      end
    end
    L5_2(L6_2)
  end
end
L1_1.changeFlameState = L2_1
L1_1 = Fire
function L2_1(A0_2, A1_2, A2_2, A3_2)
  local L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2, L20_2, L21_2, L22_2, L23_2, L24_2, L25_2
  L4_2 = setmetatable
  L5_2 = {}
  L6_2 = Fire
  L4_2 = L4_2(L5_2, L6_2)
  L5_2 = L0_1.random_fires
  L5_2 = L5_2.fires
  L5_2 = L5_2[A1_2]
  L4_2.fireConfig = L5_2
  L4_2.fireIndex = A1_2
  L4_2.canControl = A2_2
  L5_2 = {}
  L4_2.flames = L5_2
  L4_2.point = nil
  L4_2.timer = nil
  L4_2.deleted = false
  L4_2.starterTable = A3_2
  L4_2.warningAttempt = false
  L4_2.playerInArea = false
  L5_2 = lib
  L5_2 = L5_2.zones
  L5_2 = L5_2.sphere
  L6_2 = {}
  L7_2 = vec3
  L8_2 = L4_2.fireConfig
  L8_2 = L8_2.zone_coords
  L8_2 = L8_2.x
  L9_2 = L4_2.fireConfig
  L9_2 = L9_2.zone_coords
  L9_2 = L9_2.y
  L10_2 = L4_2.fireConfig
  L10_2 = L10_2.zone_coords
  L10_2 = L10_2.z
  L7_2 = L7_2(L8_2, L9_2, L10_2)
  L6_2.coords = L7_2
  L7_2 = L4_2.fireConfig
  L7_2 = L7_2.zone_radius
  L6_2.radius = L7_2
  L7_2 = L0_1.debug
  L6_2.debug = L7_2
  function L7_2()
    local L0_3, L1_3, L2_3, L3_3, L4_3
    L0_3 = L4_2.canControl
    if not L0_3 then
      L0_3 = GetSelectedPedWeapon
      L1_3 = PlayerPedId
      L1_3, L2_3, L3_3, L4_3 = L1_3()
      L0_3 = L0_3(L1_3, L2_3, L3_3, L4_3)
      L1_3 = joaat
      L2_3 = "weapon_fireextinguisher"
      L1_3 = L1_3(L2_3)
      if L0_3 == L1_3 then
        L1_3 = SetCurrentPedWeapon
        L2_3 = PlayerPedId
        L2_3 = L2_3()
        L3_3 = GetHashKey
        L4_3 = "WEAPON_UNARMED"
        L3_3 = L3_3(L4_3)
        L4_3 = true
        L1_3(L2_3, L3_3, L4_3)
      end
    end
  end
  L6_2.inside = L7_2
  function L7_2()
    local L0_3, L1_3
    L0_3 = L4_2.canControl
    if L0_3 then
      L4_2.playerInArea = true
      L4_2.warningAttempt = false
    end
  end
  L6_2.onEnter = L7_2
  function L7_2()
    local L0_3, L1_3
    L0_3 = L4_2.canControl
    if L0_3 then
      L4_2.playerInArea = false
      L4_2.warningAttempt = true
      L0_3 = L4_2
      L1_3 = L0_3
      L0_3 = L0_3.waninrAttemptF
      L0_3(L1_3)
    end
  end
  L6_2.onExit = L7_2
  L5_2 = L5_2(L6_2)
  L4_2.point = L5_2
  L5_2 = points
  L6_2 = points
  L6_2 = #L6_2
  L6_2 = L6_2 + 1
  L7_2 = L4_2.point
  L5_2[L6_2] = L7_2
  L5_2 = pairs
  L6_2 = L4_2.fireConfig
  L6_2 = L6_2.flame_coords
  L5_2, L6_2, L7_2, L8_2 = L5_2(L6_2)
  for L9_2, L10_2 in L5_2, L6_2, L7_2, L8_2 do
    L11_2 = loadPtfx
    L12_2 = L4_2.fireConfig
    L12_2 = L12_2.ptfx
    L12_2 = L12_2.class
    L11_2 = L11_2(L12_2)
    if not L11_2 then
      return
    end
    L11_2 = UseParticleFxAsset
    L12_2 = L4_2.fireConfig
    L12_2 = L12_2.ptfx
    L12_2 = L12_2.class
    L11_2(L12_2)
    L11_2 = L4_2.flames
    L12_2 = {}
    L13_2 = StartScriptFire
    L14_2 = L10_2.x
    L15_2 = L10_2.y
    L16_2 = L10_2.z
    L17_2 = 0
    L18_2 = false
    L13_2 = L13_2(L14_2, L15_2, L16_2, L17_2, L18_2)
    L12_2.fire = L13_2
    L12_2.coords = L10_2
    L13_2 = StartParticleFxLoopedAtCoord
    L14_2 = L4_2.fireConfig
    L14_2 = L14_2.ptfx
    L14_2 = L14_2.effect
    L15_2 = L10_2.x
    L16_2 = L10_2.y
    L17_2 = L10_2.z
    L18_2 = 0.0
    L19_2 = 0.0
    L20_2 = 0.0
    L21_2 = 1.0
    L22_2 = false
    L23_2 = false
    L24_2 = false
    L25_2 = false
    L13_2 = L13_2(L14_2, L15_2, L16_2, L17_2, L18_2, L19_2, L20_2, L21_2, L22_2, L23_2, L24_2, L25_2)
    L12_2.particleFx = L13_2
    L12_2.isExtinguished = false
    L11_2[L9_2] = L12_2
    L11_2 = SetParticleFxLoopedScale
    L12_2 = L4_2.flames
    L12_2 = L12_2[L9_2]
    L12_2 = L12_2.particleFx
    L13_2 = L4_2.fireConfig
    L13_2 = L13_2.ptfx
    L13_2 = L13_2.scale
    L11_2(L12_2, L13_2)
  end
  L5_2 = L4_2.canControl
  if L5_2 then
    L5_2 = JobTimer
    L6_2 = L5_2
    L5_2 = L5_2.New
    L7_2 = L4_2.fireConfig
    L7_2 = L7_2.mission_time
    L8_2 = L4_2.fireConfig
    L8_2 = L8_2.extra_time
    L9_2 = false
    L5_2 = L5_2(L6_2, L7_2, L8_2, L9_2)
    L4_2.timer = L5_2
    L5_2 = AddBlipForCoord
    L6_2 = L4_2.fireConfig
    L6_2 = L6_2.zone_coords
    L6_2 = L6_2.x
    L7_2 = L4_2.fireConfig
    L7_2 = L7_2.zone_coords
    L7_2 = L7_2.y
    L8_2 = L4_2.fireConfig
    L8_2 = L8_2.zone_coords
    L8_2 = L8_2.z
    L5_2 = L5_2(L6_2, L7_2, L8_2)
    L4_2.blips = L5_2
    L5_2 = SetBlipSprite
    L6_2 = L4_2.blips
    L7_2 = L0_1.random_fires
    L7_2 = L7_2.blips
    L7_2 = L7_2.sprite
    L5_2(L6_2, L7_2)
    L5_2 = SetBlipColour
    L6_2 = L4_2.blips
    L7_2 = L0_1.random_fires
    L7_2 = L7_2.blips
    L7_2 = L7_2.color
    L5_2(L6_2, L7_2)
    L5_2 = SetBlipScale
    L6_2 = L4_2.blips
    L7_2 = L0_1.random_fires
    L7_2 = L7_2.blips
    L7_2 = L7_2.scale
    L5_2(L6_2, L7_2)
    L5_2 = BeginTextCommandSetBlipName
    L6_2 = "STRING"
    L5_2(L6_2)
    L5_2 = AddTextComponentString
    L6_2 = L0_1.random_fires
    L6_2 = L6_2.blips
    L6_2 = L6_2.label
    L5_2(L6_2)
    L5_2 = EndTextCommandSetBlipName
    L6_2 = L4_2.blips
    L5_2(L6_2)
    L5_2 = blips
    L6_2 = blips
    L6_2 = #L6_2
    L6_2 = L6_2 + 1
    L7_2 = L4_2.blips
    L5_2[L6_2] = L7_2
    L5_2 = CreateThread
    function L6_2()
      local L0_3, L1_3, L2_3, L3_3, L4_3, L5_3, L6_3, L7_3, L8_3, L9_3, L10_3, L11_3, L12_3, L13_3, L14_3
      while true do
        L0_3 = L4_2
        if not L0_3 then
          break
        end
        L0_3 = L4_2.deleted
        if L0_3 then
          break
        end
        L0_3 = 5
        L1_3 = pairs
        L2_3 = L4_2.flames
        L1_3, L2_3, L3_3, L4_3 = L1_3(L2_3)
        for L5_3, L6_3 in L1_3, L2_3, L3_3, L4_3 do
          L7_3 = L6_3.isExtinguished
          if not L7_3 then
            L7_3 = GetNumberOfFiresInRange
            L8_3 = L6_3.coords
            L8_3 = L8_3.x
            L9_3 = L6_3.coords
            L9_3 = L9_3.y
            L10_3 = L6_3.coords
            L10_3 = L10_3.z
            L11_3 = 0.5
            L7_3 = L7_3(L8_3, L9_3, L10_3, L11_3)
            if 0 == L7_3 then
              L8_3 = calcuteDeductedMoney
              L9_3 = L4_2.timer
              L9_3 = L9_3.extraTimeEnabled
              L10_3 = L4_2.fireConfig
              L10_3 = L10_3.mission_time
              L11_3 = formatNumberToMin
              L12_3 = L4_2.timer
              L13_3 = L12_3
              L12_3 = L12_3.getDuration
              L12_3, L13_3, L14_3 = L12_3(L13_3)
              L11_3 = L11_3(L12_3, L13_3, L14_3)
              L12_3 = L4_2.fireConfig
              L12_3 = L12_3.deducted_per_min
              L8_3 = L8_3(L9_3, L10_3, L11_3, L12_3)
              L9_3 = Config
              L9_3 = L9_3.JobSuccess
              L10_3 = CurrentJob
              L11_3 = L4_2.fireConfig
              L11_3 = L11_3.reward
              L11_3 = L11_3 - L8_3
              L12_3 = L4_2.timer
              L13_3 = L12_3
              L12_3 = L12_3.getDuration
              L12_3 = L12_3(L13_3)
              L13_3 = L4_2.timer
              L13_3 = L13_3.extraTimeEnabled
              L9_3(L10_3, L11_3, L12_3, L13_3)
              L9_3 = TriggerServerEvent
              L10_3 = "wais:fire:extinguish"
              L11_3 = L4_2.fireIndex
              L12_3 = L5_3
              L13_3 = L4_2.starterTable
              L13_3 = L13_3.id
              L14_3 = L8_3
              L9_3(L10_3, L11_3, L12_3, L13_3, L14_3)
              L9_3 = Config
              L9_3 = L9_3.Notification
              L10_3 = Lang
              L11_3 = "job"
              L10_3 = L10_3(L11_3)
              L11_3 = Lang
              L12_3 = "flames_extinguished"
              L11_3 = L11_3(L12_3)
              L12_3 = "success"
              L13_3 = nil
              L9_3(L10_3, L11_3, L12_3, L13_3)
              L6_3.isExtinguished = true
            end
          end
        end
        L1_3 = Wait
        L2_3 = L0_3
        L1_3(L2_3)
      end
    end
    L5_2(L6_2)
    L5_2 = CreateThread
    function L6_2()
      local L0_3, L1_3, L2_3, L3_3
      while true do
        L0_3 = L4_2
        if not L0_3 then
          break
        end
        L0_3 = L4_2.deleted
        if L0_3 then
          break
        end
        L0_3 = L4_2.timer
        L0_3 = L0_3.duration
        if L0_3 <= 0 then
          L0_3 = TriggerServerEvent
          L1_3 = "wais:fire:deleteSelf"
          L2_3 = L4_2.fireIndex
          L3_3 = L4_2.starterTable
          L3_3 = L3_3.id
          L0_3(L1_3, L2_3, L3_3)
        end
        L0_3 = Wait
        L1_3 = 1000
        L0_3(L1_3)
      end
    end
    L5_2(L6_2)
    L5_2 = SetNewWaypoint
    L6_2 = L4_2.fireConfig
    L6_2 = L6_2.zone_coords
    L6_2 = L6_2.x
    L7_2 = L4_2.fireConfig
    L7_2 = L7_2.zone_coords
    L7_2 = L7_2.y
    L5_2(L6_2, L7_2)
  end
  return L4_2
end
L1_1.newFire = L2_1