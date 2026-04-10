-- Server tarafında handling hash kontrolü
AddEventHandler('entityCreated', function(entity)
    if not Config.ApplyOnSpawn then return end
    
    if entity and DoesEntityExist(entity) then
        local entityType = GetEntityType(entity)
        if entityType == 2 then -- Araç
            local model = GetEntityModel(entity)
            local modelName = GetDisplayNameFromVehicleModel(model):lower()
            
            if Config.ForcedHandling[modelName] then
                -- Client'a handling uygulaması için bildir
                local netId = NetworkGetNetworkIdFromEntity(entity)
                TriggerClientEvent('swx_handlingfix:apply', -1, netId, modelName)
                print('[SWX-HandlingFix] Handling uygulandı:', modelName, 'NetID:', netId)
            end
        end
    end
end)

print('[SWX-HandlingFix] Server yüklendi!')
