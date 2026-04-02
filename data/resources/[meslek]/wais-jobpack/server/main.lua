local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1
wFramework = nil
L0_1 = Config
L0_1 = L0_1.Framework
L0_1 = L0_1.Framework
if "esx" == L0_1 then
  L0_1 = Config
  L0_1 = L0_1.Framework
  L0_1 = L0_1.NewCore
  if L0_1 then
    L0_1 = exports
    L1_1 = Config
    L1_1 = L1_1.Framework
    L1_1 = L1_1.ResourceName
    L0_1 = L0_1[L1_1]
    L1_1 = L0_1
    L0_1 = L0_1.getSharedObject
    L0_1 = L0_1(L1_1)
    wFramework = L0_1
  else
    while true do
      L0_1 = wFramework
      if nil ~= L0_1 then
        break
      end
      L0_1 = TriggerEvent
      L1_1 = Config
      L1_1 = L1_1.Framework
      L1_1 = L1_1.SharedEvent
      function L2_1(A0_2)
        local L1_2
        wFramework = A0_2
      end
      L0_1(L1_1, L2_1)
      L0_1 = Wait
      L1_1 = 10
      L0_1(L1_1)
    end
  end
else
  L0_1 = Config
  L0_1 = L0_1.Framework
  L0_1 = L0_1.Framework
  if "qbcore" ~= L0_1 then
    L0_1 = Config
    L0_1 = L0_1.Framework
    L0_1 = L0_1.Framework
    if "qbox" ~= L0_1 then
      goto lbl_73
    end
  end
  L0_1 = Config
  L0_1 = L0_1.Framework
  L0_1 = L0_1.NewCore
  if L0_1 then
    L0_1 = exports
    L1_1 = Config
    L1_1 = L1_1.Framework
    L1_1 = L1_1.ResourceName
    L0_1 = L0_1[L1_1]
    L1_1 = L0_1
    L0_1 = L0_1.GetCoreObject
    L0_1 = L0_1(L1_1)
    wFramework = L0_1
  else
    while "spawnedVehicles" do
      L0_1 = wFramework
      if nil ~= L0_1 then
        break
      end
      L0_1 = TriggerEvent
      L1_1 = Config
      L1_1 = L1_1.Framework
      L1_1 = L1_1.SharedEvent
      function L2_1(A0_2)
        local L1_2
        wFramework = A0_2
      end
      L0_1(L1_1, L2_1)
      L0_1 = Wait
      L1_1 = 10
      L0_1(L1_1)
    end
  end
end
::lbl_73::
L0_1 = {}
L1_1 = {}
spawnedProps = L1_1
spawnedVehicles = L0_1
L0_1 = {}
L1_1 = RegisterNetEvent
L2_1 = "esx:playerLoaded"
function L3_1(A0_2, A1_2)
  local L2_2, L3_2, L4_2, L5_2, L6_2
  L2_2 = A0_2
  L3_2 = TriggerEvent
  L4_2 = "wais:job:server:playerLoaded"
  L5_2 = L2_2
  L6_2 = A1_2.identifier
  L3_2(L4_2, L5_2, L6_2)
end
L1_1(L2_1, L3_1)
L1_1 = RegisterNetEvent
L2_1 = "QBCore:Server:PlayerLoaded"
function L3_1(A0_2)
  local L1_2, L2_2, L3_2, L4_2, L5_2
  L1_2 = A0_2.PlayerData
  L1_2 = L1_2.source
  L2_2 = TriggerEvent
  L3_2 = "wais:job:server:playerLoaded"
  L4_2 = L1_2
  L5_2 = A0_2.PlayerData
  L5_2 = L5_2.citizenid
  L2_2(L3_2, L4_2, L5_2)
end
L1_1(L2_1, L3_1)
L1_1 = RegisterNetEvent
L2_1 = "osp_amblance:setDeathStatus"
function L3_1(A0_2)
  local L1_2, L2_2, L3_2, L4_2
  L1_2 = source
  L2_2 = changeDeadStatus
  L3_2 = L1_2
  L4_2 = A0_2
  L2_2(L3_2, L4_2)
end
L1_1(L2_1, L3_1)
L1_1 = RegisterNetEvent
L2_1 = "esx_ambulancejob:setDeathStatus"
function L3_1(A0_2)
  local L1_2, L2_2, L3_2, L4_2
  L1_2 = source
  L2_2 = changeDeadStatus
  L3_2 = L1_2
  L4_2 = A0_2
  L2_2(L3_2, L4_2)
end
L1_1(L2_1, L3_1)
L1_1 = RegisterNetEvent
L2_1 = "hospital:server:SetDeathStatus"
function L3_1(A0_2)
  local L1_2, L2_2, L3_2, L4_2
  L1_2 = source
  L2_2 = changeDeadStatus
  L3_2 = L1_2
  L4_2 = A0_2
  L2_2(L3_2, L4_2)
end
L1_1(L2_1, L3_1)
L1_1 = RegisterNetEvent
L2_1 = "hospital:server:SetLaststandStatus"
function L3_1(A0_2)
  local L1_2, L2_2, L3_2, L4_2
  L1_2 = source
  L2_2 = changeDeadStatus
  L3_2 = L1_2
  L4_2 = A0_2
  L2_2(L3_2, L4_2)
end
L1_1(L2_1, L3_1)
L1_1 = RegisterNetEvent
L2_1 = "wasabi_ambulance:setDeathStatus"
function L3_1(A0_2, A1_2)
  local L2_2, L3_2, L4_2, L5_2
  L2_2 = source
  if "dead" == A0_2 then
    L3_2 = true
    if L3_2 then
      goto lbl_8
      A0_2 = L3_2 or A0_2
    end
  end
  A0_2 = false
  ::lbl_8::
  L3_2 = changeDeadStatus
  L4_2 = L2_2
  L5_2 = A0_2
  L3_2(L4_2, L5_2)
end
L1_1(L2_1, L3_1)
L1_1 = RegisterNetEvent
L2_1 = "wais:setUnemployed"
function L3_1()
  local L0_2, L1_2, L2_2, L3_2, L4_2
  L0_2 = source
  L1_2 = ConfigSv
  L1_2 = L1_2.SetJob
  L2_2 = L0_2
  L3_2 = Config
  L3_2 = L3_2.Unemployed
  L3_2 = L3_2.job
  L4_2 = Config
  L4_2 = L4_2.Unemployed
  L4_2 = L4_2.grade
  L1_2(L2_2, L3_2, L4_2)
end
L1_1(L2_1, L3_1)
L1_1 = RegisterNetEvent
L2_1 = "wais:setJob"
function L3_1(A0_2)
  local L1_2, L2_2, L3_2, L4_2, L5_2, L6_2, L7_2
  L1_2 = source
  L2_2 = L0_1
  L2_2 = L2_2[A0_2]
  if nil == L2_2 then
    L2_2 = print
    L3_2 = "^1[IMPORTANT!] => ^3Player with [%s] ID tried to get a job that is not in the menu may be cheating ^0"
    L4_2 = L3_2
    L3_2 = L3_2.format
    L5_2 = L1_2
    L3_2, L4_2, L5_2, L6_2, L7_2 = L3_2(L4_2, L5_2)
    L2_2(L3_2, L4_2, L5_2, L6_2, L7_2)
    L2_2 = DropPlayer
    L3_2 = L1_2
    L4_2 = "Invalid Job"
    return L2_2(L3_2, L4_2)
  end
  L2_2 = ConfigSv
  L2_2 = L2_2.SetJob
  L3_2 = L1_2
  L4_2 = A0_2
  L5_2 = 0
  L2_2(L3_2, L4_2, L5_2)
  L2_2 = TriggerClientEvent
  L3_2 = "wais:showNotification"
  L4_2 = L1_2
  L5_2 = Lang
  L6_2 = "job_taked"
  L5_2 = L5_2(L6_2)
  L6_2 = "success"
  L7_2 = 5000
  L2_2(L3_2, L4_2, L5_2, L6_2, L7_2)
end
L1_1(L2_1, L3_1)
L1_1 = RegisterNetEvent
L2_1 = "wais:deleteItem"
function L3_1(A0_2, A1_2)
  local L2_2, L3_2, L4_2, L5_2, L6_2
  L2_2 = source
  L3_2 = ConfigSv
  L3_2 = L3_2.RemoveItem
  L4_2 = L2_2
  L5_2 = A0_2
  L6_2 = A1_2
  L3_2(L4_2, L5_2, L6_2)
end
L1_1(L2_1, L3_1)
function L1_1()
  local L0_2, L1_2, L2_2, L3_2, L4_2, L5_2, L6_2
  while true do
    L0_2 = Config
    if nil ~= L0_2 then
      break
    end
    L0_2 = Wait
    L1_2 = 10
    L0_2(L1_2)
  end
  L0_2 = pairs
  L1_2 = Config
  L1_2 = L1_2.Jobs
  L0_2, L1_2, L2_2, L3_2 = L0_2(L1_2)
  for L4_2, L5_2 in L0_2, L1_2, L2_2, L3_2 do
    L6_2 = L0_1
    L6_2[L4_2] = true
  end
  L0_2 = print
  L1_2 = "^2[INFO] => ^0Jobs are loaded successfully."
  L0_2(L1_2)
end
function L2_1(A0_2, A1_2)
  local L2_2, L3_2, L4_2, L5_2
  if nil ~= A1_2 then
    L2_2 = TriggerClientEvent
    L3_2 = "wais:change:deadstate"
    L4_2 = A0_2
    L5_2 = A1_2
    L2_2(L3_2, L4_2, L5_2)
  end
end
changeDeadStatus = L2_1
function L2_1(A0_2)
  local L1_2, L2_2, L3_2, L4_2, L5_2, L6_2
  L1_2 = promise
  L2_2 = L1_2
  L1_2 = L1_2.new
  L1_2 = L1_2(L2_2)
  L2_2 = pcall
  function L3_2()
    local L0_3, L1_3, L2_3
    L0_3 = exports
    L0_3 = L0_3.qbx_core
    L1_3 = L0_3
    L0_3 = L0_3.GetPlayer
    L2_3 = A0_2
    return L0_3(L1_3, L2_3)
  end
  L2_2, L3_2 = L2_2(L3_2)
  L5_2 = L1_2
  L4_2 = L1_2.resolve
  L6_2 = L3_2 or L6_2
  if not L2_2 or not L3_2 then
    L6_2 = nil
  end
  L4_2(L5_2, L6_2)
  L4_2 = Citizen
  L4_2 = L4_2.Await
  L5_2 = L1_2
  return L4_2(L5_2)
end
getPlayerFromQbx = L2_1
L2_1 = CreateThread
function L3_1()
  local L0_2, L1_2
  L0_2 = L1_1
  L0_2()
end
L2_1(L3_1)
L2_1 = GetInvokingResource
L2_1 = L2_1()
if not L2_1 then
  L2_1 = GetCurrentResourceName
  L2_1 = L2_1()
end
L3_1 = GetResourceMetadata
L4_1 = L2_1
L5_1 = "scriptname"
L6_1 = 0
L3_1 = L3_1(L4_1, L5_1, L6_1)
L4_1 = GetResourceMetadata
L5_1 = L2_1
L6_1 = "version"
L7_1 = 0
L4_1 = L4_1(L5_1, L6_1, L7_1)
L5_1 = SetTimeout
L6_1 = 1000
function L7_1()
  local L0_2, L1_2
  L0_2 = checkversion
  L0_2()
end
L5_1(L6_1, L7_1)
function L5_1()
  local L0_2, L1_2, L2_2, L3_2, L4_2, L5_2, L6_2
  L0_2 = PerformHttpRequest
  L1_2 = "https://ayazwai.dev/version"
  function L2_2(A0_3, A1_3, A2_3)
    local L3_3, L4_3, L5_3, L6_3, L7_3, L8_3, L9_3, L10_3, L11_3
    if nil ~= A1_3 then
      L3_3 = json
      L3_3 = L3_3.decode
      L4_3 = A1_3
      L3_3 = L3_3(L4_3)
      if 202 == A0_3 then
        L4_3 = print
        L5_3 = L3_3.message
        L4_3(L5_3)
        L4_3 = L3_3.havelog
        if L4_3 then
          L4_3 = pairs
          L5_3 = L3_3.changelogs
          L4_3, L5_3, L6_3, L7_3 = L4_3(L5_3)
          for L8_3, L9_3 in L4_3, L5_3, L6_3, L7_3 do
            L10_3 = print
            L11_3 = L9_3
            L10_3(L11_3)
          end
        end
      else
        L4_3 = print
        L5_3 = L3_3.message
        L4_3(L5_3)
      end
    else
      L3_3 = print
      L4_3 = "Could not check the script version..."
      L3_3(L4_3)
    end
  end
  L3_2 = "GET"
  L4_2 = ""
  L5_2 = {}
  L6_2 = L3_1
  L5_2["x-script"] = L6_2
  L6_2 = L4_1
  L5_2["x-version"] = L6_2
  L0_2(L1_2, L2_2, L3_2, L4_2, L5_2)
end
checkversion = L5_1