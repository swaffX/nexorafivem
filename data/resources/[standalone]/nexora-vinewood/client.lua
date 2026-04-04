local QBCore = nil
local currentText = Config.DefaultText

-- Framework yükle
if Config.Framework == 'qbcore' then
    QBCore = exports['qb-core']:GetCoreObject()
end

-- Sunucudan yazıyı al
RegisterNetEvent('nexora-vinewood:client:updateText', function(text)
    currentText = text or Config.DefaultText
    UpdateVinewoodSign(currentText)
end)

-- Vinewood yazısını güncelle
function UpdateVinewoodSign(text)
    text = string.upper(text)
    
    -- Yazıyı 8 karaktere tamamla (boşluk ile)
    while #text < 8 do
        text = text .. ' '
    end
    
    -- Her harfi güncelle
    for i = 1, #Config.Letters do
        local letter = string.sub(text, i, i)
        local letterData = Config.Letters[i]
        
        -- Eğer boşluk ise harfi gizle, değilse göster
        if letter == ' ' then
            -- Burada 3D text yerine scaleform kullanabiliriz
            -- Şimdilik basit bir çözüm
        end
    end
    
    print('^2[Nexora Vinewood]^0 Yazı güncellendi: ' .. text)
end

-- Komut
RegisterCommand(Config.Command, function()
    -- Yetki kontrolü sunucu tarafında yapılacak
    -- Input al
    local input = lib.inputDialog('Vinewood Yazısı', {
        {
            type = 'input',
            label = Config.Locale['enter_text'],
            description = Config.Locale['current_text']:format(currentText),
            required = true,
            max = Config.MaxLength
        }
    })
    
    if input and input[1] then
        local newText = input[1]
        
        if #newText > Config.MaxLength then
            if Config.Framework == 'qbcore' and QBCore then
                QBCore.Functions.Notify(Config.Locale['invalid_length'], 'error')
            end
            return
        end
        
        -- Sunucuya gönder (yetki kontrolü orada yapılacak)
        TriggerServerEvent('nexora-vinewood:server:changeText', newText)
    end
end)

-- Oyun başladığında yazıyı yükle
CreateThread(function()
    Wait(2000)
    TriggerServerEvent('nexora-vinewood:server:requestText')
end)

-- 3D Text çizimi (her frame)
CreateThread(function()
    while true do
        Wait(0)
        
        local playerCoords = GetEntityCoords(PlayerPedId())
        local distance = #(playerCoords - vector3(720.0, 1190.0, 326.0))
        
        -- Eğer oyuncu yakınsa yazıyı çiz
        if distance < 500.0 then
            for i = 1, #Config.Letters do
                local letter = string.sub(currentText, i, i)
                local letterData = Config.Letters[i]
                
                if letter ~= ' ' then
                    -- 3D text çiz
                    DrawText3D(letterData.coords.x, letterData.coords.y, letterData.coords.z, letter, 10.0)
                end
            end
        else
            Wait(1000)
        end
    end
end)

-- 3D Text fonksiyonu
function DrawText3D(x, y, z, text, scale)
    local onScreen, _x, _y = World3dToScreen2d(x, y, z)
    local px, py, pz = table.unpack(GetGameplayCamCoords())
    local dist = #(vector3(px, py, pz) - vector3(x, y, z))
    
    scale = scale or 1
    scale = scale * (1 / dist) * 2
    local fov = (1 / GetGameplayCamFov()) * 100
    scale = scale * fov
    
    if onScreen then
        SetTextScale(0.0 * scale, 0.55 * scale)
        SetTextFont(4)
        SetTextProportional(1)
        SetTextColour(255, 255, 255, 255)
        SetTextDropshadow(0, 0, 0, 0, 255)
        SetTextEdge(2, 0, 0, 0, 150)
        SetTextDropShadow()
        SetTextOutline()
        SetTextEntry("STRING")
        SetTextCentre(1)
        AddTextComponentString(text)
        DrawText(_x, _y)
    end
end
