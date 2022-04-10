
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

local PlayerData              = {}
local GUI                     = {}
local HasAlreadyEnteredMarker = false
local IsPlayerOnDuty = false
local LastZone                = nil
local CurrentAction           = nil
local CurrentActionMsg        = ''
local CurrentActionData       = {}
local JobVehicle = nil
local TargetCoords            = nil
local CurrentlyTowedVehicle   = nil
local JobStarted = nil
local Blips                   = {}
local LastCancel = GetGameTimer() - 2 * 60000

ESX                           = nil
GUI.Time                      = 0

CreateThread(function()
    while ESX == nil do
        TriggerEvent('esx:getSharedObject', function(obj) 
			ESX = obj 
		end)
        
		Citizen.Wait(250)
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

AddEventHandler('exile_rpm:hasEnteredMarker', function(zone, data)
	if zone == 'BossActions' then
		CurrentAction     = 'menu_boss_actions'
		CurrentActionMsg  = 'Naciśnij ~INPUT_CONTEXT~ aby otworzyć panel zarządzania'
	elseif zone == 'Cloakroom' then
		CurrentAction     = 'cloakroom'
		CurrentActionMsg  = 'Naciśnij ~INPUT_CONTEXT~ aby otworzyć szatnię'
	elseif zone == 'VehicleActions' then
		CurrentAction     = 'menu_vehicle_actions'
		CurrentActionMsg  = 'Naciśnij ~INPUT_CONTEXT~ pobrać pojazd'
		CurrentActionData = data
	elseif zone == 'VehicleDeleter' then
		local playerPed = PlayerPedId()
		if IsPedInAnyVehicle(playerPed, false) then
			local vehicle = GetVehiclePedIsIn(playerPed, false)
			if DoesEntityExist(vehicle) then
				CurrentAction     = 'menu_vehicle_deleter'
				CurrentActionMsg  = 'Naciśnij ~INPUT_CONTEXT~ odstawić pojazd'
				CurrentActionData = data
				CurrentActionData.vehicle = vehicle
			end
		end
	elseif zone == 'JobZone' then
		CurrentAction     = 'job_zone'
		CurrentActionMsg  = 'Naciśnij ~INPUT_CONTEXT~ rozpocząc pracę'
	elseif zone == 'elementy' then
		CurrentAction     = 'elementy'
		CurrentActionMsg  = 'Naciśnij ~INPUT_CONTEXT~ aby rozpocząc wymiane elementów'
	elseif zone == 'Sell' then
		CurrentAction     = 'sell'
		CurrentActionMsg  = 'Naciśnij ~INPUT_CONTEXT~ zamnotować stelaż'
	end
end)

AddEventHandler('exile_rpm:hasExitedMarker', function(zone)
    CurrentAction = nil
    ESX.UI.Menu.CloseAll()
end)

CreateThread(function()
	while true do
		Citizen.Wait(1)
        if PlayerData.job ~= nil and PlayerData.job.name == 'rpm' then
            local found = false

			local isInMarker  = false
			local currentZone = nil
			local currentData = nil

            local coords = GetEntityCoords(PlayerPedId())
            
            if #(coords - vec3(Config.BossActions.x, Config.BossActions.y, Config.BossActions.z)) < Config.DrawDistance then
                found = true
				
				ESX.DrawMarker(vec3(Config.BossActions.x, Config.BossActions.y, Config.BossActions.z))
			end
			
			for i=1, #Config.Cloakroom, 1 do
				if #(coords - vec3(Config.Cloakroom[i].coords.x, Config.Cloakroom[i].coords.y, Config.Cloakroom[i].coords.z)) < Config.DrawDistance then
					found = true
					
					ESX.DrawMarker(vec3(Config.Cloakroom[i].coords.x, Config.Cloakroom[i].coords.y, Config.Cloakroom[i].coords.z))
				end
			end
			
			for i, data in ipairs(Config.VehicleActions) do
                if #(coords - vec3(data.Spawner.x, data.Spawner.y, data.Spawner.z)) < Config.DrawDistance then
                    found = true
					
					ESX.DrawBigMarker(vec3(data.Spawner.x, data.Spawner.y, data.Spawner.z))
				end
			end

			for i, data in ipairs(Config.VehicleDeleters) do
                if #(coords - vec3(data.Spawner.x, data.Spawner.y, data.Spawner.z)) < Config.DrawDistance then
                    found = true
					
					ESX.DrawBigMarker(vec3(data.Spawner.x, data.Spawner.y, data.Spawner.z))
				end
			end

			--etap 1
			
			if JobStarted ~= nil then
				if JobStarted.start_point ~= nil then
					if #(GetEntityCoords(PlayerPedId()) - JobStarted.start_point) < 15.0 then
						found = true
						ESX.DrawBigMarker(JobStarted.start_point)
					end
				end
			end

			if JobStarted ~= nil then
				if JobStarted.start_point ~= nil then
					if #(coords - JobStarted.start_point) < 3.0 then
						isInMarker  = true
						currentZone = 'JobZone'
					end
				end
			end


			--etap 2
			
			if Config ~= nil then
				if Config.elementy ~= nil then
					if #(GetEntityCoords(PlayerPedId()) - Config.elementy) < 15.0 then
						found = true
						ESX.DrawBigMarker(Config.elementy)
					end
				end
			end

			if Config ~= nil then
				if Config.elementy ~= nil then
					if #(GetEntityCoords(PlayerPedId()) - Config.elementy) < 3.0 then
						isInMarker  = true
						currentZone = 'elementy'
					end
				end
			end

			--etap 3
			
			if Config ~= nil then
				if Config.EndPoint ~= nil then
					if #(GetEntityCoords(PlayerPedId()) - Config.EndPoint) < 15.0 then
						found = true
						ESX.DrawBigMarker(Config.EndPoint)
					end
				end
			end


			if Config ~= nil then
				if Config.EndPoint ~= nil then
					if #(GetEntityCoords(PlayerPedId()) - Config.EndPoint) < 3.0 then
						isInMarker  = true
						currentZone = 'Sell'
					end
				end
			end
			-----
    
			if #(coords - vec3(Config.BossActions.x, Config.BossActions.y, Config.BossActions.z)) < Config.MarkerSize.x then
				isInMarker  = true
				currentZone = 'BossActions'
			end
			
			for i=1, #Config.Cloakroom, 1 do
				if #(coords - vec3(Config.Cloakroom[i].coords.x, Config.Cloakroom[i].coords.y, Config.Cloakroom[i].coords.z)) < Config.MarkerSize.x then
					isInMarker  = true
					currentZone = 'Cloakroom'
				end
			end
			
			if not currentZone then
				for i, data in ipairs(Config.VehicleActions) do
					if #(coords - vec3(data.Spawner.x, data.Spawner.y, data.Spawner.z)) < Config.MarkerSize.x then
						isInMarker  = true
						currentZone = 'VehicleActions'
						currentData = data
						break
					end
				end

				if not currentZone then
					for i, data in ipairs(Config.VehicleDeleters) do
						if #(coords - vec3(data.Spawner.x, data.Spawner.y, data.Spawner.z)) < (Config.MarkerSize.x + 2.) then
							isInMarker  = true
							currentZone = 'VehicleDeleter'
							currentData = data
							break
						end
					end
				end
			end

			if isInMarker and not HasAlreadyEnteredMarker then
				HasAlreadyEnteredMarker = true
				LastZone                = currentZone
				TriggerEvent('exile_rpm:hasEnteredMarker', currentZone, currentData)
			end
			
			if not isInMarker and HasAlreadyEnteredMarker then
				HasAlreadyEnteredMarker = false
				TriggerEvent('exile_rpm:hasExitedMarker', LastZone)
            end
            
            if not found then
				Citizen.Wait(2000)
			end
		else
			Citizen.Wait(2000)
		end
	end
end)

CreateThread(function()
	while true do
		Citizen.Wait(0)
		if PlayerData.job and PlayerData.job.name == 'rpm' then

			if CurrentAction ~= nil then
				SetTextComponentFormat('STRING')
				AddTextComponentString(CurrentActionMsg)

				DisplayHelpTextFromStringLabel(0, 0, 1, -1)
				if IsControlJustReleased(0, Keys['E']) then
					if CurrentAction == 'menu_vehicle_actions' then
						local elements = {}
						for _, vehicle in ipairs(Config.Vehicles) do
							if PlayerData.job.grade >= vehicle.grade then
								table.insert(elements, vehicle)
							end
						end

						local save = CurrentActionData
						ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'vehicle_spawner', {
							title	= 'Wybór pojazdu',
							align	= 'center',
							elements = elements
						}, function(data, menu)
							menu.close()
							ESX.Game.SpawnVehicle(data.current.model, GetEntityCoords(PlayerPedId()), 221.89, function(vehicle)
								JobVehicle = vehicle
								local playerPed, tick = PlayerPedId(), 20
								repeat
									TaskWarpPedIntoVehicle(playerPed, vehicle, -1)
									tick = tick - 1
									Citizen.Wait(50)
								until IsPedInAnyVehicle(playerPed, false) or tick == 0
								SetVehicleMaxMods(vehicle, data.current.model, (data.current.livery or false), (data.current.offroad or false), (data.current.color or false), (data.current.extras or nil))
								local plate = "RPM " .. math.random(1000,9999)
								SetVehicleNumberPlateText(vehicle, plate)
								TriggerServerEvent('ls:addOwner', plate, false)
								TriggerServerEvent('exile_rpm:insertPlayer', GetVehicleNumberPlateText(vehicle))
							end)
						end, function(data, menu)
							menu.close()
							CurrentAction	 = 'menu_vehicle_actions'
							CurrentActionMsg  = 'Naciśnij ~INPUT_CONTEXT~ pobrać pojazd'
							CurrentActionData = save
						end)
					elseif CurrentAction == 'menu_vehicle_deleter' then
						if CurrentActionData.SpawnPoint then
						DoScreenFadeOut(800)
						while not IsScreenFadedOut() do
							Citizen.Wait(0)
						end
						end

						ESX.Game.DeleteVehicle(CurrentActionData.vehicle)
						if CurrentActionData.SpawnPoint then
						ESX.Game.Teleport(PlayerPedId(), GetEntityCoords(PlayerPedId()), function()
							DoScreenFadeIn(800)
						end)
						end
					elseif CurrentAction == 'menu_boss_actions' then
						RPMBossMenu()
					elseif CurrentAction == 'cloakroom' then
						OpenCloakroom()
					elseif CurrentAction == 'job_zone' then
						if not IsPedInAnyVehicle(PlayerPedId(), false) then
							StartPhoto()
						else
							ESX.ShowNotification("Aby rozpocząć ~r~zlecenie ~w~opuść ~r~pojazd")
						end
					elseif CurrentAction == 'elementy' then
						if not IsPedInAnyVehicle(PlayerPedId(), false) then
							StartElementy()
						else
							ESX.ShowNotification("Aby rozpocząć ~r~wymiane ~w~opuść ~r~pojazd")
						end
					elseif CurrentAction == 'sell' then
						StartSelling()
					end

					CurrentAction = nil
				end
			end
		else
			Citizen.Wait(2000)
		end
	end
end)

OpenCloakroom = function()
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
				TriggerEvent('skinchanger:loadSkin', skin)
				-- USUWANIE BLIPOW PRZY PRZEBIERANIU
				RemoveBlip(blip_work)
				RemoveBlip(blip_elementy)
				RemoveBlip(blip_end)
				
				if JobStarted ~= nil then
					CancelJob()
				end
			elseif data.current.value == 'job_wear' then
					TriggerEvent('skinchanger:loadClothes', skin, Config.Clothes.Male)
				if JobStarted == nil then
					StartJob()
				end
			end
		end)

		menu.close()
	end, function(data, menu)
		menu.close()
	end)
end

StartPhoto = function()
	local inventory = ESX.GetPlayerData().inventory
	local count = 0
	for i=1, #inventory, 1 do
		if inventory[i].name == 'rpm_element1' then
			count = inventory[i].count
		end
	end
	FreezeEntityPosition(PlayerPedId(), true)
	RemoveBlip(blip_work)
	if not IsPedActiveInScenario(PlayerPedId()) then
		--TaskStartScenarioInPlace(PlayerPedId(), "WORLD_HUMAN_PAPARAZZI", 0, false)
	end
	if count < 1 then
		exports["stinky_taskbar"]:taskBar(10000, "Pobieranie materiałów", false, true)
		Citizen.InvokeNative(0xAAA34F8A7CB32098, PlayerPedId())
		--[[local camera = GetClosestObjectOfType(GetEntityCoords(PlayerPedId()), 1.0, `prop_pap_camera_01`, false, false, false)
		if camera ~= 0 and camera ~= nil then
			SetEntityAsMissionEntity(camera, true, true)
			DeleteEntity(camera)
		end]]
		TriggerServerEvent('exile_rpm:giveItem', 'rpm_element1', 100)
		FreezeEntityPosition(PlayerPedId(), false)
		ESX.ShowNotification('Zebrano ~r~wystarczająco~w~ dużo elementów, udaj się do następnego ~r~punktów.')
	end
	FreezeEntityPosition(PlayerPedId(), false)
end

StartElementy = function()
	local inventory = ESX.GetPlayerData().inventory
	local count = 0
	for i=1, #inventory, 1 do
		if inventory[i].name == 'rpm_element1' then
			count = inventory[i].count
		end
	end
	if count > 99 then
		FreezeEntityPosition(PlayerPedId(), true)
		RemoveBlip(blip_elementy)
		ESX.Streaming.RequestAnimDict('gestures@m@standing@casual', function()
			TaskPlayAnim(PlayerPedId(), 'gestures@m@standing@casual', 'gesture_easy_now', 8.0, -8.0, -1, 1, 0, false, false, false)
		end)
		ESX.ShowNotification('~r~Trwa przygotowanie stelaży...')
		exports["stinky_taskbar"]:taskBar(10000, "Pobieranie materiałów", false, true)
		Citizen.InvokeNative(0xAAA34F8A7CB32098, PlayerPedId())
		TriggerServerEvent('exile_rpm:przygotowanie')
		ESX.ShowNotification('~w~Otrzymano ~r~ 20 ~w~stelaży z ~r~'..count..' ~w~elementów.')																					
		FreezeEntityPosition(PlayerPedId(), false)
		ESX.ShowNotification('Udaj się do ~r~siedziby ~w~aby zamnotować stelaż')
	else
		ESX.ShowNotification('~r~Nie posiadasz żadnych elementów!')
	end
end

StartSelling = function()
	local inventory = ESX.GetPlayerData().inventory
	local count = 0
	for i=1, #inventory, 1 do
		if inventory[i].name == 'rpm_element2' then
			count = inventory[i].count
		end
	end
	if count > 19 then
		FreezeEntityPosition(PlayerPedId(), true)
		RemoveBlip(blip_end)
		ESX.Streaming.RequestAnimDict('gestures@m@standing@casual', function()
			TaskPlayAnim(PlayerPedId(), 'gestures@m@standing@casual', 'gesture_easy_now', 8.0, -8.0, -1, 1, 0, false, false, false)
		end)
		ESX.ShowNotification('~r~Trwa montowanie stelażu...')
		exports["stinky_taskbar"]:taskBar(10000, "Pobieranie materiałów", false, true)
		Citizen.InvokeNative(0xAAA34F8A7CB32098, PlayerPedId())
		FreezeEntityPosition(PlayerPedId(), false)
		
		TriggerServerEvent('exile_rpm:sell')
	else
		ESX.ShowNotification('~r~Nie posiadasz żadnych elementów!')
	end
end

RPMBossMenu = function()
	local elements = {
		{label = "Akcje szefa", value = '1'},
    }
    if PlayerData.job.grade >= 6 then
		table.insert(elements, {label = "Zarządzanie frakcją", value = '4'})
	end

	ESX.UI.Menu.CloseAll()

	ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'rpm_boss', {
		title    =  PlayerData.job.label,
		align    = 'bottom-right',
		elements = elements
	}, function(data, menu)

		if data.current.value == '1' then
			if PlayerData.job.grade >= 8 then
				TriggerEvent('esx_society:openBossMenu', 'rpm', function(data, menu)
					menu.close()
				end, { showmoney = true, withdraw = true, deposit = true, wash = false, employees = true})
			elseif PlayerData.job.grade >= 6 then
				TriggerEvent('esx_society:openBossMenu', 'rpm', function(data, menu)
					menu.close()
				end, { showmoney = false, withdraw = false, deposit = false, wash = false, employees = true})
			else
				TriggerEvent('esx_society:openBossMenu', 'rpm', function(data, menu)
					menu.close()
				end, { showmoney = false, withdraw = false, deposit = true, wash = false, employees = false})
            end
        elseif data.current.value == '2' then
			menu.close()
			ESX.TriggerServerCallback('ExileRP:getCourses', function(kursy)
				if kursy then
					local elements = {
						head = {'Imię i nazwisko', 'Liczba kursów', 'Stopień'},
						rows = {}
					}
					for i=1, #kursy, 1 do
						if kursy[i].job_grade == 0 then
							grade = 'Rekrut'
						elseif kursy[i].job_grade == 1 then
							grade = 'Nowicjusz'
						elseif kursy[i].job_grade == 2 then
							grade = 'Pracownik'
						elseif kursy[i].job_grade == 3 then
							grade = 'Fachowiec'
						elseif kursy[i].job_grade == 4 then
							grade = 'Zawodowiec'
						elseif kursy[i].job_grade == 5 then
							grade = 'Specjalista'
						elseif kursy[i].job_grade == 6 then
							grade = 'Manager'
						elseif kursy[i].job_grade == 7 then
							grade = 'Zastępca szefa'
						elseif kursy[i].job_grade == 8 then
							grade = 'Właściciel'
						end
						local name = kursy[i].firstname .. ' ' ..kursy[i].lastname
						table.insert(elements.rows, {
							data = kursy[i],
							cols = {
								name, 
								kursy[i].courses_count, 
								grade
							}
						})
						ESX.UI.Menu.Open('list', GetCurrentResourceName(), 'rpm', elements, function(data, menu)
						end, function(data, menu)
							menu.close()
						end)
                    end
                else
                    ESX.ShowNotification("~r~Lista kursów jest pusta!")
				end
			end, 'rpm')
		elseif data.current.value == '4' then
			menu.close()
			exports['exile_legaljobs']:OpenLicensesMenu(PlayerData.job.name)
		end

	end, function(data, menu)
		menu.close()

		CurrentAction     = 'boss_actions'
		CurrentActionMsg  = "Naciśnij ~INPUT_CONTEXT~, aby otworzyć panel zarządzania"
		CurrentActionData = {}
	end)
end

SetVehicleMaxMods = function(vehicle, model, livery, offroad, color, extras)
	local mods = {
		bulletProofTyre = true,
		modTurbo		= true,
		modXenon		= true,
		dirtLevel	   = 0,
		modEngine	   = 3,
		modBrakes	   = 2,
		modTransmission = 2,
		modSuspension   = 3,
		extras		  = {1,1,1,1,1,1,1,1,1,1,1,1}
	}
	if offroad then
		mods.wheels = 4
		mods.modFrontWheels = 10
	end

	if color then
		if type(color) == 'table' then
			mods.color1 = color[1]
			mods.color2 = color[2]
		else
			mods.color1 = color
			mods.color2 = color
		end
	end

	mods.modArmor = 4
	if extras then
		for k, v in pairs(extras) do
			mods.extras[tonumber(k)] = tonumber(v)
		end
	end

	ESX.Game.SetVehicleProperties(vehicle, mods)
	if livery then
		SetVehicleLivery(vehicle, livery)
	end
end

CancelJob = function()
	if JobStarted ~= nil then
		if GetGameTimer() - LastCancel > 2 * 60000 then
			FreezeEntityPosition(JobVehicle, false)
			if DoesBlipExist(blip_work) then
				RemoveBlip(blip_work)
			elseif DoesBlipExist(blip_elementy) then
				RemoveBlip(blip_elementy)
			elseif DoesBlipExist(blip_end) then
				RemoveBlip(blip_end)
			end
			JobStarted = nil
			LastCancel = GetGameTimer()
		else
			ESX.ShowNotification("Odczekaj ~y~2 minuty~w~ przed następną ~r~anulacją pracy")
		end
	end
end

StartJob = function()
	if JobStarted == nil then
		CreateNewPlace('START')
	end
end

CreateNewPlace = function(state)
	if state == 'START' then
		JobStarted = {}
		math.randomseed(math.random(1000, 9999999999))
		JobStarted.start_point = Config.MissionLocations[math.random(1, #Config.MissionLocations)]

		--ETAP 1
		blip_work = AddBlipForCoord(vec3(JobStarted.start_point.x, JobStarted.start_point.y, JobStarted.start_point.z))
		SetBlipSprite(blip_work, 237)
		SetBlipColour(blip_work, 0)
		SetBlipDisplay(blip_work, 4)
		SetBlipAsShortRange(blip_work, false)
		BeginTextCommandSetBlipName('STRING')
		AddTextComponentSubstringPlayerName("#1 Zbieranie elementów stelażu")
		EndTextCommandSetBlipName(blip_work)
	end

	--ETAP 2
	blip_elementy = AddBlipForCoord(vec3(Config.elementy.x, Config.elementy.y, Config.elementy.z))
	SetBlipSprite(blip_elementy, 237)
	SetBlipColour(blip_elementy, 0)
	SetBlipDisplay(blip_elementy, 4)
	SetBlipAsShortRange(blip_elementy, false)
	BeginTextCommandSetBlipName('STRING')
	AddTextComponentSubstringPlayerName("#2 Wymiana elementów na stelaż")
	EndTextCommandSetBlipName(blip_elementy)

	-- ETAP 3
	blip_end = AddBlipForCoord(vec3(Config.EndPoint.x, Config.EndPoint.y, Config.EndPoint.z))
	SetBlipSprite(blip_end, 237)
	SetBlipColour(blip_end, 0)
	SetBlipDisplay(blip_end, 4)
	SetBlipAsShortRange(blip_end, false)
	BeginTextCommandSetBlipName('STRING')
	AddTextComponentSubstringPlayerName("#3 Montaż stelażu")
	EndTextCommandSetBlipName(blip_end)
end