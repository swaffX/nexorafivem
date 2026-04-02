local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1
L0_1 = {}
Electrician = L0_1
L0_1 = Electrician
L1_1 = Electrician
L0_1.__index = L1_1
L0_1 = Config
L0_1 = L0_1.Jobs
L0_1 = L0_1.electrician
L1_1 = nil
L2_1 = false
L3_1 = RegisterNUICallback
L4_1 = "minigame_electrician"
function L5_1(A0_2, A1_2)
  local L2_2, L3_2, L4_2, L5_2, L6_2
  L2_2 = A0_2.state
  L1_1 = L2_2
  L2_2 = A0_2.timeout
  if nil ~= L2_2 then
    L2_2 = Config
    L2_2 = L2_2.Notification
    L3_2 = Lang
    L4_2 = "job"
    L3_2 = L3_2(L4_2)
    L4_2 = Lang
    L5_2 = "electrician_mission_minigame_timeout"
    L4_2 = L4_2(L5_2)
    L5_2 = "error"
    L6_2 = 5000
    L2_2(L3_2, L4_2, L5_2, L6_2)
  end
  L2_2 = A1_2
  L3_2 = true
  L2_2(L3_2)
end
L3_1(L4_1, L5_1)
L3_1 = Electrician
function L4_1(A0_2)
  local L1_2, L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2
  L1_2 = PlayerPedId
  L1_2 = L1_2()
  L2_2 = lib
  L2_2 = L2_2.hideTextUI
  L2_2()
  A0_2.deleted = true
  L2_2 = A0_2.timer
  if nil ~= L2_2 then
    L2_2 = A0_2.timer
    L3_2 = L2_2
    L2_2 = L2_2.delete
    L2_2(L3_2)
  end
  L2_2 = next
  L3_2 = A0_2.progress
  L2_2 = L2_2(L3_2)
  if nil ~= L2_2 then
    L2_2 = pairs
    L3_2 = A0_2.progress
    L2_2, L3_2, L4_2, L5_2 = L2_2(L3_2)
    for L6_2, L7_2 in L2_2, L3_2, L4_2, L5_2 do
      L8_2 = L2_1
      if L8_2 then
        L8_2 = FreezeEntityPosition
        L9_2 = L1_2
        L10_2 = false
        L8_2(L9_2, L10_2)
        L8_2 = ClearPedTasks
        L9_2 = L1_2
        L8_2(L9_2)
        L8_2 = SetNuiFocus
        L9_2 = false
        L10_2 = false
        L8_2(L9_2, L10_2)
        L8_2 = SendNUIMessage
        L9_2 = {}
        L9_2.type = "ELECTRICIAN_MINIGAME"
        L9_2.state = false
        L10_2 = L7_2.type
        L9_2.minigame = L10_2
        L8_2(L9_2)
      end
      L8_2 = L7_2.blip
      if nil ~= L8_2 then
        L8_2 = DoesBlipExist
        L9_2 = L7_2.blip
        L8_2 = L8_2(L9_2)
        if L8_2 then
          L8_2 = RemoveBlip
          L9_2 = L7_2.blip
          L8_2(L9_2)
        end
      end
      L8_2 = L7_2.ptfx
      if nil ~= L8_2 then
        L8_2 = DoesParticleFxLoopedExist
        L9_2 = L7_2.ptfx
        L8_2 = L8_2(L9_2)
        if L8_2 then
          L8_2 = RemoveParticleFx
          L9_2 = L7_2.ptfx
          L10_2 = true
          L8_2(L9_2, L10_2)
        end
      end
      L8_2 = L7_2.zone
      L9_2 = L8_2
      L8_2 = L8_2.remove
      L8_2(L9_2)
    end
  end
  L2_2 = false
  L2_1 = L2_2
  A0_2.progress = nil
  A0_2 = nil
  L2_2 = TriggerEvent
  L3_2 = "wais:electrician:clearEvent"
  L2_2(L3_2)
end
L3_1.deleteSelf = L4_1
L3_1 = Electrician
function L4_1(A0_2, A1_2, A2_2)
  local L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2, L20_2, L21_2, L22_2, L23_2
  L3_2 = setmetatable
  L4_2 = {}
  L5_2 = Electrician
  L3_2 = L3_2(L4_2, L5_2)
  L4_2 = lib
  L4_2 = L4_2.string
  L4_2 = L4_2.random
  L5_2 = "aaaaaa"
  L4_2 = L4_2(L5_2)
  L3_2.deleted = false
  L3_2.id = L4_2
  L4_2 = A2_2
  L3_2.index = A1_2
  L3_2.owner = L4_2
  L4_2 = L0_1.mission_list
  L4_2 = L4_2[A1_2]
  L3_2.config = L4_2
  L4_2 = JobTimer
  L5_2 = L4_2
  L4_2 = L4_2.New
  L6_2 = L3_2.config
  L6_2 = L6_2.timer
  L6_2 = L6_2.mission_time
  L7_2 = L3_2.config
  L7_2 = L7_2.timer
  L7_2 = L7_2.extra_time
  L8_2 = false
  L4_2 = L4_2(L5_2, L6_2, L7_2, L8_2)
  L3_2.timer = L4_2
  L4_2 = {}
  L5_2 = 0
  L6_2 = L3_2.config
  L6_2 = L6_2.maintenance_locations
  L6_2 = #L6_2
  L3_2.mustBeFixed = L6_2
  L3_2.fixed = L5_2
  L3_2.progress = L4_2
  L4_2 = pairs
  L5_2 = L3_2.config
  L5_2 = L5_2.maintenance_locations
  L4_2, L5_2, L6_2, L7_2 = L4_2(L5_2)
  for L8_2, L9_2 in L4_2, L5_2, L6_2, L7_2 do
    L10_2 = L3_2.progress
    L11_2 = {}
    L12_2 = lib
    L12_2 = L12_2.zones
    L12_2 = L12_2.sphere
    L13_2 = {}
    L14_2 = vec3
    L15_2 = L9_2.coords
    L15_2 = L15_2.x
    L16_2 = L9_2.coords
    L16_2 = L16_2.y
    L17_2 = L9_2.coords
    L17_2 = L17_2.z
    L14_2 = L14_2(L15_2, L16_2, L17_2)
    L13_2.coords = L14_2
    L14_2 = L9_2.radius
    L13_2.radius = L14_2
    L14_2 = L0_1.debug
    L13_2.debug = L14_2
    function L14_2()
      local L0_3, L1_3, L2_3, L3_3, L4_3, L5_3, L6_3, L7_3, L8_3, L9_3, L10_3, L11_3, L12_3, L13_3, L14_3, L15_3, L16_3, L17_3
      L0_3 = PlayerPedId
      L0_3 = L0_3()
      L1_3 = GetEntityCoords
      L2_3 = L0_3
      L1_3 = L1_3(L2_3)
      L2_3 = vec3
      L3_3 = L9_2.coords
      L3_3 = L3_3.x
      L4_3 = L9_2.coords
      L4_3 = L4_3.y
      L5_3 = L9_2.coords
      L5_3 = L5_3.z
      L2_3 = L2_3(L3_3, L4_3, L5_3)
      L2_3 = L1_3 - L2_3
      L2_3 = #L2_3
      if L2_3 <= 2.0 then
        L3_3 = IsControlJustPressed
        L4_3 = 0
        L5_3 = 38
        L3_3 = L3_3(L4_3, L5_3)
        if L3_3 then
          L3_3 = IsPedInAnyVehicle
          L4_3 = L0_3
          L5_3 = false
          L3_3 = L3_3(L4_3, L5_3)
          if not L3_3 then
            L3_3 = L3_2.progress
            L4_3 = L8_2
            L3_3 = L3_3[L4_3]
            L3_3 = L3_3.isBusy
            if L3_3 then
              L3_3 = Config
              L3_3 = L3_3.Notification
              L4_3 = Lang
              L5_3 = "job"
              L4_3 = L4_3(L5_3)
              L5_3 = Lang
              L6_3 = "electrician_fix_busy"
              L5_3 = L5_3(L6_3)
              L6_3 = "error"
              L7_3 = 5000
              return L3_3(L4_3, L5_3, L6_3, L7_3)
            end
            L3_3 = L3_2.progress
            L4_3 = L8_2
            L3_3 = L3_3[L4_3]
            L3_3 = L3_3.isFixed
            if L3_3 then
              L3_3 = Config
              L3_3 = L3_3.Notification
              L4_3 = Lang
              L5_3 = "job"
              L4_3 = L4_3(L5_3)
              L5_3 = Lang
              L6_3 = "electrician_already_fixed"
              L5_3 = L5_3(L6_3)
              L6_3 = "success"
              L7_3 = 5000
              L3_3(L4_3, L5_3, L6_3, L7_3)
              L3_3 = L3_2.progress
              L4_3 = L8_2
              L3_3 = L3_3[L4_3]
              L3_3 = L3_3.zone
              L4_3 = L3_3
              L3_3 = L3_3.remove
              return L3_3(L4_3)
            end
            L3_3 = L3_2.owner
            L3_3 = L3_3.type
            if "group" == L3_3 then
              L3_3 = TriggerServerEvent
              L4_3 = "wais:electrician:server:group:changeBusyState"
              L5_3 = L3_2.owner
              L5_3 = L5_3.id
              L6_3 = L8_2
              L7_3 = true
              L3_3(L4_3, L5_3, L6_3, L7_3)
            else
              L3_3 = L3_2
              L4_3 = L3_3
              L3_3 = L3_3.changeBusyState
              L5_3 = L8_2
              L6_3 = true
              L3_3(L4_3, L5_3, L6_3)
            end
            L3_3 = loadDict
            L4_3 = L3_2.config
            L4_3 = L4_3.animation
            L4_3 = L4_3.dict
            L3_3 = L3_3(L4_3)
            if not L3_3 then
              L3_3 = L3_2.owner
              L3_3 = L3_3.type
              if "group" == L3_3 then
                L3_3 = TriggerServerEvent
                L4_3 = "wais:electrician:server:group:changeBusyState"
                L5_3 = L3_2.owner
                L5_3 = L5_3.id
                L6_3 = L8_2
                L7_3 = false
                L3_3(L4_3, L5_3, L6_3, L7_3)
              else
                L3_3 = L3_2
                L4_3 = L3_3
                L3_3 = L3_3.changeBusyState
                L5_3 = L8_2
                L6_3 = false
                L3_3(L4_3, L5_3, L6_3)
              end
              return
            end
            L3_3 = lib
            L3_3 = L3_3.hideTextUI
            L3_3()
            L3_3 = FreezeEntityPosition
            L4_3 = L0_3
            L5_3 = true
            L3_3(L4_3, L5_3)
            L3_3 = SetEntityHeading
            L4_3 = L0_3
            L5_3 = L9_2.coords
            L5_3 = L5_3.w
            L3_3(L4_3, L5_3)
            L3_3 = TaskPlayAnim
            L4_3 = L0_3
            L5_3 = L3_2.config
            L5_3 = L5_3.animation
            L5_3 = L5_3.dict
            L6_3 = L3_2.config
            L6_3 = L6_3.animation
            L6_3 = L6_3.name
            L7_3 = 8.0
            L8_3 = -8.0
            L9_3 = L3_2.config
            L9_3 = L9_3.animation
            L9_3 = L9_3.duration
            L10_3 = L3_2.config
            L10_3 = L10_3.animation
            L10_3 = L10_3.flag
            L11_3 = 0
            L12_3 = false
            L13_3 = false
            L14_3 = false
            L15_3 = false
            L16_3 = false
            L17_3 = false
            L3_3(L4_3, L5_3, L6_3, L7_3, L8_3, L9_3, L10_3, L11_3, L12_3, L13_3, L14_3, L15_3, L16_3, L17_3)
            L3_3 = L3_2
            L4_3 = L3_3
            L3_3 = L3_3.DoMinigame
            L5_3 = L9_2.type
            L3_3 = L3_3(L4_3, L5_3)
            L4_3 = false
            L2_1 = L4_3
            L4_3 = FreezeEntityPosition
            L5_3 = L0_3
            L6_3 = false
            L4_3(L5_3, L6_3)
            L4_3 = ClearPedTasks
            L5_3 = L0_3
            L4_3(L5_3)
            L4_3 = L3_2.owner
            L4_3 = L4_3.type
            if "group" == L4_3 then
              if L3_3 then
                L4_3 = calcuteDeductedMoney
                L5_3 = L3_2.timer
                L5_3 = L5_3.extraTimeEnabled
                L6_3 = L3_2.config
                L6_3 = L6_3.timer
                L6_3 = L6_3.mission_time
                L7_3 = L3_2.timer
                L8_3 = L7_3
                L7_3 = L7_3.getDuration
                L7_3 = L7_3(L8_3)
                L8_3 = L3_2.config
                L8_3 = L8_3.timer
                L8_3 = L8_3.deducted_per_min
                L4_3 = L4_3(L5_3, L6_3, L7_3, L8_3)
                L5_3 = TriggerServerEvent
                L6_3 = "wais:electrician:server:group:changeFixedState"
                L7_3 = L3_2.owner
                L7_3 = L7_3.id
                L8_3 = L8_2
                L9_3 = true
                L10_3 = L3_2.index
                L11_3 = L4_3
                L5_3(L6_3, L7_3, L8_3, L9_3, L10_3, L11_3)
              else
                L4_3 = TriggerServerEvent
                L5_3 = "wais:electrician:server:group:changeBusyState"
                L6_3 = L3_2.owner
                L6_3 = L6_3.id
                L7_3 = L8_2
                L8_3 = false
                L4_3(L5_3, L6_3, L7_3, L8_3)
              end
            elseif L3_3 then
              L4_3 = L3_2
              L5_3 = L4_3
              L4_3 = L4_3.changeFixedState
              L6_3 = L8_2
              L7_3 = true
              L4_3(L5_3, L6_3, L7_3)
            else
              L4_3 = L3_2
              L5_3 = L4_3
              L4_3 = L4_3.changeBusyState
              L6_3 = L8_2
              L7_3 = false
              L4_3(L5_3, L6_3, L7_3)
            end
          end
        end
      end
    end
    L13_2.inside = L14_2
    function L14_2()
      local L0_3, L1_3, L2_3, L3_3
      L0_3 = Group
      L0_3 = L0_3.active
      if L0_3 then
        L0_3 = lib
        L0_3 = L0_3.showTextUI
        L1_3 = Lang
        L2_3 = "electrician_fix"
        L1_3 = L1_3(L2_3)
        L2_3 = {}
        L2_3.position = "right-center"
        L2_3.icon = "screwdriver-wrench"
        L3_3 = {}
        L3_3.color = "white"
        L2_3.style = L3_3
        L0_3(L1_3, L2_3)
      else
        inElectricianFixZone = true
      end
    end
    L13_2.onEnter = L14_2
    function L14_2()
      local L0_3, L1_3
      L0_3 = Group
      L0_3 = L0_3.active
      if L0_3 then
        L0_3 = lib
        L0_3 = L0_3.hideTextUI
        L0_3()
      else
        inElectricianFixZone = false
      end
    end
    L13_2.onExit = L14_2
    L12_2 = L12_2(L13_2)
    L11_2.zone = L12_2
    L12_2 = L9_2.type
    L11_2.type = L12_2
    L11_2.blip = nil
    L11_2.ptfx = nil
    L11_2.isBusy = false
    L11_2.isFixed = false
    L10_2[L8_2] = L11_2
    L10_2 = L3_2.config
    L10_2 = L10_2.location_blip
    L10_2 = L10_2.show
    if L10_2 then
      L10_2 = L3_2.progress
      L10_2 = L10_2[L8_2]
      L11_2 = AddBlipForCoord
      L12_2 = L9_2.coords
      L12_2 = L12_2.x
      L13_2 = L9_2.coords
      L13_2 = L13_2.y
      L14_2 = L9_2.coords
      L14_2 = L14_2.z
      L11_2 = L11_2(L12_2, L13_2, L14_2)
      L10_2.blip = L11_2
      L10_2 = SetBlipSprite
      L11_2 = L3_2.progress
      L11_2 = L11_2[L8_2]
      L11_2 = L11_2.blip
      L12_2 = L3_2.config
      L12_2 = L12_2.location_blip
      L12_2 = L12_2.sprite
      L10_2(L11_2, L12_2)
      L10_2 = SetBlipDisplay
      L11_2 = L3_2.progress
      L11_2 = L11_2[L8_2]
      L11_2 = L11_2.blip
      L12_2 = 4
      L10_2(L11_2, L12_2)
      L10_2 = SetBlipScale
      L11_2 = L3_2.progress
      L11_2 = L11_2[L8_2]
      L11_2 = L11_2.blip
      L12_2 = L3_2.config
      L12_2 = L12_2.location_blip
      L12_2 = L12_2.scale
      L10_2(L11_2, L12_2)
      L10_2 = SetBlipColour
      L11_2 = L3_2.progress
      L11_2 = L11_2[L8_2]
      L11_2 = L11_2.blip
      L12_2 = L3_2.config
      L12_2 = L12_2.location_blip
      L12_2 = L12_2.color
      L10_2(L11_2, L12_2)
      L10_2 = SetBlipAsShortRange
      L11_2 = L3_2.progress
      L11_2 = L11_2[L8_2]
      L11_2 = L11_2.blip
      L12_2 = true
      L10_2(L11_2, L12_2)
      L10_2 = BeginTextCommandSetBlipName
      L11_2 = "STRING"
      L10_2(L11_2)
      L10_2 = AddTextComponentString
      L11_2 = L3_2.config
      L11_2 = L11_2.location_blip
      L11_2 = L11_2.label
      L10_2(L11_2)
      L10_2 = EndTextCommandSetBlipName
      L11_2 = L3_2.progress
      L11_2 = L11_2[L8_2]
      L11_2 = L11_2.blip
      L10_2(L11_2)
      L10_2 = blips
      L11_2 = blips
      L11_2 = #L11_2
      L11_2 = L11_2 + 1
      L12_2 = L3_2.progress
      L12_2 = L12_2[L8_2]
      L12_2 = L12_2.blip
      L10_2[L11_2] = L12_2
      L10_2 = L0_1.debug
      if L10_2 then
        L10_2 = print
        L11_2 = "[^2INFO^7] Electrician Job Blips has been initialized."
        L10_2(L11_2)
      end
    end
    L10_2 = L9_2.ptfx
    if nil ~= L10_2 then
      L10_2 = loadPtfx
      L11_2 = L9_2.ptfx
      L11_2 = L11_2.class
      L10_2 = L10_2(L11_2)
      if not L10_2 then
        return
      end
      L10_2 = UseParticleFxAsset
      L11_2 = L9_2.ptfx
      L11_2 = L11_2.class
      L10_2(L11_2)
      L10_2 = L3_2.progress
      L10_2 = L10_2[L8_2]
      L11_2 = StartParticleFxLoopedAtCoord
      L12_2 = L9_2.ptfx
      L12_2 = L12_2.effect
      L13_2 = L9_2.ptfx
      L13_2 = L13_2.coords
      L13_2 = L13_2.x
      L14_2 = L9_2.ptfx
      L14_2 = L14_2.coords
      L14_2 = L14_2.y
      L15_2 = L9_2.ptfx
      L15_2 = L15_2.coords
      L15_2 = L15_2.z
      L16_2 = 0.0
      L17_2 = 0.0
      L18_2 = 0.0
      L19_2 = L9_2.ptfx
      L19_2 = L19_2.scale
      L20_2 = false
      L21_2 = false
      L22_2 = false
      L23_2 = false
      L11_2 = L11_2(L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2, L20_2, L21_2, L22_2, L23_2)
      L10_2.ptfx = L11_2
    end
  end
  L4_2 = Config
  L4_2 = L4_2.Notification
  L5_2 = Lang
  L6_2 = "job"
  L5_2 = L5_2(L6_2)
  L6_2 = Lang
  L7_2 = "electrician_mission_start"
  L6_2 = L6_2(L7_2)
  L7_2 = "success"
  L8_2 = 7500.0
  L4_2(L5_2, L6_2, L7_2, L8_2)
  L4_2 = SetNewWaypoint
  L5_2 = L3_2.config
  L5_2 = L5_2.maintenance_locations
  L5_2 = L5_2[1]
  L5_2 = L5_2.coords
  L5_2 = L5_2.x
  L6_2 = L3_2.config
  L6_2 = L6_2.maintenance_locations
  L6_2 = L6_2[1]
  L6_2 = L6_2.coords
  L6_2 = L6_2.y
  L4_2(L5_2, L6_2)
  L4_2 = CreateThread
  function L5_2()
    local L0_3, L1_3, L2_3, L3_3, L4_3, L5_3, L6_3, L7_3, L8_3, L9_3, L10_3, L11_3, L12_3, L13_3, L14_3, L15_3, L16_3, L17_3, L18_3, L19_3, L20_3, L21_3, L22_3, L23_3, L24_3, L25_3, L26_3, L27_3, L28_3, L29_3, L30_3, L31_3, L32_3, L33_3, L34_3
    while true do
      L0_3 = L3_2
      if nil == L0_3 then
        break
      end
      L0_3 = L3_2.deleted
      if L0_3 then
        break
      end
      L0_3 = 1000
      L1_3 = PlayerPedId
      L1_3 = L1_3()
      L2_3 = GetEntityCoords
      L3_3 = L1_3
      L2_3 = L2_3(L3_3)
      L3_3 = pairs
      L4_3 = L3_2.progress
      L3_3, L4_3, L5_3, L6_3 = L3_3(L4_3)
      for L7_3, L8_3 in L3_3, L4_3, L5_3, L6_3 do
        L9_3 = L8_3.isBusy
        if not L9_3 then
          L9_3 = L8_3.isFixed
          if not L9_3 then
            L9_3 = L8_3.zone
            L9_3 = L9_3.coords
            L9_3 = L2_3 - L9_3
            L9_3 = #L9_3
            if L9_3 <= 75.0 then
              L10_3 = DrawMarker
              L11_3 = 2
              L12_3 = L8_3.zone
              L12_3 = L12_3.coords
              L12_3 = L12_3.x
              L13_3 = L8_3.zone
              L13_3 = L13_3.coords
              L13_3 = L13_3.y
              L14_3 = L8_3.zone
              L14_3 = L14_3.coords
              L14_3 = L14_3.z
              L14_3 = L14_3 + 0.75
              L15_3 = 0
              L16_3 = 0
              L17_3 = 0
              L18_3 = 0
              L19_3 = -180
              L20_3 = 0
              L21_3 = 0.5
              L22_3 = 0.5
              L23_3 = 0.5
              L24_3 = 98
              L25_3 = 255
              L26_3 = 114
              L27_3 = 200
              L28_3 = true
              L29_3 = false
              L30_3 = 2
              L31_3 = false
              L32_3 = false
              L33_3 = false
              L34_3 = false
              L10_3(L11_3, L12_3, L13_3, L14_3, L15_3, L16_3, L17_3, L18_3, L19_3, L20_3, L21_3, L22_3, L23_3, L24_3, L25_3, L26_3, L27_3, L28_3, L29_3, L30_3, L31_3, L32_3, L33_3, L34_3)
              L0_3 = 5
            end
          end
        end
      end
      L3_3 = Wait
      L4_3 = L0_3
      L3_3(L4_3)
    end
  end
  L4_2(L5_2)
  return L3_2
end
L3_1.CreateMaintenance = L4_1
L3_1 = Electrician
function L4_1(A0_2, A1_2)
  local L2_2, L3_2, L4_2, L5_2
  L2_2 = true
  L2_1 = L2_2
  L2_2 = SetNuiFocus
  L3_2 = true
  L4_2 = true
  L2_2(L3_2, L4_2)
  L2_2 = SendNUIMessage
  L3_2 = {}
  L3_2.type = "ELECTRICIAN_MINIGAME"
  L3_2.state = true
  L3_2.minigame = A1_2
  L2_2(L3_2)
  while true do
    L2_2 = L1_1
    if nil ~= L2_2 then
      break
    end
    L2_2 = Wait
    L3_2 = 250
    L2_2(L3_2)
  end
  L2_2 = L1_1
  L3_2 = SetNuiFocus
  L4_2 = false
  L5_2 = false
  L3_2(L4_2, L5_2)
  L3_2 = SendNUIMessage
  L4_2 = {}
  L4_2.type = "ELECTRICIAN_MINIGAME"
  L4_2.state = false
  L4_2.minigame = A1_2
  L3_2(L4_2)
  L3_2 = nil
  L1_1 = L3_2
  return L2_2
end
L3_1.DoMinigame = L4_1
L3_1 = Electrician
function L4_1(A0_2, A1_2, A2_2)
  local L3_2
  L3_2 = A0_2.progress
  L3_2 = L3_2[A1_2]
  if L3_2 then
    L3_2 = A0_2.progress
    L3_2 = L3_2[A1_2]
    L3_2.isBusy = A2_2
  end
end
L3_1.changeBusyState = L4_1
L3_1 = Electrician
function L4_1(A0_2, A1_2, A2_2)
  local L3_2, L4_2, L5_2, L6_2, L7_2, L8_2
  L3_2 = A0_2.progress
  L3_2 = L3_2[A1_2]
  if L3_2 then
    L3_2 = A0_2.progress
    L3_2 = L3_2[A1_2]
    L3_2.isFixed = A2_2
    L3_2 = A0_2.progress
    L3_2 = L3_2[A1_2]
    L3_2 = L3_2.zone
    if nil ~= L3_2 then
      L3_2 = A0_2.progress
      L3_2 = L3_2[A1_2]
      L3_2 = L3_2.zone
      L4_2 = L3_2
      L3_2 = L3_2.remove
      L3_2(L4_2)
    end
    L3_2 = A0_2.progress
    L3_2 = L3_2[A1_2]
    L3_2 = L3_2.blip
    if nil ~= L3_2 then
      L3_2 = RemoveBlip
      L4_2 = A0_2.progress
      L4_2 = L4_2[A1_2]
      L4_2 = L4_2.blip
      L3_2(L4_2)
    end
    L3_2 = A0_2.progress
    L3_2 = L3_2[A1_2]
    L3_2 = L3_2.ptfx
    if nil ~= L3_2 then
      L3_2 = RemoveParticleFx
      L4_2 = A0_2.progress
      L4_2 = L4_2[A1_2]
      L4_2 = L4_2.ptfx
      L5_2 = true
      L3_2(L4_2, L5_2)
    end
    L3_2 = A0_2.fixed
    L3_2 = L3_2 + 1
    A0_2.fixed = L3_2
    L3_2 = A0_2.config
    L3_2 = L3_2.maintenance_locations
    L4_2 = A1_2 + 1
    L3_2 = L3_2[L4_2]
    if nil ~= L3_2 then
      L3_2 = SetNewWaypoint
      L4_2 = A0_2.config
      L4_2 = L4_2.maintenance_locations
      L5_2 = A1_2 + 1
      L4_2 = L4_2[L5_2]
      L4_2 = L4_2.coords
      L4_2 = L4_2.x
      L5_2 = A0_2.config
      L5_2 = L5_2.maintenance_locations
      L6_2 = A1_2 + 1
      L5_2 = L5_2[L6_2]
      L5_2 = L5_2.coords
      L5_2 = L5_2.y
      L3_2(L4_2, L5_2)
      L3_2 = Config
      L3_2 = L3_2.Notification
      L4_2 = Lang
      L5_2 = "job"
      L4_2 = L4_2(L5_2)
      L5_2 = Lang
      L6_2 = "electrician_mission_success_left"
      L7_2 = A0_2.mustBeFixed
      L8_2 = A0_2.fixed
      L7_2 = L7_2 - L8_2
      L5_2 = L5_2(L6_2, L7_2)
      L6_2 = "success"
      L7_2 = 5000
      L3_2(L4_2, L5_2, L6_2, L7_2)
    end
    L3_2 = A0_2.owner
    L3_2 = L3_2.type
    if "player" == L3_2 then
      L3_2 = A0_2.fixed
      L4_2 = A0_2.mustBeFixed
      if L3_2 >= L4_2 then
        L3_2 = Config
        L3_2 = L3_2.JobSuccess
        L4_2 = CurrentJob
        L5_2 = nil
        L6_2 = A0_2.index
        L7_2 = A0_2.timer
        L8_2 = L7_2
        L7_2 = L7_2.getDuration
        L7_2 = L7_2(L8_2)
        L8_2 = A0_2.timer
        L8_2 = L8_2.extraTimeEnabled
        L3_2(L4_2, L5_2, L6_2, L7_2, L8_2)
        L3_2 = calcuteDeductedMoney
        L4_2 = A0_2.timer
        L4_2 = L4_2.extraTimeEnabled
        L5_2 = A0_2.config
        L5_2 = L5_2.timer
        L5_2 = L5_2.mission_time
        L6_2 = A0_2.timer
        L7_2 = L6_2
        L6_2 = L6_2.getDuration
        L6_2 = L6_2(L7_2)
        L7_2 = A0_2.config
        L7_2 = L7_2.timer
        L7_2 = L7_2.deducted_per_min
        L3_2 = L3_2(L4_2, L5_2, L6_2, L7_2)
        L4_2 = TriggerServerEvent
        L5_2 = "wais:electrician:server:missionFinished"
        L6_2 = CurrentJob
        L7_2 = A0_2.index
        L8_2 = L3_2
        L4_2(L5_2, L6_2, L7_2, L8_2)
        L4_2 = Config
        L4_2 = L4_2.Notification
        L5_2 = Lang
        L6_2 = "job"
        L5_2 = L5_2(L6_2)
        L6_2 = Lang
        L7_2 = "electrician_mission_success_end"
        L6_2 = L6_2(L7_2)
        L7_2 = "success"
        L8_2 = 7500.0
        L4_2(L5_2, L6_2, L7_2, L8_2)
        L5_2 = A0_2
        L4_2 = A0_2.deleteSelf
        L4_2(L5_2)
      end
    end
  end
end
L3_1.changeFixedState = L4_1