local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1, L10_1, L11_1, L12_1, L13_1
L0_1 = Config
L0_1 = L0_1.Jobs
L0_1 = L0_1.pizza_delivery
L1_1 = false
L2_1 = nil
L3_1 = nil
L4_1 = nil
L5_1 = nil
L6_1 = nil
L7_1 = nil
L8_1 = false
L9_1 = nil
L10_1 = nil
L11_1 = RegisterNetEvent
L12_1 = "wais:setDefault:JobThings"
function L13_1()
  local L0_2, L1_2
  L0_2 = changeToDefPizzaDelivery
  L1_2 = false
  L0_2(L1_2)
end
L11_1(L12_1, L13_1)
function L11_1(A0_2)
  local L1_2, L2_2, L3_2, L4_2, L5_2, L6_2, L7_2
  L1_2 = L4_1
  if nil ~= L1_2 then
    L1_2 = deleteCam
    L1_2()
    L1_2 = FreezeEntityPosition
    L2_2 = PlayerPedId
    L2_2 = L2_2()
    L3_2 = false
    L1_2(L2_2, L3_2)
  end
  L1_2 = DoesBlipExist
  L2_2 = L5_1
  L1_2 = L1_2(L2_2)
  if L1_2 then
    L1_2 = RemoveBlip
    L2_2 = L5_1
    L1_2(L2_2)
    L1_2 = nil
    L5_1 = L1_2
  end
  L1_2 = L6_1
  if nil ~= L1_2 then
    L1_2 = DetachEntity
    L2_2 = ped
    L3_2 = true
    L4_2 = false
    L1_2(L2_2, L3_2, L4_2)
    L1_2 = nil
    L6_1 = L1_2
    L1_2 = TriggerServerEvent
    L2_2 = "wais:deleteProp"
    L1_2(L2_2)
  end
  L1_2 = false
  L1_1 = L1_2
  L1_2 = lib
  L1_2 = L1_2.hideTextUI
  L1_2()
  L1_2 = L7_1
  if nil ~= L1_2 then
    L1_2 = L7_1
    L2_2 = L1_2
    L1_2 = L1_2.remove
    L1_2(L2_2)
    L1_2 = nil
    L7_1 = L1_2
  end
  L1_2 = L3_1
  if nil ~= L1_2 then
    L1_2 = L3_1
    L2_2 = L1_2
    L1_2 = L1_2.remove
    L1_2(L2_2)
    L1_2 = nil
    L3_1 = L1_2
  end
  if A0_2 then
    L1_2 = calcuteDeductedMoney
    L2_2 = L9_1.extraTimeEnabled
    L3_2 = L0_1.timer
    L3_2 = L3_2.delivery_time
    L4_2 = L9_1
    L5_2 = L4_2
    L4_2 = L4_2.getDuration
    L4_2 = L4_2(L5_2)
    L5_2 = L0_1.timer
    L5_2 = L5_2.deducted_per_min
    L1_2 = L1_2(L2_2, L3_2, L4_2, L5_2)
    L2_2 = TriggerServerEvent
    L3_2 = "wais:givePizza:Reward"
    L4_2 = CurrentJob
    L5_2 = L2_1
    L6_2 = L1_2
    L2_2(L3_2, L4_2, L5_2, L6_2)
    L2_2 = Config
    L2_2 = L2_2.Notification
    L3_2 = Lang
    L4_2 = "job"
    L3_2 = L3_2(L4_2)
    L4_2 = Lang
    L5_2 = "delivery_completed"
    L4_2 = L4_2(L5_2)
    L5_2 = "success"
    L6_2 = nil
    L2_2(L3_2, L4_2, L5_2, L6_2)
    L2_2 = Config
    L2_2 = L2_2.JobSuccess
    L3_2 = CurrentJob
    L4_2 = nil
    L5_2 = nil
    L6_2 = nil
    L7_2 = nil
    L2_2(L3_2, L4_2, L5_2, L6_2, L7_2)
  end
  L1_2 = L2_1
  if nil ~= L1_2 then
    L1_2 = nil
    L2_1 = L1_2
  end
  L1_2 = L9_1
  if nil ~= L1_2 then
    L1_2 = L9_1
    L2_2 = L1_2
    L1_2 = L1_2.delete
    L1_2(L2_2)
    L1_2 = nil
    L9_1 = L1_2
  end
  L1_2 = nil
  L6_1 = L1_2
  if A0_2 then
    L1_2 = setRandomPizzeria
    L1_2()
  end
end
changeToDefPizzaDelivery = L11_1
function L11_1(A0_2)
  local L1_2, L2_2, L3_2
  L1_2 = Config
  L1_2 = L1_2.AbuseController
  L1_2 = L1_2.warning_count
  L2_2 = CreateThread
  function L3_2()
    local L0_3, L1_3, L2_3, L3_3, L4_3
    while true do
      L0_3 = L8_1
      if L0_3 then
        break
      end
      L0_3 = A0_2
      if L0_3 then
        L0_3 = L10_1
        if not L0_3 then
        end
      end
      L0_3 = L1_2
      L0_3 = L0_3 - 1
      L1_2 = L0_3
      L0_3 = Config
      L0_3 = L0_3.Notification
      L1_3 = Lang
      L2_3 = "job"
      L1_3 = L1_3(L2_3)
      L2_3 = A0_2
      if L2_3 then
        L2_3 = Lang
        L3_3 = "go_back_pizzaboy"
        L2_3 = L2_3(L3_3)
        if L2_3 then
          goto lbl_30
        end
      end
      L2_3 = Lang
      L3_3 = "too_far_pizza"
      L2_3 = L2_3(L3_3)
      ::lbl_30::
      L3_3 = "warning"
      L4_3 = nil
      L0_3(L1_3, L2_3, L3_3, L4_3)
      L0_3 = L1_2
      if L0_3 <= 0 then
        L0_3 = changeToDefPizzaDelivery
        L1_3 = false
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
function L12_1()
  local L0_2, L1_2, L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2
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
          L5_3 = "pizza_delivery"
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
    L2_2 = "[^2INFO^7] Pizza Delivery Job Center has been initialized."
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
      L3_2 = "[^2INFO^7] Pizza Delivery Job Center Blip has been initialized."
      L2_2(L3_2)
    end
  end
  L1_2 = pairs
  L2_2 = L0_1.pizzerias
  L2_2 = L2_2.coords
  L1_2, L2_2, L3_2, L4_2 = L1_2(L2_2)
  for L5_2, L6_2 in L1_2, L2_2, L3_2, L4_2 do
    L7_2 = lib
    L7_2 = L7_2.zones
    L7_2 = L7_2.sphere
    L8_2 = {}
    L8_2.coords = L6_2
    L9_2 = L0_1.menu
    L9_2 = L9_2.interaction_distance
    L8_2.radius = L9_2
    L9_2 = L0_1.debug
    L8_2.debug = L9_2
    function L9_2(A0_3)
      local L1_3, L2_3, L3_3, L4_3, L5_3, L6_3, L7_3, L8_3
      L1_3 = PlayerPedId
      L1_3 = L1_3()
      L2_3 = GetEntityCoords
      L3_3 = L1_3
      L2_3 = L2_3(L3_3)
      L3_3 = L6_2
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
            L4_3 = L1_1
            if L4_3 then
              L4_3 = Config
              L4_3 = L4_3.Notification
              L5_3 = Lang
              L6_3 = "job"
              L5_3 = L5_3(L6_3)
              L6_3 = Lang
              L7_3 = "already_have_delivery"
              L6_3 = L6_3(L7_3)
              L7_3 = "error"
              L8_3 = nil
              return L4_3(L5_3, L6_3, L7_3, L8_3)
            end
            L4_3 = DoesEntityExist
            L5_3 = vehicle
            L4_3 = L4_3(L5_3)
            if L4_3 then
              L4_3 = DoScreenFadeOut
              L5_3 = 750
              L4_3(L5_3)
              while true do
                L4_3 = IsScreenFadedOut
                L4_3 = L4_3()
                if L4_3 then
                  break
                end
                L4_3 = Wait
                L5_3 = 0
                L4_3(L5_3)
              end
              L4_3 = setRandomDeliveryCoords
              L4_3()
              L4_3 = SetPedIntoVehicle
              L5_3 = L1_3
              L6_3 = vehicle
              L7_3 = -1
              L4_3(L5_3, L6_3, L7_3)
              L4_3 = DoScreenFadeIn
              L5_3 = 1500
              L4_3(L5_3)
            else
              L4_3 = Config
              L4_3 = L4_3.Notification
              L5_3 = Lang
              L6_3 = "job"
              L5_3 = L5_3(L6_3)
              L6_3 = Lang
              L7_3 = "car_not_found"
              L8_3 = L0_1.car_settings
              L8_3 = L8_3.model
              L6_3 = L6_3(L7_3, L8_3)
              L7_3 = "error"
              L8_3 = nil
              L4_3(L5_3, L6_3, L7_3, L8_3)
            end
          end
        end
      end
    end
    L8_2.inside = L9_2
    function L9_2()
      local L0_3, L1_3, L2_3, L3_3
      L0_3 = isDead
      if L0_3 then
        return
      end
      L0_3 = lib
      L0_3 = L0_3.showTextUI
      L1_3 = Lang
      L2_3 = "take_pizza"
      L1_3 = L1_3(L2_3)
      L2_3 = {}
      L2_3.position = "left-center"
      L2_3.icon = "pizza-slice"
      L3_3 = {}
      L3_3.color = "white"
      L2_3.style = L3_3
      L0_3(L1_3, L2_3)
    end
    L8_2.onEnter = L9_2
    function L9_2()
      local L0_3, L1_3
      L0_3 = lib
      L0_3 = L0_3.hideTextUI
      L0_3()
    end
    L8_2.onExit = L9_2
    L7_2 = L7_2(L8_2)
    L8_2 = L0_1.pizzerias
    L8_2 = L8_2.blips
    L8_2 = L8_2.show
    if L8_2 then
      L8_2 = AddBlipForCoord
      L9_2 = L6_2.x
      L10_2 = L6_2.y
      L11_2 = L6_2.z
      L8_2 = L8_2(L9_2, L10_2, L11_2)
      L9_2 = SetBlipSprite
      L10_2 = L8_2
      L11_2 = L0_1.pizzerias
      L11_2 = L11_2.blips
      L11_2 = L11_2.sprite
      L9_2(L10_2, L11_2)
      L9_2 = SetBlipDisplay
      L10_2 = L8_2
      L11_2 = 4
      L9_2(L10_2, L11_2)
      L9_2 = SetBlipScale
      L10_2 = L8_2
      L11_2 = L0_1.pizzerias
      L11_2 = L11_2.blips
      L11_2 = L11_2.scale
      L9_2(L10_2, L11_2)
      L9_2 = SetBlipColour
      L10_2 = L8_2
      L11_2 = L0_1.pizzerias
      L11_2 = L11_2.blips
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
      L10_2 = L0_1.pizzerias
      L10_2 = L10_2.blips
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
  end
  L1_2 = L0_1.debug
  if L1_2 then
    L1_2 = print
    L2_2 = "[^2INFO^7] Pizza Delivery Pizzeria location has been initialized."
    L1_2(L2_2)
  end
  L1_2 = points
  L2_2 = points
  L2_2 = #L2_2
  L2_2 = L2_2 + 1
  L1_2[L2_2] = L0_2
end
initPizza = L12_1
function L12_1()
  local L0_2, L1_2, L2_2, L3_2, L4_2, L5_2
  L0_2 = getRandomPizzeria
  L0_2 = L0_2()
  L1_2 = SetNewWaypoint
  L2_2 = L0_2.x
  L3_2 = L0_2.y
  L1_2(L2_2, L3_2)
  L1_2 = Config
  L1_2 = L1_2.Notification
  L2_2 = Lang
  L3_2 = "job"
  L2_2 = L2_2(L3_2)
  L3_2 = Lang
  L4_2 = "pizzeria_waypoint"
  L3_2 = L3_2(L4_2)
  L4_2 = "success"
  L5_2 = nil
  L1_2(L2_2, L3_2, L4_2, L5_2)
end
setRandomPizzeria = L12_1
function L12_1()
  local L0_2, L1_2, L2_2, L3_2, L4_2, L5_2, L6_2
  L0_2 = getRandomDeliveryCoords
  L0_2 = L0_2()
  L1_2 = L9_1
  if nil ~= L1_2 then
    L1_2 = L9_1
    L2_2 = L1_2
    L1_2 = L1_2.delete
    L1_2(L2_2)
    L1_2 = nil
    L9_1 = L1_2
  end
  L1_2 = JobTimer
  L2_2 = L1_2
  L1_2 = L1_2.New
  L3_2 = L0_1.timer
  L3_2 = L3_2.delivery_time
  L4_2 = L0_1.timer
  L4_2 = L4_2.extra_time
  L5_2 = false
  L1_2 = L1_2(L2_2, L3_2, L4_2, L5_2)
  L9_1 = L1_2
  L2_1 = L0_2
  L1_2 = true
  L1_1 = L1_2
  L1_2 = lib
  L1_2 = L1_2.zones
  L1_2 = L1_2.sphere
  L2_2 = {}
  L3_2 = vector3
  L4_2 = L2_1.x
  L5_2 = L2_1.y
  L6_2 = L2_1.z
  L3_2 = L3_2(L4_2, L5_2, L6_2)
  L2_2.coords = L3_2
  L2_2.radius = 30.0
  L3_2 = L0_1.debug
  L2_2.debug = L3_2
  function L3_2()
    local L0_3, L1_3
    L0_3 = true
    L8_1 = L0_3
  end
  L2_2.onEnter = L3_2
  function L3_2()
    local L0_3, L1_3
    L0_3 = false
    L8_1 = L0_3
    L0_3 = L11_1
    L1_3 = false
    L0_3(L1_3)
  end
  L2_2.onExit = L3_2
  L1_2 = L1_2(L2_2)
  L7_1 = L1_2
  L1_2 = L0_1.delivery_coords
  L1_2 = L1_2.blips
  L1_2 = L1_2.show
  if L1_2 then
    L1_2 = AddBlipForCoord
    L2_2 = L0_2.x
    L3_2 = L0_2.y
    L4_2 = L0_2.z
    L1_2 = L1_2(L2_2, L3_2, L4_2)
    L5_1 = L1_2
    L1_2 = SetBlipSprite
    L2_2 = L5_1
    L3_2 = L0_1.delivery_coords
    L3_2 = L3_2.blips
    L3_2 = L3_2.sprite
    L1_2(L2_2, L3_2)
    L1_2 = SetBlipDisplay
    L2_2 = L5_1
    L3_2 = 4
    L1_2(L2_2, L3_2)
    L1_2 = SetBlipScale
    L2_2 = L5_1
    L3_2 = L0_1.delivery_coords
    L3_2 = L3_2.blips
    L3_2 = L3_2.scale
    L1_2(L2_2, L3_2)
    L1_2 = SetBlipColour
    L2_2 = L5_1
    L3_2 = L0_1.delivery_coords
    L3_2 = L3_2.blips
    L3_2 = L3_2.color
    L1_2(L2_2, L3_2)
    L1_2 = SetBlipAsShortRange
    L2_2 = L5_1
    L3_2 = true
    L1_2(L2_2, L3_2)
    L1_2 = BeginTextCommandSetBlipName
    L2_2 = "STRING"
    L1_2(L2_2)
    L1_2 = AddTextComponentString
    L2_2 = L0_1.delivery_coords
    L2_2 = L2_2.blips
    L2_2 = L2_2.label
    L1_2(L2_2)
    L1_2 = EndTextCommandSetBlipName
    L2_2 = L5_1
    L1_2(L2_2)
  end
  L1_2 = SetNewWaypoint
  L2_2 = L0_2.x
  L3_2 = L0_2.y
  L1_2(L2_2, L3_2)
  L1_2 = Config
  L1_2 = L1_2.Notification
  L2_2 = Lang
  L3_2 = "job"
  L2_2 = L2_2(L3_2)
  L3_2 = Lang
  L4_2 = "delivery_waypoint"
  L3_2 = L3_2(L4_2)
  L4_2 = "success"
  L5_2 = nil
  L1_2(L2_2, L3_2, L4_2, L5_2)
end
setRandomDeliveryCoords = L12_1
function L12_1()
  local L0_2, L1_2, L2_2, L3_2
  L0_2 = math
  L0_2 = L0_2.randomseed
  L1_2 = GetGameTimer
  L1_2, L2_2, L3_2 = L1_2()
  L0_2(L1_2, L2_2, L3_2)
  L0_2 = L0_1.pizzerias
  L0_2 = L0_2.coords
  L1_2 = math
  L1_2 = L1_2.random
  L2_2 = 1
  L3_2 = L0_1.pizzerias
  L3_2 = L3_2.coords
  L3_2 = #L3_2
  L1_2 = L1_2(L2_2, L3_2)
  L0_2 = L0_2[L1_2]
  return L0_2
end
getRandomPizzeria = L12_1
function L12_1()
  local L0_2, L1_2, L2_2, L3_2
  L0_2 = math
  L0_2 = L0_2.randomseed
  L1_2 = GetGameTimer
  L1_2, L2_2, L3_2 = L1_2()
  L0_2(L1_2, L2_2, L3_2)
  L0_2 = L0_1.delivery_coords
  L0_2 = L0_2.coords
  L1_2 = math
  L1_2 = L1_2.random
  L2_2 = 1
  L3_2 = L0_1.delivery_coords
  L3_2 = L3_2.coords
  L3_2 = #L3_2
  L1_2 = L1_2(L2_2, L3_2)
  L0_2 = L0_2[L1_2]
  return L0_2
end
getRandomDeliveryCoords = L12_1
function L12_1()
  local L0_2, L1_2, L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2
  L0_2 = PlayerPedId
  L0_2 = L0_2()
  L1_2 = GetEntityCoords
  L2_2 = L0_2
  L1_2 = L1_2(L2_2)
  L2_2 = GetEntityHeading
  L3_2 = L0_2
  L2_2 = L2_2(L3_2)
  L3_2 = 2.0
  L4_2 = math
  L4_2 = L4_2.rad
  L5_2 = L2_2
  L4_2 = L4_2(L5_2)
  L5_2 = L1_2.x
  L6_2 = math
  L6_2 = L6_2.sin
  L7_2 = L4_2
  L6_2 = L6_2(L7_2)
  L6_2 = L3_2 * L6_2
  L5_2 = L5_2 - L6_2
  L6_2 = L0_1.CameraOffsets
  L6_2 = L6_2.x
  L5_2 = L5_2 + L6_2
  L6_2 = L1_2.y
  L7_2 = math
  L7_2 = L7_2.cos
  L8_2 = L4_2
  L7_2 = L7_2(L8_2)
  L7_2 = L3_2 * L7_2
  L6_2 = L6_2 + L7_2
  L7_2 = L0_1.CameraOffsets
  L7_2 = L7_2.y
  L6_2 = L6_2 + L7_2
  L7_2 = L1_2.z
  L8_2 = L0_1.CameraOffsets
  L8_2 = L8_2.z
  L7_2 = L7_2 + L8_2
  L8_2 = CreateCamWithParams
  L9_2 = "DEFAULT_SCRIPTED_CAMERA"
  L10_2 = L5_2
  L11_2 = L6_2
  L12_2 = L7_2
  L13_2 = 0.0
  L14_2 = 0.0
  L15_2 = L2_2 + 180.0
  L16_2 = L0_1.CameraOffsets
  L16_2 = L16_2.fov
  L17_2 = false
  L18_2 = 0
  L8_2 = L8_2(L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2)
  L4_1 = L8_2
  L8_2 = SetCamActive
  L9_2 = L4_1
  L10_2 = true
  L8_2(L9_2, L10_2)
  L8_2 = RenderScriptCams
  L9_2 = true
  L10_2 = true
  L11_2 = 2000
  L12_2 = true
  L13_2 = true
  L8_2(L9_2, L10_2, L11_2, L12_2, L13_2)
  L8_2 = SetCamUseShallowDofMode
  L9_2 = L4_1
  L10_2 = true
  L8_2(L9_2, L10_2)
  L8_2 = SetCamNearDof
  L9_2 = L4_1
  L10_2 = 0.1
  L8_2(L9_2, L10_2)
  L8_2 = SetCamFarDof
  L9_2 = L4_1
  L10_2 = 1.0
  L8_2(L9_2, L10_2)
  L8_2 = SetCamDofStrength
  L9_2 = L4_1
  L10_2 = 1
  L8_2(L9_2, L10_2)
  L8_2 = SetCamDofFocalLengthMultiplier
  L9_2 = cam
  L10_2 = 100.0
  L8_2(L9_2, L10_2)
  L8_2 = PointCamAtCoord
  L9_2 = L4_1
  L10_2 = L1_2.x
  L11_2 = L1_2.y
  L12_2 = L1_2.z
  L13_2 = L0_1.CameraOffsets
  L13_2 = L13_2.zRot
  L12_2 = L12_2 + L13_2
  L8_2(L9_2, L10_2, L11_2, L12_2)
end
camStuff = L12_1
function L12_1()
  local L0_2, L1_2, L2_2, L3_2, L4_2, L5_2
  L0_2 = L4_1
  if nil ~= L0_2 then
    L0_2 = RenderScriptCams
    L1_2 = false
    L2_2 = true
    L3_2 = 550
    L4_2 = true
    L5_2 = true
    L0_2(L1_2, L2_2, L3_2, L4_2, L5_2)
    L0_2 = DestroyCam
    L1_2 = L4_1
    L2_2 = false
    L0_2(L1_2, L2_2)
    L0_2 = nil
    L4_1 = L0_2
  end
end
deleteCam = L12_1
function L12_1()
  local L0_2, L1_2, L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2
  L0_2 = loadDict
  L1_2 = L0_1.prop
  L1_2 = L1_2.delivery_animation
  L1_2 = L1_2.animDict
  L0_2 = L0_2(L1_2)
  if not L0_2 then
    return
  end
  L0_2 = TaskPlayAnim
  L1_2 = PlayerPedId
  L1_2 = L1_2()
  L2_2 = L0_1.prop
  L2_2 = L2_2.delivery_animation
  L2_2 = L2_2.animDict
  L3_2 = L0_1.prop
  L3_2 = L3_2.delivery_animation
  L3_2 = L3_2.animName
  L4_2 = 3.0
  L5_2 = 3.0
  L6_2 = L0_1.prop
  L6_2 = L6_2.delivery_animation
  L6_2 = L6_2.loop
  if L6_2 then
    L6_2 = -1
    if L6_2 then
      goto lbl_31
    end
  end
  L6_2 = L0_1.prop
  L6_2 = L6_2.delivery_animation
  L6_2 = L6_2.duration
  ::lbl_31::
  L7_2 = L0_1.prop
  L7_2 = L7_2.delivery_animation
  L7_2 = L7_2.loop
  if L7_2 then
    L7_2 = 1
    if L7_2 then
      goto lbl_40
    end
  end
  L7_2 = 51
  ::lbl_40::
  L8_2 = 0
  L9_2 = false
  L10_2 = false
  L11_2 = false
  L0_2(L1_2, L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2)
end
makeDeliveryAnim = L12_1
function L12_1(A0_2)
  local L1_2, L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2, L20_2
  L1_2 = CurrentJob
  if "pizza_delivery" ~= L1_2 then
    return
  end
  L1_2 = L6_1
  if nil ~= L1_2 then
    return
  end
  L1_2 = L2_1
  if nil == L1_2 then
    L1_2 = Config
    L1_2 = L1_2.Notification
    L2_2 = Lang
    L3_2 = "job"
    L2_2 = L2_2(L3_2)
    L3_2 = Lang
    L4_2 = "no_delivery_coords"
    L3_2 = L3_2(L4_2)
    L4_2 = "error"
    L5_2 = nil
    return L1_2(L2_2, L3_2, L4_2, L5_2)
  end
  L1_2 = PlayerPedId
  L1_2 = L1_2()
  L2_2 = GetEntityCoords
  L3_2 = L1_2
  L2_2 = L2_2(L3_2)
  L3_2 = vector3
  L4_2 = L2_1.x
  L5_2 = L2_1.y
  L6_2 = L2_1.z
  L3_2 = L3_2(L4_2, L5_2, L6_2)
  L3_2 = L2_2 - L3_2
  L3_2 = #L3_2
  if L3_2 > 10.0 then
    L4_2 = Config
    L4_2 = L4_2.Notification
    L5_2 = Lang
    L6_2 = "job"
    L5_2 = L5_2(L6_2)
    L6_2 = Lang
    L7_2 = "delivery_too_far"
    L6_2 = L6_2(L7_2)
    L7_2 = "error"
    L8_2 = nil
    return L4_2(L5_2, L6_2, L7_2, L8_2)
  end
  L4_2 = joaat
  L5_2 = L0_1.prop
  L5_2 = L5_2.model
  L4_2 = L4_2(L5_2)
  L5_2 = loadModel
  L6_2 = L4_2
  L5_2 = L5_2(L6_2)
  if not L5_2 then
    return
  end
  L5_2 = loadDict
  L6_2 = L0_1.prop
  L6_2 = L6_2.take_animation
  L6_2 = L6_2.animDict
  L5_2 = L5_2(L6_2)
  if not L5_2 then
    return
  end
  L5_2 = CreateObject
  L6_2 = L4_2
  L7_2 = L2_2.x
  L8_2 = L2_2.y
  L9_2 = L2_2.z
  L10_2 = true
  L11_2 = false
  L12_2 = false
  L5_2 = L5_2(L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2)
  L6_1 = L5_2
  L5_2 = SetEntityNoCollisionEntity
  L6_2 = L1_2
  L7_2 = L6_1
  L8_2 = true
  L5_2(L6_2, L7_2, L8_2)
  L5_2 = AttachEntityToEntity
  L6_2 = L6_1
  L7_2 = L1_2
  L8_2 = GetPedBoneIndex
  L9_2 = L1_2
  L10_2 = L0_1.prop
  L10_2 = L10_2.attach_settings
  L10_2 = L10_2.bone
  L8_2 = L8_2(L9_2, L10_2)
  L9_2 = L0_1.prop
  L9_2 = L9_2.attach_settings
  L9_2 = L9_2.coords
  L9_2 = L9_2.x
  L10_2 = L0_1.prop
  L10_2 = L10_2.attach_settings
  L10_2 = L10_2.coords
  L10_2 = L10_2.y
  L11_2 = L0_1.prop
  L11_2 = L11_2.attach_settings
  L11_2 = L11_2.coords
  L11_2 = L11_2.z
  L12_2 = L0_1.prop
  L12_2 = L12_2.attach_settings
  L12_2 = L12_2.rotation
  L12_2 = L12_2.x
  L13_2 = L0_1.prop
  L13_2 = L13_2.attach_settings
  L13_2 = L13_2.rotation
  L13_2 = L13_2.y
  L14_2 = L0_1.prop
  L14_2 = L14_2.attach_settings
  L14_2 = L14_2.rotation
  L14_2 = L14_2.z
  L15_2 = false
  L16_2 = true
  L17_2 = false
  L18_2 = false
  L19_2 = 2
  L20_2 = true
  L5_2(L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2, L20_2)
  L5_2 = TaskPlayAnim
  L6_2 = L1_2
  L7_2 = L0_1.prop
  L7_2 = L7_2.take_animation
  L7_2 = L7_2.animDict
  L8_2 = L0_1.prop
  L8_2 = L8_2.take_animation
  L8_2 = L8_2.animName
  L9_2 = 3.0
  L10_2 = 3.0
  L11_2 = -1
  L12_2 = 51
  L13_2 = 0
  L14_2 = false
  L15_2 = false
  L16_2 = false
  L5_2(L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2)
  L5_2 = TriggerServerEvent
  L6_2 = "wais:addProp"
  L7_2 = L6_1
  L8_2 = NetworkGetNetworkIdFromEntity
  L9_2 = L6_1
  L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2, L20_2 = L8_2(L9_2)
  L5_2(L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2, L20_2)
  L5_2 = lib
  L5_2 = L5_2.zones
  L5_2 = L5_2.sphere
  L6_2 = {}
  L7_2 = vector3
  L8_2 = L2_1.x
  L9_2 = L2_1.y
  L10_2 = L2_1.z
  L7_2 = L7_2(L8_2, L9_2, L10_2)
  L6_2.coords = L7_2
  L7_2 = L0_1.menu
  L7_2 = L7_2.interaction_distance
  L6_2.radius = L7_2
  L7_2 = L0_1.debug
  L6_2.debug = L7_2
  function L7_2(A0_3)
    local L1_3, L2_3, L3_3, L4_3, L5_3, L6_3, L7_3, L8_3, L9_3, L10_3, L11_3, L12_3, L13_3, L14_3, L15_3, L16_3, L17_3, L18_3, L19_3
    L1_3 = PlayerPedId
    L1_3 = L1_3()
    L2_3 = GetEntityCoords
    L3_3 = L1_3
    L2_3 = L2_3(L3_3)
    L3_3 = vector3
    L4_3 = L2_1.x
    L5_3 = L2_1.y
    L6_3 = L2_1.z
    L3_3 = L3_3(L4_3, L5_3, L6_3)
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
          L4_3 = L1_1
          if L4_3 then
            L4_3 = FreezeEntityPosition
            L5_3 = PlayerPedId
            L5_3 = L5_3()
            L6_3 = true
            L4_3(L5_3, L6_3)
            L4_3 = camStuff
            L4_3()
            L4_3 = DoScreenFadeOut
            L5_3 = 750
            L4_3(L5_3)
            while true do
              L4_3 = IsScreenFadedOut
              L4_3 = L4_3()
              if L4_3 then
                break
              end
              L4_3 = DoScreenFadeOut
              L5_3 = 750
              L4_3(L5_3)
              L4_3 = Wait
              L5_3 = 250
              L4_3(L5_3)
            end
            L4_3 = ClearPedTasks
            L5_3 = L1_3
            L4_3(L5_3)
            L4_3 = ClearPedTasksImmediately
            L5_3 = L1_3
            L4_3(L5_3)
            L4_3 = AttachEntityToEntity
            L5_3 = L6_1
            L6_3 = L1_3
            L7_3 = GetPedBoneIndex
            L8_3 = L1_3
            L9_3 = L0_1.prop
            L9_3 = L9_3.attach_settings
            L9_3 = L9_3.bone
            L7_3 = L7_3(L8_3, L9_3)
            L8_3 = 0.0
            L9_3 = 0.0
            L10_3 = 0.0
            L11_3 = 0.0
            L12_3 = 0.0
            L13_3 = 0.0
            L14_3 = false
            L15_3 = true
            L16_3 = false
            L17_3 = false
            L18_3 = 2
            L19_3 = true
            L4_3(L5_3, L6_3, L7_3, L8_3, L9_3, L10_3, L11_3, L12_3, L13_3, L14_3, L15_3, L16_3, L17_3, L18_3, L19_3)
            L4_3 = SetEntityHeading
            L5_3 = L1_3
            L6_3 = L2_1.w
            L4_3(L5_3, L6_3)
            L4_3 = Wait
            L5_3 = 1250
            L4_3(L5_3)
            L4_3 = DoScreenFadeIn
            L5_3 = 1000
            L4_3(L5_3)
            L4_3 = makeDeliveryAnim
            L4_3()
            L4_3 = SetTimeout
            L5_3 = L0_1.prop
            L5_3 = L5_3.delivery_animation
            L5_3 = L5_3.duration
            function L6_3()
              local L0_4, L1_4
              L0_4 = changeToDefPizzaDelivery
              L1_4 = true
              L0_4(L1_4)
            end
            L4_3(L5_3, L6_3)
          end
        end
      end
    end
  end
  L6_2.inside = L7_2
  function L7_2()
    local L0_3, L1_3, L2_3, L3_3
    L0_3 = isDead
    if L0_3 then
      return
    end
    L0_3 = lib
    L0_3 = L0_3.showTextUI
    L1_3 = Lang
    L2_3 = "deliver_the_pizza"
    L1_3 = L1_3(L2_3)
    L2_3 = {}
    L2_3.position = "left-center"
    L2_3.icon = "pizza-slice"
    L3_3 = {}
    L3_3.color = "white"
    L2_3.style = L3_3
    L0_3(L1_3, L2_3)
  end
  L6_2.onEnter = L7_2
  function L7_2()
    local L0_3, L1_3
    L0_3 = lib
    L0_3 = L0_3.hideTextUI
    L0_3()
  end
  L6_2.onExit = L7_2
  L5_2 = L5_2(L6_2)
  L3_1 = L5_2
end
createPizzaProp = L12_1
L12_1 = CreateThread
function L13_1()
  local L0_2, L1_2, L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2, L20_2, L21_2, L22_2, L23_2, L24_2, L25_2, L26_2, L27_2, L28_2, L29_2, L30_2, L31_2, L32_2, L33_2, L34_2, L35_2
  while true do
    L0_2 = PlayerPedId
    L0_2 = L0_2()
    L1_2 = GetEntityCoords
    L2_2 = L0_2
    L1_2 = L1_2(L2_2)
    L2_2 = 1000
    L3_2 = CurrentJob
    if "pizza_delivery" == L3_2 then
      L3_2 = L0_1.disabled
      if not L3_2 then
        L3_2 = L2_1
        if nil ~= L3_2 then
          L3_2 = GetVehiclePedIsIn
          L4_2 = L0_2
          L5_2 = false
          L3_2 = L3_2(L4_2, L5_2)
          L4_2 = vehicle
          if L3_2 ~= L4_2 then
            L4_2 = L8_1
            if not L4_2 then
              L4_2 = L10_1
              if nil == L4_2 then
                L4_2 = true
                L10_1 = L4_2
                L4_2 = L11_1
                L5_2 = true
                L4_2(L5_2)
              end
          end
          else
            L4_2 = L10_1
            if L4_2 then
              L4_2 = nil
              L10_1 = L4_2
            end
          end
          L4_2 = vector3
          L5_2 = L2_1.x
          L6_2 = L2_1.y
          L7_2 = L2_1.z
          L4_2 = L4_2(L5_2, L6_2, L7_2)
          L4_2 = L1_2 - L4_2
          L4_2 = #L4_2
          L5_2 = Config
          L5_2 = L5_2.DrawMarkerInteractDistance
          if L4_2 <= L5_2 then
            L2_2 = 5
            L5_2 = DrawMarker
            L6_2 = 1
            L7_2 = L2_1.x
            L8_2 = L2_1.y
            L9_2 = L2_1.z
            L9_2 = L9_2 - 0.95
            L10_2 = 0
            L11_2 = 0
            L12_2 = 0
            L13_2 = 0
            L14_2 = 0
            L15_2 = 0
            L16_2 = L0_1.menu
            L16_2 = L16_2.interaction_distance
            L17_2 = L0_1.menu
            L17_2 = L17_2.interaction_distance
            L18_2 = L0_1.menu
            L18_2 = L18_2.interaction_distance
            L19_2 = 255
            L20_2 = 255
            L21_2 = 0
            L22_2 = 200
            L23_2 = false
            L24_2 = false
            L25_2 = 2
            L26_2 = false
            L27_2 = false
            L28_2 = false
            L29_2 = false
            L5_2(L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2, L20_2, L21_2, L22_2, L23_2, L24_2, L25_2, L26_2, L27_2, L28_2, L29_2)
          end
        else
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
            L15_2 = L0_1.menu
            L15_2 = L15_2.interaction_distance
            L16_2 = L0_1.menu
            L16_2 = L16_2.interaction_distance
            L17_2 = L0_1.menu
            L17_2 = L17_2.interaction_distance
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
          L4_2 = pairs
          L5_2 = L0_1.pizzerias
          L5_2 = L5_2.coords
          L4_2, L5_2, L6_2, L7_2 = L4_2(L5_2)
          for L8_2, L9_2 in L4_2, L5_2, L6_2, L7_2 do
            L10_2 = L1_2 - L9_2
            L10_2 = #L10_2
            L11_2 = Config
            L11_2 = L11_2.DrawMarkerInteractDistance
            if L10_2 <= L11_2 then
              L2_2 = 5
              L11_2 = DrawMarker
              L12_2 = 1
              L13_2 = L9_2.x
              L14_2 = L9_2.y
              L15_2 = L9_2.z
              L15_2 = L15_2 - 0.95
              L16_2 = 0
              L17_2 = 0
              L18_2 = 0
              L19_2 = 0
              L20_2 = 0
              L21_2 = 0
              L22_2 = L0_1.menu
              L22_2 = L22_2.interaction_distance
              L23_2 = L0_1.menu
              L23_2 = L23_2.interaction_distance
              L24_2 = L0_1.menu
              L24_2 = L24_2.interaction_distance
              L25_2 = 255
              L26_2 = 255
              L27_2 = 0
              L28_2 = 200
              L29_2 = false
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
    L3_2 = Wait
    L4_2 = L2_2
    L3_2(L4_2)
  end
end
L12_1(L13_1)