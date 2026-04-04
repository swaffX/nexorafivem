-- Money Sync Patch for qb-inventory
-- Nexora RP - Cash Senkronizasyon Düzeltmesi

local QBCore = exports['qb-core']:GetCoreObject()

-- Para değiştiğinde HUD'u güncelle
RegisterNetEvent('hud:client:OnMoneyChange', function(type, amount, isMinus)
    if type == 'cash' or type == 'money' then
        local PlayerData = QBCore.Functions.GetPlayerData()
        if PlayerData and PlayerData.money then
            -- HUD'a para güncelleme eventi gönder
            SendNUIMessage({
                action = "updateMoney",
                cash = PlayerData.money.cash or 0,
                bank = PlayerData.money.bank or 0
            })
        end
    end
end)

-- QBCore para değişikliği eventi
RegisterNetEvent('QBCore:Player:SetPlayerData', function(PlayerData)
    if PlayerData and PlayerData.money then
        SendNUIMessage({
            action = "updateMoney",
            cash = PlayerData.money.cash or 0,
            bank = PlayerData.money.bank or 0
        })
    end
end)

-- Manuel para güncelleme
RegisterCommand('syncmoney', function()
    local PlayerData = QBCore.Functions.GetPlayerData()
    if PlayerData and PlayerData.money then
        SendNUIMessage({
            action = "updateMoney",
            cash = PlayerData.money.cash or 0,
            bank = PlayerData.money.bank or 0
        })
        print('[WAIS-HUD] Para senkronize edildi: Cash=' .. PlayerData.money.cash .. ', Bank=' .. PlayerData.money.bank)
    end
end, false)

-- Her 5 saniyede bir para kontrolü (fallback)
CreateThread(function()
    while true do
        Wait(5000)
        local PlayerData = QBCore.Functions.GetPlayerData()
        if PlayerData and PlayerData.money then
            SendNUIMessage({
                action = "updateMoney",
                cash = PlayerData.money.cash or 0,
                bank = PlayerData.money.bank or 0
            })
        end
    end
end)

print('[WAIS-HUD] Money sync patch loaded - Nexora RP')
