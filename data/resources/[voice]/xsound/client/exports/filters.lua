-- xSound Audio Filter Exports
-- Web Audio API ile gerçek filtre desteği

function setFilter(name, filterType, frequency, Q, gain)
    if not soundExists(name) then
        return false
    end
    
    SendNUIMessage({
        status = "setFilter",
        name = name,
        filterType = filterType,
        frequency = frequency,
        Q = Q,
        gain = gain
    })
    
    return true
end

exports('setFilter', setFilter)

function clearFilter(name, filterType)
    if not soundExists(name) then
        return false
    end
    
    SendNUIMessage({
        status = "clearFilter",
        name = name,
        filterType = filterType
    })
    
    return true
end

exports('clearFilter', clearFilter)

function clearAllFilters(name)
    if not soundExists(name) then
        return false
    end
    
    SendNUIMessage({
        status = "clearAllFilters",
        name = name
    })
    
    return true
end

exports('clearAllFilters', clearAllFilters)
