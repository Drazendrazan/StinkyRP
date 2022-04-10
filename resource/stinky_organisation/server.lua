ESX = nil
OrganizationsTable = {}
local OrganisationsTabela = {}
TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

CreateThread(function()
    for job, data in pairs(Organisations.Organisations) do
        TriggerEvent('esx_society:registerSociety', job, data.Label, 'society_'..job, 'society_'..job, 'society_'..job, {type = 'private'})
    end
end)

MySQL.ready(function()
	LoadOrgs()
end)

LoadOrgs = function()
	local PreAddon = {}
	MySQL.Async.fetchAll('SELECT * FROM addon_organisations', {}, function(result)
		for i=1, #result, 1 do
			table.insert(PreAddon, {
				name = tostring(result[i].name),
				level = tonumber(result[i].level),
				f7 = tonumber(result[i].f7),
				szafka = tonumber(result[i].szafka),
				szafkazubrniami = tonumber(result[i].szafkazubrniami),
				sklep = tonumber(result[i].sklep),
			})
		end
		OrganisationsTabela = PreAddon
		Citizen.Trace('Stinky || Load Organisations\n')
	end)
end

CheckLevel = function(name)
	for i=1, #OrganisationsTabela, 1 do
		local org = OrganisationsTabela[i]
		
		if ((tostring(org.name)) == tostring(name)) then
			Citizen.Trace('Stinky || Check Level\n')
			return (tonumber(org.level) or 0)
		end
	end
end

CheckLevel1 = function(name)
	for i=1, #OrganisationsTabela, 1 do
		local org = OrganisationsTabela[i]
		
		if ((tostring(org.name)) == tostring(name)) then
			Citizen.Trace('Stinky || Check Level\n')
			return (tonumber(org.f7) or 0)
		end
	end
end

CheckLevel2 = function(name)
	for i=1, #OrganisationsTabela, 1 do
		local org = OrganisationsTabela[i]
		
		if ((tostring(org.name)) == tostring(name)) then
			Citizen.Trace('Stinky || Check Level\n')
			return (tonumber(org.szafka) or 0)
		end
	end
end

CheckLevel3 = function(name)
	for i=1, #OrganisationsTabela, 1 do
		local org = OrganisationsTabela[i]
		
		if ((tostring(org.name)) == tostring(name)) then
			Citizen.Trace('Stinky || Check Level\n')
			return (tonumber(org.sklep) or 0)
		end
	end
end

CheckLevel4 = function(name)
	for i=1, #OrganisationsTabela, 1 do
		local org = OrganisationsTabela[i]
		
		if ((tostring(org.name)) == tostring(name)) then
			Citizen.Trace('Stinky || Check Level\n')
			return (tonumber(org.szafkazubrniami) or 0)
		end
	end
end

SetLevel = function(name, newlvl)
	for i=1, #OrganisationsTabela, 1 do
		local org = OrganisationsTabela[i]
		if ((tostring(org.name)) == tostring(name)) then
			org.level = tonumber(newlvl)
		end
		UpdateDb(name, newlvl)
	end
end

SetLevel1 = function(name, allowf7)
	for i=1, #OrganisationsTabela, 1 do
		local org = OrganisationsTabela[i]
		if ((tostring(org.name)) == tostring(name)) then
			org.f7 = tonumber(allowf7)
		end
		UpdateDb1(name, allowf7)
	end
end

UpdateDb = function(name, level)
	MySQL.Async.execute('UPDATE addon_organisations SET level = @new WHERE name = @org',
	{
		['@new'] = level,
		['@org'] = name
	})
	Citizen.Trace('Stinky || Update DataBase\n')
end

UpdateDb1 = function(name, f7)
	MySQL.Async.execute('UPDATE addon_organisations SET f7 = @allowf7 WHERE name = @org',
	{
		['@allowf7'] = 1,
		['@org'] = name
	})
	Citizen.Trace('Stinky || Update DataBase\n')
end

RegisterServerEvent('Stinky:LevelUp1')
AddEventHandler('Stinky:LevelUp1', function(f7)
	local xPlayer = ESX.GetPlayerFromId(source)

	local _money = 0

	if level == tonumber(1) then
		_money = 100000
		allowf7 = 1
	end

	if xPlayer.getAccount('money').money >= _money then
		SetLevel1(xPlayer.hiddenjob.name)
		Citizen.Trace('Stinky || Level Up\n')
	else
		xPlayer.showNotification('~r~Nie posidasz przy sobie wystarczająco gotówki.')
	end
end)

RegisterServerEvent('Stinky:LevelUp')
AddEventHandler('Stinky:LevelUp', function(level)
	local xPlayer = ESX.GetPlayerFromId(source)

	local _money = 0

	if level == tonumber(1) then
		_money = 100000
		_newlevel = 1
	elseif level == tonumber(2) then
		_money = 100000
		_newlevel = 2
	elseif level == tonumber(3) then
		_money = 100000
		_newlevel = 3
	elseif level == tonumber(4) then
		_money = 100000
		_newlevel = 4
	elseif level == tonumber(5) then
		_money = 100000
		_newlevel = 5
	end

	if xPlayer.getAccount('money').money >= _money then
		SetLevel(xPlayer.hiddenjob.name, _newlevel)
		Citizen.Trace('Stinky || Level Up\n')
	else
		xPlayer.showNotification('~r~Nie posidasz przy sobie wystarczająco gotówki.')
	end
end)

ESX.RegisterServerCallback('Stinky:GetLevel', function(source, cb)
	local _source = source
	local xPlayer = ESX.GetPlayerFromId(_source)
	local praca = xPlayer.hiddenjob.name
	local aktualnie = MySQL.Sync.fetchScalar("SELECT COUNT(1) FROM users WHERE `hiddenjob` = '"..praca.."'")

	local max = 0
	local inventory_max = 0
	local clothes_max = 0
	local allow = 0
	local allow1 = 0
	local sklep = 0
	local szafka23 = 0
	local szafkazubrniami = 0
	local level = CheckLevel(xPlayer.hiddenjob.name)
	local f7 = CheckLevel1(xPlayer.hiddenjob.name)
	local szafka = CheckLevel2(xPlayer.hiddenjob.name)
	local sklep = CheckLevel3(xPlayer.hiddenjob.name)
	local szafkazubrniami = CheckLevel4(xPlayer.hiddenjob.name)
	print(level)

	if f7 == tonumber(0) then
		allowf7 = 0
	elseif f7 == tonumber(1) then
		allowf7 = 1
	end

	if level == tonumber(0) then
		max = 5
		inventory_max = 100
		clothes_max = 50
	elseif level == tonumber(1) then
		max = 15
		inventory_max = 250
		clothes_max = 150
	elseif level == tonumber(2) then
		max = 30
		inventory_max = 350
		clothes_max = 250
	elseif level == tonumber(3) then
		max = 45
		inventory_max = 500
		clothes_max = 350
	elseif level == tonumber(4) then
		max = 60
		inventory_max = 750
		clothes_max = 500
	elseif level == tonumber(5) then
		max = 100
		inventory_max = 1000
		clothes_max = 1000
	end
	Citizen.Trace('Stinky || Get Level\n')

	cb(level, szafkazubrniami, szafka, sklep, f7, aktualnie, max, inventory_max, clothes_max)
end)

RegisterServerEvent('Stinky:setStockUsed')
AddEventHandler('Stinky:setStockUsed', function(name, type, bool)
	for i=1, #OrganizationsTable, 1 do
		if OrganizationsTable[i].name == name and OrganizationsTable[i].type == type then
			OrganizationsTable[i].used = bool
			break
		end
	end
end)

RegisterServerEvent('Stinky:saveOutfit')
AddEventHandler('Stinky:saveOutfit', function(label, skin, organizacja)
	local xPlayer = ESX.GetPlayerFromId(source)
	print(label, skin, organizacja)
	TriggerEvent('esx_datastore:getSharedDataStore', organizacja, function(store)
		local dressing = store.get('dressing')

		if dressing == nil then
			dressing = {}
		end

		table.insert(dressing, {
			label = label,
			skin  = skin
		})

		store.set('dressing', dressing)
	end)
end)

ESX.RegisterServerCallback('Stinky:getPlayerDressing', function(source, cb, organizacja)
	local xPlayer  = ESX.GetPlayerFromId(source)
	if xPlayer then
		TriggerEvent('esx_datastore:getSharedDataStore', organizacja, function(store)
			if store then
				local count  = store.count('dressing')
				local labels = {}

				for i=1, count, 1 do
					local entry = store.get('dressing', i)
					table.insert(labels, entry.label)
				end

				cb(labels)
			end
		end)
	end
end)

RegisterServerEvent('Stinky:removeOutfit')
AddEventHandler('Stinky:removeOutfit', function(label, organizacja)
	local xPlayer = ESX.GetPlayerFromId(source)
	if xPlayer and xPlayer.hiddenjob.name == organizacja then
		TriggerEvent('esx_datastore:getSharedDataStore', organizacja, function(store)
			local dressing = store.get('dressing') or {}

			table.remove(dressing, label)
			store.set('dressing', dressing)
		end)
	end
end)

ESX.RegisterServerCallback('Stinky:getPlayerOutfit', function(source, cb, num, organizacja)
	local xPlayer  = ESX.GetPlayerFromId(source)
	if xPlayer then
		TriggerEvent('esx_datastore:getSharedDataStore', organizacja, function(store)
			if store then
				local outfit = store.get('dressing', num)
				cb(outfit.skin)
			end
		end)
	end
end)

RegisterServerEvent('Stinky:buyItem')
AddEventHandler('Stinky:buyItem', function(what)
	local _source = source
	local xPlayer = ESX.GetPlayerFromId(_source)
	if what == 'pistol' then
		if xPlayer.getAccount(Organisations.Organisations[xPlayer.hiddenjob.name].Contract.Utils.Account).money >= Organisations.Organisations[xPlayer.hiddenjob.name].Contract.Utils.Price then
			xPlayer.removeAccountMoney(Organisations.Organisations[xPlayer.hiddenjob.name].Contract.Utils.Account, Organisations.Organisations[xPlayer.hiddenjob.name].Contract.Utils.Price)
			Citizen.Wait(100)
			xPlayer.addInventoryItem(Organisations.Organisations[xPlayer.hiddenjob.name].Contract.Utils.Weapon, 1)
			xPlayer.showNotification('~o~Zakupiłeś kontrakt na broń: '..Organisations.Organisations[xPlayer.hiddenjob.name].Contract.Utils.Label)
		else
			xPlayer.showNotification('~r~Nie posiadasz wystarczającej ilości gotówki')
		end
	else
		if xPlayer.getAccount(Organisations.Organisations[xPlayer.hiddenjob.name].Contract.Utils.Ammo.Account).money >= Organisations.Organisations[xPlayer.hiddenjob.name].Contract.Utils.Ammo.Price then
			xPlayer.removeAccountMoney(Organisations.Organisations[xPlayer.hiddenjob.name].Contract.Utils.Ammo.Account, Organisations.Organisations[xPlayer.hiddenjob.name].Contract.Utils.Ammo.Price)
			Citizen.Wait(100)
			xPlayer.addInventoryItem('pistol_ammo', Organisations.Organisations[xPlayer.hiddenjob.name].Contract.Utils.Ammo.Number)
			xPlayer.showNotification('~o~Zakupiłeś amunicję w ilości: '..Organisations.Organisations[xPlayer.hiddenjob.name].Contract.Utils.Ammo.Number.. ' ~g~za: $'..Organisations.Organisations[xPlayer.hiddenjob.name].Contract.Utils.Ammo.Price)
		else
			xPlayer.showNotification('~r~Nie posiadasz wystarczającej ilości gotówki')
		end
	end
end)

ESX.RegisterServerCallback('Stinky:checkStock', function(source, cb, name, type)
	local check, found
	if #OrganizationsTable > 0 then
        for i=1, #OrganizationsTable, 1 do
			if OrganizationsTable[i].name == name and OrganizationsTable[i].type == type then
				check = OrganizationsTable[i].used
				found = true
				break
			end
		end
		if found == true then
			cb(check)
		else
			table.insert(OrganizationsTable, {name = name, type = type, used = true})
			cb(false)
		end
	else
		table.insert(OrganizationsTable, {name = name, type = type, used = true})
		cb(false)
	end
end)

ESX.RegisterServerCallback('Stinky:getPlayerDressing', function(source, cb)
	local xPlayer  = ESX.GetPlayerFromId(source)
	TriggerEvent('esx_datastore:getDataStore', 'property', xPlayer.identifier, function(store)
		local count  = store.count('dressing')
		local labels = {}
		for i=1, count, 1 do
			local entry = store.get('dressing', i)
			table.insert(labels, entry.label)
		end

		cb(labels)
	end)
end)

ESX.RegisterServerCallback('Stinky:getPlayerOutfit', function(source, cb, num)
	local xPlayer  = ESX.GetPlayerFromId(source)

	TriggerEvent('esx_datastore:getDataStore', 'property', xPlayer.identifier,  function(store)
		local outfit = store.get('dressing', num)
		cb(outfit.skin)
	end)
end)

RegisterServerEvent('Stinky:removeOutfit')
AddEventHandler('Stinky:removeOutfit', function(label)
	local xPlayer = ESX.GetPlayerFromId(source)

	TriggerEvent('esx_datastore:getDataStore', 'property', xPlayer.identifier,  function(store)
		local dressing = store.get('dressing') or {}

		table.remove(dressing, label)
		store.set('dressing', dressing)
	end)
end)

RegisterServerEvent('Stinky:CheckHeadBag')
AddEventHandler('Stinky:CheckHeadBag', function()
	local _source = source
    local xPlayer = ESX.GetPlayerFromId(_source)
	if xPlayer.getInventoryItem('headbag').count >= 1 then
		TriggerClientEvent('esx_worek:naloz', _source)
	else
		TriggerClientEvent('esx:showNotification', _source, '~o~Nie posiadasz przedmiotu worek przy sobie aby rozpocząć interakcję z workiem.')
	end
end)

RegisterServerEvent("Stinky:checkUse")
AddEventHandler("Stinky:checkUse", function(coords)
    local xPlayer = ESX.GetPlayerFromId(source)
	for k, v in pairs(Organisations.Jobs) do
		if v == xPlayer.hiddenjob.name then
			TriggerClientEvent('Stinky:setBlip', -1, coords, xPlayer.hiddenjob.name)
			break
		end
	end
end)