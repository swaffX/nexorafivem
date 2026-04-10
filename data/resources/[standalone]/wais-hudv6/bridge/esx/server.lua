-- =====================================================
--  decrypted by https://discord.gg/6NCbAv2VNK 𝐀𝐤 𝐋𝐞𝐚𝐤𝐬 
--		Cleaned By Said Ak Using Claude Sonnet 4.5
-- =====================================================

-- ============================================
-- SERWER - ZDARZENIA ESX
-- ============================================

-- Gracz załadowany
RegisterNetEvent("esx:playerLoaded", function(playerSource)
    TriggerClientEvent("wais:hudv6:client:playerLoaded", playerSource)
end)


-- ============================================
-- CALLBACK - POBIERANIE PIENIĘDZY
-- ============================================

-- PARA CALLBACK KALDIRILDI - Nexora RP
--[[
lib.callback.register("wais:hudv6:server:getMoney", function(playerSource)
    local xPlayer = wFramework.Framework.GetPlayerFromId(playerSource)
    if xPlayer then
        return xPlayer.getMoney()
    end
    return 0
end)
--]]