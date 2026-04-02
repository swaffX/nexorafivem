local L0_1, L1_1, L2_1
L0_1 = {}
JobTimer = L0_1
L0_1 = JobTimer
L1_1 = JobTimer
L0_1.__index = L1_1
function L0_1(A0_2, A1_2, A2_2, A3_2, A4_2, A5_2, A6_2, A7_2, A8_2, A9_2)
  local L10_2, L11_2, L12_2, L13_2, L14_2, L15_2
  L10_2 = SetTextFont
  L11_2 = A1_2
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
L1_1 = JobTimer
function L2_1(A0_2)
  local L1_2
  A0_2.deleted = true
  A0_2 = nil
end
L1_1.delete = L2_1
L1_1 = JobTimer
function L2_1(A0_2, A1_2)
  A0_2.deliverCar = A1_2
end
L1_1.changeDeliverCar = L2_1
L1_1 = JobTimer
function L2_1(A0_2)
  local L1_2
  L1_2 = A0_2.duration
  return L1_2
end
L1_1.getDuration = L2_1
L1_1 = JobTimer
function L2_1(A0_2, A1_2, A2_2, A3_2)
  local L4_2, L5_2, L6_2
  L4_2 = setmetatable
  L5_2 = {}
  L6_2 = JobTimer
  L4_2 = L4_2(L5_2, L6_2)
  L5_2 = lib
  L5_2 = L5_2.string
  L5_2 = L5_2.random
  L6_2 = "aaaaaa"
  L5_2 = L5_2(L6_2)
  L4_2.id = L5_2
  L4_2.deleted = false
  L4_2.duration = A1_2
  L4_2.extraTimeEnabled = false
  L4_2.deliverCar = A3_2
  L5_2 = GetGameTimer
  L5_2 = L5_2()
  L4_2.lastUpdate = L5_2
  L5_2 = CreateThread
  function L6_2()
    local L0_3, L1_3, L2_3, L3_3, L4_3, L5_3, L6_3
    while true do
      L0_3 = L4_2
      if not L0_3 then
        break
      end
      L0_3 = L4_2.deleted
      if L0_3 then
        break
      end
      L0_3 = GetGameTimer
      L0_3 = L0_3()
      L1_3 = L4_2.lastUpdate
      L1_3 = L0_3 - L1_3
      L4_2.lastUpdate = L0_3
      L2_3 = L4_2.duration
      L2_3 = L2_3 - L1_3
      L4_2.duration = L2_3
      L2_3 = L4_2.duration
      if L2_3 <= 0 then
        L2_3 = L4_2.extraTimeEnabled
        if not L2_3 then
          L2_3 = A2_2
          L4_2.duration = L2_3
          L4_2.extraTimeEnabled = true
          L2_3 = Config
          L2_3 = L2_3.Notification
          L3_3 = Lang
          L4_3 = "job"
          L3_3 = L3_3(L4_3)
          L4_3 = Lang
          L5_3 = "extra_time_added"
          L4_3 = L4_3(L5_3)
          L5_3 = "inform"
          L6_3 = 5000
          L2_3(L3_3, L4_3, L5_3, L6_3)
      end
      else
        L2_3 = L4_2.duration
        if L2_3 <= 0 then
          L2_3 = L4_2.extraTimeEnabled
          if L2_3 then
            L2_3 = TriggerEvent
            L3_3 = "wais:setDefault:JobThings"
            L2_3(L3_3)
            L2_3 = vehicle
            if nil ~= L2_3 then
              L2_3 = TriggerServerEvent
              L3_3 = "wais:delete:Entitys"
              L2_3(L3_3)
            end
            L2_3 = Config
            L2_3 = L2_3.Notification
            L3_3 = Lang
            L4_3 = "job"
            L3_3 = L3_3(L4_3)
            L4_3 = Lang
            L5_3 = "cancelled"
            L4_3 = L4_3(L5_3)
            L5_3 = "error"
            L6_3 = 5000
            L2_3(L3_3, L4_3, L5_3, L6_3)
            L2_3 = L4_2
            L3_3 = L2_3
            L2_3 = L2_3.delete
            L2_3(L3_3)
          end
        end
      end
      L2_3 = Wait
      L3_3 = 100
      L2_3(L3_3)
    end
  end
  L5_2(L6_2)
  L5_2 = CreateThread
  function L6_2()
    local L0_3, L1_3, L2_3, L3_3, L4_3, L5_3, L6_3, L7_3, L8_3, L9_3, L10_3
    while true do
      L0_3 = L4_2
      if not L0_3 then
        break
      end
      L0_3 = L4_2.deleted
      if L0_3 then
        break
      end
      L0_3 = L0_1
      L1_3 = L4_2.deliverCar
      if L1_3 then
        L1_3 = Lang
        L2_3 = "time_left_car"
        L3_3 = formatNumberToMinSec
        L4_3 = L4_2.duration
        L3_3, L4_3, L5_3, L6_3, L7_3, L8_3, L9_3, L10_3 = L3_3(L4_3)
        L1_3 = L1_3(L2_3, L3_3, L4_3, L5_3, L6_3, L7_3, L8_3, L9_3, L10_3)
        if L1_3 then
          goto lbl_25
        end
      end
      L1_3 = Lang
      L2_3 = "time_left"
      L3_3 = formatNumberToMinSec
      L4_3 = L4_2.duration
      L3_3, L4_3, L5_3, L6_3, L7_3, L8_3, L9_3, L10_3 = L3_3(L4_3)
      L1_3 = L1_3(L2_3, L3_3, L4_3, L5_3, L6_3, L7_3, L8_3, L9_3, L10_3)
      ::lbl_25::
      L2_3 = Config
      L2_3 = L2_3.FontStyle
      L3_3 = Config
      L3_3 = L3_3.TimerLocation
      L3_3 = L3_3.centre
      L4_3 = Config
      L4_3 = L4_3.TimerLocation
      L4_3 = L4_3.x
      L5_3 = Config
      L5_3 = L5_3.TimerLocation
      L5_3 = L5_3.y
      L6_3 = Config
      L6_3 = L6_3.TimerLocation
      L6_3 = L6_3.scale
      L7_3 = Config
      L7_3 = L7_3.TimerLocation
      L7_3 = L7_3.color
      L7_3 = L7_3.r
      L8_3 = Config
      L8_3 = L8_3.TimerLocation
      L8_3 = L8_3.color
      L8_3 = L8_3.g
      L9_3 = Config
      L9_3 = L9_3.TimerLocation
      L9_3 = L9_3.color
      L9_3 = L9_3.b
      L10_3 = Config
      L10_3 = L10_3.TimerLocation
      L10_3 = L10_3.color
      L10_3 = L10_3.a
      L0_3(L1_3, L2_3, L3_3, L4_3, L5_3, L6_3, L7_3, L8_3, L9_3, L10_3)
      L0_3 = Wait
      L1_3 = 1
      L0_3(L1_3)
    end
  end
  L5_2(L6_2)
  return L4_2
end
L1_1.New = L2_1