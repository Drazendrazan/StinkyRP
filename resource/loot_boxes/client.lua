local script_active = true
ESX = nil
local draw = {}

Citizen.CreateThread(function()
	while ESX == nil do
		TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
		Citizen.Wait(0)
	end	
end)



RegisterNUICallback('mkbuss:NUIoff', function(data, cb)
	SetNuiFocus(false,false)
    SendNUIMessage({
        type = "off"
    })
end)

-- [[ MARKERY ]] --

AddEventHandler('exile_boxes:hasEnteredMarker', function(zone)
	CurrentAction     = 'exchange_menu'
	CurrentActionMsg  = 'Naciśnij ~INPUT_CONTEXT~ aby wymienić ~r~serca~s~.'
	CurrentActionData = {zone = zone}
end)

AddEventHandler('exile_boxes:hasExitedMarker', function(zone)
	CurrentAction = nil
	ESX.UI.Menu.CloseAll()
end)

CreateThread(function()
	local model = GetHashKey("s_m_y_casino_01")
	RequestModel(model)
	while not HasModelLoaded(model) do
		Citizen.Wait(1)
	end
	npc = CreatePed(5, model, 206.6, -1851.44, 26.48, 0.0, false, true)

	SetEntityHeading(npc, 136.41)

	FreezeEntityPosition(npc, true)

	SetEntityInvincible(npc, true)

	SetBlockingOfNonTemporaryEvents(npc, true)

	TaskPlayAnim(npc, "mini@strip_club@idles@bouncer@base", "base", 8.0, 0.0, -1, 1, 0, 0, 0, 0)
end)

CreateThread(function()
	while true do
		Citizen.Wait(10)
		local coords, sleep      = GetEntityCoords(Citizen.InvokeNative(0x43A66C31C68491C0, -1)), true
		local isInMarker  = false
		local currentZone = nil

		for k,v in pairs(Config.Zones) do
			for i = 1, #v.Pos, 1 do
				if(GetDistanceBetweenCoords(coords, v.Pos[i].x, v.Pos[i].y, v.Pos[i].z, true) < Config.Size.x) then
					sleep = false
					isInMarker  = true
					ShopItems   = v.Items
					currentZone = k
					LastZone    = k
				end
			end
		end
		if isInMarker and not HasAlreadyEnteredMarker then
			HasAlreadyEnteredMarker = true
			TriggerEvent('exile_boxes:hasEnteredMarker', currentZone)
		end
		if not isInMarker and HasAlreadyEnteredMarker then
			HasAlreadyEnteredMarker = false
			TriggerEvent('exile_boxes:hasExitedMarker', LastZone)
		end
		if sleep then
			Citizen.Wait(1000)
		end
	end
end)

CreateThread(function()
	while true do
		Citizen.Wait(10)

		if CurrentAction ~= nil then

			SetTextComponentFormat('STRING')
			AddTextComponentString(CurrentActionMsg)
			DisplayHelpTextFromStringLabel(0, 0, 1, -1)

			if IsControlJustReleased(0, 38) then

				if CurrentAction == 'exchange_menu' then
					OpenExchangeMenu(CurrentActionData.zone)
				end

				CurrentAction = nil

			end

		else
			Citizen.Wait(500)
		end
	end
end)



RegisterNetEvent("mkbuss:open5mscriptscom")
AddEventHandler("mkbuss:open5mscriptscom", function(data)
    if Config.CloseInventoryHudTrigger ~= '' and Config.CloseInventoryHudTrigger ~= nil then
        TriggerEvent(Config.CloseInventoryHudTrigger)
    end
    
	local sum = 0
	draw = {}
	for k, v in pairs(Config["exilecases"][data].list) do
		local rate = Config["chance"][v.tier].rate * 100
		for i=1,rate do 
			if v.item then
				if v.amount then
					table.insert(draw, {item = v.item ,amount = v.amount, tier = v.tier})
				else
					table.insert(draw, {item = v.item ,amount = 1, tier = v.tier})
				end
			elseif v.weapon then
				table.insert(draw, {weapon = v.weapon , tier = v.tier})
			elseif v.vehicle then
				table.insert(draw, {vehicle = v.vehicle, tier = v.tier})
			elseif v.money then
				table.insert(draw, {money = v.money, tier = v.tier})
			elseif v.black_money then
				table.insert(draw, {black_money = v.black_money, tier = v.tier})
			end
			i = i + 1
		end
		sum = sum + rate
	end
	local random = math.random(1,sum)
	SetNuiFocus(true,true)
	SendNUIMessage({
        type = "ui",
		data = Config["exilecases"][data].list,
		img = Config["image_source"],
		win = draw[random]
    })
	Wait(9000)
	if draw[random].item then
		TriggerServerEvent('mkbuss:giveReward', 'item',draw[random].item,draw[random].amount)
	elseif draw[random].weapon then
		TriggerServerEvent('mkbuss:giveReward', 'weapon',draw[random].weapon)
	elseif draw[random].money then
		TriggerServerEvent('mkbuss:giveReward', 'money',draw[random].money)
	elseif draw[random].black_money then
		TriggerServerEvent('mkbuss:giveReward', 'black_money',draw[random].black_money)
	end
end)

-- [[ RESPIENIE AUT ]] --

function OpenExchangeMenu()
	ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'exchangemenu', {
		title    = 'Wymiana serc',
		align    = 'center',
		elements = {
			{label = 'Skrzynki Legalne', value = 'legalcase'},
            --{label = 'Skrzynki Nielegalne', value = 'illegalcase'},
		}
	}, function(data, menu)
		if data.current.value == 'legalcase' then
            ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'exchangemenulegal', {
                title    = 'Skrzynki Legalne',
                align    = 'center',
                elements = {
                    {label = 'Skrzynka 1 - ['..Config.RequiredLegalCase1..' SERC]', value = 'legalcase1'},
                }
                }, function(data2, menu2)
                    if data2.current.value == 'legalcase1' then
                        TriggerServerEvent("exile_boxes:exchange")
                        Citizen.Wait(1500)
                    end
                end, function(data2, menu2)
                menu2.close()
            end)
			Citizen.Wait(1500)
        elseif data.current.value == 'illegalcase' then
            ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'exchangemenulegal', {
                title    = 'Skrzynki Nielegalne',
                align    = 'center',
                elements = {
                    {label = 'Skrzynka 1 - ['..Config.RequiredIllLegalCase2..' SERC]', value = 'illegalcase1'},
                }
                }, function(data3, menu3)
                    if data3.current.value == 'illegalcase1' then
                        TriggerServerEvent("exile_boxes:exchange2")
                        Citizen.Wait(1500)
                    end
                end, function(data3, menu3)
                menu3.close()
            end)
            Citizen.Wait(1500)
		end
	end, function(data, menu)
		menu.close()
		CurrentAction     = 'exchange_menu'
		CurrentActionMsg  = 'Naciśnij ~INPUT_CONTEXT~ aby wymienić ~r~serca~s~.'
		CurrentActionData = {zone = zone}
	end)
end

-- [[ BLIPY ]] --
CreateThread(function()
	for i=1, #Config.Blips, 1 do
		local blip = AddBlipForCoord(Config.Blips[i].x, Config.Blips[i].y, Config.Blips[i].z)
		SetBlipSprite (blip, Config.Blips[i].id)
		SetBlipScale  (blip, Config.Blips[i].size)
		SetBlipDisplay(blip, 4)
		SetBlipColour (blip, Config.Blips[i].color)
		SetBlipAsShortRange(blip, true)
		BeginTextCommandSetBlipName("STRING")
		AddTextComponentString(Config.Blips[i].name)
		EndTextCommandSetBlipName(blip)
	end
end)