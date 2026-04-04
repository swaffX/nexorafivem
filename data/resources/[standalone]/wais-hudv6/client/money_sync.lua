-- Money Sync Patch for qb-inventory
-- Nexora RP - Cash Senkronizasyon Düzeltmesi (Güçlendirilmiş)

local QBCore = exports['qb-core']:GetCoreObject()
local lastCash = 0
local lastBank = 0

-- Para güncelleme fonksiyonu
local function UpdateMoney()
    local PlayerData = QBCore.Functions.GetPlayerData()
    if PlayerData and PlayerData.money then
        local currentCash = PlayerData.money.cash or 0
        local currentBank = PlayerData.money.bank or 0
        
        -- Sadece değişiklik varsa güncelle
        if currentCash ~= lastCash or currentBank ~= lastBank then
            SendNUIMessage({
                action = "updateMoney",
                cash = currentCash,
                bank = currentBank
            })
            
            lastCash = currentCash
            lastBank = currentBank
            
            print(string.format('[WAIS-HUD] Para güncellendi: Cash=%d, Bank=%d', currentCash, currentBank))
        end
    end
end

-- Para değiştiğinde HUD'u güncelle
RegisterNetEvent('hud:client:OnMoneyChange', function(type, amount, isMinus)
    Wait(100) -- Küçük gecikme ile PlayerData'nın güncellenmesini bekle
    UpdateMoney()
end)

-- QBCore para değişikliği eventi
RegisterNetEvent('QBCore:Player:SetPlayerData', function(PlayerData)
    Wait(100)
    UpdateMoney()
end)

-- QBCore client para güncelleme
RegisterNetEvent('QBCore:Client:OnMoneyChange', function(moneyType, amount, operation)
    Wait(100)
    UpdateMoney()
end)

-- Inventory para eventi
RegisterNetEvent('inventory:client:ItemBox', function(item, type)
    if item and item.name == 'money' then
        Wait(100)
        UpdateMoney()
    end
end)

-- Manuel para güncelleme
RegisterCommand('syncmoney', function()
    UpdateMoney()
    TriggerEvent('chat:addMessage', {
        color = {0, 255, 0},
        multiline = true,
        args = {"[Nexora RP]", "Para senkronize edildi!"}
    })
end, false)

-- Oyuncu spawn olduğunda
RegisterNetEvent('QBCore:Client:OnPlayerLoaded', function()
    Wait(2000) -- 2 saniye bekle
    UpdateMoney()
    print('[WAIS-HUD] Oyuncu yüklendi, para senkronize edildi')
end)

-- Her 3 saniyede bir para kontrolü (daha sık)
CreateThread(function()
    Wait(5000) -- İlk başta 5 saniye bekle
    while true do
        Wait(3000) -- Her 3 saniye
        UpdateMoney()
    end
end)

-- İlk yükleme
CreateThread(function()
    Wait(2000)
    UpdateMoney()
    print('[WAIS-HUD] Money sync patch loaded - Nexora RP (Enhanced)')
end)
