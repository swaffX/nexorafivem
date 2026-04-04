function CustomSpawn(isNew, lastcoords)
    if isNew then
        SetupPlayer(lastcoords)
        return false
    end

    if GetResourceState('um-spawn') == 'started' then
        exports['um-spawn']:UMSpawnStart(lastcoords)
        Debug('Spawn um-spawn is started, using um-spawn')
        return true
    elseif GetResourceState('okokSpawnSelector') == 'started' then
        TriggerEvent('okokSpawnSelector:spawnMenu', false, lastcoords)
        Debug('Spawn okokSpawnSelector is started, using okokSpawnSelector')
        return true
    elseif GetResourceState('vms_spawnselector') == 'started' then
        exports['vms_spawnselector']:OpenSpawnSelector()
        Debug('Spawn vms_spawnselector is started, using vms_spawnselector')
        return true
    else
        SetupPlayer(lastcoords)
        Debug('Spawn none of the spawn resources are started, using default spawn')
        return false
    end
end
