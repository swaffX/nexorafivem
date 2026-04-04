-- WAIS-HUD Bridge for qb-inventory
-- Nexora RP - Para senkronizasyonu

local QBCore = exports['qb-core']:GetCoreObject()

-- Para değiştiğinde WAIS-HUD'a bildir
RegisterNetEvent('QBCore:Player:SetPlayerData', function(PlayerData)
    if PlayerData and PlayerData.money then
        -- WAIS-HUD'a para güncelleme eventi gönder
        TriggerEvent('hud:client:UpdateMoney', PlayerData.money)
        
        if Config.ShowDebug then
            print(string.format('[QB-Inventory → WAIS-HUD] Para güncellendi: Cash=%d, Bank=%d', 
                PlayerData.money.cash or 0, 
                PlayerData.money.bank or 0))
        end
    end
end)

-- Oyuncu yüklendiğinde
RegisterNetEvent('QBCore:Client:OnPlayerLoaded', function()
    Wait(2000)
    local PlayerData = QBCore.Functions.GetPlayerData()
    if PlayerData and PlayerData.money then
        TriggerEvent('hud:client:UpdateMoney', PlayerData.money)
        if Config.ShowDebug then
            print('[QB-Inventory → WAIS-HUD] Oyuncu yüklendi, para senkronize edildi')
        end
    end
end)

-- Para güncellendiğinde
RegisterNetEvent('hud:client:OnMoneyChange', function(type, amount, reason)
    Wait(100)
    local PlayerData = QBCore.Functions.GetPlayerData()
    if PlayerData and PlayerData.money then
        TriggerEvent('hud:client:UpdateMoney', PlayerData.money)
    end
end)

print('[QB-Inventory] WAIS-HUD bridge yüklendi')
