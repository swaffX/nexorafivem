local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1
L0_1 = Config
L0_1 = L0_1.Jobs
L0_1 = L0_1.hunter
L1_1 = nil
InHuntingZone = false
ZoneIndex = L1_1
L1_1 = {}
L2_1 = false
L3_1 = nil
L4_1 = RegisterNetEvent
L5_1 = "wais:setDefault:JobThings"
function L6_1()
  local L0_2, L1_2
  L0_2 = nil
  InHuntingZone = false
  ZoneIndex = L0_2
  L0_2 = L2_1
  if L0_2 then
    L0_2 = TriggerServerEvent
    L1_2 = "wais:hunter:removeWeapon"
    L0_2(L1_2)
    L0_2 = false
    L2_1 = L0_2
  end
  L0_2 = {}
  anilmas = L0_2
end
L4_1(L5_1, L6_1)
L4_1 = RegisterNetEvent
L5_1 = "wais:hunter:group:addAnimal"
function L6_1(A0_2, A1_2, A2_2, A3_2, A4_2)
  local L5_2, L6_2, L7_2, L8_2, L9_2
  L5_2 = L1_1
  L6_2 = {}
  L6_2.model = A0_2
  L7_2 = NetToEnt
  L8_2 = A1_2
  L7_2 = L7_2(L8_2)
  L6_2.entity = L7_2
  L6_2.entityId = A1_2
  L6_2.zone = A3_2
  L6_2.index = A4_2
  if A2_2 then
    L7_2 = creasteAnimalBlip
    L8_2 = NetToEnt
    L9_2 = A1_2
    L8_2, L9_2 = L8_2(L9_2)
    L7_2 = L7_2(L8_2, L9_2)
    if L7_2 then
      goto lbl_22
    end
  end
  L7_2 = nil
  ::lbl_22::
  L6_2.blip = L7_2
  L5_2[A1_2] = L6_2
end
L4_1(L5_1, L6_1)
L4_1 = RegisterNetEvent
L5_1 = "wais:hunter:group:deleteAnimal"
function L6_1(A0_2)
  local L1_2, L2_2
  L1_2 = deleteAnimal
  L2_2 = A0_2
  L1_2(L2_2)
end
L4_1(L5_1, L6_1)
L4_1 = RegisterNetEvent
L5_1 = "wais:hunter:group:animalDead"
function L6_1(A0_2)
  local L1_2, L2_2
  L1_2 = L1_1
  L1_2 = L1_2[A0_2]
  if nil ~= L1_2 then
    L1_2 = changeAnimalState
    L2_2 = A0_2
    L1_2(L2_2)
  end
end
L4_1(L5_1, L6_1)
L4_1 = RegisterNetEvent
L5_1 = "wais:hunter:group:addWeaponTargetToVehicle"
function L6_1(A0_2)
  local L1_2, L2_2
  L1_2 = addWeaponTarget
  L2_2 = A0_2
  L1_2(L2_2)
end
L4_1(L5_1, L6_1)
L4_1 = AddEventHandler
L5_1 = "gameEventTriggered"
function L6_1(A0_2, A1_2)
  local L2_2, L3_2, L4_2, L5_2, L6_2, L7_2
  if "CEventNetworkEntityDamage" == A0_2 then
    L2_2 = A1_2[1]
    L3_2 = A1_2[6]
    if 1 == L3_2 then
      L3_2 = true
      if L3_2 then
        goto lbl_11
      end
    end
    L3_2 = false
    ::lbl_11::
    L4_2 = IsPedAPlayer
    L5_2 = L2_2
    L4_2 = L4_2(L5_2)
    if L4_2 then
      return
    end
    L4_2 = NetworkGetNetworkIdFromEntity
    L5_2 = L2_2
    L4_2 = L4_2(L5_2)
    L5_2 = L1_1
    L5_2 = L5_2[L4_2]
    if nil ~= L5_2 and L3_2 then
      L5_2 = Group
      L5_2 = L5_2.active
      if L5_2 then
        L5_2 = TriggerServerEvent
        L6_2 = "wais:hunter:group:animalDead"
        L7_2 = L4_2
        L5_2(L6_2, L7_2)
      else
        L5_2 = changeAnimalState
        L6_2 = L4_2
        L5_2(L6_2)
      end
    end
  end
end
L4_1(L5_1, L6_1)
function L4_1(A0_2)
  local L1_2, L2_2, L3_2, L4_2, L5_2
  L1_2 = math
  L1_2 = L1_2.randomseed
  L2_2 = GetGameTimer
  L2_2, L3_2, L4_2, L5_2 = L2_2()
  L1_2(L2_2, L3_2, L4_2, L5_2)
  ZoneIndex = A0_2
  InHuntingZone = true
  L1_2 = Config
  L1_2 = L1_2.Notification
  L2_2 = Lang
  L3_2 = "job"
  L2_2 = L2_2(L3_2)
  L3_2 = Lang
  L4_2 = "you_entered_hunting_zone"
  L3_2 = L3_2(L4_2)
  L4_2 = "success"
  L5_2 = 10000
  L1_2(L2_2, L3_2, L4_2, L5_2)
  L1_2 = LocalPlayer
  L1_2 = L1_2.state
  L1_2.isInHuntingZone = true
  L1_2 = CreateThread
  function L2_2()
    local L0_3, L1_3, L2_3, L3_3, L4_3, L5_3, L6_3, L7_3, L8_3, L9_3, L10_3, L11_3, L12_3, L13_3
    while true do
      L0_3 = L0_1.hunting_zones
      L1_3 = ZoneIndex
      L0_3 = L0_3[L1_3]
      L0_3 = L0_3.spawn_timer
      L1_3 = Wait
      L2_3 = L0_3
      L1_3(L2_3)
      L1_3 = InHuntingZone
      if not L1_3 then
        break
      end
      L1_3 = math
      L1_3 = L1_3.random
      L2_3 = 1
      L3_3 = L0_1.hunting_zones
      L4_3 = ZoneIndex
      L3_3 = L3_3[L4_3]
      L3_3 = L3_3.hunting_animals
      L3_3 = #L3_3
      L1_3 = L1_3(L2_3, L3_3)
      L2_3 = L0_1.hunting_zones
      L3_3 = ZoneIndex
      L2_3 = L2_3[L3_3]
      L2_3 = L2_3.hunting_animals
      L2_3 = L2_3[L1_3]
      L3_3 = joaat
      L4_3 = L2_3.model
      L3_3 = L3_3(L4_3)
      L4_3 = loadModel
      L5_3 = L3_3
      L4_3 = L4_3(L5_3)
      if not L4_3 then
        return
      end
      L4_3 = randomCoordsInRadius
      L5_3 = L0_1.hunting_zones
      L6_3 = ZoneIndex
      L5_3 = L5_3[L6_3]
      L5_3 = L5_3.zone
      L6_3 = L0_1.hunting_zones
      L7_3 = ZoneIndex
      L6_3 = L6_3[L7_3]
      L6_3 = L6_3.radius
      L4_3 = L4_3(L5_3, L6_3)
      L5_3 = CreatePed
      L6_3 = 4
      L7_3 = L3_3
      L8_3 = L4_3.x
      L9_3 = L4_3.y
      L10_3 = L4_3.z
      L11_3 = 0.0
      L12_3 = true
      L13_3 = false
      L5_3 = L5_3(L6_3, L7_3, L8_3, L9_3, L10_3, L11_3, L12_3, L13_3)
      L6_3 = SetBlockingOfNonTemporaryEvents
      L7_3 = L5_3
      L8_3 = true
      L6_3(L7_3, L8_3)
      L6_3 = SetEntityAsMissionEntity
      L7_3 = L5_3
      L8_3 = true
      L9_3 = true
      L6_3(L7_3, L8_3, L9_3)
      L6_3 = SetPedMoveRateOverride
      L7_3 = L5_3
      L8_3 = 1.0
      L6_3(L7_3, L8_3)
      L6_3 = L2_3.canAttack
      if L6_3 then
        L6_3 = TaskCombatPed
        L7_3 = L5_3
        L8_3 = PlayerPedId
        L8_3 = L8_3()
        L9_3 = 0
        L10_3 = 16
        L6_3(L7_3, L8_3, L9_3, L10_3)
        L6_3 = SetPedCombatAttributes
        L7_3 = L5_3
        L8_3 = 46
        L9_3 = true
        L6_3(L7_3, L8_3, L9_3)
        L6_3 = SetPedCombatAttributes
        L7_3 = L5_3
        L8_3 = 5
        L9_3 = true
        L6_3(L7_3, L8_3, L9_3)
        L6_3 = SetPedCombatMovement
        L7_3 = L5_3
        L8_3 = 2
        L6_3(L7_3, L8_3)
        L6_3 = SetPedFleeAttributes
        L7_3 = L5_3
        L8_3 = 0
        L9_3 = false
        L6_3(L7_3, L8_3, L9_3)
        L6_3 = SetPedRelationshipGroupHash
        L7_3 = L5_3
        L8_3 = joaat
        L9_3 = "HATES_PLAYER"
        L8_3, L9_3, L10_3, L11_3, L12_3, L13_3 = L8_3(L9_3)
        L6_3(L7_3, L8_3, L9_3, L10_3, L11_3, L12_3, L13_3)
        L6_3 = SetRelationshipBetweenGroups
        L7_3 = 5
        L8_3 = joaat
        L9_3 = "HATES_PLAYER"
        L8_3 = L8_3(L9_3)
        L9_3 = joaat
        L10_3 = "PLAYER"
        L9_3, L10_3, L11_3, L12_3, L13_3 = L9_3(L10_3)
        L6_3(L7_3, L8_3, L9_3, L10_3, L11_3, L12_3, L13_3)
        L6_3 = SetRelationshipBetweenGroups
        L7_3 = 5
        L8_3 = joaat
        L9_3 = "PLAYER"
        L8_3 = L8_3(L9_3)
        L9_3 = joaat
        L10_3 = "HATES_PLAYER"
        L9_3, L10_3, L11_3, L12_3, L13_3 = L9_3(L10_3)
        L6_3(L7_3, L8_3, L9_3, L10_3, L11_3, L12_3, L13_3)
      else
        L6_3 = TaskWanderStandard
        L7_3 = L5_3
        L8_3 = 1.0
        L9_3 = 10
        L6_3(L7_3, L8_3, L9_3)
      end
      L6_3 = Group
      L6_3 = L6_3.active
      if L6_3 then
        L6_3 = TriggerServerEvent
        L7_3 = "wais:hunter:group:addAnimal"
        L8_3 = L3_3
        L9_3 = NetworkGetNetworkIdFromEntity
        L10_3 = L5_3
        L9_3 = L9_3(L10_3)
        L10_3 = L2_3.addBlipAnimal
        L11_3 = A0_2
        L12_3 = L1_3
        L6_3(L7_3, L8_3, L9_3, L10_3, L11_3, L12_3)
      else
        L6_3 = props
        L7_3 = props
        L7_3 = #L7_3
        L7_3 = L7_3 + 1
        L6_3[L7_3] = L5_3
        L6_3 = NetworkGetNetworkIdFromEntity
        L7_3 = L5_3
        L6_3 = L6_3(L7_3)
        L7_3 = L1_1
        L8_3 = {}
        L8_3.model = L3_3
        L8_3.entity = L5_3
        L9_3 = NetworkGetNetworkIdFromEntity
        L10_3 = L5_3
        L9_3 = L9_3(L10_3)
        L8_3.entityId = L9_3
        L9_3 = L2_3.addBlipAnimal
        if L9_3 then
          L9_3 = creasteAnimalBlip
          L10_3 = L5_3
          L9_3 = L9_3(L10_3)
          if L9_3 then
            goto lbl_168
          end
        end
        L9_3 = nil
        ::lbl_168::
        L8_3.blip = L9_3
        L9_3 = A0_2
        L8_3.zone = L9_3
        L8_3.index = L1_3
        L9_3 = GetGameTimer
        L9_3 = L9_3()
        L8_3.createdTime = L9_3
        L7_3[L6_3] = L8_3
        L6_3 = TriggerServerEvent
        L7_3 = "wais:addProp"
        L8_3 = L5_3
        L9_3 = NetworkGetNetworkIdFromEntity
        L10_3 = L5_3
        L9_3, L10_3, L11_3, L12_3, L13_3 = L9_3(L10_3)
        L6_3(L7_3, L8_3, L9_3, L10_3, L11_3, L12_3, L13_3)
      end
    end
  end
  L1_2(L2_2)
end
function L5_1(A0_2)
  local L1_2, L2_2
  ZoneIndex = nil
  InHuntingZone = false
  L1_2 = LocalPlayer
  L1_2 = L1_2.state
  L1_2.isInHuntingZone = false
  L1_2 = L2_1
  if L1_2 then
    L1_2 = TriggerServerEvent
    L2_2 = "wais:hunter:removeWeapon"
    L1_2(L2_2)
    L1_2 = false
    L2_1 = L1_2
  end
end
function L6_1(A0_2)
  local L1_2, L2_2, L3_2, L4_2
  L1_2 = AddBlipForEntity
  L2_2 = A0_2
  L1_2 = L1_2(L2_2)
  L2_2 = SetBlipSprite
  L3_2 = L1_2
  L4_2 = 141
  L2_2(L3_2, L4_2)
  L2_2 = SetBlipColour
  L3_2 = L1_2
  L4_2 = 5
  L2_2(L3_2, L4_2)
  L2_2 = SetBlipScale
  L3_2 = L1_2
  L4_2 = 0.7
  L2_2(L3_2, L4_2)
  L2_2 = SetBlipAsShortRange
  L3_2 = L1_2
  L4_2 = true
  L2_2(L3_2, L4_2)
  L2_2 = BeginTextCommandSetBlipName
  L3_2 = "STRING"
  L2_2(L3_2)
  L2_2 = AddTextComponentString
  L3_2 = Lang
  L4_2 = "hunting_animal"
  L3_2, L4_2 = L3_2(L4_2)
  L2_2(L3_2, L4_2)
  L2_2 = EndTextCommandSetBlipName
  L3_2 = L1_2
  L2_2(L3_2)
  return L1_2
end
creasteAnimalBlip = L6_1
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
          L5_3 = "hunter"
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
    L2_2 = "[^2INFO^7] Hunter Job Center has been initialized."
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
      L3_2 = "[^2INFO^7] Hunter Job Center Blip has been initialized."
      L2_2(L3_2)
    end
  end
  L1_2 = points
  L2_2 = points
  L2_2 = #L2_2
  L2_2 = L2_2 + 1
  L1_2[L2_2] = L0_2
  L1_2 = pairs
  L2_2 = L0_1.hunting_zones
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
      L0_3 = L4_1
      L1_3 = L5_2
      L0_3(L1_3)
    end
    L8_2.onEnter = L9_2
    function L9_2()
      local L0_3, L1_3
      L0_3 = L5_1
      L1_3 = L5_2
      L0_3(L1_3)
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
initHunter = L6_1
function L6_1(A0_2)
  local L1_2, L2_2, L3_2
  L1_2 = L1_1
  L1_2 = L1_2[A0_2]
  if nil ~= L1_2 then
    L1_2 = L1_1
    L1_2 = L1_2[A0_2]
    L1_2 = L1_2.entity
    L2_2 = DoesEntityExist
    L3_2 = L1_2
    L2_2 = L2_2(L3_2)
    if L2_2 then
      L2_2 = DeleteEntity
      L3_2 = L1_2
      L2_2(L3_2)
    end
    L2_2 = L1_1
    L2_2 = L2_2[A0_2]
    L2_2 = L2_2.blip
    if nil ~= L2_2 then
      L2_2 = RemoveBlip
      L3_2 = L1_1
      L3_2 = L3_2[A0_2]
      L3_2 = L3_2.blip
      L2_2(L3_2)
    end
    L2_2 = L1_1
    L2_2[A0_2] = nil
  end
end
deleteAnimal = L6_1
function L6_1(A0_2)
  local L1_2, L2_2, L3_2, L4_2, L5_2, L6_2
  L1_2 = SetBlipSprite
  L2_2 = L1_1
  L2_2 = L2_2[A0_2]
  L2_2 = L2_2.blip
  L3_2 = 274
  L1_2(L2_2, L3_2)
  L1_2 = BeginTextCommandSetBlipName
  L2_2 = "STRING"
  L1_2(L2_2)
  L1_2 = AddTextComponentString
  L2_2 = Lang
  L3_2 = "dead_hunt"
  L2_2, L3_2, L4_2, L5_2, L6_2 = L2_2(L3_2)
  L1_2(L2_2, L3_2, L4_2, L5_2, L6_2)
  L1_2 = EndTextCommandSetBlipName
  L2_2 = L1_1
  L2_2 = L2_2[A0_2]
  L2_2 = L2_2.blip
  L1_2(L2_2)
  L1_2 = AddTargetEntity
  L2_2 = L1_1
  L2_2 = L2_2[A0_2]
  L2_2 = L2_2.entity
  L3_2 = {}
  L4_2 = {}
  L4_2.icon = "fa-solid fa-boxes-stacked"
  L5_2 = Lang
  L6_2 = "collect_animal_carcass"
  L5_2 = L5_2(L6_2)
  L4_2.label = L5_2
  function L5_2()
    local L0_3, L1_3, L2_3, L3_3, L4_3, L5_3, L6_3
    L0_3 = A0_2
    L3_1 = L0_3
    L0_3 = Group
    L0_3 = L0_3.active
    if L0_3 then
      L0_3 = TriggerServerEvent
      L1_3 = "wais:hunter:collectingAnimal"
      L2_3 = A0_2
      L0_3(L1_3, L2_3)
    end
    L0_3 = lib
    L0_3 = L0_3.progressBar
    L1_3 = {}
    L1_3.duration = 7500
    L2_3 = Lang
    L3_3 = "collecting_animal_carcass"
    L2_3 = L2_3(L3_3)
    L1_3.label = L2_3
    L1_3.useWhileDead = false
    L1_3.canCancel = true
    L2_3 = {}
    L2_3.dict = "amb@medic@standing@tendtodead@idle_a"
    L2_3.clip = "idle_a"
    L1_3.anim = L2_3
    L2_3 = {}
    L2_3.car = true
    L2_3.move = true
    L2_3.combat = true
    L1_3.disable = L2_3
    L0_3 = L0_3(L1_3)
    if L0_3 then
      L0_3 = Config
      L0_3 = L0_3.JobSuccess
      L1_3 = CurrentJob
      L2_3 = L0_1.hunting_zones
      L4_3 = A0_2
      L3_3 = L1_1
      L3_3 = L3_3[L4_3]
      L3_3 = L3_3.zone
      L2_3 = L2_3[L3_3]
      L2_3 = L2_3.hunting_animals
      L4_3 = A0_2
      L3_3 = L1_1
      L3_3 = L3_3[L4_3]
      L3_3 = L3_3.index
      L2_3 = L2_3[L3_3]
      L2_3 = L2_3.reward
      L3_3 = {}
      L5_3 = A0_2
      L4_3 = L1_1
      L4_3 = L4_3[L5_3]
      L4_3 = L4_3.zone
      L3_3.zone = L4_3
      L5_3 = A0_2
      L4_3 = L1_1
      L4_3 = L4_3[L5_3]
      L4_3 = L4_3.index
      L3_3.animalIndex = L4_3
      L4_3 = nil
      L0_3(L1_3, L2_3, L3_3, L4_3)
      L0_3 = TriggerServerEvent
      L1_3 = "wais:hunter:giveReward"
      L2_3 = CurrentJob
      L3_3 = A0_2
      L5_3 = A0_2
      L4_3 = L1_1
      L4_3 = L4_3[L5_3]
      L4_3 = L4_3.zone
      L6_3 = A0_2
      L5_3 = L1_1
      L5_3 = L5_3[L6_3]
      L5_3 = L5_3.index
      L0_3(L1_3, L2_3, L3_3, L4_3, L5_3)
      L0_3 = Group
      L0_3 = L0_3.active
      if not L0_3 then
        L0_3 = deleteAnimal
        L1_3 = A0_2
        L0_3(L1_3)
        L0_3 = TriggerServerEvent
        L1_3 = "wais:deleteProp:Id"
        L2_3 = A0_2
        L0_3(L1_3, L2_3)
      else
        L0_3 = TriggerServerEvent
        L1_3 = "wais:hunter:deleteCollected"
        L2_3 = A0_2
        L0_3(L1_3, L2_3)
      end
      L0_3 = nil
      L3_1 = L0_3
    else
      L0_3 = Config
      L0_3 = L0_3.Notification
      L1_3 = Lang
      L2_3 = "job"
      L1_3 = L1_3(L2_3)
      L2_3 = Lang
      L3_3 = "collecting_canceled"
      L2_3 = L2_3(L3_3)
      L3_3 = "error"
      L4_3 = nil
      L0_3(L1_3, L2_3, L3_3, L4_3)
      L0_3 = nil
      L3_1 = L0_3
      L0_3 = Group
      L0_3 = L0_3.active
      if L0_3 then
        L0_3 = TriggerServerEvent
        L1_3 = "wais:hunter:deleteCollected"
        L2_3 = A0_2
        L0_3(L1_3, L2_3)
      end
    end
  end
  L4_2.action = L5_2
  L3_2[1] = L4_2
  L4_2 = true
  L5_2 = 3.0
  L1_2(L2_2, L3_2, L4_2, L5_2)
end
changeAnimalState = L6_1
function L6_1()
  local L0_2, L1_2, L2_2, L3_2
  L0_2 = Group
  L0_2 = L0_2.active
  if L0_2 then
    L0_2 = TriggerServerEvent
    L1_2 = "wais:hunter:group:addWeaponTargetToVehicle"
    L2_2 = NetworkGetNetworkIdFromEntity
    L3_2 = vehicle
    L2_2, L3_2 = L2_2(L3_2)
    L0_2(L1_2, L2_2, L3_2)
  else
    L0_2 = addWeaponTarget
    L1_2 = NetworkGetNetworkIdFromEntity
    L2_2 = vehicle
    L1_2, L2_2, L3_2 = L1_2(L2_2)
    L0_2(L1_2, L2_2, L3_2)
  end
end
initHunterWeapons = L6_1
function L6_1(A0_2)
  local L1_2, L2_2, L3_2, L4_2, L5_2, L6_2
  L1_2 = AddTargetEntity
  L2_2 = NetToEnt
  L3_2 = A0_2
  L2_2 = L2_2(L3_2)
  L3_2 = {}
  L4_2 = {}
  L4_2.icon = "fa-solid fa-gun"
  L5_2 = Lang
  L6_2 = "take_hunting_weapon"
  L5_2 = L5_2(L6_2)
  L4_2.label = L5_2
  function L5_2()
    local L0_3, L1_3, L2_3, L3_3, L4_3
    L0_3 = L2_1
    if L0_3 then
      L0_3 = Config
      L0_3 = L0_3.Notification
      L1_3 = Lang
      L2_3 = "job"
      L1_3 = L1_3(L2_3)
      L2_3 = Lang
      L3_3 = "already_taked_hunting_weapons"
      L2_3 = L2_3(L3_3)
      L3_3 = "error"
      L4_3 = nil
      return L0_3(L1_3, L2_3, L3_3, L4_3)
    end
    L0_3 = InHuntingZone
    if not L0_3 then
      L0_3 = Config
      L0_3 = L0_3.Notification
      L1_3 = Lang
      L2_3 = "job"
      L1_3 = L1_3(L2_3)
      L2_3 = Lang
      L3_3 = "not_in_hunting_zone"
      L2_3 = L2_3(L3_3)
      L3_3 = "error"
      L4_3 = nil
      return L0_3(L1_3, L2_3, L3_3, L4_3)
    end
    L0_3 = TriggerServerEvent
    L1_3 = "wais:hunter:giveWeapon"
    L2_3 = CurrentJob
    L3_3 = ZoneIndex
    L4_3 = A0_2
    L0_3(L1_3, L2_3, L3_3, L4_3)
    L0_3 = true
    L2_1 = L0_3
  end
  L4_2.action = L5_2
  L3_2[1] = L4_2
  L4_2 = true
  L5_2 = 3.0
  L1_2(L2_2, L3_2, L4_2, L5_2)
end
addWeaponTarget = L6_1
function L6_1()
  local L0_2, L1_2
  L0_2 = L2_1
  if L0_2 then
    L0_2 = TriggerServerEvent
    L1_2 = "wais:hunter:removeWeapon"
    L0_2(L1_2)
    L0_2 = false
    L2_1 = L0_2
  end
end
checkMusketTaken = L6_1
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
    if "hunter" == L3_2 then
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
L6_1(L7_1)
L6_1 = CreateThread
function L7_1()
  local L0_2, L1_2, L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2
  while true do
    L0_2 = PlayerPedId
    L0_2 = L0_2()
    L1_2 = 1000
    L2_2 = CurrentJob
    if "hunter" == L2_2 then
      L2_2 = next
      L3_2 = L1_1
      L2_2 = L2_2(L3_2)
      if nil ~= L2_2 then
        L2_2 = Group
        L2_2 = L2_2.active
        if not L2_2 then
          L2_2 = pairs
          L3_2 = L1_1
          L2_2, L3_2, L4_2, L5_2 = L2_2(L3_2)
          for L6_2, L7_2 in L2_2, L3_2, L4_2, L5_2 do
            L8_2 = L7_2.entity
            L9_2 = GetEntityCoords
            L10_2 = L8_2
            L9_2 = L9_2(L10_2)
            L10_2 = L0_1.hunting_zones
            L11_2 = L7_2.zone
            L10_2 = L10_2[L11_2]
            L10_2 = L10_2.zone
            L10_2 = L9_2 - L10_2
            L10_2 = #L10_2
            L11_2 = L0_1.hunting_zones
            L12_2 = L7_2.zone
            L11_2 = L11_2[L12_2]
            L11_2 = L11_2.radius
            if L10_2 >= L11_2 then
              L11_2 = deleteAnimal
              L12_2 = L6_2
              L11_2(L12_2)
            else
              L11_2 = L7_2.entity
              L12_2 = L7_2.entityId
              L13_2 = L3_1
              if L12_2 ~= L13_2 then
                L12_2 = GetGameTimer
                L12_2 = L12_2()
                L13_2 = L7_2.createdTime
                L13_2 = L12_2 - L13_2
                L14_2 = L0_1.hunting_zones
                L15_2 = L7_2.zone
                L14_2 = L14_2[L15_2]
                L14_2 = L14_2.deleteAfter
                if L13_2 >= L14_2 then
                  L13_2 = deleteAnimal
                  L14_2 = L6_2
                  L13_2(L14_2)
                end
              end
            end
          end
        end
      end
    end
    L2_2 = Wait
    L3_2 = L1_2
    L2_2(L3_2)
  end
end
L6_1(L7_1)
L6_1 = CreateThread
function L7_1()
  local L0_2, L1_2, L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2, L20_2, L21_2, L22_2, L23_2, L24_2, L25_2, L26_2, L27_2, L28_2, L29_2, L30_2, L31_2, L32_2, L33_2, L34_2, L35_2
  while true do
    L0_2 = PlayerPedId
    L0_2 = L0_2()
    L1_2 = 1000
    L2_2 = CurrentJob
    if "hunter" == L2_2 then
      L2_2 = next
      L3_2 = L1_1
      L2_2 = L2_2(L3_2)
      if nil ~= L2_2 then
        L2_2 = Group
        L2_2 = L2_2.active
        if not L2_2 then
          L2_2 = pairs
          L3_2 = L1_1
          L2_2, L3_2, L4_2, L5_2 = L2_2(L3_2)
          for L6_2, L7_2 in L2_2, L3_2, L4_2, L5_2 do
            L8_2 = L7_2.entity
            L9_2 = GetEntityCoords
            L10_2 = L8_2
            L9_2 = L9_2(L10_2)
            L10_2 = GetEntityCoords
            L11_2 = L0_2
            L10_2 = L10_2(L11_2)
            L10_2 = L9_2 - L10_2
            L10_2 = #L10_2
            if L10_2 <= 25.0 then
              L1_2 = 5
              L11_2 = DrawMarker
              L12_2 = 0
              L13_2 = L9_2.x
              L14_2 = L9_2.y
              L15_2 = L9_2.z
              L15_2 = L15_2 + 2.0
              L16_2 = 0
              L17_2 = 0
              L18_2 = 0
              L19_2 = 0
              L20_2 = 0
              L21_2 = 0
              L22_2 = 0.5
              L23_2 = 0.5
              L24_2 = 0.5
              L25_2 = 255
              L26_2 = 255
              L27_2 = 0
              L28_2 = 125
              L29_2 = true
              L30_2 = false
              L31_2 = 2
              L32_2 = false
              L33_2 = false
              L34_2 = false
              L35_2 = false
              L11_2(L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2, L20_2, L21_2, L22_2, L23_2, L24_2, L25_2, L26_2, L27_2, L28_2, L29_2, L30_2, L31_2, L32_2, L33_2, L34_2, L35_2)
            end
          end
        end
      end
    end
    L2_2 = Wait
    L3_2 = L1_2
    L2_2(L3_2)
  end
end
L6_1(L7_1)