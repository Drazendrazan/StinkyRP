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

ESX = nil

local PlayerData                = {}
local firstspawn = false
local DeliveryBlip
local blip
local HasAlreadyEnteredMarker   = false
local LastZone                  = nil
local kaska = false

-----alerty
Citizen.CreateThread(function()
	while ESX == nil do
		TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
		Citizen.Wait(250)
	end
	while ESX.GetPlayerData().job == nil do
		Citizen.Wait(250)
	end
	PlayerData = ESX.GetPlayerData()
end)

RegisterNetEvent('esx:playerLoaded')
AddEventHandler('esx:playerLoaded', function(xPlayer)
	ESX.PlayerData = xPlayer
end)

RegisterNetEvent('esx:setJob')
AddEventHandler('esx:setJob', function(job)
	ESX.PlayerData.job = job
end)


--[[Citizen.CreateThread(function()
    local hash = GetHashKey("s_m_m_gaffer_01")
	local playerPed = PlayerPedId()

    if not HasModelLoaded(hash) then
        RequestModel(hash)
        Citizen.Wait(100)
    end

    while not HasModelLoaded(hash) do
        Citizen.Wait(0)
    end
	
    if firstspawn == false then
		local npc = CreatePed(6, hash, 543.4517, -176.9583, 53.5502, 89.79, false, false)
		local npc = CreatePed(6, hash, 1774.24, 3333.12, 40.35, 298.81, false, false)
		local npc = CreatePed(6, hash, 1150.19, -780.01, 56.6, 358.09, false, false)
		local npc = CreatePed(6, hash, -1612.04, -826.36, 9.08, 319.3, false, false)
		local npc = CreatePed(6, hash, 44.37, 6460.99, 30.43, 220.26, false, false)
        SetEntityInvincible(npc, true)
        FreezeEntityPosition(npc, true)
        SetPedDiesWhenInjured(npc, false)
        SetPedCanRagdollFromPlayerImpact(npc, false)
        SetPedCanRagdoll(npc, false)
        SetEntityAsMissionEntity(npc, true, true)
		SetEntityDynamic(npc, true)
	end
end)

function OtworzMenuMechanika()
	local playerPed = PlayerPedId()
	local veh = GetVehiclePedIsUsing(playerPed)
	local veheng = GetVehicleEngineHealth(veh)
	local vehenground = tonumber(string.format("%.0f", veheng))
	local elements = {}	
	table.insert(elements, {label = ('Stan Auta - ' .. vehenground / 10 .. "%"),	value = 'es'})	

		if veheng == 1000 then
			table.insert(elements, {label = ('Twoje auto nie jest uszkodzone'),	value = 'es'})
		elseif veheng >= 900 and veheng < 1000 then
			table.insert(elements, {label = ('Twoje auto ma bardzo małe uszkodzenia, kwota naprawy - ' .. Config.Kasa1 .. '$'),	value = 'szybka'})
		elseif veheng < 900 and veheng >= 800 then
			table.insert(elements, {label = ('Twoje auto ma małe uszkodzenia, kwota naprawy - ' .. Config.Kasa2 .. '$'),	value = 'szybka'})
		elseif veheng < 800 and veheng >= 700 then
			table.insert(elements, {label = ('Twoje auto ma średnie uszkodzenia, kwota naprawy - ' .. Config.Kasa3 .. '$'),	value = 'szybka'})
		elseif veheng < 700 and veheng >= 600 then
			table.insert(elements, {label = ('Twoje auto ma średnie uszkodzenia, kwota naprawy - ' .. Config.Kasa4 .. '$'),	value = 'szybka'})
		elseif veheng < 600 and veheng >= 500 then
			table.insert(elements, {label = ('Twoje auto ma średnie uszkodzenia, kwota naprawy - ' .. Config.Kasa5 .. '$'),	value = 'szybka'})
		elseif veheng < 500 and veheng >= 400 then
			table.insert(elements, {label = ('Twoje auto ma moncne uszkodzenia, kwota naprawy - ' .. Config.Kasa6 .. '$'),	value = 'szybka'})
		elseif veheng < 400 and veheng >= 300 then
			table.insert(elements, {label = ('Twoje auto ma mocne uszkodzenia, kwota naprawy - ' .. Config.Kasa7 .. '$'),	value = 'szybka'})
		elseif veheng < 300 and veheng >= 200 then
			table.insert(elements, {label = ('Twoje auto ma bardzo mocne uszkodzenia, kwota naprawy - ' .. Config.Kasa8 .. '$'),	value = 'szybka'})
		elseif veheng < 200 and veheng >= 100 then
			table.insert(elements, {label = ('Twoje auto nie nadaje się do jazdy, kwota naprawy - ' .. Config.Kasa9 .. '$'),	value = 'szybka'})
		elseif veheng < 100 and veheng >= 0 then
			table.insert(elements, {label = ('Twoje auto potrzebuje naprawy całościowej, kwota naprawy - ' .. Config.Kasa10 .. '$'),	value = 'szybka'})
		end
	ESX.UI.Menu.CloseAll()

	ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'zbys_akcja', {
		title    = ('Mechanik'),
		elements = elements,
		align    = 'center'
	},          
	function(data, menu)

		if data.current.value == 'szybka' then
		ESX.UI.Menu.CloseAll()
			if veheng >= 900 and veheng < 1000 then
				TriggerServerEvent('vice-lokalny-mechanik:1')
			elseif veheng < 900 and veheng >= 800 then
				TriggerServerEvent('vice-lokalny-mechanik:2')
			elseif veheng < 800 and veheng >= 700 then
				TriggerServerEvent('vice-lokalny-mechanik:3')
			elseif veheng < 700 and veheng >= 600 then
				TriggerServerEvent('vice-lokalny-mechanik:4')
			elseif veheng < 600 and veheng >= 500 then
				TriggerServerEvent('vice-lokalny-mechanik:5')
			elseif veheng < 500 and veheng >= 400 then
				TriggerServerEvent('vice-lokalny-mechanik:6')
			elseif veheng < 400 and veheng >= 300 then
				TriggerServerEvent('vice-lokalny-mechanik:7')
			elseif veheng < 300 and veheng >= 200 then
				TriggerServerEvent('vice-lokalny-mechanik:8')
			elseif veheng < 200 and veheng >= 100 then
					TriggerServerEvent('vice-lokalny-mechanik:9')
			elseif veheng < 100 and veheng >= 0 then
				TriggerServerEvent('vice-lokalny-mechanik:10')
			end


		end
		if data.current.value == 'es' then
			ESX.UI.Menu.CloseAll()
		end

	end, function(data, menu)
		menu.close()

		CurrentAction     = 'menuauta'
		CurrentActionData = {}
	end)
end

RegisterNetEvent('sandy_repair:fullrepair')
AddEventHandler('sandy_repair:fullrepair', function()
	local vehicle = GetVehiclePedIsIn(PlayerPedId(), true)
	FreezeEntityPosition(vehicle, true)
	ESX.ShowNotification('Trwa naprawa poczekaj minute!')
	TaskLeaveVehicle(PlayerPedId(), vehicle, 256)
	Citizen.Wait(1000)
	SetVehicleDoorsLocked(vehicle, 2)
	SetVehicleDoorOpen(vehicle, 1, false)
	SetVehicleDoorOpen(vehicle, 2, false)
	SetVehicleDoorOpen(vehicle, 3, false)
	SetVehicleDoorOpen(vehicle, 4, false)
	SetVehicleDoorOpen(vehicle, 5, false)
	SetVehicleDoorOpen(vehicle, 6, false)
	SetVehicleDoorOpen(vehicle, 7, false)
	exports.rprogress:Start("Naprawianie pojazdu", 60000)
	SetVehicleDoorsLocked(vehicle, 1)
	SetVehicleEngineHealth(vehicle, 1000.0)
	SetVehicleDeformationFixed(vehicle)
	SetVehicleBodyHealth(vehicle, 1000.0)
	SetVehicleFixed(vehicle)
	SetVehicleEngineOn( vehicle, true, true )
	SetVehicleUndriveable(vehicle, false)
	SetVehicleDoorShut(vehicle, 4, false)
	FreezeEntityPosition(vehicle, false)
	ESX.ShowNotification('Pojazd naprawiony!')
end)

RegisterNetEvent('vice-lokalny-mechanik:git')
AddEventHandler('vice-lokalny-mechanik:git', function()
	local veh = GetVehiclePedIsUsing(playerPed)

	TaskLeaveVehicle(playerPed, veh, 1)
	SetVehicleDoorsLocked(veh, 4)
	ESX.ShowNotification('Mechanik zajął się twoim autem, potrwa to 30 sekund!')

	exports["stinky_taskbar"]:taskBar(30000, "Mechanik Naprawia Twoje Auto", false, true)	

	ClearPedTasksImmediately(npc)
	SetVehicleFixed(veh)
	SetVehicleEngineOn(veh, true, true)
	SetVehicleDoorsLocked(veh, 0)
	SetVehicleDoorOpen(veh, 0, true)
	ESX.ShowNotification('Mechanik skończył się zajmować autem!')
end)

AddEventHandler('vice-lokalny-mechanik:hasEnteredMarker', function(zone)
	if zone == 'mechanik' then
		ESX.ShowHelpNotification('Kliknij ~INPUT_CONTEXT~ Aby otworzyć menu lokalnego mechanika')
		ESX.ShowFloatingHelpNotification('~b~ MECHANIK', vec3(541.05, -177.12, 54.0+0.50))
		if IsControlJustReleased(0, 38) then
			OtworzMenuMechanika()
		end
	end
	if zone == 'mechanik1' then
		ESX.ShowHelpNotification('Kliknij ~INPUT_CONTEXT~ Aby otworzyć menu lokalnego mechanika')
		ESX.ShowFloatingHelpNotification('~b~ MECHANIK', vec3(1777.02, 3334.57, 40.70+0.50))
		if IsControlJustReleased(0, 38) then
			OtworzMenuMechanika()
		end
	end
	if zone == 'mechanik2' then
		ESX.ShowHelpNotification('Kliknij ~INPUT_CONTEXT~ Aby otworzyć menu lokalnego mechanika')
		ESX.ShowFloatingHelpNotification('~b~ MECHANIK', vec3(1150.4, -777.16, 57.00+0.50))
		if IsControlJustReleased(0, 38) then
			OtworzMenuMechanika()
		end
	end
	if zone == 'mechanik3' then
		ESX.ShowHelpNotification('Kliknij ~INPUT_CONTEXT~ Aby otworzyć menu lokalnego mechanika')
		ESX.ShowFloatingHelpNotification('~b~ MECHANIK', vec3(-1610.26, -824.17, 9.6+0.50))
		if IsControlJustReleased(0, 38) then
			OtworzMenuMechanika()
		end
	end
	if zone == 'mechanik4' then
		ESX.ShowHelpNotification('Kliknij ~INPUT_CONTEXT~ Aby otworzyć menu lokalnego mechanika')
		ESX.ShowFloatingHelpNotification('~b~ MECHANIK', vec3(46.04, 6459.14, 31.0+0.50))
		if IsControlJustReleased(0, 38) then
			OtworzMenuMechanika()
		end
	end
end)




AddEventHandler('vice-lokalny-mechanik:hasExitedMarker', function(zone)

        CurrentAction = nil
        ESX.UI.Menu.CloseAll()
			

end)



CreateThread(function()
	while true do
		Citizen.Wait(5)

		local coords, sleep = GetEntityCoords(PlayerPedId()), true

		for k,v in pairs(Config.Zones) do
			if #(coords - vec3(v.x, v.y, v.z)) < Config.DrawDistance then
				sleep = false
				--ESX.DrawMarker(vec3(v.x, v.y, v.z))
				DrawMarker(27, v.x, v.y, v.z, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 2.5, 2.5, 1.0, 0, 203, 214, 100, false, false, 2, false, nil, nil, false)
			end
		end
		
		if sleep then
			Citizen.Wait(500)
		end
	end
end)

Citizen.CreateThread(function()
    while true do

        Wait(0)

        local coords      = GetEntityCoords(PlayerPedId())
        local isInMarker  = false
        local currentZone = nil

        for k,v in pairs(Config.Zones) do
            if(GetDistanceBetweenCoords(coords, v.x, v.y, v.z, true) < Config.ZoneSize.x / 2) then
                isInMarker  = true
                currentZone = k
				 TriggerEvent('vice-lokalny-mechanik:hasEnteredMarker', lastZone)

            end
        end


        if isInMarker and not hasAlreadyEnteredMarker then
            hasAlreadyEnteredMarker = true
            lastZone                = currentZone
        end

        if not isInMarker and hasAlreadyEnteredMarker then
            hasAlreadyEnteredMarker = false
            TriggerEvent('vice-lokalny-mechanik:hasExitedMarker', lastZone)
        end

    end
end)--]]

Citizen.CreateThread(function(timer)
	while true do
	Citizen.Wait(3)
	local coords, sleep = GetEntityCoords(PlayerPedId()), true
		for k,v in pairs(Config.Zones) do
			if #(coords - vec3(v.x, v.y, v.z)) < 15 then
				sleep = false
				--if(v.Type ~= -1 and GetDistanceBetweenCoords(coords, v.x, v.y, v.z, true) < 15) then
				DrawMarker(27, v.x, v.y, v.z, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 2.5, 2.5, 1.0, 0, 203, 214, 100, false, false, 2, true, nil, nil, false)
				if(v.Type ~= -1 and GetDistanceBetweenCoords(coords, v.x, v.y, v.z, true) < 3) then
					ESX.ShowHelpNotification('Kliknij ~INPUT_CONTEXT~ Aby otworzyć menu lokalnego mechanika')
					if IsControlJustReleased(0, Keys['E']) then
						-- local mechanicy = exports['esx_scoreboard']:counter('mecano')
						local mechanicy = exports['esx_scoreboard']:BierFrakcje('mecano')
						local ped = PlayerPedId()
						if mechanicy > 6 then
							ESX.ShowNotification('Jest za dużo mechaników na służbie. Udaj sie do mechanika!')
						else
							if IsPedInAnyVehicle(ped,  false) then
								kurwamenu()
							end
						end
					end	
				end
				if sleep then
					Citizen.Wait(500)
				end
			end
		end
	end
end)

function kurwamenu()

	local elements = {
		{label = ('Naprawa silnika [3500$]'),     value = '1'},
		{label = ('Pelna naprawa [6500$]'),     value = '2'}
	}

	ESX.UI.Menu.CloseAll()

	ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'sdasz_actions', {
		title    = ('Mechanik'),
		align    = 'center',
		elements = elements
	}, function(data, menu)
	
	    if data.current.value == '1' then
	    	TriggerServerEvent('sandy_repair:naprawa1')
		menu.close()
        elseif data.current.value == '2' then
			TriggerServerEvent('sandy_repair:naprawa2')
		menu.close()
        end	

	end, function(data, menu)
		menu.close()
	end)
end

RegisterNetEvent('sandy_repair:fullrepair')
AddEventHandler('sandy_repair:fullrepair', function()
	local vehicle = GetVehiclePedIsIn(PlayerPedId(), true)
	FreezeEntityPosition(vehicle, true)
	TaskLeaveVehicle(PlayerPedId(), vehicle, 256)
	Citizen.Wait(1250)
	ESX.ShowNotification('Trwa naprawa poczekaj 30 sekund!')
	exports["stinky_taskbar"]:taskBar(30000, "Mechanik Naprawia Twoje Auto", false, true)	
	SetVehicleDoorsLocked(vehicle, 2)
	SetVehicleDoorOpen(vehicle, 1, false)
	SetVehicleDoorOpen(vehicle, 2, false)
	SetVehicleDoorOpen(vehicle, 3, false)
	SetVehicleDoorOpen(vehicle, 4, false)
	SetVehicleDoorOpen(vehicle, 5, false)
	SetVehicleDoorOpen(vehicle, 6, false)
	SetVehicleDoorOpen(vehicle, 7, false)
	SetVehicleDoorsLocked(vehicle, 1)
	SetVehicleEngineHealth(vehicle, 1000.0)
	SetVehicleDeformationFixed(vehicle)
	SetVehicleBodyHealth(vehicle, 1000.0)
	SetVehicleFixed(vehicle)
	SetVehicleEngineOn( vehicle, true, true )
	SetVehicleUndriveable(vehicle, false)
	SetVehicleDoorShut(vehicle, 4, false)
	FreezeEntityPosition(vehicle, false)
	ESX.ShowNotification('Pojazd naprawiony!')
end)

RegisterNetEvent('sandy_repair:enginerepair')
AddEventHandler('sandy_repair:enginerepair', function()
	local vehicle = GetVehiclePedIsIn(PlayerPedId(), true)
	FreezeEntityPosition(vehicle, true)
	SetVehicleDoorOpen(vehicle, 4, true)
	TaskLeaveVehicle(PlayerPedId(), vehicle, 256)
	Citizen.Wait(1250)
	ESX.ShowNotification('Trwa naprawa poczekaj 30 sekund!')
	exports["stinky_taskbar"]:taskBar(30000, "Mechanik Naprawia Twoje Auto", false, true)	
	SetVehicleDoorsLocked(vehicle, 2)
	SetVehicleDoorOpen(vehicle, 4, false)
	SetVehicleDoorsLocked(vehicle, 1)
	SetVehicleEngineHealth(vehicle, 1000.0)
	SetVehicleEngineOn( vehicle, true, true )
	SetVehicleUndriveable(vehicle, false)
	SetVehicleDoorShut(vehicle, 4, false)
	FreezeEntityPosition(vehicle, false)
	ESX.ShowNotification('Pojazd naprawiony!')
end)