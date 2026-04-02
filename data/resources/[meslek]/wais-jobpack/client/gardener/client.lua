local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1
L0_1 = Config
L0_1 = L0_1.Jobs
L0_1 = L0_1.gardener
L1_1 = nil
L2_1 = nil
L3_1 = nil
L4_1 = nil
gardenerRake = nil
gardenerMover = L4_1
gardenerTractor = L3_1
gardenerTrailer = L2_1
gardenerVehicleBlip = L1_1
L1_1 = false
L2_1 = false
tractorOut = false
rakeAttached = L2_1
mowerAttached = L1_1
L1_1 = nil
playerInGarden = false
CurrentGarden = L1_1
L1_1 = nil
L2_1 = false
L3_1 = RegisterNetEvent
L4_1 = "wais:setDefault:JobThings"
function L5_1()
  local L0_2, L1_2
  L0_2 = CurrentGarden
  if nil ~= L0_2 then
    L0_2 = CurrentGarden
    L1_2 = L0_2
    L0_2 = L0_2.deleteSelf
    L0_2(L1_2)
    CurrentGarden = nil
  end
end
L3_1(L4_1, L5_1)
function L3_1()
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
          L5_3 = "gardener"
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
    L2_2 = "[^2INFO^7] Gardener Job Center has been initialized."
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
      L3_2 = "[^2INFO^7] Gardener Job Center Blip has been initialized."
      L2_2(L3_2)
    end
  end
  L1_2 = points
  L2_2 = points
  L2_2 = #L2_2
  L2_2 = L2_2 + 1
  L1_2[L2_2] = L0_2
end
initGardener = L3_1
function L3_1()
  local L0_2, L1_2, L2_2
  L0_2 = math
  L0_2 = L0_2.randomseed
  L1_2 = GetGameTimer
  L1_2, L2_2 = L1_2()
  L0_2(L1_2, L2_2)
  L0_2 = math
  L0_2 = L0_2.random
  L1_2 = 1
  L2_2 = L0_1.gardens
  L2_2 = #L2_2
  return L0_2(L1_2, L2_2)
end
function L4_1()
  local L0_2, L1_2, L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2
  L0_2 = joaat
  L1_2 = L0_1.car_settings
  L1_2 = L1_2.trailer
  L0_2 = L0_2(L1_2)
  L1_2 = joaat
  L2_2 = L0_1.gardener_entitys
  L2_2 = L2_2.lawn_tractor
  L2_2 = L2_2.model
  L1_2 = L1_2(L2_2)
  L2_2 = joaat
  L3_2 = L0_1.gardener_entitys
  L3_2 = L3_2.lawn_mower
  L3_2 = L3_2.prop
  L2_2 = L2_2(L3_2)
  L3_2 = joaat
  L4_2 = L0_1.gardener_entitys
  L4_2 = L4_2.rake_prop
  L4_2 = L4_2.prop
  L3_2 = L3_2(L4_2)
  L4_2 = loadModel
  L5_2 = L0_2
  L4_2 = L4_2(L5_2)
  if not L4_2 then
    return
  end
  L4_2 = loadModel
  L5_2 = L1_2
  L4_2 = L4_2(L5_2)
  if not L4_2 then
    return
  end
  L4_2 = loadModel
  L5_2 = L2_2
  L4_2 = L4_2(L5_2)
  if not L4_2 then
    return
  end
  L4_2 = loadModel
  L5_2 = L3_2
  L4_2 = L4_2(L5_2)
  if not L4_2 then
    return
  end
  L4_2 = L3_1
  L4_2 = L4_2()
  L1_1 = L4_2
  L4_2 = lib
  L4_2 = L4_2.callback
  L5_2 = "wais:checkGarden:available"
  L6_2 = false
  function L7_2(A0_3)
    local L1_3, L2_3, L3_3, L4_3, L5_3
    if not A0_3 then
      L1_3 = Config
      L1_3 = L1_3.Notification
      L2_3 = Lang
      L3_3 = "job"
      L2_3 = L2_3(L3_3)
      L3_3 = Lang
      L4_3 = "garden_not_available"
      L3_3 = L3_3(L4_3)
      L4_3 = "error"
      L5_3 = nil
      return L1_3(L2_3, L3_3, L4_3, L5_3)
    end
  end
  L8_2 = L1_1
  L4_2(L5_2, L6_2, L7_2, L8_2)
  L4_2 = L0_1.debug
  if L4_2 then
    L4_2 = print
    L5_2 = "[^2INFO^7] Gardener Job Models are being loaded."
    L6_2 = L0_2
    L7_2 = L1_2
    L8_2 = L2_2
    L9_2 = L3_2
    L4_2(L5_2, L6_2, L7_2, L8_2, L9_2)
  end
  L4_2 = L0_1.car_settings
  L4_2 = L4_2.showBlip
  if L4_2 then
    L4_2 = AddBlipForEntity
    L5_2 = vehicle
    L4_2 = L4_2(L5_2)
    gardenerVehicleBlip = L4_2
    L4_2 = SetBlipSprite
    L5_2 = gardenerVehicleBlip
    L6_2 = 85
    L4_2(L5_2, L6_2)
    L4_2 = SetBlipColour
    L5_2 = gardenerVehicleBlip
    L6_2 = 69
    L4_2(L5_2, L6_2)
    L4_2 = SetBlipScale
    L5_2 = gardenerVehicleBlip
    L6_2 = 1.2
    L4_2(L5_2, L6_2)
    L4_2 = BeginTextCommandSetBlipName
    L5_2 = "STRING"
    L4_2(L5_2)
    L4_2 = AddTextComponentString
    L5_2 = Lang
    L6_2 = "gardener_vehicle"
    L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2 = L5_2(L6_2)
    L4_2(L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2)
    L4_2 = EndTextCommandSetBlipName
    L5_2 = gardenerVehicleBlip
    L4_2(L5_2)
    L4_2 = blips
    L5_2 = blips
    L5_2 = #L5_2
    L5_2 = L5_2 + 1
    L6_2 = gardenerVehicleBlip
    L4_2[L5_2] = L6_2
  end
  L4_2 = CreateVehicle
  L5_2 = L0_2
  L6_2 = L0_1.car_settings
  L6_2 = L6_2.spawnCoords
  L6_2 = L6_2.x
  L7_2 = L0_1.car_settings
  L7_2 = L7_2.spawnCoords
  L7_2 = L7_2.y
  L8_2 = L0_1.car_settings
  L8_2 = L8_2.spawnCoords
  L8_2 = L8_2.z
  L9_2 = L0_1.car_settings
  L9_2 = L9_2.spawnCoords
  L9_2 = L9_2.w
  L10_2 = true
  L11_2 = false
  L4_2 = L4_2(L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2)
  gardenerTrailer = L4_2
  L4_2 = AttachVehicleToTrailer
  L5_2 = vehicle
  L6_2 = gardenerTrailer
  L7_2 = 10.0
  L4_2(L5_2, L6_2, L7_2)
  L4_2 = CreateVehicle
  L5_2 = L1_2
  L6_2 = L0_1.car_settings
  L6_2 = L6_2.spawnCoords
  L6_2 = L6_2.x
  L7_2 = L0_1.car_settings
  L7_2 = L7_2.spawnCoords
  L7_2 = L7_2.y
  L8_2 = L0_1.car_settings
  L8_2 = L8_2.spawnCoords
  L8_2 = L8_2.z
  L9_2 = L0_1.car_settings
  L9_2 = L9_2.spawnCoords
  L9_2 = L9_2.w
  L10_2 = true
  L11_2 = false
  L4_2 = L4_2(L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2)
  gardenerTractor = L4_2
  L4_2 = SetVehicleOnGroundProperly
  L5_2 = gardenerTractor
  L4_2(L5_2)
  L4_2 = SetEntityInvincible
  L5_2 = gardenerTractor
  L6_2 = true
  L4_2(L5_2, L6_2)
  L4_2 = AttachEntityToEntity
  L5_2 = gardenerTractor
  L6_2 = gardenerTrailer
  L7_2 = L0_1.gardener_entitys
  L7_2 = L7_2.lawn_tractor
  L7_2 = L7_2.car_attach
  L7_2 = L7_2.bone
  L8_2 = L0_1.gardener_entitys
  L8_2 = L8_2.lawn_tractor
  L8_2 = L8_2.car_attach
  L8_2 = L8_2.coords
  L8_2 = L8_2.x
  L9_2 = L0_1.gardener_entitys
  L9_2 = L9_2.lawn_tractor
  L9_2 = L9_2.car_attach
  L9_2 = L9_2.coords
  L9_2 = L9_2.y
  L10_2 = L0_1.gardener_entitys
  L10_2 = L10_2.lawn_tractor
  L10_2 = L10_2.car_attach
  L10_2 = L10_2.coords
  L10_2 = L10_2.z
  L11_2 = L0_1.gardener_entitys
  L11_2 = L11_2.lawn_tractor
  L11_2 = L11_2.car_attach
  L11_2 = L11_2.rotation
  L11_2 = L11_2.x
  L12_2 = L0_1.gardener_entitys
  L12_2 = L12_2.lawn_tractor
  L12_2 = L12_2.car_attach
  L12_2 = L12_2.rotation
  L12_2 = L12_2.y
  L13_2 = L0_1.gardener_entitys
  L13_2 = L13_2.lawn_tractor
  L13_2 = L13_2.car_attach
  L13_2 = L13_2.rotation
  L13_2 = L13_2.z
  L14_2 = true
  L15_2 = true
  L16_2 = false
  L17_2 = false
  L18_2 = 1
  L19_2 = true
  L4_2(L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2)
  L4_2 = TriggerServerEvent
  L5_2 = "wais:outJob:car"
  L6_2 = gardenerTractor
  L7_2 = NetworkGetNetworkIdFromEntity
  L8_2 = gardenerTractor
  L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2 = L7_2(L8_2)
  L4_2(L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2)
  L4_2 = Config
  L4_2 = L4_2.VehicleCreated
  L5_2 = gardenerTractor
  L6_2 = GetVehicleNumberPlateText
  L7_2 = gardenerTractor
  L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2 = L6_2(L7_2)
  L4_2(L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2)
  L4_2 = addTargetGardenerTrailer
  L4_2()
  L4_2 = CreateObject
  L5_2 = L2_2
  L6_2 = L0_1.car_settings
  L6_2 = L6_2.spawnCoords
  L6_2 = L6_2.x
  L7_2 = L0_1.car_settings
  L7_2 = L7_2.spawnCoords
  L7_2 = L7_2.y
  L8_2 = L0_1.car_settings
  L8_2 = L8_2.spawnCoords
  L8_2 = L8_2.z
  L9_2 = true
  L10_2 = false
  L11_2 = false
  L4_2 = L4_2(L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2)
  gardenerMover = L4_2
  L4_2 = SetEntityAsMissionEntity
  L5_2 = gardenerMover
  L6_2 = false
  L7_2 = false
  L4_2(L5_2, L6_2, L7_2)
  L4_2 = SetEntityInvincible
  L5_2 = gardenerMover
  L6_2 = true
  L4_2(L5_2, L6_2)
  L4_2 = AttachEntityToEntity
  L5_2 = gardenerMover
  L6_2 = vehicle
  L7_2 = L0_1.gardener_entitys
  L7_2 = L7_2.lawn_mower
  L7_2 = L7_2.car_attach
  L7_2 = L7_2.bone
  L8_2 = L0_1.gardener_entitys
  L8_2 = L8_2.lawn_mower
  L8_2 = L8_2.car_attach
  L8_2 = L8_2.coords
  L8_2 = L8_2.x
  L9_2 = L0_1.gardener_entitys
  L9_2 = L9_2.lawn_mower
  L9_2 = L9_2.car_attach
  L9_2 = L9_2.coords
  L9_2 = L9_2.y
  L10_2 = L0_1.gardener_entitys
  L10_2 = L10_2.lawn_mower
  L10_2 = L10_2.car_attach
  L10_2 = L10_2.coords
  L10_2 = L10_2.z
  L11_2 = L0_1.gardener_entitys
  L11_2 = L11_2.lawn_mower
  L11_2 = L11_2.car_attach
  L11_2 = L11_2.rotation
  L11_2 = L11_2.x
  L12_2 = L0_1.gardener_entitys
  L12_2 = L12_2.lawn_mower
  L12_2 = L12_2.car_attach
  L12_2 = L12_2.rotation
  L12_2 = L12_2.y
  L13_2 = L0_1.gardener_entitys
  L13_2 = L13_2.lawn_mower
  L13_2 = L13_2.car_attach
  L13_2 = L13_2.rotation
  L13_2 = L13_2.z
  L14_2 = true
  L15_2 = true
  L16_2 = false
  L17_2 = false
  L18_2 = 1
  L19_2 = true
  L4_2(L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2)
  L4_2 = TriggerServerEvent
  L5_2 = "wais:addProp"
  L6_2 = gardenerMover
  L7_2 = NetworkGetNetworkIdFromEntity
  L8_2 = gardenerMover
  L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2 = L7_2(L8_2)
  L4_2(L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2)
  L4_2 = CreateObject
  L5_2 = L3_2
  L6_2 = L0_1.car_settings
  L6_2 = L6_2.spawnCoords
  L6_2 = L6_2.x
  L7_2 = L0_1.car_settings
  L7_2 = L7_2.spawnCoords
  L7_2 = L7_2.y
  L8_2 = L0_1.car_settings
  L8_2 = L8_2.spawnCoords
  L8_2 = L8_2.z
  L9_2 = true
  L10_2 = false
  L11_2 = false
  L4_2 = L4_2(L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2)
  gardenerRake = L4_2
  L4_2 = SetEntityAsMissionEntity
  L5_2 = gardenerRake
  L6_2 = false
  L7_2 = false
  L4_2(L5_2, L6_2, L7_2)
  L4_2 = SetEntityInvincible
  L5_2 = gardenerRake
  L6_2 = true
  L4_2(L5_2, L6_2)
  L4_2 = AttachEntityToEntity
  L5_2 = gardenerRake
  L6_2 = vehicle
  L7_2 = L0_1.gardener_entitys
  L7_2 = L7_2.rake_prop
  L7_2 = L7_2.car_attach
  L7_2 = L7_2.bone
  L8_2 = L0_1.gardener_entitys
  L8_2 = L8_2.rake_prop
  L8_2 = L8_2.car_attach
  L8_2 = L8_2.coords
  L8_2 = L8_2.x
  L9_2 = L0_1.gardener_entitys
  L9_2 = L9_2.rake_prop
  L9_2 = L9_2.car_attach
  L9_2 = L9_2.coords
  L9_2 = L9_2.y
  L10_2 = L0_1.gardener_entitys
  L10_2 = L10_2.rake_prop
  L10_2 = L10_2.car_attach
  L10_2 = L10_2.coords
  L10_2 = L10_2.z
  L11_2 = L0_1.gardener_entitys
  L11_2 = L11_2.rake_prop
  L11_2 = L11_2.car_attach
  L11_2 = L11_2.rotation
  L11_2 = L11_2.x
  L12_2 = L0_1.gardener_entitys
  L12_2 = L12_2.rake_prop
  L12_2 = L12_2.car_attach
  L12_2 = L12_2.rotation
  L12_2 = L12_2.y
  L13_2 = L0_1.gardener_entitys
  L13_2 = L13_2.rake_prop
  L13_2 = L13_2.car_attach
  L13_2 = L13_2.rotation
  L13_2 = L13_2.z
  L14_2 = true
  L15_2 = true
  L16_2 = false
  L17_2 = false
  L18_2 = 1
  L19_2 = true
  L4_2(L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2)
  L4_2 = TriggerServerEvent
  L5_2 = "wais:addProp"
  L6_2 = gardenerRake
  L7_2 = NetworkGetNetworkIdFromEntity
  L8_2 = gardenerRake
  L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2 = L7_2(L8_2)
  L4_2(L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2)
  while true do
    L4_2 = DoesEntityExist
    L5_2 = gardenerTrailer
    L4_2 = L4_2(L5_2)
    if L4_2 then
      break
    end
    L4_2 = Wait
    L5_2 = 0
    L4_2(L5_2)
  end
  while true do
    L4_2 = DoesEntityExist
    L5_2 = vehicle
    L4_2 = L4_2(L5_2)
    if L4_2 then
      break
    end
    L4_2 = Wait
    L5_2 = 0
    L4_2(L5_2)
  end
  L4_2 = addTargetToGardenerVehicle
  L4_2()
  L4_2 = Gardens
  L5_2 = L4_2
  L4_2 = L4_2.NewGarden
  L6_2 = L1_1
  L4_2 = L4_2(L5_2, L6_2)
  CurrentGarden = L4_2
  L4_2 = SetNewWaypoint
  L5_2 = L0_1.gardens
  L6_2 = L1_1
  L5_2 = L5_2[L6_2]
  L5_2 = L5_2.coords
  L5_2 = L5_2.x
  L6_2 = L0_1.gardens
  L7_2 = L1_1
  L6_2 = L6_2[L7_2]
  L6_2 = L6_2.coords
  L6_2 = L6_2.y
  L4_2(L5_2, L6_2)
  L4_2 = Config
  L4_2 = L4_2.Notification
  L5_2 = Lang
  L6_2 = "job"
  L5_2 = L5_2(L6_2)
  L6_2 = Lang
  L7_2 = "garden_marked"
  L6_2 = L6_2(L7_2)
  L7_2 = "inform"
  L8_2 = nil
  L4_2(L5_2, L6_2, L7_2, L8_2)
end
createGardenerThings = L4_1
function L4_1()
  local L0_2, L1_2, L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2
  L0_2 = GetEntityCoords
  L1_2 = gardenerTrailer
  L0_2 = L0_2(L1_2)
  L1_2 = GetEntityHeading
  L2_2 = gardenerTrailer
  L1_2 = L1_2(L2_2)
  L2_2 = 3.0
  L3_2 = math
  L3_2 = L3_2.cos
  L4_2 = math
  L4_2 = L4_2.rad
  L5_2 = L1_2
  L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2 = L4_2(L5_2)
  L3_2 = L3_2(L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2)
  L3_2 = L2_2 * L3_2
  L4_2 = math
  L4_2 = L4_2.sin
  L5_2 = math
  L5_2 = L5_2.rad
  L6_2 = L1_2
  L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2 = L5_2(L6_2)
  L4_2 = L4_2(L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2)
  L4_2 = L2_2 * L4_2
  L5_2 = vector3
  L6_2 = L0_2.x
  L6_2 = L6_2 - L3_2
  L7_2 = L0_2.y
  L7_2 = L7_2 - L4_2
  L8_2 = L0_2.z
  L5_2 = L5_2(L6_2, L7_2, L8_2)
  L6_2 = lib
  L6_2 = L6_2.getClosestVehicle
  L7_2 = vector3
  L8_2 = L5_2.x
  L9_2 = L5_2.y
  L10_2 = L5_2.z
  L7_2 = L7_2(L8_2, L9_2, L10_2)
  L8_2 = 2.0
  L9_2 = true
  L6_2 = L6_2(L7_2, L8_2, L9_2)
  if L6_2 then
    L7_2 = Config
    L7_2 = L7_2.Notification
    L8_2 = Lang
    L9_2 = "job"
    L8_2 = L8_2(L9_2)
    L9_2 = Lang
    L10_2 = "mower_space"
    L9_2 = L9_2(L10_2)
    L10_2 = "error"
    L11_2 = nil
    return L7_2(L8_2, L9_2, L10_2, L11_2)
  end
  L7_2 = DetachEntity
  L8_2 = gardenerTractor
  L9_2 = true
  L10_2 = true
  L7_2(L8_2, L9_2, L10_2)
  L7_2 = SetEntityCoords
  L8_2 = gardenerTractor
  L9_2 = L5_2.x
  L10_2 = L5_2.y
  L11_2 = L5_2.z
  L12_2 = false
  L13_2 = false
  L14_2 = false
  L15_2 = true
  L7_2(L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2)
  L7_2 = SetEntityHeading
  L8_2 = gardenerTractor
  L9_2 = L1_2
  L7_2(L8_2, L9_2)
  tractorOut = true
end
outTractorFromTrailer = L4_1
function L4_1()
  local L0_2, L1_2, L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2
  L0_2 = GetEntityCoords
  L1_2 = gardenerTractor
  L0_2 = L0_2(L1_2)
  L1_2 = GetEntityCoords
  L2_2 = gardenerTrailer
  L1_2 = L1_2(L2_2)
  L0_2 = L0_2 - L1_2
  L0_2 = #L0_2
  if L0_2 >= 5.0 then
    L1_2 = Config
    L1_2 = L1_2.Notification
    L2_2 = Lang
    L3_2 = "job"
    L2_2 = L2_2(L3_2)
    L3_2 = Lang
    L4_2 = "too_far"
    L3_2 = L3_2(L4_2)
    L4_2 = "error"
    L5_2 = nil
    return L1_2(L2_2, L3_2, L4_2, L5_2)
  end
  L1_2 = GetPedInVehicleSeat
  L2_2 = gardenerTractor
  L3_2 = -1
  L1_2 = L1_2(L2_2, L3_2)
  if L1_2 then
    L1_2 = TaskLeaveVehicle
    L2_2 = PlayerPedId
    L2_2 = L2_2()
    L3_2 = gardenerTractor
    L4_2 = 0
    L1_2(L2_2, L3_2, L4_2)
  end
  L1_2 = AttachEntityToEntity
  L2_2 = gardenerTractor
  L3_2 = gardenerTrailer
  L4_2 = L0_1.gardener_entitys
  L4_2 = L4_2.lawn_tractor
  L4_2 = L4_2.car_attach
  L4_2 = L4_2.bone
  L5_2 = L0_1.gardener_entitys
  L5_2 = L5_2.lawn_tractor
  L5_2 = L5_2.car_attach
  L5_2 = L5_2.coords
  L5_2 = L5_2.x
  L6_2 = L0_1.gardener_entitys
  L6_2 = L6_2.lawn_tractor
  L6_2 = L6_2.car_attach
  L6_2 = L6_2.coords
  L6_2 = L6_2.y
  L7_2 = L0_1.gardener_entitys
  L7_2 = L7_2.lawn_tractor
  L7_2 = L7_2.car_attach
  L7_2 = L7_2.coords
  L7_2 = L7_2.z
  L8_2 = L0_1.gardener_entitys
  L8_2 = L8_2.lawn_tractor
  L8_2 = L8_2.car_attach
  L8_2 = L8_2.rotation
  L8_2 = L8_2.x
  L9_2 = L0_1.gardener_entitys
  L9_2 = L9_2.lawn_tractor
  L9_2 = L9_2.car_attach
  L9_2 = L9_2.rotation
  L9_2 = L9_2.y
  L10_2 = L0_1.gardener_entitys
  L10_2 = L10_2.lawn_tractor
  L10_2 = L10_2.car_attach
  L10_2 = L10_2.rotation
  L10_2 = L10_2.z
  L11_2 = true
  L12_2 = true
  L13_2 = false
  L14_2 = false
  L15_2 = 1
  L16_2 = true
  L1_2(L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2)
  tractorOut = false
end
putTractorToTrailer = L4_1
function L4_1()
  local L0_2, L1_2, L2_2, L3_2, L4_2, L5_2
  L0_2 = AddTargetEntity
  L1_2 = gardenerTrailer
  L2_2 = {}
  L3_2 = {}
  L3_2.icon = "fa-solid fa-trailer"
  L4_2 = Lang
  L5_2 = "take_put_mower"
  L4_2 = L4_2(L5_2)
  L3_2.label = L4_2
  function L4_2(A0_3)
    local L1_3, L2_3, L3_3, L4_3, L5_3, L6_3
    L1_3 = target
    if "ox" == L1_3 then
      L1_3 = A0_3.entity
      if L1_3 then
        goto lbl_8
      end
    end
    L1_3 = A0_3
    ::lbl_8::
    L2_3 = gardenerTrailer
    if L2_3 ~= L1_3 then
      return
    end
    L2_3 = playerInGarden
    if not L2_3 then
      L2_3 = tractorOut
      if not L2_3 then
        L2_3 = Config
        L2_3 = L2_3.Notification
        L3_3 = Lang
        L4_3 = "job"
        L3_3 = L3_3(L4_3)
        L4_3 = Lang
        L5_3 = "must_in_garden"
        L4_3 = L4_3(L5_3)
        L5_3 = "error"
        L6_3 = nil
        return L2_3(L3_3, L4_3, L5_3, L6_3)
      end
    end
    L2_3 = IsEntityAttachedToAnyVehicle
    L3_3 = gardenerTractor
    L2_3 = L2_3(L3_3)
    if L2_3 then
      L2_3 = outTractorFromTrailer
      L2_3()
      L2_3 = Config
      L2_3 = L2_3.Notification
      L3_3 = Lang
      L4_3 = "job"
      L3_3 = L3_3(L4_3)
      L4_3 = Lang
      L5_3 = "clear_grass"
      L4_3 = L4_3(L5_3)
      L5_3 = "inform"
      L6_3 = nil
      L2_3(L3_3, L4_3, L5_3, L6_3)
    else
      L2_3 = putTractorToTrailer
      L2_3()
    end
  end
  L3_2.action = L4_2
  L2_2[1] = L3_2
  L3_2 = true
  L4_2 = 3.0
  L0_2(L1_2, L2_2, L3_2, L4_2)
end
addTargetGardenerTrailer = L4_1
function L4_1()
  local L0_2, L1_2, L2_2, L3_2, L4_2, L5_2, L6_2
  L0_2 = AddTargetEntity
  L1_2 = vehicle
  L2_2 = {}
  L3_2 = {}
  L3_2.icon = "fa-solid fa-hand"
  L4_2 = Lang
  L5_2 = "take_put_rake"
  L4_2 = L4_2(L5_2)
  L3_2.label = L4_2
  function L4_2(A0_3)
    local L1_3, L2_3, L3_3, L4_3, L5_3
    L1_3 = playerInGarden
    if not L1_3 then
      L1_3 = rakeAttached
      if not L1_3 then
        L1_3 = mowerAttached
        if not L1_3 then
          L1_3 = Config
          L1_3 = L1_3.Notification
          L2_3 = Lang
          L3_3 = "job"
          L2_3 = L2_3(L3_3)
          L3_3 = Lang
          L4_3 = "must_in_garden"
          L3_3 = L3_3(L4_3)
          L4_3 = "error"
          L5_3 = nil
          return L1_3(L2_3, L3_3, L4_3, L5_3)
        end
      end
    end
    L1_3 = IsEntityAttachedToAnyPed
    L2_3 = gardenerRake
    L1_3 = L1_3(L2_3)
    if L1_3 then
      L1_3 = putPropToVehicle
      L2_3 = gardenerRake
      L3_3 = L0_1.gardener_entitys
      L3_3 = L3_3.rake_prop
      L3_3 = L3_3.car_attach
      L1_3(L2_3, L3_3)
      rakeAttached = false
    else
      L1_3 = takePropFromVehicle
      L2_3 = gardenerRake
      L3_3 = L0_1.gardener_entitys
      L3_3 = L3_3.rake_prop
      L3_3 = L3_3.player_attach
      L1_3(L2_3, L3_3)
      rakeAttached = true
    end
  end
  L3_2.action = L4_2
  L4_2 = {}
  L4_2.icon = "fa-solid fa-hand"
  L5_2 = Lang
  L6_2 = "take_put_lawnmover"
  L5_2 = L5_2(L6_2)
  L4_2.label = L5_2
  function L5_2(A0_3)
    local L1_3, L2_3, L3_3, L4_3, L5_3, L6_3
    L1_3 = target
    if "ox" == L1_3 then
      L1_3 = A0_3.entity
      if L1_3 then
        goto lbl_8
      end
    end
    L1_3 = A0_3
    ::lbl_8::
    L2_3 = vehicle
    if L2_3 ~= L1_3 then
      return
    end
    L2_3 = playerInGarden
    if not L2_3 then
      L2_3 = rakeAttached
      if not L2_3 then
        L2_3 = mowerAttached
        if not L2_3 then
          L2_3 = Config
          L2_3 = L2_3.Notification
          L3_3 = Lang
          L4_3 = "job"
          L3_3 = L3_3(L4_3)
          L4_3 = Lang
          L5_3 = "must_in_garden"
          L4_3 = L4_3(L5_3)
          L5_3 = "error"
          L6_3 = nil
          return L2_3(L3_3, L4_3, L5_3, L6_3)
        end
      end
    end
    L2_3 = IsEntityAttachedToAnyPed
    L3_3 = gardenerMover
    L2_3 = L2_3(L3_3)
    if L2_3 then
      L2_3 = putPropToVehicle
      L3_3 = gardenerMover
      L4_3 = L0_1.gardener_entitys
      L4_3 = L4_3.lawn_mower
      L4_3 = L4_3.car_attach
      L2_3(L3_3, L4_3)
      mowerAttached = false
    else
      L2_3 = takePropFromVehicle
      L3_3 = gardenerMover
      L4_3 = L0_1.gardener_entitys
      L4_3 = L4_3.lawn_mower
      L4_3 = L4_3.player_attach
      L2_3(L3_3, L4_3)
      mowerAttached = true
      L2_3 = Config
      L2_3 = L2_3.Notification
      L3_3 = Lang
      L4_3 = "job"
      L3_3 = L3_3(L4_3)
      L4_3 = Lang
      L5_3 = "clear_grass"
      L4_3 = L4_3(L5_3)
      L5_3 = "inform"
      L6_3 = nil
      L2_3(L3_3, L4_3, L5_3, L6_3)
    end
  end
  L4_2.action = L5_2
  L2_2[1] = L3_2
  L2_2[2] = L4_2
  L3_2 = true
  L4_2 = 3.0
  L0_2(L1_2, L2_2, L3_2, L4_2)
end
addTargetToGardenerVehicle = L4_1
function L4_1()
  local L0_2, L1_2, L2_2, L3_2, L4_2, L5_2
  L0_2 = CurrentGarden
  if nil ~= L0_2 then
    L0_2 = CurrentGarden
    L1_2 = L0_2
    L0_2 = L0_2.hasCleared
    L0_2 = L0_2(L1_2)
    if L0_2 then
      L0_2 = Config
      L0_2 = L0_2.JobSuccess
      L1_2 = CurrentJob
      L2_2 = L0_1.gardens
      L3_2 = L1_1
      L2_2 = L2_2[L3_2]
      L2_2 = L2_2.reward
      L3_2 = L1_1
      L4_2 = nil
      L5_2 = nil
      L0_2(L1_2, L2_2, L3_2, L4_2, L5_2)
      L0_2 = TriggerServerEvent
      L1_2 = "wais:giveGardener:reward"
      L2_2 = CurrentJob
      L3_2 = L0_1.menu
      L3_2 = L3_2.job_menu
      L4_2 = L1_1
      L0_2(L1_2, L2_2, L3_2, L4_2)
      L0_2 = Config
      L0_2 = L0_2.Notification
      L1_2 = Lang
      L2_2 = "job"
      L1_2 = L1_2(L2_2)
      L2_2 = Lang
      L3_2 = "job_end"
      L2_2 = L2_2(L3_2)
      L3_2 = "success"
      L4_2 = nil
      L0_2(L1_2, L2_2, L3_2, L4_2)
      L0_2 = CurrentGarden
      L1_2 = L0_2
      L0_2 = L0_2.deleteSelf
      L0_2(L1_2)
      CurrentGarden = nil
    end
  end
end
checkGardenCleared = L4_1
function L4_1()
  local L0_2, L1_2
  L0_2 = gardenerVehicleBlip
  if L0_2 then
    L0_2 = RemoveBlip
    L1_2 = gardenerVehicleBlip
    L0_2(L1_2)
    gardenerVehicleBlip = nil
  end
  L0_2 = gardenerTrailer
  if L0_2 then
    L0_2 = DeleteEntity
    L1_2 = gardenerTrailer
    L0_2(L1_2)
    gardenerTrailer = nil
  end
  L0_2 = gardenerTractor
  if L0_2 then
    L0_2 = DeleteEntity
    L1_2 = gardenerTractor
    L0_2(L1_2)
    gardenerTractor = nil
  end
  L0_2 = gardenerMover
  if L0_2 then
    L0_2 = DeleteEntity
    L1_2 = gardenerMover
    L0_2(L1_2)
    gardenerMover = nil
  end
  L0_2 = gardenerRake
  if L0_2 then
    L0_2 = DeleteEntity
    L1_2 = gardenerRake
    L0_2(L1_2)
    gardenerRake = nil
  end
  L0_2 = mowerAttached
  if L0_2 then
    L0_2 = ClearPedTasks
    L1_2 = PlayerPedId
    L1_2 = L1_2()
    L0_2(L1_2)
    mowerAttached = false
  end
  L0_2 = rakeAttached
  if L0_2 then
    L0_2 = ClearPedTasks
    L1_2 = PlayerPedId
    L1_2 = L1_2()
    L0_2(L1_2)
    rakeAttached = false
  end
  tractorOut = false
end
changeGardenerToDef = L4_1
function L4_1()
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
      L3_3 = "vehicle_out_of_garden"
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
L5_1 = RegisterCommand
L6_1 = "loadGarden"
function L7_1(A0_2, A1_2)
  local L2_2, L3_2, L4_2, L5_2
  L2_2 = tonumber
  L3_2 = A1_2[1]
  L2_2 = L2_2(L3_2)
  L3_2 = Gardens
  L4_2 = L3_2
  L3_2 = L3_2.NewGarden
  L5_2 = L2_2
  L3_2 = L3_2(L4_2, L5_2)
  CurrentGarden = L3_2
end
L5_1(L6_1, L7_1)
L5_1 = RegisterCommand
L6_1 = "delete"
function L7_1()
  local L0_2, L1_2
end
L5_1(L6_1, L7_1)
L5_1 = CreateThread
function L6_1()
  local L0_2, L1_2, L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2, L20_2, L21_2, L22_2, L23_2, L24_2, L25_2, L26_2, L27_2, L28_2
  while true do
    L0_2 = PlayerPedId
    L0_2 = L0_2()
    L1_2 = GetEntityCoords
    L2_2 = L0_2
    L1_2 = L1_2(L2_2)
    L2_2 = 1000
    L3_2 = CurrentJob
    if "gardener" == L3_2 then
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
      end
    end
    L3_2 = Wait
    L4_2 = L2_2
    L3_2(L4_2)
  end
end
L5_1(L6_1)
L5_1 = CreateThread
function L6_1()
  local L0_2, L1_2, L2_2, L3_2, L4_2, L5_2, L6_2
  while true do
    L0_2 = 1000
    L1_2 = PlayerPedId
    L1_2 = L1_2()
    L2_2 = CurrentJob
    if "gardener" == L2_2 then
      L2_2 = playerInGarden
      if L2_2 then
        L2_2 = vehicle
        if nil ~= L2_2 then
          L2_2 = gardenerTractor
          if nil ~= L2_2 then
            L2_2 = GetEntityCoords
            L3_2 = L1_2
            L2_2 = L2_2(L3_2)
            L3_2 = GetEntityCoords
            L4_2 = vehicle
            L3_2 = L3_2(L4_2)
            L3_2 = L2_2 - L3_2
            L3_2 = #L3_2
            L4_2 = GetEntityCoords
            L5_2 = gardenerTractor
            L4_2 = L4_2(L5_2)
            L4_2 = L2_2 - L4_2
            L4_2 = #L4_2
            L5_2 = L0_1.gardens
            L6_2 = L1_1
            L5_2 = L5_2[L6_2]
            L5_2 = L5_2.zoneRadius
            if not (L3_2 >= L5_2) then
              L5_2 = L0_1.gardens
              L6_2 = L1_1
              L5_2 = L5_2[L6_2]
              L5_2 = L5_2.zoneRadius
              if not (L4_2 >= L5_2) then
                goto lbl_51
              end
            end
            L5_2 = L2_1
            if not L5_2 then
              L5_2 = true
              L2_1 = L5_2
              L5_2 = L4_1
              L5_2()
            ::lbl_51::
            else
              L5_2 = L0_1.gardens
              L6_2 = L1_1
              L5_2 = L5_2[L6_2]
              L5_2 = L5_2.zoneRadius
              if L3_2 <= L5_2 then
                L5_2 = L0_1.gardens
                L6_2 = L1_1
                L5_2 = L5_2[L6_2]
                L5_2 = L5_2.zoneRadius
                if L4_2 <= L5_2 then
                  L5_2 = L2_1
                  if L5_2 then
                    L5_2 = false
                    L2_1 = L5_2
                  end
                end
              end
            end
          end
        end
      end
    end
    L2_2 = Wait
    L3_2 = L0_2
    L2_2(L3_2)
  end
end
L5_1(L6_1)