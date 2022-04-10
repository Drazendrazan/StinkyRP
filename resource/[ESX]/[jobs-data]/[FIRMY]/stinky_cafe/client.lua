local ESX, PlayerData, inProgress, pCoords, CafeBlips, CanWork = nil, {}, false, nil, {}, false
local HasAlreadyEnteredMarker	= false
local LastZone					= nil
local CurrentAction				= nil
local CurrentActionMsg			= ''
local CurrentActionData			= {}
local alreadyOut, inAction = false
local cooldown = false

local kochacpieski = true

local Cfg = {
	CollectSeeds = {
		{
			coords = vector3(2851.2581, 4580.5952, 46.3502),
		},
	},
	TransferingSeeds = {
		{
			coords = vector3(-627.87, 223.87, 80.89),
		},
	},
	SellCoffee = {
		{
			coords = vector3(2681.8582, 3507.7837, 52.3539),
		},
	},
	Garage = {
		{
			coords = vector3(-620.0739, 198.6621, 69.8853)
		},
		{
			coords = vector3(2817.9507, 4570.9185, 45.2956)
		},
	},
	BossActions = {
		{
			coords = vector3(-631.39, 224.74, 80.90)
		},
	},
	Cloakroom = {
		{
			coords = vector3(-634.57, 225.97, 80.89)
		},
		{
			coords = vector3(2832.8604, 4571.0845, 45.6009
		)
		},
	},
	Clothes = {
		Male = {
			['tshirt_1'] = 15, ['tshirt_2'] = 0,--TSHIRT
			['torso_1'] = 420, ['torso_2'] = 1, --TUŁÓW
			['arms'] = 52, --RAMIONA
			['pants_1'] = 169, ['pants_2'] = 9, --SPODNIE
			['shoes_1'] = 76, ['shoes_2'] = 3, --BUTY
			['helmet_1'] = 10, ['helmet_2'] = 0, --CZAPKATUTAJ-1_OZNACZA_BRAK_CZAPKI
			['chain_1'] = 186, ['chain_2'] = 0, --ŁAŃCUCH
			['mask_1'] = 0, ['mask_2'] = 0, --MASKA
			['bags_1'] = 23, ['bags_2'] = 8 --TORBA
	   },
	Female = {
			['tshirt_1'] = 2, ['tshirt_2'] = 0,--TSHIRT
			['torso_1'] = 520, ['torso_2'] = 5, --TUŁÓW
			['arms'] = 14, --RAMIONA
			['pants_1'] = 204, ['pants_2'] = 3, --SPODNIE
			['shoes_1'] = 107, ['shoes_2'] = 12, --BUTY
			['helmet_1'] = 141, ['helmet_2'] = 2, --CZAPKA TUTAJ -1_OZNACZA_BRAK_CZAPKI
			['chain_1'] = 147, ['chain_2'] = 2, --ŁAŃCUCH
			['mask_1'] = 0, ['mask_2'] = 0, --MASKA
			['bags_1'] = 144, ['bags_2'] = 4 --TORBA
		},
	},
}


local Blips = {
	{title="#1 Szatnia", colour=31, id=607, see = true, coords = vector3(-634.64, 225.72, 80.90)},
	{title="#2 Zbieranie proszku", colour=31, id=607, see = true, coords = vector3(2851.2581, 4580.5952, 46.3502)},
	{title="#3 Przeróbka proszku", colour=31, id=607, see = true, coords = vector3(-627.78, 223.69, 80.93)},
	--{title="#4 Punkt dostawy kawy", colour=31, id=607, see = true, coords = vector3(2681.8582, 3507.7837, 52.3539)}
},

CreateThread(function()
	while ESX == nil do
		TriggerEvent('esx:getSharedObject', function(obj) 
			ESX = obj 
		end)
		
		Citizen.Wait(250)
	end
	
	Citizen.Wait(5000)
	PlayerData = ESX.GetPlayerData()
	refreshBlips()
end)




CreateThread(function()
	while PlayerData.job == nil do
		Citizen.Wait(100)
	end
	while true do
		if PlayerData.job.name == 'kawiarnia' then
			local playerPed = PlayerPedId()
			pCoords = GetEntityCoords(playerPed)
		else
			local playerPed = PlayerPedId()
			tCoords = GetEntityCoords(playerPed)
		end
		Citizen.Wait(500)
	end
end)

RegisterNetEvent('esx:playerLoaded')
AddEventHandler('esx:playerLoaded', function(xPlayer)
	PlayerData = xPlayer
end)

RegisterNetEvent('esx:setJob')
AddEventHandler('esx:setJob', function(job)
	PlayerData.job = job
	CanWork = false
	deleteBlip()
	refreshBlips()
end)

refreshBlips = function()
	if PlayerData.job ~= nil and PlayerData.job.name == 'kawiarnia' then
		for i=1, #Blips, 1 do
			if Blips[i].see then
				local blip = AddBlipForCoord(Blips[i].coords)
				SetBlipSprite(blip, Blips[i].id)
				SetBlipDisplay(blip, 4)
				SetBlipScale(blip, 0.9)
				SetBlipColour(blip, Blips[i].colour)
				SetBlipAsShortRange(blip, true)
				BeginTextCommandSetBlipName("STRING")
				AddTextComponentString(Blips[i].title)
				EndTextCommandSetBlipName(blip)

				table.insert(CafeBlips, blip)
			end
		end
	end
end

deleteBlip = function()
	if CafeBlips[1] ~= nil then
		for i=1, #CafeBlips, 1 do
			RemoveBlip(CafeBlips[i])
			CafeBlips[i] = nil
		end
	end
end
CreateThread(function()
	while PlayerData.job == nil do
		Citizen.Wait(1000)
	end
	while true do
		Citizen.Wait(3)
		if PlayerData.job ~= nil and PlayerData.job.name == 'kawiarnia' then
			local found = false
			local isInMarker	= false
			local currentZone	= nil
			local zoneNumber 	= nil
			for k,v in pairs(Cfg) do
				for i=1, #v, 1 do
					if CanWork or (k == 'Cloakroom' or k == 'BossActions' and PlayerData.job.grade >= 7 or k == 'SellCoffee' and PlayerData.job.grade >= 7) then
						if k == 'CollectSeeds' then
							if #(pCoords - v[i].coords) < 10.0 then
								found = true
								DrawMarker(27, v[i].coords.x, v[i].coords.y, v[i].coords.z, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 6.0, 6.0, 1.0, 0, 150, 255, 100, false, false, 2, false, nil, nil, false)
							end
						elseif k == 'TransferingSeeds' or k == 'SellCoffee' or k == 'Garage' then
							if #(pCoords - v[i].coords) < 10.0 then
								found = true
								DrawMarker(27, v[i].coords.x, v[i].coords.y, v[i].coords.z, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 2.7, 2.7, 1.0, 0, 150, 255, 100, false, false, 2, false, nil, nil, false)
							end
						else
							if #(pCoords - v[i].coords) < 10.0 then
								found = true
								DrawMarker(27, v[i].coords.x, v[i].coords.y, v[i].coords.z, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 1.5, 1.5, 1.0, 0, 150, 255, 100, false, false, 2, false, nil, nil, false)
							end
						end

						if k == 'Cloakroom' or k == 'BossActions' then
							if #(pCoords - v[i].coords) < 1.5 then
								isInMarker	= true
								currentZone = k
								zoneNumber = i
							end
						elseif k == 'CollectSeeds' then
							if #(pCoords - v[i].coords) < 5.0 then
								isInMarker	= true
								currentZone = k
								zoneNumber = i
							end
						else
							if #(pCoords - v[i].coords) < 2.0 then
								isInMarker	= true
								currentZone = k
								zoneNumber = i
							end
						end
						
					end
				end
			end

			if isInMarker and not hasAlreadyEnteredMarker then
				hasAlreadyEnteredMarker = true
				lastZone				= currentZone
				TriggerEvent('exile_cafe:hasEnteredMarker', currentZone, zoneNumber)
			end
	
			if not isInMarker and hasAlreadyEnteredMarker then
				hasAlreadyEnteredMarker = false
				TriggerEvent('exile_cafe:hasExitedMarker', lastZone)
			end

		--	if isInMarker and inAction then
			--	TriggerEvent('exile_cafe:hasEnteredMarker', 'exitMarker')
			--end

			if not found then
				Citizen.Wait(2000)
			end
		else
			Citizen.Wait(2000)
		end
	end
end)
local inProgress = false
--msg
CreateThread(function()
	while true do

		Citizen.Wait(10)
		if PlayerData.job and PlayerData.job.name == 'kawiarnia' then

			if CurrentAction ~= nil and not cooldown then

				ESX.ShowHelpNotification(CurrentActionMsg)

				if IsControlJustReleased(0, 38) then
					if CurrentAction == 'collect' then
						if not inProgress then
							StartCollect()
							inAction = true
						end
					elseif CurrentAction == 'transfering' then
						TransferingSeeds()
					elseif CurrentAction == 'sell' then
						SellCoffee()
					elseif CurrentAction == 'boss_actions' then
						OpenBossMenu()
					elseif CurrentAction == 'garage' then
						CarOut()
					elseif CurrentAction == 'cloakroom' then
						OpenCloakroom()
					elseif CurrentAction == 'exit' then
						inAction = false
						FreezeEntityPosition(PlayerPedId(), false)
						ClearPedTasks(PlayerPedId())
					else
						inAction = false
					end
					CurrentAction = nil
				end
			end
		else
			Citizen.Wait(2000)
		end
	end
end)
local tekst = 0
local showTimer = false
function DrawText3D(x, y, z, text, scale)
	local onScreen, _x, _y = World3dToScreen2d(x, y, z)
	local pX, pY, pZ = table.unpack(GetGameplayCamCoords())

	SetTextScale(scale, scale)
	SetTextFont(4)
	SetTextProportional(1)
	SetTextEntry("STRING")
	SetTextCentre(1)
	SetTextColour(255, 255, 255, 255)
	SetTextOutline()

	AddTextComponentString(text)
	DrawText(_x, _y)

	local factor = (string.len(text)) / 270
	DrawRect(_x, _y + 0.015, 0.005 + factor, 0.03, 31, 31, 31, 155)
end

function Timer(time)
	TriggerEvent('exile_cofe:DrawPercent')
	CreateThread(function()
		tekst = 0
		repeat
			tekst = tekst + 1
			Citizen.Wait(time)
		until tekst == 100
		showTimer = false
		StopCollect()
	end)
end


StopCollect = function()
	TriggerServerEvent('exile_cafe:giveItem', 'ziarna')
	inProgress = false
	FreezeEntityPosition(PlayerPedId(), false)
	ClearPedTasks(PlayerPedId())
	CurrentAction		= 'collect'
	CurrentActionMsg	= "Naciśnij ~INPUT_CONTEXT~, aby zebrać ~b~proszek StinkyEnergy"
	CurrentActionData	= {}
end


RegisterNetEvent('exile_cofe:DrawPercent')
AddEventHandler('exile_cofe:DrawPercent', function()
	showTimer = true

	while (showTimer) do
		Wait(0)
		DisableControlAction(0, 73, true) -- X
		DrawText3D(pCoords.x, pCoords.y, pCoords.z + 0.1, tekst .. '~g~%', 0.4)
    end
end)

StartCollect = function()
	local playerPed = PlayerPedId()

	ESX.TriggerServerCallback('gcphone:getItemAmount', function(count)
		if count < 100 then
			ClearPedTasks(playerPed)
			FreezeEntityPosition(playerPed, true)
			TaskStartScenarioInPlace(playerPed, "WORLD_HUMAN_GARDENER_PLANT", 0, true)
			inProgress = true
			exports["stinky_taskbar"]:taskBar(120000, "Zbieranie Proszeku StinkyEnergy", false, true)
			StopCollect()
		else
			inProgress = false
			ESX.ShowNotification('~y~Nie uniesiesz więcej proszku')
		end
	end, 'ziarna')
end

TransferingSeeds = function()
	ESX.UI.Menu.CloseAll()
	local inventory = ESX.GetPlayerData().inventory
	local count = 0
	for i=1, #inventory, 1 do
		if inventory[i].name == 'ziarna' then
			count = inventory[i].count
		end
	end
	if kochacpieski == true then
		if count >= 100 then
			DisableControlAction(0, 289, true) -- F2
			FreezeEntityPosition(PlayerPedId(), true)
			local lib, anim = 'mini@drinking', 'shots_barman_b'
			kawa = CreateObject(`prop_fib_coffee`, 0, 0, 0, true, true, false)
			AttachEntityToEntity(kawa, PlayerPedId(), GetPedBoneIndex(PlayerPedId(), 28422), 0.09, 0.02, 0.0, 0, 0, 0, true, true, false, true, 1, true)
			ESX.Streaming.RequestAnimDict(lib, function()
				TaskPlayAnim(PlayerPedId(), lib, anim, 8.0, -8.0, -1, 0, 0, false, false, false)
				exports["stinky_taskbar"]:taskBar(5000, "Trwa przygotowywanie StinkyEnergy", false, true)
				Citizen.InvokeNative(0xAAA34F8A7CB32098, PlayerPedId())
				Wait(1250)
				exports["stinky_taskbar"]:taskBar(3000, "Odkladanie", false, true)
				Wait(7000, 12000)
				TriggerServerEvent('exile_cafe:przygotowanie', count)
				FreezeEntityPosition(PlayerPedId(), false)
				DeleteEntity(kawa)
				DisableControlAction(0, 289, false) -- F2
				kochacpieski = false
				TriggerEvent('kawiarzxD')
				TriggerServerEvent('exile_cafe:sell', count)
			--	end)
			end)
		else
			ESX.ShowNotification('~r~Potrzebujesz 100 ziaren aby rozpocząć przerabianie!')
		end
	else
		ESX.ShowNotification('~r~Musisz odczekać aby ponownie przerabiać!')
	end
end
RegisterNetEvent('kawiarzxD')
AddEventHandler('kawiarzxD', function()
	Citizen.Wait(300000)
	kochacpieski = true
end)
SellCoffee = function()
	ESX.UI.Menu.CloseAll()
	local inventory = ESX.GetPlayerData().inventory
	local count = 0
	for i=1, #inventory, 1 do
		if inventory[i].name == 'kawa' then
			count = inventory[i].count
		end
	end
	if count >= 100 then
		FreezeEntityPosition(PlayerPedId(), true)
		local lib, anim = 'gestures@m@standing@casual', 'gesture_easy_now'
		ESX.Streaming.RequestAnimDict(lib, function()
			TaskPlayAnim(PlayerPedId(), lib, anim, 8.0, -8.0, -1, 0, 0, false, false, false)
			exports["stinky_taskbar"]:taskBar(20000, "Sprzedaz Kawy", false, true)
			Citizen.InvokeNative(0xAAA34F8A7CB32098, PlayerPedId())
			TriggerServerEvent('exile_cafe:sell', count)
			FreezeEntityPosition(PlayerPedId(), false)
		end)
	else
		ESX.ShowNotification('~r~Nie posiadasz przy sobie kawy!')
	end
end

CarOut = function()
	local player = PlayerPedId()
	if IsPedInAnyVehicle(player, false) then
		local carCafe = GetVehiclePedIsIn(player, false)
		if IsVehicleModel(carCafe, `gmcat4`) then
			ESX.Game.DeleteVehicle(carCafe)
			alreadyOut = false
		else
			ESX.ShowNotifcation('~r~Możesz zwrócić tylko auto firmowe!')
		end
	else
		if ESX.Game.IsSpawnPointClear(GetEntityCoords(PlayerPedId()), 7) then
			ESX.Game.SpawnVehicle('gmcat4', GetEntityCoords(PlayerPedId()), 86.53, function(vehicle)
				platenum = math.random(10, 99)
				SetVehicleNumberPlateText(vehicle, "CAFE"..platenum)
				TaskWarpPedIntoVehicle(PlayerPedId(), vehicle, -1)
			end)
			alreadyOut = true
		else
			ESX.ShowNotification('~r~Miejsce parkingowe jest już zajęte przez inny pojazd!')
		end
	end
end

function OpenCloakroom()
	ESX.UI.Menu.CloseAll()

	ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'cloakroom',
	{
		title    = 'Przebieralnia',
		align = 'center',
		elements = {
			{label = 'Ubrania robocze',     value = 'job_wear'},
			{label = 'Ubrania prywatne', value = 'citizen_wear'}
		}
	}, function(data, menu)
		ESX.TriggerServerCallback('esx_skin:getPlayerSkin', function(skin)
			if data.current.value == 'citizen_wear' then
				CanWork = false
				TriggerEvent('skinchanger:loadSkin', skin)
			elseif data.current.value == 'job_wear' then
				CanWork = true
				if skin.sex == 0 then
					TriggerEvent('skinchanger:loadClothes', skin, Cfg.Clothes.Male)
				else
					TriggerEvent('skinchanger:loadClothes', skin, Cfg.Clothes.Female)
				end
			end
		end)

		menu.close()
	end, function(data, menu)
		menu.close()
	end)
end

function OpenBossMenu()
	local elements = {
		{label = "Akcje szefa", value = '1'},
    }
    if PlayerData.job.grade >= 7 then
		--table.insert(elements, {label = "Lista kursów", value = '2'})
		table.insert(elements, {label = "Zarządzanie frakcją", value = '4'})
	end

	ESX.UI.Menu.CloseAll()

	ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'cafe_boss', {
		title    = "Kawiarnia",
		align    = 'bottom-right',
		elements = elements
	}, function(data, menu)

		if data.current.value == '1' then
			if PlayerData.job.grade == 7 then
				TriggerEvent('esx_society:openBossMenu', 'kawiarnia', function(data, menu)
					menu.close()
				end, { showmoney = false, withdraw = false, deposit = true, wash = false, employees = true})
			elseif PlayerData.job.grade >= 8 then
				TriggerEvent('esx_society:openBossMenu', 'kawiarnia', function(data, menu)
					menu.close()
				end, { showmoney = true, withdraw = true, deposit = true, wash = false, employees = true})
			else
				TriggerEvent('esx_society:openBossMenu', 'kawiarnia', function(data, menu)
					menu.close()
				end, { showmoney = false, withdraw = false, deposit = true, wash = false, employees = false})
            end
		end

	end, function(data, menu)
		menu.close()

		CurrentAction     = 'boss_actions'
		CurrentActionMsg  = "Naciśnij ~INPUT_CONTEXT~, aby wejść do menu"
		CurrentActionData = {}
	end)
end

RegisterNetEvent('exile_cafe:Cancel')
AddEventHandler('exile_cafe:Cancel', function()
	local playerPed = PlayerPedId()
	FreezeEntityPosition(playerPed, false)
	ClearPedTasks(playerPed)
end)

AddEventHandler('exile_cafe:hasEnteredMarker', function(zone, number)

	if zone == 'exitMarker' then
		CurrentAction     = 'exit'
		CurrentActionMsg  = 'Naciśnij ~INPUT_CONTEXT~ aby przerwać ~b~czynność~s~'
		CurrentActionData = {}
	end

	if zone == 'CollectSeeds' then
		CurrentAction		= 'collect'
		CurrentActionMsg	= "Naciśnij ~INPUT_CONTEXT~, aby zebrać ~b~ziarna kawy"
		CurrentActionData	= {}
	end

	if zone == 'Cloakroom' then
		CurrentAction		= 'cloakroom'
		CurrentActionMsg	= "Naciśnij ~INPUT_CONTEXT~, aby otworzyć ~b~szatnię"
		CurrentActionData	= {}
	end

	if zone == 'TransferingSeeds' then
		CurrentAction		= 'transfering'
		CurrentActionMsg	= "Naciśnij ~INPUT_CONTEXT~, aby przerobić ~b~ziarna"
		CurrentActionData	= {}
	end

	if zone == 'SellCoffee' then
		CurrentAction		= 'sell'
		CurrentActionMsg	= "Naciśnij ~INPUT_CONTEXT~, aby sprzedać ~b~kawę"
		CurrentActionData	= {}
	end

	if zone == 'Garage' then
		if IsPedInAnyVehicle(PlayerPedId(), false) then
			msg = "Naciśnij ~INPUT_CONTEXT~, aby schować ~y~pojazd"
		else
			msg = "Naciśnij ~INPUT_CONTEXT~, aby wyciągnąć ~y~pojazd"
		end
		CurrentAction		= 'garage'
		CurrentActionMsg	= msg
		CurrentActionData	= {}
	end

	
	if zone == 'BossActions' then
		CurrentAction		= 'boss_actions'
		CurrentActionMsg	= "Naciśnij ~INPUT_CONTEXT~ aby otworzyć ~y~menu zarządzania"
		CurrentActionData	= {}
	end
end)

AddEventHandler('exile_cafe:hasExitedMarker', function(zone)
	ESX.UI.Menu.CloseAll()
	TriggerServerEvent('exile_cafe:stopPickup', zone)

	CurrentAction = nil

	cooldown = true
	if zone == 'CollectSeeds' then
		Citizen.Wait(4000)
		cooldown = false
	else
		Citizen.Wait(300)
		cooldown = false
	end
end)

