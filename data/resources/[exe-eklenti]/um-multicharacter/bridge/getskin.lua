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

    local skinQuery = MySQL.single.await('SELECT skin FROM users WHERE identifier = ? LIMIT 1',
        { identifier })

    if skinQuery ~= nil then
        local skin = json.decode(skinQuery.skin)
        return skin?.sex or skin?.model, skin
    end

    return nil, nil
end)
