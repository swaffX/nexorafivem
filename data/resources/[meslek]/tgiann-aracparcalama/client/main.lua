local yeniProp, arac = nil, nil
local aracParcalamaAktif, islemDevamEdiyor, clientcooldown = false, false, true
local kapiSayisi, islem, gerekenPolis, glevel = 0, 0, 0, 0 -- 0, 0, 1, 4
local parcalamaNokta = vector3(-557.64, -1695.82, 19.16)
local arkaKapi = false

QBCore = nil
local coreLoaded = false
Citizen.CreateThread(function()
    while QBCore == nil do
        TriggerEvent('QBCore:GetObject', function(obj) QBCore = obj end)
        Citizen.Wait(200)
    end
    coreLoaded = true
end)

local aracParcaNokta = {
	{
		["isim"] = "Ön Sol Kapı",
		["kod-isim"] = "on_sol_kapi",
		["sure"] = 3000,
		["sure-isim"] = "Kapıyı Söküyorsun",
		["parca-native-no"] = 0,
		["kordinat"] = {
			["x"] = -558.96,
			["y"] = -1696.59,
			["z"] = 19.13,
			["h"] = 296.08,
		},
		["animasyon"] = {
			["seneryo"] = "true",
			["seneryo-anim"] = "WORLD_HUMAN_WELDING"
		},
		["prop"] =  "prop_car_door_01",
		["entity-attach"] = {
			["bone"] = 57005,
			["xPos"] = 0.4,
			["yPos"] = 0,
			["zPos"] = 0,
			["xRot"] = 0,
			["yRot"] = 270.0,
			["zRot"] = 60.0,
		},
		["prop-anim"] = {
			["prop-dics"] = "anim@heists@narcotics@trash",
			["prop-name"] = "walk"
		}
	},
	{
		["isim"] = "Ön Sol Kapıyı Kutula",
		["kod-isim"] = "on_sol_kapi_kutu",
		["sure"] = 2500,
		["sure-isim"] = "Ön Sol Kapı Kutulanıyor",
		["kordinat"] = {
			["x"] = -556.23,
			["y"] = -1704.21,
			["z"] = 19.06,
			["h"] = 114.17,
		},
		["animasyon"] = {
			["seneryo"] = false,
			["anim-disc"] = "anim@heists@load_box",
			["anim-name"] = "load_box_3"
		},
		["prop"] =  "sil",
	},
	{
		["isim"] = "Ön sag Kapı",
		["kod-isim"] = "on_sag_kapi",
		["sure"] = 3000,
		["sure-isim"] = "Kapıyı Söküyorsun",
		["parca-native-no"] = 1,
		["kordinat"] = {
			["x"] = -556.79,
			["y"] = -1694.99,
			["z"] = 19.2,
			["h"] = 120.54,
		},
		["animasyon"] = {
			["seneryo"] = true,
			["seneryo-anim"] = "WORLD_HUMAN_WELDING"
		},
		["prop"] =  "prop_car_door_01",
		["entity-attach"] = {
			["bone"] = 57005,
			["xPos"] = 0.4,
			["yPos"] = 0,
			["zPos"] = 0,
			["xRot"] = 0,
			["yRot"] = 270.0,
			["zRot"] = 60.0,
		},
		["prop-anim"] = {
			["prop-dics"] = "anim@heists@narcotics@trash",
			["prop-name"] = "walk"
		}
	},
	{
		["isim"] = "Ön Sag Kapıyı Kutula",
		["kod-isim"] = "on_sag_kapi_kutu",
		["sure"] = 2500,
		["sure-isim"] = "Ön Sag Kapı Kutulanıyor",
		["kordinat"] = {
			["x"] = -556.23,
			["y"] = -1704.21,
			["z"] = 19.06,
			["h"] = 114.17,
		},
		["animasyon"] = {
			["seneryo"] = false,
			["anim-disc"] = "anim@heists@load_box",
			["anim-name"] = "load_box_3"
		},
		["prop"] =  "sil",
	},
	{
		["isim"] = "Arka sol Kapı",
		["kod-isim"] = "arka_sol_kapi",
		["sure"] = 3000,
		["sure-isim"] = "Kapıyı Söküyorsun",
		["parca-native-no"] = 2,
		["kordinat"] = {
			["x"] = -558.48,
			["y"] = -1697.1,
			["z"] = 19.13,
			["h"] = 304.72,
		},
		["animasyon"] = {
			["seneryo"] = true,
			["seneryo-anim"] = "WORLD_HUMAN_WELDING"
		},
		["prop"] =  "prop_car_door_01",
		["entity-attach"] = {
			["bone"] = 57005,
			["xPos"] = 0.4,
			["yPos"] = 0,
			["zPos"] = 0,
			["xRot"] = 0,
			["yRot"] = 270.0,
			["zRot"] = 60.0,
		},
		["prop-anim"] = {
			["prop-dics"] = "anim@heists@narcotics@trash",
			["prop-name"] = "walk"
		}
	},
	{
		["isim"] = "Arka Sol Kapıyı Kutula",
		["kod-isim"] = "arka_sol_kapi_kutu",
		["sure"] = 2500,
		["sure-isim"] = "Arka Sol Kapı Kutulanıyor",
		["kordinat"] = {
			["x"] = -556.23,
			["y"] = -1704.21,
			["z"] = 19.06,
			["h"] = 114.17,
		},
		["animasyon"] = {
			["seneryo"] = false,
			["anim-disc"] = "anim@heists@load_box",
			["anim-name"] = "load_box_3"
		},
		["prop"] =  "sil",
	},
	{
		["isim"] = "Arka sag Kapı",
		["kod-isim"] = "arka_sag_kapi",
		["sure"] = 3000,
		["sure-isim"] = "Kapıyı Söküyorsun",
		["parca-native-no"] = 3,
		["kordinat"] = {
			["x"] = -556.26,
			["y"] = -1695.81,
			["z"] = 19.19,
			["h"] = 122.01,
		},
		["animasyon"] = {
			["seneryo"] = true,
			["seneryo-anim"] = "WORLD_HUMAN_WELDING",
		},
		["prop"] =  "prop_car_door_01",
		["entity-attach"] = {
			["bone"] = 57005,
			["xPos"] = 0.4,
			["yPos"] = 0,
			["zPos"] = 0,
			["xRot"] = 0,
			["yRot"] = 270.0,
			["zRot"] = 60.0,
		},
		["prop-anim"] = {
			["prop-dics"] = "anim@heists@narcotics@trash",
			["prop-name"] = "walk"
		}
	},
	{
		["isim"] = "Arka Sag Kapıyı Kutula",
		["kod-isim"] = "arka_sag_kapi_kutu",
		["sure"] = 2500,
		["sure-isim"] = "Arka Sag Kapı Kutulanıyor",
		["kordinat"] = {
			["x"] = -556.23,
			["y"] = -1704.21,
			["z"] = 19.06,
			["h"] = 114.17,
		},
		["animasyon"] = {
			["seneryo"] = false,
			["anim-disc"] = "anim@heists@load_box",
			["anim-name"] = "load_box_3"
		},
		["prop"] =  "sil",
	},
	{
		["isim"] = "Bagaj",
		["kod-isim"] = "bagaj",
		["sure"] = 3000,
		["sure-isim"] = "Bagajı Söküyorsun",
		["parca-native-no"] = 5,
		["kordinat"] = {
			["x"] = -555.21,
			["y"] = -1697.39,
			["z"] = 19.18,
			["h"] = 75.46,
		},
		["animasyon"] = {
			["seneryo"] = true,
			["seneryo-anim"] = "PROP_HUMAN_BUM_BIN"
		},
		["prop"] =  "prop_cs_cardbox_01",
		["entity-attach"] = {
			["bone"] = 28422,
			["xPos"] = 0.0,
			["yPos"] = -0.03,
			["zPos"] = 0.0,
			["xRot"] = 5.0,
			["yRot"] = 0.0,
			["zRot"] = 0.0,
		},
		["prop-anim"] = {
			["prop-dics"] = "anim@heists@box_carry@",
			["prop-name"] = "idle"
		}
	},
	{
		["isim"] = "Bagajı Kutula",
		["kod-isim"] = "bagaj_kutula",
		["sure"] = 2500,
		["sure-isim"] = "Bagaj Kapısı Kutulanıyor",
		["kordinat"] = {
			["x"] = -556.23,
			["y"] = -1704.21,
			["z"] = 19.06,
			["h"] = 114.17,
		},
		["animasyon"] = {
			["seneryo"] = false,
			["anim-disc"] = "anim@heists@load_box",
			["anim-name"] = "load_box_3"
		},
		["prop"] =  "sil",
	},
	{
		["isim"] = "Ön Kaput",
		["kod-isim"] = "on_kaput",
		["sure"] = 3000,
		["sure-isim"] = "Ön Kaputu Söküyorsun",
		["parca-native-no"] = 4,
		["kordinat"] = {
			["x"] = -559.76,
			["y"] = -1694.32,
			["z"] = 19.15,
			["h"] = 252.67,
		},
		["animasyon"] = {
			["seneryo"] = true,
			["seneryo-anim"] = "PROP_HUMAN_BUM_BIN"
		},
		["prop"] =  "prop_cs_cardbox_01",
		["entity-attach"] = {
			["bone"] = 28422,
			["xPos"] = 0.0,
			["yPos"] = -0.03,
			["zPos"] = 0.0,
			["xRot"] = 5.0,
			["yRot"] = 0.0,
			["zRot"] = 0.0,
		},
		["prop-anim"] = {
			["prop-dics"] = "anim@heists@box_carry@",
			["prop-name"] = "idle"
		}
	},
	{
		["isim"] = "Ön Kaputu Kutula",
		["kod-isim"] = "on_kaput_kutula",
		["sure"] = 2500,
		["sure-isim"] = "Ön Kaput Kutulanıyor",
		["kordinat"] = {
			["x"] = -556.23,
			["y"] = -1704.21,
			["z"] = 19.06,
			["h"] = 114.17,
		},
		["animasyon"] = {
			["seneryo"] = false,
			["anim-disc"] = "anim@heists@load_box",
			["anim-name"] = "load_box_3"
		},
		["prop"] =  "sil",
	},
	{
		["isim"] = "Radyo",
		["kod-isim"] = "radyo",
		["sure"] = 3000,
		["sure-isim"] = "Radyoyu Söküyorsun",
		["parca-native-no"] = nil,
		["kordinat"] = {
			["x"] = -558.72,
			["y"] = -1696.33,
			["z"] = 19.13,
			["h"] = 313.86,
		},
		["animasyon"] = {
			["seneryo"] = true,
			["seneryo-anim"] = "PROP_HUMAN_BUM_BIN"
		},
		["prop"] =  "prop_cs_cardbox_01",
		["entity-attach"] = {
			["bone"] = 28422,
			["xPos"] = 0.0,
			["yPos"] = -0.03,
			["zPos"] = 0.0,
			["xRot"] = 5.0,
			["yRot"] = 0.0,
			["zRot"] = 0.0,
		},	
		["prop-anim"] = {
			["prop-dics"] = "anim@heists@box_carry@",
			["prop-name"] = "idle"
		}
	},
	{
		["isim"] = "Radyo Kutula",
		["kod-isim"] = "radyo_kutula",
		["sure"] = 2500,
		["sure-isim"] = "Radyo Kutulanıyor",
		["kordinat"] = {
			["x"] = -556.23,
			["y"] = -1704.21,
			["z"] = 19.06,
			["h"] = 114.17,
		},
		["animasyon"] = {
			["seneryo"] = false,
			["anim-disc"] = "anim@heists@load_box",
			["anim-name"] = "load_box_3"
		},
		["prop"] =  "sil",
	},
	{
		["isim"] = "Kutulanan Parcaları Al",
		["kod-isim"] = "parcaları_al",
		["sure"] = 1000,
		["sure-isim"] = "Kutulanmış Parçalar Toplanıyor",
		["kordinat"] = {
			["x"] = -556.23,
			["y"] = -1704.21,
			["z"] = 19.06,
			["h"] = 114.17,
		},
		["animasyon"] = {
			["seneryo"] = false,
			["anim-disc"] = "anim@mp_fireworks",
			["anim-name"] = "place_firework_3_box"
		},
		["prop"] =  "son",
	}

}

Citizen.CreateThread(function ()
	while true do
		local time = 1000
		if aracParcalamaAktif then
			local playerPed = PlayerPedId()
			local playerKordinat = GetEntityCoords(playerPed)
			local mesafe = #(playerKordinat - vector3(aracParcaNokta[islem]["kordinat"]["x"], aracParcaNokta[islem]["kordinat"]["y"], aracParcaNokta[islem]["kordinat"]["z"]))
			if mesafe < 18 then
				time = 1
				DrawMarker(2, aracParcaNokta[islem]["kordinat"]["x"], aracParcaNokta[islem]["kordinat"]["y"], aracParcaNokta[islem]["kordinat"]["z"]-0.5, 0.0, 0.0, 0.0, 0, 0.0, 0.0, 0.3, 0.3, 0.3, 255, 0, 0, 100, false, true, 2, false, false, false, false)
				if mesafe < 2 and not islemDevamEdiyor then
					QBCore.Functions.DrawText3D(aracParcaNokta[islem]["kordinat"]["x"], aracParcaNokta[islem]["kordinat"]["y"], aracParcaNokta[islem]["kordinat"]["z"]-0.2, "~w~~g~[E]~w~ " .. aracParcaNokta[islem]["isim"])
					if IsControlJustPressed(1, 38) then
						islemDevamEdiyor = true
						SetEntityHeading(playerPed, aracParcaNokta[islem]["kordinat"]["h"])

						if aracParcaNokta[islem]["prop"] == "sil" and aracParcaNokta[islem]["prop"] ~= "son" then 
							DeleteEntity(yeniProp)	
							if aracParcaNokta[islem]["prop"] == "sil" then
								yeniProp = CreateObject(`prop_cs_cardbox_01`, aracParcaNokta[islem]["kordinat"]["x"], aracParcaNokta[islem]["kordinat"]["y"], aracParcaNokta[islem]["kordinat"]["z"], true)
								SetEntityCollision(yeniProp, false, false)
								PlaceObjectOnGroundProperly(yeniProp)
								if DoesEntityExist(yeniProp) then
									AttachEntityToEntity(yeniProp, playerPed, GetPedBoneIndex(playerPed, 28422), 0.0, -0.03, 0.0, 5.0, 0.0, 0.0, true, true, false, true, 1, true)
									ClearPedTasks(PlayerPedId())
								end	
							end
						end

						if aracParcaNokta[islem]["animasyon"]["seneryo"] then
							TaskStartScenarioInPlace(playerPed, aracParcaNokta[islem]["animasyon"]["seneryo-anim"], 0, true)
						else
							QBCore.Shared.RequestAnimDict(aracParcaNokta[islem]["animasyon"]["anim-disc"], function()
								TaskPlayAnim(playerPed, aracParcaNokta[islem]["animasyon"]["anim-disc"], aracParcaNokta[islem]["animasyon"]["anim-name"], 8.0, 8.0, -1, 33, 0, 0, 0, 0)
							end)
						end

						if aracParcaNokta[islem]["parca-native-no"] then
							SetVehicleDoorOpen(arac, aracParcaNokta[islem]["parca-native-no"], false, false)
						end

						QBCore.Functions.Progressbar(aracParcaNokta[islem]["kod-isim"], aracParcaNokta[islem]["sure-isim"], aracParcaNokta[islem]["sure"], false, true, { -- p1: menu name, p2: yazı, p3: ölü iken kullan, p4:iptal edilebilir
							disableMovement = true,
							disableCarMovement = true,
							disableMouse = false,
							disableCombat = true,
						}, {}, {}, {}, function() -- Done
							ClearPedTasksImmediately(playerPed)
							if aracParcaNokta[islem]["prop"] ~= "sil" and aracParcaNokta[islem]["prop"] ~= "son" then
								yeniProp = CreateObject(GetHashKey(aracParcaNokta[islem]["prop"]), aracParcaNokta[islem]["kordinat"]["x"], aracParcaNokta[islem]["kordinat"]["y"], aracParcaNokta[islem]["kordinat"]["z"], true)
								SetEntityCollision(yeniProp, false, false)
								PlaceObjectOnGroundProperly(yeniProp)
								if DoesEntityExist(yeniProp) then
									AttachEntityToEntity(yeniProp, playerPed, GetPedBoneIndex(playerPed, aracParcaNokta[islem]["entity-attach"]["bone"]), aracParcaNokta[islem]["entity-attach"]["xPos"], aracParcaNokta[islem]["entity-attach"]["yPos"], aracParcaNokta[islem]["entity-attach"]["zPos"], aracParcaNokta[islem]["entity-attach"]["xRot"], aracParcaNokta[islem]["entity-attach"]["yRot"], aracParcaNokta[islem]["entity-attach"]["zRot"], true, true, false, true, 1, true)
									ClearPedTasks(PlayerPedId())
								end

								QBCore.Shared.RequestAnimDict(aracParcaNokta[islem]["prop-anim"]["prop-dics"], function()
									TaskPlayAnim(playerPed, aracParcaNokta[islem]["prop-anim"]["prop-dics"], aracParcaNokta[islem]["prop-anim"]["prop-name"], 8.0, 8.0, -1, 50, 0, false, false, false)
								end)	
							elseif aracParcaNokta[islem]["prop"] == "sil" then
								DeleteEntity(yeniProp)	
							end

							if aracParcaNokta[islem]["parca-native-no"] then
								SetVehicleDoorBroken(arac, aracParcaNokta[islem]["parca-native-no"], true)
							end
							
							if islem == #aracParcaNokta then
								aracParcalamaAktif = false
								FinishedChopping()
							elseif islem == 3 then
								if math.random(1,100) < 70 then
									TriggerEvent("gr-policeAlert:alert", "Çalıntı Araç Parçalama", false, vector3(parcalamaNokta.x+50, parcalamaNokta.y-40, parcalamaNokta.z))
								end
							end
							islemDevamEdiyor = false
							islem = islem + 1
							if not arkaKapi and islem == 4 then
								islem = islem + 4
							end
						end, function() -- Cancel
							islemDevamEdiyor = false
							ClearPedTasksImmediately(playerPed)
							if IsEntityAttachedToEntity(yeniProp, playerPed) then
								DeleteEntity(yeniProp)
								ClearPedSecondaryTask(playerPed)
							end
						end)

					end
				end
			
			elseif aracParcalamaAktif then 
				aracParcalamaAktif = false
				if IsEntityAttachedToEntity(yeniProp, playerPed) then
					DeleteEntity(yeniProp)
					ClearPedSecondaryTask(playerPed)
				end
				QBCore.Functions.Notify("Uzaklaştığın için parçalama iptal oldu!", "error")
			end
		end
		Citizen.Wait(time)
	end
end)

Citizen.CreateThread(function()
	--local blip = AddBlipForCoord(parcalamaNokta.x+50, parcalamaNokta.y-40, parcalamaNokta.z)

	--SetBlipSprite(blip, 380)
	--SetBlipScale(blip, 0.5)
	--SetBlipColour(blip, 6)
	--SetBlipAsShortRange(blip, true)
--
	--BeginTextCommandSetBlipName('STRING')
	--AddTextComponentSubstringPlayerName("Kaçak Araç Parçalama")
	--EndTextCommandSetBlipName(blip)

	RequestModel(Config.NPCHash)
	while not HasModelLoaded(Config.NPCHash) do
		Wait(1)
	end
	
	-- exports["gr-base"]:pedcreate("robban", Config.NPCHash,  Config.NPCShop.x,  Config.NPCShop.y,  Config.NPCShop.z,  Config.NPCShop.h)
end)

Citizen.CreateThread(function ()
	while true do
		local time = 1000
		local playerPed = PlayerPedId()
		local playerKordinat = GetEntityCoords(playerPed)
		local mesafe = #(playerKordinat - vector3(parcalamaNokta.x, parcalamaNokta.y, parcalamaNokta.z))

		if not aracParcalamaAktif and mesafe then 
			if IsPedSittingInAnyVehicle(PlayerPedId()) then
				if mesafe < 25.0 then 
					time = 1
					DrawMarker(20, parcalamaNokta.x, parcalamaNokta.y, parcalamaNokta.z, 0, 0, 0, 0, 0, 0, 0.5, 0.5, 0.5, 255, 0, 0, 155, 0, 0, 2, 0, 0, 0, 0)
					if mesafe < 1.2 then 
						QBCore.Functions.DrawText3D(parcalamaNokta.x, parcalamaNokta.y, parcalamaNokta.z - 0.1, tostring("~w~~g~[E]~w~ Aracı Parçala"))
						if IsControlJustPressed(0, 46) and not clientcooldown then
							QBCore.Functions.TriggerCallback('gr-base:polis-sayi', function(AktifPolis)
								if AktifPolis >= 2 then
									QBCore.Functions.TriggerCallback('tgiann-aracparcalama:check-cd', function(cd)
										if cd then
											StartChopThisCar()
										else
											QBCore.Functions.Notify('Şimdi Araç Parçalayamazsın 10 Dakika Sonra Gel', 'error')
										end
									end)
								else
									QBCore.Functions.Notify('Şehirde Yeterli Sayıda Polis Yok!')
								end
							end)
						elseif IsControlJustPressed(0, 46) and clientcooldown then
							QBCore.Functions.Notify('Süreni başlattım. 10 Dakika sonra gel ve parçala!')
						end
					end
				end
			end
		end
		Citizen.Wait(time)
	end
end)

Citizen.CreateThread(function ()
	while true do
		if clientcooldown then
			Citizen.Wait(600000) -- Citizen.Wait(1800000) -- 1800000
			clientcooldown = false
		end 
		Citizen.Wait(1000)
	end
end)

local class = 0
function StartChopThisCar()
	local playerPed = PlayerPedId()
	arac = GetVehiclePedIsIn(playerPed, false)
	class = GetVehicleClass(arac)
	arkaKapi = false
	if class ~= 8 then
		islem = 1

		for i=0, 5 do
			if DoesVehicleHaveDoor(arac, i) then
				kapiSayisi = kapiSayisi + 1
				SetVehicleDoorOpen(arac, i, false, true)
			end
		end

		if kapiSayisi >= 4 then
			arkaKapi = true
		end

		SetEntityCoords(arac, parcalamaNokta.x, parcalamaNokta.y, parcalamaNokta.z)
		SetEntityHeading(arac, 27.77)
		SetEntityAsMissionEntity(arac, true, true)
		TaskLeaveVehicle(playerPed, arac, 256)
		SetVehicleDoorsLocked(arac, 2)
		aracParcalamaAktif = true
		clientcooldown = true
	end
end

function FinishedChopping()
	aracParcalamaAktif = false
	DeleteEntity(arac)
	TriggerServerEvent("tgiann-aracparcalama:esya-verme", class, QBCore.Key)
end

Citizen.CreateThread(function ()
	while true do
		local time = 1000
		local playerPed = PlayerPedId()
		local coords = GetEntityCoords(playerPed)
		local mesafe = #(coords - vector3(Config.NPCShop.x, Config.NPCShop.y, Config.NPCShop.z))
		if mesafe < 3.0 and not menuAcik and coreLoaded then
			time = 1
			QBCore.Functions.DrawText3D(Config.NPCShop.x, Config.NPCShop.y, Config.NPCShop.z+2.0, "~w~~g~[E]~w~ Robban")
			if IsControlJustReleased(0, 38) then
				
				aliciNPCMenu()
			end
		end
		Citizen.Wait(time)
	end
end)

function aliciNPCMenu()
	menuAcik = true
	local elements = {}
	local hasItem = false
	for k, v in pairs(QBCore.Functions.GetPlayerData().items) do
		for i=1, #Config.Items do
			if Config.Items[i] == v.name then
				local price = exports["gr-base"]:itemPrice(v.name)
				if price and v.amount > 0 then
					hasItem = true
					table.insert(elements, {
						label = v.label,
						name = v.name,
						slot = v.slot,
						price = price,

						-- menu properties
						type = 'slider',
						value = 1,
						min = 1,
						max = v.amount
					})
				end
			end
		end
	end

	if hasItem then
		QBCore.UI.Menu.Open('default', GetCurrentResourceName(), 'car_shop', {
			title    = 'Araç Parça Satış',
			align    = 'right',
			elements = elements
		}, function(data, menu)
			menu.close()
			TriggerServerEvent('tgiann-aracparcalama:esya-satis', data.current.name, data.current.value, data.current.price, data.current.slot)
			Citizen.Wait(1000)
			menuAcik = false
		end, function(data, menu)
			menu.close()
			menuAcik = false
		end)
	else
		QBCore.Functions.Notify("Satabileceğin bir araç parçan yok!", "error")
		Citizen.Wait(1000)
		menuAcik = false
	end
end