ESX = nil
TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
local PlayerData                = {}
local open 						= false
local societyMoney, isOpened 	= 0, false

CreateThread(function()
	while ESX == nil do
		TriggerEvent('hypex:getTwojStarySharedTwojaStaraObject', function(obj) 
			ESX = obj 
		end)
		
		Citizen.Wait(250)
	end
	
	Citizen.Wait(5000)
	PlayerData = ESX.GetPlayerData()
end)

RegisterNetEvent('esx:setHiddenJob')
AddEventHandler('esx:setHiddenJob', function(hiddenjob)
	PlayerData.hiddenjob = hiddenjob
end)

local function drawHint(text)
	SetTextComponentFormat("STRING")
	AddTextComponentString(text)
	DisplayHelpTextFromStringLabel(0, 0, 1, -1)
end

RegisterNUICallback('wygrana', function(data)
	ESX.ShowNotification("Wygrałeś ~g~" .. data.win .. "$!")
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

function GetCasinoMoney()
	return societyMoney
end

RegisterNetEvent(GetCurrentResourceName() .. ':updateSociety')
AddEventHandler(GetCurrentResourceName() .. ':updateSociety', function(value)
	societyMoney = value
end)

RegisterNetEvent(GetCurrentResourceName() .. ':updateSlots')
AddEventHandler(GetCurrentResourceName() .. ':updateSlots', function(lei)
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
	TriggerServerEvent(GetCurrentResourceName() .. ':reward', math.floor(data.coinAmount))
end)

CreateThread(function ()
	while true do
		Citizen.Wait(1)
		if open then
			DisableControlAction(0, 1, true) -- LookLeftRight
			DisableControlAction(0, 2, true) -- LookUpDown
			DisableControlAction(0, 24, true) -- Attack
			DisablePlayerFiring(PlayerPedId(), true) -- Disable weapon firing
			DisableControlAction(0, 142, true) -- MeleeAttackAlternate
			DisableControlAction(0, 106, true) -- VehicleMouseControlOverride
		else
			Citizen.Wait(500)
		end
	end
end)

CreateThread(function()
	Citizen.Wait(5000)
	while true do
		Citizen.Wait(3)
		ESX.TriggerServerCallback(GetCurrentResourceName() .. ':checkSociety', function(cb)
			societyMoney = cb.money
			isOpened = cb.opened
		end)
		Citizen.Wait(120000)
	end
end)

CreateThread(function()
	while PlayerData.hiddenjob == nil do
		Citizen.Wait(100)
	end
	while true do
		Citizen.Wait(1)
		local found = false
		local coords = GetEntityCoords(PlayerPedId())
		if PlayerData.job.name == 'casino' and PlayerData.hiddenjob.grade >= 4 then
			local dis = #(coords - vec3(Config.Casino.x, Config.Casino.y, Config.Casino.z))
			if dis <= 2.0 then
				ESX.ShowHelpNotification('Naciśnij ~INPUT_PICKUP~, aby otworzyć lub zamknąć kasyno')
				ESX.DrawMarker(vec3(Config.Casino.x, Config.Casino.y, Config.Casino.z))
				found = true
				if IsControlJustReleased(1, 38) then
					ESX.ShowNotification('Za chwilę ~y~kasyno ~w~zostanie ')
					ESX.UI.Menu.Open(
						'default', GetCurrentResourceName(), 'yesorno',
						{
							title = "Czy chcesz wysłać powiadomienie na wiadomościach?",
							align = 'center',
							elements = {
								{label = "Nie", value = 'no'},
								{label = "Tak", value = 'yes'}
							}
						},function(data, menu)
							if data.current.value == 'yes' then
								if cb == '~g~otwarte' then
									TriggerServerEvent(GetCurrentResourceName() .. ':sendNews', 'Casino Royale', '^3Ruletka w grze! Zapraszamy do Casino Royale!')
								else
									TriggerServerEvent(GetCurrentResourceName() .. ':sendNews', 'Casino Royale', '^3Kasyno niedługo zostanie zamknięte. Zapraszamy ponownie!')
								end
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
			elseif dis <= 20.0 then
				found = true
				ESX.DrawMarker(vec3(Config.Casino.x, Config.Casino.y, Config.Casino.z))
			end
		end
		for i=1, #Config.Sloty do
			local dis = #(coords - vec3(Config.Sloty[i].x, Config.Sloty[i].y, Config.Sloty[i].z))
			if dis <= 2.0 then
				ESX.ShowHelpNotification('Naciśnij ~INPUT_PICKUP~, aby spróbować szczęścia na jednorękim bandycie')
				DrawMarker(1, Config.Sloty[i].x, Config.Sloty[i].y, Config.Sloty[i].z - 0.8, 0.0, 0.0, 0.0, 0.0, 180.0, 0.0, 4.0, 4.0, 0.8, 70, 163, 76, 50, false, true, 2, nil, nil, false)
				found = true
				if IsControlJustReleased(1, 38) then
					TriggerServerEvent(GetCurrentResourceName() .. ':bet')
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
					TriggerEvent('exile_casino:rouletteStart')
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
					TriggerEvent('exile_casino:blackjackStart')
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
end)

local coordonate = {
    {927.29, 34.52, 80.29, nil, 334.83, nil, 1535236204}, -- RECEPCJA
    {960.68, 23.62, 76.99, nil, 56.16, nil, -1371020112}, -- KASJER
	
    {927.58, 50.45, 81.11, nil, 59.48, nil, -245247470}, -- WEJSCIE
	{922.58, 42.4, 81.11, nil, 59.48, nil, 691061163}, -- WEJSCIE

	{941.73, 48.93, 75.99, nil, 328.96, nil, -886023758}, -- RULETKA
	{960.63, 71.74, 75.99, nil, 151.15, nil, -1922568579}, -- AUTO
	
	{973.41, 76.72, 75.74, nil, 180.78, nil, -886023758}, -- SLOTY
	{993.13, 65.03, 75.52, nil, 153.12, nil, 469792763}, -- BLACKJACK
	
	{986.17, 48.0, 75.99, nil, 148.76, nil, 999748158}, -- KOŚCI
	{945.02, 7.54, 75.74, nil, 354.11, nil, -254493138}, -- JACKPOT
}

--[[CreateThread(function()

    for _,v in pairs(coordonate) do
      RequestModel(v[7])
      while not HasModelLoaded(v[7]) do
        Wait(1)
      end
  
      RequestAnimDict("mini@strip_club@idles@bouncer@base")
      while not HasAnimDictLoaded("mini@strip_club@idles@bouncer@base") do
        Wait(1)
      end
      ped =  Citizen.InvokeNative(0xD49F9B0955C367DE, 4, v[7],v[1],v[2],v[3]-1, 3374176, false, true)
      SetEntityHeading(ped, v[5])
      FreezeEntityPosition(ped, true)
      SetEntityInvincible(ped, true)
      SetBlockingOfNonTemporaryEvents(ped, true)
      TaskPlayAnim(ped,"mini@strip_club@idles@bouncer@base","base", 8.0, 0.0, -1, 1, 0, 0, 0, 0)
	end

end)]]--

local heading = 148.63
local vehicle = nil

CreateThread(function()
	while true do
		Citizen.Wait(10)
		local sleep = true
		if #(GetEntityCoords(PlayerPedId()) - vec3(935.23, 42.28, 71.57)) < 40 then
			sleep = false
			if DoesEntityExist(vehicle) == false then
				RequestModel(`chall70`)
				while not HasModelLoaded(`chall70`) do
					Wait(1)
				end
				vehicle = Citizen.InvokeNative(0xAF35D0D2583051B0, `chall70`, 935.23, 42.28, 71.57, heading, false, false)
				FreezeEntityPosition(vehicle, true)
				SetEntityInvincible(vehicle, true)
				SetEntityCoords(vehicle, 953.77, 70.03, 75.83, false, false, false, true)
				local props = ESX.Game.GetVehicleProperties(vehicle)
				props['wheelColor'] = 147
				props['plate'] = "C ROYALE"
				ESX.Game.SetVehicleProperties(vehicle, props)
			else
				SetEntityHeading(vehicle, heading)
				heading = heading+0.1
			end
		end
		if sleep then
			Citizen.Wait(500)
		end
	end
end)

CreateThread(function()
	while true do
		Citizen.Wait(10000)
		if vehicle ~= nil and #(GetEntityCoords(PlayerPedId()) - vec3(935.23, 42.28, 71.57)) < 40 then
			SetEntityCoords(vehicle, 935.23, 42.28, 71.57, false, false, false, true)
		end
	end
end)