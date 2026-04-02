local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1
L0_1 = Config
L0_1 = L0_1.Jobs
L0_1 = L0_1.detectorist
L1_1 = false
L2_1 = nil
L3_1 = false
detecdor = nil
detectorAttached = L3_1
DetectoristZone = L2_1
InDetectoristZone = L1_1
L1_1 = {}
L2_1 = {}
L3_1 = nil
L4_1 = nil
L5_1 = RegisterNetEvent
L6_1 = "wais:setDefault:JobThings"
function L7_1()
  local L0_2, L1_2
  L0_2 = resetBlacklistDetectorVectors
  L0_2()
  L0_2 = InDetectoristZone
  if L0_2 then
    L0_2 = onExitDetectoristZone
    L0_2()
  end
  L0_2 = {}
  L2_1 = L0_2
  L0_2 = nil
  L3_1 = L0_2
end
L5_1(L6_1, L7_1)
function L5_1(A0_2)
  local L1_2, L2_2, L3_2, L4_2, L5_2
  InDetectoristZone = true
  DetectoristZone = A0_2
  L1_2 = Config
  L1_2 = L1_2.Notification
  L2_2 = Lang
  L3_2 = "job"
  L2_2 = L2_2(L3_2)
  L3_2 = Lang
  L4_2 = "detectorist_zone_entered"
  L3_2 = L3_2(L4_2)
  L4_2 = "success"
  L5_2 = nil
  L1_2(L2_2, L3_2, L4_2, L5_2)
end
function L6_1()
  local L0_2, L1_2, L2_2
  InDetectoristZone = false
  DetectoristZone = nil
  L0_2 = {}
  L2_1 = L0_2
  L0_2 = SendNUIMessage
  L1_2 = {}
  L1_2.type = "HIDE_MINIGAME"
  L1_2.minigame = "detector"
  L0_2(L1_2)
  L0_2 = detectorAttached
  if L0_2 then
    L0_2 = putPropToVehicle
    L1_2 = detecdor
    L2_2 = L0_1.prop_settings
    L2_2 = L2_2.w_am_digiscanner
    L2_2 = L2_2.car_attach
    L0_2(L1_2, L2_2)
    detectorAttached = false
  end
end
onExitDetectoristZone = L6_1
function L6_1()
  local L0_2, L1_2, L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2
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
          L5_3 = "detectorist"
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
    L2_2 = "[^2INFO^7] Detectorist Job Center has been initialized."
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
      L3_2 = "[^2INFO^7] Detectorist Job Center Blip has been initialized."
      L2_2(L3_2)
    end
  end
  L1_2 = points
  L2_2 = points
  L2_2 = #L2_2
  L2_2 = L2_2 + 1
  L1_2[L2_2] = L0_2
  L1_2 = pairs
  L2_2 = L0_1.detectorist_zones
  L1_2, L2_2, L3_2, L4_2 = L1_2(L2_2)
  for L5_2, L6_2 in L1_2, L2_2, L3_2, L4_2 do
    L7_2 = lib
    L7_2 = L7_2.zones
    L7_2 = L7_2.sphere
    L8_2 = {}
    L9_2 = L6_2.zone
    L8_2.coords = L9_2
    L9_2 = L6_2.radius
    L8_2.radius = L9_2
    L9_2 = L0_1.debug
    L8_2.debug = L9_2
    function L9_2(A0_3)
      local L1_3
    end
    L8_2.inside = L9_2
    function L9_2()
      local L0_3, L1_3
      L0_3 = L5_1
      L1_3 = L5_2
      L0_3(L1_3)
    end
    L8_2.onEnter = L9_2
    function L9_2()
      local L0_3, L1_3
      L0_3 = onExitDetectoristZone
      L0_3()
    end
    L8_2.onExit = L9_2
    L7_2 = L7_2(L8_2)
    L8_2 = L6_2.blips
    L8_2 = L8_2.show
    if L8_2 then
      L8_2 = AddBlipForCoord
      L9_2 = L6_2.zone
      L9_2 = L9_2.x
      L10_2 = L6_2.zone
      L10_2 = L10_2.y
      L11_2 = L6_2.zone
      L11_2 = L11_2.z
      L8_2 = L8_2(L9_2, L10_2, L11_2)
      L9_2 = SetBlipSprite
      L10_2 = L8_2
      L11_2 = L6_2.blips
      L11_2 = L11_2.sprite
      L9_2(L10_2, L11_2)
      L9_2 = SetBlipDisplay
      L10_2 = L8_2
      L11_2 = 4
      L9_2(L10_2, L11_2)
      L9_2 = SetBlipScale
      L10_2 = L8_2
      L11_2 = L6_2.blips
      L11_2 = L11_2.scale
      L9_2(L10_2, L11_2)
      L9_2 = SetBlipColour
      L10_2 = L8_2
      L11_2 = L6_2.blips
      L11_2 = L11_2.color
      L9_2(L10_2, L11_2)
      L9_2 = SetBlipAsShortRange
      L10_2 = L8_2
      L11_2 = true
      L9_2(L10_2, L11_2)
      L9_2 = BeginTextCommandSetBlipName
      L10_2 = "STRING"
      L9_2(L10_2)
      L9_2 = AddTextComponentString
      L10_2 = L6_2.blips
      L10_2 = L10_2.label
      L9_2(L10_2)
      L9_2 = EndTextCommandSetBlipName
      L10_2 = L8_2
      L9_2(L10_2)
      L9_2 = blips
      L10_2 = blips
      L10_2 = #L10_2
      L10_2 = L10_2 + 1
      L9_2[L10_2] = L8_2
    end
    L8_2 = AddBlipForRadius
    L9_2 = L6_2.zone
    L9_2 = L9_2.x
    L10_2 = L6_2.zone
    L10_2 = L10_2.y
    L11_2 = L6_2.zone
    L11_2 = L11_2.z
    L12_2 = L6_2.radius
    L8_2 = L8_2(L9_2, L10_2, L11_2, L12_2)
    L9_2 = SetBlipColour
    L10_2 = L8_2
    L11_2 = L6_2.blips
    L11_2 = L11_2.color
    L9_2(L10_2, L11_2)
    L9_2 = SetBlipAlpha
    L10_2 = L8_2
    L11_2 = L6_2.blips
    L11_2 = L11_2.alpha
    L9_2(L10_2, L11_2)
    L9_2 = blips
    L10_2 = blips
    L10_2 = #L10_2
    L10_2 = L10_2 + 1
    L9_2[L10_2] = L8_2
    L9_2 = points
    L10_2 = points
    L10_2 = #L10_2
    L10_2 = L10_2 + 1
    L9_2[L10_2] = L7_2
  end
end
initDetectorist = L6_1
function L6_1()
  local L0_2, L1_2, L2_2, L3_2, L4_2, L5_2, L6_2
  L0_2 = pairs
  L1_2 = L1_1
  L0_2, L1_2, L2_2, L3_2 = L0_2(L1_2)
  for L4_2, L5_2 in L0_2, L1_2, L2_2, L3_2 do
    L6_2 = L1_1
    L6_2[L4_2] = nil
  end
  L0_2 = {}
  L1_1 = L0_2
end
resetBlacklistDetectorVectors = L6_1
function L6_1()
  local L0_2, L1_2, L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2
  L0_2 = joaat
  L1_2 = L0_1.prop_settings
  L1_2 = L1_2.w_am_digiscanner
  L1_2 = L1_2.prop
  L0_2 = L0_2(L1_2)
  L1_2 = loadModel
  L2_2 = L0_2
  L1_2 = L1_2(L2_2)
  if not L1_2 then
    return
  end
  L1_2 = GetEntityCoords
  L2_2 = PlayerPedId
  L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2 = L2_2()
  L1_2 = L1_2(L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2)
  L2_2 = CreateObject
  L3_2 = L0_2
  L4_2 = L1_2.x
  L5_2 = L1_2.y
  L6_2 = L1_2.z
  L7_2 = true
  L8_2 = true
  L9_2 = true
  L2_2 = L2_2(L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2)
  detecdor = L2_2
  L2_2 = SetEntityAsMissionEntity
  L3_2 = detecdor
  L4_2 = false
  L5_2 = false
  L2_2(L3_2, L4_2, L5_2)
  L2_2 = SetEntityInvincible
  L3_2 = detecdor
  L4_2 = true
  L2_2(L3_2, L4_2)
  L2_2 = putPropToVehicle
  L3_2 = detecdor
  L4_2 = L0_1.prop_settings
  L4_2 = L4_2.w_am_digiscanner
  L4_2 = L4_2.car_attach
  L2_2(L3_2, L4_2)
  L2_2 = props
  L3_2 = props
  L3_2 = #L3_2
  L3_2 = L3_2 + 1
  L4_2 = detecdor
  L2_2[L3_2] = L4_2
  L2_2 = TriggerServerEvent
  L3_2 = "wais:addProp"
  L4_2 = detecdor
  L5_2 = NetworkGetNetworkIdFromEntity
  L6_2 = detecdor
  L5_2, L6_2, L7_2, L8_2, L9_2 = L5_2(L6_2)
  L2_2(L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2)
  while true do
    L2_2 = DoesEntityExist
    L3_2 = vehicle
    L2_2 = L2_2(L3_2)
    if L2_2 then
      break
    end
    L2_2 = Wait
    L3_2 = 0
    L2_2(L3_2)
  end
  L2_2 = Config
  L2_2 = L2_2.Notification
  L3_2 = Lang
  L4_2 = "job"
  L3_2 = L3_2(L4_2)
  L4_2 = Lang
  L5_2 = "goto_zone_take_detector"
  L4_2 = L4_2(L5_2)
  L5_2 = "success"
  L6_2 = nil
  L2_2(L3_2, L4_2, L5_2, L6_2)
  L2_2 = math
  L2_2 = L2_2.randomseed
  L3_2 = GetGameTimer
  L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2 = L3_2()
  L2_2(L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2)
  L2_2 = L0_1.detectorist_zones
  L3_2 = math
  L3_2 = L3_2.random
  L4_2 = 1
  L5_2 = L0_1.detectorist_zones
  L5_2 = #L5_2
  L3_2 = L3_2(L4_2, L5_2)
  L2_2 = L2_2[L3_2]
  L2_2 = L2_2.zone
  L3_2 = SetNewWaypoint
  L4_2 = L2_2.x
  L5_2 = L2_2.y
  L3_2(L4_2, L5_2)
  L3_2 = AddTargetEntity
  L4_2 = vehicle
  L5_2 = {}
  L6_2 = {}
  L6_2.icon = "fa-solid fa-land-mine-on"
  L7_2 = Lang
  L8_2 = "take_put_detector"
  L7_2 = L7_2(L8_2)
  L6_2.label = L7_2
  function L7_2()
    local L0_3, L1_3, L2_3, L3_3, L4_3
    L0_3 = InDetectoristZone
    if not L0_3 then
      L0_3 = detectorAttached
      if not L0_3 then
        L0_3 = Config
        L0_3 = L0_3.Notification
        L1_3 = Lang
        L2_3 = "job"
        L1_3 = L1_3(L2_3)
        L2_3 = Lang
        L3_3 = "must_in_detectorist_zone"
        L2_3 = L2_3(L3_3)
        L3_3 = "error"
        L4_3 = nil
        return L0_3(L1_3, L2_3, L3_3, L4_3)
      end
    end
    L0_3 = IsEntityAttachedToAnyPed
    L1_3 = detecdor
    L0_3 = L0_3(L1_3)
    if L0_3 then
      L0_3 = putPropToVehicle
      L1_3 = detecdor
      L2_3 = L0_1.prop_settings
      L2_3 = L2_3.w_am_digiscanner
      L2_3 = L2_3.car_attach
      L0_3(L1_3, L2_3)
      detectorAttached = false
      L0_3 = SendNUIMessage
      L1_3 = {}
      L1_3.type = "HIDE_MINIGAME"
      L1_3.minigame = "detector"
      L0_3(L1_3)
    else
      L0_3 = takePropFromVehicle
      L1_3 = detecdor
      L2_3 = L0_1.prop_settings
      L2_3 = L2_3.w_am_digiscanner
      L2_3 = L2_3.player_attach
      L0_3(L1_3, L2_3)
      detectorAttached = true
      L0_3 = InDetectoristZone
      if L0_3 then
        L0_3 = SendNUIMessage
        L1_3 = {}
        L1_3.type = "SHOW_MINIGAME"
        L1_3.minigame = "detector"
        L0_3(L1_3)
      end
    end
  end
  L6_2.action = L7_2
  L5_2[1] = L6_2
  L6_2 = true
  L7_2 = 3.0
  L3_2(L4_2, L5_2, L6_2, L7_2)
end
addMetalDetectorToVehicle = L6_1
L6_1 = CreateThread
function L7_1()
  local L0_2, L1_2, L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2, L20_2, L21_2, L22_2, L23_2, L24_2, L25_2, L26_2, L27_2, L28_2
  while true do
    L0_2 = PlayerPedId
    L0_2 = L0_2()
    L1_2 = GetEntityCoords
    L2_2 = L0_2
    L1_2 = L1_2(L2_2)
    L2_2 = 1000
    L3_2 = CurrentJob
    if "detectorist" == L3_2 then
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
        L4_2 = SendNUIMessage
        L5_2 = {}
        L5_2.type = "UPDATE_DETECTOR"
        L6_2 = L2_1
        L5_2.vectors = L6_2
        L6_2 = {}
        L7_2 = L1_2.x
        L6_2.x = L7_2
        L7_2 = L1_2.y
        L6_2.y = L7_2
        L5_2.playerPos = L6_2
        L4_2(L5_2)
      end
    end
    L3_2 = Wait
    L4_2 = L2_2
    L3_2(L4_2)
  end
end
L6_1(L7_1)
L6_1 = CreateThread
function L7_1()
  local L0_2, L1_2, L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2, L20_2, L21_2
  while true do
    L0_2 = 1000
    L1_2 = CurrentJob
    if "detectorist" == L1_2 then
      L1_2 = InDetectoristZone
      if L1_2 then
        L1_2 = detectorAttached
        if L1_2 then
          L1_2 = PlayerPedId
          L1_2 = L1_2()
          L2_2 = GetEntityCoords
          L3_2 = L1_2
          L2_2 = L2_2(L3_2)
          L0_2 = 5
          L3_2 = ipairs
          L4_2 = L0_1.detectorist_zones
          L5_2 = DetectoristZone
          L4_2 = L4_2[L5_2]
          L4_2 = L4_2.detecable_coords
          L3_2, L4_2, L5_2, L6_2 = L3_2(L4_2)
          for L7_2, L8_2 in L3_2, L4_2, L5_2, L6_2 do
            L9_2 = L1_1
            L9_2 = L9_2[L7_2]
            if nil == L9_2 then
              L9_2 = L8_2.x
              L10_2 = L2_2.x
              L9_2 = L9_2 - L10_2
              L10_2 = L8_2.y
              L11_2 = L2_2.y
              L10_2 = L10_2 - L11_2
              L11_2 = math
              L11_2 = L11_2.sqrt
              L12_2 = L9_2 * L9_2
              L13_2 = L10_2 * L10_2
              L12_2 = L12_2 + L13_2
              L11_2 = L11_2(L12_2)
              L12_2 = math
              L12_2 = L12_2.atan2
              L13_2 = L10_2
              L14_2 = L9_2
              L12_2 = L12_2(L13_2, L14_2)
              L13_2 = false
              L14_2 = vec3
              L15_2 = L8_2.x
              L16_2 = L8_2.y
              L17_2 = L8_2.z
              L14_2 = L14_2(L15_2, L16_2, L17_2)
              L14_2 = L2_2 - L14_2
              L14_2 = #L14_2
              if L14_2 <= 1.0 then
                L0_2 = 5
                L3_1 = L7_2
                L15_2 = lib
                L15_2 = L15_2.showTextUI
                L16_2 = Lang
                L17_2 = "start_digging"
                L16_2 = L16_2(L17_2)
                L17_2 = {}
                L17_2.position = "left-center"
                L17_2.icon = "person-digging"
                L18_2 = {}
                L18_2.color = "white"
                L17_2.style = L18_2
                L15_2(L16_2, L17_2)
                L15_2 = IsControlJustPressed
                L16_2 = 0
                L17_2 = 38
                L15_2 = L15_2(L16_2, L17_2)
                if L15_2 then
                  L15_2 = lib
                  L15_2 = L15_2.hideTextUI
                  L15_2()
                  L15_2 = L1_1
                  L15_2[L7_2] = true
                  L15_2 = putPropToVehicle
                  L16_2 = detecdor
                  L17_2 = L0_1.prop_settings
                  L17_2 = L17_2.w_am_digiscanner
                  L17_2 = L17_2.car_attach
                  L15_2(L16_2, L17_2)
                  L15_2 = nil
                  L4_1 = L15_2
                  L15_2 = lib
                  L15_2 = L15_2.progressBar
                  L16_2 = {}
                  L17_2 = L0_1.digging_duration
                  L16_2.duration = L17_2
                  L17_2 = Lang
                  L18_2 = "you_digging"
                  L17_2 = L17_2(L18_2)
                  L16_2.label = L17_2
                  L16_2.canCancel = true
                  L17_2 = {}
                  L17_2.car = true
                  L17_2.move = true
                  L17_2.combat = true
                  L16_2.disable = L17_2
                  L17_2 = {}
                  L17_2.scenario = "world_human_gardener_plant"
                  L16_2.anim = L17_2
                  L17_2 = {}
                  L18_2 = joaat
                  L19_2 = "bkr_prop_coke_spatula_04"
                  L18_2 = L18_2(L19_2)
                  L17_2.model = L18_2
                  L18_2 = vec3
                  L19_2 = -0.005
                  L20_2 = 0.0
                  L21_2 = 0.0
                  L18_2 = L18_2(L19_2, L20_2, L21_2)
                  L17_2.pos = L18_2
                  L18_2 = vec3
                  L19_2 = 190.0
                  L20_2 = 190.0
                  L21_2 = -50.0
                  L18_2 = L18_2(L19_2, L20_2, L21_2)
                  L17_2.rot = L18_2
                  L17_2.bone = 28422
                  L16_2.prop = L17_2
                  L15_2 = L15_2(L16_2)
                  if L15_2 then
                    L15_2 = L2_1
                    L15_2[L7_2] = nil
                    L15_2 = nil
                    L3_1 = L15_2
                    L15_2 = TriggerServerEvent
                    L16_2 = "wais:detectorist:reward"
                    L17_2 = CurrentJob
                    L18_2 = DetectoristZone
                    L19_2 = L7_2
                    L15_2(L16_2, L17_2, L18_2, L19_2)
                    L15_2 = takePropFromVehicle
                    L16_2 = detecdor
                    L17_2 = L0_1.prop_settings
                    L17_2 = L17_2.w_am_digiscanner
                    L17_2 = L17_2.player_attach
                    L15_2(L16_2, L17_2)
                    L15_2 = Config
                    L15_2 = L15_2.JobSuccess
                    L16_2 = CurrentJob
                    L17_2 = nil
                    L18_2 = DetectoristZone
                    L19_2 = nil
                    L20_2 = nil
                    L15_2(L16_2, L17_2, L18_2, L19_2, L20_2)
                  else
                    L15_2 = L1_1
                    L15_2[L7_2] = nil
                    L15_2 = nil
                    L3_1 = L15_2
                    L4_1 = L7_2
                    L15_2 = takePropFromVehicle
                    L16_2 = detecdor
                    L17_2 = L0_1.prop_settings
                    L17_2 = L17_2.w_am_digiscanner
                    L17_2 = L17_2.player_attach
                    L15_2(L16_2, L17_2)
                  end
                end
              else
                L15_2 = L3_1
                if L7_2 == L15_2 then
                  L15_2 = lib
                  L15_2 = L15_2.hideTextUI
                  L15_2()
                  L15_2 = nil
                  L3_1 = L15_2
                elseif L11_2 <= 5.0 then
                  L4_1 = L7_2
                end
              end
              L15_2 = L2_1
              L16_2 = {}
              L17_2 = math
              L17_2 = L17_2.floor
              L18_2 = L11_2
              L17_2 = L17_2(L18_2)
              L16_2.distance = L17_2
              L16_2.angle = L12_2
              L16_2.inView = L13_2
              L15_2[L7_2] = L16_2
            end
          end
        end
      end
    end
    L1_2 = Wait
    L2_2 = L0_2
    L1_2(L2_2)
  end
end
L6_1(L7_1)
L6_1 = CreateThread
function L7_1()
  local L0_2, L1_2, L2_2
  while true do
    L0_2 = L0_1.reset_timer
    L1_2 = CurrentJob
    if "detectorist" == L1_2 then
      L1_2 = resetBlacklistDetectorVectors
      L1_2()
    end
    L1_2 = Wait
    L2_2 = L0_2
    L1_2(L2_2)
  end
end
L6_1(L7_1)
L6_1 = CreateThread
function L7_1()
  local L0_2, L1_2, L2_2, L3_2, L4_2, L5_2, L6_2, L7_2
  while true do
    L0_2 = 1000
    L1_2 = CurrentJob
    if "detectorist" == L1_2 then
      L1_2 = next
      L2_2 = L2_1
      L1_2 = L1_2(L2_2)
      if nil ~= L1_2 then
        L1_2 = detectorAttached
        if L1_2 then
          L1_2 = L4_1
          if nil ~= L1_2 then
            L1_2 = PlayerPedId
            L1_2 = L1_2()
            L2_2 = GetEntityCoords
            L3_2 = L1_2
            L2_2 = L2_2(L3_2)
            L3_2 = L0_1.detectorist_zones
            L4_2 = DetectoristZone
            L3_2 = L3_2[L4_2]
            L3_2 = L3_2.detecable_coords
            L4_2 = L4_1
            L3_2 = L3_2[L4_2]
            L4_2 = vec3
            L5_2 = L3_2.x
            L6_2 = L3_2.y
            L7_2 = L3_2.z
            L4_2 = L4_2(L5_2, L6_2, L7_2)
            L4_2 = L2_2 - L4_2
            L4_2 = #L4_2
            if L4_2 <= 8.0 then
              L0_2 = 1250
              if L4_2 <= 1.0 then
                L0_2 = 100
              else
                L5_2 = 1.9
                if L4_2 <= L5_2 then
                  L0_2 = 500
                elseif L4_2 <= 3.0 then
                  L0_2 = 750
                end
              end
              L5_2 = SendNUIMessage
              L6_2 = {}
              L6_2.type = "BEP_SOUND"
              L5_2(L6_2)
            end
          end
        end
      end
    end
    L1_2 = Wait
    L2_2 = L0_2
    L1_2(L2_2)
  end
end
L6_1(L7_1)