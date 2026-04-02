local QBCore = nil
TriggerEvent('QBCore:GetObject', function(obj) QBCore = obj end)

RegisterServerEvent('qb-methcar:start')
AddEventHandler('qb-methcar:start', function()
	local _source = source
	local Player = QBCore.Functions.GetPlayer(source)
	local ItemAcetone = Player.Functions.GetItemByName("acetone")
    local ItemLithium = Player.Functions.GetItemByName("lithium")
	local ItemMethlab = Player.Functions.GetItemByName("lab")
	if ItemAcetone ~= nil and ItemLithium ~= nil and ItemMethlab ~= nil then
		if ItemAcetone.amount >= 5 and ItemLithium.amount >= 2 and ItemMethlab.amount >= 1 then	
			TriggerClientEvent("qb-methcar:startprod", _source)
			 Player.Functions.RemoveItem("acetone", 5, false)
			 Player.Functions.RemoveItem("lithium", 2, false)
		else
		TriggerClientEvent('QBCore:Notify', source, "Gerekli Eşyalar Yok", 'error')
		TriggerClientEvent('QBCore:Notify', source, "Gereken Eşyalar: 5 Aseton , 2 Lityum , 1 Meth Lab", 'error')
		end	
	else
	TriggerClientEvent('QBCore:Notify', source, "Temel malzemeleri kaçırıyorsunuz!", 'error')
	end	
end)

RegisterServerEvent('qb-methcar:stopf')
AddEventHandler('qb-methcar:stopf', function(id)
local _source = source
	local xPlayers = QBCore.Functions.GetPlayers()
	local xPlayer = QBCore.Functions.GetPlayer(tonumber(source))
	for i=1, #xPlayers, 1 do
		TriggerClientEvent('qb-methcar:stopfreeze', xPlayers[i], id)
	end	
end)

RegisterServerEvent('qb-methcar:make')
AddEventHandler('qb-methcar:make', function(posx,posy,posz)
	local _source = source
	local xPlayer = QBCore.Functions.GetPlayer(tonumber(source))
	if xPlayer.Functions.GetItemByName('lab') ~= nil then
		if xPlayer.Functions.GetItemByName('lab').amount >= 1 then	
			local xPlayers = QBCore.Functions.GetPlayers()
			for i=1, #xPlayers, 1 do
				TriggerClientEvent('qb-methcar:smoke',xPlayers[i],posx,posy,posz, 'a') 
			end		
		else
			TriggerClientEvent('qb-methcar:stop', _source)
		end
	else
	TriggerClientEvent('QBCore:Notify', source, "Meth Lab'ın Yok", 'error')
	end	
end)

RegisterServerEvent('qb-methcar:finish')
AddEventHandler('qb-methcar:finish', function(qualtiy)
	local _source = source
	local xPlayer = QBCore.Functions.GetPlayer(tonumber(source))
	local rnd = math.random(-5, 5)
	print('1')
	xPlayer.Functions.AddItem('meth', math.floor(qualtiy / 2) + rnd)	
end)

RegisterServerEvent('qb-methcar:blow')
AddEventHandler('qb-methcar:blow', function(posx, posy, posz)
	local _source = source
	local xPlayers = QBCore.Functions.GetPlayers()
	local xPlayer = QBCore.Functions.GetPlayer(tonumber(source))
	for i=1, #xPlayers, 1 do
		TriggerClientEvent('qb-methcar:blowup', xPlayers[i],posx, posy, posz)
	end
	 xPlayer.Functions.RemoveItem('methlab', 1)
end)