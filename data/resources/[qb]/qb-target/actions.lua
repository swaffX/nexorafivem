
local QBCore = exports['qb-core']:GetCoreObject()

local hostageAllowedWeapons = {
	"weapon_pistol",
	"weapon_combatpistol",
	"weapon_pistol50",
	"weapon_snspistol",
	"weapon_vintagepistol",
	"vweapon_heavypistol",
	"weapon_revolver",
	"weapon_ceramicpistol",
	"weapon_navyrevolver",
	"weapon_marksmanpistol",
	"weapon_snspistol_mk2",
	"weapon_pistol_mk2",
	"weapon_dp9",
	"weapon_glock",
	"weapon_browning",
	"weapon_machinepistol",
}

-- Debug Option

if Config.Debug then Load('debug') end


RegisterNetEvent('l2s-interface:client:snedconfiguration', function(ccc)
    SendNUIMessage({
        response = "addcolors",
        ccc = ccc.uicolor,
    })
    Config.DrawColor = hex2rgb(ccc.uicolor)
    Config.SuccessDrawColor = hex2rgb(ccc.uicolor)
    Config.OutlineColor = hex2rgb(ccc.uicolor)
end)

function hex2rgb(hex)
    hex = hex:gsub("#","")
    return {tonumber("0x"..hex:sub(1,2)), tonumber("0x"..hex:sub(3,4)), tonumber("0x"..hex:sub(5,6)) , 255}
end

RegisterNetEvent('qb-target:givecash')
RegisterNetEvent('qb-target:givecash', function(playerid)
	local keyboard = exports['qb-keyboard']:KeyboardInput({
		name = "Vatandaş Eylemleri",
		header = 'Nakit Ver',
		submitText = 'Ver',
		inputs = {
			{
				text = "Tutarı girin, Current Cash: "..QBCore.Functions.GetPlayerData().money.cash.. "$",
				name = "input",
				type = "number",
				placeholder = '100',
				isRequired = true,
			},
		}
	})
	if keyboard then
		if tonumber(keyboard.input) > 0 then 
			TriggerServerEvent('qb-target:server:givemoneytoanuotherplayer', keyboard.input, playerid)
        end
	else
		TriggerEvent('QBCore:Notify', 'Incorrect input', 'error')
	end
end)

RegisterNetEvent('qb-target:client:SharedEmotesMenu')
AddEventHandler('qb-target:client:SharedEmotesMenu', function(playerid)
    local playermenu = { 
        {
            id = 1,
            header = "Paylaşılan Emotelar",
            isMenuHeader = true,
            icon = "fas fa-circle",
        },
        {
            id = 2,
            header = "Tokat",
            txt = "Tokatlamak İçin Tıklayın",
            icon = "fas fa-user-group",
            params = {
                event = "qb-target:client:Slap",
                args = playerid,
                txt = "Send him To prison ",
            }
        },
        {
            id = 3,
            header = "Hug",
            txt = "Click To Request",
            icon = "fas fa-user-group",
            params = {
                event = "qb-target:client:Hug",
                args = playerid,
            }
        },
    }
    exports[Config.menu]:openMenu(playermenu)
end)
RegisterNetEvent("inventory:client:Giveitemanim")
AddEventHandler("inventory:client:Giveitemanim", function()
	LoadAnimDict("mp_common")
	TaskPlayAnim(GetPlayerPed(-1), "mp_common", "givetake1_a", 3.0, 3.0, -1, 0, 0, false, false, false)
end)

RegisterNetEvent("inventory:client:Reciveitemanim")
AddEventHandler("inventory:client:Reciveitemanim", function()
	Citizen.Wait(600)
	LoadAnimDict("mp_common")
	TaskPlayAnim(GetPlayerPed(-1), "mp_common", "givetake2_a", 3.0, 3.0, -1, 0, 0, false, false, false)
end)

function LoadAnimDict( dict )
    while ( not HasAnimDictLoaded( dict ) ) do
        RequestAnimDict( dict )
        Citizen.Wait( 5 )
    end
end

 