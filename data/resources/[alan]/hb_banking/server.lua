local QBCore = exports['qb-core']:GetCoreObject()
RegisterServerEvent('BetterBank:UpdateBalance')
AddEventHandler('BetterBank:UpdateBalance', function(IBAN)
    local _source = source
    local xPlayer = QBCore.Functions.GetPlayer(_source)

    -- Eğer IBAN parametresi yoksa veya geçersizse, oyuncudan IBAN al
    if not IBAN or type(IBAN) ~= "string" or IBAN == "" then
        if xPlayer then
            IBAN = xPlayer.PlayerData.metadata.iban or GenerateIBAN(xPlayer.PlayerData.citizenid)
        else
            TriggerClientEvent('BetterBank:UpdateBalance', _source, 0)
            return
        end
    end

    local success, isCompany = pcall(function()
        return IsIBANBelongToCompany(IBAN)
    end)

    if not success then
        TriggerClientEvent('BetterBank:UpdateBalance', _source, 0)
        return
    end

    if isCompany then
        local balance = GetCompanyBalance(IBAN)
        TriggerClientEvent('BetterBank:UpdateBalance', _source, balance)
    else
        if xPlayer then
            local balance = xPlayer.PlayerData.money["bank"] or 0
            TriggerClientEvent('BetterBank:UpdateBalance', _source, balance)
        else
            TriggerClientEvent('BetterBank:UpdateBalance', _source, 0)
        end
    end
end)



function IsIBANExist(iban)
   
    local result = MySQL.Sync.fetchAll("SELECT 1 FROM players WHERE IBAN = @iban LIMIT 1", {
        ['@iban'] = iban
    })

    if result[1] then
        return true
    end

   
    local companyResult = MySQL.Sync.fetchAll("SELECT 1 FROM betterbankcompanies WHERE IBAN = @iban LIMIT 1", {
        ['@iban'] = iban
    })

    return companyResult[1] ~= nil
end


function GetcitizenidFromIBAN(iban)
 
    local result = MySQL.Sync.fetchAll('SELECT citizenid FROM players WHERE IBAN = @iban LIMIT 1', {
        ['@iban'] = iban
    })

    if result[1] and result[1].citizenid then
        return result[1].citizenid
    end

   
    local companyResult = MySQL.Sync.fetchAll('SELECT ownerCitizenId FROM betterbankcompanies WHERE IBAN = @iban LIMIT 1', {
        ['@iban'] = iban
    })

    if companyResult[1] and companyResult[1].ownerCitizenId then
        return companyResult[1].ownerCitizenId
    end

    return nil
end

RegisterServerEvent('BetterBank:deposit')
AddEventHandler('BetterBank:deposit', function(amount, IBAN, time, editedAmount, openedForCompany)
    local _source = source
    local xPlayer = QBCore.Functions.GetPlayer(_source)
    if not xPlayer then return end

    local currentCash = xPlayer.PlayerData.money["cash"] or 0
    amount = tonumber(amount)

    if amount == nil or amount <= 0 or amount > currentCash then
        TriggerClientEvent('BetterBank:ShowMessage', _source, "fas fa-times-circle", "Error: Insufficient cash.")
        return
    end

    xPlayer.Functions.RemoveMoney('cash', amount)

    if openedForCompany and IsIBANBelongToCompany(IBAN) then
        local nextAmount = GetCompanyBalance(IBAN) + amount
        SetCompanyBalance(IBAN, nextAmount)
    else
        xPlayer.Functions.AddMoney('bank', amount)
    end

    TriggerEvent('BetterBank:addTransactionsDB', IBAN, "Deposit", editedAmount, time, "", "fas fa-arrow-down", "green", amount)
    TriggerClientEvent('BetterBank:addTransaction', _source, "Deposit", tostring(editedAmount), time, "", "fas fa-arrow-down", "green", amount)
    TriggerClientEvent('BetterBank:ShowMessage', _source, "fas fa-check-circle", "İşlem Başarılı")
end)

RegisterServerEvent('BetterBank:withdraw')
AddEventHandler('BetterBank:withdraw', function(amount, IBAN, time, editedAmount, openedForCompany)
    local _source = source
    local xPlayer = QBCore.Functions.GetPlayer(_source)
    if not xPlayer then return end

    amount = tonumber(amount)
    local currentBankBalance = xPlayer.PlayerData.money["bank"] or 0
    local currentBalance = currentBankBalance

    if openedForCompany then
        currentBalance = GetCompanyBalance(IBAN)
    end

    if amount == nil or amount <= 0 or amount > currentBalance then
        TriggerClientEvent('BetterBank:ShowMessage', _source, "fas fa-times-circle", "Error: Insufficient funds.")
        return
    end

    if openedForCompany and IsIBANBelongToCompany(IBAN) then
        local nextAmount = GetCompanyBalance(IBAN) - amount
        SetCompanyBalance(IBAN, nextAmount)
    else
        xPlayer.Functions.RemoveMoney('bank', amount)
    end

    xPlayer.Functions.AddMoney('cash', amount)

    TriggerEvent('BetterBank:addTransactionsDB', IBAN, "Withdraw", editedAmount, time, "", "fas fa-arrow-up", "red", amount)
    TriggerClientEvent('BetterBank:addTransaction', _source, "Withdraw", tostring(editedAmount), time, "", "fas fa-arrow-up", "red", amount)
    TriggerClientEvent('BetterBank:ShowMessage', _source, "fas fa-check-circle", "İşlem Başarılı")
end)

function TransferMoney(senderIBAN, amount, targetIBAN, cb)
    amount = tonumber(amount)
    if not cb then cb = function() end end -- cb nil ise boş fonksiyon at
    if not IsIBANExist(senderIBAN) or not IsIBANExist(targetIBAN) or amount <= 0 then
        return cb(false)
    end

    local isSenderIBANCompany = IsIBANBelongToCompany(senderIBAN)
    local isTargetIBANCompany = IsIBANBelongToCompany(targetIBAN)

    local senderCitizenId = GetcitizenidFromIBAN(senderIBAN)
    local targetCitizenId = GetcitizenidFromIBAN(targetIBAN)

    local senderBalance, targetBalance = 0, 0
    local senderPlayer, targetPlayer = nil, nil
    local targetAccount = nil

    local function processTransfer()
        if amount > senderBalance then return cb(false) end

        -- Sender Para Eksilt
        if isSenderIBANCompany then
            SetCompanyBalance(senderIBAN, senderBalance - amount)
        else
            if senderPlayer then
                senderPlayer.Functions.RemoveMoney('bank', amount)
            else
                local result = MySQL.Sync.fetchAll('SELECT money FROM players WHERE citizenid = @cid', {['@cid'] = senderCitizenId})
                if result[1] then
                    local money = json.decode(result[1].money or '{}')
                    money.bank = (money.bank or 0) - amount
                    MySQL.Sync.execute('UPDATE players SET money = @money WHERE citizenid = @cid', {
                        ['@money'] = json.encode(money),
                        ['@cid'] = senderCitizenId
                    })
                else
                    return cb(false)
                end
            end
        end

        -- Target Para Ekle
        if isTargetIBANCompany then
            SetCompanyBalance(targetIBAN, targetBalance + amount)
            return cb(true)
        else
            if targetPlayer then
                targetPlayer.Functions.AddMoney('bank', amount)
                return cb(true)
            else
                targetAccount.bank = targetBalance + amount
                MySQL.Async.execute('UPDATE players SET money = @money WHERE citizenid = @cid', {
                    ['@money'] = json.encode(targetAccount),
                    ['@cid'] = targetCitizenId
                }, function()
                    cb(true)
                end)
            end
        end
    end

    -- Sender Bilgisi
    if isSenderIBANCompany then
        senderBalance = GetCompanyBalance(senderIBAN)
    else
        for _, pid in pairs(QBCore.Functions.GetPlayers()) do
            local ply = QBCore.Functions.GetPlayer(pid)
            if ply and ply.PlayerData.citizenid == senderCitizenId then
                senderPlayer = ply
                break
            end
        end

        if senderPlayer then
            senderBalance = senderPlayer.Functions.GetMoney('bank')
        else
            local result = MySQL.Sync.fetchAll('SELECT money FROM players WHERE citizenid = @cid', {['@cid'] = senderCitizenId})
            if result[1] then
                local money = json.decode(result[1].money or '{}')
                senderBalance = money.bank or 0
            else
                return cb(false)
            end
        end
    end

    -- Target Bilgisi
    if isTargetIBANCompany then
        targetBalance = GetCompanyBalance(targetIBAN)
        processTransfer()
    else
        for _, pid in pairs(QBCore.Functions.GetPlayers()) do
            local ply = QBCore.Functions.GetPlayer(pid)
            if ply and ply.PlayerData.citizenid == targetCitizenId then
                targetPlayer = ply
                break
            end
        end

        if targetPlayer then
            targetBalance = targetPlayer.Functions.GetMoney('bank')
            targetAccount = {}
            processTransfer()
        else
            MySQL.Async.fetchAll('SELECT money FROM players WHERE citizenid = @cid', {['@cid'] = targetCitizenId}, function(result)
                if result[1] then
                    local money = json.decode(result[1].money or '{}')
                    targetBalance = money.bank or 0
                    targetAccount = money
                    processTransfer()
                else
                    cb(false)
                end
            end)
        end
    end
end


RegisterServerEvent('BetterBank:transferMoney')
AddEventHandler('BetterBank:transferMoney', function(IBAN, targetIBAN, time, amount, editedAmount, openedForCompany)
    local _source = source

    TransferMoney(IBAN, amount, targetIBAN, function(success)
        if success then
            
            local sourceName = "Unknown - " .. IBAN
            local targetName = "Unknown - " .. targetIBAN

            local function getName(iban, cb)
                MySQL.Async.fetchAll('SELECT fullName FROM betterbankcompanies WHERE IBAN = @IBAN', {['@IBAN'] = iban}, function(companyResult)
                    if companyResult[1] then
                        cb(companyResult[1].fullName .. " - " .. iban)
                    else
                        MySQL.Async.fetchAll('SELECT charinfo FROM players WHERE IBAN = @IBAN', {['@IBAN'] = iban}, function(playerResult)
                            if playerResult[1] and playerResult[1].charinfo then
                                local charinfo = json.decode(playerResult[1].charinfo)
                                cb((charinfo.firstname or "Unknown") .. " " .. (charinfo.lastname or "Unknown") .. " - " .. iban)
                            else
                                cb("Unknown - " .. iban)
                            end
                        end)
                    end
                end)
            end

            
            getName(IBAN, function(name)
                sourceName = name
                getName(targetIBAN, function(name2)
                    targetName = name2

                  
                    TriggerEvent('BetterBank:addTransactionsDB', IBAN, "Transfer", editedAmount, time, targetName, "fas fa-exchange", "red", amount)
                    TriggerEvent('BetterBank:addTransactionsDB', targetIBAN, "Transfer", editedAmount, time, sourceName, "fas fa-exchange", "green", amount)
                    TriggerClientEvent('BetterBank:addTransaction', _source, "Transfer", editedAmount, time, targetName, "fas fa-exchange", "red", amount)
                    TriggerClientEvent('BetterBank:ShowMessage', _source, "fas fa-check-circle", "İşlem Başarılı")
                end)
            end)
        else
            TriggerClientEvent('BetterBank:ShowMessage', _source, "fas fa-times-circle", "Başarısız")
        end
    end)
end)


RegisterServerEvent('BetterBank:addTransactionsDB')
AddEventHandler('BetterBank:addTransactionsDB', function(IBAN, status, amount, time, comingFrom, icon, color, numberAmount)
    
    if Config.dbMinAmount and tonumber(numberAmount) and tonumber(numberAmount) >= Config.dbMinAmount then
        MySQL.Async.execute("INSERT INTO betterbanktransactions (IBAN, status, amount, time, comingFrom, icon, color) VALUES (@IBAN, @status, @amount, @time, @comingFrom, @icon, @color)", {
            ['@IBAN'] = IBAN,
            ['@status'] = status,
            ['@amount'] = amount,
            ['@time'] = time,
            ['@comingFrom'] = comingFrom,
            ['@icon'] = icon,
            ['@color'] = color
        })
    end
end)


QBCore.Functions.CreateCallback('BetterBank:openForCompany', function(source, cb, IBAN)
	datas = {}
	datas.IBAN = IBAN
	
	MySQL.Async.fetchAll('SELECT * FROM betterbankcompanies WHERE IBAN = @IBAN', {
		['@IBAN'] = IBAN,
	}, function(result)
		if result[1] ~= nil then
			datas.fullName = result[1].fullName
			datas.currentMoney = result[1].moneyAmount
		else
			cb(nil)
		end
	end)

	datas.LastTransactions = GetLastTransactions(datas.IBAN, Config.MaxLastTransactions)
	datas.Bills = GetUnPayedBills(datas.IBAN)
	cb(datas)

end)

QBCore.Functions.CreateCallback('Betterbank:getSourceDatas', function(source, cb)
    local datas = {}
    local _source = source
    local xPlayer = QBCore.Functions.GetPlayer(_source)
    if xPlayer == nil then 
    
        cb(nil)
        return
    end

    local citizenid = xPlayer.PlayerData.citizenid
    if not citizenid then
        
        cb(nil)
        return
    end

    datas.currentMoney = xPlayer.PlayerData.money["bank"] or 0

    CreateOrGetIBAN(_source, function(iban)
        if not iban then
        
            cb(nil)
            return
        end

        datas.IBAN = iban
        datas.LastTransactions = GetLastTransactions(datas.IBAN, "20")
        datas.Bills = GetUnPayedBills(citizenid)

        MySQL.Async.fetchAll('SELECT charinfo FROM players WHERE citizenid = @citizenid', {
            ['@citizenid'] = citizenid,
        }, function(result)
            if not result or #result == 0 then
                cb(nil)
                return
            end

            local charinfo = json.decode(result[1].charinfo)
            if not charinfo then
            
                cb(nil)
                return
            end

            if charinfo.firstname and charinfo.lastname then
                datas.fullName = charinfo.firstname .. " " .. charinfo.lastname
            else
            
                datas.fullName = "Bilinmeyen İsim"
            end

            cb(datas)
        end)
    end)
end)


QBCore.Functions.CreateCallback('Betterbank:tryToPayBill', function(source, cb, data)
    print("[tryToPayBill] Callback çalıştı", json.encode(data))

    local Player = QBCore.Functions.GetPlayer(source)
    if not Player then cb(false) return end

    local payerCitizenId = Player.PlayerData.citizenid
    local payerFullName = Player.PlayerData.charinfo.firstname .. " " .. Player.PlayerData.charinfo.lastname

    -- IBAN direkt players tablosundan çekiliyor
    MySQL.Async.fetchScalar('SELECT iban FROM players WHERE citizenid = @citizenid', {
        ['@citizenid'] = payerCitizenId
    }, function(payerIBAN)
        if not payerIBAN then
            print("[tryToPayBill] Ödeyenin IBAN'ı bulunamadı")
            cb(false)
            return
        end

        -- Faturayı kesenin IBAN'ını da çek
        MySQL.Async.fetchScalar('SELECT iban FROM players WHERE citizenid = @citizenid', {
            ['@citizenid'] = data.citizenid
        }, function(senderIBAN)
            if not senderIBAN then
                print("[tryToPayBill] Fatura gönderenin IBAN'ı bulunamadı")
                cb(false)
                return
            end

            local time = data.sell_time or os.date('%Y-%m-%d %H:%M:%S')

            TransferMoney(payerIBAN, tonumber(data.amount), senderIBAN, function(success)
                if success then
                    print("[tryToPayBill] Para transferi başarılı.")

                    -- Fatura sil
                    MySQL.Async.execute("DELETE FROM phone_invoices WHERE id = @ID", { ['@ID'] = data.id })

                    -- Transaction kayıtları
                    TriggerEvent('BetterBank:addTransactionsDB', payerIBAN, "Bill", data.editedAmount, time, data.sender, "fas fa-file-invoice-dollar", "red", data.amount)
                    TriggerEvent('BetterBank:addTransactionsDB', senderIBAN, "Bill", data.editedAmount, time, payerFullName, "fas fa-file-invoice-dollar", "green", data.amount)

                    -- Güncel bakiye bilgisini client'a gönder (bank hesabı)
                    local updatedBalance = 0
                    if Player then
                        updatedBalance = Player.Functions.GetMoney('bank') or 0
                    end
                    TriggerClientEvent('BetterBank:updateBalance', source, updatedBalance)

                    TriggerClientEvent('BetterBank:addTransaction', source, "Bill", data.editedAmount, time, data.sender, "fas fa-file-invoice-dollar", "red", data.amount)
                    TriggerClientEvent('BetterBank:ShowMessage', source, "fas fa-check-circle", "Başarıyla ödendi.")
                    cb(true)
                else
                    print("[tryToPayBill] TransferMoney başarısız.")
                    TriggerClientEvent('BetterBank:ShowMessage', source, "fas fa-times-circle", "Fatura ödenirken bir hata oluştu.")
                    cb(false)
                end
            end)
        end)
    end)
end)





local QBCore = exports['qb-core']:GetCoreObject()

-- Fatura oluştur
RegisterServerEvent("BetterBank:Server:SendInvoice")
AddEventHandler("BetterBank:Server:SendInvoice", function(data)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    if not Player then return end

    local senderId = Player.PlayerData.citizenid
    local senderName = Player.PlayerData.charinfo.firstname .. " " .. Player.PlayerData.charinfo.lastname

    local receiverId = data.receiverCitizenId
    local amount = tonumber(data.amount)
    local reason = data.reason or "Belirtilmedi"

    if not receiverId or not amount or amount <= 0 then
        TriggerClientEvent("QBCore:Notify", src, "Geçersiz fatura bilgisi!", "error")
        return
    end

    MySQL.insert('INSERT INTO player_invoices (sender_citizenid, receiver_citizenid, amount, reason, status, date) VALUES (?, ?, ?, ?, ?, ?)', {
        senderId,
        receiverId,
        amount,
        reason,
        "unpaid",
        os.date('%Y-%m-%d %H:%M:%S')
    }, function(id)
        if id then
            TriggerClientEvent("QBCore:Notify", src, "Fatura başarıyla gönderildi!", "success")
            local Target = QBCore.Functions.GetPlayerByCitizenId(receiverId)
            if Target then
                TriggerClientEvent("BetterBank:Client:NewInvoiceNotification", Target.PlayerData.source, {
                    id = id,
                    amount = amount,
                    senderName = senderName,
                    reason = reason
                })
            end
        else
            TriggerClientEvent("QBCore:Notify", src, "Fatura gönderilemedi!", "error")
        end
    end)
end)

-- Faturayı öde
RegisterServerEvent("BetterBank:Server:PayInvoice")
AddEventHandler("BetterBank:Server:PayInvoice", function(invoiceId)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    if not Player then return end

    local citizenid = Player.PlayerData.citizenid

    local invoice = MySQL.query.await([[
        SELECT * FROM player_invoices 
        WHERE id = ? AND receiver_citizenid = ?
    ]], { invoiceId, citizenid })

    if not invoice or #invoice == 0 then
        TriggerClientEvent("QBCore:Notify", src, "Fatura bulunamadı!", "error")
        return
    end

    invoice = invoice[1]
    local amount = tonumber(invoice.amount)
    if not amount or amount <= 0 then
        TriggerClientEvent("QBCore:Notify", src, "Geçersiz fatura tutarı!", "error")
        return
    end

    if Player.Functions.RemoveMoney("bank", amount, "Fatura Ödeme") then
        -- Gönderene para aktar
        local sender = QBCore.Functions.GetPlayerByCitizenId(invoice.sender_citizenid)
        if sender then
            sender.Functions.AddMoney("bank", amount, "Fatura Tahsilat")
            TriggerClientEvent("QBCore:Notify", sender.PlayerData.source, "Bir fatura ödendi. +" .. amount .. "$", "success")
        else
            -- Offline oyuncuya veritabanı üzerinden aktar
            MySQL.query.await('UPDATE player_accounts SET amount = amount + ? WHERE citizenid = ?', {
                amount, invoice.sender_citizenid
            })
        end

        -- Fatura kaydını sil
        MySQL.query.await('DELETE FROM player_invoices WHERE id = ?', { invoiceId })

        TriggerClientEvent("QBCore:Notify", src, "Fatura başarıyla ödendi.", "success")
        TriggerClientEvent("BetterBank:Client:InvoicePaid", src, invoiceId)
    else
        TriggerClientEvent("QBCore:Notify", src, "Banka hesabınızda yeterli bakiye yok.", "error")
    end
end)


function CreateOrGetIBAN(source, cb)
    local xPlayer = QBCore.Functions.GetPlayer(source)
    if not xPlayer then
        if cb then cb(nil) end
        return
    end

    MySQL.Async.fetchAll('SELECT IBAN FROM players WHERE citizenid = @citizenid', {
        ['@citizenid'] = xPlayer.PlayerData.citizenid
    }, function(result)
        if result[1] == nil or result[1].IBAN == nil or result[1].IBAN == '0' then
            local function generateIBAN()
                local length = 6
                local randomString = 'HB'

                math.randomseed(os.time() + math.random(1000))
                for i = 1, length do
                    randomString = randomString .. tostring(math.random(0, 9))
                end

                return randomString
            end

            local function checkAndSaveIBAN()
                local newIBAN = generateIBAN()
                MySQL.Async.fetchScalar('SELECT 1 FROM players WHERE IBAN = @IBAN', {
                    ['@IBAN'] = newIBAN
                }, function(exists)
                    if exists then
                        checkAndSaveIBAN()
                    else
                        MySQL.Async.execute('UPDATE players SET IBAN = @IBAN WHERE citizenid = @citizenid', {
                            ['@IBAN'] = newIBAN,
                            ['@citizenid'] = xPlayer.PlayerData.citizenid
                        }, function(rowsChanged)
                            if cb then cb(newIBAN) end
                        end)
                    end
                end)
            end

            checkAndSaveIBAN()
        else
            if cb then cb(result[1].IBAN) end
        end
    end)
end


function IsIBANBelongToCompany(IBAN)
    if not IBAN then return false end

    local result = MySQL.Sync.fetchAll('SELECT 1 FROM betterbankcompanies WHERE IBAN = @IBAN LIMIT 1', {
        ['@IBAN'] = IBAN,
    })

    return result and result[1] ~= nil
end

function GetLastTransactions(IBAN, count)
	local result = MySQL.Sync.fetchAll('SELECT * FROM betterbanktransactions WHERE IBAN = @IBAN ORDER BY time ASC LIMIT '.. tostring(count), {
		['@IBAN'] = IBAN
	})
	return result
end

function GetUnPayedBills(citizenid)
    local bills = MySQL.Sync.fetchAll([[
        SELECT 
            sell_time,
            id,
            citizenid,
            sender,
            amount,
            reason
        FROM phone_invoices
        WHERE citizenid = @citizenid
    ]], { ['@citizenid'] = citizenid })

    return bills
end




RegisterServerEvent('Betterbank:tryToCreateIBANForCompany')
AddEventHandler('Betterbank:tryToCreateIBANForCompany', function(name, IBAN, money)
	if IsIBANExist(IBAN) and not IsIBANBelongToCompany(IBAN) then

	elseif not IsIBANExist(IBAN) then
		MySQL.Async.fetchAll("INSERT INTO betterbankcompanies (fullName, IBAN, moneyAmount) VALUES(@name, @iban, @money)",{
			['@name'] = name,
			['@iban'] = IBAN,
			['@money'] = money,
		})
	
	end
end)

RegisterServerEvent('Betterbank:createBillWithIBANS')
AddEventHandler('Betterbank:createBillWithIBANS', function(targetIBAN, senderIBAN, targetName, senderName, label, amount)
	if amount > 0 and IsIBANExist(targetIBAN) and IsIBANExist(senderIBAN) then
		MySQL.Async.fetchAll("INSERT INTO billing (payerIBAN, senderIBAN, payerFullName, senderFullName, time, label, amount) VALUES(@pIBAN, @sIBAN, @PFN, @SFN, @time, @label, @amount)",{
			['@pIBAN'] = targetIBAN,
			['@sIBAN'] = senderIBAN,
			['@PFN'] = targetName,
			['@SFN'] = senderName,
			['@time'] = GetDateAndTime(),
			['@label'] = label,
			['@amount'] = amount,
		})
	end
end)
