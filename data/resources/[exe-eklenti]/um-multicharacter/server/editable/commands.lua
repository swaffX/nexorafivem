if Config.Relog.Status then
    lib.addCommand(Config.Relog.Command, { help = 'Relog Character' }, function(source)
        local src = source
        local checkPlayerDead = lib.callback.await('um-multicharacter:callback:checkPlayerDead', src)
        if checkPlayerDead then return end
        TriggerEvent('esx:playerLogout', src)
        TriggerClientEvent('um-multicharacter:client:chooseChar', src)
    end)
end

lib.addCommand('getbucketCheck', { help = 'Get Bucket Check', restricted = 'group.admin' }, function(source)
    local src = source
    local bucket = GetPlayerRoutingBucket(tostring(src))
    Debug('Bucket ' .. tostring(src) .. ' - ' .. bucket .. '')
end)
