local QBCore = exports['qb-core']:GetCoreObject()
local PlayerData = {}

-- Durum degiskenleri
local isUIOpen        = false
local activeRepairJob = nil   -- { vehicle, vehicleNet, parts = {id, label, price, completed}, pendingIdx }
local pendingFis      = nil   -- musteri icin bekleyen fis

-- ===================== YARDIMCI FONKSIYONLAR =====================

local function IsMechanic()
    if not PlayerData.job then return false end
    for _, j in ipairs(Config.MechanicJobs) do
        if PlayerData.job.name == j then return true end
    end
    return false
end

local function GetVehicleName(veh)
    return GetLabelText(GetDisplayNameFromVehicleModel(GetEntityModel(veh)))
end

local function GetClosestVehicle()
    local ped   = PlayerPedId()
    local pos   = GetEntityCoords(ped)
    local veh   = GetClosestVehicle(pos.x, pos.y, pos.z, Config.ScanVehicleDistance, 0, 70)
    if DoesEntityExist(veh) and veh ~= 0 then return veh end
    return nil
end

local function GetClosestPlayer()
    local ped   = PlayerPedId()
    local pos   = GetEntityCoords(ped)
    local best  = nil
    local bestD = Config.ScanPlayerDistance

    for _, pid in ipairs(GetActivePlayers()) do
        if pid ~= PlayerId() then
            local pPed = GetPlayerPed(pid)
            local d    = #(pos - GetEntityCoords(pPed))
            if d < bestD then
                bestD = d
                best  = pid
            end
        end
    end
    return best
end

-- Araca gore parca pozisyonu hesapla
local function GetPartPosition(vehicle, partId)
    local offsets = {
        engine   = vector3(0.0,  2.5,  0.0),
        bonnet   = vector3(0.0,  2.5,  0.3),
        boot     = vector3(0.0, -2.8,  0.0),
        body     = vector3(-1.8, 0.0,  0.0),
        wheel_lf = vector3(-1.5,  1.8, -0.4),
        wheel_rf = vector3( 1.5,  1.8, -0.4),
        wheel_lr = vector3(-1.5, -1.4, -0.4),
        wheel_rr = vector3( 1.5, -1.4, -0.4),
    }
    local off = offsets[partId] or vector3(0, 0, 0)
    return GetOffsetFromEntityInWorldCoords(vehicle, off.x, off.y, off.z)
end

-- Arac hasar bilgisi
local function GetDamageInfo(vehicle)
    return {
        engine   = math.floor(math.max(0, 1 - GetVehicleEngineHealth(vehicle) / 1000) * 100),
        body     = math.floor(math.max(0, 1 - GetVehicleBodyHealth(vehicle)  / 1000) * 100),
        bonnet   = GetVehicleDoorDamageStatus(vehicle, 4) > 0 and 70 or 0,
        boot     = GetVehicleDoorDamageStatus(vehicle, 5) > 0 and 60 or 0,
        wheel_lf = IsVehicleTyreBurst(vehicle, 0, false) and 100 or 0,
        wheel_rf = IsVehicleTyreBurst(vehicle, 1, false) and 100 or 0,
        wheel_lr = IsVehicleTyreBurst(vehicle, 2, false) and 100 or 0,
        wheel_rr = IsVehicleTyreBurst(vehicle, 3, false) and 100 or 0,
    }
end

-- ===================== PLAYER DATA =====================

RegisterNetEvent('QBCore:Client:OnPlayerLoaded', function()
    PlayerData = QBCore.Functions.GetPlayerData()
end)

RegisterNetEvent('QBCore:Player:SetPlayerData', function(val)
    PlayerData = val
end)

-- ===================== BILDIRIM =====================

RegisterNetEvent('swx_mekanik:client:notify', function(msg, t)
    lib.notify({ title = 'Mekanik', description = msg, type = t or 'info' })
end)

-- ===================== MEKANIK KOMUTU =====================

RegisterCommand('mekanik', function()
    if not IsMechanic() then
        lib.notify({ title = 'Hata', description = 'Bu komutu kullanma yetkiniz yok!', type = 'error' })
        return
    end

    if isUIOpen or activeRepairJob then
        lib.notify({ title = 'Bilgi', description = 'Zaten aktif bir islem var!', type = 'warning' })
        return
    end

    local vehicle = GetClosestVehicle()
    if not vehicle then
        lib.notify({ title = 'Hata', description = 'Yakin araç bulunamadi (12m)!', type = 'error' })
        return
    end

    local closestPlayer = GetClosestPlayer()
    local targetServerId = closestPlayer and GetPlayerServerId(closestPlayer) or -1

    local damage = GetDamageInfo(vehicle)

    -- NUI'yi ac
    isUIOpen = true
    SetNuiFocus(true, true)
    SendNUIMessage({
        action       = 'open',
        parts        = Config.Parts,
        vehicleName  = GetVehicleName(vehicle),
        damage       = damage,
        vehicleNet   = NetworkGetNetworkIdFromEntity(vehicle),
        targetId     = targetServerId,
    })
end, false)

-- ===================== NUI CALLBACKS =====================

RegisterNUICallback('close', function(_, cb)
    isUIOpen = false
    SetNuiFocus(false, false)
    cb({})
end)

RegisterNUICallback('sendFis', function(data, cb)
    isUIOpen = false
    SetNuiFocus(false, false)

    if data.targetId == -1 then
        lib.notify({ title = 'Hata', description = 'Yakin musteri bulunamadi!', type = 'error' })
        cb({})
        return
    end

    TriggerServerEvent('swx_mekanik:server:sendFis', {
        targetId   = data.targetId,
        parts      = data.parts,
        total      = data.total,
        vehicleNet = data.vehicleNet,
    })
    cb({})
end)

-- ===================== MUSTERI: FIS ALINDI =====================

RegisterNetEvent('swx_mekanik:client:receiveFis', function(fisData)
    pendingFis = fisData

    -- Parcalari listele
    local partList = ''
    for _, p in ipairs(fisData.parts) do
        partList = partList .. '\n• ' .. p.label .. ' — $' .. p.price
    end

    local result = lib.alertDialog({
        header  = '🔧 Mekanik Fisi - ' .. fisData.mechanicName,
        content = 'Asagidaki tamirler icin **$' .. fisData.total .. '** odemeniz isteniyor:\n' .. partList,
        labels  = { confirm = 'Kabul Et', cancel = 'Reddet' }
    })

    if result == 'confirm' then
        TriggerServerEvent('swx_mekanik:server:acceptFis', {
            mechanicId = fisData.mechanicId,
            parts      = fisData.parts,
            total      = fisData.total,
            vehicleNet = fisData.vehicleNet,
        })
    else
        TriggerServerEvent('swx_mekanik:server:rejectFis', {
            mechanicId = fisData.mechanicId,
        })
    end
    pendingFis = nil
end)

-- ===================== MEKANIK: ONAY GELDI =====================

RegisterNetEvent('swx_mekanik:client:repairAccepted', function(data)
    lib.notify({ title = 'Mekanik', description = data.customerName .. ' kabul etti! $' .. data.total .. ' kazanildi. Tamire baslayin!', type = 'success' })

    -- Arac entitysini bul
    local vehicle = NetworkGetEntityFromNetworkId(data.vehicleNet)
    if not DoesEntityExist(vehicle) then
        lib.notify({ title = 'Hata', description = 'Arac bulunamadi!', type = 'error' })
        return
    end

    -- Aktif tamir is yukleri
    local parts = {}
    for _, p in ipairs(data.parts) do
        parts[#parts + 1] = {
            id        = p.id,
            label     = p.label,
            price     = p.price,
            completed = false
        }
    end

    activeRepairJob = {
        vehicle    = vehicle,
        vehicleNet = data.vehicleNet,
        parts      = parts,
    }
end)

RegisterNetEvent('swx_mekanik:client:repairRejected', function(playerName)
    lib.notify({ title = 'Mekanik', description = playerName .. ' fisi reddetti!', type = 'error' })
end)

-- ===================== TAMIR ZONE THREAD =====================

local isRepairing = false

Citizen.CreateThread(function()
    while true do
        Citizen.Wait(0)

        if not activeRepairJob then
            Citizen.Wait(500)
        else
            local ped    = PlayerPedId()
            local pedPos = GetEntityCoords(ped)
            local job    = activeRepairJob
            local shown  = false

            -- Tum parcalari ciz
            for i, part in ipairs(job.parts) do
                if not part.completed then
                    local partPos = GetPartPosition(job.vehicle, part.id)

                    -- Marker ciz
                    local mc = Config.MarkerPending
                    DrawMarker(21, partPos.x, partPos.y, partPos.z + 0.1,
                        0, 0, 0, 0, 0, 0,
                        0.5, 0.5, 0.3,
                        mc.r, mc.g, mc.b, mc.a,
                        false, false, 2, nil, nil, false)

                    -- Mesafe kontrolu
                    local dist = #(pedPos - partPos)
                    if dist < Config.InteractDistance and not isRepairing and not shown then
                        shown = true
                        lib.showTextUI('[E] ' .. part.label .. ' Onar', { position = 'top-center' })

                        if IsControlJustPressed(0, 38) then -- E key
                            lib.hideTextUI()
                            isRepairing = true

                            -- Animasyon
                            RequestAnimDict(Config.RepairAnim.dict)
                            while not HasAnimDictLoaded(Config.RepairAnim.dict) do Citizen.Wait(100) end
                            TaskPlayAnim(ped, Config.RepairAnim.dict, Config.RepairAnim.anim, 8.0, -8.0, -1, 1, 0, false, false, false)

                            -- Progress bar
                            local success = lib.progressBar({
                                duration = Config.RepairDuration,
                                label    = part.label .. ' tamiriyle ilgileniliyor...',
                                useWhileDead  = false,
                                canCancel     = false,
                                disable = { move = true, car = true, combat = true },
                                anim = {
                                    dict = Config.RepairAnim.dict,
                                    clip = Config.RepairAnim.anim,
                                },
                            })

                            ClearPedTasks(ped)
                            isRepairing = false

                            if success then
                                part.completed = true
                                lib.notify({ title = 'Mekanik', description = part.label .. ' tamiri tamamlandi!', type = 'success' })

                                -- Tum parcalar bitti mi?
                                local allDone = true
                                for _, p in ipairs(job.parts) do
                                    if not p.completed then allDone = false break end
                                end

                                if allDone then
                                    TriggerServerEvent('swx_mekanik:server:applyRepairs', {
                                        vehicleNet = job.vehicleNet,
                                        parts      = job.parts,
                                    })
                                    activeRepairJob = nil
                                end
                            end
                        end
                    end
                else
                    -- Tamamlanan parcalari yesil goster
                    local partPos = GetPartPosition(job.vehicle, part.id)
                    local mc = Config.MarkerCompleted
                    DrawMarker(21, partPos.x, partPos.y, partPos.z + 0.1,
                        0, 0, 0, 0, 0, 0,
                        0.5, 0.5, 0.3,
                        mc.r, mc.g, mc.b, mc.a,
                        false, false, 2, nil, nil, false)
                end
            end

            if not shown then lib.hideTextUI() end
        end
    end
end)

-- ===================== ARAC SAHIBI: TAMIRI UYGULA =====================

RegisterNetEvent('swx_mekanik:client:applyRepairs', function(data)
    local vehicle = NetworkGetEntityFromNetworkId(data.vehicleNet)
    if not DoesEntityExist(vehicle) then return end

    for _, part in ipairs(data.parts) do
        if part.id == 'engine' then
            SetVehicleEngineHealth(vehicle, 1000.0)
        elseif part.id == 'body' then
            SetVehicleBodyHealth(vehicle, 1000.0)
            SetVehicleDeformationFixed(vehicle)
        elseif part.id == 'bonnet' then
            SetVehicleDoorFixed(vehicle, 4)
        elseif part.id == 'boot' then
            SetVehicleDoorFixed(vehicle, 5)
        elseif part.id == 'wheel_lf' then
            SetVehicleTyreFixed(vehicle, 0)
        elseif part.id == 'wheel_rf' then
            SetVehicleTyreFixed(vehicle, 1)
        elseif part.id == 'wheel_lr' then
            SetVehicleTyreFixed(vehicle, 2)
        elseif part.id == 'wheel_rr' then
            SetVehicleTyreFixed(vehicle, 3)
        end
    end

    lib.notify({ title = 'Mekanik', description = 'Aracinizin tamiri tamamlandi!', type = 'success' })
end)
