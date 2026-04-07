lib.callback.register("um-multicharacter:server:getSkin", function(_, identifier)
    if GetResourceState('bl_appearance') == 'started' then
        local appearance = exports.bl_appearance:GetPlayerAppearance(identifier)

        if not appearance then
            return nil, nil
        end

        return appearance.model, appearance
    end

    if GetResourceState('rcore_clothing') == 'started' then
        local skin = exports.rcore_clothing:getSkinByIdentifier(identifier)
        if not skin then
            return nil, nil
        end
        return skin.ped_model or skin.sex, skin.skin
    end

    -- Auto-detect framework for skin query
    local frameworkType = Framework:GetType()
    
    if frameworkType == 'qbcore' then
        -- QBCore uses playerskins table with citizenid
        local skinQuery = MySQL.single.await('SELECT model, skin FROM playerskins WHERE citizenid = ? AND active = 1 LIMIT 1',
            { identifier })

        if skinQuery ~= nil then
            local skin = json.decode(skinQuery.skin)
            return skinQuery.model or skin?.model, skin
        end
    elseif frameworkType == 'esx' then
        -- ESX uses users table with identifier
        local skinQuery = MySQL.single.await('SELECT skin FROM users WHERE identifier = ? LIMIT 1',
            { identifier })

        if skinQuery ~= nil then
            local skin = json.decode(skinQuery.skin)
            return skin?.sex or skin?.model, skin
        end
    end

    return nil, nil
end)
