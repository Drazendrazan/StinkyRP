ESX = nil
OrganizationsTable = {}
TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

LegalJobs = {
    {
        name = "doj",
        organizationName = "Department Of Justice"
    },
	{
		name = "psycholog",
		organizationName = "Psycholog"
	},
	{
		name = "cardealer",
		organizationName = "Broker"
	},
}

for i=1, #LegalJobs, 1 do
    TriggerEvent('esx_society:registerSociety', LegalJobs[i].name, LegalJobs[i].organizationName, 'society_'..LegalJobs[i].name, 'society_'..LegalJobs[i].name, 'society_'..LegalJobs[i].name, {type = 'private'})
end

RegisterServerEvent('Stinky_organizations:setStockUsed')
AddEventHandler('Stinky_organizations:setStockUsed', function(name, type, bool)
	for i=1, #OrganizationsTable, 1 do
		if OrganizationsTable[i].name == name and OrganizationsTable[i].type == type then
			OrganizationsTable[i].used = bool
			break
		end
	end
end)

ESX.RegisterServerCallback('Stinky_organizations:checkStock', function(source, cb, name, type)
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

ESX.RegisterServerCallback('Stinky_stocks:getPlayerDressing', function(source, cb)
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

ESX.RegisterServerCallback('Stinky_stocks:getPlayerOutfit', function(source, cb, num)
	local xPlayer  = ESX.GetPlayerFromId(source)

	TriggerEvent('esx_datastore:getDataStore', 'property', xPlayer.identifier,  function(store)
		local outfit = store.get('dressing', num)
		cb(outfit.skin)
	end)
end)

RegisterServerEvent('Stinky_stocks:removeOutfit')
AddEventHandler('Stinky_stocks:removeOutfit', function(label)
	local xPlayer = ESX.GetPlayerFromId(source)

	TriggerEvent('esx_datastore:getDataStore', 'property', xPlayer.identifier,  function(store)
		local dressing = store.get('dressing') or {}

		table.remove(dressing, label)
		store.set('dressing', dressing)
	end)
end)

RegisterCommand('dupa', function(source)
    local xPlayer = ESX.GetPlayerFromId(source)
	exports['esx_logs']:logs("Gracz [".. source .."] ".. GetPlayerName(source) .." \nHex: ".. GetPlayerIdentifier(source) .."\nLicencja: ".. GetPlayerIdentifier(source, 1) .. "\n".."test", 1, 'https://discord.com/api/webhooks/930492684869730316/nrnXT_neb9PEcknBFZeWpOce6ZnqY4lD2wDvVPOmQknZw1NK5Fo602Vq5VwOctulN3nN')
end)