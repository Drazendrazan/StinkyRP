local PoliceGUI               = false
local PlayerData              = {}

ESX = nil
Citizen.CreateThread(function()
	while ESX == nil do
		TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
		Citizen.Wait(0)
	end
	
	Citizen.Wait(5000)
	PlayerData = ESX.GetPlayerData()
end)

RegisterNetEvent('esx:playerLoaded')
AddEventHandler('esx:playerLoaded', function(xPlayer)
	PlayerData = xPlayer
end)

RegisterNetEvent('esx:setJob')
AddEventHandler('esx:setJob', function(job)
	PlayerData.job = job
end)

RegisterNetEvent('tabletmsg:open')
AddEventHandler('tabletmsg:open', function(xPlayer)
	if PlayerData.job ~= nil and (PlayerData.job.name == 'mecano') then
		if PlayerData.job.name == 'mecano' then
			if not PoliceGUI then
				SetNuiFocus(true, true)
				SendNUIMessage({type = 'open'})
				PoliceGUI = true
				PhonePlayAnim('text')
			end
		else
			ESX.ShowNotification("~r~Nie jesteś na służbie!")
		end
	end
end)

RegisterNUICallback('NUIFocusOff', function()
	SetNuiFocus(false, false)
	SendNUIMessage({type = 'close'})
	PoliceGUI = false
	PhonePlayAnim('out')
end)

RegisterNUICallback('mandat', function(data, cb)
	if PlayerData.job.name == 'mecano' then
		local sender = GetPlayerServerId(player)
		local closestPlayer, closestDistance = ESX.Game.GetClosestPlayer()
		if closestPlayer ~= -1 and closestDistance <= 3.0 then
			TriggerServerEvent("esx_wypierdaljzjebielsttt", GetPlayerServerId(closestPlayer), tonumber(data.mandatamount), data.mandatreason)
			ESX.ShowNotification('Wpłacono ~g~' .. data.mandatamount * 0.33 .. '$ ~s~na twoje konto w banku.')	
			TriggerServerEvent("esx_wypierdaljzjebielst", tonumber(data.mandatamount) / 2)
		end	
	else
		print('[szymczakof] Debil chcial wjebaćckomus MANDAT | BLOCKED :>')
		TriggerEvent('esx:showNotification', '~r~[BROOM x SZYMEK] BLOCKED TO JEST MORDO XDDDDDDDDDDDD')
		TriggerEvent('esx:showNotification', '~g~[nigga] BLOCKED TO JEST MORDO XDDDDDDDDDDDD')
		TriggerEvent('esx:showNotification', '~b~[nigga] BLOCKED TO JEST MORDO XDDDDDDDDDDDD')
		TriggerEvent('esx:showNotification', '~p~[nigga] BLOCKED TO JEST MORDO XDDDDDDDDDDDD')
		TriggerEvent('esx:showNotification', '~w~[nigga] BLOCKED TO JEST MORDO XDDDDDDDDDDDD')
		TriggerEvent('esx:showNotification', '~y~[nigga] BLOCKED TO JEST MORDO XDDDDDDDDDDDD')

	end
end)



local myPedId = nil
local phoneProp = 0
local phoneModel = "prop_cs_tablet"
local currentStatus = 'out'
local lastDict = nil
local lastAnim = nil
local lastIsFreeze = false

local ANIMS = {
	['cellphone@'] = {
		['out'] = {
			['text'] = 'cellphone_text_in',
			['call'] = 'cellphone_call_listen_base',
			
		},
		['text'] = {
			['out'] = 'cellphone_text_out',
			['call'] = 'cellphone_text_to_call',
		},
		['call'] = {
			['out'] = 'cellphone_call_out',
			['text'] = 'cellphone_call_to_text',
		}
	},
	['anim@cellphone@in_car@ps'] = {
		['out'] = {
			['text'] = 'cellphone_text_in',
			['call'] = 'cellphone_call_in',
		},
		['text'] = {
			['out'] = 'cellphone_text_out',
			['call'] = 'cellphone_text_to_call',
		},
		['call'] = {
			['out'] = 'cellphone_horizontal_exit',
			['text'] = 'cellphone_call_to_text',
		}
	}
}

function newPhoneProp()
	deletePhone()
	phoneProp = CreateObject(GetHashKey('prop_cs_tablet'), 1.0, 1.0, 1.0, 1, 1, 0)
	local bone = GetPedBoneIndex(myPedId, 28422)
	AttachEntityToEntity(phoneProp, myPedId, bone, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 1, 1, 0, 0, 2, 1)
end

function deletePhone ()
	if phoneProp ~= 0 then
		Citizen.InvokeNative(0xAE3CBE5BF394C9C9 , Citizen.PointerValueIntInitialized(phoneProp))
		phoneProp = 0
	end
end

function PhonePlayAnim (status, freeze)
	if currentStatus == status then
		return
	end
	myPedId = PlayerPedId()
	local freeze = freeze or false

	local dict = "cellphone@"
	if IsPedInAnyVehicle(myPedId, false) then
		dict = "anim@cellphone@in_car@ps"
	end
	loadAnimDict(dict)

	local anim = ANIMS[dict][currentStatus][status]
	if currentStatus ~= 'out' then
		StopAnimTask(myPedId, lastDict, lastAnim, 1.0)
	end
	local flag = 50
	if freeze == true then
		flag = 14
	end
	TaskPlayAnim(myPedId, dict, anim, 3.0, -1, -1, flag, 0, false, false, false)

	if status ~= 'out' and currentStatus == 'out' then
		Citizen.Wait(380)
		newPhoneProp()
	end

	lastDict = dict
	lastAnim = anim
	lastIsFreeze = freeze
	currentStatus = status

	if status == 'out' then
		Citizen.Wait(180)
		deletePhone()
		StopAnimTask(myPedId, lastDict, lastAnim, 1.0)
	end

end

function PhonePlayOut ()
	PhonePlayAnim('out')
end

function PhonePlayText ()
	PhonePlayAnim('text')
end

function PhonePlayCall (freeze)
	PhonePlayAnim('call', freeze)
end

function PhonePlayIn () 
	if currentStatus == 'out' then
		PhonePlayText()
	end
end

function loadAnimDict(dict)
	RequestAnimDict(dict)
	while not HasAnimDictLoaded(dict) do
		Citizen.Wait(1)
	end
end