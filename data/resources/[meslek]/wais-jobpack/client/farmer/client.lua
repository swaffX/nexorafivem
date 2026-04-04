local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1
L0_1 = Config
L0_1 = L0_1.Jobs
L0_1 = L0_1.farmer
L1_1 = {}
L2_1 = nil
L3_1 = nil
L4_1 = nil
G_Farmer_Harvester = nil
G_Farmer_Trailer_NetId = L4_1
G_Farmer_Trailer = L3_1
L3_1 = RegisterNetEvent
L4_1 = "wais:setDefault:JobThings"
function L5_1()
  local L0_2, L1_2, L2_2
  L0_2 = L2_1
  if nil ~= L0_2 then
    L0_2 = Group
    L0_2 = L0_2.active
    if L0_2 then
      L0_2 = Group
      L0_2 = L0_2.ownerId
      L1_2 = GetPlayerServerId
      L2_2 = PlayerId
      L2_2 = L2_2()
      L1_2 = L1_2(L2_2)
      if L0_2 == L1_2 then
        L0_2 = TriggerServerEvent
        L1_2 = "wais:farmer:mission:cancel:group"
        L2_2 = Group
        L2_2 = L2_2.groupId
        L0_2(L1_2, L2_2)
      end
    else
      L0_2 = TriggerServerEvent
      L1_2 = "wais:farmer:mission:cancel:self"
      L0_2(L1_2)
    end
  end
  L0_2 = nil
  L1_2 = nil
  G_Farmer_Harvester = nil
  G_Farmer_Trailer_NetId = L1_2
  G_Farmer_Trailer = L0_2
end
L3_1(L4_1, L5_1)
L3_1 = RegisterNetEvent
L4_1 = "wais:farmer:client:CreateMission"
function L5_1(A0_2, A1_2)
  local L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2
  L2_2 = false
  if "group" == A1_2.type and Group.active then
    L2_2 = Group.groupId == A1_2.id
  end
  L3_2 = false
  if "player" == A1_2.type then
    L4_2 = GetPlayerServerId
    L5_2 = PlayerId
    L5_2, L6_2, L7_2, L8_2, L9_2 = L5_2()
    L3_2 = L4_2(L5_2, L6_2, L7_2, L8_2, L9_2) == tonumber(A1_2.id)
  elseif "group" == A1_2.type and Group.active then
    L3_2 = Group.groupId == A1_2.id
  end
  if L3_2 then
    L4_2 = Fields
    L5_2 = L4_2
    L4_2 = L4_2.CreateMission
    L6_2 = A0_2
    L7_2 = L2_2
    L8_2 = A1_2
    L4_2 = L4_2(L5_2, L6_2, L7_2, L8_2)
    L2_1 = L4_2
    L4_2 = Config
    L4_2 = L4_2.Notification
    L5_2 = Lang
    L6_2 = "job"
    L5_2 = L5_2(L6_2)
    L6_2 = Lang
    L7_2 = "farmer_mission_start"
    L6_2 = L6_2(L7_2)
    L7_2 = "inform"
    L8_2 = 12500.0
    L4_2(L5_2, L6_2, L7_2, L8_2)
    L4_2 = SetNewWaypoint
    L5_2 = L0_1.field_list
    L5_2 = L5_2[A0_2]
    L5_2 = L5_2.area
    L5_2 = L5_2.x
    L6_2 = L0_1.field_list
    L6_2 = L6_2[A0_2]
    L6_2 = L6_2.area
    L6_2 = L6_2.y
    L4_2(L5_2, L6_2)
  else
    L4_2 = A1_2.id
    L3_2 = L1_1
    L5_2 = Fields
    L6_2 = L5_2
    L5_2 = L5_2.CreateMission
    L7_2 = A0_2
    L8_2 = L2_2
    L5_2 = L5_2(L6_2, L7_2, L8_2, A1_2)
    L3_2[L4_2] = L5_2
  end
end
L3_1(L4_1, L5_1)
L3_1 = RegisterNetEvent
L4_1 = "wais:farmer:group:client:addTarget"
function L5_1(A0_2, A1_2, A2_2)
  local L3_2, L4_2, L5_2, L6_2
  if "trailer" == A0_2 then
    while true do
      L3_2 = L2_1
      if nil == L3_2 then
        break
      end
      L3_2 = DoesEntityExist
      L4_2 = NetToEnt
      L5_2 = A1_2
      L4_2, L5_2, L6_2 = L4_2(L5_2)
      L3_2 = L3_2(L4_2, L5_2, L6_2)
      if not L3_2 then
        L3_2 = Wait
        L4_2 = 100
        L3_2(L4_2)
      else
        break
      end
    end
    L3_2 = G_Farmer_Trailer
    if not L3_2 then
      L3_2 = NetToEnt
      L4_2 = A1_2
      L3_2 = L3_2(L4_2)
    end
    G_Farmer_Trailer = L3_2
    G_Farmer_Trailer_NetId = A1_2
    L3_2 = Config
    L3_2 = L3_2.VehicleCreated
    L4_2 = G_Farmer_Trailer
    L5_2 = GetVehicleNumberPlateText
    L6_2 = G_Farmer_Trailer
    L5_2, L6_2 = L5_2(L6_2)
    L3_2(L4_2, L5_2, L6_2)
  end
end
L3_1(L4_1, L5_1)
L3_1 = RegisterNetEvent
L4_1 = "wais:farmer:client:mission:deleteWheat"
function L5_1(A0_2, A1_2, A2_2)
  local L3_2, L4_2, L5_2
  L3_2 = L2_1
  if nil ~= L3_2 then
    L3_2 = L2_1.id
    if L3_2 ~= A1_2 then
      L3_2 = tonumber
      L4_2 = L2_1.missionOwner
      L4_2 = L4_2.id
      L3_2 = L3_2(L4_2)
      L4_2 = tonumber
      L5_2 = A2_2
      L4_2 = L4_2(L5_2)
      if L3_2 ~= L4_2 then
        goto lbl_21
      end
    end
    L3_2 = L2_1
    L4_2 = L3_2
    L3_2 = L3_2.DeleteWheat
    L5_2 = A0_2
    L3_2(L4_2, L5_2)
  ::lbl_21::
  else
    L3_2 = L1_1
    L3_2 = L3_2[A2_2]
    if nil ~= L3_2 then
      L3_2 = L1_1
      L3_2 = L3_2[A2_2]
      L4_2 = L3_2
      L3_2 = L3_2.DeleteWheat
      L5_2 = A0_2
      L3_2(L4_2, L5_2)
    end
  end
end
L3_1(L4_1, L5_1)
L3_1 = RegisterNetEvent
L4_1 = "wais:farmer:client:mission:makeBale"
function L5_1(A0_2, A1_2, A2_2)
  local L3_2, L4_2, L5_2
  L3_2 = L2_1
  if nil ~= L3_2 then
    L3_2 = L2_1.id
    if L3_2 ~= A1_2 then
      L3_2 = tonumber
      L4_2 = L2_1.missionOwner
      L4_2 = L4_2.id
      L3_2 = L3_2(L4_2)
      L4_2 = tonumber
      L5_2 = A2_2
      L4_2 = L4_2(L5_2)
      if L3_2 ~= L4_2 then
        goto lbl_21
      end
    end
    L3_2 = L2_1
    L4_2 = L3_2
    L3_2 = L3_2.MakeWheatToBale
    L5_2 = A0_2
    L3_2(L4_2, L5_2)
  ::lbl_21::
  else
    L3_2 = L1_1
    L3_2 = L3_2[A2_2]
    if nil ~= L3_2 then
      L3_2 = L1_1
      L3_2 = L3_2[A2_2]
      L4_2 = L3_2
      L3_2 = L3_2.MakeWheatToBale
      L5_2 = A0_2
      L3_2(L4_2, L5_2)
    end
  end
end
L3_1(L4_1, L5_1)
L3_1 = RegisterNetEvent
L4_1 = "wais:farmer:client:mission:sync:takeProp"
function L5_1(A0_2, A1_2, A2_2, A3_2)
  local L4_2, L5_2, L6_2, L7_2
  L4_2 = L2_1
  if nil ~= L4_2 then
    L4_2 = L2_1.id
    if L4_2 ~= A1_2 then
      L4_2 = tonumber
      L5_2 = L2_1.missionOwner
      L5_2 = L5_2.id
      L4_2 = L4_2(L5_2)
      L5_2 = tonumber
      L6_2 = A2_2
      L5_2 = L5_2(L6_2)
      if L4_2 ~= L5_2 then
        goto lbl_22
      end
    end
    L4_2 = L2_1
    L5_2 = L4_2
    L4_2 = L4_2.TakeProp
    L6_2 = A0_2
    L7_2 = A3_2
    L4_2(L5_2, L6_2, L7_2)
  ::lbl_22::
  else
    L4_2 = L1_1
    L4_2 = L4_2[A2_2]
    if nil ~= L4_2 then
      L4_2 = L1_1
      L4_2 = L4_2[A2_2]
      L5_2 = L4_2
      L4_2 = L4_2.TakeProp
      L6_2 = A0_2
      L7_2 = A3_2
      L4_2(L5_2, L6_2, L7_2)
    end
  end
end
L3_1(L4_1, L5_1)
L3_1 = RegisterNetEvent
L4_1 = "wais:farmer:client:mission:addBaleToTrailer"
function L5_1(A0_2, A1_2, A2_2, A3_2, A4_2)
  local L5_2, L6_2, L7_2, L8_2, L9_2
  L5_2 = L2_1
  if nil ~= L5_2 then
    L5_2 = L2_1.id
    if L5_2 ~= A1_2 then
      L5_2 = tonumber
      L6_2 = L2_1.missionOwner
      L6_2 = L6_2.id
      L5_2 = L5_2(L6_2)
      L6_2 = tonumber
      L7_2 = A2_2
      L6_2 = L6_2(L7_2)
      if L5_2 ~= L6_2 then
        goto lbl_23
      end
    end
    L5_2 = L2_1
    L6_2 = L5_2
    L5_2 = L5_2.AddBaleToTrailer
    L7_2 = A0_2
    L8_2 = A3_2
    L9_2 = A4_2
    L5_2(L6_2, L7_2, L8_2, L9_2)
  ::lbl_23::
  else
    L5_2 = L1_1
    L5_2 = L5_2[A2_2]
    if nil ~= L5_2 then
      L5_2 = L1_1
      L5_2 = L5_2[A2_2]
      L6_2 = L5_2
      L5_2 = L5_2.AddBaleToTrailer
      L7_2 = A0_2
      L8_2 = A3_2
      L9_2 = A4_2
      L5_2(L6_2, L7_2, L8_2, L9_2)
    end
  end
end
L3_1(L4_1, L5_1)
L3_1 = RegisterNetEvent
L4_1 = "wais:farmer:client:deliveryBales"
function L5_1(A0_2)
  local L1_2, L2_2, L3_2, L4_2, L5_2
  L1_2 = Config
  L1_2 = L1_2.Notification
  L2_2 = Lang
  L3_2 = "job"
  L2_2 = L2_2(L3_2)
  L3_2 = Lang
  L4_2 = "farmer_deliver_bales"
  L3_2 = L3_2(L4_2)
  L4_2 = "success"
  L5_2 = 5000
  L1_2(L2_2, L3_2, L4_2, L5_2)
  L1_2 = SetNewWaypoint
  L2_2 = L0_1.menu
  L2_2 = L2_2.job_menu
  L2_2 = L2_2.x
  L3_2 = L0_1.menu
  L3_2 = L3_2.job_menu
  L3_2 = L3_2.y
  L1_2(L2_2, L3_2)
end
L3_1(L4_1, L5_1)
L3_1 = RegisterNetEvent
L4_1 = "wais:farmer:mission:deleteMission"
function L5_1(A0_2, A1_2)
  local L2_2, L3_2, L4_2
  L2_2 = L2_1
  if nil ~= L2_2 then
    L2_2 = L2_1.index
    if L2_2 == A1_2 then
      L2_2 = tonumber
      L3_2 = L2_1.missionOwner
      L3_2 = L3_2.id
      L2_2 = L2_2(L3_2)
      L3_2 = tonumber
      L4_2 = A0_2
      L3_2 = L3_2(L4_2)
      if L2_2 == L3_2 then
        L2_2 = L2_1
        L3_2 = L2_2
        L2_2 = L2_2.DeleteMission
        L2_2(L3_2)
        L2_2 = nil
        L2_1 = L2_2
        L2_2 = nil
        L3_2 = nil
        G_Farmer_Harvester = nil
        G_Farmer_Trailer_NetId = L3_2
        G_Farmer_Trailer = L2_2
    end
  end
  else
    L2_2 = L1_1
    L2_2 = L2_2[A0_2]
    if nil ~= L2_2 then
      L2_2 = L1_1
      L2_2 = L2_2[A0_2]
      L2_2 = L2_2.index
      if L2_2 == A1_2 then
        L2_2 = L1_1
        L2_2 = L2_2[A0_2]
        L3_2 = L2_2
        L2_2 = L2_2.DeleteMission
        L2_2(L3_2)
        L2_2 = L1_1
        L2_2[A0_2] = nil
      end
    end
  end
end
L3_1(L4_1, L5_1)
function L3_1()
  local L0_2, L1_2, L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2
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
          L5_3 = "farmer"
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
    L2_2 = "[^2INFO^7] Farmer Job Center has been initialized."
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
      L3_2 = "[^2INFO^7] Farmer Job Center Blip has been initialized."
      L2_2(L3_2)
    end
  end
  L1_2 = points
  L2_2 = points
  L2_2 = #L2_2
  L2_2 = L2_2 + 1
  L1_2[L2_2] = L0_2
  L1_2 = {}
  L2_2 = pairs
  L3_2 = L0_1.field_list
  L2_2, L3_2, L4_2, L5_2 = L2_2(L3_2)
  for L6_2, L7_2 in L2_2, L3_2, L4_2, L5_2 do
    L8_2 = #L1_2
    L8_2 = L8_2 + 1
    L9_2 = {}
    L10_2 = L7_2.title
    L9_2.title = L10_2
    L10_2 = Lang
    L11_2 = "farmer_item_desc"
    L12_2 = formatNumberToMinSec
    L13_2 = L7_2.timer
    L13_2 = L13_2.mission_time
    L12_2 = L12_2(L13_2)
    L13_2 = L7_2.reward
    L10_2 = L10_2(L11_2, L12_2, L13_2)
    L9_2.description = L10_2
    L9_2.icon = "wheat-awn"
    function L10_2()
      local L0_3, L1_3, L2_3, L3_3, L4_3
      L0_3 = L2_1
      if L0_3 then
        L0_3 = Config
        L0_3 = L0_3.Notification
        L1_3 = Lang
        L2_3 = "job"
        L1_3 = L1_3(L2_3)
        L2_3 = Lang
        L3_3 = "farmer_already_have_mission"
        L2_3 = L2_3(L3_3)
        L3_3 = "error"
        L4_3 = 5000
        return L0_3(L1_3, L2_3, L3_3, L4_3)
      end
      L0_3 = Group
      L0_3 = L0_3.active
      if L0_3 then
        L0_3 = Group
        L0_3 = L0_3.ownerId
        L1_3 = GetPlayerServerId
        L2_3 = PlayerId
        L2_3, L3_3, L4_3 = L2_3()
        L1_3 = L1_3(L2_3, L3_3, L4_3)
        if L0_3 ~= L1_3 then
          L0_3 = Config
          L0_3 = L0_3.Notification
          L1_3 = Lang
          L2_3 = "job"
          L1_3 = L1_3(L2_3)
          L2_3 = Lang
          L3_3 = "farmer_group_not_owner"
          L2_3 = L2_3(L3_3)
          L3_3 = "error"
          L4_3 = 5000
          return L0_3(L1_3, L2_3, L3_3, L4_3)
        end
      end
      L0_3 = lib
      L0_3 = L0_3.callback
      L1_3 = "wais:farmer:checkFieldIsFree"
      L2_3 = false
      function L3_3(A0_4)
        local L1_4, L2_4, L3_4, L4_4, L5_4
        if not A0_4 then
          L1_4 = Config
          L1_4 = L1_4.Notification
          L2_4 = Lang
          L3_4 = "job"
          L2_4 = L2_4(L3_4)
          L3_4 = Lang
          L4_4 = "farmer_mission_not_available"
          L3_4 = L3_4(L4_4)
          L4_4 = "error"
          L5_4 = 5000
          return L1_4(L2_4, L3_4, L4_4, L5_4)
        end
        L1_4 = vehicle
        if nil ~= L1_4 then
          L1_4 = lib
          L1_4 = L1_4.callback
          L2_4 = "wais:deleteJob:car"
          L3_4 = false
          function L4_4()
            local L0_5, L1_5
            vehicle = nil
          end
          L1_4(L2_4, L3_4, L4_4)
          while true do
            L1_4 = vehicle
            if not L1_4 then
              break
            end
            L1_4 = Wait
            L2_4 = 100
            L1_4(L2_4)
          end
        end
        L1_4 = spawnJobCar
        L2_4 = "farmer"
        L1_4 = L1_4(L2_4)
        if not L1_4 then
          L1_4 = TriggerServerEvent
          L2_4 = "wais:farmer:clearBusy"
          L3_4 = L6_2
          return L1_4(L2_4, L3_4)
        end
        L1_4 = TriggerServerEvent
        L2_4 = "wais:farmer:server:CreateMission"
        L3_4 = L6_2
        L1_4(L2_4, L3_4)
        while true do
          L1_4 = DoesEntityExist
          L2_4 = vehicle
          L1_4 = L1_4(L2_4)
          if L1_4 then
            break
          end
          L1_4 = Wait
          L2_4 = 100
          L1_4(L2_4)
        end
        L1_4 = createTrailer
        L2_4 = L6_2
        L1_4(L2_4)
      end
      L4_3 = L6_2
      L0_3(L1_3, L2_3, L3_3, L4_3)
    end
    L9_2.onSelect = L10_2
    L1_2[L8_2] = L9_2
  end
  L2_2 = lib
  L2_2 = L2_2.registerContext
  L3_2 = {}
  L4_2 = menus
  L4_2 = L4_2.farmer_missions
  L5_2 = L4_2
  L4_2 = L4_2.format
  L6_2 = "farmer"
  L4_2 = L4_2(L5_2, L6_2)
  L3_2.id = L4_2
  L4_2 = Lang
  L5_2 = "farmer_menu_title"
  L4_2 = L4_2(L5_2)
  L3_2.title = L4_2
  L3_2.options = L1_2
  L4_2 = menus
  L4_2 = L4_2.job_menu
  L5_2 = L4_2
  L4_2 = L4_2.format
  L6_2 = "farmer"
  L4_2 = L4_2(L5_2, L6_2)
  L3_2.menu = L4_2
  L2_2(L3_2)
end
initFarmer = L3_1
function L3_1(A0_2)
  local L1_2, L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2
  L1_2 = joaat
  L2_2 = L0_1.field_list
  L2_2 = L2_2[A0_2]
  L2_2 = L2_2.trailers
  L2_2 = L2_2.trailer
  L1_2 = L1_2(L2_2)
  L2_2 = joaat
  L3_2 = L0_1.field_list
  L3_2 = L3_2[A0_2]
  L3_2 = L3_2.trailers
  L3_2 = L3_2.harvester
  L2_2 = L2_2(L3_2)
  L3_2 = loadModel
  L4_2 = L1_2
  L3_2 = L3_2(L4_2)
  if not L3_2 then
    return
  end
  L3_2 = loadModel
  L4_2 = L2_2
  L3_2 = L3_2(L4_2)
  if not L3_2 then
    return
  end
  L3_2 = CreateVehicle
  L4_2 = L1_2
  L5_2 = L0_1.field_list
  L5_2 = L5_2[A0_2]
  L5_2 = L5_2.trailers
  L5_2 = L5_2.trailer_coords
  L5_2 = L5_2.x
  L6_2 = L0_1.field_list
  L6_2 = L6_2[A0_2]
  L6_2 = L6_2.trailers
  L6_2 = L6_2.trailer_coords
  L6_2 = L6_2.y
  L7_2 = L0_1.field_list
  L7_2 = L7_2[A0_2]
  L7_2 = L7_2.trailers
  L7_2 = L7_2.trailer_coords
  L7_2 = L7_2.z
  L8_2 = L0_1.field_list
  L8_2 = L8_2[A0_2]
  L8_2 = L8_2.trailers
  L8_2 = L8_2.trailer_coords
  L8_2 = L8_2.w
  L9_2 = true
  L10_2 = false
  L3_2 = L3_2(L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2)
  G_Farmer_Trailer = L3_2
  while true do
    L3_2 = DoesEntityExist
    L4_2 = G_Farmer_Trailer
    L3_2 = L3_2(L4_2)
    if L3_2 then
      break
    end
    L3_2 = Wait
    L4_2 = 100
    L3_2(L4_2)
  end
  L3_2 = AttachVehicleToTrailer
  L4_2 = vehicle
  L5_2 = G_Farmer_Trailer
  L6_2 = 20.0
  L3_2(L4_2, L5_2, L6_2)
  L3_2 = SetVehicleOnGroundProperly
  L4_2 = G_Farmer_Trailer
  L3_2(L4_2)
  L3_2 = RemoveDecalsFromVehicle
  L4_2 = G_Farmer_Trailer
  L3_2(L4_2)
  L3_2 = TriggerServerEvent
  L4_2 = "wais:addProp"
  L5_2 = G_Farmer_Trailer
  L6_2 = NetworkGetNetworkIdFromEntity
  L7_2 = G_Farmer_Trailer
  L6_2, L7_2, L8_2, L9_2, L10_2 = L6_2(L7_2)
  L3_2(L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2)
  L3_2 = props
  L4_2 = props
  L4_2 = #L4_2
  L4_2 = L4_2 + 1
  L5_2 = G_Farmer_Trailer
  L3_2[L4_2] = L5_2
  L3_2 = Group
  L3_2 = L3_2.active
  if L3_2 then
    L3_2 = TriggerServerEvent
    L4_2 = "wais:farmer:group:addTrailer"
    L5_2 = Group
    L5_2 = L5_2.groupId
    L6_2 = NetworkGetNetworkIdFromEntity
    L7_2 = G_Farmer_Trailer
    L6_2 = L6_2(L7_2)
    L7_2 = A0_2
    L3_2(L4_2, L5_2, L6_2, L7_2)
  end
  L3_2 = SetTimeout
  L4_2 = 2000
  function L5_2()
    local L0_3, L1_3
    L0_3 = CreateThread
    function L1_3()
      local L0_4, L1_4, L2_4, L3_4, L4_4, L5_4, L6_4, L7_4, L8_4, L9_4, L10_4, L11_4
      while true do
        L0_4 = L2_1
        if nil == L0_4 then
          break
        end
        L0_4 = 1000
        L1_4 = PlayerPedId
        L1_4 = L1_4()
        L2_4 = GetEntityCoords
        L3_4 = L1_4
        L2_4 = L2_4(L3_4)
        L3_4 = L0_1.field_list
        L4_4 = A0_2
        L3_4 = L3_4[L4_4]
        L3_4 = L3_4.area
        L3_4 = L2_4 - L3_4
        L3_4 = #L3_4
        L4_4 = 424
        if L3_4 <= L4_4 then
          L4_4 = G_Farmer_Harvester
          if nil == L4_4 then
            while true do
              L4_4 = lib
              L4_4 = L4_4.getClosestVehicle
              L5_4 = vector3
              L6_4 = L0_1.field_list
              L7_4 = A0_2
              L6_4 = L6_4[L7_4]
              L6_4 = L6_4.trailers
              L6_4 = L6_4.harvester_coords
              L6_4 = L6_4.x
              L7_4 = L0_1.field_list
              L8_4 = A0_2
              L7_4 = L7_4[L8_4]
              L7_4 = L7_4.trailers
              L7_4 = L7_4.harvester_coords
              L7_4 = L7_4.y
              L8_4 = L0_1.field_list
              L9_4 = A0_2
              L8_4 = L8_4[L9_4]
              L8_4 = L8_4.trailers
              L8_4 = L8_4.harvester_coords
              L8_4 = L8_4.z
              L5_4 = L5_4(L6_4, L7_4, L8_4)
              L6_4 = 5.0
              L7_4 = true
              L4_4 = L4_4(L5_4, L6_4, L7_4)
              if not L4_4 then
                break
              end
              L4_4 = Wait
              L5_4 = 1000
              L4_4(L5_4)
            end
            L4_4 = CreateVehicle
            L5_4 = L2_2
            L6_4 = L0_1.field_list
            L7_4 = A0_2
            L6_4 = L6_4[L7_4]
            L6_4 = L6_4.trailers
            L6_4 = L6_4.harvester_coords
            L6_4 = L6_4.x
            L7_4 = L0_1.field_list
            L8_4 = A0_2
            L7_4 = L7_4[L8_4]
            L7_4 = L7_4.trailers
            L7_4 = L7_4.harvester_coords
            L7_4 = L7_4.y
            L8_4 = L0_1.field_list
            L9_4 = A0_2
            L8_4 = L8_4[L9_4]
            L8_4 = L8_4.trailers
            L8_4 = L8_4.harvester_coords
            L8_4 = L8_4.z
            L9_4 = L0_1.field_list
            L10_4 = A0_2
            L9_4 = L9_4[L10_4]
            L9_4 = L9_4.trailers
            L9_4 = L9_4.harvester_coords
            L9_4 = L9_4.w
            L10_4 = true
            L11_4 = false
            L4_4 = L4_4(L5_4, L6_4, L7_4, L8_4, L9_4, L10_4, L11_4)
            G_Farmer_Harvester = L4_4
            while true do
              L4_4 = DoesEntityExist
              L5_4 = G_Farmer_Harvester
              L4_4 = L4_4(L5_4)
              if L4_4 then
                break
              end
              L4_4 = Wait
              L5_4 = 100
              L4_4(L5_4)
            end
            L4_4 = SetVehicleOnGroundProperly
            L5_4 = G_Farmer_Harvester
            L4_4(L5_4)
            L4_4 = SetVehicleEngineOn
            L5_4 = G_Farmer_Harvester
            L6_4 = true
            L7_4 = true
            L8_4 = false
            L4_4(L5_4, L6_4, L7_4, L8_4)
            L4_4 = SetEntityRotation
            L5_4 = G_Farmer_Harvester
            L6_4 = 0.0
            L7_4 = 0.0
            L8_4 = L0_1.field_list
            L9_4 = A0_2
            L8_4 = L8_4[L9_4]
            L8_4 = L8_4.trailers
            L8_4 = L8_4.harvester_coords
            L8_4 = L8_4.w
            L9_4 = 2
            L10_4 = true
            L4_4(L5_4, L6_4, L7_4, L8_4, L9_4, L10_4)
            L4_4 = Config
            L4_4 = L4_4.VehicleCreated
            L5_4 = G_Farmer_Harvester
            L6_4 = GetVehicleNumberPlateText
            L7_4 = G_Farmer_Harvester
            L6_4, L7_4, L8_4, L9_4, L10_4, L11_4 = L6_4(L7_4)
            L4_4(L5_4, L6_4, L7_4, L8_4, L9_4, L10_4, L11_4)
            L4_4 = TriggerServerEvent
            L5_4 = "wais:addProp"
            L6_4 = G_Farmer_Harvester
            L7_4 = NetworkGetNetworkIdFromEntity
            L8_4 = G_Farmer_Harvester
            L7_4, L8_4, L9_4, L10_4, L11_4 = L7_4(L8_4)
            L4_4(L5_4, L6_4, L7_4, L8_4, L9_4, L10_4, L11_4)
            L4_4 = props
            L5_4 = props
            L5_4 = #L5_4
            L5_4 = L5_4 + 1
            L6_4 = G_Farmer_Harvester
            L4_4[L5_4] = L6_4
            break
          end
        end
        L4_4 = Wait
        L5_4 = L0_4
        L4_4(L5_4)
      end
    end
    L0_3(L1_3)
  end
  L3_2(L4_2, L5_2)
end
createTrailer = L3_1
function L3_1()
  local L0_2, L1_2, L2_2, L3_2, L4_2, L5_2, L6_2, L7_2
  L0_2 = L2_1
  if nil ~= L0_2 then
    L0_2 = L2_1
    L1_2 = L0_2
    L0_2 = L0_2.CheckIsDone
    L0_2 = L0_2(L1_2)
    L1_2 = Group
    L1_2 = L1_2.active
    if L1_2 then
      L1_2 = Group
      L1_2 = L1_2.ownerId
      L2_2 = GetPlayerServerId
      L3_2 = PlayerId
      L3_2, L4_2, L5_2, L6_2, L7_2 = L3_2()
      L2_2 = L2_2(L3_2, L4_2, L5_2, L6_2, L7_2)
      if L1_2 == L2_2 then
        if L0_2 then
          L1_2 = calcuteDeductedMoney
          L2_2 = L2_1.timer
          L2_2 = L2_2.extraTimeEnabled
          L3_2 = L2_1.config
          L3_2 = L3_2.timer
          L3_2 = L3_2.mission_time
          L4_2 = L2_1.timer
          L5_2 = L4_2
          L4_2 = L4_2.getDuration
          L4_2 = L4_2(L5_2)
          L5_2 = L2_1.config
          L5_2 = L5_2.timer
          L5_2 = L5_2.deducted_per_min
          L1_2 = L1_2(L2_2, L3_2, L4_2, L5_2)
          L2_2 = TriggerServerEvent
          L3_2 = "wais:farmer:mission:finish"
          L4_2 = Group
          L4_2 = L4_2.groupId
          L5_2 = L2_1.id
          L6_2 = L2_1.index
          L7_2 = L1_2
          L2_2(L3_2, L4_2, L5_2, L6_2, L7_2)
        else
          L1_2 = TriggerServerEvent
          L2_2 = "wais:farmer:mission:cancel:group"
          L3_2 = Group
          L3_2 = L3_2.groupId
          L1_2(L2_2, L3_2)
        end
      else
        L1_2 = Config
        L1_2 = L1_2.Notification
        L2_2 = Lang
        L3_2 = "job"
        L2_2 = L2_2(L3_2)
        L3_2 = Lang
        L4_2 = "you_cant_cancel_group"
        L3_2 = L3_2(L4_2)
        L4_2 = "inform"
        L5_2 = nil
        return L1_2(L2_2, L3_2, L4_2, L5_2)
      end
    elseif L0_2 then
      L1_2 = calcuteDeductedMoney
      L2_2 = L2_1.timer
      L2_2 = L2_2.extraTimeEnabled
      L3_2 = L2_1.config
      L3_2 = L3_2.timer
      L3_2 = L3_2.mission_time
      L4_2 = L2_1.timer
      L5_2 = L4_2
      L4_2 = L4_2.getDuration
      L4_2 = L4_2(L5_2)
      L5_2 = L2_1.config
      L5_2 = L5_2.timer
      L5_2 = L5_2.deducted_per_min
      L1_2 = L1_2(L2_2, L3_2, L4_2, L5_2)
      L2_2 = TriggerServerEvent
      L3_2 = "wais:farmer:mission:finish"
      L4_2 = GetPlayerServerId
      L5_2 = PlayerId
      L5_2, L6_2, L7_2 = L5_2()
      L4_2 = L4_2(L5_2, L6_2, L7_2)
      L5_2 = L2_1.id
      L6_2 = L2_1.index
      L7_2 = L1_2
      L2_2(L3_2, L4_2, L5_2, L6_2, L7_2)
    else
      L1_2 = TriggerServerEvent
      L2_2 = "wais:farmer:mission:cancel:self"
      L1_2(L2_2)
    end
  end
end
checkFarmerIsFinished = L3_1
L3_1 = CreateThread
function L4_1()
  local L0_2, L1_2, L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2, L20_2, L21_2, L22_2, L23_2, L24_2, L25_2, L26_2, L27_2, L28_2
  while true do
    L0_2 = PlayerPedId
    L0_2 = L0_2()
    L1_2 = GetEntityCoords
    L2_2 = L0_2
    L1_2 = L1_2(L2_2)
    L2_2 = 1000
    L3_2 = CurrentJob
    if "farmer" == L3_2 then
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
L3_1(L4_1)
