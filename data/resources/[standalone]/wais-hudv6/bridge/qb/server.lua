-- =====================================================
--  decrypted by https://discord.gg/6NCbAv2VNK 𝐀𝐤 𝐋𝐞𝐚𝐤𝐬 
--		Cleaned By Said Ak Using Claude Sonnet 4.5
-- =====================================================

RegisterNetEvent("QBCore:Server:PlayerLoaded", function(playerData)
    local playerSource = playerData.PlayerData.source
    
    TriggerClientEvent("wais:hudv6:client:playerLoaded", playerSource)
end)