local L0_1, L1_1, L2_1, L3_1
L0_1 = {}
Fields = L0_1
L0_1 = Fields
L1_1 = Fields
L0_1.__index = L1_1
L0_1 = Config
L0_1 = L0_1.Jobs
L0_1 = L0_1.farmer
L1_1 = nil
L2_1 = Fields
function L3_1(A0_2, A1_2, A2_2, A3_2)
  local L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2
  L4_2 = setmetatable
  L5_2 = {}
  L6_2 = Fields
  L4_2 = L4_2(L5_2, L6_2)
  L5_2 = lib
  L5_2 = L5_2.string
  L5_2 = L5_2.random
  L6_2 = "aaaaaa"
  L5_2 = L5_2(L6_2)
  L4_2.id = L5_2
  L4_2.index = A1_2
  L5_2 = L0_1.field_list
  L5_2 = L5_2[A1_2]
  L4_2.config = L5_2
  L5_2 = {}
  L4_2.progress = L5_2
  L5_2 = A2_2
  L4_2.missionOwner = A3_2
  L4_2.canControl = L5_2
  L5_2 = false
  L6_2 = false
  L4_2.trailerTargetAdded = false
  L4_2.propsCreated = L6_2
  L4_2.deleted = L5_2
  L5_2 = 0
  L6_2 = L4_2.config
  L6_2 = L6_2.coords
  L6_2 = #L6_2
  L4_2.cropped = 0
  L4_2.mustBeCollected = L6_2
  L4_2.collected = L5_2
  if A2_2 then
    L5_2 = JobTimer
    L6_2 = L5_2
    L5_2 = L5_2.New
    L7_2 = L4_2.config
    L7_2 = L7_2.timer
    L7_2 = L7_2.mission_time
    L8_2 = L4_2.config
    L8_2 = L8_2.timer
    L8_2 = L8_2.extra_time
    L9_2 = false
    L5_2 = L5_2(L6_2, L7_2, L8_2, L9_2)
    if L5_2 then
      goto lbl_49
    end
  end
  L5_2 = nil
  ::lbl_49::
  L4_2.timer = L5_2
  L5_2 = pairs
  L6_2 = L4_2.config
  L6_2 = L6_2.coords
  L5_2, L6_2, L7_2, L8_2 = L5_2(L6_2)
  for L9_2, L10_2 in L5_2, L6_2, L7_2, L8_2 do
    L11_2 = L4_2.progress
    L12_2 = {}
    L12_2.isBale = false
    L12_2.isBusy = false
    L12_2.cropped = false
    L12_2.inTrailer = false
    L12_2.prop = nil
    L11_2[L9_2] = L12_2
  end
  L5_2 = CreateThread
  function L6_2()
    local L0_3, L1_3, L2_3, L3_3, L4_3, L5_3, L6_3, L7_3, L8_3, L9_3, L10_3, L11_3, L12_3, L13_3, L14_3, L15_3, L16_3, L17_3
    while true do
      L0_3 = L4_2.deleted
      if L0_3 then
        break
      end
      L0_3 = PlayerPedId
      L0_3 = L0_3()
      L1_3 = GetEntityCoords
      L2_3 = L0_3
      L1_3 = L1_3(L2_3)
      L2_3 = L4_2.config
      L2_3 = L2_3.area
      L2_3 = L1_3 - L2_3
      L2_3 = #L2_3
      L3_3 = 424
      if L2_3 <= L3_3 then
        L3_3 = L4_2.propsCreated
        if not L3_3 then
          L3_3 = pairs
          L4_3 = L4_2.config
          L4_3 = L4_3.coords
          L3_3, L4_3, L5_3, L6_3 = L3_3(L4_3)
          for L7_3, L8_3 in L3_3, L4_3, L5_3, L6_3 do
            L9_3 = L4_2.progress
            L9_3 = L9_3[L7_3]
            L9_3 = L9_3.collected
            if not L9_3 then
              L9_3 = L4_2.progress
              L9_3 = L9_3[L7_3]
              L10_3 = L4_2.progress
              L10_3 = L10_3[L7_3]
              L11_3 = L4_2
              L12_3 = L11_3
              L11_3 = L11_3.CreateProp
              L13_3 = L7_3
              L14_3 = L9_3.isBale
              if L14_3 then
                L14_3 = L4_2.config
                L14_3 = L14_3.models
                L14_3 = L14_3.collect
                if L14_3 then
                  goto lbl_54
                end
              end
              L14_3 = L9_3.cropped
              L14_3 = L4_2.config
              L14_3 = L14_3.models
              L14_3 = not L14_3 and L14_3
              ::lbl_54::
              L15_3 = L8_3
              L16_3 = L4_2.canControl
              L17_3 = L9_3.inTrailer
              L11_3 = L11_3(L12_3, L13_3, L14_3, L15_3, L16_3, L17_3)
              L10_3.prop = L11_3
            end
          end
          L4_2.propsCreated = true
          break
        end
      end
      L3_3 = Wait
      L4_3 = 1000
      L3_3(L4_3)
    end
  end
  L5_2(L6_2)
  if A2_2 then
    L4_2.blip = nil
    L5_2 = L4_2.config
    L5_2 = L5_2.area_blip
    L5_2 = L5_2.show
    if L5_2 then
      L5_2 = AddBlipForCoord
      L6_2 = L4_2.config
      L6_2 = L6_2.area
      L6_2 = L6_2.x
      L7_2 = L4_2.config
      L7_2 = L7_2.area
      L7_2 = L7_2.y
      L8_2 = L4_2.config
      L8_2 = L8_2.area
      L8_2 = L8_2.z
      L5_2 = L5_2(L6_2, L7_2, L8_2)
      L4_2.blip = L5_2
      L5_2 = SetBlipSprite
      L6_2 = L4_2.blip
      L7_2 = L4_2.config
      L7_2 = L7_2.area_blip
      L7_2 = L7_2.sprite
      L5_2(L6_2, L7_2)
      L5_2 = SetBlipColour
      L6_2 = L4_2.blip
      L7_2 = L4_2.config
      L7_2 = L7_2.area_blip
      L7_2 = L7_2.color
      L5_2(L6_2, L7_2)
      L5_2 = SetBlipScale
      L6_2 = L4_2.blip
      L7_2 = L4_2.config
      L7_2 = L7_2.area_blip
      L7_2 = L7_2.scale
      L5_2(L6_2, L7_2)
      L5_2 = BeginTextCommandSetBlipName
      L6_2 = "STRING"
      L5_2(L6_2)
      L5_2 = AddTextComponentString
      L6_2 = L4_2.config
      L6_2 = L6_2.area_blip
      L6_2 = L6_2.label
      L5_2(L6_2)
      L5_2 = EndTextCommandSetBlipName
      L6_2 = L4_2.blip
      L5_2(L6_2)
    end
    L5_2 = CreateThread
    function L6_2()
      local L0_3, L1_3, L2_3, L3_3, L4_3, L5_3, L6_3, L7_3, L8_3, L9_3, L10_3, L11_3, L12_3, L13_3, L14_3, L15_3, L16_3, L17_3, L18_3, L19_3, L20_3, L21_3, L22_3, L23_3, L24_3, L25_3, L26_3, L27_3, L28_3, L29_3, L30_3, L31_3, L32_3, L33_3, L34_3, L35_3, L36_3, L37_3, L38_3
      while true do
        L0_3 = L4_2.deleted
        if L0_3 then
          break
        end
        L0_3 = 1000
        L1_3 = PlayerPedId
        L1_3 = L1_3()
        L2_3 = GetEntityCoords
        L3_3 = L1_3
        L2_3 = L2_3(L3_3)
        L3_3 = GetVehiclePedIsIn
        L4_3 = L1_3
        L5_3 = false
        L3_3 = L3_3(L4_3, L5_3)
        L4_3 = pairs
        L5_3 = L4_2.progress
        L4_3, L5_3, L6_3, L7_3 = L4_3(L5_3)
        for L8_3, L9_3 in L4_3, L5_3, L6_3, L7_3 do
          L10_3 = L9_3.prop
          if nil ~= L10_3 then
            L10_3 = L9_3.isBusy
            if not L10_3 then
              L10_3 = L9_3.inTrailer
              if not L10_3 then
                L10_3 = L9_3.cropped
                if not L10_3 then
                  L10_3 = GetEntityCoords
                  L11_3 = L9_3.prop
                  L11_3 = L11_3.prop
                  L10_3 = L10_3(L11_3)
                  L11_3 = GetEntityCoords
                  L12_3 = L3_3
                  L11_3 = L11_3(L12_3)
                  L12_3 = L11_3 - L10_3
                  L12_3 = #L12_3
                  L13_3 = L2_3 - L10_3
                  L13_3 = #L13_3
                  if L13_3 <= 50 then
                    L0_3 = 5
                    L14_3 = DrawMarker
                    L15_3 = 2
                    L16_3 = L10_3.x
                    L17_3 = L10_3.y
                    L18_3 = L10_3.z
                    L18_3 = L18_3 + 1.0
                    L19_3 = 0
                    L20_3 = 0
                    L21_3 = 0
                    L22_3 = 0
                    L23_3 = -180
                    L24_3 = 0
                    L25_3 = 0.5
                    L26_3 = 0.5
                    L27_3 = 0.5
                    L28_3 = 98
                    L29_3 = 255
                    L30_3 = 114
                    L31_3 = 200
                    L32_3 = true
                    L33_3 = false
                    L34_3 = 2
                    L35_3 = false
                    L36_3 = false
                    L37_3 = false
                    L38_3 = false
                    L14_3(L15_3, L16_3, L17_3, L18_3, L19_3, L20_3, L21_3, L22_3, L23_3, L24_3, L25_3, L26_3, L27_3, L28_3, L29_3, L30_3, L31_3, L32_3, L33_3, L34_3, L35_3, L36_3, L37_3, L38_3)
                    L14_3 = GetEntityModel
                    L15_3 = L3_3
                    L14_3 = L14_3(L15_3)
                    L15_3 = joaat
                    L16_3 = L4_2.config
                    L16_3 = L16_3.trailers
                    L16_3 = L16_3.harvester
                    L15_3 = L15_3(L16_3)
                    if L14_3 == L15_3 then
                      L14_3 = 1.75
                      if L12_3 <= L14_3 then
                        L14_3 = L9_3.isBale
                        if not L14_3 then
                          L9_3.isBusy = true
                          L14_3 = TriggerServerEvent
                          L15_3 = "wais:farmer:mission:deleteWheat"
                          L16_3 = L8_3
                          L17_3 = L4_2.id
                          L18_3 = L4_2.missionOwner
                          L18_3 = L18_3.id
                          L14_3(L15_3, L16_3, L17_3, L18_3)
                          L14_3 = L4_2.cropped
                          L14_3 = L14_3 + 1
                          if L14_3 >= 3 then
                            L14_3 = TriggerServerEvent
                            L15_3 = "wais:farmer:mission:makeBale"
                            L16_3 = L8_3
                            L17_3 = L4_2.id
                            L18_3 = L4_2.missionOwner
                            L18_3 = L18_3.id
                            L14_3(L15_3, L16_3, L17_3, L18_3)
                          end
                        end
                      end
                    end
                  end
                end
              end
            end
          end
        end
        L4_3 = Wait
        L5_3 = L0_3
        L4_3(L5_3)
      end
    end
    L5_2(L6_2)
  end
  return L4_2
end
L2_1.CreateMission = L3_1
L2_1 = Fields
function L3_1(A0_2, A1_2, A2_2, A3_2, A4_2, A5_2)
  local L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2
  L6_2 = {}
  L6_2.index = A1_2
  L6_2.super = A0_2
  L6_2.prop = nil
  if A2_2 then
    L7_2 = joaat
    L8_2 = A2_2
    L7_2 = L7_2(L8_2)
    L8_2 = loadModel
    L9_2 = L7_2
    L8_2 = L8_2(L9_2)
    if not L8_2 then
      L8_2 = nil
      return L8_2
    end
    L8_2 = GetGroundZFor_3dCoord
    L9_2 = A3_2.x
    L10_2 = A3_2.y
    L11_2 = A3_2.z
    L12_2 = 0
    L8_2, L9_2 = L8_2(L9_2, L10_2, L11_2, L12_2)
    L10_2 = CreateObject
    L11_2 = L7_2
    L12_2 = A3_2
    L13_2 = false
    L14_2 = false
    L15_2 = false
    L10_2 = L10_2(L11_2, L12_2, L13_2, L14_2, L15_2)
    L6_2.prop = L10_2
    while true do
      L10_2 = DoesEntityExist
      L11_2 = L6_2.prop
      L10_2 = L10_2(L11_2)
      if L10_2 then
        break
      end
      L10_2 = Wait
      L11_2 = 0
      L10_2(L11_2)
    end
    L10_2 = FreezeEntityPosition
    L11_2 = L6_2.prop
    L12_2 = true
    L10_2(L11_2, L12_2)
    L10_2 = SetEntityInvincible
    L11_2 = L6_2.prop
    L12_2 = true
    L10_2(L11_2, L12_2)
    L10_2 = SetEntityCoordsNoOffset
    L11_2 = L6_2.prop
    L12_2 = A3_2.x
    L13_2 = A3_2.y
    if L8_2 then
      L14_2 = L9_2 + 0.15
      if L14_2 then
        goto lbl_60
      end
    end
    L14_2 = A3_2.z
    ::lbl_60::
    L15_2 = false
    L16_2 = false
    L17_2 = false
    L10_2(L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2)
  end
  function L7_2(A0_3)
    local L1_3, L2_3
    L1_3 = DoesEntityExist
    L2_3 = A0_3.prop
    L1_3 = L1_3(L2_3)
    if L1_3 then
      L1_3 = DeleteEntity
      L2_3 = A0_3.prop
      L1_3(L2_3)
    end
  end
  L6_2.DeleteWheat = L7_2
  function L7_2(A0_3)
    local L1_3, L2_3, L3_3, L4_3, L5_3, L6_3, L7_3, L8_3, L9_3, L10_3, L11_3
    L1_3 = A0_3.super
    L1_3 = L1_3.progress
    L2_3 = A0_3.index
    L1_3 = L1_3[L2_3]
    L1_3 = L1_3.cropped
    if L1_3 then
      L1_3 = DoesEntityExist
      L2_3 = A0_3.prop
      L1_3 = L1_3(L2_3)
      if L1_3 then
        L1_3 = DeleteEntity
        L2_3 = A0_3.prop
        L1_3(L2_3)
      end
      L1_3 = joaat
      L2_3 = A0_3.super
      L2_3 = L2_3.config
      L2_3 = L2_3.models
      L2_3 = L2_3.collect
      L1_3 = L1_3(L2_3)
      L2_3 = loadModel
      L3_3 = L1_3
      L2_3 = L2_3(L3_3)
      if not L2_3 then
        return
      end
      while true do
        L2_3 = lib
        L2_3 = L2_3.getClosestVehicle
        L3_3 = vector3
        L4_3 = A3_2.x
        L5_3 = A3_2.y
        L6_3 = A3_2.z
        L3_3 = L3_3(L4_3, L5_3, L6_3)
        L4_3 = 5.0
        L5_3 = true
        L2_3 = L2_3(L3_3, L4_3, L5_3)
        if not L2_3 then
          break
        end
        L2_3 = Wait
        L3_3 = 1000
        L2_3(L3_3)
      end
      L2_3 = GetGroundZFor_3dCoord
      L3_3 = A3_2.x
      L4_3 = A3_2.y
      L5_3 = A3_2.z
      L6_3 = 0
      L2_3, L3_3 = L2_3(L3_3, L4_3, L5_3, L6_3)
      L4_3 = A0_3.super
      L4_3 = L4_3.progress
      L5_3 = A0_3.index
      L4_3 = L4_3[L5_3]
      L4_3.isBale = true
      L4_3 = CreateObject
      L5_3 = L1_3
      L6_3 = A3_2
      L7_3 = false
      L8_3 = false
      L9_3 = false
      L4_3 = L4_3(L5_3, L6_3, L7_3, L8_3, L9_3)
      A0_3.prop = L4_3
      while true do
        L4_3 = DoesEntityExist
        L5_3 = A0_3.prop
        L4_3 = L4_3(L5_3)
        if L4_3 then
          break
        end
        L4_3 = Wait
        L5_3 = 0
        L4_3(L5_3)
      end
      L4_3 = FreezeEntityPosition
      L5_3 = A0_3.prop
      L6_3 = true
      L4_3(L5_3, L6_3)
      L4_3 = SetEntityInvincible
      L5_3 = A0_3.prop
      L6_3 = true
      L4_3(L5_3, L6_3)
      L4_3 = SetEntityCoordsNoOffset
      L5_3 = A0_3.prop
      L6_3 = A3_2.x
      L7_3 = A3_2.y
      L8_3 = L3_3 or L8_3
      if not L2_3 or not L3_3 then
        L8_3 = A3_2.z
      end
      L9_3 = false
      L10_3 = false
      L11_3 = false
      L4_3(L5_3, L6_3, L7_3, L8_3, L9_3, L10_3, L11_3)
      L4_3 = PlaceObjectOnGroundProperly
      L5_3 = A0_3.prop
      L4_3(L5_3)
      L4_3 = A4_2
      if L4_3 then
        L4_3 = Config
        L4_3 = L4_3.Notification
        L5_3 = Lang
        L6_3 = "job"
        L5_3 = L5_3(L6_3)
        L6_3 = Lang
        L7_3 = "farmer_bale_mission"
        L6_3 = L6_3(L7_3)
        L7_3 = "inform"
        L8_3 = 5000
        L4_3(L5_3, L6_3, L7_3, L8_3)
        L4_3 = AddTargetEntity
        L5_3 = A0_3.prop
        L6_3 = {}
        L7_3 = {}
        L7_3.icon = "fa-solid fa-hand-back-fist"
        L8_3 = Lang
        L9_3 = "farmer_take_bale"
        L8_3 = L8_3(L9_3)
        L7_3.label = L8_3
        function L8_3()
          local L0_4, L1_4, L2_4, L3_4, L4_4
          L0_4 = L1_1
          if not L0_4 then
            L0_4 = A0_3.super
            L0_4 = L0_4.progress
            L1_4 = A0_3.index
            L0_4 = L0_4[L1_4]
            L0_4 = L0_4.isBusy
            if not L0_4 then
              goto lbl_23
            end
          end
          L0_4 = Config
          L0_4 = L0_4.Notification
          L1_4 = Lang
          L2_4 = "job"
          L1_4 = L1_4(L2_4)
          L2_4 = Lang
          L3_4 = "farmer_already_carrying_bale"
          L2_4 = L2_4(L3_4)
          L3_4 = "error"
          L4_4 = 5000
          do return L0_4(L1_4, L2_4, L3_4, L4_4) end
          ::lbl_23::
          L0_4 = A0_3.index
          L1_1 = L0_4
          L0_4 = Config
          L0_4 = L0_4.Notification
          L1_4 = Lang
          L2_4 = "job"
          L1_4 = L1_4(L2_4)
          L2_4 = Lang
          L3_4 = "farmer_bale_taken"
          L2_4 = L2_4(L3_4)
          L3_4 = "inform"
          L4_4 = 5000
          L0_4(L1_4, L2_4, L3_4, L4_4)
          L0_4 = TriggerServerEvent
          L1_4 = "wais:farmer:mission:sync:takeProp"
          L2_4 = L1_1
          L3_4 = A0_3.super
          L3_4 = L3_4.id
          L4_4 = A0_3.super
          L4_4 = L4_4.missionOwner
          L4_4 = L4_4.id
          L0_4(L1_4, L2_4, L3_4, L4_4)
        end
        L7_3.action = L8_3
        L6_3[1] = L7_3
        L7_3 = true
        L8_3 = 3.0
        L4_3(L5_3, L6_3, L7_3, L8_3)
        L4_3 = A0_3.super
        L4_3 = L4_3.trailerTargetAdded
        if not L4_3 then
          L4_3 = A0_3.super
          L4_3.trailerTargetAdded = true
          L4_3 = DoesEntityExist
          L5_3 = G_Farmer_Trailer
          L4_3 = L4_3(L5_3)
          if L4_3 then
            L4_3 = G_Farmer_Trailer
            if L4_3 then
              goto lbl_144
            end
          end
          L4_3 = NetToEnt
          L5_3 = G_Farmer_Trailer_NetId
          L4_3 = L4_3(L5_3)
          ::lbl_144::
          G_Farmer_Trailer = L4_3
          L4_3 = AddTargetEntity
          L5_3 = G_Farmer_Trailer
          L6_3 = {}
          L7_3 = {}
          L7_3.icon = "fa-solid fa-truck-ramp-box"
          L8_3 = Lang
          L9_3 = "farmer_put_bale"
          L8_3 = L8_3(L9_3)
          L7_3.label = L8_3
          function L8_3()
            local L0_4, L1_4, L2_4, L3_4, L4_4, L5_4, L6_4, L7_4
            L0_4 = L1_1
            if L0_4 then
              L0_4 = A0_3.super
              L0_4 = L0_4.progress
              L1_4 = L1_1
              L0_4 = L0_4[L1_4]
              L0_4 = L0_4.inTrailer
              if not L0_4 then
                L0_4 = TriggerServerEvent
                L1_4 = "wais:farmer:mission:addBaleToTrailer"
                L2_4 = L1_1
                L3_4 = A0_3.super
                L3_4 = L3_4.id
                L4_4 = A0_3.super
                L4_4 = L4_4.missionOwner
                L4_4 = L4_4.id
                L5_4 = A0_3.super
                L5_4 = L5_4.index
                L6_4 = NetworkGetNetworkIdFromEntity
                L7_4 = G_Farmer_Trailer
                L6_4, L7_4 = L6_4(L7_4)
                L0_4(L1_4, L2_4, L3_4, L4_4, L5_4, L6_4, L7_4)
                L0_4 = nil
                L1_1 = L0_4
              end
            end
          end
          L7_3.action = L8_3
          L6_3[1] = L7_3
          L7_3 = true
          L8_3 = 3.0
          L4_3(L5_3, L6_3, L7_3, L8_3)
        end
      end
    end
  end
  L6_2.changeToBale = L7_2
  return L6_2
end
L2_1.CreateProp = L3_1
L2_1 = Fields
function L3_1(A0_2, A1_2)
  local L2_2, L3_2
  L2_2 = A0_2.progress
  L2_2 = L2_2[A1_2]
  if nil ~= L2_2 then
    L2_2 = A0_2.canControl
    if L2_2 then
      L2_2 = A0_2.cropped
      L2_2 = L2_2 + 1
      A0_2.cropped = L2_2
    end
    L2_2 = A0_2.progress
    L2_2 = L2_2[A1_2]
    L2_2.cropped = true
    L2_2 = A0_2.progress
    L2_2 = L2_2[A1_2]
    L2_2 = L2_2.prop
    if nil ~= L2_2 then
      L2_2 = A0_2.progress
      L2_2 = L2_2[A1_2]
      L2_2 = L2_2.prop
      L3_2 = L2_2
      L2_2 = L2_2.DeleteWheat
      L2_2(L3_2)
    end
  end
end
L2_1.DeleteWheat = L3_1
L2_1 = Fields
function L3_1(A0_2, A1_2)
  local L2_2, L3_2
  L2_2 = A0_2.progress
  L2_2 = L2_2[A1_2]
  if nil ~= L2_2 then
    L2_2 = A0_2.canControl
    if L2_2 then
      L2_2 = A0_2.cropped
      if L2_2 >= 3 then
        A0_2.cropped = 0
      end
    end
    L2_2 = A0_2.progress
    L2_2 = L2_2[A1_2]
    L2_2.isBusy = false
    L2_2 = A0_2.progress
    L2_2 = L2_2[A1_2]
    L2_2 = L2_2.prop
    if nil ~= L2_2 then
      L2_2 = A0_2.progress
      L2_2 = L2_2[A1_2]
      L2_2 = L2_2.prop
      L3_2 = L2_2
      L2_2 = L2_2.changeToBale
      L2_2(L3_2)
    end
  end
end
L2_1.MakeWheatToBale = L3_1
L2_1 = Fields
function L3_1(A0_2, A1_2, A2_2)
  local L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2
  L3_2 = A0_2.progress
  L3_2 = L3_2[A1_2]
  if nil ~= L3_2 then
    L3_2 = A0_2.progress
    L3_2 = L3_2[A1_2]
    L3_2.isBusy = true
    L3_2 = A0_2.progress
    L3_2 = L3_2[A1_2]
    L3_2 = L3_2.prop
    if nil ~= L3_2 then
      L3_2 = PlayerPedId
      L3_2 = L3_2()
      L4_2 = GetEntityCoords
      L5_2 = L3_2
      L4_2 = L4_2(L5_2)
      L5_2 = A0_2.config
      L5_2 = L5_2.area
      L5_2 = L4_2 - L5_2
      L5_2 = #L5_2
      L6_2 = 424
      if L5_2 > L6_2 then
        return
      end
      L6_2 = GetPlayerPed
      L7_2 = GetPlayerFromServerId
      L8_2 = A2_2
      L7_2, L8_2, L9_2, L10_2 = L7_2(L8_2)
      L6_2 = L6_2(L7_2, L8_2, L9_2, L10_2)
      if L6_2 > 0 then
        L7_2 = takePropFromVehicle
        L8_2 = A0_2.progress
        L8_2 = L8_2[A1_2]
        L8_2 = L8_2.prop
        L8_2 = L8_2.prop
        L9_2 = A0_2.config
        L9_2 = L9_2.models
        L9_2 = L9_2.collect_player_attach
        L10_2 = L6_2
        L7_2(L8_2, L9_2, L10_2)
      end
    end
  end
end
L2_1.TakeProp = L3_1
L2_1 = Fields
function L3_1(A0_2, A1_2, A2_2, A3_2)
  local L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2
  L4_2 = NetToVeh
  L5_2 = A2_2
  L4_2 = L4_2(L5_2)
  A2_2 = L4_2
  L4_2 = A0_2.progress
  L4_2 = L4_2[A1_2]
  if nil ~= L4_2 then
    L4_2 = A0_2.collected
    L4_2 = L4_2 + 3
    A0_2.collected = L4_2
    L4_2 = A0_2.canControl
    if L4_2 then
      L4_2 = A0_2.collected
      L5_2 = A0_2.mustBeCollected
      if L4_2 == L5_2 then
        L4_2 = Config
        L4_2 = L4_2.Notification
        L5_2 = Lang
        L6_2 = "job"
        L5_2 = L5_2(L6_2)
        L6_2 = Lang
        L7_2 = "farmer_deliver_bales"
        L6_2 = L6_2(L7_2)
        L7_2 = "inform"
        L8_2 = 10000
        L4_2(L5_2, L6_2, L7_2, L8_2)
        L4_2 = SetNewWaypoint
        L5_2 = L0_1.menu
        L5_2 = L5_2.job_menu
        L5_2 = L5_2.x
        L6_2 = L0_1.menu
        L6_2 = L6_2.job_menu
        L6_2 = L6_2.y
        L4_2(L5_2, L6_2)
      else
        L4_2 = math
        L4_2 = L4_2.floor
        L5_2 = A0_2.mustBeCollected
        L6_2 = A0_2.collected
        L5_2 = L5_2 - L6_2
        L5_2 = L5_2 / 3
        L4_2 = L4_2(L5_2)
        L5_2 = Config
        L5_2 = L5_2.Notification
        L6_2 = Lang
        L7_2 = "job"
        L6_2 = L6_2(L7_2)
        L7_2 = Lang
        L8_2 = "farmer_bale_added_left"
        L9_2 = L4_2
        L7_2 = L7_2(L8_2, L9_2)
        L8_2 = "inform"
        L9_2 = 5000
        L5_2(L6_2, L7_2, L8_2, L9_2)
      end
    end
    L4_2 = math
    L4_2 = L4_2.floor
    L5_2 = A0_2.collected
    L5_2 = L5_2 / 3
    L4_2 = L4_2(L5_2)
    L5_2 = A0_2.progress
    L5_2 = L5_2[A1_2]
    L5_2.inTrailer = true
    L5_2 = A0_2.progress
    L5_2 = L5_2[A1_2]
    L5_2.isBusy = false
    L5_2 = L0_1.field_list
    L6_2 = A0_2.index
    L5_2 = L5_2[L6_2]
    L5_2 = L5_2.models
    L5_2 = L5_2.collect_car_attach
    L6_2 = L0_1.attach_coords
    L6_2 = L6_2[L4_2]
    L5_2.coords = L6_2
    L5_2 = A0_2.progress
    L5_2 = L5_2[A1_2]
    L5_2 = L5_2.prop
    if nil ~= L5_2 then
      L5_2 = PlayerPedId
      L5_2 = L5_2()
      L6_2 = GetEntityCoords
      L7_2 = L5_2
      L6_2 = L6_2(L7_2)
      L7_2 = A0_2.config
      L7_2 = L7_2.area
      L7_2 = L6_2 - L7_2
      L7_2 = #L7_2
      L8_2 = 424
      if L7_2 > L8_2 then
        return
      end
      L8_2 = putPropToVehicle
      L9_2 = A0_2.progress
      L9_2 = L9_2[A1_2]
      L9_2 = L9_2.prop
      L9_2 = L9_2.prop
      L10_2 = L0_1.field_list
      L11_2 = A0_2.index
      L10_2 = L10_2[L11_2]
      L10_2 = L10_2.models
      L10_2 = L10_2.collect_car_attach
      L11_2 = A2_2 or L11_2
      if not A2_2 then
        L11_2 = G_Farmer_Trailer
      end
      L8_2(L9_2, L10_2, L11_2)
      L8_2 = GetPlayerPed
      L9_2 = GetPlayerFromServerId
      L10_2 = A3_2
      L9_2, L10_2, L11_2 = L9_2(L10_2)
      L8_2 = L8_2(L9_2, L10_2, L11_2)
      if L8_2 > 0 then
        L9_2 = ClearPedTasks
        L10_2 = L8_2
        L9_2(L10_2)
        L9_2 = ClearPedSecondaryTask
        L10_2 = L8_2
        L9_2(L10_2)
      end
    end
  end
end
L2_1.AddBaleToTrailer = L3_1
L2_1 = Fields
function L3_1(A0_2)
  local L1_2, L2_2
  L1_2 = A0_2.collected
  L2_2 = A0_2.mustBeCollected
  L1_2 = L1_2 == L2_2
  return L1_2
end
L2_1.CheckIsDone = L3_1
L2_1 = Fields
function L3_1(A0_2)
  local L1_2, L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2
  L1_2 = PlayerPedId
  L1_2 = L1_2()
  A0_2.deleted = true
  L2_2 = A0_2.timer
  if L2_2 then
    L2_2 = A0_2.timer
    L3_2 = L2_2
    L2_2 = L2_2.delete
    L2_2(L3_2)
  end
  L2_2 = A0_2.blip
  if L2_2 then
    L2_2 = RemoveBlip
    L3_2 = A0_2.blip
    L2_2(L3_2)
  end
  L2_2 = pairs
  L3_2 = A0_2.progress
  L2_2, L3_2, L4_2, L5_2 = L2_2(L3_2)
  for L6_2, L7_2 in L2_2, L3_2, L4_2, L5_2 do
    L8_2 = L7_2.prop
    if nil ~= L8_2 then
      L8_2 = DoesEntityExist
      L9_2 = L7_2.prop
      L9_2 = L9_2.prop
      L8_2 = L8_2(L9_2)
      if L8_2 then
        L8_2 = DeleteEntity
        L9_2 = L7_2.prop
        L9_2 = L9_2.prop
        L8_2(L9_2)
      end
      L8_2 = L7_2.prop
      L8_2 = L8_2.blip
      if L8_2 then
        L8_2 = RemoveBlip
        L9_2 = L7_2.prop
        L9_2 = L9_2.blip
        L8_2(L9_2)
      end
    end
    L8_2 = A0_2.progress
    L8_2[L6_2] = nil
  end
  L2_2 = L1_1
  if L2_2 then
    L2_2 = ClearPedTasks
    L3_2 = L1_2
    L2_2(L3_2)
    L2_2 = ClearPedSecondaryTask
    L3_2 = L1_2
    L2_2(L3_2)
    L2_2 = nil
    L1_1 = L2_2
  end
  A0_2.progress = nil
  A0_2 = nil
end
L2_1.DeleteMission = L3_1