local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1
L0_1 = false
L1_1 = {}
L2_1 = Config
if L2_1 then
  L2_1 = L2_1.Pages
end
L1_1.pages = L2_1
L2_1 = Config
if L2_1 then
  L2_1 = L2_1.Speech
end
L1_1.speech = L2_1
L2_1 = Config
if L2_1 then
  L2_1 = L2_1.BackgroundMusic
end
L1_1.bgMusic = L2_1
L2_1 = Config
if L2_1 then
  L2_1 = L2_1.CinematicMode
end
L1_1.cinematicMode = L2_1
L2_1 = Config
if L2_1 then
  L2_1 = L2_1.DeleteButton
end
L1_1.deleteButtonStatus = L2_1
L2_1 = require
L3_1 = "locales."
L4_1 = Config
L4_1 = L4_1.Lang
L3_1 = L3_1 .. L4_1
L2_1 = L2_1(L3_1)
L1_1.lang = L2_1
L2_1 = CreateThread
function L3_1()
  local L0_2, L1_2, L2_2
  while true do
    L0_2 = Wait
    L1_2 = 0
    L0_2(L1_2)
    L0_2 = NetworkIsSessionStarted
    L0_2 = L0_2()
    if L0_2 then
      L0_2 = L0_1
      if L0_2 then
        L0_2 = pcall
        function L1_2()
          local L0_3, L1_3, L2_3
          L0_3 = exports
          L0_3 = L0_3.spawnmanager
          L1_3 = L0_3
          L0_3 = L0_3.setAutoSpawn
          L2_3 = false
          L0_3(L1_3, L2_3)
        end
        L0_2(L1_2)
        L0_2 = Debug
        L1_2 = "Network Player Active | Auto Spawn False |"
        L2_2 = PlayerId
        L2_2 = L2_2()
        L1_2 = L1_2 .. L2_2
        L0_2(L1_2)
        L0_2 = Wait
        L1_2 = 350
        L0_2(L1_2)
        L0_2 = TriggerEvent
        L1_2 = "um-multicharacter:client:chooseChar"
        L0_2(L1_2)
        break
      end
    end
  end
end
L2_1(L3_1)
L2_1 = RegisterNUICallback
L3_1 = "jsReady"
function L4_1(A0_2, A1_2)
  local L2_2, L3_2
  L2_2 = A1_2
  L3_2 = "ok"
  L2_2(L3_2)
  L2_2 = true
  L0_1 = L2_2
  L2_2 = Debug
  L3_2 = "JS Ready"
  L2_2(L3_2)
end
L2_1(L3_1, L4_1)
L2_1 = RegisterNetEvent
L3_1 = "um-multicharacter:client:chooseChar"
function L4_1()
  local L0_2, L1_2
  L0_2 = UMShutDownNui
  L0_2()
end
L2_1(L3_1, L4_1)
L2_1 = RegisterNetEvent
L3_1 = "um-multicharacter:client:GetCharacters"
function L4_1()
  local L0_2, L1_2, L2_2, L3_2, L4_2, L5_2
  L0_2 = SetNui
  L1_2 = false
  L0_2(L1_2)
  L0_2 = SetFollowPedCamViewMode
  L1_2 = 2
  L0_2(L1_2)
  L0_2 = Debug
  L1_2 = "GetCharacters SQL"
  L2_2 = "info"
  L0_2(L1_2, L2_2)
  L0_2 = lib
  L0_2 = L0_2.callback
  L0_2 = L0_2.await
  L1_2 = "um-multicharacter:server:GetCharacters"
  L2_2 = 5000
  L0_2, L1_2 = L0_2(L1_2, L2_2)
  if L0_2 then
    L2_2 = lib
    L2_2 = L2_2.callback
    L2_2 = L2_2.await
    L3_2 = "um-multicharacter:callback:CustomDeleteCharacterAccess"
    L2_2 = L2_2(L3_2)
    L3_2 = SendNUIMessage
    L4_2 = {}
    L4_2.ui = true
    L4_2.myCharacters = L0_2
    L5_2 = L1_1.lang
    L4_2.Lang = L5_2
    L4_2.totalSlots = L1_2
    L5_2 = L2_2 or L5_2
    if not L2_2 then
      L5_2 = L1_1
      if L5_2 then
        L5_2 = L5_2.deleteButtonStatus
      end
    end
    L4_2.deleteButtonStatus = L5_2
    L5_2 = L1_1.pages
    L4_2.pagesList = L5_2
    L5_2 = L1_1.speech
    L4_2.speechList = L5_2
    L5_2 = L1_1.bgMusic
    L4_2.bgMusic = L5_2
    L5_2 = L1_1.cinematicMode
    L4_2.cinematicMode = L5_2
    L3_2(L4_2)
    L3_2 = Debug
    L4_2 = "Characters Received"
    L3_2(L4_2)
    L3_2 = Debug
    L4_2 = "Total Number of Slots:"
    L5_2 = L1_2
    L4_2 = L4_2 .. L5_2
    L3_2(L4_2)
    L3_2 = SetNui
    L4_2 = true
    L3_2(L4_2)
  else
    L2_2 = SendNUIMessage
    L3_2 = {}
    L3_2.ui = true
    L4_2 = L1_1.lang
    L3_2.Lang = L4_2
    L3_2.totalSlots = L1_2
    L4_2 = L1_1.pages
    L3_2.pagesList = L4_2
    L4_2 = L1_1.bgMusic
    L3_2.bgMusic = L4_2
    L4_2 = L1_1.cinematicMode
    L3_2.cinematicMode = L4_2
    L2_2(L3_2)
    L2_2 = Debug
    L3_2 = "Character Not Found | New Character Screen Introduced"
    L2_2(L3_2)
    L2_2 = Debug
    L3_2 = "Character Not Found | Number of Slots:"
    L4_2 = L1_2
    L3_2 = L3_2 .. L4_2
    L2_2(L3_2)
    L2_2 = SetNui
    L3_2 = true
    L2_2(L3_2)
  end
  L2_2 = IsNuiFocused
  L2_2 = L2_2()
  if not L2_2 then
    L2_2 = 0
    while true do
      L3_2 = IsNuiFocused
      L3_2 = L3_2()
      if L3_2 then
        break
      end
      L3_2 = 1000
      if not (L2_2 < L3_2) then
        break
      end
      L2_2 = L2_2 + 1
      L3_2 = SetNui
      L4_2 = true
      L3_2(L4_2)
      L3_2 = Debug
      L4_2 = "Waiting for NUI Focus"
      L3_2(L4_2)
      L3_2 = Wait
      L4_2 = 10
      L3_2(L4_2)
    end
  end
  L2_2 = SetUseHideDofLoop
  L2_2()
end
L2_1(L3_1, L4_1)
function L2_1(A0_2)
  local L1_2, L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2
  L1_2 = 0
  L2_2 = pairs
  L3_2 = A0_2
  L2_2, L3_2, L4_2, L5_2 = L2_2(L3_2)
  for L6_2 in L2_2, L3_2, L4_2, L5_2 do
    L1_2 = L1_2 + 1
    if L1_2 > 3 then
      L7_2 = false
      return L7_2
    end
  end
  L2_2 = 1 == L1_2 or 2 == L1_2
  return L2_2
end
function L3_1()
  local L0_2, L1_2, L2_2
  L0_2 = SetTimeout
  L1_2 = 1000
  function L2_2()
    local L0_3, L1_3, L2_3, L3_3, L4_3, L5_3, L6_3, L7_3, L8_3, L9_3, L10_3, L11_3, L12_3, L13_3, L14_3, L15_3, L16_3, L17_3
    L0_3 = "anim@scripted@heist@ig25_beach@male@"
    L1_3 = lib
    L1_3 = L1_3.requestAnimDict
    L2_3 = L0_3
    L1_3(L2_3)
    L1_3 = GetEntityCoords
    L2_3 = cache
    L2_3 = L2_3.ped
    L1_3 = L1_3(L2_3)
    L2_3 = GetEntityHeading
    L3_3 = cache
    L3_3 = L3_3.ped
    L2_3 = L2_3(L3_3)
    L3_3 = vector4
    L4_3 = L1_3.x
    L5_3 = L1_3.y
    L6_3 = L1_3.z
    L6_3 = L6_3 - 1
    L7_3 = L2_3
    L3_3 = L3_3(L4_3, L5_3, L6_3, L7_3)
    L4_3 = NetworkCreateSynchronisedScene
    L5_3 = L3_3.x
    L6_3 = L3_3.y
    L7_3 = L3_3.z
    L8_3 = 0.0
    L9_3 = 0.0
    L10_3 = L3_3.w
    L11_3 = 2
    L12_3 = false
    L13_3 = false
    L14_3 = 8.0
    L15_3 = 1000.0
    L16_3 = 1.0
    L4_3 = L4_3(L5_3, L6_3, L7_3, L8_3, L9_3, L10_3, L11_3, L12_3, L13_3, L14_3, L15_3, L16_3)
    L5_3 = NetworkAddPedToSynchronisedScene
    L6_3 = cache
    L6_3 = L6_3.ped
    L7_3 = L4_3
    L8_3 = L0_3
    L9_3 = "action"
    L10_3 = 1000.0
    L11_3 = 8.0
    L12_3 = 0
    L13_3 = 0
    L14_3 = 1000.0
    L15_3 = 8192
    L5_3(L6_3, L7_3, L8_3, L9_3, L10_3, L11_3, L12_3, L13_3, L14_3, L15_3)
    L5_3 = CreateCam
    L6_3 = "DEFAULT_ANIMATED_CAMERA"
    L7_3 = true
    L5_3 = L5_3(L6_3, L7_3)
    L6_3 = PlayCamAnim
    L7_3 = L5_3
    L8_3 = "action_camera"
    L9_3 = L0_3
    L10_3 = L3_3.x
    L11_3 = L3_3.y
    L12_3 = L3_3.z
    L13_3 = 0.0
    L14_3 = 0.0
    L15_3 = L3_3.w
    L16_3 = false
    L17_3 = 2
    L6_3(L7_3, L8_3, L9_3, L10_3, L11_3, L12_3, L13_3, L14_3, L15_3, L16_3, L17_3)
    L6_3 = RenderScriptCams
    L7_3 = true
    L8_3 = false
    L9_3 = 0
    L10_3 = true
    L11_3 = false
    L6_3(L7_3, L8_3, L9_3, L10_3, L11_3)
    L6_3 = NetworkStartSynchronisedScene
    L7_3 = L4_3
    L6_3(L7_3)
    L6_3 = NetworkGetLocalSceneFromNetworkId
    L7_3 = L4_3
    L6_3 = L6_3(L7_3)
    while -1 == L6_3 do
      L7_3 = Wait
      L8_3 = 0
      L7_3(L8_3)
      L7_3 = NetworkGetLocalSceneFromNetworkId
      L8_3 = L4_3
      L7_3 = L7_3(L8_3)
      L6_3 = L7_3
    end
    repeat
      L7_3 = Wait
      L8_3 = 0
      L7_3(L8_3)
      L7_3 = GetSynchronizedScenePhase
      L8_3 = L6_3
      L7_3 = L7_3(L8_3)
      L8_3 = 0.85
    until L7_3 > L8_3
    L7_3 = StopRenderingScriptCamsUsingCatchUp
    L8_3 = false
    L9_3 = 4.0
    L10_3 = 3
    L7_3(L8_3, L9_3, L10_3)
    L7_3 = DestroyCam
    L8_3 = L5_3
    L9_3 = false
    L7_3(L8_3, L9_3)
    L7_3 = FreezeEntityPosition
    L8_3 = cache
    L8_3 = L8_3.ped
    L9_3 = false
    L7_3(L8_3, L9_3)
    L7_3 = RemoveAnimDict
    L8_3 = L0_3
    L7_3(L8_3)
  end
  L0_2(L1_2, L2_2)
end
function L4_1()
  local L0_2, L1_2, L2_2, L3_2
  L0_2 = FreezeEntityPosition
  L1_2 = cache
  L1_2 = L1_2.ped
  L2_2 = true
  L0_2(L1_2, L2_2)
  L0_2 = DoScreenFadeOut
  L1_2 = 0
  L0_2(L1_2)
  L0_2 = TriggerScreenblurFadeIn
  L1_2 = 10
  L0_2(L1_2)
  L0_2 = IsPlayerSwitchInProgress
  L0_2 = L0_2()
  if not L0_2 then
    L0_2 = SwitchOutPlayer
    L1_2 = cache
    L1_2 = L1_2.ped
    L2_2 = 0
    L3_2 = 1
    L0_2(L1_2, L2_2, L3_2)
  end
  while true do
    L0_2 = GetPlayerSwitchState
    L0_2 = L0_2()
    if 5 == L0_2 then
      break
    end
    L0_2 = Wait
    L1_2 = 0
    L0_2(L1_2)
  end
  L0_2 = DoScreenFadeIn
  L1_2 = 1000
  L0_2(L1_2)
  while true do
    L0_2 = IsScreenFadedIn
    L0_2 = L0_2()
    if L0_2 then
      break
    end
    L0_2 = Wait
    L1_2 = 0
    L0_2(L1_2)
  end
  L0_2 = L3_1
  L0_2()
  L0_2 = SwitchInPlayer
  L1_2 = cache
  L1_2 = L1_2.ped
  L0_2(L1_2)
  while true do
    L0_2 = GetPlayerSwitchState
    L0_2 = L0_2()
    if 12 == L0_2 then
      break
    end
    L0_2 = Wait
    L1_2 = 0
    L0_2(L1_2)
  end
  L0_2 = TriggerScreenblurFadeOut
  L1_2 = 100
  L0_2(L1_2)
  L0_2 = FreezeEntityPosition
  L1_2 = cache
  L1_2 = L1_2.ped
  L2_2 = false
  L0_2(L1_2, L2_2)
end
L5_1 = RegisterNetEvent
L6_1 = "esx:playerLoaded"
function L7_1(A0_2, A1_2, A2_2)
  local L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2
  L3_2 = A0_2.coords
  if not A1_2 then
    L4_2 = string
    L4_2 = L4_2.find
    L5_2 = tostring
    L6_2 = A0_2.sex
    L5_2 = L5_2(L6_2)
    L6_2 = L5_2
    L5_2 = L5_2.lower
    L5_2 = L5_2(L6_2)
    L6_2 = "mal"
    L4_2 = L4_2(L5_2, L6_2)
    if L4_2 then
      A0_2.sex = "m"
    else
      L4_2 = string
      L4_2 = L4_2.find
      L5_2 = tostring
      L6_2 = A0_2.sex
      L5_2 = L5_2(L6_2)
      L6_2 = L5_2
      L5_2 = L5_2.lower
      L5_2 = L5_2(L6_2)
      L6_2 = "fem"
      L4_2 = L4_2(L5_2, L6_2)
      if L4_2 then
        A0_2.sex = "f"
      end
    end
    L4_2 = A0_2.sex
    if "m" == L4_2 then
      L4_2 = 0
      if L4_2 then
        goto lbl_36
      end
    end
    L4_2 = 1
    ::lbl_36::
    A2_2.sex = L4_2
    L4_2 = Debug
    L5_2 = "Not new | skin sex set:"
    L6_2 = A2_2.sex
    L5_2 = L5_2 .. L6_2
    L4_2(L5_2)
  end
  if not A1_2 and A2_2 then
    L4_2 = #A2_2
    if 1 ~= L4_2 then
      L4_2 = L2_1
      L5_2 = A2_2
      L4_2 = L4_2(L5_2)
      if not L4_2 then
        goto lbl_101
      end
    end
  end
  A1_2 = true
  L4_2 = DoScreenFadeOut
  L5_2 = 20
  L4_2(L5_2)
  L4_2 = GetModel
  L5_2 = A0_2.sex
  if not L5_2 then
    L5_2 = "m"
  end
  L4_2 = L4_2(L5_2)
  L5_2 = SetModel
  L6_2 = L4_2
  L5_2(L6_2)
  L5_2 = Default
  L5_2 = L5_2.Skins
  L6_2 = GetClothingMenu
  L6_2 = L6_2()
  L5_2 = L5_2[L6_2]
  L6_2 = A0_2.sex
  if not L6_2 then
    L6_2 = "m"
  end
  A2_2 = L5_2[L6_2]
  L5_2 = A0_2.sex
  if "m" == L5_2 then
    L5_2 = 0
    if L5_2 then
      goto lbl_84
    end
  end
  L5_2 = 1
  ::lbl_84::
  A2_2.sex = L5_2
  L5_2 = PlayerPedId
  L5_2 = L5_2()
  L6_2 = SetPedSkin
  L7_2 = L5_2
  L8_2 = A2_2
  L6_2(L7_2, L8_2)
  L6_2 = SetEntityVisible
  L7_2 = L5_2
  L8_2 = true
  L9_2 = false
  L6_2(L7_2, L8_2, L9_2)
  L6_2 = Wait
  L7_2 = 100
  L6_2(L7_2)
  L6_2 = Config
  L3_2 = L6_2.DefaultSpawn
  ::lbl_101::
  L4_2 = ClearAndPlay
  L4_2()
  if not A1_2 then
    L4_2 = Debug
    L5_2 = "Not new, load clothing"
    L4_2(L5_2)
    L4_2 = ClothingExports
    L5_2 = A2_2
    L4_2(L5_2)
  end
  L4_2 = Wait
  L5_2 = 400
  L4_2(L5_2)
  L4_2 = CustomSpawn
  L5_2 = A1_2
  L6_2 = L3_2
  L4_2 = L4_2(L5_2, L6_2)
  L5_2 = Config
  L5_2 = L5_2.CutSceneAndGTANative
  if L5_2 and false == A1_2 and false == L4_2 then
    L5_2 = L4_1
    L5_2()
    L5_2 = Debug
    L6_2 = ":: Player Loaded First GTACutSceneAndGTANative ::"
    L5_2(L6_2)
  else
    L5_2 = DoScreenFadeIn
    L6_2 = 400
    L5_2(L6_2)
    repeat
      L5_2 = Wait
      L6_2 = 200
      L5_2(L6_2)
      L5_2 = IsScreenFadedOut
      L5_2 = L5_2()
    until not L5_2
    L5_2 = Debug
    L6_2 = ":: Player Loaded First IsScreenFadedOut()::"
    L5_2(L6_2)
  end
  L5_2 = TriggerServerEvent
  L6_2 = "esx:onPlayerSpawn"
  L5_2(L6_2)
  L5_2 = TriggerEvent
  L6_2 = "esx:onPlayerSpawn"
  L5_2(L6_2)
  L5_2 = TriggerEvent
  L6_2 = "playerSpawned"
  L5_2(L6_2)
  L5_2 = TriggerEvent
  L6_2 = "esx:restoreLoadout"
  L5_2(L6_2)
  if A1_2 then
    L5_2 = TriggerEvent
    L6_2 = Config
    L6_2 = L6_2.ESXEvents
    L6_2 = L6_2.customizationMenu
    L5_2(L6_2)
  end
  L5_2 = Debug
  L6_2 = ":: Player Loaded Last ::"
  L5_2(L6_2)
end
L5_1(L6_1, L7_1)
L5_1 = RegisterNetEvent
L6_1 = "esx:onPlayerLogout"
function L7_1()
  local L0_2, L1_2
  L0_2 = DoScreenFadeOut
  L1_2 = 500
  L0_2(L1_2)
  L0_2 = Wait
  L1_2 = 1000
  L0_2(L1_2)
  L0_2 = TriggerEvent
  L1_2 = "esx_skin:resetFirstSpawn"
  L0_2(L1_2)
end
L5_1(L6_1, L7_1)
L5_1 = RegisterNetEvent
L6_1 = "um-multicharacter:client:logout"
function L7_1()
  local L0_2, L1_2, L2_2
  L0_2 = GetInvokingResource
  L0_2 = L0_2()
  if L0_2 then
    return
  end
  L0_2 = GetFollowPedCamViewMode
  L0_2 = L0_2()
  if 4 == L0_2 then
    L1_2 = SetFollowPedCamViewMode
    L2_2 = 1
    L1_2(L2_2)
  end
  L1_2 = TriggerEvent
  L2_2 = "um-clearCacheSkin"
  L1_2(L2_2)
  L1_2 = TriggerEvent
  L2_2 = "um-multicharacter:client:chooseChar"
  L1_2(L2_2)
end
L5_1(L6_1, L7_1)
L5_1 = lib
L5_1 = L5_1.callback
L5_1 = L5_1.register
L6_1 = "um-multicharacter:callback:checkPlayerDead"
function L7_1()
  local L0_2, L1_2
  L0_2 = Framework
  L1_2 = L0_2
  L0_2 = L0_2.PlayerDeadCheck
  return L0_2(L1_2)
end
L5_1(L6_1, L7_1)
L5_1 = RegisterNetEvent
L6_1 = "um-multicharacter:client:setNuiClose"
function L7_1()
  local L0_2, L1_2
  L0_2 = SendNUIMessage
  L1_2 = {}
  L1_2.ui = false
  L0_2(L1_2)
  L0_2 = SetNui
  L1_2 = false
  L0_2(L1_2)
end
L5_1(L6_1, L7_1)
L5_1 = RegisterNetEvent
L6_1 = "um-multicharacter:setPlayerData"
function L7_1(A0_2)
  local L1_2, L2_2, L3_2
  L1_2 = GetInvokingResource
  L1_2 = L1_2()
  if L1_2 then
    return
  end
  L1_2 = SetTimeout
  L2_2 = 1
  function L3_2()
    local L0_3, L1_3, L2_3, L3_3, L4_3, L5_3
    L0_3 = ESX
    L0_3 = L0_3.SetPlayerData
    L1_3 = "name"
    L2_3 = "%s %s"
    L3_3 = L2_3
    L2_3 = L2_3.format
    L4_3 = A0_2.firstName
    L5_3 = A0_2.lastName
    L2_3, L3_3, L4_3, L5_3 = L2_3(L3_3, L4_3, L5_3)
    L0_3(L1_3, L2_3, L3_3, L4_3, L5_3)
    L0_3 = ESX
    L0_3 = L0_3.SetPlayerData
    L1_3 = "firstName"
    L2_3 = A0_2.firstName
    L0_3(L1_3, L2_3)
    L0_3 = ESX
    L0_3 = L0_3.SetPlayerData
    L1_3 = "lastName"
    L2_3 = A0_2.lastName
    L0_3(L1_3, L2_3)
    L0_3 = ESX
    L0_3 = L0_3.SetPlayerData
    L1_3 = "dateofbirth"
    L2_3 = A0_2.dateOfBirth
    L0_3(L1_3, L2_3)
    L0_3 = ESX
    L0_3 = L0_3.SetPlayerData
    L1_3 = "sex"
    L2_3 = A0_2.sex
    L0_3(L1_3, L2_3)
    L0_3 = ESX
    L0_3 = L0_3.SetPlayerData
    L1_3 = "height"
    L2_3 = A0_2.height
    L0_3(L1_3, L2_3)
  end
  L1_2(L2_2, L3_2)
end
L5_1(L6_1, L7_1)
