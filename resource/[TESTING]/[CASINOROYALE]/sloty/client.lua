ESX                             = nil
local PlayerData                = {}
local open 						= false

Citizen.CreateThread(function()
	while ESX == nil do
		TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
		Citizen.Wait(0)
	end
end)

Citizen.CreateThread(function()
    while ESX == nil do
        Citizen.Wait(10)

        TriggerEvent("esx:getSharedObject", function(xPlayer)
            ESX = xPlayer
        end)
    end

    while not ESX.IsPlayerLoaded() do 
        Citizen.Wait(500)
    end

    if ESX.IsPlayerLoaded() then
        PlayerData = ESX.GetPlayerData()
		TriggerServerEvent('route68_kasyno:getJoinChips')
    end
end)

Citizen.CreateThread(function()
	while true do
		Citizen.Wait(0)
		local found = false
		local coords = GetEntityCoords(PlayerPedId())
		local dis = #(coords - vec3(948.06, 31.9, 70.85))
		if dis <= 2.0 then
			ESX.ShowHelpNotification('Naciśnij ~INPUT_PICKUP~, aby zakupic/sprzedac zetony')
			--ESX.DrawMarker(vec3(948.06, 31.9, 70.85))
			DrawMarker(27, 948.06, 31.9, 70.85, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 1.5, 1.5, 1.0, 0, 203, 214, 100, false, false, 2, false, nil, nil, false)
			found = true
			if IsControlJustReleased(0, 38) then
				OtworzMenuKasyna()
			end
		elseif dis <= 20.0 then
			found = true
			DrawMarker(27, 948.06, 31.9, 70.85, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 1.5, 1.5, 1.0, 0, 203, 214, 100, false, false, 2, false, nil, nil, false)
			--ESX.DrawMarker(vec3(948.06, 31.9, 70.85))
		end
		if found == false then
			Citizen.Wait(2000)
		end
	end
end)

function OtworzMenuKasyna()
	ESX.UI.Menu.Open(
      'default', GetCurrentResourceName(), 'zetony',
      {
          title    = 'Royal Casino',
          align    = 'left',
          elements = {
			{label = "Kup Zetony", value = "buy"},
			{label = "Sprzedaj Zetony", value = "sell"},
		  }
      },
	  function(data, menu)
		local akcja = data.current.value
		if akcja == 'buy' then
			ESX.UI.Menu.Open('dialog', GetCurrentResourceName(), 'get_item_count', {
				title = 'Podaj Ilosc - $15/zeton'
			}, function(data2, menu2)

				local quantity = tonumber(data2.value)

				if quantity == nil then
					ESX.ShowNotification("Nieprawidlowa Ilosc!")
				else
					TriggerServerEvent('route68_kasyno:KupZetony', quantity)
					menu2.close()
				end

			end, function(data2, menu2)
				menu2.close()
			end)
		elseif akcja == 'sell' then
			ESX.UI.Menu.Open('dialog', GetCurrentResourceName(), 'put_item_count', {
				title = 'Podaj Ilosc - $10/zeton'
			}, function(data2, menu2)

				local quantity = tonumber(data2.value)

				if quantity == nil then
					ESX.ShowNotification("Nieprawidlowa Ilosc!")
				else
					TriggerServerEvent('route68_kasyno:WymienZetony', quantity)
					menu2.close()
				end

			end, function(data2, menu2)
				menu2.close()
			end)
		end
      end,
      function(data, menu)
		menu.close()
	  end
  )
end

local function drawHint(text)
	SetTextComponentFormat("STRING")
	AddTextComponentString(text)
	DisplayHelpTextFromStringLabel(0, 0, 1, -1)
end

RegisterNUICallback('wygrana', function(data)
	ESX.ShowNotification("Wygrałeś ~g~" .. data.win .. " ~w~żetonów!")
end)

RegisterNUICallback('updateBets', function(data)
	TriggerServerEvent('esx_slots:updateCoins', data.bets)
end)

function KeyboardInput(textEntry, inputText, maxLength)
    AddTextEntry('FMMC_KEY_TIP1', textEntry)
    DisplayOnscreenKeyboard(1, "FMMC_KEY_TIP1", "", inputText, "", "", "", maxLength)

    while UpdateOnscreenKeyboard() ~= 1 and UpdateOnscreenKeyboard() ~= 2 do
        Citizen.Wait(0)
    end

    if UpdateOnscreenKeyboard() ~= 2 then
        local result = GetOnscreenKeyboardResult()
        Citizen.Wait(500)
        return result
    else
        Citizen.Wait(500)
        return nil
    end
end

RegisterNetEvent("esx_slots:UpdateSlots")
AddEventHandler("esx_slots:UpdateSlots", function(lei)
	SetNuiFocus(true, true)
	open = true
	SendNUIMessage({
		showPacanele = "open",
		coinAmount = tonumber(lei)
	})
end)

RegisterNUICallback('exitWith', function(data, cb)
	cb('ok')
	SetNuiFocus(false, false)
	open = false
	TriggerServerEvent("esx_slots:PayOutRewards", math.floor(data.coinAmount))
end)

Citizen.CreateThread(function ()
	while true do
		Citizen.Wait(1)
		if open then
			DisableControlAction(0, 1, true) -- LookLeftRight
			DisableControlAction(0, 2, true) -- LookUpDown
			DisableControlAction(0, 24, true) -- Attack
			DisablePlayerFiring(PlayerPedId(), true) -- Disable weapon firing
			DisableControlAction(0, 142, true) -- MeleeAttackAlternate
			DisableControlAction(0, 106, true) -- VehicleMouseControlOverride
		end
	end
end)

CreateThread(function()
	while PlayerData.hiddenjob == nil do
		Citizen.Wait(100)
	end
	while true do
		Citizen.Wait(1)
		local found = false
		local isOpened = true
		local coords = GetEntityCoords(PlayerPedId())
		if PlayerData.job.name == 'casino' and PlayerData.hiddenjob.grade >= 4 then
			local dis = #(coords - vec3(Config.Casino.x, Config.Casino.y, Config.Casino.z))
			if dis <= 2.0 then
				ESX.ShowHelpNotification('Naciśnij ~INPUT_PICKUP~, aby otworzyć lub zamknąć kasyno')
				ESX.DrawMarker(vec3(Config.Casino.x, Config.Casino.y, Config.Casino.z))
				found = true
				if IsControlJustReleased(1, 38) then
					ESX.UI.Menu.Open(
						'default', GetCurrentResourceName(), 'yesorno',
						{
							title = "Menu Kasyna",
							align = 'center',
							elements = {
								{label = "Zamknij Kasyno", value = 'no'},
								{label = "Otworz Kasyno", value = 'yes'}
							}
						},function(data, menu)
							if data.current.value == 'yes' then
								ESX.ShowNotification("Otworzyles Kasyno")
								--TriggerEvent('chat:addMessage', {
									--template = '<div class="chat-message" style="padding: 5px 10px 5px; margin: 7px; background-color: rgba(10, 10, 10, 0.55); border-radius: 4px;"><i class="fas fa-user"style="font-size:13px;color:rgb(255,255,255,0.7)"></i>&ensp;<font color="FFFFFF" style="font-weight: bold;">[{0}]: </font><font color="white">{1}</font></div>',
									--args = { 'Casino Royale', '^3Ruletka w grze! Zapraszamy do Casino Royale!' }
								--})
								--TriggerServerEvent(GetCurrentResourceName() .. ':sendNews', 'Casino Royale', '^3Ruletka w grze! Zapraszamy do Casino Royale!')
								isOpened = true
								menu.close()
							elseif data.current.value == 'no' then
								ESX.ShowNotification("Zamknales Kasyno")
								--TriggerEvent('chat:addMessage', {
									--template = '<div class="chat-message" style="padding: 5px 10px 5px; margin: 7px; background-color: rgba(10, 10, 10, 0.55); border-radius: 4px;"><i class="fas fa-user"style="font-size:13px;color:rgb(255,255,255,0.7)"></i>&ensp;<font color="FFFFFF" style="font-weight: bold;">[{0}]: </font><font color="white">{1}</font></div>',
									--args = { 'Casino Royale', '^3Kasyno niedługo zostanie zamknięte. Zapraszamy ponownie!' }
								--})
								--TriggerServerEvent(GetCurrentResourceName() .. ':sendNews', 'Casino Royale', '^3Kasyno niedługo zostanie zamknięte. Zapraszamy ponownie!')
								isOpened = false
								menu.close()
							end
						end,
						function(data, menu)
							menu.close()
						end
					)
				end
			elseif dis <= 20.0 then
				found = true
				ESX.DrawMarker(vec3(Config.Casino.x, Config.Casino.y, Config.Casino.z))
			end
		end
		if isOpened then
			for i=1, #Config.Sloty do
				local dis = #(coords - vec3(Config.Sloty[i].x, Config.Sloty[i].y, Config.Sloty[i].z))
				if dis <= 2.0 then
					ESX.ShowHelpNotification('Naciśnij ~INPUT_PICKUP~, aby spróbować szczęścia na jednorękim bandycie')
					DrawMarker(1, Config.Sloty[i].x, Config.Sloty[i].y, Config.Sloty[i].z - 0.8, 0.0, 0.0, 0.0, 0.0, 180.0, 0.0, 4.0, 4.0, 0.8, 70, 163, 76, 50, false, true, 2, nil, nil, false)
					found = true
					if IsControlJustReleased(1, 38) then
						TriggerServerEvent('esx_slots:BetsAndMoney')
					end
				elseif dis <= 20.0 then
					found = true
					DrawMarker(1, Config.Sloty[i].x, Config.Sloty[i].y, Config.Sloty[i].z - 0.8, 0.0, 0.0, 0.0, 0.0, 180.0, 0.0, 4.0, 4.0, 0.8, 158, 52, 235, 50, false, true, 2, nil, nil, false)
				end
			end
			for i=1, #Config.Ruletka do
				local dis = #(coords - vec3(Config.Ruletka[i].x, Config.Ruletka[i].y, Config.Ruletka[i].z))
				if dis <= 2.0 then
					ESX.ShowHelpNotification('Naciśnij ~INPUT_PICKUP~, aby obstawić ruletkę')
					DrawMarker(1, Config.Ruletka[i].x, Config.Ruletka[i].y, Config.Ruletka[i].z - 0.8, 0.0, 0.0, 0.0, 0.0, 180.0, 0.0, 3.5, 3.5, 0.8, 70, 163, 76, 50, false, true, 2, nil, nil, false)
					found = true
					if IsControlJustReleased(1, 38) then
						TriggerEvent('route68_ruletka:start')
					end
				elseif dis <= 20.0 then
					found = true
					DrawMarker(1, Config.Ruletka[i].x, Config.Ruletka[i].y, Config.Ruletka[i].z - 0.8, 0.0, 0.0, 0.0, 0.0, 180.0, 0.0, 3.5, 3.5, 0.8, 158, 52, 235, 50, false, true, 2, nil, nil, false)
				end
			end
			for i=1, #Config.Blackjack do
				local dis = #(coords - vec3(Config.Blackjack[i].x, Config.Blackjack[i].y, Config.Blackjack[i].z))
				if dis <= 2.0 then
					ESX.ShowHelpNotification('Naciśnij ~INPUT_PICKUP~, aby zagrać w BlackJacka')
					DrawMarker(1, Config.Blackjack[i].x, Config.Blackjack[i].y, Config.Blackjack[i].z - 0.8, 0.0, 0.0, 0.0, 0.0, 180.0, 0.0, 2.5, 2.5, 0.8, 70, 163, 76, 50, false, true, 2, nil, nil, false)
					found = true
					if IsControlJustReleased(1, 38) then
						TriggerEvent('route68_blackjack:start')
					end
				elseif dis <= 20.0 then
					DrawMarker(1, Config.Blackjack[i].x, Config.Blackjack[i].y, Config.Blackjack[i].z - 0.8, 0.0, 0.0, 0.0, 0.0, 180.0, 0.0, 2.5, 2.5, 0.8, 158, 52, 235, 50, false, true, 2, nil, nil, false)
					found = true
				end
			end
		end
		if found == false then
			Citizen.Wait(2000)
		end
	end
end)

local coordonate = {
    {933.63, 41.61, 81.09, nil, 63.28, nil, 1535236204}, -- RECEPCJA
    {950.22, 33.25, 71.84, nil, 55.85, nil, -1371020112}, -- KASJER
	
    {927.58, 50.45, 81.11, nil, 59.48, nil, -245247470}, -- WEJSCIE
	{922.58, 42.4, 81.11, nil, 59.48, nil, 691061163}, -- WEJSCIE

	{941.73, 48.93, 75.99, nil, 328.96, nil, -886023758}, -- RULETKA
	{960.63, 71.74, 75.99, nil, 151.15, nil, -1922568579}, -- AUTO
	
	{949.28, 44.44, 71.64, nil, 143.6, nil, -886023758}, -- SLOTY
	{988.66, 46.45, 70.24, nil, 204.3, nil, 469792763}, -- BLACKJACK
	
	{986.39, 48.45, 70.24, nil, 44.55, nil, 999748158}, -- KOŚCI
	{945.02, 7.54, 75.74, nil, 354.11, nil, -254493138}, -- JACKPOT
}

Citizen.CreateThread(function()

    for _,v in pairs(coordonate) do
      RequestModel(v[7])
      while not HasModelLoaded(v[7]) do
        Wait(1)
      end
  
      RequestAnimDict("mini@strip_club@idles@bouncer@base")
      while not HasAnimDictLoaded("mini@strip_club@idles@bouncer@base") do
        Wait(1)
      end
      ped =  CreatePed(4, v[7],v[1],v[2],v[3]-1, 3374176, false, true)
      SetEntityHeading(ped, v[5])
      FreezeEntityPosition(ped, true)
      SetEntityInvincible(ped, true)
      SetBlockingOfNonTemporaryEvents(ped, true)
      TaskPlayAnim(ped,"mini@strip_club@idles@bouncer@base","base", 8.0, 0.0, -1, 1, 0, 0, 0, 0)
	end

end)

local heading = 148.63
local vehicle = nil

Citizen.CreateThread(function()
	while true do
		Citizen.Wait(10)
		if GetDistanceBetweenCoords(GetEntityCoords(PlayerPedId()), 935.23, 42.28, 71.57, true) < 40 then
			if DoesEntityExist(vehicle) == false then
				RequestModel(GetHashKey('pd_c8'))
				while not HasModelLoaded(GetHashKey('pd_c8')) do
					Wait(1)
				end
				vehicle = CreateVehicle(GetHashKey('pd_c8'), 935.23, 42.28, 71.57, heading, false, false)
				FreezeEntityPosition(vehicle, true)
				SetEntityInvincible(vehicle, true)
				SetEntityCoords(vehicle, 935.23, 42.28, 71.57, false, false, false, true)
				local props = ESX.Game.GetVehicleProperties(vehicle)
				props['wheelColor'] = 147
				props['plate'] = "Royal Casino"
				ESX.Game.SetVehicleProperties(vehicle, props)
			else
				SetEntityHeading(vehicle, heading)
				heading = heading+0.1
			end
		end
	end
end)

Citizen.CreateThread(function()
	while true do
		Citizen.Wait(10000)
		if vehicle ~= nil and GetDistanceBetweenCoords(GetEntityCoords(PlayerPedId()), 935.23, 42.28, 71.57, true) < 40 then
			SetEntityCoords(vehicle, 935.23, 42.28, 71.57, false, false, false, true)
		end
	end
end)