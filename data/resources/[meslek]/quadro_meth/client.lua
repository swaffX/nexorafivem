QBCore = nil
Citizen.CreateThread(function()
    while QBCore == nil do
        TriggerEvent('QBCore:GetObject', function(obj) QBCore = obj end)
        Citizen.Wait(200)
	end
end)  

DrawText3D = function(x, y, z, text)
	SetTextScale(0.35, 0.35)
    SetTextFont(4)
    SetTextProportional(1)
    SetTextColour(255, 255, 255, 215)
    SetTextEntry("STRING")
    SetTextCentre(true)
    AddTextComponentString(text)
    SetDrawOrigin(x,y,z, 0)
    DrawText(0.0, 0.0)
    local factor = (string.len(text)) / 370
    DrawRect(0.0, 0.0+0.0125, 0.017+ factor, 0.03, 0, 0, 0, 75)
    ClearDrawOrigin()
end

local Keys = {
	["ESC"] = 322, ["F1"] = 288, ["F2"] = 289, ["F3"] = 170, ["F5"] = 166, ["F6"] = 167, ["F7"] = 168, ["F8"] = 169, ["F9"] = 56, ["F10"] = 57,
	["~"] = 243, ["1"] = 157, ["2"] = 158, ["3"] = 160, ["4"] = 164, ["5"] = 165, ["6"] = 159, ["7"] = 161, ["8"] = 162, ["9"] = 163, ["-"] = 84, ["="] = 83, ["BACKSPACE"] = 177,
	["TAB"] = 37, ["Q"] = 44, ["W"] = 32, ["E"] = 38, ["R"] = 45, ["T"] = 245, ["Y"] = 246, ["U"] = 303, ["P"] = 199, ["["] = 39, ["]"] = 40, ["ENTER"] = 18,
	["CAPS"] = 137, ["A"] = 34, ["S"] = 8, ["D"] = 9, ["F"] = 23, ["G"] = 47, ["H"] = 74, ["K"] = 311, ["L"] = 182,
	["LEFTSHIFT"] = 21, ["Z"] = 20, ["X"] = 73, ["C"] = 26, ["V"] = 0, ["B"] = 29, ["N"] = 249, ["M"] = 244, [","] = 82, ["."] = 81,
	["LEFTCTRL"] = 36, ["LEFTALT"] = 19, ["SPACE"] = 22, ["RIGHTCTRL"] = 70,
	["HOME"] = 213, ["PAGEUP"] = 10, ["PAGEDOWN"] = 11, ["DELETE"] = 178,
	["LEFT"] = 174, ["RIGHT"] = 175, ["TOP"] = 27, ["DOWN"] = 173,
	["NENTER"] = 201, ["N4"] = 108, ["N5"] = 60, ["N6"] = 107, ["N+"] = 96, ["N-"] = 97, ["N7"] = 117, ["N8"] = 61, ["N9"] = 118
}

local started = false
local progress = 0
local CurrentVehicle 
local pause = false
local quality = 0
local LastCar

Citizen.CreateThread(function()
	while true do
		Citizen.Wait(60000)
		local plyPed = PlayerPedId()
    	plyVeh = GetVehiclePedIsIn(plyPed, false)
		if IsVehicleModel(plyVeh, 'journey') then
			QBCore.Functions.Notify("/methbaslat yazarak meth yapmaya başlayabilirsin")
		end
	end
end)

RegisterCommand('methbaslat', function()
	local playeramk = PlayerPedId()
	local playerpos = GetEntityCoords(playeramk)
	local uzaklik = GetDistanceBetweenCoords(playerpos.x, playerpos.y, playerpos.z, -290.15, -852.70, 31.76)
	playerarabasiaq = GetVehiclePedIsIn(playeramk, false)
	print(uzaklik)
	if started == false then
	if IsVehicleModel(playerarabasiaq, 'journey') then
		if uzaklik > 2000 then
			TriggerServerEvent('qb-methcar:start')
		else
			QBCore.Functions.Notify("Şehir Bölgesinden Uzaklaş!", "error")
		end
	else
		QBCore.Functions.Notify("Meth Aracında Olmalısın", "error")
	end
else
	QBCore.Functions.Notify("Yaptın kankam bug :D", "error")
end
end)

RegisterNetEvent('qb-methcar:stop')
AddEventHandler('qb-methcar:stop', function()
	started = false
	QBCore.Functions.Notify("Meth İşlemi Durduruldu...", "error")
	FreezeEntityPosition(LastCar, false)
end)

RegisterNetEvent('qb-methcar:stopfreeze')
AddEventHandler('qb-methcar:stopfreeze', function(id)
	FreezeEntityPosition(id, false)
end)

RegisterNetEvent('qb-methcar:notify')
AddEventHandler('qb-methcar:notify', function(message)
	QBCore.Functions.Notify(message)
end)

RegisterNetEvent('qb-methcar:startprod')
AddEventHandler('qb-methcar:startprod', function()
	started = true
	FreezeEntityPosition(CurrentVehicle,true)
	QBCore.Functions.Notify("Meth İşlemi Başladı", "success")	
	SetPedIntoVehicle((PlayerPedId()), CurrentVehicle, 3)
	SetVehicleDoorOpen(CurrentVehicle, 2)
end)

RegisterNetEvent('qb-methcar:smoke')
AddEventHandler('qb-methcar:smoke', function(posx, posy, posz, bool)
	if bool == 'a' then
		if not HasNamedPtfxAssetLoaded("core") then
			RequestNamedPtfxAsset("core")
			while not HasNamedPtfxAssetLoaded("core") do
				Citizen.Wait(1)
			end
		end
		SetPtfxAssetNextCall("core")
		local smoke = StartParticleFxLoopedAtCoord("exp_grd_flare", posx, posy, posz + 1.6, 0.0, 0.0, 0.0, 1.0, false, false, false, false)
		SetParticleFxLoopedAlpha(smoke, 0.9)
		Citizen.Wait(60000)
		StopParticleFxLooped(smoke, 0)
	else
		StopParticleFxLooped(smoke, 0)
	end
end)

-------------------------------------------------------EVENTS NEGATIVE
RegisterNetEvent('qb-methcar:boom', function()
	playerPed = (PlayerPedId())
	local pos = GetEntityCoords((PlayerPedId()))
	pause = false
	Citizen.Wait(500)
	started = false
	Citizen.Wait(500)
	CurrentVehicle = GetVehiclePedIsUsing(PlayerPedId(-1))
	TriggerServerEvent('qb-methcar:blow', pos.x, pos.y, pos.z)
	TriggerEvent('qb-methcar:stop')
	FreezeEntityPosition(LastCar,false)
	TriggerEvent("gr-policeAlert:alert", 'Patlamış Meth Aracı', false, false, false)
	TriggerServerEvent("gr-policeAlert:server:codeAlert", codeLvl, x, y)
end)

RegisterNetEvent('qb-methcar:blowup')
AddEventHandler('qb-methcar:blowup', function(posx, posy, posz)
	AddExplosion(posx, posy, posz + 2, 15, 20.0, true, false, 1.0, true)
	if not HasNamedPtfxAssetLoaded("core") then
		RequestNamedPtfxAsset("core")
		while not HasNamedPtfxAssetLoaded("core") do
			Citizen.Wait(1)
		end
	end
	SetPtfxAssetNextCall("core")
	local fire = StartParticleFxLoopedAtCoord("ent_ray_heli_aprtmnt_l_fire", posx, posy, posz-0.8 , 0.0, 0.0, 0.0, 0.8, false, false, false, false)
	Citizen.Wait(6000)
	StopParticleFxLooped(fire, 0)	
end)

RegisterNetEvent('qb-methcar:drugged')
AddEventHandler('qb-methcar:drugged', function()
	local pos = GetEntityCoords((PlayerPedId()))
	SetTimecycleModifier("drug_drive_blend01")
	SetPedMotionBlur((PlayerPedId()), true)
	SetPedMovementClipset((PlayerPedId()), "MOVE_M@DRUNK@SLIGHTLYDRUNK", true)
	SetPedIsDrunk((PlayerPedId()), true)
	quality = quality - 3
	pause = false
	Citizen.Wait(90000)
	ClearTimecycleModifier()
	TriggerServerEvent('qb-methcar:make', pos.x,pos.y,pos.z)
end)

RegisterNetEvent('qb-methcar:q-1police', function(data)
	local pos = GetEntityCoords((PlayerPedId()))
	QBCore.Functions.Notify(data.message, "error")
	quality = quality - 1
	pause = false
	TriggerEvent("gr-policeAlert:alert", 'Meth Aracı İhbarı', false, false, false)
	TriggerServerEvent("gr-policeAlert:server:codeAlert", codeLvl, x, y)
	TriggerServerEvent('qb-methcar:make', pos.x,pos.y,pos.z)
end)

RegisterNetEvent('qb-methcar:q-1', function(data)
	local pos = GetEntityCoords((PlayerPedId()))
	QBCore.Functions.Notify(data.message, "error")
	quality = quality - 1
	pause = false
	TriggerServerEvent('qb-methcar:make', pos.x,pos.y,pos.z)
end)

RegisterNetEvent('qb-methcar:q-3', function(data)
	local pos = GetEntityCoords((PlayerPedId()))
	QBCore.Functions.Notify(data.message, "error")
	quality = quality - 3
	pause = false
	TriggerServerEvent('qb-methcar:make', pos.x,pos.y,pos.z)
end)

RegisterNetEvent('qb-methcar:q-5', function(data)
	local pos = GetEntityCoords((PlayerPedId()))
	QBCore.Functions.Notify(data.message, "error")
	quality = quality - 5
	pause = false
	TriggerServerEvent('qb-methcar:make', pos.x,pos.y,pos.z)
end)

-------------------------------------------------------EVENTS POSITIVE
RegisterNetEvent('qb-methcar:q2', function(data)
	local pos = GetEntityCoords((PlayerPedId()))
	QBCore.Functions.Notify(data.message, "success")
	quality = quality + 2
	pause = false
	TriggerServerEvent('qb-methcar:make', pos.x,pos.y,pos.z)
end)

RegisterNetEvent('qb-methcar:q3', function(data)
	local pos = GetEntityCoords((PlayerPedId()))
	QBCore.Functions.Notify(data.message, "success")
	quality = quality + 3
	pause = false
	TriggerServerEvent('qb-methcar:make', pos.x,pos.y,pos.z)
end)

RegisterNetEvent('qb-methcar:q5', function(data)
	local pos = GetEntityCoords((PlayerPedId()))
	QBCore.Functions.Notify(data.message, "success")
	quality = quality + 5
	pause = false
	TriggerServerEvent('qb-methcar:make', pos.x,pos.y,pos.z)
end)

RegisterNetEvent('qb-methcar:gasmask', function(data)
	local pos = GetEntityCoords((PlayerPedId()))
	QBCore.Functions.Notify(data.message, "success")
	SetPedPropIndex(playerPed, 1, 26, 7, true)
	quality = quality + 2
	pause = false
	TriggerServerEvent('qb-methcar:make', pos.x,pos.y,pos.z)
end)

-------------------------------------------------------THREAD
Citizen.CreateThread(function(data)
	while true do
		Citizen.Wait(3)		
		playerPed = (PlayerPedId())
		local pos = GetEntityCoords((PlayerPedId()))
		if IsPedInAnyVehicle(playerPed) then	
			CurrentVehicle = GetVehiclePedIsUsing(PlayerPedId())
			car = GetVehiclePedIsIn(playerPed, false)
			LastCar = GetVehiclePedIsUsing(playerPed)	
			local model = GetEntityModel(CurrentVehicle)
			local modelName = GetDisplayNameFromVehicleModel(model)			
			if modelName == 'JOURNEY' and car then				
					if GetPedInVehicleSeat(car, -0) == playerPed then
							DrawText3D(pos.x, pos.y, pos.z, '~g~E~w~ to (cook)')
							if IsControlJustReleased(0, Keys['E']) then
								if IsVehicleSeatFree(CurrentVehicle, 3) then
									TriggerServerEvent('qb-methcar:start')
									TriggerServerEvent('qb-methcar:make', pos.x,pos.y,pos.z)
									progress = 0
									pause = false
									quality = 0		
								else
									QBCore.Functions.Notify('Mutfak zaten kullanılıyor')
								end
							end
					end		
			end			
		else	
				if started then
					started = false
					TriggerEvent('qb-methcar:stop')
					FreezeEntityPosition(LastCar,false)
				end
		end		
		if started == true then			
			if progress < 96 then
				Citizen.Wait(500)
				-- TriggerServerEvent('qb-methcar:make', pos.x,pos.y,pos.z)
				if not pause and IsPedInAnyVehicle(playerPed) then
					progress = progress +  1
					quality = quality + 1
					QBCore.Functions.Notify('Meth üretimi: ' .. progress .. '%')
					Citizen.Wait(100)
				end
				--
				--   EVENT 1
				--
				if progress > 9 and progress < 11 then
					pause = true
					exports['qb-menu']:openMenu({
						{
							header = "Gaz tankı sızdırıyor, şimdi ne yapıcaksın ?",
							txt = "Cevabını seç, ilerlemen: " .. progress .. "%",
							isMenuHeader = true,
						},
						{
							header = "🔴 Bantla kapatmaya çalış",
							params = {
								event = "qb-methcar:q-3",
								args = {
									message = "Düzelmiş gibi duruyor, sanırım ?!"
								}
							}
						},
						{
							header = "🔴 Salla gitsin",
							params = {
								event = "qb-methcar:boom"
							}
						},
						{
							header = "🔴 Tankı yenile",
							params = {
								event = "qb-methcar:q5",
								args = {
									message = "Sanırım en iyi fikir buydu !!!"
								}
							}
						},
					})
				end
				--
				--   EVENT 2
				--
				if progress > 19 and progress < 21 then
					pause = true
					exports['qb-menu']:openMenu({
						{
							header = "Yere biraz aseton döktün, şimdi ne yapıcaksın ?",
							txt = "Cevabını seç, ilerlemen: " .. progress .. "%",
							isMenuHeader = true,
						},
						{
							header = "🔴 Camı aç",
							params = {
								event = "qb-methcar:q-1police",
								args = {
									message = "Koku dışarı yayıldı,birileri anlayabilir..."
								}
							}
						},
						{
							header = "🔴 Solumaya devam et",
							params = {
								event = "qb-methcar:drugged"
							}
						},
						{
							header = "🔴 Gaz maskesi tak",
							params = {
								event = "qb-methcar:gasmask",
								args = {
									message = "İyi fikir!"
								}
							}
						},
					})
				end
				--
				--   EVENT 3
				--
				if progress > 29 and progress < 31 then
					pause = true
					exports['qb-menu']:openMenu({
						{
							header = "Meth derişimi azalmaya başladı, ne yapıcaksın?",
							txt = "Cevabını seç, ilerlemen: " .. progress .. "%",
							isMenuHeader = true,
						},
						{
							header = "🔴 Sıcaklığı arttır",
							params = {
								event = "qb-methcar:q5",
								args = {
									message = "Sıcaklığı arttırmak mükemmel şekilde dengeledi!"
								}
							}
						},
						{
							header = "🔴 Basıncı arttır",
							params = {
								event = "qb-methcar:q-3",
								args = {
									message = "Basınç dalgalanmaya başladı"
								}
							}
						},
						{
							header = "🔴 Basıncı azalt",
							params = {
								event = "qb-methcar:q-5",
								args = {
									message = "Ah, bu kötü bir fikirdi..."
								}
							}
						},
					})
				end
				--
				--   EVENT 4
				--
				if progress > 39 and progress < 41 then
					pause = true
					exports['qb-menu']:openMenu({
						{
							header = "Yanlışlıkla çok fazla aseton ekledin, ne yapıcaksın?",
							txt = "Cevabını seç, ilerlemen: " .. progress .. "%",
							isMenuHeader = true,
						},
						{
							header = "🔴 Hiçbir şey yapma",
							params = {
								event = "qb-methcar:q-5",
								args = {
									message = "Meth saf aseton gibi kokmaya başladı"
								}
							}
						},
						{
							header = "🔴 Pipetle çekmeye çalış",
							params = {
								event = "qb-methcar:drugged"
							}
						},
						{
							header = "🔴 Stabilize etmek için metilamin ekle",
							params = {
								event = "qb-methcar:q5",
								args = {
									message = "Akıllıca..."
								}
							}
						},
					})
				end
				--
				--   EVENT 5
				--
				if progress > 49 and progress < 51 then
					pause = true
					exports['qb-menu']:openMenu({
						{
							header = "Mavi pigmentler oluşmaya başladı, ne yapıcaksın?",
							txt = "Cevabını seç, ilerlemen: " .. progress .. "%",
							isMenuHeader = true,
						},
						{
							header = "🔴 Karışımın içine ekle!",
							params = {
								event = "qb-methcar:q5",
								args = {
									message = "Zekice, insanlar buna bayılacak!"
								}
							}
						},
						{
							header = "🔴 Çöpe at",
							params = {
								event = "qb-methcar:q-1",
								args = {
									message = "Pek yaratıcı değil gibisin..."
								}
							}
						},
					})
				end
				--
				--   EVENT 6
				--
				if progress > 59 and progress < 61 then
					pause = true
					exports['qb-menu']:openMenu({
						{
							header = "Filtre kirlendi, şimdi ne yapıcaksın?",
							txt = "Cevabını seç, ilerlemen: " .. progress .. "%",
							isMenuHeader = true,
						},
						{
							header = "🔴 Hava kompresörü ile temizle",
							params = {
								event = "qb-methcar:q-5",
								args = {
									message = "Ürünü berbat ettin!"
								}
							}
						},
						{
							header = "🔴 Filtreyi yenile",
							params = {
								event = "qb-methcar:q5",
								args = {
									message = "Bu en iyi karardı"
								}
							}
						},
						{
							header = "🔴 Fırçayla temizle",
							params = {
								event = "qb-methcar:q-1",
								args = {
									message = "İşe yaradı fakat yeterli değil..."
								}
							}
						},
					})
				end
				--
				--   EVENT 7
				--
				if progress > 69 and progress < 71 then
					pause = true
					exports['qb-menu']:openMenu({
						{
							header = "Yere biraz aseton döktün, şimdi ne yapıcaksın ?",
							txt = "Cevabını seç, ilerlemen: " .. progress .. "%",
							isMenuHeader = true,
						},
						{
							header = "🔴 Solumaya devam et",
							params = {
								event = "qb-methcar:drugged"
							}
						},
						{
							header = "🔴 Gaz maskesi tak",
							params = {
								event = "qb-methcar:gasmask",
								args = {
									message = "İyi seçim"
								}
							}
						},
						{
							header = "🔴 Cam aç",
							params = {
								event = "qb-methcar:q-1police",
								args = {
									message = "Koku etraftaki insanlara gitmiş olmalı..."
								}
							}
						},
					})
				end
				--
				--   EVENT 8
				--
				if progress > 79 and progress < 81 then
					pause = true
					exports['qb-menu']:openMenu({
						{
							header = "Gaz tankı sızdırıyor, ne yapıcaksın?",
							txt = "Cevabını seç, ilerlemen: " .. progress .. "%",
							isMenuHeader = true,
						},
						{
							header = "🔴 Boşver",
							params = {
								event = "qb-methcar:boom"
							}
						},
						{
							header = "🔴 Bantla tamir et",
							params = {
								event = "qb-methcar:q-3",
								args = {
									message = "Bu işe yaramış olmalı, sanırım?!"
								}
							}
						},
						{
							header = "🔴 Tankı değiştir",
							params = {
								event = "qb-methcar:q5",
								args = {
									message = "Bu en iyi fikirdi!"
								}
							}
						},
					})
				end
				--
				--   EVENT 9
				--
				if progress > 89 and progress < 91 then
					pause = true
					exports['qb-menu']:openMenu({
						{
							header = "Çok tuvaletin geldi, ne yapıcaksın ?",
							txt = "Cevabını seç, ilerlemen: " .. progress .. "%",
							isMenuHeader = true,
						},
						{
							header = "🔴 Sabret ve tuvaletini tut",
							params = {
								event = "qb-methcar:q5",
								args = {
									message = "İyi iş!"
								}
							}
						},
						{
							header = "🔴 Dışarıya çık ve tuvaletini yap",
							params = {
								event = "qb-methcar:q-1police",
								args = {
									message = "Biri seni şüpheli işler yaparken farketti"
								}
							}
						},
						{
							header = "🔴 Bırak gitsin",
							params = {
								event = "qb-methcar:q-5",
								args = {
									message = "Ah, bu iyi değil.Her şey bok gibi kokuyor"
								}
							}
						},
					})
				end
			else
				TriggerEvent('qb-methcar:stop')
				progress = 100
				QBCore.Functions.Notify('Meth üretimi: ' .. progress .. '%')
				QBCore.Functions.Notify("Başarılı!!!", "success")
				TriggerServerEvent('qb-methcar:finish', quality)
				progress = 0
				SetPedPropIndex(playerPed, 1, 0, 0, true)
				FreezeEntityPosition(LastCar, false)
				TaskLeaveVehicle(playerPed, LastCar, 0)
			end				
		end		
	end
end)

Citizen.CreateThread(function()
	while true do
		Citizen.Wait(1000)
			if IsPedInAnyVehicle((PlayerPedId())) then
			else
				if started then
					started = false
					TriggerEvent('qb-methcar:stop')
					FreezeEntityPosition(LastCar,false)
				end		
			end
	end
end)
