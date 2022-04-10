local rob = false
local robbers = {}
ESX = nil

TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

function get3DDistance(x1, y1, z1, x2, y2, z2)
	return math.sqrt(math.pow(x1 - x2, 2) + math.pow(y1 - y2, 2) + math.pow(z1 - z2, 2))
end

-- 			['BANKI']

RegisterServerEvent('esx_holdupbank:toofar')
AddEventHandler('esx_holdupbank:toofar', function(robb)
	local source = source
	local xPlayers = ESX.GetPlayers()
	rob = false
	for i=1, #xPlayers, 1 do
 		local xPlayer = ESX.GetPlayerFromId(xPlayers[i])
 		if xPlayer.job.name == 'police' then
			TriggerClientEvent('esx:showNotification', xPlayers[i], _U('robbery_cancelled_at') .. Banks[robb].nameofbank)
			TriggerClientEvent('esx_holdupbank:killblip', xPlayers[i])
		end
	end
	if(robbers[source])then
		TriggerClientEvent('esx_holdupbank:toofarlocal', source)
		robbers[source] = nil
		TriggerClientEvent('esx:showNotification', source, _U('robbery_has_cancelled') .. Banks[robb].nameofbank)
	end
end)

-- 			['ZBROJOWNIA']

RegisterServerEvent('esx_holdupbank:toofarZbrojownia')
AddEventHandler('esx_holdupbank:toofarZbrojownia', function(robb)
	local source = source
	local xPlayers = ESX.GetPlayers()
	rob = false
	for i=1, #xPlayers, 1 do
 		local xPlayer = ESX.GetPlayerFromId(xPlayers[i])
 		if xPlayer.job.name == 'police' then
			TriggerClientEvent('esx:showNotification', xPlayers[i], _U('robbery_cancelled_at') .. Zbrojownia[robb].nameofbank)
			TriggerClientEvent('esx_holdupbank:killblip', xPlayers[i])
		end
	end
	if(robbers[source])then
		TriggerClientEvent('esx_holdupbank:toofarlocal', source)
		robbers[source] = nil
		TriggerClientEvent('esx:showNotification', source, _U('robbery_has_cancelled') .. Zbrojownia[robb].nameofbank)
	end
end)

-- 			['SKARBIEC']

RegisterServerEvent('esx_holdupbank:toofarSkarbiec')
AddEventHandler('esx_holdupbank:toofarSkarbiec', function(robb)
	local source = source
	local xPlayers = ESX.GetPlayers()
	rob = false
	for i=1, #xPlayers, 1 do
 		local xPlayer = ESX.GetPlayerFromId(xPlayers[i])
 		if xPlayer.job.name == 'police' then
			TriggerClientEvent('esx:showNotification', xPlayers[i], _U('robbery_cancelled_at') .. Pacyfik[robb].nameofbank)
			TriggerClientEvent('esx_holdupbank:killblip', xPlayers[i])
		end
	end
	if(robbers[source])then
		TriggerClientEvent('esx_holdupbank:toofarlocal', source)
		robbers[source] = nil
		TriggerClientEvent('esx:showNotification', source, _U('robbery_has_cancelled') .. Pacyfik[robb].nameofbank)
	end
end)

-- 			['KAWIARNIA']

RegisterServerEvent('esx_holdupbank:toofarKawiarnia')
AddEventHandler('esx_holdupbank:toofarKawiarnia', function(robb)
	local source = source
	local xPlayers = ESX.GetPlayers()
	rob = false
	for i=1, #xPlayers, 1 do
 		local xPlayer = ESX.GetPlayerFromId(xPlayers[i])
 		if xPlayer.job.name == 'police' then
			TriggerClientEvent('esx:showNotification', xPlayers[i], _U('robbery_cancelled_at') .. Kawiarnia[robb].nameofbank)
			TriggerClientEvent('esx_holdupbank:killblip', xPlayers[i])
		end
	end
	if(robbers[source])then
		TriggerClientEvent('esx_holdupbank:toofarlocal', source)
		robbers[source] = nil
		TriggerClientEvent('esx:showNotification', source, _U('robbery_has_cancelled') .. Kawiarnia[robb].nameofbank)
	end
end)

-- 			['HUMMAN']

RegisterServerEvent('esx_holdupbank:toofarHUMMAN')
AddEventHandler('esx_holdupbank:toofarHUMMAN', function(robb)
	local source = source
	local xPlayers = ESX.GetPlayers()
	rob = false
	for i=1, #xPlayers, 1 do
 		local xPlayer = ESX.GetPlayerFromId(xPlayers[i])
 		if xPlayer.job.name == 'police' then
			TriggerClientEvent('esx:showNotification', xPlayers[i], _U('robbery_cancelled_at') .. Humman[robb].nameofbank)
			TriggerClientEvent('esx_holdupbank:killblip', xPlayers[i])
		end
	end
	if(robbers[source])then
		TriggerClientEvent('esx_holdupbank:toofarlocal', source)
		robbers[source] = nil
		TriggerClientEvent('esx:showNotification', source, _U('robbery_has_cancelled') .. Humman[robb].nameofbank)
	end
end)

-- 			['BANKI']

RegisterServerEvent('esx_holdupbank:rob')
AddEventHandler('esx_holdupbank:rob', function(robb)

	local source = source
	local xPlayer = ESX.GetPlayerFromId(source)
	local drill = xPlayer.getInventoryItem('drill')
	local xPlayers = ESX.GetPlayers()
	
	if Banks[robb] then

		local bank = Banks[robb]

		if (os.time() - bank.lastrobbed) < 43200 and bank.lastrobbed ~= 0 then

			TriggerClientEvent('esx:showNotification', source, _U('already_robbed') .. (2 - (os.time() - bank.lastrobbed)) .. _U('seconds'))
			return
		end


		local cops = 0
		for i=1, #xPlayers, 1 do
 		local xPlayer = ESX.GetPlayerFromId(xPlayers[i])
 		if xPlayer.job.name == 'police' then
				cops = cops + 1
			end
		end


		if rob == false then
		   
		  	if xPlayer.getInventoryItem('drill').count >= 1 then

				if(cops >= Config.NumberOfCopsRequired)then
					xPlayer.removeInventoryItem('drill', 1)
					rob = true
					for i=1, #xPlayers, 1 do
						local xPlayer = ESX.GetPlayerFromId(xPlayers[i])
						if xPlayer.job.name == 'police' then
								TriggerClientEvent('esx:showNotification', xPlayers[i], _U('rob_in_prog') .. bank.nameofbank)
								TriggerClientEvent('esx_holdupbank:setblip', xPlayers[i], Banks[robb].position)
						end
					end

					TriggerClientEvent('esx:showNotification', source, _U('started_to_rob') .. bank.nameofbank .. _U('do_not_move'))
					TriggerClientEvent('esx:showNotification', source, _U('alarm_triggered'))
					TriggerClientEvent('esx:showNotification', source, _U('hold_pos'))
					TriggerClientEvent('esx_borrmaskin:startDrill', source)
					TriggerClientEvent('esx_holdupbank:currentlyrobbing', source, robb)
					Banks[robb].lastrobbed = os.time()
					robbers[source] = robb
					local savedSource = source
					SetTimeout(600000, function()

						if(robbers[savedSource])then

							rob = false
							TriggerClientEvent('esx_holdupbank:robberycomplete', savedSource, job)
							if(xPlayer)then

								xPlayer.addAccountMoney('black_money', bank.reward)
								xPlayer.addInventoryItem('jajkowielkanocne', 65)
								local xPlayers = ESX.GetPlayers()
								for i=1, #xPlayers, 1 do
									local xPlayer = ESX.GetPlayerFromId(xPlayers[i])
									if xPlayer.job.name == 'police' then
											TriggerClientEvent('esx:showNotification', xPlayers[i], _U('robbery_complete_at') .. bank.nameofbank)
											TriggerClientEvent('esx_holdupbank:killblip', xPlayers[i])
									end
								end
							end
						end
					end)
				else
					TriggerClientEvent('esx:showNotification', source, _U('min_two_police') .. Config.NumberOfCopsRequired)
				end
			else
				TriggerClientEvent('esx:showNotification', source, 'nie masz ~r~wiertla!')
			end
		else
			TriggerClientEvent('esx:showNotification', source, _U('robbery_already'))
		end
	end
end)

-- 			['Zbrojownia']

RegisterServerEvent('esx_holdupbank:robzbrojownia')
AddEventHandler('esx_holdupbank:robzbrojownia', function(robb)

	local source = source
	local xPlayer = ESX.GetPlayerFromId(source)
	local drill = xPlayer.getInventoryItem('drill')
	local xPlayers = ESX.GetPlayers()
	

	if Zbrojownia[robb] then

		local bank = Zbrojownia[robb]

		if (os.time() - bank.lastrobbed) < 43200 and bank.lastrobbed ~= 0 then

			TriggerClientEvent('esx:showNotification', source, _U('already_robbed') .. (2 - (os.time() - bank.lastrobbed)) .. _U('seconds'))
			return
		end


		local cops = 0
		for i=1, #xPlayers, 1 do
 		local xPlayer = ESX.GetPlayerFromId(xPlayers[i])
 		if xPlayer.job.name == 'police' then
				cops = cops + 1
			end
		end

		local nagorda = math.random(1,100)


		if rob == false then
		   
		  	if xPlayer.getInventoryItem('drill').count >= 1 then

				if(cops >= Config.NumberOfCopsRequiredZBrojownia)then
					xPlayer.removeInventoryItem('drill', 1)

					rob = true
					for i=1, #xPlayers, 1 do
						local xPlayer = ESX.GetPlayerFromId(xPlayers[i])
						if xPlayer.job.name == 'police' then
								TriggerClientEvent('esx:showNotification', xPlayers[i], _U('rob_in_prog') .. bank.nameofbank)
								TriggerClientEvent('esx_holdupbank:setblip', xPlayers[i], Zbrojownia[robb].position)
						end
					end

					TriggerClientEvent('esx:showNotification', source, _U('started_to_rob') .. bank.nameofbank .. _U('do_not_move'))
					TriggerClientEvent('esx:showNotification', source, _U('alarm_triggered'))
					TriggerClientEvent('esx:showNotification', source, _U('hold_pos'))
					TriggerClientEvent('esx_borrmaskin:startDrill', source)
					TriggerClientEvent('esx_holdupbank:currentlyrobbing', source, robb)
					Zbrojownia[robb].lastrobbed = os.time()
					robbers[source] = robb
					local savedSource = source
					SetTimeout(5, function()

						if(robbers[savedSource])then

							rob = false
							TriggerClientEvent('esx_holdupbank:robberycomplete1', savedSource, job)
							if(xPlayer)then

								if nagorda <= 10 then
									xPlayer.addInventoryItem('kamzasmall', 5)
								elseif nagorda <= 5 then
									xPlayer.addInventoryItem('kamzaduza', 5)
								elseif nagorda <= 10 then
									xPlayer.addInventoryItem('snspistol_mk2', 20)
								elseif nagorda <= 25 then
									xPlayer.addInventoryItem('vintagepistol', 20)
								end

								xPlayer.addAccountMoney('black_money', bank.reward)
								xPlayer.addInventoryItem('jajkowielkanocne', 150)
								local xPlayers = ESX.GetPlayers()
								for i=1, #xPlayers, 1 do
									local xPlayer = ESX.GetPlayerFromId(xPlayers[i])
									if xPlayer.job.name == 'police' then
											TriggerClientEvent('esx:showNotification', xPlayers[i], _U('robbery_complete_at') .. bank.nameofbank)
											TriggerClientEvent('esx_holdupbank:killblip', xPlayers[i])
									end
								end
							end
						end
					end)
				else
					TriggerClientEvent('esx:showNotification', source, _U('min_two_police') .. Config.NumberOfCopsRequiredZBrojownia)
				end
			else
				TriggerClientEvent('esx:showNotification', source, 'nie masz ~r~wiertla!')
			end
		else
			TriggerClientEvent('esx:showNotification', source, _U('robbery_already'))
		end
	end
end)

-- 			['PACYFIK']

RegisterServerEvent('esx_holdupbank:robskarbiec')
AddEventHandler('esx_holdupbank:robskarbiec', function(robb)

	local source = source
	local xPlayer = ESX.GetPlayerFromId(source)
	local drill = xPlayer.getInventoryItem('drill')
	local xPlayers = ESX.GetPlayers()
	

	if Pacyfik[robb] then

		local bank = Pacyfik[robb]

		if (os.time() - bank.lastrobbed) < 43200 and bank.lastrobbed ~= 0 then

			TriggerClientEvent('esx:showNotification', source, _U('already_robbed') .. (2 - (os.time() - bank.lastrobbed)) .. _U('seconds'))
			return
		end


		local cops = 0
		for i=1, #xPlayers, 1 do
 		local xPlayer = ESX.GetPlayerFromId(xPlayers[i])
 		if xPlayer.job.name == 'police' then
				cops = cops + 1
			end
		end

		if rob == false then
		   
		  	if xPlayer.getInventoryItem('drill').count >= 1 then

				if(cops >= Config.NumberOfCopsRequiredSkarbiec)then
					xPlayer.removeInventoryItem('drill', 1)

					rob = true
					for i=1, #xPlayers, 1 do
						local xPlayer = ESX.GetPlayerFromId(xPlayers[i])
						if xPlayer.job.name == 'police' then
								TriggerClientEvent('esx:showNotification', xPlayers[i], _U('rob_in_prog') .. bank.nameofbank)
								TriggerClientEvent('esx_holdupbank:setblip', xPlayers[i], Pacyfik[robb].position)
						end
					end

					TriggerClientEvent('esx:showNotification', source, _U('started_to_rob') .. bank.nameofbank .. _U('do_not_move'))
					TriggerClientEvent('esx:showNotification', source, _U('alarm_triggered'))
					TriggerClientEvent('esx:showNotification', source, _U('hold_pos'))
					TriggerClientEvent('esx_borrmaskin:startDrill', source)
					TriggerClientEvent('esx_holdupbank:currentlyrobbing', source, robb)
					Pacyfik[robb].lastrobbed = os.time()
					robbers[source] = robb
					local savedSource = source
					SetTimeout(600000, function()

						if(robbers[savedSource])then

							rob = false
							TriggerClientEvent('esx_holdupbank:robberycomplete2', savedSource, job)
							if(xPlayer)then

								xPlayer.addAccountMoney('black_money', bank.reward)
								xPlayer.addInventoryItem('jajkowielkanocne', 85)
								local xPlayers = ESX.GetPlayers()
								for i=1, #xPlayers, 1 do
									local xPlayer = ESX.GetPlayerFromId(xPlayers[i])
									if xPlayer.job.name == 'police' then
											TriggerClientEvent('esx:showNotification', xPlayers[i], _U('robbery_complete_at') .. bank.nameofbank)
											TriggerClientEvent('esx_holdupbank:killblip', xPlayers[i])
									end
								end
							end
						end
					end)
				else
					TriggerClientEvent('esx:showNotification', source, _U('min_two_police') .. Config.NumberOfCopsRequiredSkarbiec)
				end
			else
				TriggerClientEvent('esx:showNotification', source, 'nie masz ~r~wiertla!')
			end
		else
			TriggerClientEvent('esx:showNotification', source, _U('robbery_already'))
		end
	end
end)

-- 			['Kawiarnia']

RegisterServerEvent('esx_holdupbank:robkawiarnia')
AddEventHandler('esx_holdupbank:robkawiarnia', function(robb)

	local source = source
	local xPlayer = ESX.GetPlayerFromId(source)
	local drill = xPlayer.getInventoryItem('drill')
	local xPlayers = ESX.GetPlayers()
	

	if Kawiarnia[robb] then

		local bank = Kawiarnia[robb]

		if (os.time() - bank.lastrobbed) < 43200 and bank.lastrobbed ~= 0 then

			TriggerClientEvent('esx:showNotification', source, _U('already_robbed') .. (2 - (os.time() - bank.lastrobbed)) .. _U('seconds'))
			return
		end


		local cops = 0
		for i=1, #xPlayers, 1 do
 		local xPlayer = ESX.GetPlayerFromId(xPlayers[i])
 		if xPlayer.job.name == 'police' then
				cops = cops + 1
			end
		end

		local nagordakawa = math.random(1,100)

		if rob == false then
		   
		 	if xPlayer.getInventoryItem('drill').count >= 1 then

				if(cops >= Config.NumberOfCopsRequiredKawiarnia)then
					xPlayer.removeInventoryItem('drill', 1)

					rob = true
					for i=1, #xPlayers, 1 do
						local xPlayer = ESX.GetPlayerFromId(xPlayers[i])
						if xPlayer.job.name == 'police' then
								TriggerClientEvent('esx:showNotification', xPlayers[i], _U('rob_in_prog') .. bank.nameofbank)
								TriggerClientEvent('esx_holdupbank:setblip', xPlayers[i], Kawiarnia[robb].position)
						end
					end

					TriggerClientEvent('esx:showNotification', source, _U('started_to_rob') .. bank.nameofbank .. _U('do_not_move'))
					TriggerClientEvent('esx:showNotification', source, _U('alarm_triggered'))
					TriggerClientEvent('esx:showNotification', source, _U('hold_pos'))
					TriggerClientEvent('esx_borrmaskin:startDrill', source)
					TriggerClientEvent('esx_holdupbank:currentlyrobbing', source, robb)
					Kawiarnia[robb].lastrobbed = os.time()
					robbers[source] = robb
					local savedSource = source
					SetTimeout(600000, function()

						if(robbers[savedSource])then

							rob = false
							TriggerClientEvent('esx_holdupbank:robberycomplete4', savedSource, job)
							if(xPlayer)then

								if nagordakawa <= 80 then
									xPlayer.addInventoryItem('stinkyenergy', 50)
								end

								if nagordakawa <= 60 then
									xPlayer.addInventoryItem('stinkyenergy', 80)
								end

								if nagordakawa <= 30 then
									xPlayer.addInventoryItem('stinkyenergy', 120)
								end

								if nagordakawa <= 10 then
									xPlayer.addInventoryItem('stinkyenergy', 180)
								end

								xPlayer.addAccountMoney('money', bank.reward)
								xPlayer.addInventoryItem('jajkowielkanocne', 45)
								local xPlayers = ESX.GetPlayers()
								for i=1, #xPlayers, 1 do
									local xPlayer = ESX.GetPlayerFromId(xPlayers[i])
									if xPlayer.job.name == 'police' then
											TriggerClientEvent('esx:showNotification', xPlayers[i], _U('robbery_complete_at') .. bank.nameofbank)
											TriggerClientEvent('esx_holdupbank:killblip', xPlayers[i])
									end
								end
							end
						end
					end)
				else
					TriggerClientEvent('esx:showNotification', source, _U('min_two_police') .. Config.NumberOfCopsRequiredKawiarnia)
				end
			else
				TriggerClientEvent('esx:showNotification', source, 'nie masz ~r~wiertla!')
			end
		else
			TriggerClientEvent('esx:showNotification', source, _U('robbery_already'))
		end
	end
end)

-- 			['HUMMAN']

RegisterServerEvent('esx_holdupbank:robhumman')
AddEventHandler('esx_holdupbank:robhumman', function(robb)

	local source = source
	local xPlayer = ESX.GetPlayerFromId(source)
	local drill = xPlayer.getInventoryItem('drill')
	local xPlayers = ESX.GetPlayers()
	

	if Humman[robb] then

		local bank = Humman[robb]

		if (os.time() - bank.lastrobbed) < 43200 and bank.lastrobbed ~= 0 then

			TriggerClientEvent('esx:showNotification', source, _U('already_robbed') .. (2 - (os.time() - bank.lastrobbed)) .. _U('seconds'))
			return
		end


		local cops = 0
		for i=1, #xPlayers, 1 do
 		local xPlayer = ESX.GetPlayerFromId(xPlayers[i])
 		if xPlayer.job.name == 'police' then
				cops = cops + 1
			end
		end

		local nagordahumman = math.random(1,100)

		if rob == false then
		   
		  	if xPlayer.getInventoryItem('drill').count >= 1 then

				if(cops >= Config.NumberOfCopsRequiredHumman)then
					xPlayer.removeInventoryItem('drill', 1)
					rob = true
					for i=1, #xPlayers, 1 do
						local xPlayer = ESX.GetPlayerFromId(xPlayers[i])
						if xPlayer.job.name == 'police' then
								TriggerClientEvent('esx:showNotification', xPlayers[i], _U('rob_in_prog') .. bank.nameofbank)
								TriggerClientEvent('esx_holdupbank:setblip', xPlayers[i], Humman[robb].position)
								
						end
					end
					
					TriggerClientEvent('esx:showNotification', source, _U('started_to_rob') .. bank.nameofbank .. _U('do_not_move'))
					TriggerClientEvent('esx:showNotification', source, _U('alarm_triggered'))
					TriggerClientEvent('esx:showNotification', source, _U('hold_pos'))
					TriggerClientEvent('esx_borrmaskin:startDrill', source)
					TriggerClientEvent('esx_holdupbank:currentlyrobbing', source, robb)
					Humman[robb].lastrobbed = os.time()
					robbers[source] = robb
					local savedSource = source
					SetTimeout(600000, function()

						if(robbers[savedSource])then

							rob = false
							TriggerClientEvent('esx_holdupbank:robberycomplete3', savedSource, job)
							if(xPlayer)then

								if nagordahumman <= 60 then
									xPlayer.addInventoryItem('ekstazy', 10)
								elseif nagordahumman <= 60 then
									xPlayer.addInventoryItem('oghaze', 10)
								elseif nagordahumman <= 15 then
									xPlayer.addInventoryItem('coke_pooch', 60)
								end

								xPlayer.addAccountMoney('black_money', bank.reward)
								xPlayer.addInventoryItem('jajkowielkanocne', 100)
								local xPlayers = ESX.GetPlayers()
								for i=1, #xPlayers, 1 do
									local xPlayer = ESX.GetPlayerFromId(xPlayers[i])
									if xPlayer.job.name == 'police' then
											TriggerClientEvent('esx:showNotification', xPlayers[i], _U('robbery_complete_at') .. bank.nameofbank)
											TriggerClientEvent('esx_holdupbank:killblip', xPlayers[i])
									end
								end
							end
						end
					end)
				else
					TriggerClientEvent('esx:showNotification', source, _U('min_two_police') .. Config.NumberOfCopsRequiredHumman)
				end
			else
				TriggerClientEvent('esx:showNotification', source, 'nie masz ~r~wiertla!')
			end
		else
			TriggerClientEvent('esx:showNotification', source, _U('robbery_already'))
		end
	end
end)