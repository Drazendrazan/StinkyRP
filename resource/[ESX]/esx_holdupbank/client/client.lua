local holdingup = false
local bank = ""
local secondsRemaining = 0
local blipRobbery = nil
ESX = nil

Citizen.CreateThread(function()
	while ESX == nil do
		TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
		Citizen.Wait(0)
	end
end)

function DisplayHelpText(str)
	SetTextComponentFormat("STRING")
	AddTextComponentString(str)
	DisplayHelpTextFromStringLabel(0, 0, 1, -1)
end

function drawTxt(x,y ,width,height,scale, text, r,g,b,a, outline)
    SetTextFont(0)
    SetTextProportional(0)
    SetTextScale(scale, scale)
    SetTextColour(r, g, b, a)
    SetTextDropShadow(0, 0, 0, 0,255)
    SetTextEdge(1, 0, 0, 0, 255)
    SetTextDropShadow()
    if(outline)then
	    SetTextOutline()
	end
    SetTextEntry("STRING")
    AddTextComponentString(text)
    DrawText(x - width/2, y - height/2 + 0.005)
end

RegisterNetEvent('esx_holdupbank:currentlyrobbing')
AddEventHandler('esx_holdupbank:currentlyrobbing', function(robb)
	holdingup = true
	bank = robb
	secondsRemaining = 590
end)

RegisterNetEvent('esx_holdupbank:killblip')
AddEventHandler('esx_holdupbank:killblip', function()
    RemoveBlip(blipRobbery)
end)

RegisterNetEvent('esx_holdupbank:setblip')
AddEventHandler('esx_holdupbank:setblip', function(position)
    blipRobbery = AddBlipForCoord(position.x, position.y, position.z)
    SetBlipSprite(blipRobbery , 161)
    SetBlipScale(blipRobbery , 2.0)
    SetBlipColour(blipRobbery, 55)
    PulseBlip(blipRobbery)
	TriggerEvent('chat:addMessage', {
		template = '<div class="chat-message" style="padding: 5px 10px 5px; margin: 7px; background-color: rgba(10, 10, 10, 0.55); border-radius: 4px;"><i class="fas fa-exclamation-circle"style="font-size:13px;color:rgb(255,255,255,0.7)"></i>&ensp;<font color="FFFFFF" style="font-weight: bold;">[{0}]: </font><font color="white">{1}</font> <font color="white">{2}</font></div>',
		args = { '^0^3Centrala^0', 'Trwa', _U('bank_robbery') }
	})
end)


RegisterNetEvent('esx_holdupbank:toofarlocal')
AddEventHandler('esx_holdupbank:toofarlocal', function(robb)
	holdingup = false
	ESX.ShowNotification(_U('robbery_cancelled'))
	robbingName = ""
	secondsRemaining = 0
	incircle = false
end)


RegisterNetEvent('esx_holdupbank:robberycomplete')
AddEventHandler('esx_holdupbank:robberycomplete', function(robb)
	holdingup = false
	ESX.ShowNotification(_U('robbery_complete') .. Banks[bank].reward)
	bank = ""
	secondsRemaining = 0
	incircle = false
end)

RegisterNetEvent('esx_holdupbank:robberycomplete1')
AddEventHandler('esx_holdupbank:robberycomplete1', function(robb)
	holdingup = false
	ESX.ShowNotification(_U('robbery_complete') .. Zbrojownia[bank].reward)
	bank = ""
	secondsRemaining = 0
	incircle = false
end)

RegisterNetEvent('esx_holdupbank:robberycomplete2')
AddEventHandler('esx_holdupbank:robberycomplete2', function(robb)
	holdingup = false
	ESX.ShowNotification(_U('robbery_complete') .. Pacyfik[bank].reward)
	bank = ""
	secondsRemaining = 0
	incircle = false
end)

RegisterNetEvent('esx_holdupbank:robberycomplete3')
AddEventHandler('esx_holdupbank:robberycomplete3', function(robb)
	holdingup = false
	ESX.ShowNotification(_U('robbery_complete') .. Humman[bank].reward)
	bank = ""
	secondsRemaining = 0
	incircle = false
end)

RegisterNetEvent('esx_holdupbank:robberycomplete4')
AddEventHandler('esx_holdupbank:robberycomplete4', function(robb)
	holdingup = false
	ESX.ShowNotification(_U('robbery_complete') .. Kawiarnia[bank].reward)
	bank = ""
	secondsRemaining = 0
	incircle = false
end)

Citizen.CreateThread(function()
	while true do
		Citizen.Wait(0)
		if holdingup then
			Citizen.Wait(1000)
			if(secondsRemaining > 0)then
				secondsRemaining = secondsRemaining - 1
			end
		end
	end
end)

Citizen.CreateThread(function()
	for k,v in pairs(Banks)do
		local ve = v.position

		local blip = AddBlipForCoord(ve.x, ve.y, ve.z)
		SetBlipSprite(blip, 500)--156
		SetBlipScale(blip, 0.8)
		SetBlipColour(blip, 1)
		SetBlipAsShortRange(blip, true)
		BeginTextCommandSetBlipName("STRING")
		AddTextComponentString(_U('bank_robbery'))
		EndTextCommandSetBlipName(blip)
	end
end)
incircle = false

Citizen.CreateThread(function()
	while true do
		Citizen.Wait(3)
		local pos, sleep = GetEntityCoords(PlayerPedId(), true), true

		for k,v in pairs(Banks)do
			local pos2 = v.position

			if(Vdist(pos.x, pos.y, pos.z, pos2.x, pos2.y, pos2.z) < 10.0)then
				sleep = false
				if not holdingup then
					ESX.DrawMarker(vec3(v.position.x, v.position.y, v.position.z - 0.0))
					--DrawMarker(1, v.position.x, v.position.y, v.position.z - 1, 0, 0, 0, 0, 0, 0, 1.0001, 1.0001, 1.5001, 1555, 0, 0,255, 0, 0, 0,0)

					if (Vdist(pos.x, pos.y, pos.z, pos2.x, pos2.y, pos2.z) < 2.0) then
						ESX.ShowFloatingHelpNotification('~b~ NAPAD NA ~s~[~b~'..v.nameofbank..'~s~]', vec3(v.position.x, v.position.y, v.position.z + 0.75))
					end

					if(Vdist(pos.x, pos.y, pos.z, pos2.x, pos2.y, pos2.z) < 1.0) and not exports['esx_policejob']:isHandcuffed() and not exports['esx_ambulancejob']:getDeathStatus() then
						if (incircle == false) then
							DisplayHelpText(_U('press_to_rob') .. v.nameofbank)
						end
						incircle = true
						if IsControlJustReleased(1, 51) then
							TriggerServerEvent('esx_holdupbank:rob', k)
						end
					elseif(Vdist(pos.x, pos.y, pos.z, pos2.x, pos2.y, pos2.z) > 1.0)then
						incircle = false
					end
				elseif holdingup then

					drawTxt(0.66, 1.44, 1.0,1.0,0.4, _U('robbery_of') .. secondsRemaining .. _U('seconds_remaining'), 255, 255, 255, 255)
		
					local pos2 = Banks[bank].position
		
					if(Vdist(pos.x, pos.y, pos.z, pos2.x, pos2.y, pos2.z) > 7.5)then
						sleep = false
						TriggerServerEvent('esx_holdupbank:toofar', bank)
					end
				end
				if sleep then
					Citizen.Wait(500)
				end
			end
		end

		for k,v in pairs(Zbrojownia)do
			local pos2 = v.position
			local pos, sleep = GetEntityCoords(PlayerPedId(), true), true

			if(Vdist(pos.x, pos.y, pos.z, pos2.x, pos2.y, pos2.z) < 15.0)then
				sleep = false
				if not holdingup then
					ESX.DrawMarker(vec3(v.position.x, v.position.y, v.position.z - 0.9))
					--DrawMarker(1, v.position.x, v.position.y, v.position.z - 1, 0, 0, 0, 0, 0, 0, 1.0001, 1.0001, 1.5001, 1555, 0, 0,255, 0, 0, 0,0)

					if (Vdist(pos.x, pos.y, pos.z, pos2.x, pos2.y, pos2.z) < 2.0) then
						ESX.ShowFloatingHelpNotification('~b~ NAPAD NA ~s~[~b~'..v.nameofbank..'~s~]', vec3(v.position.x, v.position.y, v.position.z + 0.1))
					end

					if(Vdist(pos.x, pos.y, pos.z, pos2.x, pos2.y, pos2.z) < 1.0) and not exports['esx_policejob']:isHandcuffed() and not exports['esx_ambulancejob']:getDeathStatus() then
						if (incircle == false) then
							DisplayHelpText(_U('press_to_rob') .. v.nameofbank)
						end
						incircle = true
						if IsControlJustReleased(1, 51) then
							TriggerServerEvent('esx_holdupbank:robzbrojownia', k)
						end
					elseif(Vdist(pos.x, pos.y, pos.z, pos2.x, pos2.y, pos2.z) > 1.0)then
						incircle = false
					end
				elseif holdingup then

					drawTxt(0.66, 1.44, 1.0,1.0,0.4, _U('robbery_of') .. secondsRemaining .. _U('seconds_remaining'), 255, 255, 255, 255)
		
					local pos2 = Zbrojownia[bank].position
		
					if(Vdist(pos.x, pos.y, pos.z, pos2.x, pos2.y, pos2.z) > 7.5)then
						sleep = false
						TriggerServerEvent('esx_holdupbank:toofarZbrojownia', bank)
					end
				end
				if sleep then
					Citizen.Wait(500)
				end
			end
		end

		for k,v in pairs(Humman)do
			local pos2 = v.position
			local pos, sleep = GetEntityCoords(PlayerPedId(), true), true

			if(Vdist(pos.x, pos.y, pos.z, pos2.x, pos2.y, pos2.z) < 15.0)then
				sleep = false
				if not holdingup then
					ESX.DrawMarker(vec3(v.position.x, v.position.y, v.position.z - 0.0))
					--DrawMarker(1, v.position.x, v.position.y, v.position.z - 1, 0, 0, 0, 0, 0, 0, 1.0001, 1.0001, 1.5001, 1555, 0, 0,255, 0, 0, 0,0)

					if (Vdist(pos.x, pos.y, pos.z, pos2.x, pos2.y, pos2.z) < 2.0) then
						ESX.ShowFloatingHelpNotification('~b~ NAPAD NA ~s~[~b~'..v.nameofbank..'~s~]', vec3(v.position.x, v.position.y, v.position.z + 0.75))
					end

					if(Vdist(pos.x, pos.y, pos.z, pos2.x, pos2.y, pos2.z) < 1.0) and not exports['esx_policejob']:isHandcuffed() and not exports['esx_ambulancejob']:getDeathStatus() then
						if (incircle == false) then
							DisplayHelpText(_U('press_to_rob') .. v.nameofbank)
						end
						incircle = true
						if IsControlJustReleased(1, 51) then
							TriggerServerEvent('esx_holdupbank:robhumman', k)
						end
					elseif(Vdist(pos.x, pos.y, pos.z, pos2.x, pos2.y, pos2.z) > 1.0)then
						incircle = false
					end
				elseif holdingup then

					drawTxt(0.66, 1.44, 1.0,1.0,0.4, _U('robbery_of') .. secondsRemaining .. _U('seconds_remaining'), 255, 255, 255, 255)
		
					local pos2 = Humman[bank].position
		
					if(Vdist(pos.x, pos.y, pos.z, pos2.x, pos2.y, pos2.z) > 7.5)then
						sleep = false
						TriggerServerEvent('esx_holdupbank:toofarHUMMAN', bank)
					end
				end
				if sleep then
					Citizen.Wait(500)
				end
			end
		end

		for k,v in pairs(Kawiarnia)do
			local pos2 = v.position
			local pos, sleep = GetEntityCoords(PlayerPedId(), true), true

			if(Vdist(pos.x, pos.y, pos.z, pos2.x, pos2.y, pos2.z) < 15.0)then
				sleep = false
				if not holdingup then
					ESX.DrawMarker(vec3(v.position.x, v.position.y, v.position.z - 0.9))
					--DrawMarker(1, v.position.x, v.position.y, v.position.z - 1, 0, 0, 0, 0, 0, 0, 1.0001, 1.0001, 1.5001, 1555, 0, 0,255, 0, 0, 0,0)

					if (Vdist(pos.x, pos.y, pos.z, pos2.x, pos2.y, pos2.z) < 2.0) then
						ESX.ShowFloatingHelpNotification('~b~ NAPAD NA ~s~[~b~'..v.nameofbank..'~s~]', vec3(v.position.x, v.position.y, v.position.z + 0.1))
					end

					if(Vdist(pos.x, pos.y, pos.z, pos2.x, pos2.y, pos2.z) < 1.0) and not exports['esx_policejob']:isHandcuffed() and not exports['esx_ambulancejob']:getDeathStatus() then
						if (incircle == false) then
							DisplayHelpText(_U('press_to_rob') .. v.nameofbank)
						end
						incircle = true
						if IsControlJustReleased(1, 51) then
							TriggerServerEvent('esx_holdupbank:robkawiarnia', k)
						end
					elseif(Vdist(pos.x, pos.y, pos.z, pos2.x, pos2.y, pos2.z) > 1.0)then
						incircle = false
					end
				elseif holdingup then

					drawTxt(0.66, 1.44, 1.0,1.0,0.4, _U('robbery_of') .. secondsRemaining .. _U('seconds_remaining'), 255, 255, 255, 255)
		
					local pos2 = Kawiarnia[bank].position
		
					if(Vdist(pos.x, pos.y, pos.z, pos2.x, pos2.y, pos2.z) > 7.5)then
						sleep = false
						TriggerServerEvent('esx_holdupbank:toofarKawiarnia', bank)
					end
				end
				if sleep then
					Citizen.Wait(500)
				end
			end
		end

		for k,v in pairs(Pacyfik)do
			local pos2 = v.position
			local pos, sleep = GetEntityCoords(PlayerPedId(), true), true

			if(Vdist(pos.x, pos.y, pos.z, pos2.x, pos2.y, pos2.z) < 15.0)then
				sleep = false
				if not holdingup then
					ESX.DrawMarker(vec3(v.position.x, v.position.y, v.position.z - 0.0))
					--DrawMarker(1, v.position.x, v.position.y, v.position.z - 1, 0, 0, 0, 0, 0, 0, 1.0001, 1.0001, 1.5001, 1555, 0, 0,255, 0, 0, 0,0)

					if (Vdist(pos.x, pos.y, pos.z, pos2.x, pos2.y, pos2.z) < 2.0) then
						ESX.ShowFloatingHelpNotification('~b~ NAPAD NA ~s~[~b~'..v.nameofbank..'~s~]', vec3(v.position.x, v.position.y, v.position.z + 0.75))
					end

					if(Vdist(pos.x, pos.y, pos.z, pos2.x, pos2.y, pos2.z) < 1.0) and not exports['esx_policejob']:isHandcuffed() and not exports['esx_ambulancejob']:getDeathStatus() then
						if (incircle == false) then
							DisplayHelpText(_U('press_to_rob') .. v.nameofbank)
						end
						incircle = true
						if IsControlJustReleased(1, 51) then
							TriggerServerEvent('esx_holdupbank:robskarbiec', k)
						end
					elseif(Vdist(pos.x, pos.y, pos.z, pos2.x, pos2.y, pos2.z) > 1.0)then
						incircle = false
					end
				elseif holdingup then

					drawTxt(0.66, 1.44, 1.0,1.0,0.4, _U('robbery_of') .. secondsRemaining .. _U('seconds_remaining'), 255, 255, 255, 255)
		
					local pos2 = Pacyfik[bank].position
		
					if(Vdist(pos.x, pos.y, pos.z, pos2.x, pos2.y, pos2.z) > 7.5)then
						sleep = false
						TriggerServerEvent('esx_holdupbank:toofarSkarbiec', bank)
					end
				end
				if sleep then
					Citizen.Wait(500)
				end
			end
	
		end

	end
end)