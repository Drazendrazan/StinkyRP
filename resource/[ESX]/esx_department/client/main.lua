local Keys = {
	["ESC"] = 322, ["BACKSPACE"] = 177, ["E"] = 38, ["ENTER"] = 18,	["LEFT"] = 174, ["RIGHT"] = 175, ["TOP"] = 27, ["DOWN"] = 173
}

local menuIsShowed 				 = false
local hasAlreadyEnteredMarker 	 = false
local lastZone 					 = nil
local isInJoblistingMarker 		 = false

ESX = nil

Citizen.CreateThread(function()
	while ESX == nil do
		TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
		Citizen.Wait(250)
	end
end)

function ShowJobListingMenuMain(data)
	ESX.UI.Menu.CloseAll()

	ESX.UI.Menu.Open(
	'default', GetCurrentResourceName(), 'joblisting',
	{
		title    = _U('job_center'),
		align    = 'center',
		elements = {
			{label = 'Wybierz Pracę', value = 'jobs'},
			{label = 'Zarządzanie Garażem', value = 'garages'},
			{label = 'Zarządzanie Nieruchomościami', value = 'OpenSubownerMenu'},
		}
	}, function(data, menu)
	if data.current.value == 'jobs' then
		ShowJobListingMenu()
	elseif data.current.value == 'garages' then
		menu.close()
		--TriggerEvent('esx:showNotification', 'Aby wyświetlić opcje garażu, podaj numer tablicy rejestracyjnej!')
		--TriggerEvent('esx_department:SetSubowner')
		--exports['Stinky_garages']:OpenSellCarMenu()
		garages()
	elseif data.current.value == 'OpenSubownerMenu' then
		exports['esx_property']:OpenSubownerMenu()
	end
	end, function(data, menu)
		menu.close()
	end)
end

function garages(data)
		ESX.UI.Menu.CloseAll()

		ESX.UI.Menu.Open(
		'default', GetCurrentResourceName(), 'joblisting',
		{
			title    = _U('job_center'),
			align    = 'center',
			elements = {
				{label = 'Wyświetl menu zarządzania pojazdami', value = 'gigga'},
				{label = 'Wystaw umowę sprzedaży pojazdu', value = 'nigga'},
			}
		}, function(data, menu)
		if data.current.value == 'gigga' then
			TriggerEvent('esx:showNotification', 'Aby wyświetlić opcje garażu, podaj numer tablicy rejestracyjnej!')
			TriggerEvent('flux_garages:otworzmenusell')
		elseif data.current.value == 'nigga' then
			OpenSellCarMenu()
		end
		end, function(data, menu)
			ShowJobListingMenuMain(data)
		end)
end

function OpenSellCarMenu()
	ESX.UI.Menu.Open(
		'default', GetCurrentResourceName(), 'umowaelo',
		{
			title = "Czy na pewno chcesz zakupić umowę za 15 000$?",
			align = 'center',
			elements = {
				{label = "Nie", value = 'no'},
				{label = "Tak", value = 'yes'}
			}
		},
		function(data, menu)
			if data.current.value == 'yes' then
				TriggerServerEvent('garages:buyContract')
				menu.close()
			elseif data.current.value == 'no' then
				menu.close()
			end
		end,
		function(data, menu)
			menu.close()
		end
	)
end

function ShowJobListingMenu(data)
	ESX.UI.Menu.CloseAll()

	ESX.UI.Menu.Open(
	'default', GetCurrentResourceName(), 'joblisting',
	{
		title    = _U('job_center'),
		align    = 'center',
		elements = {
			{label = 'Kawiarnia', value = 'GIGACZAD1'},
			{label = 'Milkman', value = 'GIGACZAD2'},
			--{label = 'Krawiec', value = 'GIGACZAD3'},
			{label = 'Zwolnij Sie', value = 'GIGACZAD4'}
		}
	}, function(data, menu)
		if data.current.value == 'GIGACZAD1' then
			TriggerServerEvent('esx_department:kawiarnia')
		elseif data.current.value == 'GIGACZAD2' then
			TriggerServerEvent('esx_department:milkman')
		elseif data.current.value == 'GIGACZAD3' then
			TriggerServerEvent('esx_department:krawiec')
		elseif data.current.value == 'GIGACZAD4' then
			TriggerServerEvent('esx_department:bezrobotny')
		end
		end, function(data, menu)
			ShowJobListingMenuMain(data)
		end)
end

AddEventHandler('esx_department:hasExitedMarker', function(zone)
	ESX.UI.Menu.CloseAll()
end)

Citizen.CreateThread(function()
	while true do
		Citizen.Wait(3)

		local coords, sleep = GetEntityCoords(PlayerPedId()), true
		for i=1, #Config.Zones, 1 do
			if (#(coords - vec3(Config.Zones[i].x, Config.Zones[i].y, Config.Zones[i].z)) < 10) then
				DrawMarker(27, Config.Zones[i].x, Config.Zones[i].y, Config.Zones[i].z, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 1.5, 1.5, 1.0, 0, 203, 214, 100, false, false, 2, true, nil, nil, false)
				sleep = false
				if (#(coords - vec3(Config.Zones[i].x, Config.Zones[i].y, Config.Zones[i].z)) < 3) then
					if IsControlJustReleased(0, Keys['E']) and isInJoblistingMarker and not menuIsShowed then
						ESX.ShowHelpNotification('Naciśnij ~INPUT_PICKUP~ zobaczyć menu ~b~Urzędu~s~.')
						ShowJobListingMenuMain()
					end
				end
			end
		end
		if sleep then
			Citizen.Wait(500)
		end
	end
end)

Citizen.CreateThread(function()
	while true do
		Citizen.Wait(100)

		local coords, sleep = GetEntityCoords(PlayerPedId()), true
		isInJoblistingMarker  = false
		local currentZone = nil
		for i=1, #Config.Zones, 1 do
			if (#(coords - vec3(Config.Zones[i].x, Config.Zones[i].y, Config.Zones[i].z)) < Config.ZoneSize.x) then
				isInJoblistingMarker  = true
				SetTextComponentFormat('STRING')
				DisplayHelpTextFromStringLabel(0, 0, 1, -1)
			end
		end
		if isInJoblistingMarker and not hasAlreadyEnteredMarker then
			hasAlreadyEnteredMarker = true
		end
		if not isInJoblistingMarker and hasAlreadyEnteredMarker then
			hasAlreadyEnteredMarker = false
			TriggerEvent('esx_department:hasExitedMarker')
		end
	end
end)


Citizen.CreateThread(function()
	for i=1, #Config.Zones, 1 do
		local blip = AddBlipForCoord(Config.Zones[i].x, Config.Zones[i].y, Config.Zones[i].z)
		SetBlipSprite (blip, 498)
		SetBlipDisplay(blip, 4)
		SetBlipScale  (blip, 0.8)
		SetBlipColour (blip, 3)
		SetBlipAsShortRange(blip, true)
		BeginTextCommandSetBlipName("STRING")
		AddTextComponentString(_U('job_center'))
		EndTextCommandSetBlipName(blip)
	end
end)
