local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1
L0_1 = Config
L0_1 = L0_1.Jobs
L0_1 = L0_1.news_delivery
L1_1 = false
L2_1 = {}
L3_1 = {}
L4_1 = nil
L5_1 = RegisterNetEvent
L6_1 = "wais:setDefault:JobThings"
function L7_1()
  local L0_2, L1_2, L2_2, L3_2, L4_2, L5_2, L6_2, L7_2
  L0_2 = L2_1
  if nil ~= L0_2 then
    L0_2 = {}
    L2_1 = L0_2
  end
  L0_2 = L1_1
  if L0_2 then
    L0_2 = false
    L1_1 = L0_2
    L0_2 = TriggerServerEvent
    L1_2 = "wais:news:removeAcidpackage"
    L0_2(L1_2)
  end
  L0_2 = next
  L1_2 = L3_1
  L0_2 = L0_2(L1_2)
  if nil ~= L0_2 then
    L0_2 = pairs
    L1_2 = L3_1
    L0_2, L1_2, L2_2, L3_2 = L0_2(L1_2)
    for L4_2, L5_2 in L0_2, L1_2, L2_2, L3_2 do
      L6_2 = RemoveBlip
      L7_2 = L5_2
      L6_2(L7_2)
    end
  end
  L0_2 = L4_1
  if nil ~= L0_2 then
    L0_2 = L4_1
    L1_2 = L0_2
    L0_2 = L0_2.delete
    L0_2(L1_2)
    L0_2 = nil
    L4_1 = L0_2
  end
end
L5_1(L6_1, L7_1)
function L5_1()
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
          L5_3 = "news_delivery"
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
    L2_2 = "[^2INFO^7] News Delivery Job Center has been initialized."
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
      L3_2 = "[^2INFO^7] News Delivery Job Center Blip has been initialized."
      L2_2(L3_2)
    end
  end
  L1_2 = points
  L2_2 = points
  L2_2 = #L2_2
  L2_2 = L2_2 + 1
  L1_2[L2_2] = L0_2
end
initNewspaper = L5_1
function L5_1()
  local L0_2, L1_2, L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2
  L0_2 = L4_1
  if nil ~= L0_2 then
    L0_2 = L4_1
    L1_2 = L0_2
    L0_2 = L0_2.delete
    L0_2(L1_2)
    L0_2 = nil
    L4_1 = L0_2
  end
  L0_2 = JobTimer
  L1_2 = L0_2
  L0_2 = L0_2.New
  L2_2 = L0_1.timer
  L2_2 = L2_2.delivery_time
  L3_2 = L0_1.timer
  L3_2 = L3_2.extra_time
  L4_2 = false
  L0_2 = L0_2(L1_2, L2_2, L3_2, L4_2)
  L4_1 = L0_2
  L0_2 = L0_1.delivery_coords
  L0_2 = L0_2.blips
  L0_2 = L0_2.show
  if L0_2 then
    L0_2 = pairs
    L1_2 = L0_1.delivery_coords
    L1_2 = L1_2.coords
    L0_2, L1_2, L2_2, L3_2 = L0_2(L1_2)
    for L4_2, L5_2 in L0_2, L1_2, L2_2, L3_2 do
      L6_2 = AddBlipForCoord
      L7_2 = L5_2.x
      L8_2 = L5_2.y
      L9_2 = L5_2.z
      L6_2 = L6_2(L7_2, L8_2, L9_2)
      L7_2 = SetBlipSprite
      L8_2 = L6_2
      L9_2 = L0_1.delivery_coords
      L9_2 = L9_2.blips
      L9_2 = L9_2.sprite
      L7_2(L8_2, L9_2)
      L7_2 = SetBlipDisplay
      L8_2 = L6_2
      L9_2 = 4
      L7_2(L8_2, L9_2)
      L7_2 = SetBlipScale
      L8_2 = L6_2
      L9_2 = L0_1.delivery_coords
      L9_2 = L9_2.blips
      L9_2 = L9_2.scale
      L7_2(L8_2, L9_2)
      L7_2 = SetBlipColour
      L8_2 = L6_2
      L9_2 = L0_1.delivery_coords
      L9_2 = L9_2.blips
      L9_2 = L9_2.color
      L7_2(L8_2, L9_2)
      L7_2 = SetBlipAsShortRange
      L8_2 = L6_2
      L9_2 = true
      L7_2(L8_2, L9_2)
      L7_2 = BeginTextCommandSetBlipName
      L8_2 = "STRING"
      L7_2(L8_2)
      L7_2 = AddTextComponentString
      L8_2 = L0_1.delivery_coords
      L8_2 = L8_2.blips
      L8_2 = L8_2.label
      L7_2(L8_2)
      L7_2 = EndTextCommandSetBlipName
      L8_2 = L6_2
      L7_2(L8_2)
      L7_2 = L3_1
      L7_2[L4_2] = L6_2
    end
    L0_2 = L0_1.debug
    if L0_2 then
      L0_2 = print
      L1_2 = "[^2INFO^7] News Delivery - Delivery Blip has been initialized."
      L0_2(L1_2)
    end
  end
  L0_2 = SetNewWaypoint
  L1_2 = L0_1.delivery_coords
  L1_2 = L1_2.coords
  L1_2 = L1_2[1]
  L1_2 = L1_2.x
  L2_2 = L0_1.delivery_coords
  L2_2 = L2_2.coords
  L2_2 = L2_2[1]
  L2_2 = L2_2.y
  L0_2(L1_2, L2_2)
  L0_2 = Config
  L0_2 = L0_2.Notification
  L1_2 = Lang
  L2_2 = "job"
  L1_2 = L1_2(L2_2)
  L2_2 = Lang
  L3_2 = "delivery_waypoint"
  L2_2 = L2_2(L3_2)
  L3_2 = "inform"
  L4_2 = 5000
  L0_2(L1_2, L2_2, L3_2, L4_2)
  L0_2 = true
  L1_1 = L0_2
end
createNewsDeliveryThings = L5_1
function L5_1()
  local L0_2, L1_2, L2_2, L3_2, L4_2, L5_2, L6_2, L7_2
  L0_2 = 0
  L1_2 = pairs
  L2_2 = L2_1
  L1_2, L2_2, L3_2, L4_2 = L1_2(L2_2)
  for L5_2, L6_2 in L1_2, L2_2, L3_2, L4_2 do
    L0_2 = L0_2 + 1
  end
  return L0_2
end
getDeliveriedNewsSize = L5_1
L5_1 = CreateThread
function L6_1()
  local L0_2, L1_2, L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2, L20_2, L21_2, L22_2, L23_2, L24_2, L25_2, L26_2, L27_2, L28_2, L29_2, L30_2, L31_2, L32_2, L33_2, L34_2, L35_2
  while true do
    L0_2 = PlayerPedId
    L0_2 = L0_2()
    L1_2 = GetEntityCoords
    L2_2 = L0_2
    L1_2 = L1_2(L2_2)
    L2_2 = 1000
    L3_2 = CurrentJob
    if "news_delivery" == L3_2 then
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
        L4_2 = L1_1
        if L4_2 then
          L4_2 = pairs
          L5_2 = L0_1.delivery_coords
          L5_2 = L5_2.coords
          L4_2, L5_2, L6_2, L7_2 = L4_2(L5_2)
          for L8_2, L9_2 in L4_2, L5_2, L6_2, L7_2 do
            L10_2 = vector3
            L11_2 = L9_2.x
            L12_2 = L9_2.y
            L13_2 = L9_2.z
            L10_2 = L10_2(L11_2, L12_2, L13_2)
            L10_2 = L1_2 - L10_2
            L10_2 = #L10_2
            L11_2 = L0_1.delivery_coords
            L11_2 = L11_2.drawMarker_distance
            if L10_2 <= L11_2 then
              L11_2 = L2_1
              L11_2 = L11_2[L8_2]
              if nil == L11_2 then
                L2_2 = 5
                L11_2 = IsProjectileTypeWithinDistance
                L12_2 = L9_2.x
                L13_2 = L9_2.y
                L14_2 = L9_2.z
                L15_2 = joaat
                L16_2 = "WEAPON_ACIDPACKAGE"
                L15_2 = L15_2(L16_2)
                L16_2 = 4.0
                L17_2 = true
                L11_2 = L11_2(L12_2, L13_2, L14_2, L15_2, L16_2, L17_2)
                if L11_2 then
                  L11_2 = L2_1
                  L11_2[L8_2] = true
                  L11_2 = RemoveBlip
                  L12_2 = L3_1
                  L12_2 = L12_2[L8_2]
                  L11_2(L12_2)
                  L11_2 = calcuteDeductedMoney
                  L12_2 = L4_1.extraTimeEnabled
                  L13_2 = L0_1.timer
                  L13_2 = L13_2.delivery_time
                  L14_2 = L4_1
                  L15_2 = L14_2
                  L14_2 = L14_2.getDuration
                  L14_2 = L14_2(L15_2)
                  L15_2 = L0_1.timer
                  L15_2 = L15_2.deducted_per_min
                  L11_2 = L11_2(L12_2, L13_2, L14_2, L15_2)
                  L12_2 = TriggerServerEvent
                  L13_2 = "wais:giveNewsPaper:Reward"
                  L14_2 = CurrentJob
                  L15_2 = L8_2
                  L16_2 = L11_2
                  L12_2(L13_2, L14_2, L15_2, L16_2)
                  L12_2 = getDeliveriedNewsSize
                  L12_2 = L12_2()
                  L13_2 = L0_1.delivery_coords
                  L13_2 = L13_2.coords
                  L13_2 = #L13_2
                  if L12_2 == L13_2 then
                    L13_2 = SetNewWaypoint
                    L14_2 = L0_1.menu
                    L14_2 = L14_2.job_menu
                    L14_2 = L14_2.x
                    L15_2 = L0_1.menu
                    L15_2 = L15_2.job_menu
                    L15_2 = L15_2.y
                    L13_2(L14_2, L15_2)
                    L13_2 = Config
                    L13_2 = L13_2.Notification
                    L14_2 = Lang
                    L15_2 = "job"
                    L14_2 = L14_2(L15_2)
                    L15_2 = Lang
                    L16_2 = "delivery_completed"
                    L15_2 = L15_2(L16_2)
                    L16_2 = "success"
                    L17_2 = 5000
                    L13_2(L14_2, L15_2, L16_2, L17_2)
                    L13_2 = Config
                    L13_2 = L13_2.JobSuccess
                    L14_2 = CurrentJob
                    L15_2 = nil
                    L16_2 = nil
                    L17_2 = nil
                    L18_2 = nil
                    L13_2(L14_2, L15_2, L16_2, L17_2, L18_2)
                    L13_2 = {}
                    L2_1 = L13_2
                    L13_2 = false
                    L1_1 = L13_2
                    L13_2 = L4_1
                    L14_2 = L13_2
                    L13_2 = L13_2.delete
                    L13_2(L14_2)
                    L13_2 = nil
                    L4_1 = L13_2
                    L13_2 = TriggerServerEvent
                    L14_2 = "wais:news:removeAcidpackage"
                    L13_2(L14_2)
                  else
                    L13_2 = SetNewWaypoint
                    L14_2 = L0_1.delivery_coords
                    L14_2 = L14_2.coords
                    L15_2 = L8_2 + 1
                    L14_2 = L14_2[L15_2]
                    L14_2 = L14_2.x
                    L15_2 = L0_1.delivery_coords
                    L15_2 = L15_2.coords
                    L16_2 = L8_2 + 1
                    L15_2 = L15_2[L16_2]
                    L15_2 = L15_2.y
                    L13_2(L14_2, L15_2)
                  end
                end
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
                L22_2 = 4.0
                L23_2 = 4.0
                L24_2 = 4.0
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
    end
    L3_2 = Wait
    L4_2 = L2_2
    L3_2(L4_2)
  end
end
L5_1(L6_1)
L5_1 = CreateThread
function L6_1()
  local L0_2, L1_2, L2_2, L3_2, L4_2, L5_2, L6_2, L7_2
  while true do
    L0_2 = PlayerPedId
    L0_2 = L0_2()
    L1_2 = 1000
    L2_2 = CurrentJob
    if "news_delivery" == L2_2 then
      L2_2 = L1_1
      if L2_2 then
        L1_2 = 5
        L2_2 = GetSelectedPedWeapon
        L3_2 = L0_2
        L2_2 = L2_2(L3_2)
        L3_2 = GetAmmoInPedWeapon
        L4_2 = L0_2
        L5_2 = L2_2
        L3_2 = L3_2(L4_2, L5_2)
        if L3_2 <= 0 then
          L4_2 = AddAmmoToPed
          L5_2 = L0_2
          L6_2 = L2_2
          L7_2 = 1
          L4_2(L5_2, L6_2, L7_2)
        end
      end
    end
    L2_2 = Wait
    L3_2 = L1_2
    L2_2(L3_2)
  end
end
L5_1(L6_1)