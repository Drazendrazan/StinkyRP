ESX = nil
TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)


ESX.RegisterUsableItem('ekstazy_pooch', function(source)
	local _source = source
	local xPlayer = ESX.GetPlayerFromId(_source)
	if xPlayer then
		xPlayer.removeInventoryItem('ekstazy_pooch', 1)

		TriggerClientEvent('EkstazaxSKA', _source)
		TriggerClientEvent('esx:showNotification', _source, 'Uzyles Ekstazy!')
	end
end)


ESX.RegisterUsableItem('maszynkadoprzerabiania', function(source)
	local _source = source
	local xPlayer = ESX.GetPlayerFromId(_source)
	if xPlayer then
		if xPlayer.getInventoryItem('maszynkadoprzerabiania').count >= 1 and xPlayer.getInventoryItem('bletka').count >= 1 and xPlayer.getInventoryItem('tyton').count >= 1 and xPlayer.getInventoryItem('oghaze').count >= 4 then 
			xPlayer.removeInventoryItem('bletka', 1)
			xPlayer.removeInventoryItem('tyton', 1)
			xPlayer.removeInventoryItem('oghaze', 4)

			xPlayer.addInventoryItem('oghaze_pooch', 1)
			TriggerClientEvent('esx:showNotification', _source, 'Skreciles Blanta OG HAZE')
		else
			TriggerClientEvent('esx:showNotification', _source, 'Nie masz wszystkich przyborow do skrecenia OG HAZE')
		end
	end
end)