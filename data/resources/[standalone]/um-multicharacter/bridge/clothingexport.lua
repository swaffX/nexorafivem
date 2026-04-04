function ClothingExports(skinData)
    if GetResourceState('rcore_clothing') == 'started' then
        exports.rcore_clothing:setPedSkin(PlayerPedId(), skinData)
        Debug('rcore_clothing loaded')
    elseif GetResourceState('crm-appearance') == 'started' then
        exports['crm-appearance']:crm_set_ped_appearance(PlayerPedId(), skinData)
        Debug('crm-appearance loaded')
    elseif GetResourceState('bl_appearance') == 'started' then
        TriggerEvent('skinchanger:loadSkin', skinData)
        Debug('bl_appearance loaded')
    elseif GetResourceState('illenium-appearance') == 'started' then
        exports['illenium-appearance']:setPlayerAppearance(skinData)
        Debug('illenium-appearance loaded')
    elseif GetResourceState('fivem-appearance') == 'started' then
        exports['fivem-appearance']:setPlayerAppearance(skinData)
        Debug('fivem-appearance loaded')
    elseif GetResourceState('skinchanger') == 'started' then
        TriggerEvent('skinchanger:loadSkin', skinData)
        Debug('Skinchanger loaded')
    else
        Debug('You can add your own clothing exports here.')
    end
end

function SetPedSkin(cacheped, skinData)
    if GetResourceState('rcore_clothing') == 'started' then
        exports.rcore_clothing:setPedSkin(cacheped, skinData)
        Debug('rcore_clothing loaded')
    elseif GetResourceState('crm-appearance') == 'started' then
        exports['crm-appearance']:crm_set_ped_appearance(cacheped, skinData)
        Debug('crm-appearance loaded')
    elseif GetResourceState('bl_appearance') == 'started' then
        TriggerEvent('skinchanger:loadSkin', skinData)
        Debug('bl_appearance loaded')
    elseif GetResourceState('illenium-appearance') == 'started' then
        exports['illenium-appearance']:setPedAppearance(cacheped, skinData)
        Debug('illenium-appearance loaded')
    elseif GetResourceState('fivem-appearance') == 'started' then
        exports['fivem-appearance']:setPedAppearance(cacheped, skinData)
        Debug('fivem-appearance loaded')
    elseif GetResourceState('skinchanger') == 'started' then
        TriggerEvent('skinchanger:loadSkin', skinData)
        Debug('skinchanger loaded')
    else
        Debug('You can add your own clothing exports here.')
    end
end
