-- Client-side fix for nil slot count error
-- This file wraps the callback to ensure totalSlots is never nil

local originalCallback = lib.callback.await

-- Override lib.callback.await to fix nil totalSlots
lib.callback.await = function(name, timeout, ...)
    if name == 'um-multicharacter:server:GetCharacters' then
        local characters, totalSlots = originalCallback(name, timeout, ...)
        
        -- Ensure totalSlots is never nil
        if not totalSlots or type(totalSlots) ~= 'number' then
            totalSlots = 1 -- Default fallback
            print('^3[um-multicharacter] Fixed nil totalSlots on client, using default: ' .. totalSlots .. '^7')
        end
        
        return characters, totalSlots
    end
    
    return originalCallback(name, timeout, ...)
end

print('^2[um-multicharacter] Client-side nil-check fix loaded^7')
