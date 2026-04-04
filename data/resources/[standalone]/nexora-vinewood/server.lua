local QBCore = nil
local currentText = Config.DefaultText

-- Framework yükle
if Config.Framework == 'qbcore' then
    QBCore = exports['qb-core']:GetCoreObject()
end

-- Yazıyı değiştir
RegisterNetEvent('nexora-vinewood:server:changeText', function(text)
    local src = source
    
    -- Yetki kontrolü
    if Config.Framework == 'qbcore' and QBCore then
        local Player = QBCore.Functions.GetPlayer(src)
        if not Player then return end
        
        local hasPermission = false
        
        -- Yetki kontrolü
        for _, group in ipairs(Config.AuthorizedGroups) do
            if Player.PlayerData.job.name == group or (Player.PlayerData.gang and Player.PlayerData.gang.name == group) then
                hasPermission = true
                break
            end
        end
        
        -- Admin kontrolü
        if QBCore.Functions.HasPermission(src, 'admin') or QBCore.Functions.HasPermission(src, 'god') then
            hasPermission = true
        end
        
        if not hasPermission then
            TriggerClientEvent('QBCore:Notify', src, Config.Locale['no_permission'], 'error')
            return
        end
    end
    
    -- Yazıyı güncelle
    if text and #text <= Config.MaxLength then
        currentText = string.upper(text)
        
        -- Tüm oyunculara gönder
        TriggerClientEvent('nexora-vinewood:client:updateText', -1, currentText)
        
        -- Log
        print('^2[Nexora Vinewood]^0 ' .. GetPlayerName(src) .. ' yazıyı değiştirdi: ' .. currentText)
        
        -- Bildirim
        if Config.Framework == 'qbcore' and QBCore then
            TriggerClientEvent('QBCore:Notify', src, Config.Locale['text_changed']:format(currentText), 'success')
        end
    else
        if Config.Framework == 'qbcore' and QBCore then
            TriggerClientEvent('QBCore:Notify', src, Config.Locale['invalid_length'], 'error')
        end
    end
end)

-- Yazıyı talep et
RegisterNetEvent('nexora-vinewood:server:requestText', function()
    local src = source
    TriggerClientEvent('nexora-vinewood:client:updateText', src, currentText)
end)

-- Yazıyı sıfırla (admin komutu)
RegisterCommand('vinewood_reset', function(source, args, rawCommand)
    local src = source
    
    if Config.Framework == 'qbcore' and QBCore then
        if not QBCore.Functions.HasPermission(src, 'admin') and not QBCore.Functions.HasPermission(src, 'god') then
            TriggerClientEvent('QBCore:Notify', src, Config.Locale['no_permission'], 'error')
            return
        end
    end
    
    currentText = Config.DefaultText
    TriggerClientEvent('nexora-vinewood:client:updateText', -1, currentText)
    
    print('^2[Nexora Vinewood]^0 Yazı sıfırlandı: ' .. currentText)
    
    if Config.Framework == 'qbcore' and QBCore then
        TriggerClientEvent('QBCore:Notify', src, Config.Locale['text_reset'], 'success')
    end
end, false)
