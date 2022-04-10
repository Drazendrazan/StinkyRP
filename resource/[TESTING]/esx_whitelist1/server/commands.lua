ESX = nil
TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)




RegisterCommand('wlrefresh', function (source, args, user)
	local xPlayer = ESX.GetPlayerFromId(source)
	if (xPlayer.group == 'best' or xPlayer.group == 'superadmin' or xPlayer.group == 'admin' or xPlayer.group == 'mod' or xPlayer.group == 'support') then
		loadWhiteList(function()
			xPlayer.showNotification('Whitelist przeładowana!')
		end)
	else
		xPlayer.showNotification('Nie posiadasz permisji')
	end
end, false)

RegisterCommand('wladd', function (source, args, user)
	local xPlayer = ESX.GetPlayerFromId(source)
	if (xPlayer.group == 'best' or xPlayer.group == 'superadmin' or xPlayer.group == 'admin' or xPlayer.group == 'mod' or xPlayer.group == 'support') then
		local steamID = 'steam:' .. args[1]:lower()

		if string.len(steamID) ~= 21 then
			TriggerEvent('esx_whitelist:sendMessage', source, '^1SYSTEM', 'Invalid steam ID length!')
			return
		end

		MySQL.Async.fetchAll('SELECT * FROM whitelist WHERE identifier = @identifier', {
			['@identifier'] = steamID
		}, function(result)
			if result[1] ~= nil then
				xPlayer.showNotification('Gracz już posiada whitelist!')
			else
				MySQL.Async.execute('INSERT INTO whitelist (identifier) VALUES (@identifier)', {
					['@identifier'] = steamID
				}, function (rowsChanged)
					table.insert(WhiteList, steamID)
					xPlayer.showNotification('Whitelist dodana!')
				end)
			end
		end)
	else
		xPlayer.showNotification('Nie posiadasz permisji')
	end
end, false)


-- console / rcon can also utilize es:command events, but breaks since the source isn't a connected player, ending up in error messages
AddEventHandler('esx_whitelist:sendMessage', function(source, title, message)
	if source ~= 0 then
		TriggerClientEvent('chat:addMessage', source, { args = { title, message } })
	else
		print('esx_whitelist: ' .. message)
	end
end)