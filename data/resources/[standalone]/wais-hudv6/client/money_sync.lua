-- Money Sync Patch - Nexora RP
-- qb-inventory bridge ile çalışır

local QBCore = exports['qb-core']:GetCoreObject()

-- qb-inventory bridge'den gelen event (EN ÖNEMLİ)
RegisterNetEvent('hud:client:UpdateMoney', function(money)
    if money then
        SendNUIMessage({
            action = "updateMoney",
            cash = money.cash or 0,
            bank = money.bank or 0
        })
        print(string.format('[WAIS-HUD] Bridge: Cash=%d, Bank=%d', money.cash or 0, money.bank or 0))
    end
end)

-- Manuel senkronizasyon
RegisterCommand('syncmoney', function()
    local PlayerData = QBCore.Functions.GetPlayerData()
    if PlayerData and PlayerData.money then
        SendNUIMessage({
            action = "updateMoney",
            cash = PlayerData.money.cash or 0,
            bank = PlayerData.money.bank or 0
        })
        print(string.format('[WAIS-HUD] Manuel sync: Cash=%d, Bank=%d', PlayerData.money.cash, PlayerData.money.bank))
    end
end, false)

print('[WAIS-HUD] Money sync loaded (Bridge mode)')
