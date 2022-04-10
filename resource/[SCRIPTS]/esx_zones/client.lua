--------------------------------------------------------------------------------------------------------------
------------First off, many thanks to @anders for help with the majority of this script. ---------------------
------------Also shout out to @setro for helping understand pESX.ShowNotification better.              ---------------------
--------------------------------------------------------------------------------------------------------------
------------To configure: Add/replace your own coords in the sectiong directly below.    ---------------------
------------        Goto LINE 90 and change "50" to your desired SafeZone Radius.        ---------------------
------------        Goto LINE 130 to edit the Marker( Holographic circle.)               ---------------------
--------------------------------------------------------------------------------------------------------------
-- Place your own coords here!
ESX = nil
PlayerData              = {}

local greenzones = {
	{ ['x'] = -546.59, ['y'] = -201.74, ['z'] = 34.66, ['size'] = 40.0}, -- miasto/spawn 
	{ ['x'] = 2640.7, ['y'] = 3266.5, ['z'] = 54.01, ['size'] = 90.0}, -- autostrada
	{ ['x'] = -458.2936, ['y'] = -1716.3597, ['z'] = 18.3779, ['size'] = 90.0}, -- zlomowisko
	{ ['x'] = 182.218, ['y'] = 2779.2056, ['z'] = 43.4252, ['size'] = 90.0}, -- gz3
}

local drawDist = 100.0

local notifIn = false
local notifOut = false
local closestZone = 1

Citizen.CreateThread(function()
	while ESX == nil do
		TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
		Citizen.Wait(0)
    end
  
    while ESX.GetPlayerData().job == nil do
		Citizen.Wait(5000)
	end

    PlayerData = ESX.GetPlayerData()
end)


RegisterNetEvent('esx:playerLoaded')
AddEventHandler('esx:playerLoaded', function(xPlayer)
	PlayerData = xPlayer
end)

RegisterNetEvent('esx:setJob')
AddEventHandler('esx:setJob', function(job)
	PlayerData.job = job
end)

RegisterNetEvent('esx:setSecondJob')
AddEventHandler('esx:setSecondJob', function(secondjob)
    PlayerData.secondjob = secondjob
end)

--------------------------------------------------------------------------------------------------------------

Citizen.CreateThread(function()
	while not NetworkIsPlayerActive(PlayerId()) do
		Citizen.Wait(0)
	end
	
	while true do
		local playerPed = PlayerPedId()
		local x, y, z = table.unpack(GetEntityCoords(playerPed, true))
		local minDistance = 100000
		N_0x4757f00bc6323cfe(-1553120962, 0.0) -- antiVDM
        HideHudComponentThisFrame(1)
        HideHudComponentThisFrame(3)
        HideHudComponentThisFrame(4)
        HideHudComponentThisFrame(5)
        HideHudComponentThisFrame(6)
        HideHudComponentThisFrame(9)
        HideHudComponentThisFrame(7)
        HideHudComponentThisFrame(8)
        HideHudComponentThisFrame(14)
        Wait(0)
		for i = 1, #greenzones, 1 do
			dist = Vdist(greenzones[i].x, greenzones[i].y, greenzones[i].z, x, y, z)
			if dist < minDistance then
				minDistance = dist
				closestZone = i
			end
		end
		Citizen.Wait(5000)
	end
end)

--------------------------------------------------------------------------------------------------------------
--------------------------------------------------------------------------------------------------------------
---------   Setting of friendly fire on and off, disabling your weapons, and sending pNoty   -----------------
--------------------------------------------------------------------------------------------------------------
--------------------------------------------------------------------------------------------------------------

Citizen.CreateThread(function()
	while not NetworkIsPlayerActive(PlayerId()) do
		Citizen.Wait(0)
	end
	
	while true do
		Citizen.Wait(0)
		local sleep = true
		local player = PlayerPedId()
		local x,y,z = table.unpack(GetEntityCoords(player, true))
		local dist = Vdist(greenzones[closestZone].x, greenzones[closestZone].y, greenzones[closestZone].z, x, y, z)
	
		if not IsAuthorized() then
			if dist <= (greenzones[closestZone].size / 2) then  ------------------------------------------------------------------------------ Here you can change the RADIUS of the Safe Zone. Remember, whatever you put here will DOUBLE because 
				if not notifIn then															  -- it is a sphere. So 50 will actually result in a diameter of 100. I assume it is meters. No clue to be honest.
					ClearPlayerWantedLevel(PlayerId())
					SetCurrentPedWeapon(player,GetHashKey("WEAPON_UNARMED"),true)
					ESX.ShowNotification('~g~Jesteś w bezpiecznej strefie')
					notifIn = true
					notifOut = false
				end
				
			else
				if not notifOut then
					SetCanAttackFriendly(PlayerPedId(),true,true)
					NetworkSetFriendlyFireOption(true,true)
					SetEntityInvincible(PlayerPedId(), false)
					ESX.ShowNotification('~r~Nie jesteś już w bezpiecznej strefie')
					notifOut = true
					notifIn = false
				end
			end
			if notifIn then
				SetCanAttackFriendly(PlayerPedId(),false)
				NetworkSetFriendlyFireOption(false)
				SetCurrentPedWeapon(PlayerPedId(), `WEAPON_UNARMED`, true)
				ClearPlayerWantedLevel(PlayerId())   
				DisablePlayerFiring(PlayerId(), true) 
                DisableControlAction(0, 288, true)   
                DisableControlAction(0, 220, true)
                DisableControlAction(0, 263, true)
                DisableControlAction(0, 221, true) 
                DisableControlAction(2, 37, true)
                DisableControlAction(0, 45, true)
				SetEntityInvincible(PlayerPedId(), true)
                SetWeaponDamageModifierThisFrame(GetSelectedPedWeapon(iPed), -1000)
                DisableControlAction(0, 25, true)
                DisableControlAction(0, 0, true)
				if IsDisabledControlJustPressed(2, 37) then 
                    SetCurrentPedWeapon(PlayerPedId(), `WEAPON_UNARMED`, true)
					ESX.ShowNotification('~r~Nie możesz wykonać tej czynności!')
                end

                if IsDisabledControlJustPressed(0, 106) then 
                    SetCurrentPedWeapon(PlayerPedId(), `WEAPON_UNARMED`, true)
					ESX.ShowNotification('~r~Nie możesz wykonać tej czynności!')
                end

				DisableControlAction(0, 288, true)   
                if IsDisabledControlJustPressed(0, 288) then 
					ESX.ShowNotification('~r~Nie możesz wykonać tej czynności!')
                end

                DisableControlAction(0, 182, true)   
                if IsDisabledControlJustPressed(0, 182) then 
					ESX.ShowNotification('~r~Nie możesz wykonać tej czynności!')
                end   
			end
		end
		-- Comment out lines 142 - 145 if you dont want a marker.
	 	if DoesEntityExist(player) and dist < drawDist then	      --The -1.0001 will place it on the ground flush		-- SIZING CIRCLE |  x    y    z | R   G    B   alpha| *more alpha more transparent*
			sleep = false	
	 		DrawMarker(1, greenzones[closestZone].x, greenzones[closestZone].y, greenzones[closestZone].z-1.0001, 0, 0, 0, 0, 0, 0, greenzones[closestZone].size, greenzones[closestZone].size, 10.0, 13, 232, 15, 155, 0, 0, 2, 0, 0, 0, 0) -- heres what all these numbers are. Honestly you dont really need to mess with any other than what isnt 0.
	 		--DrawMarker(type, float posX, float posY, float posZ, float dirX, float dirY, float dirZ, float rotX, float rotY, float rotZ, float scaleX, float scaleY, float scaleZ, int red, int green, int blue, int alpha, BOOL bobUpAndDown, BOOL faceCamera, int p19(LEAVE AS 2), BOOL rotate, char* textureDict, char* textureName, BOOL drawOnEnts)
	 	end

		if sleep then
			Citizen.Wait(500)
		end
	end
end)

function IsAuthorized()
	local callback = false
	local aJobs = {
		'police',
		'ambulance'
	}
	for k,v in pairs(aJobs) do
		if PlayerData.job ~= nil and PlayerData.job.name == v or PlayerData.secondjob ~= nil and PlayerData.secondjob.name == v then
			callback = true
			break
		end
	end
	return callback
end