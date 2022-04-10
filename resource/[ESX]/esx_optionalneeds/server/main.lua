ESX = nil

TriggerEvent('esx:getSharedObject', function(obj)
	ESX = obj
end)

ESX.RegisterUsableItem('kamzasmall', function(source)
	local _source = source
	local xPlayer = ESX.GetPlayerFromId(source)

	xPlayer.removeInventoryItem('kamzasmall', 1)
	TriggerClientEvent('esx_optionalneeds:kamzamala', _source)
	TriggerClientEvent('esx:showNotification', source, 'Założono Małą Kamizelke!')

end)

ESX.RegisterUsableItem('kamzaduza', function(source)
	local _source = source
	local xPlayer = ESX.GetPlayerFromId(source)

	xPlayer.removeInventoryItem('kamzaduza', 1)
	TriggerClientEvent('esx_optionalneeds:kamzaduza', _source)
	TriggerClientEvent('esx:showNotification', source, 'Założono Dużą Kamizelke!')

end)

ESX.RegisterUsableItem('beer', function(source)

	local xPlayer = ESX.GetPlayerFromId(source)

	xPlayer.removeInventoryItem('beer', 1)

	TriggerClientEvent('esx_status:add', source, 'drunk', 250000)
	TriggerClientEvent('esx_optionalneeds:onDrink', source)
	TriggerClientEvent('esx:showNotification', source, _U('used_beer'))

end)

ESX.RegisterUsableItem('wodka', function(source)

	local xPlayer = ESX.GetPlayerFromId(source)

	xPlayer.removeInventoryItem('wodka', 1)

	TriggerClientEvent('esx_status:add', source, 'drunk', 250000)
	TriggerClientEvent('esx_optionalneeds:onDrink', source)
	TriggerClientEvent('esx:showNotification', source, _U('used_wodka'))

end)

ESX.RegisterUsableItem('soplica07', function(source)
	local xPlayer = ESX.GetPlayerFromId(source)
	xPlayer.removeInventoryItem('soplica07', 1)

	TriggerClientEvent('esx_status:add', source, 'drunk', 250000)
	TriggerClientEvent('esx_optionalneeds:onDrink', source)
	TriggerClientEvent('esx:showNotification', source, 'Wypiles Soplice')
end)


ESX.RegisterUsableItem('harnas05', function(source)
	local xPlayer = ESX.GetPlayerFromId(source)
	xPlayer.removeInventoryItem('harnas05', 1)

	TriggerClientEvent('esx_status:add', source, 'drunk', 250000)
	TriggerClientEvent('esx_optionalneeds:onDrink', source)
	TriggerClientEvent('esx:showNotification', source, 'Wypiles Harnasia')
end)

ESX.RegisterUsableItem('tequila07', function(source)
	local xPlayer = ESX.GetPlayerFromId(source)
	xPlayer.removeInventoryItem('tequila07', 1)

	TriggerClientEvent('esx_status:add', source, 'drunk', 250000)
	TriggerClientEvent('esx_optionalneeds:onDrink', source)
	TriggerClientEvent('esx:showNotification', source, 'Wypiles teQuile')
end)

ESX.RegisterUsableItem('jackdaniels07', function(source)
	local xPlayer = ESX.GetPlayerFromId(source)
	xPlayer.removeInventoryItem('jackdaniels07', 1)

	TriggerClientEvent('esx_status:add', source, 'drunk', 250000)
	TriggerClientEvent('esx_optionalneeds:onDrink', source)
	TriggerClientEvent('esx:showNotification', source, 'Wypiles Jacka Danielsa')
end)

ESX.RegisterUsableItem('bagniak', function(source)

	local xPlayer = ESX.GetPlayerFromId(source)

	xPlayer.removeInventoryItem('bagniak', 1)

	TriggerClientEvent('esx_status:add', source, 'drunk', 350000)
	--TriggerClientEvent('acidtrip:weed', source)
	DoAcid(20000)
	TriggerClientEvent('esx_optionalneeds:onDrink', source)
	TriggerClientEvent('esx:showNotification', source, _U('used_bagniak'))
	TriggerClientEvent('esx:showNotification', 'Zaczyna ci się kręcić w głowie..')
	Citizen.Wait(200)
	TriggerClientEvent('esx:showNotification','Twoje nerwy wariują..')
	Citizen.Wait(250)
	TriggerClientEvent('esx:showNotification', 'Twoja adrenalina buzuje, czujesz przypływ Haze.')

end)
