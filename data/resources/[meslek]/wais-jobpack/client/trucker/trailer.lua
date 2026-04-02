local L0_1, L1_1, L2_1
L0_1 = {}
Trailers = L0_1
L0_1 = Trailers
L1_1 = Trailers
L0_1.__index = L1_1
L0_1 = Trailers
L1_1 = {}
L0_1.Trailers = L1_1
L0_1 = Config
L0_1 = L0_1.Jobs
L0_1 = L0_1.trucker
L1_1 = Trailers
function L2_1(A0_2)
  local L1_2, L2_2, L3_2, L4_2, L5_2, L6_2
  L1_2 = 1
  L2_2 = Trailers
  L2_2 = L2_2.Trailers
  L2_2 = #L2_2
  L3_2 = 1
  for L4_2 = L1_2, L2_2, L3_2 do
    L5_2 = Trailers
    L5_2 = L5_2.Trailers
    L5_2 = L5_2[L4_2]
    L6_2 = L5_2
    L5_2 = L5_2.delete
    L5_2(L6_2)
  end
end
L1_1.deleteAll = L2_1
L1_1 = Trailers
function L2_1(A0_2)
  local L1_2, L2_2, L3_2, L4_2
  A0_2.warningAttempt = false
  A0_2.deleted = true
  L1_2 = DoesEntityExist
  L2_2 = A0_2.trailer
  L1_2 = L1_2(L2_2)
  if L1_2 then
    L1_2 = DeleteEntity
    L2_2 = A0_2.trailer
    L1_2(L2_2)
  end
  L1_2 = A0_2.markerProp
  if nil ~= L1_2 then
    L1_2 = DeleteEntity
    L2_2 = A0_2.markerProp
    L1_2(L2_2)
  end
  L1_2 = TriggerServerEvent
  L2_2 = "wais:deleteJob:car"
  L3_2 = NetworkGetNetworkIdFromEntity
  L4_2 = A0_2.trailer
  L3_2, L4_2 = L3_2(L4_2)
  L1_2(L2_2, L3_2, L4_2)
  L1_2 = Trailers
  L1_2 = L1_2.Trailers
  L2_2 = A0_2.id
  L1_2[L2_2] = nil
  A0_2 = nil
end
L1_1.delete = L2_1
L1_1 = Trailers
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
      L0_3 = A0_2.delivered
      if L0_3 then
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
      L3_3 = "take_trailer_warning"
      L2_3 = L2_3(L3_3)
      L3_3 = "warning"
      L4_3 = nil
      L0_3(L1_3, L2_3, L3_3, L4_3)
      L0_3 = L1_2
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
  L2_2(L3_2)
end
L1_1.warningAttemptF = L2_1
L1_1 = Trailers
function L2_1(A0_2, A1_2, A2_2)
  local L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2
  L3_2 = loadModel
  L4_2 = A1_2
  L3_2 = L3_2(L4_2)
  if not L3_2 then
    return
  end
  L3_2 = setmetatable
  L4_2 = {}
  L5_2 = Trailers
  L3_2 = L3_2(L4_2, L5_2)
  L4_2 = lib
  L4_2 = L4_2.string
  L4_2 = L4_2.random
  L5_2 = "aaaaaa"
  L4_2 = L4_2(L5_2)
  L3_2.id = L4_2
  L3_2.trailer = nil
  L3_2.deleted = false
  L3_2.freezed = false
  L3_2.attached = false
  L3_2.warningAttempt = false
  L3_2.attachedFirstTime = false
  L3_2.markerProp = nil
  L3_2.delivered = false
  L4_2 = L0_1.job_list
  L5_2 = truckerSelectedIndex
  L4_2 = L4_2[L5_2]
  L4_2 = L4_2.delivery_coords
  L5_2 = CreateThread
  function L6_2()
    local L0_3, L1_3, L2_3, L3_3, L4_3, L5_3, L6_3, L7_3, L8_3, L9_3, L10_3, L11_3, L12_3
    while true do
      L0_3 = L3_2
      if not L0_3 then
        break
      end
      L0_3 = L3_2.deleted
      if L0_3 then
        break
      end
      L0_3 = L3_2.trailer
      if nil ~= L0_3 then
        break
      end
      L0_3 = 1000
      L1_3 = PlayerPedId
      L1_3 = L1_3()
      L2_3 = GetEntityCoords
      L3_3 = L1_3
      L2_3 = L2_3(L3_3)
      L3_3 = vec3
      L4_3 = A2_2.x
      L5_3 = A2_2.y
      L6_3 = A2_2.z
      L3_3 = L3_3(L4_3, L5_3, L6_3)
      L3_3 = L2_3 - L3_3
      L3_3 = #L3_3
      L4_3 = 424
      if L3_3 <= L4_3 then
        L4_3 = lib
        L4_3 = L4_3.getClosestVehicle
        L5_3 = vector3
        L6_3 = A2_2.x
        L7_3 = A2_2.y
        L8_3 = A2_2.z
        L5_3 = L5_3(L6_3, L7_3, L8_3)
        L6_3 = 10.0
        L7_3 = true
        L4_3 = L4_3(L5_3, L6_3, L7_3)
        if not L4_3 then
          L5_3 = CreateVehicle
          L6_3 = A1_2
          L7_3 = A2_2.x
          L8_3 = A2_2.y
          L9_3 = A2_2.z
          L10_3 = A2_2.w
          L11_3 = true
          L12_3 = false
          L5_3 = L5_3(L6_3, L7_3, L8_3, L9_3, L10_3, L11_3, L12_3)
          L3_2.trailer = L5_3
          L5_3 = SetEntityInvincible
          L6_3 = L3_2.trailer
          L7_3 = true
          L5_3(L6_3, L7_3)
          L5_3 = SetVehicleOnGroundProperly
          L6_3 = L3_2.trailer
          L5_3(L6_3)
          L5_3 = TriggerServerEvent
          L6_3 = "wais:outJob:car"
          L7_3 = L3_2.trailer
          L8_3 = NetworkGetNetworkIdFromEntity
          L9_3 = L3_2.trailer
          L8_3, L9_3, L10_3, L11_3, L12_3 = L8_3(L9_3)
          L5_3(L6_3, L7_3, L8_3, L9_3, L10_3, L11_3, L12_3)
          L5_3 = L0_1.debug
          if L5_3 then
            L5_3 = print
            L6_3 = "[^2INFO^7] Trailer created: %s - EntityId: %s - NetworkId: %s"
            L7_3 = L6_3
            L6_3 = L6_3.format
            L8_3 = A1_2
            L9_3 = L3_2.trailer
            L10_3 = NetworkGetNetworkIdFromEntity
            L11_3 = L3_2.trailer
            L10_3, L11_3, L12_3 = L10_3(L11_3)
            L6_3, L7_3, L8_3, L9_3, L10_3, L11_3, L12_3 = L6_3(L7_3, L8_3, L9_3, L10_3, L11_3, L12_3)
            L5_3(L6_3, L7_3, L8_3, L9_3, L10_3, L11_3, L12_3)
          end
          break
        else
          L5_3 = math
          L5_3 = L5_3.random
          L6_3 = 1
          L7_3 = 10
          L5_3 = L5_3(L6_3, L7_3)
          if L5_3 >= 7 then
            L5_3 = Config
            L5_3 = L5_3.Notification
            L6_3 = Lang
            L7_3 = "job"
            L6_3 = L6_3(L7_3)
            L7_3 = Lang
            L8_3 = "car_spawn_blocked"
            L7_3 = L7_3(L8_3)
            L8_3 = "warning"
            L9_3 = nil
            L5_3(L6_3, L7_3, L8_3, L9_3)
          end
        end
      end
      L4_3 = Wait
      L5_3 = L0_3
      L4_3(L5_3)
    end
  end
  L5_2(L6_2)
  L5_2 = CreateThread
  function L6_2()
    local L0_3, L1_3, L2_3, L3_3, L4_3, L5_3, L6_3, L7_3
    while true do
      L0_3 = L3_2
      if not L0_3 then
        break
      end
      L0_3 = L3_2.deleted
      if L0_3 then
        break
      end
      L0_3 = L3_2.delivered
      if L0_3 then
        L3_2.warningAttempt = false
        break
      end
      L0_3 = 1000
      L1_3 = GetVehicleTrailerVehicle
      L2_3 = truckerVehicle
      L1_3, L2_3 = L1_3(L2_3)
      if L1_3 then
        L3_3 = L3_2.attachedFirstTime
        if not L3_3 then
          L3_2.attached = true
          L3_2.attachedFirstTime = true
          L3_2.warningAttempt = false
          L3_3 = deleteTrailerBlip
          L3_3()
          L3_3 = SetNewWaypoint
          L4_3 = L4_2.x
          L5_3 = L4_2.y
          L3_3(L4_3, L5_3)
          L3_3 = Config
          L3_3 = L3_3.Notification
          L4_3 = Lang
          L5_3 = "job"
          L4_3 = L4_3(L5_3)
          L5_3 = Lang
          L6_3 = "trailer_deivery_waypoint"
          L5_3 = L5_3(L6_3)
          L6_3 = "success"
          L7_3 = 10000
          L3_3(L4_3, L5_3, L6_3, L7_3)
      end
      else
        if not L1_3 then
          L3_3 = L3_2.attachedFirstTime
          if L3_3 then
            L3_3 = L3_2.warningAttempt
            if not L3_3 then
              L3_3 = L3_2.attached
              if L3_3 then
                L3_3 = L3_2.delivered
                if not L3_3 then
                  L3_2.attached = false
                  L3_2.warningAttempt = true
                  L3_3 = createTrailerBlip
                  L4_3 = L3_2.trailer
                  L3_3(L4_3)
                  L3_3 = L3_2
                  L4_3 = L3_3
                  L3_3 = L3_3.warningAttemptF
                  L3_3(L4_3)
              end
            end
          end
        end
        elseif L1_3 then
          L3_3 = L3_2.attached
          if not L3_3 then
            L3_2.attached = true
            L3_2.warningAttempt = false
            L3_3 = deleteTrailerBlip
            L3_3()
            L3_3 = Config
            L3_3 = L3_3.Notification
            L4_3 = Lang
            L5_3 = "job"
            L4_3 = L4_3(L5_3)
            L5_3 = Lang
            L6_3 = "trailer_deivery_waypoint"
            L5_3 = L5_3(L6_3)
            L6_3 = "info"
            L7_3 = 10000
            L3_3(L4_3, L5_3, L6_3, L7_3)
          end
        end
      end
      L3_3 = Wait
      L4_3 = L0_3
      L3_3(L4_3)
    end
  end
  L5_2(L6_2)
  L5_2 = L0_1.job_list
  L6_2 = truckerSelectedIndex
  L5_2 = L5_2[L6_2]
  L5_2 = L5_2.trailer_stuff
  L5_2 = L5_2.spawn_with_attached
  if not L5_2 then
    L5_2 = SetNewWaypoint
    L6_2 = A2_2.x
    L7_2 = A2_2.y
    L5_2(L6_2, L7_2)
    L5_2 = createTrailerBlip
    L5_2()
    L5_2 = Config
    L5_2 = L5_2.Notification
    L6_2 = Lang
    L7_2 = "job"
    L6_2 = L6_2(L7_2)
    L7_2 = Lang
    L8_2 = "trailer_waypoint"
    L7_2 = L7_2(L8_2)
    L8_2 = "info"
    L9_2 = 10000
    L5_2(L6_2, L7_2, L8_2, L9_2)
    L5_2 = CreateThread
    function L6_2()
      local L0_3, L1_3, L2_3, L3_3, L4_3, L5_3, L6_3, L7_3, L8_3, L9_3, L10_3, L11_3, L12_3, L13_3, L14_3, L15_3, L16_3, L17_3, L18_3, L19_3, L20_3, L21_3, L22_3, L23_3, L24_3, L25_3, L26_3, L27_3, L28_3, L29_3
      while true do
        L0_3 = L3_2
        if not L0_3 then
          break
        end
        L0_3 = L3_2.deleted
        if L0_3 then
          break
        end
        L0_3 = PlayerPedId
        L0_3 = L0_3()
        L1_3 = 1000
        L2_3 = GetEntityCoords
        L3_3 = L0_3
        L2_3 = L2_3(L3_3)
        L3_3 = GetEntityCoords
        L4_3 = L3_2.trailer
        L3_3 = L3_3(L4_3)
        L4_3 = L2_3 - L3_3
        L4_3 = #L4_3
        L5_3 = L3_2.attached
        if not L5_3 and L4_3 <= 75.0 then
          L1_3 = 5
          L5_3 = DrawMarker
          L6_3 = 0
          L7_3 = L3_3.x
          L8_3 = L3_3.y
          L9_3 = L3_3.z
          L9_3 = L9_3 + 4.0
          L10_3 = 0
          L11_3 = 0
          L12_3 = 0
          L13_3 = 0
          L14_3 = 0
          L15_3 = 0
          L16_3 = 1.0
          L17_3 = 1.0
          L18_3 = 1.0
          L19_3 = 255
          L20_3 = 255
          L21_3 = 0
          L22_3 = 200
          L23_3 = true
          L24_3 = false
          L25_3 = 2
          L26_3 = false
          L27_3 = false
          L28_3 = false
          L29_3 = false
          L5_3(L6_3, L7_3, L8_3, L9_3, L10_3, L11_3, L12_3, L13_3, L14_3, L15_3, L16_3, L17_3, L18_3, L19_3, L20_3, L21_3, L22_3, L23_3, L24_3, L25_3, L26_3, L27_3, L28_3, L29_3)
        end
        L5_3 = Wait
        L6_3 = L1_3
        L5_3(L6_3)
      end
    end
    L5_2(L6_2)
  else
    L5_2 = SetNewWaypoint
    L6_2 = L4_2.x
    L7_2 = L4_2.y
    L5_2(L6_2, L7_2)
    L5_2 = Config
    L5_2 = L5_2.Notification
    L6_2 = Lang
    L7_2 = "job"
    L6_2 = L6_2(L7_2)
    L7_2 = Lang
    L8_2 = "trailer_deivery_waypoint"
    L7_2 = L7_2(L8_2)
    L8_2 = "success"
    L9_2 = 10000
    L5_2(L6_2, L7_2, L8_2, L9_2)
  end
  L5_2 = CreateThread
  function L6_2()
    local L0_3, L1_3, L2_3, L3_3, L4_3, L5_3, L6_3, L7_3, L8_3
    while true do
      L0_3 = L3_2
      if not L0_3 then
        break
      end
      L0_3 = L3_2.deleted
      if L0_3 then
        break
      end
      L0_3 = 1000
      L1_3 = GetEntityCoords
      L2_3 = L3_2.trailer
      L1_3 = L1_3(L2_3)
      L2_3 = vec3
      L3_3 = L4_2.x
      L4_3 = L4_2.y
      L5_3 = L4_2.z
      L2_3 = L2_3(L3_3, L4_3, L5_3)
      L2_3 = L1_3 - L2_3
      L2_3 = #L2_3
      L3_3 = GetVehicleTrailerVehicle
      L4_3 = truckerVehicle
      L3_3, L4_3 = L3_3(L4_3)
      if L2_3 <= 50.0 then
        L5_3 = vec2
        L6_3 = L4_2.x
        L7_3 = L4_2.y
        L5_3 = L5_3(L6_3, L7_3)
        L6_3 = vec2
        L7_3 = L1_3.x
        L8_3 = L1_3.y
        L6_3 = L6_3(L7_3, L8_3)
        L5_3 = L5_3 - L6_3
        L5_3 = #L5_3
        L6_3 = 1.5
        if L5_3 <= L6_3 then
          L6_3 = L3_2.trailer
          if L4_3 == L6_3 then
            L3_2.delivered = true
            L6_3 = L3_2
            L7_3 = L6_3
            L6_3 = L6_3.delete
            L6_3(L7_3)
            L6_3 = trailerDelivered
            L6_3()
            break
          end
        end
      end
      L5_3 = Wait
      L6_3 = L0_3
      L5_3(L6_3)
    end
  end
  L5_2(L6_2)
  L5_2 = L0_1.job_list
  L6_2 = truckerSelectedIndex
  L5_2 = L5_2[L6_2]
  L5_2 = L5_2.trailer_stuff
  L5_2 = L5_2.trailer_attachable_with_default
  if not L5_2 then
    L5_2 = CreateThread
    function L6_2()
      local L0_3, L1_3, L2_3, L3_3, L4_3, L5_3, L6_3, L7_3
      while true do
        L0_3 = L3_2
        if not L0_3 then
          break
        end
        L0_3 = L3_2.deleted
        if L0_3 then
          break
        end
        L0_3 = L3_2.attached
        if L0_3 then
          break
        end
        L0_3 = 1000
        L1_3 = GetEntityCoords
        L2_3 = truckerVehicle
        L1_3 = L1_3(L2_3)
        L2_3 = GetEntityCoords
        L3_3 = L3_2.trailer
        L2_3 = L2_3(L3_3)
        L3_3 = L1_3 - L2_3
        L3_3 = #L3_3
        if L3_3 <= 15.0 then
          L4_3 = AttachVehicleToTrailer
          L5_3 = truckerVehicle
          L6_3 = L3_2.trailer
          L7_3 = 15.0
          L4_3(L5_3, L6_3, L7_3)
        end
        L4_3 = Wait
        L5_3 = L0_3
        L4_3(L5_3)
      end
    end
    L5_2(L6_2)
  end
  L5_2 = CreateThread
  function L6_2()
    local L0_3, L1_3, L2_3, L3_3, L4_3, L5_3, L6_3, L7_3, L8_3, L9_3, L10_3, L11_3, L12_3, L13_3, L14_3, L15_3, L16_3, L17_3, L18_3, L19_3, L20_3, L21_3, L22_3, L23_3, L24_3, L25_3, L26_3, L27_3, L28_3
    while true do
      L0_3 = L3_2
      if not L0_3 then
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
      L3_3 = vec3
      L4_3 = L4_2.x
      L5_3 = L4_2.y
      L6_3 = L4_2.z
      L3_3 = L3_3(L4_3, L5_3, L6_3)
      L3_3 = L2_3 - L3_3
      L3_3 = #L3_3
      L4_3 = 424
      if L3_3 <= L4_3 then
        L4_3 = L3_2.markerProp
        if nil == L4_3 then
          L4_3 = joaat
          L5_3 = "prop_container_ld_d"
          L4_3 = L4_3(L5_3)
          L5_3 = loadModel
          L6_3 = L4_3
          L5_3 = L5_3(L6_3)
          if not L5_3 then
            return
          end
          L5_3 = CreateObject
          L6_3 = L4_3
          L7_3 = L4_2.x
          L8_3 = L4_2.y
          L9_3 = L4_2.z
          L9_3 = L9_3 - 1.0
          L10_3 = false
          L11_3 = false
          L12_3 = false
          L5_3 = L5_3(L6_3, L7_3, L8_3, L9_3, L10_3, L11_3, L12_3)
          L3_2.markerProp = L5_3
          L5_3 = SetEntityVisible
          L6_3 = L3_2.markerProp
          L7_3 = false
          L5_3(L6_3, L7_3)
          L5_3 = SetEntityCollision
          L6_3 = L3_2.markerProp
          L7_3 = false
          L8_3 = false
          L5_3(L6_3, L7_3, L8_3)
          L5_3 = SetEntityHeading
          L6_3 = L3_2.markerProp
          L7_3 = L4_2.w
          L5_3(L6_3, L7_3)
          L5_3 = SetEntityDrawOutline
          L6_3 = L3_2.markerProp
          L7_3 = true
          L5_3(L6_3, L7_3)
          L5_3 = SetEntityDrawOutlineColor
          L6_3 = L3_2.markerProp
          L7_3 = 255
          L8_3 = 255
          L9_3 = 255
          L10_3 = 255
          L5_3(L6_3, L7_3, L8_3, L9_3, L10_3)
        end
        if L3_3 <= 125.0 then
          L0_3 = 5
          L4_3 = DrawMarker
          L5_3 = 0
          L6_3 = L4_2.x
          L7_3 = L4_2.y
          L8_3 = L4_2.z
          L8_3 = L8_3 + 4.0
          L9_3 = 0
          L10_3 = 0
          L11_3 = 0
          L12_3 = 0
          L13_3 = 0
          L14_3 = 0
          L15_3 = 1.0
          L16_3 = 1.0
          L17_3 = 1.0
          L18_3 = 255
          L19_3 = 255
          L20_3 = 0
          L21_3 = 200
          L22_3 = true
          L23_3 = false
          L24_3 = 2
          L25_3 = false
          L26_3 = false
          L27_3 = false
          L28_3 = false
          L4_3(L5_3, L6_3, L7_3, L8_3, L9_3, L10_3, L11_3, L12_3, L13_3, L14_3, L15_3, L16_3, L17_3, L18_3, L19_3, L20_3, L21_3, L22_3, L23_3, L24_3, L25_3, L26_3, L27_3, L28_3)
          L4_3 = GetEntityCoords
          L5_3 = L3_2.markerProp
          L4_3 = L4_3(L5_3)
          L5_3 = GetEntityCoords
          L6_3 = L3_2.trailer
          L5_3 = L5_3(L6_3)
          L6_3 = vec2
          L7_3 = L5_3.x
          L8_3 = L5_3.y
          L6_3 = L6_3(L7_3, L8_3)
          L7_3 = vec2
          L8_3 = L4_3.x
          L9_3 = L4_3.y
          L7_3 = L7_3(L8_3, L9_3)
          L6_3 = L6_3 - L7_3
          L6_3 = #L6_3
          L7_3 = 1.5
          if L6_3 <= L7_3 then
            L7_3 = SetEntityDrawOutlineColor
            L8_3 = L3_2.markerProp
            L9_3 = 81
            L10_3 = 255
            L11_3 = 93
            L12_3 = 255
            L7_3(L8_3, L9_3, L10_3, L11_3, L12_3)
          else
            L7_3 = SetEntityDrawOutlineColor
            L8_3 = L3_2.markerProp
            L9_3 = 255
            L10_3 = 255
            L11_3 = 255
            L12_3 = 255
            L7_3(L8_3, L9_3, L10_3, L11_3, L12_3)
          end
        end
      end
      L4_3 = Wait
      L5_3 = L0_3
      L4_3(L5_3)
    end
  end
  L5_2(L6_2)
  L5_2 = createDeliveryBlips
  L5_2()
  L5_2 = Trailers
  L5_2 = L5_2.Trailers
  L6_2 = L3_2.id
  L5_2[L6_2] = L3_2
  return L3_2
end
L1_1.CreateTrailer = L2_1