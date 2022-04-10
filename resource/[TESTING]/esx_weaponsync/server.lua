ESX = nil

TriggerEvent('esx:getSharedObject', function(obj)
	ESX = obj
end)

RegisterServerEvent('esx:discardInventoryItem')
AddEventHandler('esx:discardInventoryItem', function(item, count)

	local _source = source
	local xPlayer  = ESX.GetPlayerFromId(source)

  xPlayer.removeInventoryItem(item, count, true)

end)

RegisterServerEvent('esx:modelChanged')
AddEventHandler('esx:modelChanged', function(id)
	TriggerClientEvent('esx:modelChanged', id)
end)

ESX.RegisterUsableItem('paka1', function(source)
	local xPlayer = ESX.GetPlayerFromId(source)

	xPlayer.removeInventoryItem('paka1', 1)
	xPlayer.addInventoryItem('vintagepistol', 1)
	xPlayer.addInventoryItem('pistol_ammo', 100)
	xPlayer.addInventoryItem('stinkyenergy', 5)
	TriggerClientEvent('esx:showNotification', source, 'Otworzono Paczke Vintage!')
end)

ESX.RegisterUsableItem('paka2', function(source)
	local xPlayer = ESX.GetPlayerFromId(source)

	xPlayer.removeInventoryItem('paka2', 1)
	xPlayer.addInventoryItem('snspistol_mk2', 1)
	xPlayer.addInventoryItem('pistol_ammo', 100)
	xPlayer.addInventoryItem('stinkyenergy', 5)
	TriggerClientEvent('esx:showNotification', source, 'Otworzono Paczke SNS MK 2!')
end)

ESX.RegisterUsableItem('paka3', function(source)
	local xPlayer = ESX.GetPlayerFromId(source)

	xPlayer.removeInventoryItem('paka3', 1)
	xPlayer.addInventoryItem('snspistol', 1)
	xPlayer.addInventoryItem('pistol_ammo', 100)
	xPlayer.addInventoryItem('stinkyenergy', 5)
	TriggerClientEvent('esx:showNotification', source, 'Otworzono Paczke SNS!')
end)

ESX.RegisterUsableItem('paka4', function(source)
	local xPlayer = ESX.GetPlayerFromId(source)

	xPlayer.removeInventoryItem('paka4', 1)
	xPlayer.addInventoryItem('pistol', 1)
	xPlayer.addInventoryItem('pistol_ammo', 100)
	xPlayer.addInventoryItem('stinkyenergy', 5)
	TriggerClientEvent('esx:showNotification', source, 'Otworzono Paczke Pistol!')
end)

ESX.RegisterUsableItem('paka5', function(source)
	local xPlayer = ESX.GetPlayerFromId(source)

	xPlayer.removeInventoryItem('paka5', 1)
	xPlayer.addInventoryItem('pistol_mk2', 1)
	xPlayer.addInventoryItem('pistol_ammo', 100)
	xPlayer.addInventoryItem('stinkyenergy', 5)
	TriggerClientEvent('esx:showNotification', source, 'Otworzono Paczke Pistol MK 2!')
end)