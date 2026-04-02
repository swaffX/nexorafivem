local QBCore = exports['qb-core']:GetCoreObject()

-- Komut ile UI açma (isteğe bağlı)
RegisterCommand(Config.UIOpener, function()
    TriggerEvent('BetterBank:CheckATM')
end)

-- Blipleri ekle
CreateThread(function()
    for _, v in pairs(Config.Banks) do
        v.blip = AddBlipForCoord(v.Location)
        SetBlipSprite(v.blip, v.id)
        SetBlipAsShortRange(v.blip, true)
        SetBlipColour(v.blip, 2)
        BeginTextCommandSetBlipName("STRING")
        AddTextComponentString(v.name)
        EndTextCommandSetBlipName(v.blip)
    end
end)

-- UI Açma
function Display(company, data)
    SetNuiFocus(true, true)
    SendNUIMessage({
        type = "ui",
        openForCompany = company,
        data = data
    })
end

-- ATM veya banka yakında mı kontrolü
RegisterNetEvent("BetterBank:CheckATM", function()
        PlayerBankOpener()
end)

function nearBank()
    if not Config.openBankWithCom then
        local player = PlayerPedId()
        local playerloc = GetEntityCoords(player)

        for _, v in pairs(Config.Banks) do
            local distance = #(v.Location - playerloc)
            if distance <= 3 then
                TaskPlayAnim(player, "anim@amb@prop_human_atm@interior@male@enter", "enter", 3.5, -8, -1, 2, 0, 0, 0, 0, 0)
                return true
            end
        end
    end
    return false
end



CreateThread(function()
    for k, v in pairs(Config.Banks) do
        -- Ped modeli (dilersen config'e çekebilirsin)
        local pedModel = "cs_bankman"
        RequestModel(pedModel)
        while not HasModelLoaded(pedModel) do
            Wait(10)
        end

        -- Ped oluştur
        local ped = CreatePed(0, pedModel, v.Location.x, v.Location.y, v.Location.z - 1.0, v.Location.w, false, true)
        SetEntityInvincible(ped, true)
        SetBlockingOfNonTemporaryEvents(ped, true)
        FreezeEntityPosition(ped, true)

        -- qb-target ped için
        exports['qb-target']:AddTargetEntity(ped, {
            options = {
               {
                    type = "client",
                    event = "BetterBank:CheckATM",
                    icon = "fas fa-university",
                    label = "Banka hesabımı görüntülemek istiyorum",
                },
            },
            distance = 2.0
        })
    end

    -- ATM'ler
    for i, hash in ipairs(Config.Atms) do
        exports['qb-target']:AddTargetModel(hash, {
            options = {
                {
                    type = "client",
                    event = "BetterBank:CheckATM",
                    icon = "fas fa-credit-card",
                    label = "Katını atmye sok",
                },
            },
            distance = 1.5,
        })
    end
end)

function PlayerBankOpener()
    QBCore.Functions.TriggerCallback('Betterbank:getSourceDatas', function(datas)
        if datas then  -- datas nil değilse devam et
            if (not datas.fullName) and datas.firstname and datas.lastname then
                datas.fullName = datas.firstname .. " " .. datas.lastname
            end
            Display(false, datas)
        else
            print("Betterbank:getSourceDatas callbackinden nil veri geldi!")
        end
    end)
end


RegisterNetEvent('BetterBank:CompanyBankOpener', function(IBAN)
    QBCore.Functions.TriggerCallback('BetterBank:openForCompany', function(datas)
        -- Aynı şekilde burada da kontrol yap:
        if not datas.fullName and datas.firstname and datas.lastname then
            datas.fullName = datas.firstname .. " " .. datas.lastname
        end
        Display(true, datas)
    end, IBAN)
end)

-- UI ile etkileşim
RegisterNUICallback('deposit', function(data)
    TriggerServerEvent('BetterBank:deposit', tonumber(data.amount), data.IBAN, data.time, data.editedAmount, data.openedForCompany)
    Wait(1000)
    TriggerServerEvent('BetterBank:UpdateBalance', data.IBAN)
end)

RegisterNUICallback('withdraw', function(data)
    TriggerServerEvent('BetterBank:withdraw', tonumber(data.amount), data.IBAN, data.time, data.editedAmount, data.openedForCompany)
    Wait(1000)
    TriggerServerEvent('BetterBank:UpdateBalance', data.IBAN)
end)

RegisterNUICallback('transfer', function(data)
    TriggerServerEvent('BetterBank:transferMoney', data.senderIBAN, data.targetIBAN, data.time, data.amount, data.editedAmount, data.openedForCompany)
    Wait(1000)
    TriggerServerEvent('BetterBank:UpdateBalance', data.senderIBAN)
end)

RegisterNUICallback('payBill', function(datas, cb)
    QBCore.Functions.TriggerCallback('Betterbank:tryToPayBill', function(success)
        if success then
            -- Ödeyenin IBAN'ını gönderiyoruz ki doğru bakiye gelsin
            TriggerServerEvent('BetterBank:UpdateBalance', datas.data.payerIBAN or datas.data.IBAN)

            SendNUIMessage({
                type = "deleteBill",
                index = datas.data.id,
            })
            TriggerEvent('BetterBank:ShowMessage', "fal fa-check-circle", "Fatura başarıyla ödendi.")
        else
            TriggerEvent('BetterBank:ShowMessage', "fal fa-times-circle", "Fatura ödenirken hata oluştu.")
        end

        if cb then cb(success) end
    end, datas.data)
end)



RegisterNUICallback("exit", function()
    ClearPedTasksImmediately(PlayerPedId())
    SetNuiFocus(false, false)
end)

RegisterNetEvent('BetterBank:ShowMessage', function(icon, message)
    SendNUIMessage({
        type = "message",
        icon = icon,
        message = message,
    })
end)

RegisterNetEvent('BetterBank:addTransaction', function(status, amount, time, comingFrom, icon, color, numberAmount)
    if Config.dbMinAmount <= tonumber(numberAmount) then
        local data = {
            status = status,
            amount = amount,
            time = time,
            comingFrom = comingFrom,
            icon = icon,
            color = color
        }
        SendNUIMessage({
            type = "addTransaction",
            transaction = data,
        })
    end
end)

RegisterNetEvent('BetterBank:UpdateBalance', function(balance)
    SendNUIMessage({
        type = "updateBalance",
        balance = balance,
    })
end)
