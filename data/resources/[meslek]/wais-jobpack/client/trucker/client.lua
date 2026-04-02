local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1
L0_1 = Config
L0_1 = L0_1.Jobs
L0_1 = L0_1.trucker
L1_1 = vehicle
truckerSelectedIndex = 0
truckerVehicle = L1_1
L1_1 = nil
L2_1 = nil
trailerDeliveredB = false
deliveryBlip = L2_1
trailerBlips = L1_1
L1_1 = false
L2_1 = nil
L3_1 = RegisterNetEvent
L4_1 = "wais:setDefault:JobThings"
function L5_1()
  local L0_2, L1_2
  L0_2 = Trailers
  L1_2 = L0_2
  L0_2 = L0_2.deleteAll
  L0_2(L1_2)
  L0_2 = truckerSelectedIndex
  if 0 ~= L0_2 then
    truckerSelectedIndex = 0
  end
  L0_2 = trailerBlips
  if nil ~= L0_2 then
    L0_2 = deleteTrailerBlip
    L0_2()
  end
  L0_2 = deliveryBlip
  if nil ~= L0_2 then
    L0_2 = RemoveBlip
    L1_2 = deliveryBlip
    L0_2(L1_2)
    deliveryBlip = nil
  end
  L0_2 = L2_1
  if nil ~= L0_2 then
    L0_2 = L2_1
    L1_2 = L0_2
    L0_2 = L0_2.delete
    L0_2(L1_2)
    L0_2 = nil
    L2_1 = L0_2
  end
  L0_2 = false
  trailerDeliveredB = false
  L1_1 = L0_2
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
      L0_3 = L1_1
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
      L3_3 = "too_far_truck"
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
function L4_1(A0_2, A1_2, A2_2, A3_2, A4_2, A5_2, A6_2, A7_2, A8_2, A9_2)
  local L10_2, L11_2, L12_2, L13_2, L14_2, L15_2
  L10_2 = SetTextFont
  L11_2 = Config
  L11_2 = L11_2.FontStyle
  L10_2(L11_2)
  L10_2 = SetTextProportional
  L11_2 = 0
  L10_2(L11_2)
  L10_2 = SetTextScale
  L11_2 = A5_2
  L12_2 = A5_2
  L10_2(L11_2, L12_2)
  L10_2 = SetTextColour
  L11_2 = A6_2
  L12_2 = A7_2
  L13_2 = A8_2
  L14_2 = A9_2
  L10_2(L11_2, L12_2, L13_2, L14_2)
  L10_2 = SetTextDropShadow
  L11_2 = 0
  L12_2 = 0
  L13_2 = 0
  L14_2 = 0
  L15_2 = 255
  L10_2(L11_2, L12_2, L13_2, L14_2, L15_2)
  L10_2 = SetTextEdge
  L11_2 = 1
  L12_2 = 0
  L13_2 = 0
  L14_2 = 0
  L15_2 = 255
  L10_2(L11_2, L12_2, L13_2, L14_2, L15_2)
  L10_2 = SetTextDropShadow
  L10_2()
  L10_2 = SetTextOutline
  L10_2()
  L10_2 = SetTextCentre
  L11_2 = A2_2
  L10_2(L11_2)
  L10_2 = SetTextEntry
  L11_2 = "STRING"
  L10_2(L11_2)
  L10_2 = AddTextComponentString
  L11_2 = A0_2
  L10_2(L11_2)
  L10_2 = DrawText
  L11_2 = A3_2
  L12_2 = A4_2
  L10_2(L11_2, L12_2)
end
function L5_1()
  local L0_2, L1_2, L2_2, L3_2, L4_2
  L0_2 = AddBlipForCoord
  L1_2 = L0_1.job_list
  L2_2 = truckerSelectedIndex
  L1_2 = L1_2[L2_2]
  L1_2 = L1_2.delivery_coords
  L1_2 = L1_2.x
  L2_2 = L0_1.job_list
  L3_2 = truckerSelectedIndex
  L2_2 = L2_2[L3_2]
  L2_2 = L2_2.delivery_coords
  L2_2 = L2_2.y
  L3_2 = L0_1.job_list
  L4_2 = truckerSelectedIndex
  L3_2 = L3_2[L4_2]
  L3_2 = L3_2.delivery_coords
  L3_2 = L3_2.z
  L0_2 = L0_2(L1_2, L2_2, L3_2)
  deliveryBlip = L0_2
  L0_2 = SetBlipSprite
  L1_2 = deliveryBlip
  L2_2 = L0_1.job_list
  L3_2 = truckerSelectedIndex
  L2_2 = L2_2[L3_2]
  L2_2 = L2_2.blips
  L2_2 = L2_2.sprite
  L0_2(L1_2, L2_2)
  L0_2 = SetBlipScale
  L1_2 = deliveryBlip
  L2_2 = L0_1.job_list
  L3_2 = truckerSelectedIndex
  L2_2 = L2_2[L3_2]
  L2_2 = L2_2.blips
  L2_2 = L2_2.scale
  L0_2(L1_2, L2_2)
  L0_2 = SetBlipColour
  L1_2 = deliveryBlip
  L2_2 = L0_1.job_list
  L3_2 = truckerSelectedIndex
  L2_2 = L2_2[L3_2]
  L2_2 = L2_2.blips
  L2_2 = L2_2.color
  L0_2(L1_2, L2_2)
  L0_2 = SetBlipAsShortRange
  L1_2 = deliveryBlip
  L2_2 = true
  L0_2(L1_2, L2_2)
  L0_2 = BeginTextCommandSetBlipName
  L1_2 = "STRING"
  L0_2(L1_2)
  L0_2 = AddTextComponentString
  L1_2 = Lang
  L2_2 = "delivery_point"
  L1_2, L2_2, L3_2, L4_2 = L1_2(L2_2)
  L0_2(L1_2, L2_2, L3_2, L4_2)
  L0_2 = EndTextCommandSetBlipName
  L1_2 = deliveryBlip
  L0_2(L1_2)
  L0_2 = blips
  L1_2 = blips
  L1_2 = #L1_2
  L1_2 = L1_2 + 1
  L2_2 = deliveryBlip
  L0_2[L1_2] = L2_2
end
createDeliveryBlips = L5_1
function L5_1(A0_2)
  local L1_2, L2_2, L3_2, L4_2, L5_2
  if nil ~= A0_2 then
    L1_2 = AddBlipForEntity
    L2_2 = A0_2
    L1_2 = L1_2(L2_2)
    trailerBlips = L1_2
  else
    L1_2 = AddBlipForCoord
    L2_2 = L0_1.job_list
    L3_2 = truckerSelectedIndex
    L2_2 = L2_2[L3_2]
    L2_2 = L2_2.trailer_stuff
    L2_2 = L2_2.coords
    L2_2 = L2_2.x
    L3_2 = L0_1.job_list
    L4_2 = truckerSelectedIndex
    L3_2 = L3_2[L4_2]
    L3_2 = L3_2.trailer_stuff
    L3_2 = L3_2.coords
    L3_2 = L3_2.y
    L4_2 = L0_1.job_list
    L5_2 = truckerSelectedIndex
    L4_2 = L4_2[L5_2]
    L4_2 = L4_2.trailer_stuff
    L4_2 = L4_2.coords
    L4_2 = L4_2.z
    L1_2 = L1_2(L2_2, L3_2, L4_2)
    trailerBlips = L1_2
  end
  L1_2 = SetBlipSprite
  L2_2 = trailerBlips
  L3_2 = 479
  L1_2(L2_2, L3_2)
  L1_2 = SetBlipScale
  L2_2 = trailerBlips
  L3_2 = L0_1.job_list
  L4_2 = truckerSelectedIndex
  L3_2 = L3_2[L4_2]
  L3_2 = L3_2.blips
  L3_2 = L3_2.scale
  L1_2(L2_2, L3_2)
  L1_2 = SetBlipColour
  L2_2 = trailerBlips
  L3_2 = L0_1.job_list
  L4_2 = truckerSelectedIndex
  L3_2 = L3_2[L4_2]
  L3_2 = L3_2.blips
  L3_2 = L3_2.color
  L1_2(L2_2, L3_2)
  L1_2 = SetBlipAsShortRange
  L2_2 = trailerBlips
  L3_2 = true
  L1_2(L2_2, L3_2)
  L1_2 = BeginTextCommandSetBlipName
  L2_2 = "STRING"
  L1_2(L2_2)
  L1_2 = AddTextComponentString
  L2_2 = Lang
  L3_2 = "trailer_type"
  L2_2, L3_2, L4_2, L5_2 = L2_2(L3_2)
  L1_2(L2_2, L3_2, L4_2, L5_2)
  L1_2 = EndTextCommandSetBlipName
  L2_2 = trailerBlips
  L1_2(L2_2)
  L1_2 = blips
  L2_2 = blips
  L2_2 = #L2_2
  L2_2 = L2_2 + 1
  L3_2 = trailerBlips
  L1_2[L2_2] = L3_2
end
createTrailerBlip = L5_1
function L5_1()
  local L0_2, L1_2
  L0_2 = trailerBlips
  if nil ~= L0_2 then
    L0_2 = RemoveBlip
    L1_2 = trailerBlips
    L0_2(L1_2)
    trailerBlips = nil
  end
end
deleteTrailerBlip = L5_1
function L5_1()
  local L0_2, L1_2, L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2
  L0_2 = L0_1.disabled
  if L0_2 then
    return
  end
  L0_2 = {}
  L1_2 = lib
  L1_2 = L1_2.zones
  L1_2 = L1_2.sphere
  L2_2 = {}
  L3_2 = L0_1.menu
  L3_2 = L3_2.job_menu
  L2_2.coords = L3_2
  L3_2 = L0_1.menu
  L3_2 = L3_2.interaction_distance
  L2_2.radius = L3_2
  L3_2 = L0_1.debug
  L2_2.debug = L3_2
  function L3_2(A0_3)
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
          L5_3 = "trucker"
          L6_3 = L0_1.name
          L4_3(L5_3, L6_3)
        end
      end
    end
  end
  L2_2.inside = L3_2
  L3_2 = showJobMenuTextUI
  L2_2.onEnter = L3_2
  L3_2 = exitJobMenuPoint
  L2_2.onExit = L3_2
  L1_2 = L1_2(L2_2)
  L2_2 = L0_1.debug
  if L2_2 then
    L2_2 = print
    L3_2 = "[^2INFO^7] Trucker Job Center has been initialized."
    L2_2(L3_2)
  end
  L2_2 = L0_1.menu
  L2_2 = L2_2.blips
  L2_2 = L2_2.show
  if L2_2 then
    L2_2 = AddBlipForCoord
    L3_2 = L0_1.menu
    L3_2 = L3_2.job_menu
    L3_2 = L3_2.x
    L4_2 = L0_1.menu
    L4_2 = L4_2.job_menu
    L4_2 = L4_2.y
    L5_2 = L0_1.menu
    L5_2 = L5_2.job_menu
    L5_2 = L5_2.z
    L2_2 = L2_2(L3_2, L4_2, L5_2)
    L3_2 = SetBlipSprite
    L4_2 = L2_2
    L5_2 = L0_1.menu
    L5_2 = L5_2.blips
    L5_2 = L5_2.sprite
    L3_2(L4_2, L5_2)
    L3_2 = SetBlipDisplay
    L4_2 = L2_2
    L5_2 = 4
    L3_2(L4_2, L5_2)
    L3_2 = SetBlipScale
    L4_2 = L2_2
    L5_2 = L0_1.menu
    L5_2 = L5_2.blips
    L5_2 = L5_2.scale
    L3_2(L4_2, L5_2)
    L3_2 = SetBlipColour
    L4_2 = L2_2
    L5_2 = L0_1.menu
    L5_2 = L5_2.blips
    L5_2 = L5_2.color
    L3_2(L4_2, L5_2)
    L3_2 = SetBlipAsShortRange
    L4_2 = L2_2
    L5_2 = true
    L3_2(L4_2, L5_2)
    L3_2 = BeginTextCommandSetBlipName
    L4_2 = "STRING"
    L3_2(L4_2)
    L3_2 = AddTextComponentString
    L4_2 = L0_1.menu
    L4_2 = L4_2.blips
    L4_2 = L4_2.label
    L3_2(L4_2)
    L3_2 = EndTextCommandSetBlipName
    L4_2 = L2_2
    L3_2(L4_2)
    L3_2 = blips
    L4_2 = blips
    L4_2 = #L4_2
    L4_2 = L4_2 + 1
    L3_2[L4_2] = L2_2
    L3_2 = L0_1.debug
    if L3_2 then
      L3_2 = print
      L4_2 = "[^2INFO^7] Trucker Job Center Blip has been initialized."
      L3_2(L4_2)
    end
  end
  L2_2 = points
  L3_2 = points
  L3_2 = #L3_2
  L3_2 = L3_2 + 1
  L2_2[L3_2] = L1_2
  L2_2 = pairs
  L3_2 = L0_1.job_list
  L2_2, L3_2, L4_2, L5_2 = L2_2(L3_2)
  for L6_2, L7_2 in L2_2, L3_2, L4_2, L5_2 do
    L8_2 = #L0_2
    L8_2 = L8_2 + 1
    L9_2 = {}
    L10_2 = L7_2.menu_stuff
    L10_2 = L10_2.name
    L9_2.title = L10_2
    L10_2 = Lang
    L11_2 = "trailer_reward"
    L12_2 = L7_2.reward
    L10_2 = L10_2(L11_2, L12_2)
    L9_2.description = L10_2
    L10_2 = {}
    L11_2 = {}
    L12_2 = Lang
    L13_2 = "trailer_type"
    L12_2 = L12_2(L13_2)
    L11_2.label = L12_2
    L12_2 = L7_2.menu_stuff
    L12_2 = L12_2.t_type
    L11_2.value = L12_2
    L12_2 = {}
    L13_2 = Lang
    L14_2 = "trailer_delivery_time"
    L13_2 = L13_2(L14_2)
    L12_2.label = L13_2
    L13_2 = formatNumberToMinSec
    L14_2 = L7_2.delivery_time
    L13_2 = L13_2(L14_2)
    L12_2.value = L13_2
    L10_2[1] = L11_2
    L10_2[2] = L12_2
    L9_2.metadata = L10_2
    L9_2.icon = "trailer"
    function L10_2()
      local L0_3, L1_3, L2_3, L3_3, L4_3
      L0_3 = truckerSelectedIndex
      if 0 ~= L0_3 then
        L0_3 = Config
        L0_3 = L0_3.Notification
        L1_3 = Lang
        L2_3 = "job"
        L1_3 = L1_3(L2_3)
        L2_3 = Lang
        L3_3 = "already_have_delivery"
        L2_3 = L2_3(L3_3)
        L3_3 = "warning"
        L4_3 = 10000
        L0_3(L1_3, L2_3, L3_3, L4_3)
        return
      end
      L0_3 = L0_1.debug
      if L0_3 then
        L0_3 = print
        L1_3 = "[^2INFO^7] Selected Job: %s - Job index: %s"
        L2_3 = L1_3
        L1_3 = L1_3.format
        L3_3 = L7_2.menu_stuff
        L3_3 = L3_3.name
        L4_3 = L6_2
        L1_3, L2_3, L3_3, L4_3 = L1_3(L2_3, L3_3, L4_3)
        L0_3(L1_3, L2_3, L3_3, L4_3)
      end
      L0_3 = spawnJobCar
      L1_3 = "trucker"
      L0_3 = L0_3(L1_3)
      if L0_3 then
        L0_3 = L6_2
        truckerSelectedIndex = L0_3
        L0_3 = JobTimer
        L1_3 = L0_3
        L0_3 = L0_3.New
        L2_3 = L7_2.delivery_time
        L3_3 = L7_2.extra_time
        L4_3 = false
        L0_3 = L0_3(L1_3, L2_3, L3_3, L4_3)
        L2_1 = L0_3
        L0_3 = Trailers
        L1_3 = L0_3
        L0_3 = L0_3.CreateTrailer
        L2_3 = L7_2.trailer_stuff
        L2_3 = L2_3.model
        L3_3 = L7_2.trailer_stuff
        L3_3 = L3_3.coords
        L0_3(L1_3, L2_3, L3_3)
      end
    end
    L9_2.onSelect = L10_2
    L0_2[L8_2] = L9_2
  end
  L2_2 = lib
  L2_2 = L2_2.registerContext
  L3_2 = {}
  L4_2 = menus
  L4_2 = L4_2.trailer_list
  L5_2 = L4_2
  L4_2 = L4_2.format
  L6_2 = "trucker"
  L4_2 = L4_2(L5_2, L6_2)
  L3_2.id = L4_2
  L4_2 = Lang
  L5_2 = "trailer_list"
  L4_2 = L4_2(L5_2)
  L3_2.title = L4_2
  L3_2.options = L0_2
  L4_2 = menus
  L4_2 = L4_2.job_menu
  L5_2 = L4_2
  L4_2 = L4_2.format
  L6_2 = "trucker"
  L4_2 = L4_2(L5_2, L6_2)
  L3_2.menu = L4_2
  L2_2(L3_2)
end
initTrucker = L5_1
function L5_1()
  local L0_2, L1_2, L2_2, L3_2, L4_2
  L0_2 = SetNewWaypoint
  L1_2 = L0_1.menu
  L1_2 = L1_2.job_menu
  L1_2 = L1_2.x
  L2_2 = L0_1.menu
  L2_2 = L2_2.job_menu
  L2_2 = L2_2.y
  L0_2(L1_2, L2_2)
  trailerDeliveredB = true
  L0_2 = L2_1
  L1_2 = L0_2
  L0_2 = L0_2.changeDeliverCar
  L2_2 = true
  L0_2(L1_2, L2_2)
  L0_2 = deliveryBlip
  if nil ~= L0_2 then
    L0_2 = RemoveBlip
    L1_2 = deliveryBlip
    L0_2(L1_2)
    deliveryBlip = nil
  end
  L0_2 = Config
  L0_2 = L0_2.Notification
  L1_2 = Lang
  L2_2 = "job"
  L1_2 = L1_2(L2_2)
  L2_2 = Lang
  L3_2 = "trailer_delivered"
  L2_2 = L2_2(L3_2)
  L3_2 = "success"
  L4_2 = 10000
  L0_2(L1_2, L2_2, L3_2, L4_2)
end
trailerDelivered = L5_1
function L5_1()
  local L0_2, L1_2, L2_2, L3_2, L4_2, L5_2, L6_2
  L0_2 = trailerDeliveredB
  if L0_2 then
    L0_2 = calcuteDeductedMoney
    L1_2 = L2_1.extraTimeEnabled
    L2_2 = L0_1.job_list
    L3_2 = truckerSelectedIndex
    L2_2 = L2_2[L3_2]
    L2_2 = L2_2.delivery_time
    L3_2 = formatNumberToMin
    L4_2 = L2_1
    L5_2 = L4_2
    L4_2 = L4_2.getDuration
    L4_2, L5_2, L6_2 = L4_2(L5_2)
    L3_2 = L3_2(L4_2, L5_2, L6_2)
    L4_2 = L0_1.job_list
    L5_2 = truckerSelectedIndex
    L4_2 = L4_2[L5_2]
    L4_2 = L4_2.deducted_per_min
    L0_2 = L0_2(L1_2, L2_2, L3_2, L4_2)
    L1_2 = Config
    L1_2 = L1_2.JobSuccess
    L2_2 = CurrentJob
    L3_2 = L0_1.job_list
    L4_2 = truckerSelectedIndex
    L3_2 = L3_2[L4_2]
    L3_2 = L3_2.reward
    L3_2 = L3_2 - L0_2
    L4_2 = L2_1
    L5_2 = L4_2
    L4_2 = L4_2.getDuration
    L4_2 = L4_2(L5_2)
    L5_2 = L2_1.extraTimeEnabled
    L1_2(L2_2, L3_2, L4_2, L5_2)
    L1_2 = TriggerServerEvent
    L2_2 = "wais:giveTrucker:reward"
    L3_2 = CurrentJob
    L4_2 = truckerSelectedIndex
    L5_2 = L0_1.menu
    L5_2 = L5_2.job_menu
    L6_2 = L0_2
    L1_2(L2_2, L3_2, L4_2, L5_2, L6_2)
    truckerSelectedIndex = 0
    trailerDeliveredB = false
    L1_2 = L2_1
    L2_2 = L1_2
    L1_2 = L1_2.delete
    L1_2(L2_2)
    L1_2 = Config
    L1_2 = L1_2.Notification
    L2_2 = Lang
    L3_2 = "job"
    L2_2 = L2_2(L3_2)
    L3_2 = Lang
    L4_2 = "job_end"
    L3_2 = L3_2(L4_2)
    L4_2 = "success"
    L5_2 = 10000
    L1_2(L2_2, L3_2, L4_2, L5_2)
  end
end
checkTrailerDelivered = L5_1
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
    if "trucker" == L3_2 then
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
        L4_2 = truckerSelectedIndex
        if 0 ~= L4_2 then
          L4_2 = GetVehiclePedIsIn
          L5_2 = L0_2
          L6_2 = false
          L4_2 = L4_2(L5_2, L6_2)
          L5_2 = truckerVehicle
          if L4_2 ~= L5_2 then
            L5_2 = L1_1
            if not L5_2 then
              L5_2 = GetEntityCoords
              L6_2 = truckerVehicle
              L5_2 = L5_2(L6_2)
              L5_2 = L1_2 - L5_2
              L5_2 = #L5_2
              if L5_2 >= 25.0 then
                L6_2 = true
                L1_1 = L6_2
                L6_2 = L3_1
                L6_2()
              else
                L6_2 = false
                L1_1 = L6_2
              end
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
L5_1(L6_1)