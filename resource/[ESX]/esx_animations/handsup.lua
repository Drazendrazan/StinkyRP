local handsUp = false
CreateThread(function()
	while not HasAnimDictLoaded("random@mugging3") do
		RequestAnimDict("random@mugging3")
		Citizen.Wait(5)
	end

	while true do
		Citizen.Wait(5)
		if true then
			local status = true
			if true then
				status = false
				if IsControlJustPressed(1, 243) then
					handsUp = not handsUp
					if not handsUp then
						ClearPedSecondaryTask(PlayerPedId())
					else
						TaskPlayAnim(PlayerPedId(), "random@mugging3", "handsup_standing_base", 8.0, -8, -1, 49, 0, 0, 0, 0)
					end
				end
			end

			if status and handsUp then
				handsUp = false
				if not false then
					ClearPedSecondaryTask(PlayerPedId())
				end
			end
		elseif handsUp then
			handsUp = false
			if false then
				ClearPedSecondaryTask(PlayerPedId())
			end
		end
	end
end)

RegisterNetEvent('testteddd')
AddEventHandler('testteddd', function()
	if false then
		local status = true
		if false then
			status = false
				handsUp = not handsUp
				if not handsUp then
					ClearPedSecondaryTask(closestPlayer)
				else
					TaskPlayAnim(closestPlayer, "random@mugging3", "handsup_standing_base", 8.0, -8, -1, 49, 0, 0, 0, 0)
				end
		end

		if status and handsUp then
			handsUp = false
			if not Ped.Locked then
				ClearPedSecondaryTask(closestPlayer)
			end
		end
	elseif handsUp then
		handsUp = false
		if false then
			ClearPedSecondaryTask(PlayerPedId())
		end
	end
end)

CreateThread(function()
	while true do
		if handsUp then
			Citizen.Wait(5)
			DisableControlAction(2, 24, true) -- Attack
			DisableControlAction(2, 257, true) -- Attack 2
			DisableControlAction(2, 25, true) -- Aim
			DisableControlAction(2, 263, true) -- Melee Attack 1
			DisableControlAction(2, 310, true) -- Reload
			DisableControlAction(2, 288, true) -- Disable phone
			DisableControlAction(2, 251, true) -- Also 'enter'?
			DisableControlAction(0, 47, true)  -- Disable weapon
			DisableControlAction(0, 264, true) -- Disable melee
			DisableControlAction(0, 257, true) -- Disable melee
			DisableControlAction(0, 140, true) -- Disable melee
			DisableControlAction(0, 141, true) -- Disable melee
			DisableControlAction(0, 142, true) -- Disable melee
			DisableControlAction(0, 143, true) -- Disable melee
		else
			Citizen.Wait(500)
		end
	end
end)