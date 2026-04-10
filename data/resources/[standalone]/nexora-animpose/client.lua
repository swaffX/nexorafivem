-- QB-Core kontrolü
local QBCore = nil

CreateThread(function()
    -- QB-Core'un yüklenmesini bekle
    local attempts = 0
    while attempts < 10 do
        attempts = attempts + 1
        local success, result = pcall(function()
            return exports['qb-core']:GetCoreObject()
        end)
        
        if success and result then
            QBCore = result
            print('[^2nexora-animpose^7] QB-Core başarıyla yüklendi!')
            break
        else
            print('[^3nexora-animpose^7] QB-Core bekleniyor... (' .. attempts .. '/10)')
            Wait(1000)
        end
    end
    
    if not QBCore then
        print('[^1nexora-animpose^7] QB-Core yüklenemedi! Script devre dışı.')
        return
    end
    
    print('[^2nexora-animpose^7] Script aktif! Komut: /' .. Config.Command)
end)

local isActive = false
local originalPos = nil
local originalHeading = nil
local moveSpeed = Config.MoveSpeed
local scaleform = nil

-- Scaleform (GTA native instructional buttons) oluştur
function CreateInstructionalScaleform()
    local scaleform = RequestScaleformMovie("instructional_buttons")
    
    while not HasScaleformMovieLoaded(scaleform) do
        Wait(0)
    end
    
    return scaleform
end

-- Instructional buttons güncelle
function UpdateInstructionalButtons()
    if not scaleform then
        scaleform = CreateInstructionalScaleform()
    end
    
    BeginScaleformMovieMethod(scaleform, "CLEAR_ALL")
    EndScaleformMovieMethod()
    
    BeginScaleformMovieMethod(scaleform, "SET_CLEAR_SPACE")
    ScaleformMovieMethodAddParamInt(200)
    EndScaleformMovieMethod()
    
    -- WASD - Hareket
    BeginScaleformMovieMethod(scaleform, "SET_DATA_SLOT")
    ScaleformMovieMethodAddParamInt(0)
    PushScaleformMovieMethodParameterButtonName("~INPUT_MOVE_UP_ONLY~")
    PushScaleformMovieMethodParameterString("İleri")
    EndScaleformMovieMethod()
    
    BeginScaleformMovieMethod(scaleform, "SET_DATA_SLOT")
    ScaleformMovieMethodAddParamInt(1)
    PushScaleformMovieMethodParameterButtonName("~INPUT_MOVE_DOWN_ONLY~")
    PushScaleformMovieMethodParameterString("Geri")
    EndScaleformMovieMethod()
    
    BeginScaleformMovieMethod(scaleform, "SET_DATA_SLOT")
    ScaleformMovieMethodAddParamInt(2)
    PushScaleformMovieMethodParameterButtonName("~INPUT_MOVE_LEFT_ONLY~")
    PushScaleformMovieMethodParameterString("Sol")
    EndScaleformMovieMethod()
    
    BeginScaleformMovieMethod(scaleform, "SET_DATA_SLOT")
    ScaleformMovieMethodAddParamInt(3)
    PushScaleformMovieMethodParameterButtonName("~INPUT_MOVE_RIGHT_ONLY~")
    PushScaleformMovieMethodParameterString("Sağ")
    EndScaleformMovieMethod()
    
    -- Arrow Up/Down - Yukarı/Aşağı
    BeginScaleformMovieMethod(scaleform, "SET_DATA_SLOT")
    ScaleformMovieMethodAddParamInt(4)
    PushScaleformMovieMethodParameterButtonName("~INPUT_CELLPHONE_UP~")
    PushScaleformMovieMethodParameterString("Yukarı")
    EndScaleformMovieMethod()
    
    BeginScaleformMovieMethod(scaleform, "SET_DATA_SLOT")
    ScaleformMovieMethodAddParamInt(5)
    PushScaleformMovieMethodParameterButtonName("~INPUT_CELLPHONE_DOWN~")
    PushScaleformMovieMethodParameterString("Aşağı")
    EndScaleformMovieMethod()
    
    -- E/Q - Dönme
    BeginScaleformMovieMethod(scaleform, "SET_DATA_SLOT")
    ScaleformMovieMethodAddParamInt(6)
    PushScaleformMovieMethodParameterButtonName("~INPUT_PICKUP~")
    PushScaleformMovieMethodParameterString("Sola Dön")
    EndScaleformMovieMethod()
    
    BeginScaleformMovieMethod(scaleform, "SET_DATA_SLOT")
    ScaleformMovieMethodAddParamInt(7)
    PushScaleformMovieMethodParameterButtonName("~INPUT_COVER~")
    PushScaleformMovieMethodParameterString("Sağa Dön")
    EndScaleformMovieMethod()
    
    -- Hız ayarı
    BeginScaleformMovieMethod(scaleform, "SET_DATA_SLOT")
    ScaleformMovieMethodAddParamInt(8)
    PushScaleformMovieMethodParameterButtonName("~INPUT_CELLPHONE_LEFT~")
    PushScaleformMovieMethodParameterString("Hız -")
    EndScaleformMovieMethod()
    
    BeginScaleformMovieMethod(scaleform, "SET_DATA_SLOT")
    ScaleformMovieMethodAddParamInt(9)
    PushScaleformMovieMethodParameterButtonName("~INPUT_CELLPHONE_RIGHT~")
    PushScaleformMovieMethodParameterString("Hız +")
    EndScaleformMovieMethod()
    
    -- Enter - Onayla
    BeginScaleformMovieMethod(scaleform, "SET_DATA_SLOT")
    ScaleformMovieMethodAddParamInt(10)
    PushScaleformMovieMethodParameterButtonName("~INPUT_FRONTEND_ACCEPT~")
    PushScaleformMovieMethodParameterString("Onayla")
    EndScaleformMovieMethod()
    
    -- X - İptal
    BeginScaleformMovieMethod(scaleform, "SET_DATA_SLOT")
    ScaleformMovieMethodAddParamInt(11)
    PushScaleformMovieMethodParameterButtonName("~INPUT_FRONTEND_CANCEL~")
    PushScaleformMovieMethodParameterString("İptal")
    EndScaleformMovieMethod()
    
    BeginScaleformMovieMethod(scaleform, "DRAW_INSTRUCTIONAL_BUTTONS")
    EndScaleformMovieMethod()
end

-- Kontrolleri devre dışı bırak
function DisableControls()
    DisableAllControlActions(0)
    
    -- Kamera ve chat
    EnableControlAction(0, 1, true)   -- Mouse Look LR
    EnableControlAction(0, 2, true)   -- Mouse Look UD
    EnableControlAction(0, 245, true) -- Chat
    EnableControlAction(0, 0, true)   -- Camera
    
    -- Animpose kontrolleri
    EnableControlAction(0, 32, true)  -- W
    EnableControlAction(0, 33, true)  -- S
    EnableControlAction(0, 34, true)  -- A
    EnableControlAction(0, 35, true)  -- D
    EnableControlAction(0, 172, true) -- Arrow Up
    EnableControlAction(0, 173, true) -- Arrow Down
    EnableControlAction(0, 174, true) -- Arrow Left
    EnableControlAction(0, 175, true) -- Arrow Right
    EnableControlAction(0, 38, true)  -- E
    EnableControlAction(0, 44, true)  -- Q
    EnableControlAction(0, 191, true) -- Enter
    EnableControlAction(0, 194, true) -- Backspace
end

-- Animpose başlat
function StartAnimpose()
    if isActive then
        QBCore.Functions.Notify(Config.Lang["already_active"], "error")
        return
    end
    
    local ped = PlayerPedId()
    originalPos = GetEntityCoords(ped)
    originalHeading = GetEntityHeading(ped)
    
    isActive = true
    moveSpeed = Config.MoveSpeed
    
    -- Emote'u koruma altına al
    if exports['rpemotes'] then
        pcall(function()
            exports['rpemotes']:CanCancelEmote(false)
        end)
    end
    
    -- Alpha ayarla (yarı saydam)
    SetEntityAlpha(ped, 200, false)
    
    -- Scaleform oluştur
    if not scaleform then
        scaleform = CreateInstructionalScaleform()
    end
    
    QBCore.Functions.Notify(Config.Lang["active"], "primary")
    
    -- Ana loop
    CreateThread(function()
        while isActive do
            local ped = PlayerPedId()
            local coords = GetEntityCoords(ped)
            local heading = GetEntityHeading(ped)
            local distance = #(coords - originalPos)
            
            -- Kontrolleri devre dışı bırak
            DisableControls()
            
            -- Instructional buttons çiz
            UpdateInstructionalButtons()
            DrawScaleformMovieFullscreen(scaleform, 255, 255, 255, 255, 0)
            
            -- Mesafe kontrolü
            if distance > Config.MaxDistance then
                QBCore.Functions.Notify(Config.Lang["too_far"], "error")
                StopAnimpose(true)
                break
            end
            
            -- Hareket yönleri
            local rad = math.rad(heading)
            local forward = vector3(-math.sin(rad), math.cos(rad), 0)
            local right = vector3(math.cos(rad), math.sin(rad), 0)
            
            -- W - İleri
            if IsDisabledControlPressed(0, 32) then
                local newPos = coords + forward * moveSpeed
                SetEntityCoordsNoOffset(ped, newPos.x, newPos.y, newPos.z, false, false, false)
                TriggerServerEvent('nexora-animpose:sync', newPos, heading, 200)
            end
            
            -- S - Geri
            if IsDisabledControlPressed(0, 33) then
                local newPos = coords - forward * moveSpeed
                SetEntityCoordsNoOffset(ped, newPos.x, newPos.y, newPos.z, false, false, false)
                TriggerServerEvent('nexora-animpose:sync', newPos, heading, 200)
            end
            
            -- A - Sol
            if IsDisabledControlPressed(0, 34) then
                local newPos = coords - right * moveSpeed
                SetEntityCoordsNoOffset(ped, newPos.x, newPos.y, newPos.z, false, false, false)
                TriggerServerEvent('nexora-animpose:sync', newPos, heading, 200)
            end
            
            -- D - Sağ
            if IsDisabledControlPressed(0, 35) then
                local newPos = coords + right * moveSpeed
                SetEntityCoordsNoOffset(ped, newPos.x, newPos.y, newPos.z, false, false, false)
                TriggerServerEvent('nexora-animpose:sync', newPos, heading, 200)
            end
            
            -- Arrow Up - Yukarı
            if IsDisabledControlPressed(0, 172) then
                local newPos = vector3(coords.x, coords.y, coords.z + moveSpeed)
                SetEntityCoordsNoOffset(ped, newPos.x, newPos.y, newPos.z, false, false, false)
                TriggerServerEvent('nexora-animpose:sync', newPos, heading, 200)
            end
            
            -- Arrow Down - Aşağı
            if IsDisabledControlPressed(0, 173) then
                local newPos = vector3(coords.x, coords.y, coords.z - moveSpeed)
                SetEntityCoordsNoOffset(ped, newPos.x, newPos.y, newPos.z, false, false, false)
                TriggerServerEvent('nexora-animpose:sync', newPos, heading, 200)
            end
            
            -- E - Sola dön
            if IsDisabledControlPressed(0, 38) then
                local newHeading = heading - (moveSpeed * 100)
                SetEntityHeading(ped, newHeading)
                TriggerServerEvent('nexora-animpose:sync', coords, newHeading, 200)
            end
            
            -- Q - Sağa dön
            if IsDisabledControlPressed(0, 44) then
                local newHeading = heading + (moveSpeed * 100)
                SetEntityHeading(ped, newHeading)
                TriggerServerEvent('nexora-animpose:sync', coords, newHeading, 200)
            end
            
            -- Arrow Left - Hız azalt
            if IsDisabledControlJustPressed(0, 174) then
                moveSpeed = math.max(moveSpeed - Config.SpeedStep, Config.MinSpeed)
            end
            
            -- Arrow Right - Hız arttır
            if IsDisabledControlJustPressed(0, 175) then
                moveSpeed = math.min(moveSpeed + Config.SpeedStep, Config.MaxSpeed)
            end
            
            -- Enter - Onayla
            if IsDisabledControlJustPressed(0, 191) then
                StopAnimpose(false)
                QBCore.Functions.Notify(Config.Lang["confirmed"], "success")
                break
            end
            
            -- Backspace/X - İptal
            if IsDisabledControlJustPressed(0, 194) then
                StopAnimpose(true)
                QBCore.Functions.Notify(Config.Lang["cancelled"], "error")
                break
            end
            
            Wait(0)
        end
    end)
end

-- Animpose durdur
function StopAnimpose(reset)
    if not isActive then return end
    
    local ped = PlayerPedId()
    
    if reset then
        -- Orijinal pozisyona dön
        SetEntityCoordsNoOffset(ped, originalPos.x, originalPos.y, originalPos.z, false, false, false)
        SetEntityHeading(ped, originalHeading)
        TriggerServerEvent('nexora-animpose:sync', originalPos, originalHeading, 0)
    else
        -- Mevcut pozisyonda kal
        local coords = GetEntityCoords(ped)
        local heading = GetEntityHeading(ped)
        TriggerServerEvent('nexora-animpose:sync', coords, heading, 0)
    end
    
    -- Alpha'yı normale döndür
    ResetEntityAlpha(ped)
    
    -- Emote'u tekrar iptal edilebilir yap
    if exports['rpemotes'] then
        pcall(function()
            exports['rpemotes']:CanCancelEmote(true)
        end)
    end
    
    isActive = false
    EnableAllControlActions(0)
end

-- Komut kaydet
RegisterCommand(Config.Command, function()
    StartAnimpose()
end, false)

-- Sync event
RegisterNetEvent('nexora-animpose:syncClient', function(targetId, coords, heading, alpha)
    local targetPed = GetPlayerPed(GetPlayerFromServerId(targetId))
    
    if targetPed == PlayerPedId() then return end
    if not DoesEntityExist(targetPed) then return end
    
    SetEntityCoordsNoOffset(targetPed, coords.x, coords.y, coords.z, false, false, false)
    
    if heading then
        SetEntityHeading(targetPed, heading)
    end
    
    if alpha and alpha > 0 then
        SetEntityAlpha(targetPed, alpha, false)
    else
        ResetEntityAlpha(targetPed)
    end
end)

-- Cleanup
AddEventHandler('onResourceStop', function(resourceName)
    if GetCurrentResourceName() ~= resourceName then return end
    
    if isActive then
        StopAnimpose(true)
    end
    
    if scaleform then
        SetScaleformMovieAsNoLongerNeeded(scaleform)
    end
end)
