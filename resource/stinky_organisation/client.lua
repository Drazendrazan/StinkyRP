ESX = nil
OrganizationBlip = {}
local PlayerData, CurrentAction = {}
local currentjoblocation = nil
local Blips = {}
local lastUsed = 0
local lastUsedKey = 0

CreateThread(function()
	while ESX == nil do
		TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
		Citizen.Wait(0)
  	end
  
  	while ESX.GetPlayerData().job == nil do
		Citizen.Wait(10)
	end

	PlayerData = ESX.GetPlayerData()
	refreshBlip()
end)

RegisterNetEvent('esx:playerLoaded')
AddEventHandler('esx:playerLoaded', function(xPlayer)
	PlayerData = xPlayer
end)

RegisterNetEvent('esx:setHiddenJob')
AddEventHandler('esx:setHiddenJob', function(hiddenjob)
	PlayerData.hiddenjob = hiddenjob
	deleteBlip()
	refreshBlip()
end)

function refreshBlip()
	if PlayerData.hiddenjob ~= nil and Organisations.Blips[PlayerData.hiddenjob.name] then
		local blip = AddBlipForCoord(Organisations.Blips[PlayerData.hiddenjob.name])
		SetBlipSprite (blip, 84)
		SetBlipDisplay(blip, 4)
		SetBlipScale  (blip, 0.8)
		SetBlipColour (blip, 6)
		SetBlipAsShortRange(blip, true)
		BeginTextCommandSetBlipName("STRING")
		AddTextComponentString("Dom organizacji")
		EndTextCommandSetBlipName(blip)
		table.insert(OrganizationBlip, blip)
	end
end

function deleteBlip()
	if OrganizationBlip[1] ~= nil then
		for i=1, #OrganizationBlip, 1 do
			RemoveBlip(OrganizationBlip[i])
			table.remove(OrganizationBlip, i)
		end
	end
end

function OpenOrganisationActionsMenu()
	ESX.TriggerServerCallback('Stinky:GetLevel', function(level, szafkazubrniami, szafka, sklep, f7, aktualnie, max, inventory_max, clothes_max)
		if f7 == 1 then
			ESX.UI.Menu.CloseAll()
			local elements = {}
			if PlayerData.hiddenjob.grade >= Organisations.Interactions[PlayerData.hiddenjob.name].handcuffs then
				table.insert(elements, { label = 'Kajdanki', value = 'handcuffs' })
			end
			if PlayerData.hiddenjob.grade >= Organisations.Interactions[PlayerData.hiddenjob.name].repair then
				table.insert(elements, { label = 'Napraw pojazd', value = 'repair' })
			end
			if PlayerData.hiddenjob.grade >= Organisations.Interactions[PlayerData.hiddenjob.name].worek then
				table.insert(elements, { label = 'Worek', value = 'worek' })
			end
			table.insert(elements, { label = 'Gwizdek', value = 'gwizdek' })

			ESX.UI.Menu.Open(
			'default', GetCurrentResourceName(), 'Stinky_actions',
			{
				title    = 'Organizacja '..Organisations.Organisations[PlayerData.hiddenjob.name].Label,
				align    = 'center',
				elements = elements
			}, function(data, menu)
				if data.current.value == 'handcuffs' then
					menu.close()
					-- Trigger Kajdanki
				elseif data.current.value == 'repair' then
					menu.close()
					-- Trigger Repair
				elseif data.current.value == 'worek' then
					TriggerServerEvent('Stinky:CheckHeadBag')
				elseif data.current.value == 'gwizdek' then
					useGwizdek()
				end
			end, function(data, menu)
				menu.close()
			end)
		else
			ESX.ShowNotification("Nie masz wykupionego menu interakcji! ")
		end
	end)
end

function OpenInventoryMenu(station)
	ESX.TriggerServerCallback('Stinky_stocks:getSharedInventoryInJob', function(inventory)
		for i=1, #inventory.items, 1 do
			ESX.TriggerServerCallback('Stinky:GetLevel', function(level, aktualnie, max, inventory_max, clothes_max)
				if #inventory.items >= inventory_max then
					ESX.UI.Menu.CloseAll()
					ESX.ShowNotification("~r~Przekroczono limit przedmiotów w szafce - nie możesz z niej korzystać do momentu zwiększenia levelu.")
					return
				end
			end)
		end
	end, station)

	if Organisations.Organisations[PlayerData.hiddenjob.name] and PlayerData.hiddenjob.grade >= Organisations.Organisations[PlayerData.hiddenjob.name].Inventory.from then
		ESX.UI.Menu.CloseAll()
		local elements = {
			{label = "Włóż", value = 'deposit'},
			{label = "Wyciągnij", value = 'withdraw'}
		}
		ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'Stinky_inventory',
		{
			title    = 'Organizacja '..Organisations.Organisations[PlayerData.hiddenjob.name].Label,
			align    = 'center',
			elements = elements
		}, function(data, menu)
			if data.current.value == 'withdraw' then
				ESX.TriggerServerCallback('Stinky_stocks:getSharedInventoryInJob', function(inventory)
					local elements = {}
					for i=1, #inventory.items, 1 do
						local item = inventory.items[i]
						if item.count > 0 then
						table.insert(elements, {
							label = item.label .. ' x' .. item.count,
							type = 'item_standard',
							value = item.name
						})
						end
					end
					ESX.UI.Menu.Open(
						'default', GetCurrentResourceName(), 'Stinky_stocks',
						{
						title    = 'Organizacja '..Organisations.Organisations[PlayerData.hiddenjob.name].Label,
						align    = 'center',
						elements = elements
						},
						function(data, menu)
						local itemName = data.current.value
						ESX.UI.Menu.Open(
							'dialog', GetCurrentResourceName(), 'Stinky_stocks_menu_get_item_count',
							{
							title = "Ilość",
							},
							function(data2, menu2)
								local count = tonumber(data2.value)
								if count == nil then
									ESX.ShowNotification("~r~Nieprawidłowa wartość!")
								else
									TriggerServerEvent('Stinky_stocks:getItemInStock', data.current.type, data.current.value, count, station)
									menu2.close()
									menu.close()
								end
							end,
							function(data2, menu2)
								menu2.close()
							end
						)
						end,
						function(data, menu)
							menu.close()
						end
					)
				end, station)
			else
				ESX.TriggerServerCallback('Stinky_stocks:getPlayerInventory', function(inventory)
					local elements = {}
					for i=1, #inventory.items, 1 do
						local item = inventory.items[i]
						if item.count > 0 then
							table.insert(elements, {label = item.label .. ' x' .. item.count, type = 'item_standard', value = item.name})
						end
					
					end

					ESX.UI.Menu.Open(
						'default', GetCurrentResourceName(), 'Stinky_stocks_menu',
						{
						title    = "Ekwipunek",
						align    = 'center',
						elements = elements
						},
						function(data, menu)
						local itemName = data.current.value
						local itemType = data.current.type
						ESX.UI.Menu.Open(
							'dialog', GetCurrentResourceName(), 'Stinky_stocks_menu_put_item_count',
							{
							title = "Ilość"
							},
							function(data2, menu2)
								local count = tonumber(data2.value)
								if count == nil then
									ESX.ShowNotification("~r~Nieprawidłowa wartość!")
								else
									TriggerServerEvent('Stinky_stocks:putItemInStock', itemType, itemName, count, station)
									menu2.close()
									menu.close()
								end
							end,
							function(data2, menu2)
							menu2.close()
							end
						)
						end,
						function(data, menu)
						menu.close()
						end
					)
				end)
			end
		end, function(data, menu)
			menu.close()
			if isUsing then
				isUsing = false
				TriggerServerEvent('Stinky:setStockUsed', 'society_'..PlayerData.hiddenjob.name, 'inventory', false)
			end
		end)
	else
		ESX.ShowNotification('~o~Nie jesteś osobą, która może korzystać z szafki.')
	end
end

AddEventHandler('Stinky:hasEnteredMarker', function(zone)
	print(zone)
	if zone == 'Cloakroom' then
		CurrentAction     = 'menu_cloakroom'
		CurrentActionMsg  = ('~y~Naciśnij ~INPUT_CONTEXT~ aby otworzyć przebieralnie.')
		CurrentActionData = {}
	elseif zone == 'Inventory' then
		CurrentAction     = 'menu_armory'
		CurrentActionMsg  = ('~y~Naciśnij ~INPUT_CONTEXT~ aby otworzyć szafkę.')
		CurrentActionData = {station = station}
	elseif zone == 'Weapons' then
		CurrentAction     = 'menu_armory_weapons'
		CurrentActionMsg  = ('~y~Naciśnij ~INPUT_CONTEXT~ aby otworzyć zbrojownie.')
		CurrentActionData = {station = station}
	elseif zone == "BossMenu" then
		CurrentAction     = 'menu_boss_actions'
		CurrentActionMsg  = "~y~Naciśnij ~INPUT_PICKUP~ aby otworzyć panel zarządzania"
		CurrentActionData = {}
	elseif zone == "Contract" then
		CurrentAction     = 'menu_contract_actions'
		CurrentActionMsg  = "~ys~Naciśnij ~INPUT_PICKUP~ aby zakupić kontrakt na broń"
		CurrentActionData = {}
	elseif zone == "LevelUp" then
		CurrentAction     = 'menu_level_up'
		CurrentActionMsg  = "~ys~Naciśnij ~INPUT_PICKUP~ aby zakupić upgrade organizacji"
		CurrentActionData = {}
	end
end)

AddEventHandler('Stinky:hasExitedMarker', function(zone)
	if not isInShopMenu then
		ESX.UI.Menu.CloseAll()
	end

	zoneName = nil
	CurrentAction = nil
end)

CreateThread(function()
	while true do
		Citizen.Wait(1)
		if PlayerData.hiddenjob ~= nil then
			if Organisations.Organisations[PlayerData.hiddenjob.name] then
				local playerPed = PlayerPedId()
				local isInMarker  = false
				local currentZone = nil
				local coords, letSleep = GetEntityCoords(playerPed), true
				
				for k,v in pairs(Organisations.Organisations[PlayerData.hiddenjob.name]) do
					if GetDistanceBetweenCoords(coords, v.coords, true) < Organisations.DrawDistance then
						letSleep = false
						DrawMarker(22, v.coords, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 1.0, 1.0, 1.0, 22, 219, 101, 80, false, true, 2, false, false, false, false)
					end

					if(GetDistanceBetweenCoords(coords, v.coords, true) < 1.5) then
						isInMarker  = true
						currentZone = k
					end
				end

				if (isInMarker and not HasAlreadyEnteredMarker) or (isInMarker and LastZone ~= currentZone) then
					HasAlreadyEnteredMarker = true
					LastZone                = currentZone
					TriggerEvent('Stinky:hasEnteredMarker', currentZone)
				end

				if not isInMarker and HasAlreadyEnteredMarker then
					HasAlreadyEnteredMarker = false
					TriggerEvent('Stinky:hasExitedMarker', LastZone)
				end

				if letSleep then
					Citizen.Wait(1000)
				end
			else
				Citizen.Wait(5000)
			end
		else
			Citizen.Wait(5000)
		end
	end
end)

CreateThread(function()
	while true do
		Citizen.Wait(1)
		if CurrentAction then
			ESX.ShowHelpNotification(CurrentActionMsg)
			if IsControlJustReleased(0, 38) and PlayerData.hiddenjob and Organisations.Organisations[PlayerData.hiddenjob.name] and not exports['esx_policejob']:isHandcuffed() and not exports['esx_ambulancejob']:getDeathStatus() then
				ESX.TriggerServerCallback('Stinky:GetLevel', function(level, szafkazubrniami, szafka, sklep, f7, aktualnie, max, inventory_max, clothes_max)
					if CurrentAction == 'menu_armory' then
						if szafka == 1 then
							local closestPlayer, closestDistance = ESX.Game.GetClosestPlayer()
							if closestDistance > 3 or closestPlayer == -1 then
								ESX.TriggerServerCallback('Stinky:checkStock', function()
									if not isUsed then
										isUsing = true
										TriggerServerEvent('Stinky:setStockUsed', 'society_'..PlayerData.hiddenjob.name, 'inventory', true)
										zoneName = 'inventory'
										OpenInventoryMenu('society_' .. PlayerData.hiddenjob.name)
									else
										ESX.ShowNotification("~r~Ktoś właśnie używa tej szafki")
									end
								end, 'society_'..PlayerData.hiddenjob.name, 'inventory')
							else
								ESX.ShowNotification('Stoisz za blisko innego gracza!')
							end
						else
							ESX.ShowNotification('Nie masz wykupinego dostepu do szafki')
						end
					elseif CurrentAction == 'menu_cloakroom' then
						if szafkazubrniami == 1 then
							ESX.UI.Menu.CloseAll()
							OpenCloakroomMenu(PlayerData.hiddenjob.name)
						else
							ESX.ShowNotification('Nie masz wykupinego dostepu do przebieralni')
						end
					elseif CurrentAction == 'menu_boss_actions' then
						ESX.UI.Menu.CloseAll()
						OpenBossMenu(PlayerData.hiddenjob.name, Organisations.Organisations[PlayerData.hiddenjob.name].BossMenu.from)
					elseif CurrentAction == 'menu_contract_actions' then
						if sklep == 1 then
							ESX.UI.Menu.CloseAll()
							OpenContractMenu()
						else
							ESX.ShowNotification('Nie masz wykupinego dostepu do sklepu')
						end
					elseif CurrentAction == 'menu_level_up' then
						if Organisations.Organisations[PlayerData.hiddenjob.name] and PlayerData.hiddenjob.grade >= Organisations.Organisations[PlayerData.hiddenjob.name].Inventory.from then
							ESX.UI.Menu.CloseAll()
							OpenLevelUp()
						else
							ESX.ShowNotification('Nie możesz otworzyć menu zarządzania poziomem organizacji')
						end
					end
					CurrentAction = nil
				end)
			end
		end
		if not IsPedInAnyVehicle(Citizen.InvokeNative(0xD80958FC74E988A6)) then
			if IsControlJustReleased(0, 168) and GetEntityHealth(Citizen.InvokeNative(0xD80958FC74E988A6)) > 100 and PlayerData.hiddenjob and Organisations.Interactions[PlayerData.hiddenjob.name] then
				OpenOrganisationActionsMenu(PlayerData.hiddenjob.name)
			end
		end
	end		
end)

OpenContractMenu = function()
	ESX.UI.Menu.CloseAll()
	local elements = {
		{label =  Organisations.Organisations[PlayerData.hiddenjob.name].Contract.Utils.Label..' $'..Organisations.Organisations[PlayerData.hiddenjob.name].Contract.Utils.Price, value = Organisations.Organisations[PlayerData.hiddenjob.name].Contract.Utils.Price},
		{label = 'Amunicja $'..Organisations.Organisations[PlayerData.hiddenjob.name].Contract.Utils.Ammo.Price, value = 'ammo'}
	}
	ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'Stinky_contract', { title = 'Organizacja '..Organisations.Organisations[PlayerData.hiddenjob.name].Label, align = 'center', elements = elements}, function(data, menu) if data.current.value == Organisations.Organisations[PlayerData.hiddenjob.name].Contract.Utils.Price then klameczka = Organisations.Organisations[PlayerData.hiddenjob.name].Contract.Utils.Weapon TriggerServerEvent('Stinky:buyItem', klameczka) elseif data.current.value == 'ammo' then TriggerServerEvent('Stinky:buyItem', 'pistol_ammo') end
	end, function(data, menu)
		menu.close()
	end)
end

OpenLevelUp = function()
	ESX.UI.Menu.CloseAll()

	local elements = {}

	ESX.TriggerServerCallback('Stinky:GetLevel', function(level, szafkazubrniami, szafka, sklep, f7, aktualnie, max, inventory_max, clothes_max)
		print(1)
		ESX.TriggerServerCallback('Stinky:getPlayerDressing', function(dressing)
			print(2)
			ESX.TriggerServerCallback('Stinky_stocks:getSharedInventoryInJob', function(inventory)
				print(3)
				table.insert(elements, {label = 'Limity:', value = 'none'})
				table.insert(elements, {label = 'Aktualny Level: '..level, value = 0})
				table.insert(elements, {label = 'Aktualnie zatrudnionych: '..aktualnie..'/'..max, value = 'none'})
				table.insert(elements, {label = 'Aktualna pojemność szafki: '..#inventory.items..'/'..inventory_max})
				table.insert(elements, {label = 'Aktualna pojemność szafy z ubraniami: '..#dressing..'/'..clothes_max, value = 'none'})
				table.insert(elements, {label = 'Menu Interakcji '..f7, value = 0})
				table.insert(elements, {label = 'Sklep '..sklep, value = 0})
				table.insert(elements, {label = 'Szafka '..szafka, value = 0})
                table.insert(elements, {label = 'Szafka z ubraniami '..szafkazubrniami, value = 0})
			end, PlayerData.hiddenjob.name)
		end)
		Wait(400)
		table.insert(elements, {label = ''})
		table.insert(elements, {label = 'Upgrade:'})
		if f7 == 0 then
			table.insert(elements, {label = 'Menu Interakcji - $100000', value = 1})
			TriggerServerEvent('Stinky:LevelUp1')
		else
			table.insert(elements, {label = 'Twoja organizacja posiada menu interakcji'})
		end
		if sklep == 0 then
			table.insert(elements, {label = 'Sklep - $100000', value = 1})
		else
			table.insert(elements, {label = 'Twoja organizacja posiada dostep do sklepu'})
		end
        if szafka == 0 then
			table.insert(elements, {label = 'Szafka - $100000', value = 1})
		else
			table.insert(elements, {label = 'Twoja organizacja posiada dostep do szafki'})
		end
		if szafkazubrniami == 0 then
			table.insert(elements, {label = 'Szafka z ubraniami - $100000', value = 1})
		else
			table.insert(elements, {label = 'Twoja organizacja posiada dostep do szafki z ubraniami'})
		end
		if level == 0 then
			table.insert(elements, {label = 'Upgrade na Level 1 - $100000', value = 1})
		elseif level == 1 then
			table.insert(elements, {label = 'Upgrade na Level 2 - $100000', value = 2})
		elseif level == 2 then
			table.insert(elements, {label = 'Upgrade na Level 3 - $100000', value = 3})
		elseif level == 3 then
			table.insert(elements, {label = 'Upgrade na Level 4 - $100000', value = 4})
		elseif level == 4 then
			table.insert(elements, {label = 'Upgrade na Level 5 - $100000', value = 5})
		else
			table.insert(elements, {label = 'Twoja organizacja posiada maksymalny poziom'})
		end
	end)

	Wait(800)

    ESX.UI.Menu.Open(
    'default', GetCurrentResourceName(), 'Stinky_level',
    {
        title    = 'Organizacja '..Organisations.Organisations[PlayerData.hiddenjob.name].Label,
        align    = 'center',
        elements = elements
	}, function(data, menu)
		TriggerServerEvent('Stinky:LevelUp', data.current.value)
		OpenLevelUp()
    end, function(data, menu)
        menu.close()
    end)
end

function OpenCloakroomMenu(station)
	local playerPed = PlayerPedId()

	local elements = {
		{ label = ('Przeglądaj ubrania'), value = 'przegladaj_ubrania' }
	}
	ESX.UI.Menu.CloseAll()
	if PlayerData.hiddenjob.grade_name == 'boss' then
		table.insert(elements, {
			label = ('<span style="color:yellowgreen;">Dodaj ubranie</span>'),
			value = 'zapisz_ubranie' 
		})
	end
	table.insert(elements, {
		label = ('=== Ubrania prywatne ==='),
		value = nil 
	})
	table.insert(elements, {
		label = ('Otwórz swoją szafe'),
		value = 'twoje' 
	})
	table.insert(elements, {
		label = ('Usuń swoje ubranie'),
		value = 'usun' 
	})
	ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'Stinky_cloakroom', {
		title    = ('Ubrania'),
		align    = 'top',
		elements = elements
	}, function(data, menu)
		if data.current.value == 'twoje' then
			ESX.TriggerServerCallback('esx_property:getPlayerDressing', function(dressing)
				local elements = {}

				for i=1, #dressing, 1 do
					table.insert(elements, {
						label = dressing[i],
						value = i
					})
				end

				ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'Stinky_player_dressing',
				{
					title    = 'Szafka z ubraniami',
					align    = 'center',
					elements = elements
				}, function(data2, menu2)

					TriggerEvent('skinchanger:getSkin', function(skin)
						ESX.TriggerServerCallback('esx_property:getPlayerOutfit', function(clothes)
							TriggerEvent('skinchanger:loadClothes', skin, clothes)
							TriggerEvent('esx_skin:setLastSkin', skin)

							TriggerEvent('skinchanger:getSkin', function(skin)
								TriggerServerEvent('esx_skin:save', skin)
								hasPaid = true
							end)
						end, data2.current.value)
					end)

				end, function(data2, menu2)
					menu2.close()
				end)
			end)
		elseif data.current.value == "usun" then
			ESX.TriggerServerCallback('esx_property:getPlayerDressing', function(dressing)
				local elements = {}

				for i=1, #dressing, 1 do
					table.insert(elements, {
						label = dressing[i],
						value = i
					})
				end

				ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'Stinky_remove_cloth', {
					title    = 'Sklep z ubraniami - usuń ubrania',
					align    = 'center',
					elements = elements
				}, function(data2, menu2)
					menu2.close()
					TriggerServerEvent('esx_clotheshop:removeOutfit', data2.current.value)
					ESX.ShowNotification(_U('removed_cloth'))
				end, function(data2, menu2)
					menu2.close()
				end)
			end)

		elseif data.current.value == 'przegladaj_ubrania' then
			ESX.TriggerServerCallback('Stinky:getPlayerDressing', function(dressing)
				elements = nil
				local elements = {}
				for i=1, #dressing, 1 do
					table.insert(elements, {
						label = dressing[i],
						value = i
					})
				end
				if dressing then
					ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'Stinky_wszystkie_ubrania', {
						title    = ('Ubrania'),
						align    = 'top',
						elements = elements
					}, function(data2, menu2)
					
						local elements2 = {
							{ label = ('Ubierz ubranie'), value = 'ubierz_sie' },
						}
						if PlayerData.hiddenjob.grade_name == 'boss' then
							table.insert(elements2, {
								label = ('<span style="color:red;"><b>Usuń ubranie</b></span>'),
								value = 'usun_ubranie' 
							})
						end
						ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'Stinky_edycja_ubran', {
						title    = ('Ubrania'),
						align    = 'top',
						elements = elements2
					}, function(data3, menu3)
							if data3.current.value == 'ubierz_sie' then
								TriggerEvent('skinchanger:getSkin', function(skin)
									ESX.TriggerServerCallback('Stinky:getPlayerOutfit', function(clothes)
										if clothes then
											TriggerEvent('skinchanger:loadClothes', skin, clothes)
											TriggerEvent('esx_skin:setLastSkin', skin)
											ESX.ShowNotification('~g~Pomyślnie zmieniłeś swój ubiór!')
											ClearPedBloodDamage(playerPed)
											ResetPedVisibleDamage(playerPed)
											ClearPedLastWeaponDamage(playerPed)
											ResetPedMovementClipset(playerPed, 0)
											TriggerEvent('skinchanger:getSkin', function(skin)
												TriggerServerEvent('esx_skin:save', skin)
											end)
										end
									end, data2.current.value, station)
								end)
							end
							if data3.current.value == 'usun_ubranie' then
								TriggerServerEvent('Stinky:removeOutfit', data2.current.value, station)
								ESX.ShowNotification('~r~Pomyślnie usunąłeś ubiór o nazwie: ~y~' .. data2.current.label)
							end
						end, function(data3, menu3)
							menu3.close()
							
							CurrentAction     = 'menu_cloakroom'
							CurrentActionMsg  = ('~y~Naciśnij ~INPUT_CONTEXT~ aby otworzyć przebieralnie.')
							CurrentActionData = {}
						end)
						
					end, function(data2, menu2)
						menu2.close()
						
						CurrentAction     = 'menu_cloakroom'
						CurrentActionMsg  = ('~y~Naciśnij ~INPUT_CONTEXT~ aby otworzyć przebieralnie.')
						CurrentActionData = {}
					end)
				end
			end, station)
		end
		if data.current.value == 'zapisz_ubranie' then
			ESX.UI.Menu.Open('dialog', GetCurrentResourceName(), 'Stinky_nazwa_ubioru', {
				title = ('Nazwa ubioru')
			}, function(data2, menu2)
				ESX.UI.Menu.CloseAll()

				TriggerEvent('skinchanger:getSkin', function(skin)
					TriggerServerEvent('Stinky:saveOutfit', data2.value, skin, station)
					ESX.ShowNotification('~g~Pomyślnie zapisano ubiór o nazwie: ~y~' .. data2.value)
				end)
			end, function(data2, menu2)
				menu2.close()
			end)
		end
	end, function(data, menu)
		menu.close()
	end)
end


RegisterNetEvent('Stinky:setBlip')
AddEventHandler('Stinky:setBlip', function(coords, job)
    for k, v in pairs(Organisations.Jobs) do
        if v == PlayerData.hiddenjob.name then
            if next(Blips) == nil then
                lastUsed = GetGameTimer() + Organisations.Cooldown * 1000
                local blip = AddBlipForCoord(coords.x, coords.y, coords.z)
                SetBlipPriority(blip, 4)
                SetBlipScale(blip, 0.9)
                SetBlipSprite(blip, 126)
                SetBlipColour(blip, 2)
                SetBlipAlpha(blip, 250)
                SetBlipAsShortRange(blip, true)

                BeginTextCommandSetBlipName("STRING")
                AddTextComponentString('# Gwizdek ('.. string.upper(job) .. ')')
                EndTextCommandSetBlipName(blip)
                ESX.ShowNotification('~r~Organizacja '..string.upper(job)..' użyła gwizdka! ~g~Kieruj się na GPS!')
                table.insert(Blips, { blip_data = blip, job = PlayerData.hiddenjob.name })
                CreateThread(function()
                    local alpha = 250
                    while alpha > 0 and DoesBlipExist(blip) do
                        Wait(Organisations.BlipTime * 100)
                        SetBlipAlpha(blip, alpha)
                        alpha = alpha - 25

                        if alpha == 0 then
                            RemoveBlip(blip)
                            for i, b in ipairs(Blips) do
                                if b.blip_data == blip then
                                    table.remove(Blips, i)
                                    return
                                end
                            end

                            break
                        end
                    end
                end)
            else
                for i, b in ipairs(Blips) do
                    if b.job == PlayerData.hiddenjob.name then
                        ESX.ShowNotification('Twoja organizacja użyła już gwizdka!')
                        break 
                    else
                        lastUsed = GetGameTimer() + 300000
                        local blip = AddBlipForCoord(coords.x, coords.y, coords.z)
                        SetBlipPriority(blip, 4)
                        SetBlipScale(blip, 0.9)
                        SetBlipSprite(blip, 126)
                        SetBlipColour(blip, 2)
                        SetBlipAlpha(blip, 250)
                        SetBlipAsShortRange(blip, true)
                
                        BeginTextCommandSetBlipName("STRING")
                        AddTextComponentString('# Gwizdek ('.. string.upper(job) .. ')')
                        EndTextCommandSetBlipName(blip)
                
                        table.insert(Blips, { blip_data = blip, job = PlayerData.hiddenjob.name })
                        ESX.ShowNotification('~r~Organizacja '..string.upper(job)..' użyła gwizdka! ~g~Kieruj się na GPS!')
                        CreateThread(function()
                            local alpha = 250
                            while alpha > 0 and DoesBlipExist(blip) do
                                Wait(Organisations.BlipTime  * 100)
                                SetBlipAlpha(blip, alpha)
                                alpha = alpha - 5
                
                                if alpha == 0 then
                                    RemoveBlip(blip)
                                    for i, b in ipairs(Blips) do
                                        if b[i].blip_data == blip then
                                            table.remove(Blips, i)
                                            return
                                        end
                                    end
                                    break
                                end
                            end
                        end)
                        break
                    end
                end
            end
        end
    end
end)

function useGwizdek()
	if GetGameTimer() > lastUsed then
		if GetGameTimer() > lastUsedKey then
			local ped = PlayerPedId()
			local coords = GetEntityCoords(ped)
			TriggerServerEvent('Stinky:checkUse', coords)
			lastUsedKey = GetGameTimer() + 10000
		else
			ESX.ShowNotification('Nie tak szybko!')
		end
	else
		local time = lastUsed - GetGameTimer()
		ESX.ShowNotification('Odczekaj jeszcze: ' .. math.floor(time / 1000) .. 's!' )
	end
end

function OpenBossMenu(org, grade)
	print(org, grade)
	if PlayerData.hiddenjob.grade >= grade then
		TriggerEvent('esx_society:openBossMenu2', org, function(data, menu)
			menu.close()
		end, { showmoney = true, withdraw = true, deposit = true, wash = false, employees = true })
	else
		TriggerEvent('esx_society:openBossMenu2', org, function(data, menu)
			menu.close()
		end, { showmoney = false, withdraw = false, deposit = true, wash = false, employees = false })
	end
end