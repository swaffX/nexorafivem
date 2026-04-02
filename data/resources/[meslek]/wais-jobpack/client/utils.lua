local L0_1, L1_1
function L0_1(A0_2)
  local L1_2, L2_2, L3_2, L4_2, L5_2, L6_2
  L1_2 = math
  L1_2 = L1_2.floor
  L2_2 = A0_2 / 60000
  L1_2 = L1_2(L2_2)
  L2_2 = math
  L2_2 = L2_2.floor
  L3_2 = A0_2 % 60000
  L3_2 = L3_2 / 1000
  L2_2 = L2_2(L3_2)
  L3_2 = Lang
  L4_2 = "format_min_sec"
  L5_2 = math
  L5_2 = L5_2.floor
  L6_2 = L1_2
  L5_2 = L5_2(L6_2)
  L6_2 = L2_2
  return L3_2(L4_2, L5_2, L6_2)
end
formatNumberToMinSec = L0_1
function L0_1(A0_2)
  local L1_2, L2_2
  L1_2 = math
  L1_2 = L1_2.floor
  L2_2 = A0_2 / 60000
  L1_2 = L1_2(L2_2)
  return L1_2
end
formatNumberToMin = L0_1
function L0_1()
  local L0_2, L1_2, L2_2, L3_2
  L0_2 = isDead
  if L0_2 then
    return
  end
  L0_2 = lib
  L0_2 = L0_2.showTextUI
  L1_2 = Lang
  L2_2 = "open_job_menu"
  L1_2 = L1_2(L2_2)
  L2_2 = {}
  L2_2.position = "left-center"
  L2_2.icon = "user-tie"
  L3_2 = {}
  L3_2.color = "white"
  L2_2.style = L3_2
  L0_2(L1_2, L2_2)
end
showJobMenuTextUI = L0_1
function L0_1()
  local L0_2, L1_2
  L0_2 = lib
  L0_2 = L0_2.hideTextUI
  L0_2()
  L0_2 = lib
  L0_2 = L0_2.hideContext
  L0_2()
end
exitJobMenuPoint = L0_1
function L0_1(A0_2, A1_2)
  local L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2
  L2_2 = Config
  L2_2 = L2_2.Jobs
  L2_2 = L2_2[A0_2]
  L2_2 = L2_2.debug
  L3_2 = Config
  L3_2 = L3_2.Jobs
  L3_2 = L3_2[A0_2]
  L3_2 = L3_2.car_settings
  if nil ~= A1_2 then
    L3_2.spawnCoords = A1_2
  end
  L4_2 = joaat
  L5_2 = L3_2.model
  L4_2 = L4_2(L5_2)
  L5_2 = loadModel
  L6_2 = L4_2
  L5_2 = L5_2(L6_2)
  if not L5_2 then
    L5_2 = false
    return L5_2
  end
  if L2_2 then
    L5_2 = print
    L6_2 = "[^2INFO^7] Model has been loaded."
    L5_2(L6_2)
  end
  L5_2 = lib
  L5_2 = L5_2.getClosestVehicle
  L6_2 = vector3
  L7_2 = L3_2.spawnCoords
  L7_2 = L7_2.x
  L8_2 = L3_2.spawnCoords
  L8_2 = L8_2.y
  L9_2 = L3_2.spawnCoords
  L9_2 = L9_2.z
  L6_2 = L6_2(L7_2, L8_2, L9_2)
  L7_2 = 2.0
  L8_2 = true
  L5_2 = L5_2(L6_2, L7_2, L8_2)
  if L5_2 then
    L6_2 = Config
    L6_2 = L6_2.Notification
    L7_2 = Lang
    L8_2 = "job"
    L7_2 = L7_2(L8_2)
    L8_2 = Lang
    L9_2 = "car_spawn_blocked"
    L10_2 = L3_2.model
    L8_2 = L8_2(L9_2, L10_2)
    L9_2 = "warning"
    L10_2 = nil
    L6_2(L7_2, L8_2, L9_2, L10_2)
    L6_2 = false
    return L6_2
  end
  if L2_2 then
    L6_2 = print
    L7_2 = "[^2INFO^7] Area is clear."
    L6_2(L7_2)
  end
  L6_2 = CreateVehicle
  L7_2 = L4_2
  L8_2 = L3_2.spawnCoords
  L8_2 = L8_2.x
  L9_2 = L3_2.spawnCoords
  L9_2 = L9_2.y
  L10_2 = L3_2.spawnCoords
  L10_2 = L10_2.z
  L11_2 = L3_2.spawnCoords
  L11_2 = L11_2.w
  L12_2 = true
  L13_2 = false
  L6_2 = L6_2(L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2)
  vehicle = L6_2
  L6_2 = NetworkGetNetworkIdFromEntity
  L7_2 = vehicle
  L6_2 = L6_2(L7_2)
  while true do
    L7_2 = DoesEntityExist
    L8_2 = vehicle
    L7_2 = L7_2(L8_2)
    if L7_2 then
      break
    end
    L7_2 = Wait
    L8_2 = 0
    L7_2(L8_2)
  end
  while true do
    L7_2 = NetworkDoesNetworkIdExist
    L8_2 = L6_2
    L7_2 = L7_2(L8_2)
    if L7_2 then
      break
    end
    L7_2 = Wait
    L8_2 = 0
    L7_2(L8_2)
  end
  L7_2 = SetNetworkIdCanMigrate
  L8_2 = L6_2
  L9_2 = true
  L7_2(L8_2, L9_2)
  L7_2 = SetEntityAsMissionEntity
  L8_2 = vehicle
  L9_2 = true
  L10_2 = false
  L7_2(L8_2, L9_2, L10_2)
  L7_2 = SetVehicleHasBeenOwnedByPlayer
  L8_2 = vehicle
  L9_2 = true
  L7_2(L8_2, L9_2)
  L7_2 = SetVehicleNeedsToBeHotwired
  L8_2 = vehicle
  L9_2 = false
  L7_2(L8_2, L9_2)
  L7_2 = SetModelAsNoLongerNeeded
  L8_2 = L4_2
  L7_2(L8_2)
  L7_2 = SetVehRadioStation
  L8_2 = vehicle
  L9_2 = "OFF"
  L7_2(L8_2, L9_2)
  L7_2 = RequestCollisionAtCoord
  L8_2 = vector3
  L9_2 = L3_2.spawnCoords
  L9_2 = L9_2.x
  L10_2 = L3_2.spawnCoords
  L10_2 = L10_2.y
  L11_2 = L3_2.spawnCoords
  L11_2 = L11_2.z
  L8_2, L9_2, L10_2, L11_2, L12_2, L13_2 = L8_2(L9_2, L10_2, L11_2)
  L7_2(L8_2, L9_2, L10_2, L11_2, L12_2, L13_2)
  while true do
    L7_2 = HasCollisionLoadedAroundEntity
    L8_2 = vehicle
    L7_2 = L7_2(L8_2)
    if L7_2 then
      break
    end
    L7_2 = Wait
    L8_2 = 0
    L7_2(L8_2)
  end
  L7_2 = SetPedIntoVehicle
  L8_2 = PlayerPedId
  L8_2 = L8_2()
  L9_2 = vehicle
  L10_2 = -1
  L7_2(L8_2, L9_2, L10_2)
  L7_2 = Config
  L7_2 = L7_2.VehicleCreated
  L8_2 = vehicle
  L9_2 = GetVehicleNumberPlateText
  L10_2 = vehicle
  L9_2, L10_2, L11_2, L12_2, L13_2 = L9_2(L10_2)
  L7_2(L8_2, L9_2, L10_2, L11_2, L12_2, L13_2)
  L7_2 = TriggerServerEvent
  L8_2 = "wais:outJob:car"
  L9_2 = vehicle
  L10_2 = L6_2
  L7_2(L8_2, L9_2, L10_2)
  if L2_2 then
    L7_2 = print
    L8_2 = "[^2INFO^7] Vehicle has been created. EntityId: %s - NetworkId: %s"
    L9_2 = L8_2
    L8_2 = L8_2.format
    L10_2 = vehicle
    L11_2 = L6_2
    L8_2, L9_2, L10_2, L11_2, L12_2, L13_2 = L8_2(L9_2, L10_2, L11_2)
    L7_2(L8_2, L9_2, L10_2, L11_2, L12_2, L13_2)
  end
  if "pizza_delivery" == A0_2 then
    L7_2 = AddTargetEntity
    L8_2 = vehicle
    L9_2 = {}
    L10_2 = {}
    L11_2 = Lang
    L12_2 = "take_delivery_boot"
    L11_2 = L11_2(L12_2)
    L10_2.name = L11_2
    L10_2.icon = "fa-solid fa-box"
    L11_2 = Lang
    L12_2 = "take_delivery_boot"
    L11_2 = L11_2(L12_2)
    L10_2.label = L11_2
    function L11_2(A0_3)
      local L1_3, L2_3, L3_3
      L1_3 = target
      if "ox" == L1_3 then
        L1_3 = A0_3.entity
        if L1_3 then
          goto lbl_8
        end
      end
      L1_3 = A0_3
      ::lbl_8::
      L2_3 = createPizzaProp
      L3_3 = L1_3
      L2_3(L3_3)
    end
    L10_2.action = L11_2
    L9_2[1] = L10_2
    L10_2 = true
    L11_2 = 3.0
    L7_2(L8_2, L9_2, L10_2, L11_2)
    L7_2 = setRandomPizzeria
    L7_2()
  elseif "news_delivery" == A0_2 then
    L7_2 = TriggerServerEvent
    L8_2 = "wais:giveAcidPackage"
    L7_2(L8_2)
    L7_2 = SetVehicleLivery
    L8_2 = vehicle
    L9_2 = Config
    L9_2 = L9_2.Jobs
    L9_2 = L9_2[A0_2]
    L9_2 = L9_2.car_settings
    L9_2 = L9_2.liveryIndex
    L7_2(L8_2, L9_2)
    L7_2 = createNewsDeliveryThings
    L7_2()
  elseif "forklifter" == A0_2 then
  elseif "gardener" == A0_2 then
    L7_2 = createGardenerThings
    L7_2()
  elseif "trucker" == A0_2 then
    L7_2 = vehicle
    truckerVehicle = L7_2
  elseif "roadhelper" == A0_2 then
    L7_2 = createAttachableHelperThings
    L7_2()
  elseif "bus_driver" == A0_2 then
  elseif "fire_department" == A0_2 then
  elseif "hunter" == A0_2 then
    L7_2 = initHunterWeapons
    L7_2()
  elseif "detectorist" == A0_2 then
    L7_2 = addMetalDetectorToVehicle
    L7_2()
  end
  L7_2 = true
  return L7_2
end
spawnJobCar = L0_1
function L0_1(A0_2, A1_2)
  local L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2
  L2_2 = isDead
  if L2_2 then
    return
  end
  L2_2 = multiplayerMenus
  L3_2 = A0_2
  L4_2 = A1_2
  L2_2(L3_2, L4_2)
  L2_2 = {}
  L3_2 = {}
  L4_2 = Lang
  L5_2 = "take_outfit"
  L4_2 = L4_2(L5_2)
  L3_2.title = L4_2
  L4_2 = Lang
  L5_2 = "take_outfit_desc"
  L4_2 = L4_2(L5_2)
  L3_2.description = L4_2
  L3_2.icon = "shirt"
  function L4_2()
    local L0_3, L1_3, L2_3, L3_3, L4_3, L5_3, L6_3
    L0_3 = PlayerPedId
    L0_3 = L0_3()
    L1_3 = GetEntityModel
    L2_3 = L0_3
    L1_3 = L1_3(L2_3)
    L2_3 = joaat
    L3_3 = "mp_m_freemode_01"
    L2_3 = L2_3(L3_3)
    if L1_3 == L2_3 then
      L2_3 = "male"
      if L2_3 then
        goto lbl_15
      end
    end
    L2_3 = "female"
    ::lbl_15::
    L3_3 = Config
    L3_3 = L3_3.Jobs
    L4_3 = A0_2
    L3_3 = L3_3[L4_3]
    L3_3 = L3_3.outfits
    L3_3 = L3_3[L2_3]
    L4_3 = clothingAction
    L5_3 = L3_3
    L6_3 = false
    L4_3(L5_3, L6_3)
    L4_3 = Config
    L4_3 = L4_3.Jobs
    L5_3 = A0_2
    L4_3 = L4_3[L5_3]
    L4_3 = L4_3.debug
    if L4_3 then
      L4_3 = print
      L5_3 = "[^2INFO^7] Job outfit has been dressed."
      L4_3(L5_3)
    end
  end
  L3_2.onSelect = L4_2
  L4_2 = {}
  L5_2 = Lang
  L6_2 = "take_default_outfit"
  L5_2 = L5_2(L6_2)
  L4_2.title = L5_2
  L5_2 = Lang
  L6_2 = "take_default_outfit_desc"
  L5_2 = L5_2(L6_2)
  L4_2.description = L5_2
  L4_2.icon = "shirt"
  function L5_2()
    local L0_3, L1_3
    L0_3 = clothingAction
    L1_3 = nil
    L0_3(L1_3)
    L0_3 = Config
    L0_3 = L0_3.Jobs
    L1_3 = A0_2
    L0_3 = L0_3[L1_3]
    L0_3 = L0_3.debug
    if L0_3 then
      L0_3 = print
      L1_3 = "[^2INFO^7] Default outfit has been dressed."
      L0_3(L1_3)
    end
  end
  L4_2.onSelect = L5_2
  L5_2 = {}
  L6_2 = Lang
  L7_2 = "take_a_car"
  L6_2 = L6_2(L7_2)
  L5_2.title = L6_2
  L6_2 = Lang
  L7_2 = "take_a_car_desc"
  L6_2 = L6_2(L7_2)
  L5_2.description = L6_2
  L5_2.icon = "car"
  function L6_2()
    local L0_3, L1_3, L2_3, L3_3
    L0_3 = vehicle
    if nil ~= L0_3 then
      L0_3 = lib
      L0_3 = L0_3.callback
      L1_3 = "wais:deleteJob:car"
      L2_3 = false
      function L3_3()
        local L0_4, L1_4
        vehicle = nil
      end
      L0_3(L1_3, L2_3, L3_3)
      while true do
        L0_3 = vehicle
        if not L0_3 then
          break
        end
        L0_3 = Wait
        L1_3 = 100
        L0_3(L1_3)
      end
    end
    L0_3 = spawnJobCar
    L1_3 = A0_2
    L0_3(L1_3)
  end
  L5_2.onSelect = L6_2
  L6_2 = {}
  if "trucker" == A0_2 then
    L7_2 = Lang
    L8_2 = "cancel_the_delivery"
    L7_2 = L7_2(L8_2)
    if L7_2 then
      goto lbl_69
    end
  end
  if "gardener" == A0_2 then
    L7_2 = Lang
    L8_2 = "gardener_finish_return"
    L7_2 = L7_2(L8_2)
    if L7_2 then
      goto lbl_69
    end
  end
  L7_2 = Lang
  L8_2 = "delete_car"
  L7_2 = L7_2(L8_2)
  ::lbl_69::
  L6_2.title = L7_2
  if "trucker" == A0_2 then
    L7_2 = Lang
    L8_2 = "cancel_the_delivery_desc"
    L7_2 = L7_2(L8_2)
    if L7_2 then
      goto lbl_87
    end
  end
  if "gardener" == A0_2 then
    L7_2 = Lang
    L8_2 = "gardener_finish_return_desc"
    L7_2 = L7_2(L8_2)
    if L7_2 then
      goto lbl_87
    end
  end
  L7_2 = Lang
  L8_2 = "delete_car_desc"
  L7_2 = L7_2(L8_2)
  ::lbl_87::
  L6_2.description = L7_2
  L6_2.icon = "car-burst"
  function L7_2()
    local L0_3, L1_3, L2_3, L3_3, L4_3
    L0_3 = A0_2
    if "gardener" == L0_3 then
      L0_3 = checkGardenCleared
      L0_3()
    else
      L0_3 = A0_2
      if "trucker" == L0_3 then
        L0_3 = checkTrailerDelivered
        L0_3()
      else
        L0_3 = A0_2
        if "roadhelper" == L0_3 then
          L0_3 = checkRoadhelperHaveEvent
          L0_3()
        else
          L0_3 = A0_2
          if "hunter" == L0_3 then
            L0_3 = checkMusketTaken
            L0_3()
          else
            L0_3 = A0_2
            if "fire_department" == L0_3 then
              L0_3 = TriggerServerEvent
              L1_3 = "wais:deleteItem"
              L2_3 = "weapon_fireextinguisher"
              L3_3 = Config
              L3_3 = L3_3.Jobs
              L3_3 = L3_3.fire_department
              L3_3 = L3_3.giveable_items
              L3_3 = L3_3.weapon_fireextinguisher
              L0_3(L1_3, L2_3, L3_3)
            else
              L0_3 = A0_2
              if "news_delivery" == L0_3 then
                L0_3 = TriggerServerEvent
                L1_3 = "wais:news:removeAcidpackage"
                L0_3(L1_3)
              end
            end
          end
        end
      end
    end
    L0_3 = TriggerEvent
    L1_3 = "wais:setDefault:JobThings"
    L0_3(L1_3)
    L0_3 = vehicle
    if nil ~= L0_3 then
      L0_3 = TriggerServerEvent
      L1_3 = "wais:delete:Entitys"
      L0_3(L1_3)
      vehicle = nil
      L0_3 = Config
      L0_3 = L0_3.Notification
      L1_3 = Lang
      L2_3 = "job"
      L1_3 = L1_3(L2_3)
      L2_3 = Lang
      L3_3 = "car_returned"
      L2_3 = L2_3(L3_3)
      L3_3 = "success"
      L4_3 = nil
      L0_3(L1_3, L2_3, L3_3, L4_3)
    else
      L0_3 = Config
      L0_3 = L0_3.Notification
      L1_3 = Lang
      L2_3 = "job"
      L1_3 = L1_3(L2_3)
      L2_3 = Lang
      L3_3 = "car_not_found_return"
      L2_3 = L2_3(L3_3)
      L3_3 = "warning"
      L4_3 = nil
      L0_3(L1_3, L2_3, L3_3, L4_3)
    end
  end
  L6_2.onSelect = L7_2
  L7_2 = {}
  L8_2 = Lang
  L9_2 = "leave_job"
  L8_2 = L8_2(L9_2)
  L7_2.title = L8_2
  L8_2 = Lang
  L9_2 = "leave_job_desc"
  L8_2 = L8_2(L9_2)
  L7_2.description = L8_2
  L7_2.icon = "right-from-bracket"
  function L8_2()
    local L0_3, L1_3
    L0_3 = TriggerServerEvent
    L1_3 = "wais:setUnemployed"
    L0_3(L1_3)
  end
  L7_2.onSelect = L8_2
  L2_2[1] = L3_2
  L2_2[2] = L4_2
  L2_2[3] = L5_2
  L2_2[4] = L6_2
  L2_2[5] = L7_2
  if "mobile_hotdog" == A0_2 then
    L3_2 = {}
    L4_2 = Lang
    L5_2 = "take_stand"
    L4_2 = L4_2(L5_2)
    L3_2.title = L4_2
    L4_2 = Lang
    L5_2 = "take_stand_desc"
    L4_2 = L4_2(L5_2)
    L3_2.description = L4_2
    L3_2.icon = "hotdog"
    function L4_2()
      local L0_3, L1_3
      L0_3 = next
      L1_3 = props
      L0_3 = L0_3(L1_3)
      if nil ~= L0_3 then
        L0_3 = TriggerServerEvent
        L1_3 = "wais:delete:Entitys"
        L0_3(L1_3)
        L0_3 = {}
        props = L0_3
        while true do
          L0_3 = next
          L1_3 = props
          L0_3 = L0_3(L1_3)
          if not L0_3 then
            break
          end
          L0_3 = Wait
          L1_3 = 100
          L0_3(L1_3)
        end
      end
      L0_3 = spawnHotdogStand
      L0_3()
    end
    L3_2.onSelect = L4_2
    L2_2[3] = L3_2
    L3_2 = {}
    L4_2 = Lang
    L5_2 = "delete_stand"
    L4_2 = L4_2(L5_2)
    L3_2.title = L4_2
    L4_2 = Lang
    L5_2 = "delete_stand_desc"
    L4_2 = L4_2(L5_2)
    L3_2.description = L4_2
    L3_2.icon = "xmarks-lines"
    function L4_2()
      local L0_3, L1_3, L2_3, L3_3, L4_3
      L0_3 = TriggerEvent
      L1_3 = "wais:setDefault:JobThings"
      L0_3(L1_3)
      L0_3 = next
      L1_3 = props
      L0_3 = L0_3(L1_3)
      if nil ~= L0_3 then
        L0_3 = {}
        props = L0_3
        L0_3 = TriggerServerEvent
        L1_3 = "wais:delete:Entitys"
        L0_3(L1_3)
        L0_3 = Config
        L0_3 = L0_3.Notification
        L1_3 = Lang
        L2_3 = "job"
        L1_3 = L1_3(L2_3)
        L2_3 = Lang
        L3_3 = "car_returned"
        L2_3 = L2_3(L3_3)
        L3_3 = "success"
        L4_3 = nil
        L0_3(L1_3, L2_3, L3_3, L4_3)
      else
        L0_3 = Config
        L0_3 = L0_3.Notification
        L1_3 = Lang
        L2_3 = "job"
        L1_3 = L1_3(L2_3)
        L2_3 = Lang
        L3_3 = "car_not_found_return"
        L2_3 = L2_3(L3_3)
        L3_3 = "warning"
        L4_3 = nil
        L0_3(L1_3, L2_3, L3_3, L4_3)
      end
    end
    L3_2.onSelect = L4_2
    L2_2[4] = L3_2
  elseif "trucker" == A0_2 then
    L3_2 = {}
    L4_2 = Lang
    L5_2 = "trailer_list"
    L4_2 = L4_2(L5_2)
    L3_2.title = L4_2
    L4_2 = Lang
    L5_2 = "trailer_list_desc"
    L4_2 = L4_2(L5_2)
    L3_2.description = L4_2
    L3_2.icon = "trailer"
    L4_2 = menus
    L4_2 = L4_2.trailer_list
    L5_2 = L4_2
    L4_2 = L4_2.format
    L6_2 = A0_2
    L4_2 = L4_2(L5_2, L6_2)
    L3_2.menu = L4_2
    L2_2[3] = L3_2
  elseif "bus_driver" == A0_2 then
    L3_2 = {}
    L4_2 = Lang
    L5_2 = "bus_line_list"
    L4_2 = L4_2(L5_2)
    L3_2.title = L4_2
    L4_2 = Lang
    L5_2 = "bus_line_list_desc"
    L4_2 = L4_2(L5_2)
    L3_2.description = L4_2
    L3_2.icon = "bus"
    L4_2 = menus
    L4_2 = L4_2.line_list
    L5_2 = L4_2
    L4_2 = L4_2.format
    L6_2 = A0_2
    L4_2 = L4_2(L5_2, L6_2)
    L3_2.menu = L4_2
    L2_2[3] = L3_2
  elseif "forklifter" == A0_2 then
    L3_2 = L2_2[3]
    L3_2.disabled = true
    L3_2 = #L2_2
    L3_2 = L3_2 + 1
    L4_2 = {}
    L5_2 = Lang
    L6_2 = "cargo_list"
    L5_2 = L5_2(L6_2)
    L4_2.title = L5_2
    L5_2 = Lang
    L6_2 = "cargo_list_desc"
    L5_2 = L5_2(L6_2)
    L4_2.description = L5_2
    L4_2.icon = "boxes-stacked"
    L5_2 = menus
    L5_2 = L5_2.cargo_list
    L6_2 = L5_2
    L5_2 = L5_2.format
    L7_2 = A0_2
    L5_2 = L5_2(L6_2, L7_2)
    L4_2.menu = L5_2
    L2_2[L3_2] = L4_2
  elseif "project_car" == A0_2 then
    L2_2[4] = nil
    L3_2 = #L2_2
    L3_2 = L3_2 + 1
    L4_2 = {}
    L5_2 = Lang
    L6_2 = "car_list"
    L5_2 = L5_2(L6_2)
    L4_2.title = L5_2
    L5_2 = Lang
    L6_2 = "car_list_desc"
    L5_2 = L5_2(L6_2)
    L4_2.description = L5_2
    L4_2.icon = "screwdriver-wrench"
    L5_2 = menus
    L5_2 = L5_2.project_car_list
    L6_2 = L5_2
    L5_2 = L5_2.format
    L7_2 = A0_2
    L5_2 = L5_2(L6_2, L7_2)
    L4_2.menu = L5_2
    L2_2[L3_2] = L4_2
  elseif "diver" == A0_2 then
    L3_2 = {}
    L4_2 = Lang
    L5_2 = "diver_menu_title"
    L4_2 = L4_2(L5_2)
    L3_2.title = L4_2
    L4_2 = Lang
    L5_2 = "diver_menu_desc"
    L4_2 = L4_2(L5_2)
    L3_2.description = L4_2
    L3_2.icon = "person-swimming"
    L4_2 = menus
    L4_2 = L4_2.diver_missions
    L5_2 = L4_2
    L4_2 = L4_2.format
    L6_2 = A0_2
    L4_2 = L4_2(L5_2, L6_2)
    L3_2.menu = L4_2
    L2_2[3] = L3_2
    L3_2 = {}
    L4_2 = Lang
    L5_2 = "cancel_title"
    L4_2 = L4_2(L5_2)
    L3_2.title = L4_2
    L4_2 = Lang
    L5_2 = "cancel_desc"
    L4_2 = L4_2(L5_2)
    L3_2.description = L4_2
    L3_2.icon = "circle-xmark"
    function L4_2()
      local L0_3, L1_3, L2_3, L3_3, L4_3
      L0_3 = Group
      L0_3 = L0_3.active
      if L0_3 then
        L0_3 = Group
        L0_3 = L0_3.ownerId
        L1_3 = GetPlayerServerId
        L2_3 = PlayerId
        L2_3, L3_3, L4_3 = L2_3()
        L1_3 = L1_3(L2_3, L3_3, L4_3)
        if L0_3 == L1_3 then
          L0_3 = TriggerServerEvent
          L1_3 = "wais:diver:mission:cancel:group"
          L2_3 = Group
          L2_3 = L2_3.groupId
          L0_3(L1_3, L2_3)
        else
          L0_3 = Config
          L0_3 = L0_3.Notification
          L1_3 = Lang
          L2_3 = "job"
          L1_3 = L1_3(L2_3)
          L2_3 = Lang
          L3_3 = "you_cant_cancel_group"
          L2_3 = L2_3(L3_3)
          L3_3 = "inform"
          L4_3 = nil
          return L0_3(L1_3, L2_3, L3_3, L4_3)
        end
      else
        L0_3 = TriggerServerEvent
        L1_3 = "wais:diver:mission:cancel:self"
        L0_3(L1_3)
      end
    end
    L3_2.onSelect = L4_2
    L2_2[4] = L3_2
  elseif "farmer" == A0_2 then
    L3_2 = {}
    L4_2 = Lang
    L5_2 = "farmer_menu_title"
    L4_2 = L4_2(L5_2)
    L3_2.title = L4_2
    L4_2 = Lang
    L5_2 = "farmer_menu_desc"
    L4_2 = L4_2(L5_2)
    L3_2.description = L4_2
    L3_2.icon = "wheat-awn"
    L4_2 = menus
    L4_2 = L4_2.farmer_missions
    L5_2 = L4_2
    L4_2 = L4_2.format
    L6_2 = A0_2
    L4_2 = L4_2(L5_2, L6_2)
    L3_2.menu = L4_2
    L2_2[3] = L3_2
    L3_2 = {}
    L4_2 = Lang
    L5_2 = "farmer_cancel_title"
    L4_2 = L4_2(L5_2)
    L3_2.title = L4_2
    L4_2 = Lang
    L5_2 = "farmer_cancel_desc"
    L4_2 = L4_2(L5_2)
    L3_2.description = L4_2
    L3_2.icon = "money-bill-wheat"
    function L4_2()
      local L0_3, L1_3
      L0_3 = nil
      L1_3 = {}
      props = L1_3
      vehicle = L0_3
      L0_3 = TriggerServerEvent
      L1_3 = "wais:delete:Entitys"
      L0_3(L1_3)
      L0_3 = checkFarmerIsFinished
      L0_3()
    end
    L3_2.onSelect = L4_2
    L2_2[4] = L3_2
  elseif "electrician" == A0_2 then
    L3_2 = {}
    L4_2 = Lang
    L5_2 = "electrician_menu_title"
    L4_2 = L4_2(L5_2)
    L3_2.title = L4_2
    L4_2 = Lang
    L5_2 = "electrician_menu_desc"
    L4_2 = L4_2(L5_2)
    L3_2.description = L4_2
    L3_2.icon = "bolt"
    L4_2 = menus
    L4_2 = L4_2.electrician_missions
    L5_2 = L4_2
    L4_2 = L4_2.format
    L6_2 = A0_2
    L4_2 = L4_2(L5_2, L6_2)
    L3_2.menu = L4_2
    L2_2[3] = L3_2
    L3_2 = {}
    L4_2 = Lang
    L5_2 = "cancel_title"
    L4_2 = L4_2(L5_2)
    L3_2.title = L4_2
    L4_2 = Lang
    L5_2 = "cancel_desc"
    L4_2 = L4_2(L5_2)
    L3_2.description = L4_2
    L3_2.icon = "circle-xmark"
    function L4_2()
      local L0_3, L1_3, L2_3, L3_3, L4_3
      L0_3 = Group
      L0_3 = L0_3.active
      if L0_3 then
        L0_3 = Group
        L0_3 = L0_3.ownerId
        L1_3 = GetPlayerServerId
        L2_3 = PlayerId
        L2_3, L3_3, L4_3 = L2_3()
        L1_3 = L1_3(L2_3, L3_3, L4_3)
        if L0_3 == L1_3 then
          L0_3 = vehicle
          if nil ~= L0_3 then
            L0_3 = TriggerServerEvent
            L1_3 = "wais:delete:Entitys"
            L0_3(L1_3)
            vehicle = nil
            L0_3 = Config
            L0_3 = L0_3.Notification
            L1_3 = Lang
            L2_3 = "job"
            L1_3 = L1_3(L2_3)
            L2_3 = Lang
            L3_3 = "car_returned"
            L2_3 = L2_3(L3_3)
            L3_3 = "success"
            L4_3 = nil
            L0_3(L1_3, L2_3, L3_3, L4_3)
          else
            L0_3 = Config
            L0_3 = L0_3.Notification
            L1_3 = Lang
            L2_3 = "job"
            L1_3 = L1_3(L2_3)
            L2_3 = Lang
            L3_3 = "car_not_found_return"
            L2_3 = L2_3(L3_3)
            L3_3 = "warning"
            L4_3 = nil
            L0_3(L1_3, L2_3, L3_3, L4_3)
          end
          L0_3 = TriggerServerEvent
          L1_3 = "wais:electrician:mission:cancel:group"
          L2_3 = Group
          L2_3 = L2_3.groupId
          L0_3(L1_3, L2_3)
        else
          L0_3 = Config
          L0_3 = L0_3.Notification
          L1_3 = Lang
          L2_3 = "job"
          L1_3 = L1_3(L2_3)
          L2_3 = Lang
          L3_3 = "you_cant_cancel_group"
          L2_3 = L2_3(L3_3)
          L3_3 = "inform"
          L4_3 = nil
          return L0_3(L1_3, L2_3, L3_3, L4_3)
        end
      else
        L0_3 = vehicle
        if nil ~= L0_3 then
          L0_3 = TriggerServerEvent
          L1_3 = "wais:delete:Entitys"
          L0_3(L1_3)
          vehicle = nil
          L0_3 = Config
          L0_3 = L0_3.Notification
          L1_3 = Lang
          L2_3 = "job"
          L1_3 = L1_3(L2_3)
          L2_3 = Lang
          L3_3 = "car_returned"
          L2_3 = L2_3(L3_3)
          L3_3 = "success"
          L4_3 = nil
          L0_3(L1_3, L2_3, L3_3, L4_3)
        else
          L0_3 = Config
          L0_3 = L0_3.Notification
          L1_3 = Lang
          L2_3 = "job"
          L1_3 = L1_3(L2_3)
          L2_3 = Lang
          L3_3 = "car_not_found_return"
          L2_3 = L2_3(L3_3)
          L3_3 = "warning"
          L4_3 = nil
          L0_3(L1_3, L2_3, L3_3, L4_3)
        end
        L0_3 = TriggerEvent
        L1_3 = "wais:electrician:client:cancelMission:self"
        L0_3(L1_3)
      end
    end
    L3_2.onSelect = L4_2
    L2_2[4] = L3_2
  end
  L3_2 = Config
  L3_2 = L3_2.Jobs
  L3_2 = L3_2[A0_2]
  L3_2 = L3_2.can_multiplayer
  if nil ~= L3_2 then
    L3_2 = Config
    L3_2 = L3_2.Jobs
    L3_2 = L3_2[A0_2]
    L3_2 = L3_2.can_multiplayer
    if L3_2 then
      L3_2 = #L2_2
      L3_2 = L3_2 + 1
      L4_2 = {}
      L5_2 = Lang
      L6_2 = "work_together"
      L5_2 = L5_2(L6_2)
      L4_2.title = L5_2
      L5_2 = Lang
      L6_2 = "work_together_desc"
      L5_2 = L5_2(L6_2)
      L4_2.description = L5_2
      L4_2.icon = "users"
      L5_2 = menus
      L5_2 = L5_2.group_menu
      L6_2 = L5_2
      L5_2 = L5_2.format
      L7_2 = A0_2
      L5_2 = L5_2(L6_2, L7_2)
      L4_2.menu = L5_2
      L2_2[L3_2] = L4_2
    end
  end
  L3_2 = lib
  L3_2 = L3_2.registerContext
  L4_2 = {}
  L5_2 = menus
  L5_2 = L5_2.job_menu
  L6_2 = L5_2
  L5_2 = L5_2.format
  L7_2 = A0_2
  L5_2 = L5_2(L6_2, L7_2)
  L4_2.id = L5_2
  L5_2 = Lang
  L6_2 = "job_menu_title"
  L7_2 = A1_2
  L5_2 = L5_2(L6_2, L7_2)
  L4_2.title = L5_2
  L4_2.options = L2_2
  L3_2(L4_2)
  L3_2 = lib
  L3_2 = L3_2.showContext
  L4_2 = menus
  L4_2 = L4_2.job_menu
  L5_2 = L4_2
  L4_2 = L4_2.format
  L6_2 = A0_2
  L4_2, L5_2, L6_2, L7_2, L8_2, L9_2 = L4_2(L5_2, L6_2)
  L3_2(L4_2, L5_2, L6_2, L7_2, L8_2, L9_2)
end
openJobMenu = L0_1
function L0_1(A0_2, A1_2)
  local L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2
  L2_2 = Config
  L2_2 = L2_2.Jobs
  L2_2 = L2_2[A0_2]
  L2_2 = L2_2.can_multiplayer
  if nil ~= L2_2 then
    L2_2 = Config
    L2_2 = L2_2.Jobs
    L2_2 = L2_2[A0_2]
    L2_2 = L2_2.can_multiplayer
    if L2_2 then
      L2_2 = true
      L3_2 = false
      L4_2 = true
      L5_2 = Group
      L5_2 = L5_2.active
      if L5_2 then
        L5_2 = next
        L6_2 = Group
        L6_2 = L6_2.players
        L5_2 = L5_2(L6_2)
        if nil ~= L5_2 then
          L5_2 = {}
          L6_2 = true
          L7_2 = Group
          L7_2 = L7_2.active
          if L7_2 then
            L7_2 = Group
            L7_2 = L7_2.ownerId
            L8_2 = GetPlayerServerId
            L9_2 = PlayerId
            L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2 = L9_2()
            L8_2 = L8_2(L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2)
            if L7_2 == L8_2 then
              L6_2 = false
            end
          end
          L7_2 = pairs
          L8_2 = Group
          L8_2 = L8_2.players
          L7_2, L8_2, L9_2, L10_2 = L7_2(L8_2)
          for L11_2, L12_2 in L7_2, L8_2, L9_2, L10_2 do
            L13_2 = #L5_2
            L13_2 = L13_2 + 1
            L14_2 = {}
            L15_2 = L12_2.name
            L14_2.title = L15_2
            L15_2 = Lang
            L16_2 = "group_member_desc"
            L15_2 = L15_2(L16_2)
            L14_2.description = L15_2
            L14_2.icon = "user"
            function L15_2()
              local L0_3, L1_3, L2_3, L3_3, L4_3
              L0_3 = L12_2.source
              L1_3 = GetPlayerServerId
              L2_3 = PlayerId
              L2_3, L3_3, L4_3 = L2_3()
              L1_3 = L1_3(L2_3, L3_3, L4_3)
              if L0_3 ~= L1_3 then
                L0_3 = lib
                L0_3 = L0_3.showNotification
                L1_3 = Lang
                L2_3 = "job"
                L1_3 = L1_3(L2_3)
                L2_3 = Lang
                L3_3 = "you_cant_kick_self"
                L2_3 = L2_3(L3_3)
                L3_3 = "inform"
                L4_3 = nil
                return L0_3(L1_3, L2_3, L3_3, L4_3)
              end
              L0_3 = TriggerServerEvent
              L1_3 = "wais:group:kick"
              L2_3 = Group
              L2_3 = L2_3.groupId
              L3_3 = tostring
              L4_3 = L12_2.source
              L3_3, L4_3 = L3_3(L4_3)
              L0_3(L1_3, L2_3, L3_3, L4_3)
            end
            L14_2.onSelect = L15_2
            L14_2.disabled = L6_2
            L5_2[L13_2] = L14_2
          end
          L7_2 = lib
          L7_2 = L7_2.registerContext
          L8_2 = {}
          L9_2 = menus
          L9_2 = L9_2.group_members
          L10_2 = L9_2
          L9_2 = L9_2.format
          L11_2 = A0_2
          L9_2 = L9_2(L10_2, L11_2)
          L8_2.id = L9_2
          L9_2 = Lang
          L10_2 = "group_members"
          L11_2 = A1_2
          L9_2 = L9_2(L10_2, L11_2)
          L8_2.title = L9_2
          L8_2.options = L5_2
          L9_2 = menus
          L9_2 = L9_2.group_menu
          L10_2 = L9_2
          L9_2 = L9_2.format
          L11_2 = A0_2
          L9_2 = L9_2(L10_2, L11_2)
          L8_2.menu = L9_2
          L7_2(L8_2)
        end
      end
      L5_2 = Group
      L5_2 = L5_2.active
      if L5_2 then
        L2_2 = false
        L5_2 = Group
        L5_2 = L5_2.ownerId
        L6_2 = GetPlayerServerId
        L7_2 = PlayerId
        L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2 = L7_2()
        L6_2 = L6_2(L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2)
        if L5_2 == L6_2 then
          L4_2 = false
        else
          L3_2 = true
        end
      end
      L5_2 = {}
      L6_2 = {}
      L7_2 = Group
      L7_2 = L7_2.active
      if L7_2 then
        L7_2 = Lang
        L8_2 = "multi_close_group"
        L7_2 = L7_2(L8_2)
        if L7_2 then
          goto lbl_122
        end
      end
      L7_2 = Lang
      L8_2 = "multi_create_group"
      L7_2 = L7_2(L8_2)
      ::lbl_122::
      L6_2.title = L7_2
      L7_2 = Group
      L7_2 = L7_2.active
      if L7_2 then
        L7_2 = Lang
        L8_2 = "multi_close_group_desc"
        L7_2 = L7_2(L8_2)
        if L7_2 then
          goto lbl_135
        end
      end
      L7_2 = Lang
      L8_2 = "multi_create_group_desc"
      L7_2 = L7_2(L8_2)
      ::lbl_135::
      L6_2.description = L7_2
      L6_2.icon = "user-group"
      function L7_2()
        local L0_3, L1_3, L2_3, L3_3, L4_3
        L0_3 = Group
        L0_3 = L0_3.active
        if not L0_3 then
          L0_3 = TriggerServerEvent
          L1_3 = "wais:group:create"
          L2_3 = A0_2
          L3_3 = Config
          L3_3 = L3_3.Jobs
          L4_3 = A0_2
          L3_3 = L3_3[L4_3]
          L3_3 = L3_3.show_members_blips
          if not L3_3 then
            L3_3 = false
          end
          return L0_3(L1_3, L2_3, L3_3)
        end
        L0_3 = TriggerServerEvent
        L1_3 = "wais:group:delete"
        L2_3 = Group
        L2_3 = L2_3.groupId
        L0_3(L1_3, L2_3)
      end
      L6_2.onSelect = L7_2
      L6_2.disabled = L3_2
      L7_2 = {}
      L8_2 = Lang
      L9_2 = "multi_invite"
      L8_2 = L8_2(L9_2)
      L7_2.title = L8_2
      L8_2 = Lang
      L9_2 = "multi_invite_desc"
      L8_2 = L8_2(L9_2)
      L7_2.description = L8_2
      L7_2.icon = "user-plus"
      function L8_2()
        local L0_3, L1_3, L2_3, L3_3, L4_3, L5_3
        L0_3 = GetClosestPed
        L0_3 = L0_3()
        L1_3 = #L0_3
        if L1_3 <= 0 then
          L1_3 = Config
          L1_3 = L1_3.Notification
          L2_3 = Lang
          L3_3 = "job"
          L2_3 = L2_3(L3_3)
          L3_3 = Lang
          L4_3 = "no_near_players"
          L3_3 = L3_3(L4_3)
          L4_3 = "warning"
          L5_3 = nil
          return L1_3(L2_3, L3_3, L4_3, L5_3)
        end
        L1_3 = lib
        L1_3 = L1_3.callback
        L2_3 = "wais:getPlayer:names"
        L3_3 = false
        function L4_3(A0_4)
          local L1_4, L2_4, L3_4, L4_4, L5_4, L6_4, L7_4, L8_4, L9_4, L10_4
          L1_4 = {}
          L2_4 = pairs
          L3_4 = A0_4
          L2_4, L3_4, L4_4, L5_4 = L2_4(L3_4)
          for L6_4, L7_4 in L2_4, L3_4, L4_4, L5_4 do
            L8_4 = #L1_4
            L8_4 = L8_4 + 1
            L9_4 = {}
            L10_4 = L7_4.source
            L9_4.value = L10_4
            L10_4 = L7_4.name
            L9_4.label = L10_4
            L1_4[L8_4] = L9_4
          end
          L2_4 = lib
          L2_4 = L2_4.inputDialog
          L3_4 = Lang
          L4_4 = "multi_select_players"
          L3_4 = L3_4(L4_4)
          L4_4 = {}
          L5_4 = {}
          L5_4.type = "multi-select"
          L6_4 = Lang
          L7_4 = "near_players"
          L6_4 = L6_4(L7_4)
          L5_4.label = L6_4
          L6_4 = Lang
          L7_4 = "near_players_desc"
          L6_4 = L6_4(L7_4)
          L5_4.description = L6_4
          L5_4.options = L1_4
          L5_4.required = true
          L5_4.icon = "users"
          L5_4.searchable = true
          L4_4[1] = L5_4
          L2_4 = L2_4(L3_4, L4_4)
          if nil ~= L2_4 then
            L3_4 = TriggerServerEvent
            L4_4 = "wais:group:invite"
            L5_4 = Group
            L5_4 = L5_4.groupId
            L6_4 = L2_4
            L3_4(L4_4, L5_4, L6_4)
          end
        end
        L5_3 = L0_3
        L1_3(L2_3, L3_3, L4_3, L5_3)
      end
      L7_2.onSelect = L8_2
      L7_2.disabled = L4_2
      L8_2 = {}
      L9_2 = Lang
      L10_2 = "group_members"
      L9_2 = L9_2(L10_2)
      L8_2.title = L9_2
      L9_2 = Lang
      L10_2 = "group_members_desc"
      L9_2 = L9_2(L10_2)
      L8_2.description = L9_2
      L8_2.icon = "users"
      L9_2 = menus
      L9_2 = L9_2.group_members
      L10_2 = L9_2
      L9_2 = L9_2.format
      L11_2 = A0_2
      L9_2 = L9_2(L10_2, L11_2)
      L8_2.menu = L9_2
      L9_2 = Group
      L9_2 = L9_2.active
      L9_2 = not L9_2
      L8_2.disabled = L9_2
      L5_2[1] = L6_2
      L5_2[2] = L7_2
      L5_2[3] = L8_2
      L6_2 = lib
      L6_2 = L6_2.registerContext
      L7_2 = {}
      L8_2 = menus
      L8_2 = L8_2.group_menu
      L9_2 = L8_2
      L8_2 = L8_2.format
      L10_2 = A0_2
      L8_2 = L8_2(L9_2, L10_2)
      L7_2.id = L8_2
      L8_2 = Lang
      L9_2 = "work_together"
      L10_2 = A1_2
      L8_2 = L8_2(L9_2, L10_2)
      L7_2.title = L8_2
      L7_2.options = L5_2
      L8_2 = menus
      L8_2 = L8_2.job_menu
      L9_2 = L8_2
      L8_2 = L8_2.format
      L10_2 = A0_2
      L8_2 = L8_2(L9_2, L10_2)
      L7_2.menu = L8_2
      L6_2(L7_2)
    end
  end
end
multiplayerMenus = L0_1
function L0_1(A0_2, A1_2, A2_2, A3_2)
  local L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2
  L4_2 = SetTextScale
  L5_2 = 0.35
  L6_2 = 0.35
  L4_2(L5_2, L6_2)
  L4_2 = SetTextFont
  L5_2 = Config
  L5_2 = L5_2.FontStyle
  L4_2(L5_2)
  L4_2 = SetTextProportional
  L5_2 = 1
  L4_2(L5_2)
  L4_2 = SetTextColour
  L5_2 = 255
  L6_2 = 255
  L7_2 = 255
  L8_2 = 215
  L4_2(L5_2, L6_2, L7_2, L8_2)
  L4_2 = SetTextEntry
  L5_2 = "STRING"
  L4_2(L5_2)
  L4_2 = SetTextCentre
  L5_2 = true
  L4_2(L5_2)
  L4_2 = AddTextComponentString
  L5_2 = A3_2
  L4_2(L5_2)
  L4_2 = SetDrawOrigin
  L5_2 = A0_2
  L6_2 = A1_2
  L7_2 = A2_2
  L8_2 = 0
  L4_2(L5_2, L6_2, L7_2, L8_2)
  L4_2 = DrawText
  L5_2 = 0.0
  L6_2 = 0.0
  L4_2(L5_2, L6_2)
  L4_2 = string
  L4_2 = L4_2.len
  L5_2 = A3_2
  L4_2 = L4_2(L5_2)
  L4_2 = L4_2 / 370
  L5_2 = DrawRect
  L6_2 = 0.0
  L7_2 = 0.0125
  L8_2 = 0.017 + L4_2
  L9_2 = 0.03
  L10_2 = 0
  L11_2 = 0
  L12_2 = 0
  L13_2 = 75
  L5_2(L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2)
  L5_2 = ClearDrawOrigin
  L5_2()
end
DrawText3D = L0_1
function L0_1(A0_2)
  local L1_2, L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2
  L1_2 = promise
  L2_2 = L1_2
  L1_2 = L1_2.new
  L1_2 = L1_2(L2_2)
  L2_2 = type
  L3_2 = A0_2
  L2_2 = L2_2(L3_2)
  if "string" == L2_2 then
    L2_2 = joaat
    L3_2 = A0_2
    L2_2 = L2_2(L3_2)
    if L2_2 then
      goto lbl_15
    end
  end
  L2_2 = A0_2
  ::lbl_15::
  L3_2 = HasModelLoaded
  L4_2 = L2_2
  L3_2 = L3_2(L4_2)
  if L3_2 then
    L4_2 = L1_2
    L3_2 = L1_2.resolve
    L5_2 = true
    L3_2(L4_2, L5_2)
  else
    L3_2 = 2000
    L4_2 = RequestModel
    L5_2 = L2_2
    L4_2(L5_2)
    while true do
      L4_2 = HasModelLoaded
      L5_2 = L2_2
      L4_2 = L4_2(L5_2)
      if L4_2 then
        break
      end
      L4_2 = RequestModel
      L5_2 = L2_2
      L4_2(L5_2)
      L3_2 = L3_2 - 250
      if L3_2 <= 0 then
        L4_2 = Config
        L4_2 = L4_2.Notification
        L5_2 = Lang
        L6_2 = "job"
        L5_2 = L5_2(L6_2)
        L6_2 = Lang
        L7_2 = "failed_to_load"
        L8_2 = L2_2
        L6_2 = L6_2(L7_2, L8_2)
        L7_2 = "inform"
        L8_2 = nil
        L4_2(L5_2, L6_2, L7_2, L8_2)
        L5_2 = L1_2
        L4_2 = L1_2.resolve
        L6_2 = false
        L4_2(L5_2, L6_2)
        break
      end
      L4_2 = Wait
      L5_2 = 250
      L4_2(L5_2)
    end
    L5_2 = L1_2
    L4_2 = L1_2.resolve
    L6_2 = true
    L4_2(L5_2, L6_2)
  end
  L3_2 = Citizen
  L3_2 = L3_2.Await
  L4_2 = L1_2
  return L3_2(L4_2)
end
loadModel = L0_1
function L0_1(A0_2)
  local L1_2, L2_2, L3_2, L4_2, L5_2, L6_2, L7_2
  L1_2 = promise
  L2_2 = L1_2
  L1_2 = L1_2.new
  L1_2 = L1_2(L2_2)
  L2_2 = HasAnimDictLoaded
  L3_2 = A0_2
  L2_2 = L2_2(L3_2)
  if L2_2 then
    L3_2 = L1_2
    L2_2 = L1_2.resolve
    L4_2 = true
    L2_2(L3_2, L4_2)
  else
    L2_2 = 10000
    L3_2 = RequestAnimDict
    L4_2 = A0_2
    L3_2(L4_2)
    while true do
      L3_2 = HasAnimDictLoaded
      L4_2 = A0_2
      L3_2 = L3_2(L4_2)
      if L3_2 then
        break
      end
      L3_2 = RequestAnimDict
      L4_2 = A0_2
      L3_2(L4_2)
      L2_2 = L2_2 - 10
      if L2_2 <= 0 then
        L3_2 = Config
        L3_2 = L3_2.Notification
        L4_2 = Lang
        L5_2 = "job"
        L4_2 = L4_2(L5_2)
        L5_2 = Lang
        L6_2 = "failed_to_load_dict"
        L7_2 = A0_2
        L5_2 = L5_2(L6_2, L7_2)
        L6_2 = "inform"
        L7_2 = nil
        L3_2(L4_2, L5_2, L6_2, L7_2)
        L4_2 = L1_2
        L3_2 = L1_2.resolve
        L5_2 = false
        L3_2(L4_2, L5_2)
        break
      end
      L3_2 = Wait
      L4_2 = 250
      L3_2(L4_2)
    end
    L4_2 = L1_2
    L3_2 = L1_2.resolve
    L5_2 = true
    L3_2(L4_2, L5_2)
  end
  L2_2 = Citizen
  L2_2 = L2_2.Await
  L3_2 = L1_2
  return L2_2(L3_2)
end
loadDict = L0_1
function L0_1(A0_2)
  local L1_2, L2_2, L3_2, L4_2, L5_2, L6_2, L7_2
  L1_2 = promise
  L2_2 = L1_2
  L1_2 = L1_2.new
  L1_2 = L1_2(L2_2)
  L2_2 = HasNamedPtfxAssetLoaded
  L3_2 = A0_2
  L2_2 = L2_2(L3_2)
  if L2_2 then
    L3_2 = L1_2
    L2_2 = L1_2.resolve
    L4_2 = true
    L2_2(L3_2, L4_2)
  else
    L2_2 = 10000
    L3_2 = RequestNamedPtfxAsset
    L4_2 = A0_2
    L3_2(L4_2)
    while true do
      L3_2 = HasNamedPtfxAssetLoaded
      L4_2 = A0_2
      L3_2 = L3_2(L4_2)
      if L3_2 then
        break
      end
      L3_2 = RequestNamedPtfxAsset
      L4_2 = A0_2
      L3_2(L4_2)
      L2_2 = L2_2 - 10
      if L2_2 <= 0 then
        L3_2 = Config
        L3_2 = L3_2.Notification
        L4_2 = Lang
        L5_2 = "job"
        L4_2 = L4_2(L5_2)
        L5_2 = Lang
        L6_2 = "failed_to_load_ptfx"
        L7_2 = A0_2
        L5_2 = L5_2(L6_2, L7_2)
        L6_2 = "inform"
        L7_2 = nil
        L3_2(L4_2, L5_2, L6_2, L7_2)
        L4_2 = L1_2
        L3_2 = L1_2.resolve
        L5_2 = false
        L3_2(L4_2, L5_2)
        break
      end
      L3_2 = Wait
      L4_2 = 250
      L3_2(L4_2)
    end
    L4_2 = L1_2
    L3_2 = L1_2.resolve
    L5_2 = true
    L3_2(L4_2, L5_2)
  end
  L2_2 = Citizen
  L2_2 = L2_2.Await
  L3_2 = L1_2
  return L2_2(L3_2)
end
loadPtfx = L0_1
function L0_1(A0_2, A1_2, A2_2)
  local L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2
  L3_2 = PlayerPedId
  L3_2 = L3_2()
  L4_2 = DetachEntity
  L5_2 = A0_2
  L6_2 = true
  L7_2 = true
  L4_2(L5_2, L6_2, L7_2)
  L4_2 = AttachEntityToEntity
  L5_2 = A0_2
  L6_2 = A2_2 or L6_2
  if not A2_2 then
    L6_2 = L3_2
  end
  L7_2 = GetPedBoneIndex
  L8_2 = A2_2 or L8_2
  if not A2_2 then
    L8_2 = L3_2
  end
  L9_2 = A1_2.bone
  L7_2 = L7_2(L8_2, L9_2)
  L8_2 = A1_2.coords
  L8_2 = L8_2.x
  L9_2 = A1_2.coords
  L9_2 = L9_2.y
  L10_2 = A1_2.coords
  L10_2 = L10_2.z
  L11_2 = A1_2.rotation
  L11_2 = L11_2.x
  L12_2 = A1_2.rotation
  L12_2 = L12_2.y
  L13_2 = A1_2.rotation
  L13_2 = L13_2.z
  L14_2 = true
  L15_2 = true
  L16_2 = false
  L17_2 = false
  L18_2 = 1
  L19_2 = true
  L4_2(L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2)
  L4_2 = A1_2.animDict
  if nil ~= L4_2 then
    L4_2 = loadDict
    L5_2 = A1_2.animDict
    L4_2 = L4_2(L5_2)
    if not L4_2 then
      return
    end
    L4_2 = TaskPlayAnim
    L5_2 = A2_2 or L5_2
    if not A2_2 then
      L5_2 = L3_2
    end
    L6_2 = A1_2.animDict
    L7_2 = A1_2.animName
    L8_2 = 8.0
    L9_2 = 8.0
    L10_2 = -1
    L11_2 = 50
    L12_2 = 0
    L13_2 = false
    L14_2 = false
    L15_2 = false
    L4_2(L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2)
  end
end
takePropFromVehicle = L0_1
function L0_1(A0_2, A1_2, A2_2)
  local L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2
  L3_2 = ClearPedTasks
  L4_2 = PlayerPedId
  L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2 = L4_2()
  L3_2(L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2)
  L3_2 = DetachEntity
  L4_2 = A0_2
  L5_2 = true
  L6_2 = true
  L3_2(L4_2, L5_2, L6_2)
  L3_2 = AttachEntityToEntity
  L4_2 = A0_2
  L5_2 = A2_2 or L5_2
  if not A2_2 then
    L5_2 = vehicle
  end
  L6_2 = A1_2.bone
  L7_2 = A1_2.coords
  L7_2 = L7_2.x
  L8_2 = A1_2.coords
  L8_2 = L8_2.y
  L9_2 = A1_2.coords
  L9_2 = L9_2.z
  L10_2 = A1_2.rotation
  L10_2 = L10_2.x
  L11_2 = A1_2.rotation
  L11_2 = L11_2.y
  L12_2 = A1_2.rotation
  L12_2 = L12_2.z
  L13_2 = true
  L14_2 = true
  L15_2 = false
  L16_2 = false
  L17_2 = 1
  L18_2 = true
  L3_2(L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2)
end
putPropToVehicle = L0_1
function L0_1()
  local L0_2, L1_2, L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2
  L0_2 = PlayerPedId
  L0_2 = L0_2()
  L1_2 = GetEntityCoords
  L2_2 = L0_2
  L1_2 = L1_2(L2_2)
  L2_2 = GetPedsPool
  L2_2 = L2_2()
  L3_2 = {}
  L4_2 = 1
  L5_2 = #L2_2
  L6_2 = 1
  for L7_2 = L4_2, L5_2, L6_2 do
    L8_2 = GetEntityCoords
    L9_2 = L2_2[L7_2]
    L8_2 = L8_2(L9_2)
    L9_2 = L8_2 - L1_2
    L9_2 = #L9_2
    if L9_2 <= 3 then
      L10_2 = IsPedAPlayer
      L11_2 = L2_2[L7_2]
      L10_2 = L10_2(L11_2)
      if L10_2 then
        L10_2 = L2_2[L7_2]
        if L10_2 ~= L0_2 then
          L10_2 = #L3_2
          L10_2 = L10_2 + 1
          L11_2 = {}
          L12_2 = L2_2[L7_2]
          L11_2.ped = L12_2
          L12_2 = GetPlayerServerId
          L13_2 = NetworkGetPlayerIndexFromPed
          L14_2 = L2_2[L7_2]
          L13_2, L14_2 = L13_2(L14_2)
          L12_2 = L12_2(L13_2, L14_2)
          L11_2.source = L12_2
          L11_2.distance = L9_2
          L11_2.name = nil
          L3_2[L10_2] = L11_2
        end
      end
    end
  end
  return L3_2
end
GetClosestPed = L0_1
function L0_1()
  local L0_2, L1_2, L2_2, L3_2, L4_2, L5_2, L6_2, L7_2
  L0_2 = GetGamePool
  L1_2 = "CPed"
  L0_2 = L0_2(L1_2)
  L1_2 = {}
  L2_2 = 1
  L3_2 = #L0_2
  L4_2 = 1
  for L5_2 = L2_2, L3_2, L4_2 do
    L6_2 = found
    if not L6_2 then
      L6_2 = #L1_2
      L6_2 = L6_2 + 1
      L7_2 = L0_2[L5_2]
      L1_2[L6_2] = L7_2
    end
  end
  return L1_2
end
GetPedsPool = L0_1
function L0_1(A0_2, A1_2)
  local L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2
  L2_2 = math
  L2_2 = L2_2.random
  L2_2 = L2_2()
  L2_2 = L2_2 * 2
  L3_2 = math
  L3_2 = L3_2.pi
  L2_2 = L2_2 * L3_2
  L3_2 = math
  L3_2 = L3_2.random
  L3_2 = L3_2()
  L3_2 = L3_2 * A1_2
  L4_2 = math
  L4_2 = L4_2.cos
  L5_2 = L2_2
  L4_2 = L4_2(L5_2)
  L4_2 = L4_2 * L3_2
  L5_2 = math
  L5_2 = L5_2.sin
  L6_2 = L2_2
  L5_2 = L5_2(L6_2)
  L5_2 = L5_2 * L3_2
  L6_2 = A0_2.x
  L6_2 = L6_2 + L4_2
  L7_2 = A0_2.y
  L7_2 = L7_2 + L5_2
  L8_2 = A0_2.z
  L9_2 = GetGroundZFor_3dCoord
  L10_2 = L6_2
  L11_2 = L7_2
  L12_2 = L8_2 + 100.0
  L13_2 = false
  L9_2, L10_2 = L9_2(L10_2, L11_2, L12_2, L13_2)
  if not L9_2 then
    L11_2 = randomCoordsInRadius
    L12_2 = A0_2
    L13_2 = A1_2
    return L11_2(L12_2, L13_2)
  end
  L11_2 = vector3
  L12_2 = L6_2
  L13_2 = L7_2
  L14_2 = L10_2
  return L11_2(L12_2, L13_2, L14_2)
end
randomCoordsInRadius = L0_1
function L0_1(A0_2, A1_2, A2_2)
  local L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2
  L3_2 = true
  L4_2 = RequestScaleformMovie
  L5_2 = "STUNT_JUMPS"
  L4_2 = L4_2(L5_2)
  while true do
    L5_2 = HasScaleformMovieLoaded
    L6_2 = L4_2
    L5_2 = L5_2(L6_2)
    if L5_2 then
      break
    end
    L5_2 = Wait
    L6_2 = 0
    L5_2(L6_2)
  end
  L5_2 = BeginScaleformMovieMethod
  L6_2 = L4_2
  L7_2 = "SHOW_SHARD_STUNT_JUMP"
  L5_2(L6_2, L7_2)
  L5_2 = PushScaleformMovieMethodParameterString
  L6_2 = A0_2
  L5_2(L6_2)
  L5_2 = PushScaleformMovieMethodParameterString
  L6_2 = A1_2
  L5_2(L6_2)
  L5_2 = EndScaleformMovieMethod
  L5_2()
  L5_2 = PlaySoundFrontend
  L6_2 = -1
  L7_2 = "LOSER"
  L8_2 = "HUD_AWARDS"
  L9_2 = 1
  L5_2(L6_2, L7_2, L8_2, L9_2)
  L5_2 = SetTimeout
  L6_2 = A2_2
  function L7_2()
    local L0_3, L1_3
    L0_3 = false
    L3_2 = L0_3
  end
  L5_2(L6_2, L7_2)
  L5_2 = CreateThread
  function L6_2()
    local L0_3, L1_3, L2_3, L3_3, L4_3, L5_3
    while true do
      L0_3 = L3_2
      if not L0_3 then
        break
      end
      L0_3 = Wait
      L1_3 = 1
      L0_3(L1_3)
      L0_3 = DrawScaleformMovieFullscreen
      L1_3 = L4_2
      L2_3 = 255
      L3_3 = 255
      L4_3 = 255
      L5_3 = 255
      L0_3(L1_3, L2_3, L3_3, L4_3, L5_3)
    end
  end
  L5_2(L6_2)
end
showAnnouncement = L0_1
function L0_1(A0_2, A1_2, A2_2, A3_2)
  local L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2
  L4_2 = 0
  if not A0_2 then
    return L4_2
  end
  L5_2 = formatNumberToMin
  L6_2 = A1_2
  L5_2 = L5_2(L6_2)
  L6_2 = formatNumberToMin
  L7_2 = A2_2
  L6_2 = L6_2(L7_2)
  L5_2 = L5_2 - L6_2
  L4_2 = L5_2 * A3_2
  L6_2 = Config
  L6_2 = L6_2.Notification
  L7_2 = Lang
  L8_2 = "job"
  L7_2 = L7_2(L8_2)
  L8_2 = Lang
  L9_2 = "decuded_money"
  L10_2 = L4_2
  L8_2 = L8_2(L9_2, L10_2)
  L9_2 = "inform"
  L10_2 = 10000
  L6_2(L7_2, L8_2, L9_2, L10_2)
  return L4_2
end
calcuteDeductedMoney = L0_1