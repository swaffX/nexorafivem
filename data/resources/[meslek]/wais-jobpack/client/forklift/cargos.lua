local L0_1, L1_1, L2_1
L0_1 = {}
Cargos = L0_1
L0_1 = Cargos
L1_1 = Cargos
L0_1.__index = L1_1
L0_1 = Config
L0_1 = L0_1.Jobs
L0_1 = L0_1.forklifter
L1_1 = Cargos
function L2_1(A0_2)
  local L1_2, L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2
  L1_2 = setmetatable
  L2_2 = {}
  L3_2 = Cargos
  L1_2 = L1_2(L2_2, L3_2)
  L1_2.missionIndex = A0_2
  L2_2 = L0_1.cargo_list
  L2_2 = L2_2[A0_2]
  L1_2.missionConfig = L2_2
  L2_2 = nil
  L3_2 = nil
  L4_2 = nil
  L5_2 = nil
  L6_2 = {}
  L1_2.truckStuff = L6_2
  L1_2.trailer = L5_2
  L1_2.trucker = L4_2
  L1_2.truckBlip = L3_2
  L1_2.truck = L2_2
  L2_2 = L1_2.missionConfig
  L2_2 = L2_2.cargos
  L2_2 = #L2_2
  L3_2 = 0
  L4_2 = {}
  L5_2 = {}
  L1_2.dumyPacks = L5_2
  L1_2.packs = L4_2
  L1_2.placedPacks = L3_2
  L1_2.totalPacks = L2_2
  L2_2 = false
  L3_2 = false
  L4_2 = JobTimer
  L5_2 = L4_2
  L4_2 = L4_2.New
  L6_2 = L1_2.missionConfig
  L6_2 = L6_2.timer
  L6_2 = L6_2.mission_time
  L7_2 = L1_2.missionConfig
  L7_2 = L7_2.timer
  L7_2 = L7_2.extra_time
  L8_2 = false
  L4_2 = L4_2(L5_2, L6_2, L7_2, L8_2)
  L1_2.timer = L4_2
  L1_2.deleted = L3_2
  L1_2.warning = L2_2
  L2_2 = lib
  L2_2 = L2_2.getClosestVehicle
  L3_2 = L1_2.missionConfig
  L3_2 = L3_2.cargo_car
  L3_2 = L3_2.coords
  L3_2 = L3_2.x
  L4_2 = L1_2.missionConfig
  L4_2 = L4_2.cargo_car
  L4_2 = L4_2.coords
  L4_2 = L4_2.y
  L5_2 = L1_2.missionConfig
  L5_2 = L5_2.cargo_car
  L5_2 = L5_2.coords
  L5_2 = L5_2.z
  L6_2 = 3.0
  L7_2 = true
  L2_2 = L2_2(L3_2, L4_2, L5_2, L6_2, L7_2)
  if L2_2 then
    L2_2 = Config
    L2_2 = L2_2.Notification
    L3_2 = Lang
    L4_2 = "job"
    L3_2 = L3_2(L4_2)
    L4_2 = Lang
    L5_2 = "cargo_area_busy"
    L4_2 = L4_2(L5_2)
    L5_2 = "error"
    L6_2 = nil
    L2_2(L3_2, L4_2, L5_2, L6_2)
    L3_2 = L1_2
    L2_2 = L1_2.deleteSelf
    L4_2 = false
    return L2_2(L3_2, L4_2)
  end
  L2_2 = joaat
  L3_2 = "s_m_m_trucker_01"
  L2_2 = L2_2(L3_2)
  L3_2 = loadModel
  L4_2 = joaat
  L5_2 = L1_2.missionConfig
  L5_2 = L5_2.cargo_car
  L5_2 = L5_2.truck
  L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2 = L4_2(L5_2)
  L3_2 = L3_2(L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2)
  if not L3_2 then
    L4_2 = L1_2
    L3_2 = L1_2.deleteSelf
    L5_2 = false
    return L3_2(L4_2, L5_2)
  end
  L3_2 = loadModel
  L4_2 = joaat
  L5_2 = L1_2.missionConfig
  L5_2 = L5_2.cargo_car
  L5_2 = L5_2.trailer
  L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2 = L4_2(L5_2)
  L3_2 = L3_2(L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2)
  if not L3_2 then
    L4_2 = L1_2
    L3_2 = L1_2.deleteSelf
    L5_2 = false
    return L3_2(L4_2, L5_2)
  end
  L3_2 = loadModel
  L4_2 = joaat
  L5_2 = L2_2
  L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2 = L4_2(L5_2)
  L3_2 = L3_2(L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2)
  if not L3_2 then
    L4_2 = L1_2
    L3_2 = L1_2.deleteSelf
    L5_2 = false
    return L3_2(L4_2, L5_2)
  end
  L3_2 = CreateVehicle
  L4_2 = joaat
  L5_2 = L1_2.missionConfig
  L5_2 = L5_2.cargo_car
  L5_2 = L5_2.truck
  L4_2 = L4_2(L5_2)
  L5_2 = L1_2.missionConfig
  L5_2 = L5_2.cargo_car
  L5_2 = L5_2.coords
  L5_2 = L5_2.x
  L6_2 = L1_2.missionConfig
  L6_2 = L6_2.cargo_car
  L6_2 = L6_2.coords
  L6_2 = L6_2.y
  L7_2 = L1_2.missionConfig
  L7_2 = L7_2.cargo_car
  L7_2 = L7_2.coords
  L7_2 = L7_2.z
  L8_2 = L1_2.missionConfig
  L8_2 = L8_2.cargo_car
  L8_2 = L8_2.coords
  L8_2 = L8_2.w
  L9_2 = true
  L10_2 = false
  L3_2 = L3_2(L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2)
  L1_2.truck = L3_2
  L3_2 = FreezeEntityPosition
  L4_2 = L1_2.truck
  L5_2 = true
  L3_2(L4_2, L5_2)
  L3_2 = SetEntityInvincible
  L4_2 = L1_2.truck
  L5_2 = true
  L3_2(L4_2, L5_2)
  L3_2 = SetVehicleIsStolen
  L4_2 = L1_2.truck
  L5_2 = false
  L3_2(L4_2, L5_2)
  L3_2 = SetVehicleDoorsLocked
  L4_2 = L1_2.truck
  L5_2 = 2
  L3_2(L4_2, L5_2)
  L3_2 = SetVehicleDamageModifier
  L4_2 = L1_2.truck
  L5_2 = 0.0
  L3_2(L4_2, L5_2)
  L3_2 = SetEntityAsMissionEntity
  L4_2 = L1_2.truck
  L5_2 = true
  L6_2 = true
  L3_2(L4_2, L5_2, L6_2)
  L3_2 = SetVehicleOnGroundProperly
  L4_2 = L1_2.truck
  L3_2(L4_2)
  L3_2 = L1_2.truckStuff
  L4_2 = {}
  L5_2 = L1_2.truck
  L4_2.entity = L5_2
  L5_2 = NetworkGetNetworkIdFromEntity
  L6_2 = L1_2.truck
  L5_2 = L5_2(L6_2)
  L4_2.id = L5_2
  L3_2.truck = L4_2
  L3_2 = AddBlipForEntity
  L4_2 = L1_2.truck
  L3_2 = L3_2(L4_2)
  L1_2.truckBlip = L3_2
  L3_2 = SetBlipSprite
  L4_2 = L1_2.truckBlip
  L5_2 = 477
  L3_2(L4_2, L5_2)
  L3_2 = SetBlipColour
  L4_2 = L1_2.truckBlip
  L5_2 = 0
  L3_2(L4_2, L5_2)
  L3_2 = SetBlipScale
  L4_2 = L1_2.truckBlip
  L5_2 = 0.75
  L3_2(L4_2, L5_2)
  L3_2 = blips
  L4_2 = blips
  L4_2 = #L4_2
  L4_2 = L4_2 + 1
  L5_2 = L1_2.truckBlip
  L3_2[L4_2] = L5_2
  L3_2 = CreateVehicle
  L4_2 = joaat
  L5_2 = L1_2.missionConfig
  L5_2 = L5_2.cargo_car
  L5_2 = L5_2.trailer
  L4_2 = L4_2(L5_2)
  L5_2 = L1_2.missionConfig
  L5_2 = L5_2.cargo_car
  L5_2 = L5_2.coords
  L5_2 = L5_2.x
  L6_2 = L1_2.missionConfig
  L6_2 = L6_2.cargo_car
  L6_2 = L6_2.coords
  L6_2 = L6_2.y
  L7_2 = L1_2.missionConfig
  L7_2 = L7_2.cargo_car
  L7_2 = L7_2.coords
  L7_2 = L7_2.z
  L8_2 = L1_2.missionConfig
  L8_2 = L8_2.cargo_car
  L8_2 = L8_2.coords
  L8_2 = L8_2.w
  L9_2 = true
  L10_2 = false
  L3_2 = L3_2(L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2)
  L1_2.trailer = L3_2
  L3_2 = FreezeEntityPosition
  L4_2 = L1_2.trailer
  L5_2 = true
  L3_2(L4_2, L5_2)
  L3_2 = SetEntityCollision
  L4_2 = L1_2.trailer
  L5_2 = false
  L6_2 = false
  L3_2(L4_2, L5_2, L6_2)
  L3_2 = SetEntityInvincible
  L4_2 = L1_2.trailer
  L5_2 = true
  L3_2(L4_2, L5_2)
  L3_2 = AttachVehicleToTrailer
  L4_2 = L1_2.truck
  L5_2 = L1_2.trailer
  L6_2 = 10.0
  L3_2(L4_2, L5_2, L6_2)
  L3_2 = GetVehicleTrailerVehicle
  L4_2 = L1_2.truck
  L3_2, L4_2 = L3_2(L4_2)
  while L4_2 <= 0 do
    L5_2 = GetVehicleTrailerVehicle
    L6_2 = L1_2.truck
    L5_2, L6_2 = L5_2(L6_2)
    L4_2 = L6_2
    L3_2 = L5_2
    L5_2 = Wait
    L6_2 = 0
    L5_2(L6_2)
  end
  L5_2 = SetEntityAsMissionEntity
  L6_2 = L1_2.trailer
  L7_2 = true
  L8_2 = true
  L5_2(L6_2, L7_2, L8_2)
  L5_2 = SetVehicleOnGroundProperly
  L6_2 = L1_2.trailer
  L5_2(L6_2)
  L5_2 = SetEntityCollision
  L6_2 = L1_2.trailer
  L7_2 = true
  L8_2 = true
  L5_2(L6_2, L7_2, L8_2)
  L5_2 = L1_2.truckStuff
  L6_2 = {}
  L7_2 = L1_2.trailer
  L6_2.entity = L7_2
  L7_2 = NetworkGetNetworkIdFromEntity
  L8_2 = L1_2.trailer
  L7_2 = L7_2(L8_2)
  L6_2.id = L7_2
  L5_2.trailer = L6_2
  L5_2 = CreatePedInsideVehicle
  L6_2 = L1_2.truck
  L7_2 = 26
  L8_2 = L2_2
  L9_2 = -1
  L10_2 = true
  L11_2 = false
  L5_2 = L5_2(L6_2, L7_2, L8_2, L9_2, L10_2, L11_2)
  L1_2.trucker = L5_2
  L5_2 = SetEntityInvincible
  L6_2 = L1_2.trucker
  L7_2 = true
  L5_2(L6_2, L7_2)
  L5_2 = SetPedCombatAttributes
  L6_2 = L1_2.trucker
  L7_2 = 1
  L8_2 = true
  L5_2(L6_2, L7_2, L8_2)
  L5_2 = SetBlockingOfNonTemporaryEvents
  L6_2 = L1_2.trucker
  L7_2 = true
  L5_2(L6_2, L7_2)
  L5_2 = FreezeEntityPosition
  L6_2 = L1_2.trailer
  L7_2 = true
  L5_2(L6_2, L7_2)
  L5_2 = L1_2.truckStuff
  L6_2 = {}
  L7_2 = L1_2.trucker
  L6_2.entity = L7_2
  L7_2 = NetworkGetNetworkIdFromEntity
  L8_2 = L1_2.trucker
  L7_2 = L7_2(L8_2)
  L6_2.id = L7_2
  L5_2.trucker = L6_2
  L5_2 = 1
  L6_2 = L1_2.totalPacks
  L7_2 = 1
  for L8_2 = L5_2, L6_2, L7_2 do
    L10_2 = L1_2
    L9_2 = L1_2.createCargoProp
    L11_2 = L1_2.missionConfig
    L11_2 = L11_2.cargos
    L11_2 = L11_2[L8_2]
    L9_2 = L9_2(L10_2, L11_2)
    L10_2 = L1_2.packs
    L10_2[L8_2] = L9_2
    L10_2 = L1_2.dumyPacks
    L11_2 = {}
    L12_2 = L9_2.prop
    L11_2.entity = L12_2
    L12_2 = NetworkGetNetworkIdFromEntity
    L13_2 = L9_2.prop
    L12_2 = L12_2(L13_2)
    L11_2.id = L12_2
    L10_2[L8_2] = L11_2
  end
  L5_2 = TriggerServerEvent
  L6_2 = "wais:addProp:table"
  L7_2 = L1_2.truckStuff
  L5_2(L6_2, L7_2)
  L5_2 = TriggerServerEvent
  L6_2 = "wais:addProp:table"
  L7_2 = L1_2.dumyPacks
  L5_2(L6_2, L7_2)
  L5_2 = CreateThread
  function L6_2()
    local L0_3, L1_3, L2_3, L3_3, L4_3, L5_3
    while true do
      L0_3 = L1_2
      if not L0_3 then
        break
      end
      L0_3 = L1_2.deleted
      if L0_3 then
        break
      end
      L0_3 = 1000
      L1_3 = PlayerPedId
      L1_3 = L1_3()
      L2_3 = GetEntityCoords
      L3_3 = L1_3
      L2_3 = L2_3(L3_3)
      L3_3 = L1_2.missionConfig
      L3_3 = L3_3.area
      L3_3 = L2_3 - L3_3
      L3_3 = #L3_3
      L4_3 = L1_2.missionConfig
      L4_3 = L4_3.radius
      if L3_3 >= L4_3 then
        L4_3 = L1_2.warning
        if not L4_3 then
          L1_2.warning = true
          L4_3 = L1_2
          L5_3 = L4_3
          L4_3 = L4_3.warningAttempt
          L4_3(L5_3)
      end
      else
        L4_3 = L1_2.missionConfig
        L4_3 = L4_3.radius
        if L3_3 < L4_3 then
          L4_3 = L1_2.warning
          if L4_3 then
            L1_2.warning = false
          end
        end
      end
      L4_3 = Wait
      L5_3 = L0_3
      L4_3(L5_3)
    end
  end
  L5_2(L6_2)
  return L1_2
end
L1_1.CreateMission = L2_1
L1_1 = Cargos
function L2_1(A0_2, A1_2)
  local L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2
  L2_2 = loadModel
  L3_2 = joaat
  L4_2 = A1_2.prop
  L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2 = L3_2(L4_2)
  L2_2 = L2_2(L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2)
  if not L2_2 then
    return
  end
  L2_2 = {}
  L3_2 = A1_2.coords
  L2_2.coords = L3_2
  L3_2 = CreateObject
  L4_2 = joaat
  L5_2 = A1_2.prop
  L4_2 = L4_2(L5_2)
  L5_2 = L2_2.coords
  L5_2 = L5_2.x
  L6_2 = L2_2.coords
  L6_2 = L6_2.y
  L7_2 = L2_2.coords
  L7_2 = L7_2.z
  L8_2 = true
  L9_2 = true
  L10_2 = false
  L3_2 = L3_2(L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2)
  L2_2.prop = L3_2
  L2_2.deleted = nil
  L2_2.onTrailer = false
  L3_2 = AddBlipForEntity
  L4_2 = L2_2.prop
  L3_2 = L3_2(L4_2)
  L2_2.blip = L3_2
  L3_2 = SetBlipSprite
  L4_2 = L2_2.blip
  L5_2 = 501
  L3_2(L4_2, L5_2)
  L3_2 = SetBlipColour
  L4_2 = L2_2.blip
  L5_2 = 43
  L3_2(L4_2, L5_2)
  L3_2 = SetBlipScale
  L4_2 = L2_2.blip
  L5_2 = 0.5
  L3_2(L4_2, L5_2)
  L3_2 = SetEntityInvincible
  L4_2 = L2_2.prop
  L5_2 = true
  L3_2(L4_2, L5_2)
  L3_2 = PlaceObjectOnGroundProperly
  L4_2 = L2_2.prop
  L3_2(L4_2)
  L3_2 = SetEntityHeading
  L4_2 = L2_2.prop
  L5_2 = L2_2.coords
  L5_2 = L5_2.w
  L3_2(L4_2, L5_2)
  L3_2 = CreateThread
  function L4_2()
    local L0_3, L1_3, L2_3, L3_3, L4_3, L5_3, L6_3, L7_3, L8_3, L9_3, L10_3, L11_3, L12_3, L13_3, L14_3, L15_3, L16_3, L17_3, L18_3, L19_3, L20_3, L21_3, L22_3, L23_3, L24_3, L25_3, L26_3, L27_3, L28_3, L29_3, L30_3, L31_3, L32_3, L33_3, L34_3, L35_3, L36_3, L37_3, L38_3, L39_3, L40_3, L41_3, L42_3, L43_3, L44_3
    while true do
      L0_3 = L2_2
      if not L0_3 then
        break
      end
      L0_3 = L2_2.deleted
      if L0_3 then
        break
      end
      L0_3 = L2_2.onTrailer
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
      L4_3 = L2_2.prop
      L3_3 = L3_3(L4_3)
      L4_3 = L2_3 - L3_3
      L4_3 = #L4_3
      L5_3 = A0_2.missionConfig
      L5_3 = L5_3.area
      L5_3 = L3_3 - L5_3
      L5_3 = #L5_3
      if L4_3 <= 50.0 then
        L0_3 = 5
        L6_3 = DrawMarker
        L7_3 = 2
        L8_3 = L3_3.x
        L9_3 = L3_3.y
        L10_3 = L3_3.z
        L10_3 = L10_3 + 2.0
        L11_3 = 0
        L12_3 = 0
        L13_3 = 0
        L14_3 = 0
        L15_3 = -180
        L16_3 = 0
        L17_3 = 0.5
        L18_3 = 0.5
        L19_3 = 0.5
        L20_3 = 98
        L21_3 = 255
        L22_3 = 114
        L23_3 = 200
        L24_3 = true
        L25_3 = false
        L26_3 = 2
        L27_3 = false
        L28_3 = false
        L29_3 = false
        L30_3 = false
        L6_3(L7_3, L8_3, L9_3, L10_3, L11_3, L12_3, L13_3, L14_3, L15_3, L16_3, L17_3, L18_3, L19_3, L20_3, L21_3, L22_3, L23_3, L24_3, L25_3, L26_3, L27_3, L28_3, L29_3, L30_3)
        L6_3 = pairs
        L7_3 = A0_2.missionConfig
        L7_3 = L7_3.cargo_car
        L7_3 = L7_3.placeable_bones
        L6_3, L7_3, L8_3, L9_3 = L6_3(L7_3)
        for L10_3, L11_3 in L6_3, L7_3, L8_3, L9_3 do
          L12_3 = pairs
          L13_3 = L11_3
          L12_3, L13_3, L14_3, L15_3 = L12_3(L13_3)
          for L16_3, L17_3 in L12_3, L13_3, L14_3, L15_3 do
            L18_3 = GetOffsetFromEntityInWorldCoords
            L19_3 = A0_2.trailer
            L20_3 = L17_3.markerOffset
            L20_3 = L20_3.x
            L21_3 = L17_3.markerOffset
            L21_3 = L21_3.y
            L22_3 = L17_3.markerOffset
            L22_3 = L22_3.z
            L18_3 = L18_3(L19_3, L20_3, L21_3, L22_3)
            L19_3 = L18_3 - L3_3
            L19_3 = #L19_3
            L20_3 = DrawMarker
            L21_3 = 2
            L22_3 = L18_3.x
            L23_3 = L18_3.y
            L24_3 = L18_3.z
            L24_3 = L24_3 + 2.0
            L25_3 = 0
            L26_3 = 0
            L27_3 = 0
            L28_3 = 0
            L29_3 = -180
            L30_3 = 0
            L31_3 = 0.5
            L32_3 = 0.5
            L33_3 = 0.5
            L34_3 = 98
            L35_3 = 255
            L36_3 = 114
            L37_3 = 200
            L38_3 = true
            L39_3 = false
            L40_3 = 2
            L41_3 = false
            L42_3 = false
            L43_3 = false
            L44_3 = false
            L20_3(L21_3, L22_3, L23_3, L24_3, L25_3, L26_3, L27_3, L28_3, L29_3, L30_3, L31_3, L32_3, L33_3, L34_3, L35_3, L36_3, L37_3, L38_3, L39_3, L40_3, L41_3, L42_3, L43_3, L44_3)
            L20_3 = 0.75
            if L19_3 <= L20_3 then
              L20_3 = A0_2.placedPacks
              L20_3 = L20_3 + 1
              A0_2.placedPacks = L20_3
              L2_2.onTrailer = true
              L20_3 = GetEntityCoords
              L21_3 = A0_2.trailer
              L20_3 = L20_3(L21_3)
              L21_3 = DoesBlipExist
              L22_3 = L2_2.blip
              L21_3 = L21_3(L22_3)
              if L21_3 then
                L21_3 = RemoveBlip
                L22_3 = L2_2.blip
                L21_3(L22_3)
                L2_2.blip = nil
              end
              L21_3 = SetEntityCollision
              L22_3 = L2_2.prop
              L23_3 = false
              L24_3 = false
              L21_3(L22_3, L23_3, L24_3)
              L21_3 = SetEntityNoCollisionEntity
              L22_3 = L2_2.prop
              L23_3 = vehicle
              L24_3 = true
              L21_3(L22_3, L23_3, L24_3)
              L21_3 = SetEntityNoCollisionEntity
              L22_3 = vehicle
              L23_3 = L2_2.prop
              L24_3 = true
              L21_3(L22_3, L23_3, L24_3)
              L21_3 = SetEntityCompletelyDisableCollision
              L22_3 = L2_2.prop
              L23_3 = false
              L24_3 = false
              L21_3(L22_3, L23_3, L24_3)
              while true do
                L21_3 = GetEntityCollisionDisabled
                L22_3 = L2_2.prop
                L21_3 = L21_3(L22_3)
                if L21_3 then
                  break
                end
                L21_3 = Wait
                L22_3 = 250
                L21_3(L22_3)
              end
              L21_3 = AttachEntityToEntity
              L22_3 = L2_2.prop
              L23_3 = A0_2.trailer
              L24_3 = L10_3
              L25_3 = L17_3.attachOffset
              L25_3 = L25_3.x
              L26_3 = L17_3.attachOffset
              L26_3 = L26_3.y
              L27_3 = L17_3.attachOffset
              L27_3 = L27_3.z
              L28_3 = 0.0
              L29_3 = 0.0
              L30_3 = 0.0
              L31_3 = false
              L32_3 = true
              L33_3 = false
              L34_3 = false
              L35_3 = 1
              L36_3 = true
              L21_3(L22_3, L23_3, L24_3, L25_3, L26_3, L27_3, L28_3, L29_3, L30_3, L31_3, L32_3, L33_3, L34_3, L35_3, L36_3)
              while true do
                L21_3 = IsEntityAttachedToEntity
                L22_3 = L2_2.prop
                L23_3 = A0_2.trailer
                L21_3 = L21_3(L22_3, L23_3)
                if L21_3 then
                  break
                end
                L21_3 = AttachEntityToEntity
                L22_3 = L2_2.prop
                L23_3 = A0_2.trailer
                L24_3 = L10_3
                L25_3 = L17_3.attachOffset
                L25_3 = L25_3.x
                L26_3 = L17_3.attachOffset
                L26_3 = L26_3.y
                L27_3 = L17_3.attachOffset
                L27_3 = L27_3.z
                L28_3 = 0.0
                L29_3 = 0.0
                L30_3 = 0.0
                L31_3 = false
                L32_3 = true
                L33_3 = false
                L34_3 = false
                L35_3 = 1
                L36_3 = true
                L21_3(L22_3, L23_3, L24_3, L25_3, L26_3, L27_3, L28_3, L29_3, L30_3, L31_3, L32_3, L33_3, L34_3, L35_3, L36_3)
                L21_3 = Wait
                L22_3 = 1000
                L21_3(L22_3)
              end
              L21_3 = A0_2.totalPacks
              L22_3 = A0_2.placedPacks
              if L21_3 == L22_3 then
                L21_3 = A0_2
                L22_3 = L21_3
                L21_3 = L21_3.deleteSelf
                L23_3 = true
                L21_3(L22_3, L23_3)
              else
                L21_3 = Config
                L21_3 = L21_3.Notification
                L22_3 = Lang
                L23_3 = "job"
                L22_3 = L22_3(L23_3)
                L23_3 = Lang
                L24_3 = "cargo_attached_left"
                L25_3 = A0_2.totalPacks
                L26_3 = A0_2.placedPacks
                L25_3 = L25_3 - L26_3
                L23_3 = L23_3(L24_3, L25_3)
                L24_3 = "inform"
                L25_3 = 5000
                L21_3(L22_3, L23_3, L24_3, L25_3)
              end
            end
          end
        end
      end
      L6_3 = A0_2.missionConfig
      L6_3 = L6_3.radius
      if L5_3 >= L6_3 then
        L6_3 = SetEntityCoords
        L7_3 = L2_2.prop
        L8_3 = L2_2.coords
        L8_3 = L8_3.x
        L9_3 = L2_2.coords
        L9_3 = L9_3.y
        L10_3 = L2_2.coords
        L10_3 = L10_3.z
        L6_3(L7_3, L8_3, L9_3, L10_3)
      end
      L6_3 = Wait
      L7_3 = L0_3
      L6_3(L7_3)
    end
  end
  L3_2(L4_2)
  return L2_2
end
L1_1.createCargoProp = L2_1
L1_1 = Cargos
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
      L0_3 = A0_2.warning
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
      L3_3 = "go_back_load"
      L2_3 = L2_3(L3_3)
      L3_3 = "warning"
      L4_3 = nil
      L0_3(L1_3, L2_3, L3_3, L4_3)
      L0_3 = L1_2
      if L0_3 <= 0 then
        L0_3 = A0_2
        L1_3 = L0_3
        L0_3 = L0_3.deleteSelf
        L2_3 = false
        L0_3(L1_3, L2_3)
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
L1_1.warningAttempt = L2_1
L1_1 = Cargos
function L2_1(A0_2)
  local L1_2, L2_2, L3_2, L4_2, L5_2, L6_2, L7_2
  A0_2.warning = false
  L1_2 = TriggerServerEvent
  L2_2 = "wais:forklifter:delBusyIndex"
  L3_2 = A0_2.missionIndex
  L1_2(L2_2, L3_2)
  L1_2 = A0_2.timer
  L2_2 = L1_2
  L1_2 = L1_2.delete
  L1_2(L2_2)
  L1_2 = pairs
  L2_2 = A0_2.packs
  L1_2, L2_2, L3_2, L4_2 = L1_2(L2_2)
  for L5_2, L6_2 in L1_2, L2_2, L3_2, L4_2 do
    if L6_2 then
      L7_2 = L6_2.deleted
      if not L7_2 then
        L6_2.deleted = true
        L6_2 = nil
      end
    end
  end
  A0_2.deleted = true
  A0_2 = nil
end
L1_1.destroy = L2_1
L1_1 = Cargos
function L2_1(A0_2, A1_2)
  local L2_2, L3_2, L4_2, L5_2, L6_2
  if not A1_2 then
    L2_2 = TriggerServerEvent
    L3_2 = "wais:delete:Entitys"
    L2_2(L3_2)
    L3_2 = A0_2
    L2_2 = A0_2.destroy
    L2_2(L3_2)
    return
  end
  L2_2 = math
  L2_2 = L2_2.randomseed
  L3_2 = GetGameTimer
  L3_2, L4_2, L5_2, L6_2 = L3_2()
  L2_2(L3_2, L4_2, L5_2, L6_2)
  L2_2 = FreezeEntityPosition
  L3_2 = A0_2.truck
  L4_2 = false
  L2_2(L3_2, L4_2)
  L2_2 = FreezeEntityPosition
  L3_2 = A0_2.trailer
  L4_2 = false
  L2_2(L3_2, L4_2)
  L2_2 = Wait
  L3_2 = 1000
  L2_2(L3_2)
  L2_2 = TaskVehicleDriveWander
  L3_2 = A0_2.trucker
  L4_2 = A0_2.truck
  L5_2 = 20.0
  L6_2 = 786603
  L2_2(L3_2, L4_2, L5_2, L6_2)
  L2_2 = Config
  L2_2 = L2_2.Notification
  L3_2 = Lang
  L4_2 = "job"
  L3_2 = L3_2(L4_2)
  L4_2 = Lang
  L5_2 = "load_successful"
  L4_2 = L4_2(L5_2)
  L5_2 = "success"
  L6_2 = nil
  L2_2(L3_2, L4_2, L5_2, L6_2)
  L2_2 = math
  L2_2 = L2_2.random
  L3_2 = 10
  L4_2 = 17
  L2_2 = L2_2(L3_2, L4_2)
  L3_2 = SetTimeout
  L4_2 = L2_2 * 1000
  function L5_2()
    local L0_3, L1_3, L2_3, L3_3, L4_3, L5_3, L6_3
    L0_3 = calcuteDeductedMoney
    L1_3 = A0_2.timer
    L1_3 = L1_3.extraTimeEnabled
    L2_3 = A0_2.missionConfig
    L2_3 = L2_3.timer
    L2_3 = L2_3.mission_time
    L3_3 = formatNumberToMin
    L4_3 = A0_2.timer
    L5_3 = L4_3
    L4_3 = L4_3.getDuration
    L4_3, L5_3, L6_3 = L4_3(L5_3)
    L3_3 = L3_3(L4_3, L5_3, L6_3)
    L4_3 = A0_2.missionConfig
    L4_3 = L4_3.timer
    L4_3 = L4_3.deducted_per_min
    L0_3 = L0_3(L1_3, L2_3, L3_3, L4_3)
    L1_3 = TriggerServerEvent
    L2_3 = "wais:giveForklift:Reward"
    L3_3 = CurrentJob
    L4_3 = A0_2.missionIndex
    L5_3 = GetEntityCoords
    L6_3 = vehicle
    L5_3 = L5_3(L6_3)
    L6_3 = L0_3
    L1_3(L2_3, L3_3, L4_3, L5_3, L6_3)
    L1_3 = TriggerServerEvent
    L2_3 = "wais:delete:Entitys"
    L1_3(L2_3)
    currCargos = nil
    L1_3 = A0_2
    L2_3 = L1_3
    L1_3 = L1_3.destroy
    L1_3(L2_3)
    L1_3 = Config
    L1_3 = L1_3.JobSuccess
    L2_3 = CurrentJob
    L3_3 = nil
    L4_3 = nil
    L5_3 = nil
    L6_3 = nil
    L1_3(L2_3, L3_3, L4_3, L5_3, L6_3)
  end
  L3_2(L4_2, L5_2)
end
L1_1.deleteSelf = L2_1