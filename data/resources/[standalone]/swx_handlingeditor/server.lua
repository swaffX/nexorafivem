local QBCore = exports['qb-core']:GetCoreObject()
local handlingData = {}

-- Admin kontrolü
local function IsAdmin(src)
    if IsPlayerAceAllowed(src, Config.AcePermission) then
        return true
    end
    local Player = QBCore.Functions.GetPlayer(src)
    if Player then
        return Config.AdminGroups[Player.PlayerData.group] or false
    end
    return false
end

-- JSON'dan yükle
local function LoadFromJson()
    local file = LoadResourceFile(GetCurrentResourceName(), Config.JsonPath)
    if file then
        handlingData = json.decode(file) or {}
        print('[SWX-HandlingEditor] JSON\'den', #handlingData, 'araç yüklendi')
    else
        handlingData = {}
    end
end

-- JSON'a kaydet
local function SaveToJson()
    local file = json.encode(handlingData)
    SaveResourceFile(GetCurrentResourceName(), Config.JsonPath, file, -1)
end

-- MySQL'den yükle
local function LoadFromMySQL()
    MySQL.query('SELECT * FROM vehicle_handling', {}, function(result)
        if result then
            for _, row in ipairs(result) do
                handlingData[row.model] = json.decode(row.handling)
            end
            print('[SWX-HandlingEditor] MySQL\'den', #result, 'araç yüklendi')
        end
    end)
end

-- MySQL'e kaydet
local function SaveToMySQL(model, data)
    MySQL.insert('INSERT INTO vehicle_handling (model, handling) VALUES (?, ?) ON DUPLICATE KEY UPDATE handling = ?',
        {model, json.encode(data), json.encode(data)})
end

-- Veritabanı tablosu oluştur
local function CreateTable()
    MySQL.query([[CREATE TABLE IF NOT EXISTS vehicle_handling (
        model VARCHAR(50) PRIMARY KEY,
        handling TEXT,
        updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
    )]], {})
end

-- Başlangıçta yükle
Citizen.CreateThread(function()
    if Config.Storage == 'json' then
        LoadFromJson()
    elseif Config.Storage == 'mysql' then
        CreateTable()
        LoadFromMySQL()
    end
end)

-- Callback: Handling verilerini al
lib.callback.register('swx_handlingeditor:getHandling', function(source, model)
    return handlingData[model]
end)

-- Callback: Tüm handlingleri al
lib.callback.register('swx_handlingeditor:getAllHandling', function(source)
    return handlingData
end)

-- Event: Handling kaydet
RegisterNetEvent('swx_handlingeditor:save', function(model, data)
    local src = source
    if not IsAdmin(src) then
        TriggerClientEvent('ox_lib:notify', src, {type = 'error', description = 'Yetkiniz yok!'})
        return
    end
    
    handlingData[model] = data
    
    if Config.Storage == 'json' then
        SaveToJson()
    elseif Config.Storage == 'mysql' then
        SaveToMySQL(model, data)
    end
    
    -- Tüm clientlara bildir
    TriggerClientEvent('swx_handlingeditor:updated', -1, model, data)
    TriggerClientEvent('ox_lib:notify', src, {type = 'success', description = model .. ' handling kaydedildi!'})
    
    print('[SWX-HandlingEditor] Kaydedildi:', model)
end)

-- Event: Handling sil
RegisterNetEvent('swx_handlingeditor:delete', function(model)
    local src = source
    if not IsAdmin(src) then return end
    
    handlingData[model] = nil
    
    if Config.Storage == 'json' then
        SaveToJson()
    elseif Config.Storage == 'mysql' then
        MySQL.query('DELETE FROM vehicle_handling WHERE model = ?', {model})
    end
    
    TriggerClientEvent('ox_lib:notify', src, {type = 'success', description = model .. ' silindi!'})
end)

-- Araç spawn olduğunda handling uygula
AddEventHandler('entityCreated', function(entity)
    if not Config.AutoApply then return end
    
    if entity and DoesEntityExist(entity) then
        local entityType = GetEntityType(entity)
        if entityType == 2 then
            local model = GetEntityModel(entity)
            local modelName = GetDisplayNameFromVehicleModel(model):lower()
            
            if handlingData[modelName] then
                local netId = NetworkGetNetworkIdFromEntity(entity)
                TriggerClientEvent('swx_handlingeditor:apply', -1, netId, handlingData[modelName])
            end
        end
    end
end)

print('[SWX-HandlingEditor] Server yüklendi!')
