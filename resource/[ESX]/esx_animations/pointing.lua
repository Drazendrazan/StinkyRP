
CreateThread(function()
    while not HasAnimDictLoaded("anim@mp_point") do
		RequestAnimDict("anim@mp_point")
        Citizen.Wait(5)
    end

	local mp_pointing = false
    while true do
        Citizen.Wait(5)

		local reset = false
		if true then
			if not IsPedInAnyVehicle(PlayerPedId(), false) then
				if IsControlJustPressed(1, 305) or IsControlJustPressed(2, 305) and not GetVehiclePedIsIn(PlayerPedId(), true) then
					if not mp_pointing then
						mp_pointing = true
					else
						mp_pointing = false
						reset = true
					end
				end
			end
		elseif mp_pointing then
            mp_pointing = false
			reset = true
        end

        if reset then
			RequestTaskMoveNetworkStateTransition(PlayerPedId(), "Stop")
			if not IsPedInjured(PlayerPedId()) then
				ClearPedSecondaryTask(PlayerPedId())
			end

			if not IsPedInAnyVehicle(PlayerPedId(), 1) then
				SetPedCurrentWeaponVisible(PlayerPedId(), 1, 1, 1, 1)
			end

			SetPedConfigFlag(PlayerPedId(), 36, 0)
			ClearPedSecondaryTask(PlayerPedId())
		elseif mp_pointing then
			if IsTaskMoveNetworkActive(PlayerPedId()) then
				SetTaskMoveNetworkSignalFloat(PlayerPedId(), "Pitch", (math.min(42.0, math.max(-70.0, GetGameplayCamRelativePitch())) + 70.0) / 112.0)
				SetTaskMoveNetworkSignalFloat(PlayerPedId(), "Heading", ((math.min(180.0, math.max(-180.0, GetGameplayCamRelativeHeading())) + 180.0) / 360.0) * -1.0 + 1.0)
				SetTaskMoveNetworkSignalFloat(PlayerPedId(), "isBlocked", false)
				SetTaskMoveNetworkSignalFloat(PlayerPedId(), "isFirstPerson", N_0xee778f8c7e1142e2(N_0x19cafa3c87f7c2ff()) == 4)
			else
				SetPedCurrentWeaponVisible(PlayerPedId(), 0, 1, 1, 1)
				SetPedConfigFlag(PlayerPedId(), 36, 1)
				TaskMoveNetworkByName(PlayerPedId(), "task_mp_pointing", 0.5, 0, "anim@mp_point", 24)
			end
        end
    end
end)