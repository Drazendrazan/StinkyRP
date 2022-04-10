

ESX = nil

TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)


Citizen.CreateThread(function()
	for k, v in pairs(Config["exilecases"]) do
		ESX.RegisterUsableItem(k, function(source)
			local xPlayer = ESX.GetPlayerFromId(source)
			xPlayer.removeInventoryItem(k, 1)
			TriggerClientEvent('mkbuss:open5mscriptscom', source,k)
		end)
	end
end)


RegisterServerEvent('mkbuss:giveReward')
AddEventHandler('mkbuss:giveReward', function (t, data, amount)
	local _source = source
	local xPlayer = ESX.GetPlayerFromId(_source)

	if t == "item" then
		xPlayer.addInventoryItem(data, amount)
	elseif t == "weapon" then
		xPlayer.addWeapon(data, 1)
	elseif t == "money" then
		xPlayer.addMoney(data)
	elseif t == "black_money" then
		xPlayer.addAccountMoney('black_money', data)
	end
	
end)


RegisterServerEvent('exile_boxes:exchange')
AddEventHandler('exile_boxes:exchange', function ()
	local _source = source
	local xPlayer = ESX.GetPlayerFromId(_source)

	if xPlayer.getInventoryItem('jajkowielkanocne').count >= Config.RequiredLegalCase1 then 
		xPlayer.removeInventoryItem('jajkowielkanocne', Config.RequiredLegalCase1)
		xPlayer.addInventoryItem('localchest', 1)
	end
end)

RegisterServerEvent('exile_boxes:exchange2')
AddEventHandler('exile_boxes:exchange2', function ()
	local _source = source
	local xPlayer = ESX.GetPlayerFromId(_source)

	if xPlayer.getInventoryItem('jajkowielkanocne').count >= Config.RequiredLegalCase2 then 
		xPlayer.removeInventoryItem('jajkowielkanocne', Config.RequiredLegalCase2)
		xPlayer.addInventoryItem('crimowa', 1)
	end
end)