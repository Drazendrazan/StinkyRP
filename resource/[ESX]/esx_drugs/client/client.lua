CreateThread(function()
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

	local cokeQTE       			= 0
	ESX 			    			= nil
	local coke_poochQTE 			= 0
	local cokepericoQTE       			= 0
	local cokeperico_poochQTE 			= 0
	local ekstazyQTE       			= 0
	local ekstazy_poochQTE 			= 0
	local oghazeQTE       			= 0
	local oghaze_poochQTE 			= 0
	local weedQTE					= 0
	local weed_poochQTE 			= 0
	local amfaQTE					= 0
	local amfa_poochQTE 			= 0
	local methQTE					= 0
	local meth_poochQTE 			= 0
	local heroinaQTE					= 0
	local heroina_poochQTE 			= 0
	local myJob 					= nil
	local HasAlreadyEnteredMarker   = false
	local LastZone                  = nil
	local isInZone                  = false
	local CurrentAction             = nil
	local CurrentActionMsg          = ''
	local CurrentActionData         = {}

	local event1 = nil
	local event2 = nil
	local event3 = nil
	local event4 = nil
	local event5 = nil
	local event6 = nil
	local event7 = nil
	local event8 = nil
	local event9 = nil
	local event10 = nil
	local event11 = nil
	local event12 = nil
	local event13 = nil
	local event14 = nil
	local event15 = nil
	local event16 = nil
	local event17 = nil


	RegisterNetEvent('kossek_ac:esx_dragi_config')
	AddEventHandler('kossek_ac:esx_dragi_config', function(cossa)
		Config.Zones = cossa
	end)

	RegisterNetEvent('kossek_ac:esx_dragi_eventchanger')
	AddEventHandler('kossek_ac:esx_dragi_eventchanger', function(eve1, eve2, eve3, eve4, eve5, eve6, eve7, eve8, eve9, eve10, eve11, eve12, eve13, eve14, eve15, eve16, eve17)
		event1 = eve1
		event2 = eve2
		event3 = eve3
		event4 = eve4
		event5 = eve5
		event6 = eve6
		event7 = eve7
		event8 = eve8
		event9 = eve9
		event10 = eve10
		event11 = eve11
		event12 = eve12
		event13 = eve13
		event14 = eve14
		event15 = eve15
		event16 = eve16
		event17 = eve17
	end)

	Wait(1500)
	
	CreateThread(function()
		while ESX == nil do
			TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
			Citizen.Wait(0)
		end
	end)

	AddEventHandler('esx_drugs:hasEnteredMarker', function(zone)
		if myJob == 'police' or myJob == 'ambulance' or myJob == 'offpolice' or myJob == 'offambulance' then
			return
		end

		ESX.UI.Menu.CloseAll()
		
		if zone == 'exitMarker' then
			CurrentAction     = zone
			CurrentActionMsg  = _U('exit_marker')
			CurrentActionData = {}
		end
		
		if zone == 'CokeField' then
			CurrentAction     = zone
			CurrentActionMsg  = _U('press_collect_coke')
			CurrentActionData = {}
		end

		if zone == 'CokeProcessing' then
			CurrentAction     = zone
			CurrentActionMsg  = _U('press_process_coke')
			CurrentActionData = {}
		end

		if zone == 'MethField' then
			CurrentAction     = zone
			CurrentActionMsg  = _U('press_collect_meth')
			CurrentActionData = {}
		end

		if zone == 'MethProcessing' then
			CurrentAction     = zone
			CurrentActionMsg  = _U('press_process_meth')
			CurrentActionData = {}
		end

		if zone == 'WeedField' then
			CurrentAction     = zone
			CurrentActionMsg  = _U('press_collect_weed')
			CurrentActionData = {}
		end

		if zone == 'WeedProcessing' then
			CurrentAction     = zone
			CurrentActionMsg  = _U('press_process_weed')
			CurrentActionData = {}
		end

		if zone == 'cokepericoField' then
			CurrentAction     = zone
			CurrentActionMsg  = _U('press_collect_cokeperico')
			CurrentActionData = {}
		end

		if zone == 'cokepericoProcessing' then
			CurrentAction     = zone
			CurrentActionMsg  = _U('press_process_cokeperico')
			CurrentActionData = {}
		end

		if zone == 'ekstazyField' then
			CurrentAction     = zone
			CurrentActionMsg  = _U('press_collect_cokeperico')
			CurrentActionData = {}
		end

		if zone == 'ekstazyProcessing' then
			CurrentAction     = zone
			CurrentActionMsg  = _U('press_process_cokeperico')
			CurrentActionData = {}
		end

		if zone == 'amfaField' then
			CurrentAction     = zone
			CurrentActionMsg  = _U('press_process_amfa')
			CurrentActionData = {}
		end

		if zone == 'amfaProcessing' then
			CurrentAction     = zone
			CurrentActionMsg  = _U('press_collect_amfa')
			CurrentActionData = {}
		end

		if zone == 'heroinaField' then
			CurrentAction     = zone
			CurrentActionMsg  = _U('press_collect_heroina')
			CurrentActionData = {}
		end

		if zone == 'heroinaProcessing' then
			CurrentAction     = zone
			CurrentActionMsg  = _U('press_process_heroina')
			CurrentActionData = {}
		end

		if zone == 'oghazeField' then
			CurrentAction     = zone
			CurrentActionMsg  = _U('press_collect_weed')
			CurrentActionData = {}
		end

		if zone == 'oghazeProcessing' then
			CurrentAction     = zone
			CurrentActionMsg  = _U('press_process_weed')
			CurrentActionData = {}
		end

	end)

	AddEventHandler('esx_drugs:hasExitedMarker', function(zone)
		CurrentAction = nil
		ESX.UI.Menu.CloseAll()

		TriggerServerEvent('esx_drugs:stopHarvestoghaze')
		TriggerServerEvent('esx_drugs:stopTransformoghaze')
		TriggerServerEvent('esx_drugs:stopHarvestCoke')
		TriggerServerEvent('esx_drugs:stopTransformCoke')
		TriggerServerEvent('esx_drugs:stopHarvestekstazy')
		TriggerServerEvent('esx_drugs:stopTransformekstazy')
		TriggerServerEvent('esx_drugs:stopHarvestcokeperico')
		TriggerServerEvent('esx_drugs:stopTransformcokeperico')
		TriggerServerEvent('esx_drugs:stopHarvestamfa')
		TriggerServerEvent('esx_drugs:stopTransformamfa')
		TriggerServerEvent('esx_drugs:stopSellCoke')
		TriggerServerEvent('esx_drugs:stopHarvestMeth')
		TriggerServerEvent('esx_drugs:stopTransformMeth')
		TriggerServerEvent('esx_drugs:stopSellMeth')
		TriggerServerEvent('esx_drugs:stopHarvestWeed')
		TriggerServerEvent('esx_drugs:stopTransformWeed')
		TriggerServerEvent('esx_drugs:stopSellWeed')
		TriggerServerEvent('esx_drugs:stopHarvestheroina')
		TriggerServerEvent('esx_drugs:stopTransformheroina')
		TriggerServerEvent('esx_drugs:stopSellheroina')
	end)

	-- Render markers
	CreateThread(function()
		while true do

			Citizen.Wait(3)

			local coords, sleep = GetEntityCoords(PlayerPedId()), true
			local fps = true
			for k,v in pairs(Config.Zones) do
				if #(coords - vec3(v.x, v.y, v.z)) < Config.DrawDistance then
					fps = false
					sleep = false
					DrawMarker(Config.MarkerType, v.x, v.y, v.z, 0.0, 0.0, 0.0, 0, 0.0, 0.0, Config.ZoneSize.x, Config.ZoneSize.y, Config.ZoneSize.z, Config.MarkerColor.r, Config.MarkerColor.g, Config.MarkerColor.b, 40, false, true, 2, false, false, false, false)
				end
			end
			if sleep then
				Citizen.Wait(1000)
			end
			if fps then
				if lastZone then
					TriggerEvent('esx_drugs:hasExitedMarker', lastZone)
					lastZone = nil
				end
				Wait(500)
			end
		end
	end)

	-- Create blips
	--CreateThread(function()
	--	for k,v in pairs(Config.Zones) do
	--		local blip = AddBlipForCoord(v.x, v.y, v.z)

	--		SetBlipSprite (blip, v.sprite)
	--		SetBlipDisplay(blip, 4)
	--		SetBlipScale  (blip, 0.9)
	--		SetBlipColour (blip, v.color)
	--		SetBlipAsShortRange(blip, true)

	--		BeginTextCommandSetBlipName("STRING")
	--		AddTextComponentString(v.name)
	--		EndTextCommandSetBlipName(blip)
	--	end
	--end)

	-- RETURN NUMBER OF ITEMS FROM SERVER
	RegisterNetEvent('esx_drugs:ReturnInventory')
	AddEventHandler('esx_drugs:ReturnInventory', function(cokeNbr, cokepNbr, ekstazyNbr, ekstazypNbr, methNbr, oghazeNbr, oghazepNbr, methpNbr, weedNbr, amfaNbr, amfapNbr, weedpNbr, cokepericoNbr, cokepericopNbr, heroinaNbr, heroinapNbr, jobName, currentZone)
		cokeQTE	   = cokeNbr
		coke_poochQTE = cokepNbr
		methQTE 	  = methNbr
		meth_poochQTE = methpNbr
		oghazeQTE 	  = oghazeNbr
		oghaze_poochQTE = oghazepNbr
		ekstazyQTE 	  = ekstazyNbr
		ekstazy_poochQTE = ekstazypNbr
		cokepericoQTE = cokepericoNbr
		cokeperico_poochQTE = cokepericopNbr
		amfaQTE 	  = amfaNbr
		amfa_poochQTE = amfapNbr
		weedQTE 	  = weedNbr
		weed_poochQTE = weedpNbr
		heroinaQTE	   = heroinaNbr
		heroina_poochQTE = heroinapNbr
		myJob		 = jobName
		TriggerEvent('esx_drugs:hasEnteredMarker', currentZone)
	end)

	-- Activate menu when player is inside marker
	CreateThread(function()
		while true do

			Citizen.Wait(3)

			local coords, sleep      = GetEntityCoords(PlayerPedId()), true
			local isInMarker  = false
			local currentZone = nil

			for k,v in pairs(Config.Zones) do
				if #(coords - vec3(v.x, v.y, v.z)) < Config.ZoneSize.x / 2 then
					sleep = false
					isInMarker  = true
					currentZone = k
				end
			end

			if isInMarker and not hasAlreadyEnteredMarker then
				hasAlreadyEnteredMarker = true
				lastZone				= currentZone
				TriggerServerEvent('esx_drugs:GetUserInventory', currentZone)
			end

			if not isInMarker and hasAlreadyEnteredMarker then
				hasAlreadyEnteredMarker = false
				TriggerEvent('esx_drugs:hasExitedMarker', lastZone)
			end

			if isInMarker and isInZone then
				TriggerEvent('esx_drugs:hasEnteredMarker', 'exitMarker')
			end
			if sleep then
				Citizen.Wait(1000)
			end
		end
	end)

	-- Key Controls
	local xSKAPlayers = exports['esx_scoreboard']:BierFrakcje('players')

	CreateThread(function()
		while true do
			Citizen.Wait(10)
			if CurrentAction ~= nil then
				SetTextComponentFormat('STRING')
				AddTextComponentString(CurrentActionMsg)
				DisplayHelpTextFromStringLabel(0, 0, 1, -1)
				if IsControlJustReleased(0, Keys['E']) then
					if xSKAPlayers >= 0 then
						isInZone = true -- unless we set this boolean to false, we will always freeze the user
						if CurrentAction == 'exitMarker' then
							isInZone = false -- do not freeze user
							ClearPedTasksImmediately(PlayerPedId())
							TriggerEvent('esx_drugs:hasExitedMarker', lastZone)

							ClearPedTasks(PlayerPedId())
							Citizen.Wait(2500)
						elseif CurrentAction == 'CokeField' then
							TriggerServerEvent(event2)
							--TaskStartScenarioInPlace(PlayerPedId(), 'CODE_HUMAN_MEDIC_TEND_TO_DEAD', 0, true)
						elseif CurrentAction == 'CokeProcessing' then
							TriggerServerEvent(event3)
							--TaskStartScenarioInPlace(PlayerPedId(), 'CODE_HUMAN_MEDIC_TEND_TO_DEAD', 0, true)
						elseif CurrentAction == 'MethField' then
							TriggerServerEvent(event4)
							--TaskStartScenarioInPlace(PlayerPedId(), 'CODE_HUMAN_MEDIC_TEND_TO_DEAD', 0, true)
						elseif CurrentAction == 'MethProcessing' then
							TriggerServerEvent(event5)
							--TaskStartScenarioInPlace(PlayerPedId(), 'CODE_HUMAN_MEDIC_TEND_TO_DEAD', 0, true)
						elseif CurrentAction == 'WeedField' then
							TriggerServerEvent(event6)
							--TaskStartScenarioInPlace(PlayerPedId(), 'CODE_HUMAN_MEDIC_TEND_TO_DEAD', 0, true)
						elseif CurrentAction == 'WeedProcessing' then
							TriggerServerEvent(event7)
							--TaskStartScenarioInPlace(PlayerPedId(), 'CODE_HUMAN_MEDIC_TEND_TO_DEAD', 0, true)
						elseif CurrentAction == 'heroinaField' then
							ESX.TriggerServerCallback('esx_license:checkLicense', function(hasWeaponLicense)
								if hasWeaponLicense then
									TriggerServerEvent(event8)
									--TaskStartScenarioInPlace(PlayerPedId(), 'CODE_HUMAN_MEDIC_TEND_TO_DEAD', 0, true)
								else
									ESX.ShowNotification("~r~Nie tym razem")
								end
							end, GetPlayerServerId(PlayerId()), 'heroina_transform')
						elseif CurrentAction == 'heroinaProcessing' then
							ESX.TriggerServerCallback('esx_license:checkLicense', function(hasWeaponLicense)
								if hasWeaponLicense then
									TriggerServerEvent(event9)
									--TaskStartScenarioInPlace(PlayerPedId(), 'CODE_HUMAN_MEDIC_TEND_TO_DEAD', 0, true)
								else
									ESX.ShowNotification("~r~Nie tym razem")
								end
							end, GetPlayerServerId(PlayerId()), 'heroina_transform')
						elseif CurrentAction == 'amfaField' then
							TriggerServerEvent(event11)
							--TaskStartScenarioInPlace(PlayerPedId(), 'CODE_HUMAN_MEDIC_TEND_TO_DEAD', 0, true)
						elseif CurrentAction == 'amfaProcessing' then
							TriggerServerEvent(event10)
							--TaskStartScenarioInPlace(PlayerPedId(), 'CODE_HUMAN_MEDIC_TEND_TO_DEAD', 0, true)
						elseif CurrentAction == 'cokepericoField' then
							TriggerServerEvent(event12)
							--TaskStartScenarioInPlace(PlayerPedId(), 'CODE_HUMAN_MEDIC_TEND_TO_DEAD', 0, true)
						elseif CurrentAction == 'cokepericoProcessing' then
							TriggerServerEvent(event13)
							--TaskStartScenarioInPlace(PlayerPedId(), 'CODE_HUMAN_MEDIC_TEND_TO_DEAD', 0, true)
						elseif CurrentAction == 'ekstazyField' then
							TriggerServerEvent(event14)
							--TaskStartScenarioInPlace(PlayerPedId(), 'CODE_HUMAN_MEDIC_TEND_TO_DEAD', 0, true)
						elseif CurrentAction == 'ekstazyProcessing' then
							TriggerServerEvent(event15)
							--TaskStartScenarioInPlace(PlayerPedId(), 'CODE_HUMAN_MEDIC_TEND_TO_DEAD', 0, true)
						elseif CurrentAction == 'oghazeField' then
							ESX.TriggerServerCallback('esx_license:checkLicense', function(hasWeaponLicense)
								if hasWeaponLicense then
									TriggerServerEvent(event16)
									--TaskStartScenarioInPlace(PlayerPedId(), 'CODE_HUMAN_MEDIC_TEND_TO_DEAD', 0, true)
								else
									ESX.ShowNotification("~r~Nie tym razem")
								end
							end, GetPlayerServerId(PlayerId()), 'oghaze_transform')
						elseif CurrentAction == 'oghazeProcessing' then
							ESX.TriggerServerCallback('esx_license:checkLicense', function(hasWeaponLicense)
								if hasWeaponLicense then
									TriggerServerEvent(event17)
									--TaskStartScenarioInPlace(PlayerPedId(), 'CODE_HUMAN_MEDIC_TEND_TO_DEAD', 0, true)
								else
									ESX.ShowNotification("~r~Nie tym razem")
								end
							end, GetPlayerServerId(PlayerId()), 'oghaze_transform')
						else
							isInZone = false -- not a esx_drugs zone
						end
						
						
						CurrentAction = nil
					else
						ESX.ShowNotification('~r~Nie ma wystarczającej liczby obywateli na dzielnicy!')
					end
				end
			end
		end
	end)
end)
