-- =====================================================
-- WAIS-HUD OX_INVENTORY BRIDGE
-- Nexora RP - Money Sync Fix
-- =====================================================

if GetResourceState('ox_inventory') ~= 'started' then
    return
end

local QBCore = exports['qb-core']:GetCoreObject()

-- Money güncelleme fonksiyonu
local function UpdateMoney()
    local PlayerData = QBCore.Functions.GetPlayerData()
    
    if not PlayerData then return end
    
    -- Cash için ox_inventory'den al
    local cashItem = exports.ox_inventory:Search('count', 'cash')
    local cash = cashItem or 0
    
    -- Bank qb-core'dan al
    local bank = PlayerData.money and PlayerData.money.bank or 0
    
    -- WAIS-HUD'a gönder
    TriggerEvent('hud:client:UpdateMoney', {
        cash = cash,
        bank = bank
    })
    
    if Config.ShowDebug then
        print(string.format('[WAIS-HUD → OX_INVENTORY] Para güncellendi: Cash=%d, Bank=%d', cash, bank))
    end
end

-- Oyuncu yüklendiğinde
RegisterNetEvent('QBCore:Client:OnPlayerLoaded', function()
    Wait(2000) -- WAIS-HUD'ın yüklenmesini bekle
    UpdateMoney()
    print('[WAIS-HUD] OX_INVENTORY bridge yüklendi - Para senkronize edildi')
end)

-- Para değiştiğinde (qb-core eventi)
RegisterNetEvent('hud:client:OnMoneyChange', function(moneytype, amount, remove)
    Wait(100) -- Inventory güncellemesini bekle
    UpdateMoney()
end)

-- QBCore PlayerData değiştiğinde
RegisterNetEvent('QBCore:Player:SetPlayerData', function(PlayerData)
    if PlayerData and PlayerData.money then
        Wait(100)
        UpdateMoney()
    end
end)

-- Periyodik güncelleme (her 30 saniyede bir)
CreateThread(function()
    while true do
        Wait(30000)
        UpdateMoney()
    end
end)

print('[WAIS-HUD] OX_INVENTORY bridge başlatıldı')
