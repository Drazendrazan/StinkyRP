Barabasz             = {}
local plyCoords = nil
local onBed = false

Barabasz.Zones = {
	Pos = {
		{
			Coords = vector3(-256.45, 6332.21, 31.43),
			Name = 'Paleto'
		}, 
		
		{
			Coords = vector3(312.5948, -592.3523, 42.29),
			Name = 'Pilbox'
		},

		{
			Coords = vector3(351.0548, -588.5523, 27.82),
			Name = 'Pilbox'
		},
		
		{
			Coords = vector3(-811.5, -1236.13, 6.35),
			Name = 'Viceroy'
		},

		{
			Coords = vector3(1136.02, -1561.53, 34.45),
			Name = 'El Rancho Boulevard'
		},

		{
			Coords = vector3(1836.21, 3680.23, 33.29),
			Name = 'Sandy'
		},
		{
			Coords = vector3(180.49, 2793.34, 44.67), -- 2
			Name = 'Greenzone petshop'
		},
		{
			Coords = vector3(1694.79, 3289.39, 40.16), -- 2
			Name = 'Greenzone lotnia'
		},
		{
			Coords = vector3(2662.15, 3265.2, 54.25), -- 2
			Name = 'Greenzone autostrada'
		},
		{
			Coords = vector3(-463.98, -1703.72, 17.85), -- 2
			Name = 'Greenzone zlomowisko'
		},
	},
}

CreateThread(function()
	while true do
		local playerPed = PlayerPedId()
		plyCoords = GetEntityCoords(playerPed)
		Citizen.Wait(500)
	end
end)

--[[function DrawText3D(x, y, z, text, scale)
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

local timeLeft = nil
CreateThread(function()
	while true do
		Citizen.Wait(0)
		if timeLeft ~= nil then
			local coords = GetEntityCoords(PlayerPedId())
			DrawText3D(coords.x, coords.y, coords.z + 0.1, timeLeft .. '~g~%', 0.4)
		else
			Citizen.Wait(500)
		end
	end
end)

function DrawProcent(time, cb)
	if cb ~= nil then
		CreateThread(function()
			timeLeft = 0
			repeat
				timeLeft = timeLeft + 1
				Citizen.Wait(time)
			until timeLeft == 100
			timeLeft = nil
			cb()
		end)
	else
		timeLeft = 0
		repeat
			timeLeft = timeLeft + 1
			Citizen.Wait(time)
		until timeLeft == 100
		timeLeft = nil
	end
end

RegisterNetEvent('Exile:BarabaszAnim')
AddEventHandler('Exile:BarabaszAnim', function(id, zone, bed)
	local ped = PlayerPedId()
	onBed = true
	
	DoScreenFadeOut(200)
	Citizen.Wait(1000)
	TriggerEvent('hypex_ambulancejob:hypexrevive')
	Citizen.Wait(1000)
	Citizen.InvokeNative(0x239A3351AC1DA385, ped, bed.Position, 0, 0, 0)
	SetEntityHeading(ped, bed.Position.w)
	
	ESX.Streaming.RequestAnimDict("missfbi5ig_0",function()
        Citizen.InvokeNative(0xEA47FE3719165B94, ped, "missfbi5ig_0", "lyinginpain_loop_steve", 8.0, 1.0, -1, 45, 1.0, 0, 0, 0)
	end)

	CreateThread(function() 
        while onBed do
          	Citizen.Wait(0)
          	DisableControlAction(2, 199, true) -- Disable pause screen
			DisableControlAction(2, 200, true) -- Disable pause screen alternate
			DisableControlAction(0, 44, true) -- Cover
			DisableControlAction(0, 37, true) -- Select Weapon
			DisableControlAction(0, 311, true) -- K
			DisableControlAction(0, 59, true) -- Disable steering in vehicle
			DisableControlAction(0, 71, true) -- Disable driving forward in vehicle
			DisableControlAction(0, 72, true) -- Disable reversing in vehicle
			DisableControlAction(0, 69, true) -- INPUT_VEH_ATTACK
			DisableControlAction(0, 92, true) -- INPUT_VEH_PASSENGER_ATTACK
			DisableControlAction(0, 114, true) -- INPUT_VEH_FLY_ATTACK
			DisableControlAction(0, 140, true) -- INPUT_MELEE_ATTACK_LIGHT
			DisableControlAction(0, 141, true) -- INPUT_MELEE_ATTACK_HEAVY
			DisableControlAction(0, 142, true) -- INPUT_MELEE_ATTACK_ALTERNATE
			DisableControlAction(0, 257, true) -- INPUT_ATTACK2
			DisableControlAction(0, 263, true) -- INPUT_MELEE_ATTACK1
			DisableControlAction(0, 264, true) -- INPUT_MELEE_ATTACK2
			DisableControlAction(0, 24, true) -- INPUT_ATTACK
			DisableControlAction(0, 25, true) -- INPUT_AIM
			DisableControlAction(0, 21, true) -- SHIFT
			DisableControlAction(0, 22, true) -- SPACE
			DisableControlAction(0, 288, true) -- F1
			DisableControlAction(0, 289, true) -- F2
			DisableControlAction(0, 170, true) -- F3
			DisableControlAction(0, 73, true) -- X
			DisableControlAction(0, 244, true) -- M
			DisableControlAction(0, 246, true) -- Y
			DisableControlAction(0, 74, true) -- H
			DisableControlAction(0, 29, true) -- B
			DisableControlAction(0, 243, true) -- ~
			DisableControlAction(0, 38, true) -- E
			DisableControlAction(0, 167, true) -- Job
			
			if not IsEntityPlayingAnim(ped, "missfbi5ig_0", "lyinginpain_loop_steve", 3) then
				Citizen.InvokeNative(0xEA47FE3719165B94, ped, "missfbi5ig_0", "lyinginpain_loop_steve", 8.0, 1.0, -1, 45, 1.0, 0, 0, 0)
			end
        end
    end)
	
	DoScreenFadeIn(200)

	DrawProcent(500, function()
		onBed = false	
		
		DoScreenFadeOut(200)
		Citizen.Wait(500)
		Citizen.InvokeNative(0xAAA34F8A7CB32098, ped)
		Citizen.Wait(500)
		SetEntityCoords(ped, bed.GetUp)
		SetEntityHeading(ped, bed.GetUp.w)
		TriggerServerEvent('Exile:BarabaszUnoccupied', id, zone)
		Citizen.Wait(500)
		
		DoScreenFadeIn(200)	
	end)
end)--]]

CreateThread(function()
    while true do
		local ped = PlayerPedId()
		Citizen.Wait(3)
		local found = false
		for k,v in pairs(Barabasz.Zones) do
			for i=1, #v, 1 do
				local distance = #(GetEntityCoords(ped) - v[i].Coords)
				--local count = exports['esx_scoreboard']:BierFrakcje('ambulance')
				local _source = source
				if distance < 20 then
					found = true
					ESX.DrawMarker(v[i].Coords)
					if distance < 1.5 then
						if not IsPedInAnyVehicle(ped, true) then
							ESX.ShowHelpNotification('Naciśnij ~INPUT_CONTEXT~ aby uzyskać ~y~pomoc medyczną~s~')
							if IsControlJustReleased(0, 46) and not onBed then
								if GetEntityHealth(ped) < 200 then
									--if count < 1 then
										ESX.TriggerServerCallback('esx_lokalnydoktor:parakontrol', function(hasEnoughMoney)
											if hasEnoughMoney then
												FreezeEntityPosition(PlayerPedId(), true)
												exports["stinky_taskbar"]:taskBar(10000, "Trwa Leczenie", false, true)
												TriggerEvent('esx_ambulancejob:reviveniggers', target)
												FreezeEntityPosition(PlayerPedId(), false)
												TriggerServerEvent('esx_lokalnydoktor:money')
												--TriggerServerEvent('Exile:Barabasz', MisiaczekPlayers['ambulance'], v[i].Name)
											else
												TriggerEvent('esx:showNotification', 'Nie masz wystarczająco pieniędzy!')
											end
										end)
									--else
									--	ESX.ShowNotification('Nie możesz skorzystać z ~r~pomocy medycznej~w~ ponieważ na służbie jest już ~y~' .. count .. ' medyków')
									--end
								else
									ESX.ShowNotification('~r~Nie potrzebujesz~w~ pomocy medycznej!')
								end
							end
						end
					end
				end
			end
		end
		
		if not found then
			Citizen.Wait(1000)
		end
    end
end)