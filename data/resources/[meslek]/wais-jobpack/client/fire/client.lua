local L0_1, L1_1, L2_1, L3_1
L0_1 = Config
L0_1 = L0_1.Jobs
L0_1 = L0_1.fire_department
L1_1 = {}
L2_1 = nil
FireIndex = nil
FireEvent = L2_1
FireEvents = L1_1
L1_1 = RegisterNetEvent
L2_1 = "wais:setDefault:JobThings"
function L3_1()
  local L0_2, L1_2, L2_2, L3_2
  L0_2 = FireEvent
  if nil ~= L0_2 then
    L0_2 = Group
    L0_2 = L0_2.active
    if not L0_2 then
      L0_2 = TriggerServerEvent
      L1_2 = "wais:fire:deleteSelf"
      L2_2 = FireEvent
      L2_2 = L2_2.fireIndex
      L3_2 = FireEvent
      L3_2 = L3_2.starterTable
      L3_2 = L3_2.id
      L0_2(L1_2, L2_2, L3_2)
      L0_2 = TriggerServerEvent
      L1_2 = "wais:deleteItem"
      L2_2 = "weapon_fireextinguisher"
      L3_2 = L0_1.giveable_items
      L3_2 = L3_2.weapon_fireextinguisher
      L0_2(L1_2, L2_2, L3_2)
    end
  end
end
L1_1(L2_1, L3_1)
L1_1 = RegisterNetEvent
L2_1 = "wais:firedepartment:startFire"
function L3_1(A0_2, A1_2)
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
    L4_2 = Fire
    L5_2 = L4_2
    L4_2 = L4_2.newFire
    L6_2 = A0_2
    L7_2 = L2_2
    L8_2 = A1_2
    L4_2 = L4_2(L5_2, L6_2, L7_2, L8_2)
    FireEvent = L4_2
  else
    L4_2 = FireEvents
    L5_2 = A1_2.id
    L6_2 = Fire
    L7_2 = L6_2
    L6_2 = L6_2.newFire
    L8_2 = A0_2
    L9_2 = L2_2
    L6_2 = L6_2(L7_2, L8_2, L9_2, A1_2)
    L4_2[L5_2] = L6_2
  end
end
L1_1(L2_1, L3_1)
L1_1 = RegisterNetEvent
L2_1 = "wais:firedepartment:extinguish"
function L3_1(A0_2, A1_2, A2_2)
  local L3_2, L4_2, L5_2, L6_2, L7_2
  L3_2 = FireEvent
  if nil ~= L3_2 then
    L3_2 = FireEvent
    L3_2 = L3_2.starterTable
    L3_2 = L3_2.id
    if L3_2 == A2_2 then
      L3_2 = FireEvent
      L4_2 = L3_2
      L3_2 = L3_2.changeFlameState
      L5_2 = A0_2
      L6_2 = A1_2
      L7_2 = true
      return L3_2(L4_2, L5_2, L6_2, L7_2)
    end
  end
  L3_2 = FireEvents
  L3_2 = L3_2[A2_2]
  if nil == L3_2 then
    return
  end
  L3_2 = FireEvents
  L3_2 = L3_2[A2_2]
  L4_2 = L3_2
  L3_2 = L3_2.changeFlameState
  L5_2 = A0_2
  L6_2 = A1_2
  L7_2 = true
  L3_2(L4_2, L5_2, L6_2, L7_2)
end
L1_1(L2_1, L3_1)
L1_1 = RegisterNetEvent
L2_1 = "wais:firedepartment:deleteSelf"
function L3_1(A0_2, A1_2)
  local L2_2, L3_2, L4_2, L5_2
  L2_2 = FireEvent
  if nil ~= L2_2 then
    L2_2 = FireEvent
    L2_2 = L2_2.starterTable
    L2_2 = L2_2.id
    if L2_2 == A1_2 then
      L2_2 = FireEvent
      L3_2 = L2_2
      L2_2 = L2_2.removeAll
      L4_2 = A0_2
      L5_2 = A1_2
      L2_2(L3_2, L4_2, L5_2)
      FireEvent = nil
      FireIndex = nil
    end
  end
  L2_2 = FireEvents
  L2_2 = L2_2[A1_2]
  if nil == L2_2 then
    return
  end
  L2_2 = FireEvents
  L2_2 = L2_2[A1_2]
  L3_2 = L2_2
  L2_2 = L2_2.removeAll
  L4_2 = A0_2
  L5_2 = A1_2
  L2_2(L3_2, L4_2, L5_2)
  L2_2 = FireEvents
  L2_2[A1_2] = nil
end
L1_1(L2_1, L3_1)
function L1_1()
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
          L5_3 = "fire_department"
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
    L2_2 = "[^2INFO^7] Fire department Job Center has been initialized."
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
      L3_2 = "[^2INFO^7] Fire department Job Center Blip has been initialized."
      L2_2(L3_2)
    end
  end
  L1_2 = points
  L2_2 = points
  L2_2 = #L2_2
  L2_2 = L2_2 + 1
  L1_2[L2_2] = L0_2
end
initFireDepartment = L1_1
function L1_1()
  local L0_2, L1_2, L2_2, L3_2, L4_2, L5_2, L6_2
  L0_2 = math
  L0_2 = L0_2.randomseed
  L1_2 = GetGameTimer
  L1_2, L2_2, L3_2, L4_2, L5_2, L6_2 = L1_2()
  L0_2(L1_2, L2_2, L3_2, L4_2, L5_2, L6_2)
  L0_2 = math
  L0_2 = L0_2.random
  L1_2 = 1
  L2_2 = L0_1.random_fires
  L2_2 = L2_2.fires
  L2_2 = #L2_2
  L0_2 = L0_2(L1_2, L2_2)
  FireIndex = L0_2
  L0_2 = lib
  L0_2 = L0_2.callback
  L1_2 = "wais:firedepartment:checkBusy"
  L2_2 = false
  function L3_2(A0_3)
    local L1_3, L2_3, L3_3, L4_3, L5_3
    if A0_3 then
      FireIndex = nil
      L1_3 = Config
      L1_3 = L1_3.Notification
      L2_3 = Lang
      L3_3 = "job"
      L2_3 = L2_3(L3_3)
      L3_3 = Lang
      L4_3 = "answered_someone"
      L3_3 = L3_3(L4_3)
      L4_3 = "error"
      L5_3 = nil
      return L1_3(L2_3, L3_3, L4_3, L5_3)
    end
  end
  L4_2 = FireIndex
  L0_2(L1_2, L2_2, L3_2, L4_2)
  L0_2 = 5
  L1_2 = nil
  L2_2 = lib
  L2_2 = L2_2.hideTextUI
  L2_2()
  L2_2 = lib
  L2_2 = L2_2.showTextUI
  L3_2 = Lang
  L4_2 = "fire_call"
  L3_2 = L3_2(L4_2)
  L4_2 = Lang
  L5_2 = "fire_accept"
  L4_2 = L4_2(L5_2)
  L5_2 = Lang
  L6_2 = "fire_reject"
  L5_2 = L5_2(L6_2)
  L3_2 = L3_2 .. L4_2 .. L5_2
  L4_2 = {}
  L4_2.position = "left-center"
  L5_2 = {}
  L5_2.color = "white"
  L4_2.style = L5_2
  L2_2(L3_2, L4_2)
  L2_2 = CreateThread
  function L3_2()
    local L0_3, L1_3, L2_3, L3_3, L4_3
    while true do
      L0_3 = FireEvent
      if nil ~= L0_3 then
        break
      end
      L0_3 = L1_2
      if nil ~= L0_3 then
        break
      end
      L0_3 = L0_2
      L0_3 = L0_3 - 1
      L0_2 = L0_3
      L0_3 = L0_2
      if L0_3 <= 0 then
        L0_3 = TriggerServerEvent
        L1_3 = "wais:setDefault:FireState"
        L2_3 = FireIndex
        L0_3(L1_3, L2_3)
        FireIndex = nil
        L0_3 = lib
        L0_3 = L0_3.hideTextUI
        L0_3()
        L0_3 = Config
        L0_3 = L0_3.Notification
        L1_3 = Lang
        L2_3 = "job"
        L1_3 = L1_3(L2_3)
        L2_3 = Lang
        L3_3 = "not_answered"
        L2_3 = L2_3(L3_3)
        L3_3 = "error"
        L4_3 = nil
        return L0_3(L1_3, L2_3, L3_3, L4_3)
      end
      L0_3 = Wait
      L1_3 = 1000
      L0_3(L1_3)
    end
  end
  L2_2(L3_2)
  L2_2 = CreateThread
  function L3_2()
    local L0_3, L1_3, L2_3, L3_3, L4_3
    while true do
      L0_3 = FireIndex
      if nil == L0_3 then
        break
      end
      L0_3 = L0_2
      if not (L0_3 > 1) then
        break
      end
      L0_3 = IsControlJustPressed
      L1_3 = 0
      L2_3 = 38
      L0_3 = L0_3(L1_3, L2_3)
      if L0_3 then
        L0_3 = true
        L1_2 = L0_3
        L0_3 = Group
        L0_3 = L0_3.active
        if L0_3 then
          L0_3 = TriggerServerEvent
          L1_3 = "wais:fire:startFire"
          L2_3 = FireIndex
          L0_3(L1_3, L2_3)
        else
          L0_3 = TriggerServerEvent
          L1_3 = "wais:fire:startFire"
          L2_3 = FireIndex
          L0_3(L1_3, L2_3)
        end
        L0_3 = lib
        L0_3 = L0_3.hideTextUI
        L0_3()
        L0_3 = Config
        L0_3 = L0_3.Notification
        L1_3 = Lang
        L2_3 = "job"
        L1_3 = L1_3(L2_3)
        L2_3 = Lang
        L3_3 = "call_accepted"
        L2_3 = L2_3(L3_3)
        L3_3 = "success"
        L4_3 = nil
        return L0_3(L1_3, L2_3, L3_3, L4_3)
      else
        L0_3 = IsControlJustPressed
        L1_3 = 0
        L2_3 = 44
        L0_3 = L0_3(L1_3, L2_3)
        if L0_3 then
          L0_3 = false
          L1_2 = L0_3
          L0_3 = TriggerServerEvent
          L1_3 = "wais:setDefault:FireState"
          L2_3 = FireIndex
          L0_3(L1_3, L2_3)
          FireIndex = nil
          L0_3 = lib
          L0_3 = L0_3.hideTextUI
          L0_3()
          L0_3 = Config
          L0_3 = L0_3.Notification
          L1_3 = Lang
          L2_3 = "job"
          L1_3 = L1_3(L2_3)
          L2_3 = Lang
          L3_3 = "call_rejected"
          L2_3 = L2_3(L3_3)
          L3_3 = "inform"
          L4_3 = nil
          return L0_3(L1_3, L2_3, L3_3, L4_3)
        end
      end
      L0_3 = Wait
      L1_3 = 0
      L0_3(L1_3)
    end
  end
  L2_2(L3_2)
end
L2_1 = CreateThread
function L3_1()
  local L0_2, L1_2, L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2, L20_2, L21_2, L22_2, L23_2, L24_2, L25_2, L26_2, L27_2, L28_2
  while true do
    L0_2 = PlayerPedId
    L0_2 = L0_2()
    L1_2 = GetEntityCoords
    L2_2 = L0_2
    L1_2 = L1_2(L2_2)
    L2_2 = 1000
    L3_2 = CurrentJob
    if "fire_department" == L3_2 then
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
L2_1(L3_1)
L2_1 = CreateThread
function L3_1()
  local L0_2, L1_2, L2_2, L3_2
  while true do
    L0_2 = math
    L0_2 = L0_2.randomseed
    L1_2 = GetGameTimer
    L1_2, L2_2, L3_2 = L1_2()
    L0_2(L1_2, L2_2, L3_2)
    L0_2 = L0_1.random_fires
    L0_2 = L0_2.fire_timer
    L0_2 = L0_2 * 30
    L0_2 = L0_2 * 1000
    L1_2 = Wait
    L2_2 = L0_2
    L1_2(L2_2)
    L1_2 = CurrentJob
    if "fire_department" == L1_2 then
      L1_2 = FireEvent
      if nil == L1_2 then
        L1_2 = FireIndex
        if nil == L1_2 then
          L1_2 = Group
          L1_2 = L1_2.active
          if L1_2 then
            L1_2 = Group
            L1_2 = L1_2.ownerId
            L2_2 = GetPlayerServerId
            L3_2 = PlayerId
            L3_2 = L3_2()
            L2_2 = L2_2(L3_2)
            if L1_2 == L2_2 then
              L1_2 = L1_1
              L1_2()
          end
          else
            L1_2 = Group
            L1_2 = L1_2.active
            if not L1_2 then
              L1_2 = L1_1
              L1_2()
            end
          end
        end
      end
    end
  end
end
L2_1(L3_1)
