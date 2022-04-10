ESX = nil
CreateThread(function()
	while ESX == nil do
		TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
		Citizen.Wait(0)
	end
	
	Citizen.Wait(5000)
	PlayerData = ESX.GetPlayerData()
end)

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
local WorldName = 'alpha' -- //global/config
local StinkyGlobal = GetCurrentResourceName()

local noClipSpeeds =  "noclip speeds"
local noClip = false
local noClipSpeed = 1
local noClipLabel = nil
local StinkyLoaded = false
local LoadGtaOutils = false
--local getcall = exports['pma-voice']:GetPlayerCallChannel()
local gettingdebug = false
local removedConnect = false
local GlobalExports = false
local allowed = true

RegisterNetEvent('esx:playerLoaded')
AddEventHandler('esx:playerLoaded', function(xPlayer)
    PlayerData = xPlayer
end)

RegisterNetEvent('esx:setJob')
AddEventHandler('esx:setJob', function(job)
    PlayerData.job = job
end)

AddEventHandler('esx:playerLoaded', function()
	StinkyLoaded = true
	LoadGtaOutils = true
	noClip = false
	TriggerServerEvent("Stinky:SendJoin")
	Citizen.Wait(1000)
	if allowed == true and PlayerData.job.name == 'police' then
		TriggerServerEvent('Stinky:GetJobsLicense')
	elseif allowed == true and PlayerData.job.name == 'police' or PlayerData.job.name == 'ambulance' or PlayerData.job.name == 'mecano' then
		TriggerServerEvent('Stinky:GetJobsDuty')
	elseif allowed == true and PlayerData.job.name == 'police' or PlayerData.job.name == 'ambulance' or PlayerData.job.name == 'mecano' then
		TriggerServerEvent('StinkyGetJobsInsuraceEMS')
		TriggerServerEvent('StinkyGetJobsInsuraceLSC')
	end
end)


CreateThread(function()
	--[[while true do 
		Citizen.Wait(5000)
		exports['esx_tattoos']:refresh()
	end
	while true do
		Citizen.Wait(5000)
		exports['esx_weaponsync']:RebuildLoadout()
	end]]
	while true do 
		Citizen.Wait(40000)
		TriggerServerEvent('Stinky:weaponchecking')
		TriggerServerEvent("Stinky:CheckPing")
	end
	NetworkSetVoiceChannel(99999)
	MumbleClearVoiceTarget()
	--[[exports['pma-voice']:removePlayerFromRadio()
	exports['pma-voice']:removePlayerFromCall()--]]
	while not StinkyLoaded do
		if WorldName == 'default' or 'lspd' or 'alpha' or 'testowy' and "StinkyRP" ~= StinkyGlobal then
			Citizen.Wait(200)
			NetworkSetVoiceChannel(99999)
			Citizen.Wait(10)
			NetworkSetTalkerProximity(3.5 + 0.0)
			if --[[getcall and--]] "StinkyRP" ~= StinkyGlobal and WorldName == 'default' or 'lspd' or 'alpha' or 'testowy' then
				if gettingdebug == true then --[[print(getcall) else--]] print(WorldName,'; end') end
			else
				print(Worldname, ' Not in call')
			end
		end
	end
	
	if GlobalExports == true then
		function FreezeVehicle()
			FreezeEntityPosition(GetVehiclePedIsIn(PlayerPedId(), true), true)
		end
		function FreezePed()
			FreezeEntityPosition(PlayerPedId(), true)
		end
		function ClearTask()
			ClearPedTasksImmediately(PlayerPedId())
		end
		function UnFreezeVehicle()
			FreezeEntityPosition(GetVehiclePedIsIn(PlayerPedId(), false), false)
		end
		function UnFreezePed()
			FreezeEntityPosition(PlayerPedId(), false)
		end
	end

	while LoadGtaOutils do
		Citizen.Wait(1)
		if not pausing and IsPauseMenuActive() then
			local PlayerData = ESX.GetPlayerData()
			for _, account in ipairs(PlayerData.accounts) do
				if account.name == 'bank' then
					StatSetInt("BANK_BALANCE", account.money, true)
					break
				end
			end

			StatSetInt("MP0_WALLET_BALANCE", PlayerData.money, true)
			pausing = true
		elseif pausing and not IsPauseMenuActive() then
			pausing = false
		end
	end
	StinkyLoaded = nil
	NetworkClearVoiceChannel()
	MumbleIsConnected()
	NetworkSetTalkerProximity(3.5 + 0.0)
	print("Voice: Loaded")		
end)

CreateThread(function()
	while true do 
		Citizen.Wait(1)
		local inVehicle = IsPedInAnyVehicle(ped, false)
        local cc, cv = Config.Density.CitizenDefault, Config.Density.VehicleDefault
        if inVehicle then
            local vehicle = GetVehiclePedIsIn(ped, false)
            
            if GetPedInVehicleSeat(vehicle, -1) ~= ped then
                cc, cv = Config.Density.CitizenPassengers, Config.Density.VehiclePassengers
                if DisableShuffle and GetPedInVehicleSeat(vehicle, 0) == ped and GetIsTaskActive(ped, 165) then
                    SetPedIntoVehicle(ped, vehicle, 0)
                end
            else
                cc, cv = Config.Density.CitizenDriver, Config.Density.VehicleDriver
            end
        end
        

        if Config.AdjustDensity then
            SetPedDensityMultiplierThisFrame(cc)
            SetScenarioPedDensityMultiplierThisFrame(cc, cc)

            SetVehicleDensityMultiplierThisFrame(cv)
            SetRandomVehicleDensityMultiplierThisFrame(cv)
            SetParkedVehicleDensityMultiplierThisFrame(cv)
        end
	end
end)

--[[RegisterKeyMapping('+open_betamenu', 'Menu Beta Testow', 'keyboard', ',')

RegisterCommand('+open_betamenu', function()
	OpenBetaMenu()
end)--]]

CreateThread(function()
	while true do
		Citizen.Wait(1)
		if Citizen.InvokeNative(0x997ABD671D25CA0B, (PlayerPedId())) then
			if Citizen.InvokeNative(0xBB40DD2270B65366, car, -1) == PlayerPedId() then
				Citizen.InvokeNative(0x6E8834B52EC20C77, PlayerId(), false)
			else
				Citizen.InvokeNative(0x6E8834B52EC20C77, PlayerId(), false)
			end
		end
		if WorldName == 'default' or 'lspd' and "StinkyRP" ~= StinkyGlobal then
			CreateThread(function()
				local LastAim
				while true do
					Citizen.Wait(1)
					local sleep = true
					local playerPed = PlayerPedId()
					if DoesEntityExist(playerPed) then
						if IsPedArmed(playerPed, 4) then
							sleep = false
							local isAiming, targetPed = GetEntityPlayerIsFreeAimingAt(PlayerId(-1))
							if isAiming and targetPed ~= LastAim then
								LastAim = targetPed
								if DoesEntityExist(targetPed) and IsEntityAPed(targetPed) then
									if IsPedAPlayer(targetPed) then
										local targetId = NetworkGetPlayerIndexFromPed(targetPed)
										if targetId then											
											if pedId and (pedId > 0) then
												TriggerServerEvent('Fuckmedaddy:log', GetPlayerServerId(targetId))
											end
										end
									end
								end
							end
						end
					end
					if sleep then
						Wait(1000)
					end
				end 
			end)
		end
	end
end)

local blackout = false

local displayStreet = false
local isHandcuffed  = false

local streetLabel = {}

function DisplayingReboot()
	return displayReboot
end

function DisplayingStreet()
	return displayStreet
end

AddEventHandler('StinkySync:setDisplayStreet', function(val)
	displayStreet = val
end)

-- VISUALS 
CreateThread(function()
    StatSetProfileSetting(226, 0)
    for key, value in pairs(Config.Visuals) do
        SetVisualSettingFloat(key, value)
    end
end)

-- STREET LABEL

--[[function _DrawText(x, y, width, height, scale, text, r, g, b, a)
	SetTextFont(4)
	SetTextScale(scale, scale)
	SetTextColour(r, g, b, a)
	SetTextDropShadow(0, 0, 0, 0, 255)
	SetTextDropShadow()
	SetTextOutline()

	SetTextEntry("STRING")
	AddTextComponentString(text)
	DrawText(x - width / 2, y - height / 2 + 0.005)
    AddTextComponentString(content)
    DrawText(x, y)
end



function _DrawRect(x, y, width, height, r, g, b, a)
	DrawRect(x + width / 2, y + height / 2, width, height, r, g, b, a)
end

function GetStreetsCustom(coords)
	for _, street in ipairs(Config.CustomStreets) do
		if coords.x >= street.start_x and coords.x <= street.end_x and coords.y >= street.start_y and coords.y <= street.end_y then
			return "~b~" .. street.name
		end
	end

	local s1, s2 = Citizen.InvokeNative(0x2EB41072B4C1E4C0, coords.x, coords.y, coords.z, Citizen.PointerValueInt(), Citizen.PointerValueInt())
	local street1, street2 = GetStreetNameFromHashKey(s1), GetStreetNameFromHashKey(s2)
	return "~b~" .. street1 .. (street2 ~= "" and "~b~ / " .. street2 or "")
end--]]


--[[CreateThread(function()
	while true do
		local ped, direction = PlayerPedId(), nil
		for k, v in pairs(Config.Directions) do
			direction = GetEntityHeading(ped)
			if math.abs(direction - k) < 22.5 then
				direction = v
				break
			end
		end

		local coords = GetEntityCoords(ped, true)
		local zone = GetNameOfZone(coords.x, coords.y, coords.z)

		streetLabel.zone = (Config.Zones[zone:upper()] or zone:upper())
		streetLabel.street = GetStreetsCustom(coords)
		streetLabel.direction = (direction or 'N')
		Citizen.Wait(300)
	end
end)--]]
-- OGOLNY HUD 
--[[CreateThread(function()
	local hour, minute = 0, 0
	while true do 
		Citizen.Wait(0)
		AllowPauseMenuWhenDeadThisFrame()

		N_0x7669f9e39dc17063()
		for _, iter in ipairs({1, 2, 3, 4, 6, 7, 8, 9, 13, 17, 18}) do -- 6
			HideHudComponentThisFrame(iter)
		end

		local pid = PlayerId()

		SetPlayerHealthRechargeMultiplier(pid, 0.0)
		if displayStreet and not displayReboot and streetLabel.direction and not isHandcuffed then
			_DrawText(0.515, 1.26, 1.0, 1.0, 0.4, streetLabel.zone, 66, 165, 245, 200)
			_DrawText(0.515, 1.28, 1.0, 1.0, 0.33, streetLabel.street, 165, 165, 165, 200)
			_DrawText((tostring(streetLabel.direction):len() > 1 and 0.644 or 0.648), 1.28, 1.0, 1.0, 0.33, streetLabel.direction, 255, 255, 255, 200)
		end
	end
end)--]]

--[[CreateThread(function()
	while true do
		if noClip then
			local noclipEntity = PlayerPedId()
			if IsPedInAnyVehicle(noclipEntity, false) then
				local vehicle = GetVehiclePedIsIn(noclipEntity, false)
				if GetPedInVehicleSeat(vehicle, -1) == noclipEntity then
					noclipEntity = vehicle
				else
					noclipEntity = nil
				end
			end

			FreezeEntityPosition(noclipEntity, true)
			SetEntityInvincible(noclipEntity, true)

			DisableControlAction(0, 31, true)
			DisableControlAction(0, 30, true)
			DisableControlAction(0, 44, true)
			DisableControlAction(0, 20, true)
			DisableControlAction(0, 32, true)
			DisableControlAction(0, 33, true)
			DisableControlAction(0, 34, true)
			DisableControlAction(0, 35, true)

			local yoff = 0.0
			local zoff = 0.0
			if IsControlJustPressed(0, 21) then
				noClipSpeed = noClipSpeed + 1
				if noClipSpeed > #noClipSpeeds then
					noClipSpeed = 1
				end

			end

			if IsDisabledControlPressed(0, 32) then
				yoff = 0.25;
			end

			if IsDisabledControlPressed(0, 33) then
				yoff = -0.25;
			end

			if IsDisabledControlPressed(0, 34) then
				SetEntityHeading(PlayerPedId(), GetEntityHeading(PlayerPedId()) + 2.0)
			end

			if IsDisabledControlPressed(0, 35) then
				SetEntityHeading(PlayerPedId(), GetEntityHeading(PlayerPedId()) - 2.0)
			end

			if IsDisabledControlPressed(0, 44) then
				zoff = 0.1;
			end

			if IsDisabledControlPressed(0, 20) then
				zoff = -0.1;
			end

			local newPos = GetOffsetFromEntityInWorldCoords(noclipEntity, 0.0, yoff * (noClipSpeed + 0.3), zoff * (noClipSpeed + 0.3))

			local heading = GetEntityHeading(noclipEntity)
			SetEntityVelocity(noclipEntity, 0.0, 0.0, 0.0)
			SetEntityRotation(noclipEntity, 0.0, 0.0, 0.0, 0, false)
			SetEntityHeading(noclipEntity, heading)

			SetEntityCollision(noclipEntity, false, false)
			SetEntityCoordsNoOffset(noclipEntity, newPos.x, newPos.y, newPos.z, true, true, true)
			Citizen.Wait(0)

			FreezeEntityPosition(noclipEntity, false)
			SetEntityInvincible(noclipEntity, false)
			SetEntityCollision(noclipEntity, true, true)
		else
			Citizen.Wait(200)
		end
	end
end)--]]

--[[function OpenBetaMenu()
    ESX.UI.Menu.CloseAll()
    ESX.UI.Menu.Open(
        'default', GetCurrentResourceName(), 'Beta',
        {
			align    = 'center',
            title    = 'BETA TESTY - STINKYRP',
            elements = {
			    {label = 'Teleportuj do znacznika', value = '1'},
                --{label = 'Noclip', value = '2'},
                {label = 'Revive', value = '3'},
                {label = 'Heal', value = '4'},
                {label = 'Zabij się', value = '5'},
                {label = 'Dodaj armor', value = '6'},
                {label = 'Dodaj auto do garażu', value = '7'},
                {label = 'Usuń pojazd', value = '8'},
                {label = 'Napraw pojazd', value = '12'},
                {label = 'Obróć pojazd', value = '9'},
                {label = 'Dodaj Skrzynke Crime', value = 'crimowa'},
                {label = 'Dodaj Skrzynke Legalna', value = 'legalna'},
				{label = 'Dodaj Skrzynke Aut', value = 'carchest'},
				{label = 'Dodaj Skrzynke Lokalna', value = 'localchest'},
				{label = 'Dodaj Skrzynke Broni', value = 'weaponchest'},
				{label = 'Dodaj Broń', value = 'vintagepistol'},
				{label = 'Dodaj Ammo', value = 'pistol_ammo'},
				{label = 'Dodaj Radio', value = 'radio'},
				{label = 'Dodaj Kajdanki', value = 'handcuffs'},
				{label = 'Dodaj pieniądze sobie 5MLN', value = 'kaska'},
            },
        },
        function(data, menu)
			if data.current.value == '1' then
                local WaypointHandle = GetFirstBlipInfoId(8)
                if DoesBlipExist(WaypointHandle) then
                    local waypointCoords = GetBlipInfoIdCoord(WaypointHandle)

                    for height = 1, 1000 do
                        SetPedCoordsKeepVehicle(PlayerPedId(), waypointCoords["x"], waypointCoords["y"], height + 0.0)

                        local foundGround, zPos = GetGroundZFor_3dCoord(waypointCoords["x"], waypointCoords["y"], height + 0.0)

                        if foundGround then
                            SetPedCoordsKeepVehicle(PlayerPedId(), waypointCoords["x"], waypointCoords["y"], height + 0.0)

                            break
                        end

                        Citizen.Wait(5)
                    end

                    TriggerEvent("esx:showNotification","Przeteleportowano.")
                else
                    TriggerEvent("esx:showNotification","Zaznacz na mapie teleport.")
                end
            elseif data.current.value == '2' then
                if item == thisItem then
                    noClip = not noClip
                    if not noClip then
                        noClipSpeed = 1
                    end
                end
            elseif data.current.value == '3' then
                TriggerEvent('esx_ambulancejob:reviveniggers', source)
            elseif data.current.value == '4' then
                TriggerEvent('esx_basicneeds:healPlayer', source)
            elseif data.current.value == '5' then
                SetEntityHealth(PlayerPedId(), 0)
            elseif data.current.value == '6' then
                SetPedArmour(PlayerPedId(), 200)
            elseif data.current.value == '7' then
                local vehicle = GetVehiclePedIsUsing(PlayerPedId())
                local vehicleProps = ESX.Game.GetVehicleProperties(vehicle)
                TriggerServerEvent("esx_vehicleshop:setVehicleOwned", vehicleProps)
            elseif data.current.value == '8' then
                TriggerEvent('esx:deleteVehicle')
            elseif data.current.value == '9' then
                local ax = PlayerPedId()
                local ay = GetVehiclePedIsIn(ax, true)
                if
                    IsPedInAnyVehicle(PlayerPedId(), 0) and
                        GetPedInVehicleSeat(GetVehiclePedIsIn(PlayerPedId(), 0), -1) == PlayerPedId()
                then
                    SetVehicleOnGroundProperly(ay)
                    TriggerEvent('esx:showNotification', '~g~Pojazd obrócony')
                else
                    TriggerEvent('esx:showNotification', '~b~Nie jesteś w pojeździe')
                end
            elseif data.current.value == 'crimowa' then
				TriggerServerEvent('Stinky:giveItem', data.current.value, 1)
            elseif data.current.value == 'legalna' then
				TriggerServerEvent('Stinky:giveItem', data.current.value, 1)
            elseif data.current.value == 'carchest' then
				TriggerServerEvent('Stinky:giveItem', data.current.value, 1)
			elseif data.current.value == 'localchest' then
				TriggerServerEvent('Stinky:giveItem', data.current.value, 1)
			elseif data.current.value == 'weaponchest' then
				TriggerServerEvent('Stinky:giveItem', data.current.value, 1)
			elseif data.current.value == 'handcuffs' then
				TriggerServerEvent('Stinky:giveItem', data.current.value, 1)
			elseif data.current.value == 'vintagepistol' then
				TriggerServerEvent('Stinky:giveItem', data.current.value, 1)
			elseif data.current.value == 'pistol_ammo' then
				TriggerServerEvent('Stinky:giveItem', data.current.value, 100)
			elseif data.current.value == 'kaska' then
				TriggerServerEvent('Stinky:givemoney')
			elseif data.current.value == 'radio' then
				TriggerServerEvent('Stinky:giveItem', data.current.value, 1)
            end
        end,
        function(data, menu)
			menu.close()
        end
	)
end--]]

CreateThread(function()
	while true do
		SetDiscordAppId(Config.App)
		SetDiscordRichPresenceAsset(Config.Asset)
		name = GetPlayerName(PlayerId())
		id = GetPlayerServerId(PlayerId())
		SetDiscordRichPresenceAssetText("ID: "..id.." | "..name.." ")
        SetRichPresence('ID: ' .. id .. ' | '.. name .. ' | ' .. tostring(exports['esx_scoreboard']:BierFrakcje('players')) .. '/' .. Config.maxPlayers)
		AddTextEntryByHash('FE_THDR_GTAO', 'StinkyRP ~s~| ~y~ID: ' .. GetPlayerServerId(PlayerId()))
		SetDiscordRichPresenceAction(1, "DOŁĄCZ DO NAS!", "https://discord.gg/h6ZVRTSfva")
		Citizen.Wait(60000)
	end
end)

CreateThread(function()
	SetMapZoomDataLevel(0, 0.96, 0.9, 0.08, 0.0, 0.0) -- Level 0
    SetMapZoomDataLevel(1, 1.6, 0.9, 0.08, 0.0, 0.0) -- Level 1
    SetMapZoomDataLevel(2, 8.6, 0.9, 0.08, 0.0, 0.0) -- Level 2
    SetMapZoomDataLevel(3, 12.3, 0.9, 0.08, 0.0, 0.0) -- Level 3
	SetMapZoomDataLevel(4, 22.3, 0.9, 0.08, 0.0, 0.0) -- Level 4
    while true do
		Citizen.Wait(1)
		if IsPedOnFoot(PlayerPedId()) then 
			SetRadarZoom(1100)
		elseif IsPedInAnyVehicle(PlayerPedId(), true) then
			SetRadarZoom(1100)
		end
    end
end)
--[[

        CarHud
]]


local RPM = 0
local RPMTime = GetGameTimer()
local Status = true
local GET_VEHICLE_CURRENT_RPM = {}

AddEventHandler('carhud:display', function(status)
	Status = status
end)

local Ped = {
	Vehicle = nil,
	VehicleClass = nil,
	VehicleStopped = true,
	VehicleEngine = false,
	VehicleGear = nil,
	Exists = false,
	Id = nil,
	InVehicle = false,
	VehicleInFront = nil,
	VehicleInFrontLock = nil
}

local doors = {
	["seat_dside_f"] = -1,
	["seat_pside_f"] = 0,
	["seat_dside_r"] = 1,
	["seat_pside_r"] = 2
}

function CarDoorsMenu(parent)
	ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'car_doors_menu', {
		title	= 'Pojazd - drzwi',
		align	= 'bottom-right',
		elements = {
			{label = 'Zamknij wszystkie drzwi', value = 'close'},
			{label = 'Lewy przód', value = 0},
			{label = 'Prawy przód', value = 1},
			{label = 'Lewy tył', value = 2},
			{label = 'Prawy tył', value = 3},
		}
	}, function(data, menu)
		local action = data.current.value
		if data.current.value == 'close' then
			CloseDoors()
		elseif data.current.value > -1 and data.current.value < 4 then
			OpenDoor(data.current.value)
		end
	end, function(data, menu)
		menu.close()
		parent.open()
	end)
end


--[[

		SILNIK

]]--


RegisterNetEvent('EngineToggle:Engine')
RegisterNetEvent('EngineToggle:RPDamage')

local vehicles = {}; RPWorking = true

local engine = {
	OnAtEnter = true,
	UseKey = true,
	ToggleKey = 246,
}

CreateThread(function()
	while true do
		Citizen.Wait(0)
		if engine.UseKey and engine.ToggleKey then
			if IsControlJustReleased(1, engine.ToggleKey) then
				Citizen.Wait(1000)
				TriggerEvent('EngineToggle:Engine')
			end
		end
		if GetSeatPedIsTryingToEnter(PlayerPedId()) == -1 and not table.contains(vehicles, GetVehiclePedIsTryingToEnter(PlayerPedId())) then
			table.insert(vehicles, {GetVehiclePedIsTryingToEnter(PlayerPedId()), IsVehicleEngineOn(GetVehiclePedIsTryingToEnter(PlayerPedId()))})
		elseif IsPedInAnyVehicle(PlayerPedId(), false) and not table.contains(vehicles, GetVehiclePedIsIn(PlayerPedId(), false)) then
			table.insert(vehicles, {GetVehiclePedIsIn(PlayerPedId(), false), IsVehicleEngineOn(GetVehiclePedIsIn(PlayerPedId(), false))})
		end
		for i, vehicle in ipairs(vehicles) do
			if DoesEntityExist(vehicle[1]) then
				if (GetPedInVehicleSeat(vehicle[1], -1) == PlayerPedId()) or IsVehicleSeatFree(vehicle[1], -1) then
					if RPWorking then
						SetVehicleEngineOn(vehicle[1], vehicle[2], true, false)
						SetVehicleJetEngineOn(vehicle[1], vehicle[2])
						if not IsPedInAnyVehicle(PlayerPedId(), false) or (IsPedInAnyVehicle(PlayerPedId(), false) and vehicle[1]~= GetVehiclePedIsIn(PlayerPedId(), false)) then
							if IsThisModelAHeli(GetEntityModel(vehicle[1])) or IsThisModelAPlane(GetEntityModel(vehicle[1])) then
								if vehicle[2] then
									SetHeliBladesFullSpeed(vehicle[1])
								end
							end
						end
					end
				end
			else
				table.remove(vehicles, i)
			end
		end
	end
end)

AddEventHandler('EngineToggle:Engine', function()
	local veh
	local StateIndex
	for i, vehicle in ipairs(vehicles) do
		if vehicle[1] == GetVehiclePedIsIn(PlayerPedId(), false) then
			veh = vehicle[1]
			StateIndex = i
		end
	end
	Citizen.Wait(0)
	if IsPedInAnyVehicle(PlayerPedId(), false) then 
		if (GetPedInVehicleSeat(veh, -1) == PlayerPedId()) then
			vehicles[StateIndex][2] = not GetIsVehicleEngineRunning(veh)
			if vehicles[StateIndex][2] then
				local plate = GetVehicleNumberPlateText(GetVehiclePedIsIn(PlayerPedId()), true)
				if plate == nil then
					plate = "XXXXXXXX"
				else
					plate = GetVehicleNumberPlateText(GetVehiclePedIsIn(PlayerPedId()), true)
				end
				TriggerEvent('esx:showAdvancedNotification', 'Włączono Silnik', 'Numer Rej. ~y~' ..plate)
			else
				local plate = GetVehicleNumberPlateText(GetVehiclePedIsIn(PlayerPedId()), true)
				if plate == nil then
					plate = "XXXXXXXX"
				else
					plate = GetVehicleNumberPlateText(GetVehiclePedIsIn(PlayerPedId()), true)
				end
				TriggerEvent('esx:showAdvancedNotification', 'Wyłączono Silnik', 'Numer Rej. ~y~' ..plate)
			end
		end 
    end 
end)

AddEventHandler('EngineToggle:RPDamage', function(State)
	RPWorking = State
end)

if engine.OnAtEnter then
	CreateThread(function()
		while true do
			Citizen.Wait(0)
			if GetSeatPedIsTryingToEnter(PlayerPedId()) == -1 then
				for i, vehicle in ipairs(vehicles) do
					if vehicle[1] == GetVehiclePedIsTryingToEnter(PlayerPedId()) and not vehicle[2] then
						Citizen.Wait(0)
						vehicle[2] = true
						local plate1 = GetVehicleNumberPlateText(GetVehiclePedIsIn(PlayerPedId()), true)
						if plate1 == nil then
							plate1 = "XXXXXXXX"
						else
							plate1 = GetVehicleNumberPlateText(GetVehiclePedIsIn(PlayerPedId()), true)
						end
						--print(plate1)
					end
				end
			end
		end
	end)
end

function table.contains(table, element)
  for _, value in pairs(table) do
    if value[1] == element then
      return true
    end
  end
  return false
end

--[[

		CROUCH & PRONE

]]--

--[[local crouched = false

local proned = false


CreateThread( function()
	while true do 
		Citizen.Wait( 1 )
		local ped = GetPlayerPed( -1 )
		if ( DoesEntityExist( ped ) and not IsEntityDead( ped ) ) then 
			ProneMovement()
			DisableControlAction( 0, Config.proneKey, true ) 
			DisableControlAction( 0, Config.crouchKey, true ) 
			if ( not IsPauseMenuActive() ) then 
				if ( IsDisabledControlJustPressed( 0, Config.crouchKey ) and not proned ) then 
					RequestAnimSet( "move_ped_crouched" )
					RequestAnimSet("MOVE_M@TOUGH_GUY@")
					while ( not HasAnimSetLoaded( "move_ped_crouched" ) ) do 
						Citizen.Wait( 100 )
					end 
					while ( not HasAnimSetLoaded( "MOVE_M@TOUGH_GUY@" ) ) do 
						Citizen.Wait( 100 )
					end 		
					if ( crouched and not proned ) then 
						ResetPedMovementClipset( ped )
						ResetPedStrafeClipset(ped)
						crouched = false 
					elseif ( not crouched and not proned ) then
						SetPedMovementClipset( ped, "move_ped_crouched", 0.55 )
						SetPedStrafeClipset(ped, "move_ped_crouched_strafing")
						crouched = true 
					end 
				elseif ( IsDisabledControlJustPressed(0, Config.proneKey) and not crouched and not IsPedInAnyVehicle(ped, true) and not IsPedFalling(ped) and not IsPedDiving(ped) and not IsPedInCover(ped, false) and not IsPedInParachuteFreeFall(ped) and (GetPedParachuteState(ped) == 0 or GetPedParachuteState(ped) == -1) ) then
					if proned then
						ClearPedTasksImmediately(ped)
						proned = false
					elseif not proned then
						RequestAnimSet( "move_crawl" )
						while ( not HasAnimSetLoaded( "move_crawl" ) ) do 
							Citizen.Wait( 100 )
						end 
						ClearPedTasksImmediately(ped)
						proned = true
						if IsPedSprinting(ped) or IsPedRunning(ped) or GetEntitySpeed(ped) > 5 then
							TaskPlayAnim(ped, "move_jump", "dive_start_run", 8.0, 1.0, -1, 0, 0.0, 0, 0, 0)
							Citizen.Wait(1000)
						end
						SetProned()
					end
				end
			end
		else
			proned = false
			crouched = false
		end
	end
end)

function SetProned()
	ped = PlayerPedId()
	ClearPedTasksImmediately(ped)
	TaskPlayAnimAdvanced(ped, "move_crawl", "onfront_fwd", GetEntityCoords(ped), 0.0, 0.0, GetEntityHeading(ped), 1.0, 1.0, 1.0, 46, 1.0, 0, 0)
end

function ProneMovement()
	if proned then
		ped = PlayerPedId()
		if IsControlPressed(0, 32) or IsControlPressed(0, 33) then
			DisablePlayerFiring(ped, true)
		 elseif IsControlJustReleased(0, 32) or IsControlJustReleased(0, 33) then
		 	DisablePlayerFiring(ped, false)
		 end
		if IsControlJustPressed(0, 32) and not movefwd then
			movefwd = true
		    TaskPlayAnimAdvanced(ped, "move_crawl", "onfront_fwd", GetEntityCoords(ped), 1.0, 0.0, GetEntityHeading(ped), 1.0, 1.0, 1.0, 47, 1.0, 0, 0)
		elseif IsControlJustReleased(0, 32) and movefwd then
		    TaskPlayAnimAdvanced(ped, "move_crawl", "onfront_fwd", GetEntityCoords(ped), 1.0, 0.0, GetEntityHeading(ped), 1.0, 1.0, 1.0, 46, 1.0, 0, 0)
			movefwd = false
		end		
		if IsControlJustPressed(0, 33) and not movebwd then
			movebwd = true
		    TaskPlayAnimAdvanced(ped, "move_crawl", "onfront_bwd", GetEntityCoords(ped), 1.0, 0.0, GetEntityHeading(ped), 1.0, 1.0, 1.0, 47, 1.0, 0, 0)
		elseif IsControlJustReleased(0, 33) and movebwd then 
		    TaskPlayAnimAdvanced(ped, "move_crawl", "onfront_bwd", GetEntityCoords(ped), 1.0, 0.0, GetEntityHeading(ped), 1.0, 1.0, 1.0, 46, 1.0, 0, 0)
		    movebwd = false
		end
		if IsControlPressed(0, 34) then
			SetEntityHeading(ped, GetEntityHeading(ped)+2.0 )
		elseif IsControlPressed(0, 35) then
			SetEntityHeading(ped, GetEntityHeading(ped)-2.0 )
		end
	end
end--]]

--[[

		NO NPC DROP

]]--

CreateThread(function()     
    for a = 1, #Config.BlackListVehicle do
		N_0x616093ec6b139dd9(PlayerId(), GetHashKey(Config.BlackListVehicle[a]), false)
    end
end)

--[[

		Remove Cops

]]--


CreateThread(function()
	while true do
		local playerLoc = GetEntityCoords(PlayerPedId())

		ClearAreaOfCops(playerLoc.x, playerLoc.y, playerLoc.z, 200.0)
		
		Citizen.Wait(800)
	end
end)

--[[

		Brak broni w samochodzie

]]--

CreateThread(function()
	while true do
		Citizen.Wait(200)
		id = PlayerId()
		DisablePlayerVehicleRewards(id)	
	end
end)

--[[

		Shuff

]]--

local disableShuffle = true
function disableSeatShuffle(flag)
	disableShuffle = flag
end

CreateThread(function()
	while true do
		Citizen.Wait(100)
		if IsPedInAnyVehicle(PlayerPedId(), false) and disableShuffle then
			if GetPedInVehicleSeat(GetVehiclePedIsIn(PlayerPedId(), false), 0) == PlayerPedId() then
				if GetIsTaskActive(PlayerPedId(), 165) then
					SetPedIntoVehicle(PlayerPedId(), GetVehiclePedIsIn(PlayerPedId(), false), 0)
				end
			end
		end
	end
end)

RegisterCommand("miejsce", function(source, args, raw) --change command here
	if IsPedInAnyVehicle(PlayerPedId(), false) then
		disableSeatShuffle(false)
		Citizen.Wait(5200)
		disableSeatShuffle(true)
	else
		CancelEvent()
	end
end, false) --False, allow everyone to run it

RegisterCommand("shuff", function(source, args, raw) 
	if IsPedInAnyVehicle(PlayerPedId(), false) then
		disableSeatShuffle(false)
		Citizen.Wait(5200)
		disableSeatShuffle(true)
	else
		CancelEvent()
	end
end, false)

-- PROPFIX

local wait = false


RegisterCommand("propfix", function()
    if GetEntityHealth(PlayerPedId()) > 0 then
        if not wait then
            TriggerEvent('skinchanger:getSkin', function(skin)
            wait = true
            Citizen.Wait(50)
            local health = GetEntityHealth(PlayerPedId())
            if skin.sex == 0 then
                TriggerEvent('skinchanger:loadSkin', {sex=1})
                Citizen.Wait(1000)
                TriggerEvent('skinchanger:loadSkin', {sex=0})
            elseif skin.sex == 1 then
                TriggerEvent('skinchanger:loadSkin', {sex=0})
                Citizen.Wait(1000)
                TriggerEvent('skinchanger:loadSkin', {sex=1})
            end
            Citizen.Wait(1000)
            SetEntityHealth(PlayerPedId(), health)
            Citizen.Wait(30000)
            wait = false
            end)
        else
            ESX.ShowNotification('Zwolnij brachu!')
        end
    else
        ESX.ShowNotification('Nie możesz używac tej komendy podczas BW.')
    end
end)

--[[

		Recoil

]]--


CreateThread(function()
	while true do
		Citizen.Wait(0)
		DisplayAmmoThisFrame(false)

		local ped = PlayerPedId()
		if DoesEntityExist(ped) then
			local status, weapon = GetCurrentPedWeapon(ped, true)
			if status == 1 then
				if weapon == `WEAPON_FIREEXTINGUISHER` then
					SetPedInfiniteAmmo(ped, true, `WEAPON_FIREEXTINGUISHER`)
				elseif IsPedShooting(ped) then
					local inVehicle = IsPedInAnyVehicle(ped, false)

					local recoil = Config.Recoils[weapon]
					if recoil and #recoil > 0 then
						local i, tv = (inVehicle and 2 or 1), 0
						if GetFollowPedCamViewMode() ~= 4 then
							repeat
								SetGameplayCamRelativePitch(GetGameplayCamRelativePitch() + 0.1, 0.2)
								tv = tv + 0.1
								Citizen.Wait(0)
							until tv >= recoil[i]
						else
							repeat
								local t = GetRandomFloatInRange(0.1, recoil[i])
								SetGameplayCamRelativePitch(GetGameplayCamRelativePitch() + t, (recoil[i] > 0.1 and 1.2 or 0.333))
								tv = tv + t
								Citizen.Wait(0)
							until tv >= recoil[i]
						end
					end

					local effect = Config.Effects[weapon]
					if effect and #effect > 0 then
						ShakeGameplayCam('SMALL_EXPLOSION_SHAKE', (inVehicle and (effect[1] * 3) or effect[2]))
					end
				end
			end
		end
	end
end)

CreateThread(function()
    while true do
        Citizen.Wait(10)
        local ped = PlayerPedId()
        if IsPedArmed(ped, 6) then
            DisableControlAction(1, 140, true)
            DisableControlAction(1, 141, true)
            DisableControlAction(1, 142, true)
        end
    end
end)

Citizen.CreateThread(function()
	while true do
		Citizen.Wait(0)
		for _, iter in ipairs({1, 2, 3, 4, 6, 7, 8, 9, 13, 17, 18}) do
			HideHudComponentThisFrame(iter)
		end

		local ped = PlayerPedId()

		local inVehicle = IsPedInAnyVehicle(ped, false)
		if not show then
			HideHudComponentThisFrame(14)
			local aiming, shooting = IsControlPressed(0, 25), IsPedShooting(ped)
			if aiming or shooting then
				if shooting and not aiming then
					isShooting = true
					aimTimer = 0
				else
					isShooting = false
				end

				if not isAiming then
					isAiming = true

					lastCamera = GetFollowPedCamViewMode()
					if lastCamera ~= 4 then
						SetFollowPedCamViewMode(4)
					end
				elseif GetFollowPedCamViewMode() ~= 4 then
					SetFollowPedCamViewMode(4)
				end
			elseif isAiming then
				local off = true
				if isShooting then
					off = false
					aimTimer = aimTimer + 20
					if aimTimer == 3000 then
						isShooting = false
						aimTimer = 0
						off = true
					end
				end

				if off then
					isAiming = false
					if lastCamera ~= 4 then
						SetFollowPedCamViewMode(lastCamera)
					end
				end
			elseif not inVehicle then
				DisableControlAction(0, 24, true)
				DisableControlAction(0, 140, true)
				DisableControlAction(0, 141, true)
				DisableControlAction(0, 142, true)
				DisableControlAction(0, 257, true)
				DisableControlAction(0, 263, true)
				DisableControlAction(0, 264, true)
			end
		end

		if inVehicle then
			local vehicle = GetVehiclePedIsIn(ped, false)
			if DoesVehicleHaveWeapons(vehicle) == 1 then
				local vehicleWeapon, vehicleWeaponHash = GetCurrentPedVehicleWeapon(playerped)
				if vehicleWeapon == 1 then
					DisableVehicleWeapon(true, vehicleWeaponHash, vehicle, playerPed)
					SetCurrentPedVehicleWeapon(playerPed, `WEAPON_UNARMED`)
				end
			end

			DisableControlAction(0, 354, true)
			DisableControlAction(0, 351, true)
			DisableControlAction(0, 350, true)
			DisableControlAction(0, 357, true)
		end
	end
end)

function HashInTable( hash )
    for k, v in pairs( scopedWeapons ) do 
        if ( hash == v ) then 
            return true 
        end 
    end 

    return false 
end 

function ManageReticle()
    local ped = GetPlayerPed( -1 )

    if ( DoesEntityExist( ped ) and not IsEntityDead( ped ) ) then
        local _, hash = GetCurrentPedWeapon( ped, true )

        if ( GetFollowPedCamViewMode() ~= 4 and IsPlayerFreeAiming() and not HashInTable( hash ) ) then 
            HideHudComponentThisFrame( 14 )
        end 
    end 
end

RegisterNetEvent('Stinky:zacmienie')
AddEventHandler('Stinky:zacmienie', function()
	ESX.Scaleform.ShowFreemodeMessage('~r~RESTART SERWERA', 'ZA ~r~5 MINUT~w~ ODBEDZIE SIE RESTART SERWERA!', 10)
	Citizen.Wait(60000)
	ESX.Scaleform.ShowFreemodeMessage('~r~RESTART SERWERA', 'ZA ~r~4 MINUTY~w~ ODBEDZIE SIE RESTART SERWERA!', 10)
	Citizen.Wait(60000)
	ESX.Scaleform.ShowFreemodeMessage('~r~RESTART SERWERA', 'ZA ~r~3 MINUTY ~w~ODBEDZIE SIE RESTART SERWERA!', 10)
	Citizen.Wait(60000)
	ESX.Scaleform.ShowFreemodeMessage('~r~RESTART SERWERA', 'ZA ~r~2 MINUTY ~w~ODBEDZIE SIE RESTART SERWERA!', 10)
	Citizen.Wait(60000)
	ESX.Scaleform.ShowFreemodeMessage('~r~RESTART SERWERA', 'ZA ~r~1 MINUTE ~w~ODBEDZIE SIE RESTART SERWERA!', 10)
	TriggerServerEvent('esx_policejob:cheackuser')
end)


AddEventHandler('esx:onPlayerSpawn', function()
	if inTrunk then
		TriggerEvent('Stinky:forceOutTrunk')
	end
end)

function OpenDoor(id)
	if Ped.VehicleInFront and Ped.VehicleInFrontLock < 2 then
		if GetVehicleDoorAngleRatio(Ped.VehicleInFront, id) > 0 then
			SetVehicleDoorShut(Ped.VehicleInFront, id, false)
		else
			SetVehicleDoorOpen(Ped.VehicleInFront, id, false, false)
		end
	end
end

function CloseDoors()
	if Ped.VehicleInFront then
		for i = 0, 3 do
			SetVehicleDoorShut(Ped.VehicleInFront, i, false)
		end
	end
end

local ostatnieodbierz = 0

RegisterCommand('odbierz', function()
	if GetGameTimer() > ostatnieodbierz then
		TriggerServerEvent('StinkyRP:odbierz')
		ostatnieodbierz = GetGameTimer() + 300000
	else
		ESX.ShowNotification('Nie mozesz tak czesto uzywac odbierz!')
	end
end)