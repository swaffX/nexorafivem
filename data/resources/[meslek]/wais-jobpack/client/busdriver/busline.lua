local L0_1, L1_1, L2_1
L0_1 = {}
Busline = L0_1
L0_1 = Busline
L1_1 = Busline
L0_1.__index = L1_1
L0_1 = Config
L0_1 = L0_1.Jobs
L0_1 = L0_1.bus_driver
L1_1 = Busline
function L2_1(A0_2)
  local L1_2, L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2
  L1_2 = CreateCam
  L2_2 = "DEFAULT_SCRIPTED_CAMERA"
  L3_2 = true
  L1_2 = L1_2(L2_2, L3_2)
  A0_2.cam = L1_2
  L1_2 = SetCamActive
  L2_2 = A0_2.cam
  L3_2 = true
  L1_2(L2_2, L3_2)
  L1_2 = RenderScriptCams
  L2_2 = true
  L3_2 = true
  L4_2 = 550
  L5_2 = true
  L6_2 = true
  L1_2(L2_2, L3_2, L4_2, L5_2, L6_2)
  L1_2 = SetCamUseShallowDofMode
  L2_2 = A0_2.cam
  L3_2 = true
  L1_2(L2_2, L3_2)
  L1_2 = SetCamNearDof
  L2_2 = A0_2.cam
  L3_2 = 0.1
  L1_2(L2_2, L3_2)
  L1_2 = SetCamFarDof
  L2_2 = A0_2.cam
  L3_2 = 1.0
  L1_2(L2_2, L3_2)
  L1_2 = SetCamDofStrength
  L2_2 = A0_2.cam
  L3_2 = 1
  L1_2(L2_2, L3_2)
  L1_2 = SetCamFov
  L2_2 = A0_2.cam
  L3_2 = L0_1.car_settings
  L3_2 = L3_2.cam_settings
  L3_2 = L3_2.fov
  L1_2(L2_2, L3_2)
  L1_2 = SetCamDofFocalLengthMultiplier
  L2_2 = A0_2.cam
  L3_2 = 20.0
  L1_2(L2_2, L3_2)
  L1_2 = AttachCamToVehicleBone
  L2_2 = A0_2.cam
  L3_2 = vehicle
  L4_2 = L0_1.car_settings
  L4_2 = L4_2.cam_settings
  L4_2 = L4_2.bone
  L5_2 = false
  L6_2 = L0_1.car_settings
  L6_2 = L6_2.cam_settings
  L6_2 = L6_2.rotation
  L6_2 = L6_2.x
  L7_2 = L0_1.car_settings
  L7_2 = L7_2.cam_settings
  L7_2 = L7_2.rotation
  L7_2 = L7_2.y
  L8_2 = L0_1.car_settings
  L8_2 = L8_2.cam_settings
  L8_2 = L8_2.rotation
  L8_2 = L8_2.z
  L9_2 = L0_1.car_settings
  L9_2 = L9_2.cam_settings
  L9_2 = L9_2.offset
  L9_2 = L9_2.x
  L10_2 = L0_1.car_settings
  L10_2 = L10_2.cam_settings
  L10_2 = L10_2.offset
  L10_2 = L10_2.y
  L11_2 = L0_1.car_settings
  L11_2 = L11_2.cam_settings
  L11_2 = L11_2.offset
  L11_2 = L11_2.z
  L12_2 = true
  L1_2(L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2)
end
L1_1.createAnimCamera = L2_1
L1_1 = Busline
function L2_1(A0_2)
  local L1_2, L2_2, L3_2, L4_2, L5_2, L6_2
  L1_2 = A0_2.cam
  if L1_2 then
    L1_2 = RenderScriptCams
    L2_2 = false
    L3_2 = true
    L4_2 = 550
    L5_2 = true
    L6_2 = true
    L1_2(L2_2, L3_2, L4_2, L5_2, L6_2)
    L1_2 = DestroyCam
    L2_2 = A0_2.cam
    L3_2 = false
    L1_2(L2_2, L3_2)
    A0_2.cam = nil
  end
end
L1_1.destroyCamera = L2_1
L1_1 = Busline
function L2_1(A0_2, A1_2)
  local L2_2, L3_2, L4_2, L5_2, L6_2
  A0_2.playerBusy = A1_2
  L2_2 = FreezeEntityPosition
  L3_2 = vehicle
  L4_2 = A1_2
  L2_2(L3_2, L4_2)
  if A1_2 then
    L2_2 = SetVehicleDoorOpen
    L3_2 = vehicle
    L4_2 = 0
    L5_2 = false
    L6_2 = false
    L2_2(L3_2, L4_2, L5_2, L6_2)
    L3_2 = A0_2
    L2_2 = A0_2.createAnimCamera
    L2_2(L3_2)
  else
    L2_2 = SetVehicleDoorShut
    L3_2 = vehicle
    L4_2 = 0
    L5_2 = false
    L2_2(L3_2, L4_2, L5_2)
    L3_2 = A0_2
    L2_2 = A0_2.destroyCamera
    L2_2(L3_2)
  end
  L2_2 = true
  return L2_2
end
L1_1.readyVehicleToAction = L2_1
L1_1 = Busline
function L2_1(A0_2)
  local L1_2, L2_2, L3_2
  L1_2 = Config
  L1_2 = L1_2.AbuseController
  L1_2 = L1_2.warning_count
  L2_2 = CreateThread
  function L3_2()
    local L0_3, L1_3, L2_3, L3_3, L4_3
    while true do
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
      L3_3 = "back_to_bus"
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
L1_1.warningAttempt = L2_1
L1_1 = Busline
function L2_1(A0_2)
  local L1_2, L2_2, L3_2, L4_2, L5_2, L6_2, L7_2
  L1_2 = pairs
  L2_2 = A0_2.peds
  L1_2, L2_2, L3_2, L4_2 = L1_2(L2_2)
  for L5_2, L6_2 in L1_2, L2_2, L3_2, L4_2 do
    L7_2 = L6_2.invehicle
    if L7_2 then
      L7_2 = L6_2.leaving
      if not L7_2 then
        L6_2.index = L5_2
        return L6_2
      end
    end
  end
end
L1_1.getFreePedForLeave = L2_1
L1_1 = Busline
function L2_1(A0_2, A1_2)
  local L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2
  L2_2 = pairs
  L3_2 = A0_2.stops
  L3_2 = L3_2[A1_2]
  L3_2 = L3_2.peds
  L2_2, L3_2, L4_2, L5_2 = L2_2(L3_2)
  for L6_2, L7_2 in L2_2, L3_2, L4_2, L5_2 do
    L8_2 = L7_2.invehicle
    if not L8_2 then
      L8_2 = L7_2.entering
      if not L8_2 then
        L8_2 = L7_2.leaving
        if not L8_2 then
          return L7_2
        end
      end
    end
  end
end
L1_1.getFreePedForEnter = L2_1
L1_1 = Busline
function L2_1(A0_2, A1_2, A2_2)
  local L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2
  L3_2 = pairs
  L4_2 = A0_2.peds
  L3_2, L4_2, L5_2, L6_2 = L3_2(L4_2)
  for L7_2, L8_2 in L3_2, L4_2, L5_2, L6_2 do
    L9_2 = L8_2.entity
    if L9_2 == A1_2 then
      L8_2.invehicle = A2_2
      break
    end
  end
end
L1_1.changePedVehicleState = L2_1
L1_1 = Busline
function L2_1(A0_2)
  local L1_2, L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2
  L1_2 = false
  L2_2 = GetVehicleModelNumberOfSeats
  L3_2 = joaat
  L4_2 = L0_1.car_settings
  L4_2 = L4_2.model
  L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2 = L3_2(L4_2)
  L2_2 = L2_2(L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2)
  L3_2 = 0
  L4_2 = L2_2
  L5_2 = 1
  for L6_2 = L3_2, L4_2, L5_2 do
    L7_2 = IsVehicleSeatFree
    L8_2 = vehicle
    L9_2 = L6_2
    L7_2 = L7_2(L8_2, L9_2)
    if L7_2 then
      L1_2 = L6_2
      break
    end
  end
  return L1_2
end
L1_1.getFreeSeat = L2_1
L1_1 = Busline
function L2_1(A0_2, A1_2)
  local L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2
  L2_2 = math
  L2_2 = L2_2.randomseed
  L3_2 = GetGameTimer
  L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2 = L3_2()
  L2_2(L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2)
  L2_2 = A0_2.stops
  L2_2 = L2_2[A1_2]
  if nil ~= L2_2 then
    L2_2 = A0_2.stops
    L2_2 = L2_2[A1_2]
    L3_2 = L2_2.leaving
    if L3_2 > 0 then
      L3_2 = L2_2.leaved
      L4_2 = L2_2.leaving
      if L3_2 < L4_2 then
        L3_2 = L0_1.debug
        if L3_2 then
          L3_2 = print
          L4_2 = "^2[INFO]^7 Passengers are starting to get off. Total passengers to be offloaded %s, current offloaded %s"
          L5_2 = L4_2
          L4_2 = L4_2.format
          L6_2 = L2_2.leaving
          L7_2 = L2_2.leaved
          L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2 = L4_2(L5_2, L6_2, L7_2)
          L3_2(L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2)
        end
        L3_2 = 1
        L4_2 = L2_2.leaving
        L5_2 = 1
        for L6_2 = L3_2, L4_2, L5_2 do
          L7_2 = A0_2.playerBusy
          if not L7_2 then
            break
          end
          L8_2 = A0_2
          L7_2 = A0_2.getFreePedForLeave
          L7_2 = L7_2(L8_2)
          if nil ~= L7_2 then
            L8_2 = L7_2.leaving
            if not L8_2 then
              L8_2 = L7_2.invehicle
              if L8_2 then
                L8_2 = L0_1.debug
                if L8_2 then
                  L8_2 = print
                  L9_2 = "^2[INFO]^7 Passenger %s is getting off the bus"
                  L10_2 = L9_2
                  L9_2 = L9_2.format
                  L11_2 = L7_2.id
                  L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2 = L9_2(L10_2, L11_2)
                  L8_2(L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2)
                end
                L7_2.leaving = true
                L8_2 = TaskLeaveVehicle
                L9_2 = L7_2.entity
                L10_2 = vehicle
                L11_2 = 256
                L8_2(L9_2, L10_2, L11_2)
                L8_2 = TaskWanderStandard
                L9_2 = L7_2.entity
                L10_2 = 10.0
                L11_2 = 10
                L8_2(L9_2, L10_2, L11_2)
                L8_2 = A0_2.cam
                if nil ~= L8_2 then
                  L8_2 = PointCamAtEntity
                  L9_2 = A0_2.cam
                  L10_2 = L7_2.entity
                  L11_2 = 0.0
                  L12_2 = 0.0
                  L13_2 = 0.0
                  L14_2 = true
                  L8_2(L9_2, L10_2, L11_2, L12_2, L13_2, L14_2)
                end
                while true do
                  L8_2 = IsPedInVehicle
                  L9_2 = L7_2.entity
                  L10_2 = vehicle
                  L11_2 = false
                  L8_2 = L8_2(L9_2, L10_2, L11_2)
                  if not L8_2 then
                    break
                  end
                  L8_2 = Wait
                  L9_2 = 250
                  L8_2(L9_2)
                end
                L7_2.invehicle = false
                L7_2.leaving = false
                L8_2 = L2_2.leaved
                L8_2 = L8_2 + 1
                L2_2.leaved = L8_2
                L8_2 = math
                L8_2 = L8_2.random
                L9_2 = 1
                L10_2 = 7
                L8_2 = L8_2(L9_2, L10_2)
                L8_2 = L8_2 * 1000
                L9_2 = SetTimeout
                L10_2 = L8_2
                function L11_2()
                  local L0_3, L1_3, L2_3
                  L0_3 = TriggerServerEvent
                  L1_3 = "wais:deleteProp:Id"
                  L2_3 = L7_2.id
                  L0_3(L1_3, L2_3)
                  L0_3 = DoesEntityExist
                  L1_3 = L7_2.entity
                  L0_3 = L0_3(L1_3)
                  if L0_3 then
                    L0_3 = DeleteEntity
                    L1_3 = L7_2.entity
                    L0_3(L1_3)
                    L0_3 = A0_2.peds
                    L1_3 = L7_2.index
                    L0_3[L1_3] = nil
                  end
                end
                L9_2(L10_2, L11_2)
              end
            end
          end
        end
        L3_2 = L0_1.debug
        if L3_2 then
          L3_2 = print
          L4_2 = "^2[INFO]^7 Passenger offloading processes completed"
          L3_2(L4_2)
        end
        L4_2 = A0_2
        L3_2 = A0_2.readyVehicleToAction
        L5_2 = false
        L3_2(L4_2, L5_2)
        L3_2 = L2_2.leaved
        L4_2 = L2_2.leaving
        if L3_2 >= L4_2 then
          L3_2 = L2_2.boarded
          L4_2 = L2_2.boarding
          if L3_2 >= L4_2 then
            L2_2.actionsDone = true
            L4_2 = A0_2
            L3_2 = A0_2.checkNextStop
            L5_2 = A1_2 + 1
            L3_2(L4_2, L5_2)
            L3_2 = L0_1.debug
            if L3_2 then
              L3_2 = print
              L4_2 = "^2[INFO]^7 All actions completed, ready for the next stop"
              L3_2(L4_2)
            end
          end
        end
      end
    end
    L3_2 = L2_2.boarding
    if L3_2 > 0 then
      L3_2 = L2_2.boarded
      L4_2 = L2_2.boarding
      if L3_2 < L4_2 then
        L3_2 = L0_1.debug
        if L3_2 then
          L3_2 = print
          L4_2 = "^2[INFO]^7 Passengers are starting to board. Total passengers to be boarded %s, current boarded %s"
          L5_2 = L4_2
          L4_2 = L4_2.format
          L6_2 = L2_2.boarding
          L7_2 = L2_2.boarded
          L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2 = L4_2(L5_2, L6_2, L7_2)
          L3_2(L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2)
        end
        L3_2 = 1
        L4_2 = L2_2.boarding
        L5_2 = 1
        for L6_2 = L3_2, L4_2, L5_2 do
          L7_2 = A0_2.playerBusy
          if not L7_2 then
            break
          end
          L8_2 = A0_2
          L7_2 = A0_2.getFreeSeat
          L7_2 = L7_2(L8_2)
          L8_2 = print
          L9_2 = "^2[INFO]^7 Free seat number: %s"
          L10_2 = L9_2
          L9_2 = L9_2.format
          L11_2 = L7_2
          L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2 = L9_2(L10_2, L11_2)
          L8_2(L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2)
          if L7_2 then
            L9_2 = A0_2
            L8_2 = A0_2.getFreePedForEnter
            L10_2 = A1_2
            L8_2 = L8_2(L9_2, L10_2)
            if not L8_2 then
              goto lbl_269
            end
            L9_2 = L2_2.peds
            L10_2 = L8_2.ped
            L9_2 = L9_2[L10_2]
            L9_2.entering = true
            L9_2 = ClearPedTasks
            L10_2 = L8_2.ped
            L9_2(L10_2)
            L9_2 = ClearPedSecondaryTask
            L10_2 = L8_2.ped
            L9_2(L10_2)
            L9_2 = Wait
            L10_2 = 50
            L9_2(L10_2)
            L9_2 = TaskEnterVehicle
            L10_2 = L8_2.ped
            L11_2 = vehicle
            L12_2 = 10000
            L13_2 = L7_2
            L14_2 = 1.0
            L15_2 = 1
            L16_2 = 0
            L9_2(L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2)
            L9_2 = A0_2.cam
            if nil ~= L9_2 then
              L9_2 = PointCamAtEntity
              L10_2 = A0_2.cam
              L11_2 = L8_2.ped
              L12_2 = 0.0
              L13_2 = 0.0
              L14_2 = 0.0
              L15_2 = true
              L9_2(L10_2, L11_2, L12_2, L13_2, L14_2, L15_2)
            end
            while true do
              L9_2 = IsPedInVehicle
              L10_2 = L8_2.ped
              L11_2 = vehicle
              L12_2 = false
              L9_2 = L9_2(L10_2, L11_2, L12_2)
              if L9_2 then
                break
              end
              L9_2 = Wait
              L10_2 = 250
              L9_2(L10_2)
            end
            L10_2 = A0_2
            L9_2 = A0_2.changePedVehicleState
            L11_2 = L8_2.ped
            L12_2 = true
            L9_2(L10_2, L11_2, L12_2)
            L9_2 = L2_2.peds
            L10_2 = L8_2.ped
            L9_2 = L9_2[L10_2]
            L9_2.invehicle = true
            L9_2 = L2_2.peds
            L10_2 = L8_2.ped
            L9_2 = L9_2[L10_2]
            L9_2.entering = false
            L9_2 = L2_2.boarded
            L9_2 = L9_2 + 1
            L2_2.boarded = L9_2
          else
            L8_2 = pairs
            L9_2 = L2_2.peds
            L8_2, L9_2, L10_2, L11_2 = L8_2(L9_2)
            for L12_2, L13_2 in L8_2, L9_2, L10_2, L11_2 do
              L14_2 = L13_2.invehicle
              if not L14_2 then
                L14_2 = L13_2.entering
                if not L14_2 then
                  L14_2 = L13_2.leaving
                  if not L14_2 then
                    L14_2 = L0_1.debug
                    if L14_2 then
                      L14_2 = print
                      L15_2 = "^2[INFO]^7 Passenger cannot board the bus, no free seats available"
                      L14_2(L15_2)
                    end
                    L14_2 = Config
                    L14_2 = L14_2.Notification
                    L15_2 = Lang
                    L16_2 = "job"
                    L15_2 = L15_2(L16_2)
                    L16_2 = Lang
                    L17_2 = "bus_no_free_seat"
                    L16_2 = L16_2(L17_2)
                    L17_2 = "error"
                    L18_2 = 5000
                    L14_2(L15_2, L16_2, L17_2, L18_2)
                    break
                  end
                end
              end
            end
          end
          ::lbl_269::
        end
        L3_2 = L0_1.debug
        if L3_2 then
          L3_2 = print
          L4_2 = "^2[INFO]^7 Passenger boarding processes completed"
          L3_2(L4_2)
        end
        L4_2 = A0_2
        L3_2 = A0_2.readyVehicleToAction
        L5_2 = false
        L3_2(L4_2, L5_2)
        L3_2 = L2_2.leaved
        L4_2 = L2_2.leaving
        if L3_2 >= L4_2 then
          L3_2 = L2_2.boarded
          L4_2 = L2_2.boarding
          if L3_2 >= L4_2 then
            L2_2.actionsDone = true
            L4_2 = A0_2
            L3_2 = A0_2.checkNextStop
            L5_2 = A1_2 + 1
            L3_2(L4_2, L5_2)
            L3_2 = L0_1.debug
            if L3_2 then
              L3_2 = print
              L4_2 = "^2[INFO]^7 All actions completed, ready for the next stop"
              L3_2(L4_2)
            end
          end
        end
      end
    end
  end
end
L1_1.busOnStop = L2_1
L1_1 = Busline
function L2_1(A0_2, A1_2)
  local L2_2, L3_2, L4_2, L5_2, L6_2
  L3_2 = A0_2
  L2_2 = A0_2.deleteStop
  L4_2 = A1_2 - 1
  L5_2 = false
  L2_2 = L2_2(L3_2, L4_2, L5_2)
  if L2_2 then
    L2_2 = A0_2.stops
    L2_2 = L2_2[A1_2]
    if nil ~= L2_2 then
      L2_2 = L0_1.debug
      if L2_2 then
        L2_2 = print
        L3_2 = "^2[INFO]^7 Next stop is %s, total stops remaining %s"
        L4_2 = L3_2
        L3_2 = L3_2.format
        L5_2 = A1_2
        L6_2 = A0_2.totalStops
        L3_2, L4_2, L5_2, L6_2 = L3_2(L4_2, L5_2, L6_2)
        L2_2(L3_2, L4_2, L5_2, L6_2)
      end
      L2_2 = SetNewWaypoint
      L3_2 = A0_2.stops
      L3_2 = L3_2[A1_2]
      L3_2 = L3_2.coords
      L3_2 = L3_2.x
      L4_2 = A0_2.stops
      L4_2 = L4_2[A1_2]
      L4_2 = L4_2.coords
      L4_2 = L4_2.y
      L2_2(L3_2, L4_2)
      L2_2 = Config
      L2_2 = L2_2.Notification
      L3_2 = Lang
      L4_2 = "job"
      L3_2 = L3_2(L4_2)
      L4_2 = Lang
      L5_2 = "next_stop_marked_&_remaining"
      L6_2 = A0_2.totalStops
      L4_2 = L4_2(L5_2, L6_2)
      L5_2 = "inform"
      L6_2 = 5000
      L2_2(L3_2, L4_2, L5_2, L6_2)
    else
      L2_2 = L0_1.debug
      if L2_2 then
        L2_2 = print
        L3_2 = "^2[INFO]^7 All stops completed, returning to the garage"
        L2_2(L3_2)
      end
      L2_2 = {}
      A0_2.stops = L2_2
      L2_2 = SetNewWaypoint
      L3_2 = L0_1.car_settings
      L3_2 = L3_2.spawnCoords
      L3_2 = L3_2.x
      L4_2 = L0_1.car_settings
      L4_2 = L4_2.spawnCoords
      L4_2 = L4_2.y
      L2_2(L3_2, L4_2)
      L2_2 = Config
      L2_2 = L2_2.Notification
      L3_2 = Lang
      L4_2 = "job"
      L3_2 = L3_2(L4_2)
      L4_2 = Lang
      L5_2 = "bus_garage_marked"
      L4_2 = L4_2(L5_2)
      L5_2 = "success"
      L6_2 = 5000
      L2_2(L3_2, L4_2, L5_2, L6_2)
    end
  end
end
L1_1.checkNextStop = L2_1
L1_1 = Busline
function L2_1(A0_2, A1_2, A2_2)
  local L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2
  L3_2 = A0_2.stops
  L3_2 = L3_2[A1_2]
  if L3_2 then
    L4_2 = L3_2.zone
    if L4_2 then
      L4_2 = L3_2.zone
      L5_2 = L4_2
      L4_2 = L4_2.remove
      L4_2(L5_2)
      L3_2.zone = nil
    end
    L4_2 = L3_2.blip
    if L4_2 then
      L4_2 = RemoveBlip
      L5_2 = L3_2.blip
      L4_2(L5_2)
      L3_2.blip = nil
    end
    if A2_2 then
      L4_2 = TriggerServerEvent
      L5_2 = "wais:deleteProp:table"
      L6_2 = L3_2.peds
      L4_2(L5_2, L6_2)
      L4_2 = L3_2.peds
      if L4_2 then
        L4_2 = next
        L5_2 = L3_2.peds
        L4_2 = L4_2(L5_2)
        if nil ~= L4_2 then
          L4_2 = pairs
          L5_2 = L3_2.peds
          L4_2, L5_2, L6_2, L7_2 = L4_2(L5_2)
          for L8_2, L9_2 in L4_2, L5_2, L6_2, L7_2 do
            L10_2 = DoesEntityExist
            L11_2 = L9_2.ped
            L10_2 = L10_2(L11_2)
            if L10_2 then
              L10_2 = DeleteEntity
              L11_2 = L9_2.ped
              L10_2(L11_2)
              L10_2 = A0_2.peds
              L11_2 = L9_2.ped
              L10_2[L11_2] = nil
            end
          end
        end
      end
    end
    L4_2 = {}
    L3_2.peds = L4_2
    L3_2.actionsDone = false
    L4_2 = 0
    L3_2.boarded = 0
    L3_2.leaved = L4_2
    L3_2 = nil
    L4_2 = A0_2.stops
    L4_2[A1_2] = nil
    L4_2 = A0_2.totalStops
    L4_2 = L4_2 - 1
    A0_2.totalStops = L4_2
    L4_2 = L0_1.debug
    if L4_2 then
      L4_2 = print
      L5_2 = "^2[INFO]^7 Stop %s deleted"
      L6_2 = L5_2
      L5_2 = L5_2.format
      L7_2 = A1_2
      L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2 = L5_2(L6_2, L7_2)
      L4_2(L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2)
    end
    L4_2 = true
    return L4_2
  end
end
L1_1.deleteStop = L2_1
L1_1 = Busline
function L2_1(A0_2)
  local L1_2, L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2
  L1_2 = FreezeEntityPosition
  L2_2 = vehicle
  L3_2 = true
  L1_2(L2_2, L3_2)
  L1_2 = 1
  L2_2 = A0_2.peds
  L2_2 = #L2_2
  L3_2 = 1
  for L4_2 = L1_2, L2_2, L3_2 do
    L5_2 = A0_2.peds
    L5_2 = L5_2[L4_2]
    if nil ~= L5_2 then
      L5_2 = A0_2.peds
      L5_2 = L5_2[L4_2]
      L6_2 = DoesEntityExist
      L7_2 = L5_2.entity
      L6_2 = L6_2(L7_2)
      if L6_2 then
        L6_2 = ClearPedTasks
        L7_2 = L5_2.entity
        L6_2(L7_2)
        L6_2 = ClearPedSecondaryTask
        L7_2 = L5_2.entity
        L6_2(L7_2)
        L6_2 = Wait
        L7_2 = 50
        L6_2(L7_2)
        L6_2 = TaskLeaveVehicle
        L7_2 = L5_2.entity
        L8_2 = vehicle
        L9_2 = 256
        L6_2(L7_2, L8_2, L9_2)
        L6_2 = TaskWanderStandard
        L7_2 = L5_2.entity
        L8_2 = 10.0
        L9_2 = 10
        L6_2(L7_2, L8_2, L9_2)
        L6_2 = SetEntityInvincible
        L7_2 = L5_2.entity
        L8_2 = false
        L6_2(L7_2, L8_2)
        L6_2 = SetBlockingOfNonTemporaryEvents
        L7_2 = L5_2.entity
        L8_2 = false
        L6_2(L7_2, L8_2)
        L6_2 = SetPedCanPlayAmbientAnims
        L7_2 = L5_2.entity
        L8_2 = true
        L6_2(L7_2, L8_2)
        while true do
          L6_2 = IsPedInAnyVehicle
          L7_2 = L5_2.entity
          L8_2 = false
          L6_2 = L6_2(L7_2, L8_2)
          if not L6_2 then
            break
          end
          L6_2 = Wait
          L7_2 = 250
          L6_2(L7_2)
        end
        L6_2 = math
        L6_2 = L6_2.random
        L7_2 = 1
        L8_2 = 7
        L6_2 = L6_2(L7_2, L8_2)
        L6_2 = L6_2 * 1000
        L7_2 = SetTimeout
        L8_2 = L6_2
        function L9_2()
          local L0_3, L1_3
          L0_3 = DoesEntityExist
          L1_3 = L5_2.entity
          L0_3 = L0_3(L1_3)
          if L0_3 then
            L0_3 = DeleteEntity
            L1_3 = L5_2.entity
            L0_3(L1_3)
          end
        end
        L7_2(L8_2, L9_2)
        L7_2 = A0_2.peds
        L7_2[L4_2] = nil
      end
    else
      L5_2 = A0_2.peds
      L5_2[L4_2] = nil
    end
  end
  L1_2 = TriggerServerEvent
  L2_2 = "wais:deleteProp:table"
  L3_2 = A0_2.peds
  L1_2(L2_2, L3_2)
  L1_2 = {}
  A0_2.peds = L1_2
  L1_2 = calcuteDeductedMoney
  L2_2 = A0_2.timer
  L2_2 = L2_2.extraTimeEnabled
  L3_2 = A0_2.config
  L3_2 = L3_2.mission_time
  L4_2 = formatNumberToMin
  L5_2 = A0_2.timer
  L6_2 = L5_2
  L5_2 = L5_2.getDuration
  L5_2, L6_2, L7_2, L8_2, L9_2 = L5_2(L6_2)
  L4_2 = L4_2(L5_2, L6_2, L7_2, L8_2, L9_2)
  L5_2 = A0_2.config
  L5_2 = L5_2.deducted_per_min
  L1_2 = L1_2(L2_2, L3_2, L4_2, L5_2)
  L2_2 = TriggerServerEvent
  L3_2 = "wais:giveBusDriver:reward"
  L4_2 = CurrentJob
  L5_2 = A0_2.lineNumber
  L6_2 = L1_2
  L2_2(L3_2, L4_2, L5_2, L6_2)
  L2_2 = Config
  L2_2 = L2_2.JobSuccess
  L3_2 = CurrentJob
  L4_2 = A0_2.config
  L4_2 = L4_2.reward
  L4_2 = L4_2 - L1_2
  L5_2 = A0_2.lineNumber
  L6_2 = A0_2.timer
  L7_2 = L6_2
  L6_2 = L6_2.getDuration
  L6_2 = L6_2(L7_2)
  L7_2 = A0_2.timer
  L7_2 = L7_2.extraTimeEnabled
  L2_2(L3_2, L4_2, L5_2, L6_2, L7_2)
  L3_2 = A0_2
  L2_2 = A0_2.deleteSelf
  L2_2(L3_2)
  L2_2 = L0_1.debug
  if L2_2 then
    L2_2 = print
    L3_2 = "^2[INFO]^7 All passengers have been removed from the bus"
    L2_2(L3_2)
  end
end
L1_1.leaveAllPeds = L2_1
L1_1 = Busline
function L2_1(A0_2)
  local L1_2, L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2
  L1_2 = A0_2.deleted
  if L1_2 then
    return
  end
  A0_2.deleted = true
  L1_2 = A0_2.cam
  if L1_2 then
    L2_2 = A0_2
    L1_2 = A0_2.destroyCamera
    L1_2(L2_2)
  end
  L1_2 = A0_2.timer
  if L1_2 then
    L1_2 = A0_2.timer
    L2_2 = L1_2
    L1_2 = L1_2.delete
    L1_2(L2_2)
    A0_2.timer = nil
  end
  L1_2 = pairs
  L2_2 = A0_2.stops
  L1_2, L2_2, L3_2, L4_2 = L1_2(L2_2)
  for L5_2, L6_2 in L1_2, L2_2, L3_2, L4_2 do
    L8_2 = A0_2
    L7_2 = A0_2.deleteStop
    L9_2 = L5_2
    L10_2 = true
    L7_2(L8_2, L9_2, L10_2)
  end
  L1_2 = next
  L2_2 = A0_2.peds
  L1_2 = L1_2(L2_2)
  if nil ~= L1_2 then
    L1_2 = 1
    L2_2 = A0_2.peds
    L2_2 = #L2_2
    L3_2 = 1
    for L4_2 = L1_2, L2_2, L3_2 do
      L5_2 = A0_2.peds
      L5_2 = L5_2[L4_2]
      L6_2 = DoesEntityExist
      L7_2 = L5_2.entity
      L6_2 = L6_2(L7_2)
      if L6_2 then
        L6_2 = DeleteEntity
        L7_2 = L5_2.entity
        L6_2(L7_2)
      end
    end
    L1_2 = TriggerServerEvent
    L2_2 = "wais:deleteProp:table"
    L3_2 = A0_2.peds
    L1_2(L2_2, L3_2)
    L1_2 = {}
    A0_2.peds = L1_2
  end
  L1_2 = TriggerServerEvent
  L2_2 = "wais:delete:Entitys"
  L1_2(L2_2)
  A0_2 = nil
end
L1_1.deleteSelf = L2_1
L1_1 = Busline
function L2_1(A0_2, A1_2)
  local L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2
  L2_2 = setmetatable
  L3_2 = {}
  L4_2 = Busline
  L2_2 = L2_2(L3_2, L4_2)
  L3_2 = L0_1.lines
  L3_2 = L3_2[A1_2]
  L2_2.config = L3_2
  L3_2 = false
  L4_2 = nil
  L5_2 = {}
  L6_2 = {}
  L2_2.peds = L6_2
  L2_2.stops = L5_2
  L2_2.cam = L4_2
  L2_2.deleted = L3_2
  L3_2 = false
  L4_2 = false
  L5_2 = A1_2
  L2_2.leaveGarage = false
  L2_2.lineNumber = L5_2
  L2_2.playerBusy = L4_2
  L2_2.warning = L3_2
  L3_2 = JobTimer
  L4_2 = L3_2
  L3_2 = L3_2.New
  L5_2 = L2_2.config
  L5_2 = L5_2.mission_time
  L6_2 = L2_2.config
  L6_2 = L6_2.extra_time_enabled
  L7_2 = false
  L3_2 = L3_2(L4_2, L5_2, L6_2, L7_2)
  L2_2.timer = L3_2
  L3_2 = false
  L4_2 = L2_2.config
  L4_2 = L4_2.stops
  L4_2 = #L4_2
  L2_2.totalStops = L4_2
  L2_2.canStopOnStop = L3_2
  L3_2 = pairs
  L4_2 = L2_2.config
  L4_2 = L4_2.stops
  L3_2, L4_2, L5_2, L6_2 = L3_2(L4_2)
  for L7_2, L8_2 in L3_2, L4_2, L5_2, L6_2 do
    L9_2 = L2_2.stops
    L10_2 = {}
    L11_2 = {}
    L10_2.peds = L11_2
    L11_2 = L8_2.leaving_passenger
    L10_2.leaving = L11_2
    L11_2 = L8_2.boarding_passenger
    L10_2.boarding = L11_2
    L10_2.leaved = 0
    L10_2.boarded = 0
    L10_2.actionsDone = false
    L11_2 = lib
    L11_2 = L11_2.zones
    L11_2 = L11_2.sphere
    L12_2 = {}
    L13_2 = vec3
    L14_2 = L8_2.coords
    L14_2 = L14_2.x
    L15_2 = L8_2.coords
    L15_2 = L15_2.y
    L16_2 = L8_2.coords
    L16_2 = L16_2.z
    L13_2 = L13_2(L14_2, L15_2, L16_2)
    L12_2.coords = L13_2
    L12_2.radius = 75.0
    L13_2 = L0_1.debug
    L12_2.debug = L13_2
    function L13_2()
      local L0_3, L1_3, L2_3, L3_3, L4_3, L5_3, L6_3, L7_3, L8_3, L9_3, L10_3, L11_3, L12_3, L13_3, L14_3, L15_3, L16_3, L17_3, L18_3, L19_3, L20_3, L21_3, L22_3, L23_3, L24_3, L25_3, L26_3, L27_3, L28_3, L29_3, L30_3, L31_3, L32_3, L33_3, L34_3
      L0_3 = L8_2.actionsDone
      if not L0_3 then
        L0_3 = L2_2.canStopOnStop
        if L0_3 then
          L0_3 = GetEntityCoords
          L1_3 = vehicle
          L0_3 = L0_3(L1_3)
          L1_3 = GetEntitySpeed
          L2_3 = vehicle
          L1_3 = L1_3(L2_3)
          L2_3 = vec3
          L3_3 = L8_2.coords
          L3_3 = L3_3.x
          L4_3 = L8_2.coords
          L4_3 = L4_3.y
          L5_3 = L8_2.coords
          L5_3 = L5_3.z
          L2_3 = L2_3(L3_3, L4_3, L5_3)
          L2_3 = L0_3 - L2_3
          L2_3 = #L2_3
          L3_3 = pairs
          L4_3 = L2_2.stops
          L5_3 = L7_2
          L4_3 = L4_3[L5_3]
          L4_3 = L4_3.peds
          L3_3, L4_3, L5_3, L6_3 = L3_3(L4_3)
          for L7_3, L8_3 in L3_3, L4_3, L5_3, L6_3 do
            L9_3 = L8_3.invehicle
            if not L9_3 then
              L9_3 = GetEntityCoords
              L10_3 = L8_3.ped
              L9_3 = L9_3(L10_3)
              L10_3 = DrawMarker
              L11_3 = 2
              L12_3 = L9_3.x
              L13_3 = L9_3.y
              L14_3 = L9_3.z
              L14_3 = L14_3 + 0.95
              L15_3 = 0
              L16_3 = 0
              L17_3 = 0
              L18_3 = 0
              L19_3 = -180
              L20_3 = 0
              L21_3 = 0.25
              L22_3 = 0.25
              L23_3 = 0.25
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
            end
          end
          L3_3 = L8_2.distance
          if L2_3 <= L3_3 then
            L3_3 = L2_2.playerBusy
            if not L3_3 then
              L3_3 = L0_1.debug
              if L3_3 then
                L3_3 = print
                L4_3 = "^2[INFO]^7 Vehicle stopped at the bus stop, passenger processing begins."
                L3_3(L4_3)
              end
              L3_3 = L2_2
              L4_3 = L3_3
              L3_3 = L3_3.readyVehicleToAction
              L5_3 = true
              L3_3 = L3_3(L4_3, L5_3)
              if L3_3 then
                L3_3 = L2_2
                L4_3 = L3_3
                L3_3 = L3_3.busOnStop
                L5_3 = L7_2
                L3_3(L4_3, L5_3)
              end
            end
          end
        end
      end
    end
    L12_2.inside = L13_2
    function L13_2()
      local L0_3, L1_3, L2_3, L3_3, L4_3, L5_3, L6_3, L7_3, L8_3, L9_3, L10_3, L11_3, L12_3, L13_3, L14_3, L15_3, L16_3, L17_3
      L0_3 = L2_2.stops
      L1_3 = L7_2
      L1_3 = L1_3 - 1
      L0_3 = L0_3[L1_3]
      if nil ~= L0_3 then
        L0_3 = L2_2.stops
        L1_3 = L7_2
        L1_3 = L1_3 - 1
        L0_3 = L0_3[L1_3]
        L0_3 = L0_3.actionsDone
        if not L0_3 then
          L0_3 = Config
          L0_3 = L0_3.Notification
          L1_3 = Lang
          L2_3 = "job"
          L1_3 = L1_3(L2_3)
          L2_3 = Lang
          L3_3 = "bus_goback_old_stop"
          L2_3 = L2_3(L3_3)
          L3_3 = "error"
          L4_3 = 5000
          return L0_3(L1_3, L2_3, L3_3, L4_3)
        end
      end
      L2_2.canStopOnStop = true
      L0_3 = next
      L1_3 = L2_2.stops
      L2_3 = L7_2
      L1_3 = L1_3[L2_3]
      L1_3 = L1_3.peds
      L0_3 = L0_3(L1_3)
      if nil == L0_3 then
        L0_3 = L8_2.boarding_passenger
        if L0_3 > 0 then
          L0_3 = 1
          L1_3 = L8_2.boarding_passenger
          L2_3 = 1
          for L3_3 = L0_3, L1_3, L2_3 do
            L4_3 = joaat
            L5_3 = PedModels
            L6_3 = math
            L6_3 = L6_3.random
            L7_3 = 1
            L8_3 = PedModels
            L8_3 = #L8_3
            L6_3 = L6_3(L7_3, L8_3)
            L5_3 = L5_3[L6_3]
            L4_3 = L4_3(L5_3)
            L5_3 = loadModel
            L6_3 = L4_3
            L5_3 = L5_3(L6_3)
            if not L5_3 then
              return
            end
            L5_3 = 0.05
            L6_3 = math
            L6_3 = L6_3.rad
            L7_3 = L8_2.npc_coord
            L7_3 = L7_3.w
            if not L7_3 then
              L7_3 = 0
            end
            L6_3 = L6_3(L7_3)
            L7_3 = L8_2.npc_coord
            L7_3 = L7_3.x
            L8_3 = math
            L8_3 = L8_3.cos
            L9_3 = L6_3
            L8_3 = L8_3(L9_3)
            L8_3 = L8_3 * L5_3
            L9_3 = L8_2.boarding_passenger
            L9_3 = L9_3 + 1
            L8_3 = L8_3 * L9_3
            L7_3 = L7_3 + L8_3
            L8_3 = L8_2.npc_coord
            L8_3 = L8_3.y
            L9_3 = math
            L9_3 = L9_3.sin
            L10_3 = L6_3
            L9_3 = L9_3(L10_3)
            L9_3 = L9_3 * L5_3
            L10_3 = L8_2.boarding_passenger
            L10_3 = L10_3 + 1
            L9_3 = L9_3 * L10_3
            L8_3 = L8_3 + L9_3
            L9_3 = CreatePed
            L10_3 = 4
            L11_3 = L4_3
            L12_3 = L7_3
            L13_3 = L8_3
            L14_3 = L8_2.npc_coord
            L14_3 = L14_3.z
            L15_3 = L8_2.npc_coord
            L15_3 = L15_3.w
            L16_3 = true
            L17_3 = false
            L9_3 = L9_3(L10_3, L11_3, L12_3, L13_3, L14_3, L15_3, L16_3, L17_3)
            L10_3 = SetEntityAsMissionEntity
            L11_3 = L9_3
            L12_3 = false
            L13_3 = false
            L10_3(L11_3, L12_3, L13_3)
            L10_3 = SetPedCanPlayAmbientAnims
            L11_3 = L9_3
            L12_3 = true
            L10_3(L11_3, L12_3)
            L10_3 = SetBlockingOfNonTemporaryEvents
            L11_3 = L9_3
            L12_3 = true
            L10_3(L11_3, L12_3)
            L10_3 = SetEntityInvincible
            L11_3 = L9_3
            L12_3 = true
            L10_3(L11_3, L12_3)
            L10_3 = TaskStartScenarioInPlace
            L11_3 = L9_3
            L12_3 = Scenarios
            L13_3 = math
            L13_3 = L13_3.random
            L14_3 = 1
            L15_3 = Scenarios
            L15_3 = #L15_3
            L13_3 = L13_3(L14_3, L15_3)
            L12_3 = L12_3[L13_3]
            L13_3 = 0
            L14_3 = true
            L10_3(L11_3, L12_3, L13_3, L14_3)
            L10_3 = TaskTurnPedToFaceEntity
            L11_3 = L9_3
            L12_3 = vehicle
            L13_3 = -1
            L10_3(L11_3, L12_3, L13_3)
            L10_3 = L2_2.stops
            L11_3 = L7_2
            L10_3 = L10_3[L11_3]
            L10_3 = L10_3.peds
            L11_3 = {}
            L11_3.ped = L9_3
            L11_3.leaving = false
            L11_3.entering = false
            L11_3.invehicle = false
            L10_3[L9_3] = L11_3
            L10_3 = L2_2.peds
            L11_3 = L2_2.peds
            L11_3 = #L11_3
            L11_3 = L11_3 + 1
            L12_3 = {}
            L12_3.entity = L9_3
            L13_3 = NetworkGetNetworkIdFromEntity
            L14_3 = L9_3
            L13_3 = L13_3(L14_3)
            L12_3.id = L13_3
            L12_3.leaving = false
            L12_3.entering = false
            L12_3.invehicle = false
            L10_3[L11_3] = L12_3
            L10_3 = TriggerServerEvent
            L11_3 = "wais:addProp:table"
            L12_3 = L2_2.peds
            L10_3(L11_3, L12_3)
          end
        end
      end
    end
    L12_2.onEnter = L13_2
    function L13_2()
      local L0_3, L1_3, L2_3, L3_3, L4_3
      L0_3 = L2_2.stops
      L1_3 = L7_2
      L1_3 = L1_3 - 1
      L0_3 = L0_3[L1_3]
      if nil ~= L0_3 then
        L0_3 = L2_2.stops
        L1_3 = L7_2
        L1_3 = L1_3 - 1
        L0_3 = L0_3[L1_3]
        L0_3 = L0_3.actionsDone
        if not L0_3 then
          L0_3 = Config
          L0_3 = L0_3.Notification
          L1_3 = Lang
          L2_3 = "job"
          L1_3 = L1_3(L2_3)
          L2_3 = Lang
          L3_3 = "bus_goback_old_stop"
          L2_3 = L2_3(L3_3)
          L3_3 = "error"
          L4_3 = 5000
          return L0_3(L1_3, L2_3, L3_3, L4_3)
      end
      else
        L0_3 = L2_2.stops
        L1_3 = L7_2
        L0_3 = L0_3[L1_3]
        L0_3 = L0_3.actionsDone
        if not L0_3 then
          L0_3 = Config
          L0_3 = L0_3.Notification
          L1_3 = Lang
          L2_3 = "job"
          L1_3 = L1_3(L2_3)
          L2_3 = Lang
          L3_3 = "bus_goback_curr_stop"
          L2_3 = L2_3(L3_3)
          L3_3 = "error"
          L4_3 = 5000
          return L0_3(L1_3, L2_3, L3_3, L4_3)
        end
      end
      L0_3 = L2_2.playerBusy
      if L0_3 then
        L0_3 = L2_2
        L1_3 = L0_3
        L0_3 = L0_3.readyVehicleToAction
        L2_3 = false
        L0_3(L1_3, L2_3)
      end
      L2_2.canStopOnStop = false
    end
    L12_2.onExit = L13_2
    L11_2 = L11_2(L12_2)
    L10_2.zone = L11_2
    L10_2.blip = nil
    L11_2 = L8_2.coords
    L10_2.coords = L11_2
    L11_2 = L8_2.distance
    L10_2.distance = L11_2
    L9_2[L7_2] = L10_2
    L9_2 = L2_2.config
    L9_2 = L9_2.blips
    L9_2 = L9_2.show
    if L9_2 then
      L9_2 = L2_2.stops
      L9_2 = L9_2[L7_2]
      L10_2 = AddBlipForCoord
      L11_2 = L8_2.coords
      L11_2 = L11_2.x
      L12_2 = L8_2.coords
      L12_2 = L12_2.y
      L13_2 = L8_2.coords
      L13_2 = L13_2.z
      L10_2 = L10_2(L11_2, L12_2, L13_2)
      L9_2.blip = L10_2
      L9_2 = SetBlipSprite
      L10_2 = blip
      L11_2 = L2_2.config
      L11_2 = L11_2.blips
      L11_2 = L11_2.sprite
      L9_2(L10_2, L11_2)
      L9_2 = SetBlipDisplay
      L10_2 = blip
      L11_2 = 4
      L9_2(L10_2, L11_2)
      L9_2 = SetBlipScale
      L10_2 = blip
      L11_2 = L2_2.config
      L11_2 = L11_2.blips
      L11_2 = L11_2.scale
      L9_2(L10_2, L11_2)
      L9_2 = SetBlipColour
      L10_2 = blip
      L11_2 = L2_2.config
      L11_2 = L11_2.blips
      L11_2 = L11_2.color
      L9_2(L10_2, L11_2)
      L9_2 = BeginTextCommandSetBlipName
      L10_2 = "STRING"
      L9_2(L10_2)
      L9_2 = AddTextComponentString
      L10_2 = L2_2.config
      L10_2 = L10_2.blips
      L10_2 = L10_2.label
      L11_2 = L10_2
      L10_2 = L10_2.format
      L12_2 = L7_2
      L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2 = L10_2(L11_2, L12_2)
      L9_2(L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2)
      L9_2 = EndTextCommandSetBlipName
      L10_2 = blip
      L9_2(L10_2)
      L9_2 = blips
      L10_2 = blips
      L10_2 = #L10_2
      L10_2 = L10_2 + 1
      L11_2 = L2_2.stops
      L11_2 = L11_2[L7_2]
      L11_2 = L11_2.blip
      L9_2[L10_2] = L11_2
    end
  end
  L3_2 = SetNewWaypoint
  L4_2 = L2_2.stops
  L4_2 = L4_2[1]
  L4_2 = L4_2.coords
  L4_2 = L4_2.x
  L5_2 = L2_2.stops
  L5_2 = L5_2[1]
  L5_2 = L5_2.coords
  L5_2 = L5_2.y
  L3_2(L4_2, L5_2)
  L3_2 = Config
  L3_2 = L3_2.Notification
  L4_2 = Lang
  L5_2 = "job"
  L4_2 = L4_2(L5_2)
  L5_2 = Lang
  L6_2 = "next_stop_marked_&_remaining"
  L7_2 = L2_2.totalStops
  L5_2 = L5_2(L6_2, L7_2)
  L6_2 = "inform"
  L7_2 = 5000
  L3_2(L4_2, L5_2, L6_2, L7_2)
  L3_2 = CreateThread
  function L4_2()
    local L0_3, L1_3, L2_3, L3_3, L4_3, L5_3, L6_3, L7_3, L8_3, L9_3, L10_3, L11_3, L12_3, L13_3, L14_3, L15_3, L16_3, L17_3, L18_3, L19_3, L20_3, L21_3, L22_3, L23_3, L24_3, L25_3, L26_3, L27_3, L28_3, L29_3
    while true do
      L0_3 = L2_2
      if not L0_3 then
        break
      end
      L0_3 = L2_2.deleted
      if L0_3 then
        break
      end
      L0_3 = 1000
      L1_3 = PlayerPedId
      L1_3 = L1_3()
      L2_3 = GetVehiclePedIsIn
      L3_3 = L1_3
      L4_3 = false
      L2_3 = L2_3(L3_3, L4_3)
      L3_3 = vehicle
      if L2_3 ~= L3_3 then
        L3_3 = L2_2.warning
        if not L3_3 then
          L2_2.warning = true
          L3_3 = L2_2
          L4_3 = L3_3
          L3_3 = L3_3.warningAttempt
          L3_3(L4_3)
        end
      else
        L3_3 = L2_2.warning
        if L3_3 then
          L2_2.warning = false
        end
        L3_3 = GetEntityCoords
        L4_3 = vehicle
        L3_3 = L3_3(L4_3)
        L4_3 = vec3
        L5_3 = L0_1.car_settings
        L5_3 = L5_3.spawnCoords
        L5_3 = L5_3.x
        L6_3 = L0_1.car_settings
        L6_3 = L6_3.spawnCoords
        L6_3 = L6_3.y
        L7_3 = L0_1.car_settings
        L7_3 = L7_3.spawnCoords
        L7_3 = L7_3.z
        L4_3 = L4_3(L5_3, L6_3, L7_3)
        L4_3 = L3_3 - L4_3
        L4_3 = #L4_3
        L5_3 = next
        L6_3 = L2_2.stops
        L5_3 = L5_3(L6_3)
        if nil == L5_3 and L4_3 <= 50.0 then
          L0_3 = 5
          L5_3 = DrawMarker
          L6_3 = 0
          L7_3 = L0_1.car_settings
          L7_3 = L7_3.spawnCoords
          L7_3 = L7_3.x
          L8_3 = L0_1.car_settings
          L8_3 = L8_3.spawnCoords
          L8_3 = L8_3.y
          L9_3 = L0_1.car_settings
          L9_3 = L9_3.spawnCoords
          L9_3 = L9_3.z
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
          if L4_3 <= 4.0 then
            L5_3 = L2_2.leaveGarage
            if not L5_3 then
              L2_2.leaveGarage = true
              L5_3 = L2_2
              L6_3 = L5_3
              L5_3 = L5_3.leaveAllPeds
              L5_3(L6_3)
            end
          end
        end
      end
      L3_3 = Wait
      L4_3 = L0_3
      L3_3(L4_3)
    end
  end
  L3_2(L4_2)
  return L2_2
end
L1_1.newLine = L2_1