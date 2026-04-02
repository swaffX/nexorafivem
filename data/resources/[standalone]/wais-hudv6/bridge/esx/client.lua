-- =====================================================
--  decrypted by https://discord.gg/6NCbAv2VNK 𝐀𝐤 𝐋𝐞𝐚𝐤𝐬 
--		Cleaned By Said Ak Using Claude Sonnet 4.5
-- =====================================================

-- ============================================
-- KLIENT - ZDARZENIA ESX
-- ============================================

-- Gracz wylogowany
RegisterNetEvent("esx:onPlayerLogout", function()
    wFramework.playerUnloaded()
end)


-- Zmiana pieniędzy na koncie
RegisterNetEvent("esx:setAccountMoney", function()
    Wait(250)
    wFramework.GetPlayerBank()
    
    -- Pobierz pieniądze tylko jeśli nie są itemem
    if not Config.MoneySettings.isItem then
        wFramework.GetPlayerMoney()
    end
end)


-- ============================================
-- ZDARZENIA INWENTARZA - PIENIĄDZE JAKO ITEM
-- ============================================

if Config.MoneySettings.isItem then
    -- Jeśli nie używa ox_inventory, nasłuchuj zdarzenia ESX
    if not Config.MoneySettings.ox_inventory then
        
        -- Gracz dodał item (w tym pieniądze)
        RegisterNetEvent("esx:addInventoryItem", function()
            Wait(500)
            wFramework.GetPlayerMoney()
        end)
        
        -- Gracz usunął item (w tym pieniądze)
        RegisterNetEvent("esx:removeInventoryItem", function()
            Wait(500)
            wFramework.GetPlayerMoney()
        end)
    end
end


-- ============================================
-- PRACA
-- ============================================

-- Zmiana pracy
RegisterNetEvent("esx:setJob", function()
    Wait(250)
    wFramework.UpatePlayerJob()
end)


-- ============================================
-- STATUS GRACZA - POTRZEBY (GŁÓD, PRAGNIENIE, STRES)
-- ============================================

RegisterNetEvent("esx_status:onTick", function(statusData)
    -- Iteruj przez wszystkie statusy
    for _, status in pairs(statusData) do
        local statusName = status.name
        local statusPercent = math.floor(status.percent)
        
        if statusName == "hunger" then
            wFramework.Status.hunger = statusPercent
        end
        
        if statusName == "thirst" then
            wFramework.Status.thirst = statusPercent
        end
        
        if statusName == "stress" then
            wFramework.Status.stress = statusPercent
        end
    end
end)


-- ============================================
-- NIESTANDARDOWE ZDARZENIA
-- ============================================

-- Aktualizacja pieniędzy (stary system bez itemów)
RegisterNetEvent("wais:hudv6:client:updateOldMoney", function(money)
    wFramework.Money.cash = money
    wFramework.sendMoneyToUI()
end)