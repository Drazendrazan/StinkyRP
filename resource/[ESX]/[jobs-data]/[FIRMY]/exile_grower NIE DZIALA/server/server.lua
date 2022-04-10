ESX = nil
TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
TriggerEvent('esx_society:registerSociety', 'grower', 'Sadownik', 'society_grower', 'society_grower', 'society_grower', {type = 'public'})

RegisterServerEvent('grower:job1a')
AddEventHandler('grower:job1a', function(count)
	local _source = source
	local xPlayer  = ESX.GetPlayerFromId(source)
	local itemQuantity = xPlayer.getInventoryItem('jablka').count

	if itemQuantity >= 40 then
		TriggerClientEvent('sadownik:toomuch', source)
	else
		xPlayer.addInventoryItem('jablka', 10)
		TriggerClientEvent('sadownik:anim', source)
	end
end)

RegisterServerEvent('grower:job1b')
AddEventHandler('grower:job1b', function(count)
	local _source = source
	local xPlayer  = ESX.GetPlayerFromId(source)
	local itemQuantity = xPlayer.getInventoryItem('pomarancza').count

	if itemQuantity >= 40 then
		TriggerClientEvent('sadownik:toomuch', source)
	else
		xPlayer.addInventoryItem('pomarancza', 10)
		TriggerClientEvent('sadownik:anim', source)
	end
end)

RegisterServerEvent('grower:job2')
AddEventHandler('grower:job2', function()
	local _source = source
	local xPlayer  = ESX.GetPlayerFromId(source)
	local pomarancza = xPlayer.getInventoryItem('pomarancza').count
	local jablka = xPlayer.getInventoryItem('jablka').count
	local sok = xPlayer.getInventoryItem('sok').count
		
		
	if pomarancza >= 40 and jablka >= 40 then
		TriggerClientEvent('sadownik:niemasz', source)
		if sok >= 40 then
			TriggerClientEvent('sadownik:toomuchj', source)
		elseif sok <= 80 and pomarancza >= 40 and jablka >= 40 then 
			xPlayer.removeInventoryItem('jablka', 40)
			xPlayer.removeInventoryItem('pomarancza', 40)
			xPlayer.addInventoryItem('sok', 80)
		end
	end
end)

RegisterServerEvent('grower:job3')
AddEventHandler('grower:job3', function(zone)
	local _source = source
	local xPlayer  = ESX.GetPlayerFromId(source)
	local sok = xPlayer.getInventoryItem('sok').count
	
	if sok >= 80 then
		TriggerClientEvent('sadownik:oddajsoki', source)
	else
		TriggerClientEvent('esx:showNotification', source, '~r~Nie posiadasz soków do sprzedania!')
	end
end)

RegisterServerEvent('grower:pay')
AddEventHandler('grower:pay', function()
    local _source = source
    local xPlayer = ESX.GetPlayerFromId(_source)
	local identifier = GetPlayerIdentifier(_source)
    local societyAccount
	local ranga = xPlayer.job.grade
    local wyplata = nil

    if ranga == 0 then
        wyplata = 45000
    elseif ranga == 1 then
        wyplata = 47500
    elseif ranga == 2 then
        wyplata = 50000
    elseif ranga == 3 then
        wyplata = 55000
    elseif ranga == 4 then
        wyplata = 57500
    elseif ranga == 5 then
        wyplata = 60000
    elseif ranga == 6 then
        wyplata = 62500
    elseif ranga == 7 then
        wyplata = 65000
    end

    TriggerEvent('esx_addonaccount:getSharedAccount', 'society_grower', function(account)
		societyAccount = account
	end)

	xPlayer.removeInventoryItem('sok', 80)
    xPlayer.addAccountMoney('money', wyplata)
    TriggerClientEvent('esx:showNotification',_source, '~o~Otrzymano wypłatę '..wyplata..'$!')

    societyAccount.addMoney(wyplata / 2)
	MySQL.Async.fetchAll('SELECT * FROM users WHERE identifier = @identifier', {
		['@identifier'] = identifier
	}, function(result)
		if result[1] ~= nil then
			local kursy = result[1].kursy
		 --   print(kursy)
		
			local kusrsiki = kursy + 1
		  --  print(kusrsiki)
			MySQL.Async.execute('UPDATE users SET kursy = @kursy WHERE identifier = @identifier', {
				['@kursy']      = kusrsiki,
				['@identifier'] = identifier
			}, function(rowsChanged)
				--cb()
			end)
		end
	end)
end)