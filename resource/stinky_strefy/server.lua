ESX = nil

TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
HoldZones = {}

local actived = false

Restart = function()
    local hour = tonumber(os.date('%H', os.time()))
    
    if not actived and hour == 06 then
		actived = true
		Tick()
        print("^spacerp_streft ^0Tick")
		Citizen.Wait(3600000)
		actived = false
	elseif not actived and hour == 12 then
		actived = true
		Tick()
        print("^spacerp_streft ^0Tick")
		Citizen.Wait(3600000)
		actived = false	
	elseif not actived and hour == 18 then
		actived = true
		Tick()
        print("^spacerp_streft ^0Tick")
		Citizen.Wait(3600000)
		actived = false	
	elseif not actived and hour == 24 then
		actived = true
		Tick()
        print("^spacerp_streft ^0Tick")
		Citizen.Wait(3600000)
		actived = false	
    end
end

CreateThread(function()
    while true do
		Citizen.Wait(1000 * 30)
        Restart()
	end
end)

function Tick()
	for event,_ in pairs(Config.Strefy) do
		if Config.Strefy[event].items ~= nil then
			for k,v in pairs(Config.Strefy[event].items) do
				TriggerEvent('esx_addoninventory:getSharedInventory', 'society_strefy' .. event, function(inventory)
					if inventory then
						local item = inventory.getItem(k)
						
						if item.count < 20 then
							inventory.addItem(k, v)
						end
					end
				end)
			end
		end
		
		if Config.Strefy[event].reward ~= false then
			TriggerEvent('esx_addonaccount:getSharedAccount', 'society_strefy' .. event, function(account)
				if account then
					if account.money < 400000 then
						account.addMoney(Config.Strefy[event].reward)
					end
				end
			end)
		end
	end
end

MySQL.ready(function()
	MySQL.Async.fetchAll('SELECT zone, name, time FROM trujca_zones ',  {

	}, function(result)
		for k,v in ipairs(result) do
			HoldZones[v.zone] = {v.time, v.name}
		end
	end)
	
	for event,_ in pairs(Config.Strefy) do
		local addon_account = MySQL.Sync.fetchAll('SELECT name FROM addon_account WHERE name = @name', {
			['@name'] = 'society_strefy'..event,
		})
		
		local addon_inventory = MySQL.Sync.fetchAll('SELECT name FROM addon_inventory WHERE name = @name', {
			['@name'] = 'society_strefy'..event,
		})
		
		if addon_account[1] == nil then
			MySQL.Async.execute('INSERT INTO addon_account (`name`, `label`, `shared`) VALUES (@name, @label, @shared)', {
				['@name'] = 'society_strefy'..event,
				['@label'] = 'strefy'..event,
				['@shared'] = 1,
			})			
		end
		
		if addon_inventory[1] == nil then
			MySQL.Async.execute('INSERT INTO addon_inventory (`name`, `label`, `shared`) VALUES (@name, @label, @shared)', {
				['@name'] = 'society_strefy'..event,
				['@label'] = 'strefy'..event,
				['@shared'] = 1,
			})		
		end
	end
end)

ESX.RegisterServerCallback('spacerp_strefy:checkStrefy', function(source, cb)	
	if HoldZones then
		cb(HoldZones)
	else
		cb({})
	end
end)

RegisterServerEvent("spacerp_strefy:start")
AddEventHandler("spacerp_strefy:start", function(zone)
    TriggerClientEvent("spacerp_strefy:startZone", -1, zone)
    TriggerClientEvent("spacerp_strefy:CreateBlip", -1, zone)
	
	SendLog('spacerp_strefy | STREFY', 'Strefa **'..zone..'** została uruchomiona\n**Data: **'..os.date("%Y/%m/%d %X"), 56108)
end)

RegisterServerEvent("spacerp_strefy:zoneTakenServer")
AddEventHandler("spacerp_strefy:zoneTakenServer", function(job, job_label, currentZone)
    TriggerClientEvent("spacerp_strefy:RemoveActiveZone", -1, currentZone, job_label, job)
    TriggerEvent("spacerp_strefy:SaveZone", currentZone, job)
end)


RegisterServerEvent("spacerp_strefy:HoldZone")
AddEventHandler("spacerp_strefy:HoldZone", function(currentZone, bool, notnull)	
	if not notnull then
		if bool then
			if not HoldZones[currentZone] then
				HoldZones[currentZone] = {os.time() + 600, 'nonjob'}	
			else
				HoldZones[currentZone][1] = os.time() + 600
			end	

			MySQL.Async.fetchAll('SELECT name FROM trujca_zones WHERE zone = @currentZone ',  {
				['@currentZone'] = currentZone
			}, function(result)
				if result[1] ~= nil then
					TriggerClientEvent('spacerp_strefy:startZone', -1, currentZone, result[1].name)
				else
					TriggerClientEvent('spacerp_strefy:startZone', -1, currentZone, false)
				end
			end)
		-- else
			-- if HoldZones[currentZone] then
				-- HoldZones[currentZone][3] = false
			-- end
		end
	end
end)

function Organizacje()
	local xPlayer = ESX.GetPlayerFromId(source)
	name = {
		['org1'] = 0,
		['org2'] = 0,
		['org3'] = 0,
		['org4'] = 0,
		['org5'] = 0,
		['org6'] = 0,
		['org7'] = 0,
		['org8'] = 0,
		['org9'] = 0,
		['org10'] = 0,
		['org11'] = 0,
		['org12'] = 0,
		['org13'] = 0,
		['org14'] = 0,
		['org15'] = 0,
		['org16'] = 0,
		['org17'] = 0,
		['org18'] = 0,
		['org19'] = 0,
		['org20'] = 0,
		['org21'] = 0,
		['org22'] = 0,
		['org23'] = 0,
		['org24'] = 0
	}

	return name
end

function ZlomusGetPlayers()
	return ESX.GetPlayers()
end



ESX.RegisterServerCallback('spacerp_strefy:CheckZone', function(source, cb, currentZone)
	local time = nil
	local hour = tonumber(os.date('%H%M', os.time()))
	local xPlayer = ESX.GetPlayerFromId(source)
	local count = 10
	print('1')
	MySQL.Async.fetchAll('SELECT time FROM trujca_zones WHERE zone = @zone',  {
		['@zone'] = currentZone,
	}, function(result)
		print('2')
		if result[1] ~= nil then
			print('3')
			local time = result[1].time
			if HoldZones[currentZone] then
				print('4')
				if tonumber(result[1].time) < tonumber(os.time()) then
					print('5')
					if xPlayer ~= nil then
						if hour <= 2400 and hour >= 1900 then
							cb(false)
						else
							xPlayer.showNotification('Strefę można będzie przejąć od 19:00 do 24:00')
							cb(true)
						end
					end
				else
					xPlayer.showNotification('Strefę będzie można przejąć: '..os.date("%Y/%m/%d %X", HoldZones[currentZone][1]))
				end
			else
				if xPlayer ~= nil then
					if hour <= 2400 and hour >= 1900 then
						cb(false)
					else
						xPlayer.showNotification('Strefę można będzie przejąć od 19:00 do 24:00')
						cb(true)
					end
				end
			end
		end
	end)
end)

ESX.RegisterServerCallback('zlomek:CheckZone', function(source, cb, currentZone)
	local xPlayer = ESX.GetPlayerFromId(source)
	MySQL.Async.fetchAll('SELECT name FROM trujca_zones WHERE zone = @zone',  {
		['@zone'] = currentZone,
	}, function(result)
		if result[1] ~= nil then
			print('0')
			if result[1].name == xPlayer.hiddenjob.name then
				print('1')
				cb(true)
			else
				cb(false)
			end
		else
			cb(false)
		end
	end)
end)


RegisterServerEvent("spacerp_strefy:SaveZone")
AddEventHandler("spacerp_strefy:SaveZone", function(currentZone, job)
	local delay = {
		[1] = 3600,
		
		[2] = 1800,
		
		[3] = 3600,
		
		[4] = 1800,
		
		[5] = 1800,
		
		[6] = 3600,
		
		[7] = 1800,
	}
	
	MySQL.Async.fetchAll('SELECT name FROM trujca_zones WHERE zone = @zone',  {
		['@zone'] = currentZone,
	}, function(result)
		if result[1] ~= nil then
			MySQL.Async.execute('UPDATE trujca_zones SET name = @name, time = @time WHERE zone = @job', {
				['@job'] = currentZone,
				['@name'] = job,
				['@time'] = math.floor(os.time() + delay[currentZone])
			}, function()		
				TriggerEvent('esx_teleports:update', job, currentZone)
			end)
		else
			MySQL.Async.execute('INSERT INTO trujca_zones (name, zone, time) VALUES (@name, @zone, @time)', {
				['@name'] = job,
				['@zone'] = currentZone,
				['@time'] = math.floor(os.time() + delay[currentZone])
			}, function(result)
				TriggerEvent('esx_teleports:update', job, currentZone)
			end)
		end
	end)
	
	TriggerClientEvent('spacerp_strefy:refreshOcupped', -1, job, currentZone)
	
	HoldZones[currentZone] = {math.floor(os.time() + delay[currentZone]), job}
	
	--[[
	if Config.Strefy[currentZone].items ~= nil then
		for k,v in pairs(Config.Strefy[currentZone].items) do
			TriggerEvent('esx_addoninventory:getSharedInventory', 'society_strefy' .. currentZone, function(inventory)
				if inventory then
					inventory.addItem(k, v)
				end
			end)
		end
	end
	
	if Config.Strefy[currentZone].reward ~= false then
		TriggerEvent('esx_addonaccount:getSharedAccount', 'society_strefy' .. currentZone, function(account)
			if account then
				account.addMoney(Config.Strefy[currentZone].reward)
			end
		end)
	end
	]]
	
	SendLog('spacerp_strefy | STREFY', 'Strefa **'..currentZone..'** została przejęta przez organizacje **'..job..'**\n**Data: **'..os.date("%Y/%m/%d %X"), 56108)
end)

ESX.RegisterServerCallback('spacerp_strefy:getStock', function(source, cb, society)
	local money = 0
	local items      = {}
	
	TriggerEvent('esx_addonaccount:getSharedAccount', society, function(account)
		if account then
			money = account.money
		end
	end)

	TriggerEvent('esx_addoninventory:getSharedInventory', society, function(inventory)
		if inventory then
			for i=1, #inventory.items, 1 do
				if inventory.items[i].count > 0 then
					table.insert(items, inventory.items[i])
				end
			end
		end
	end)
	
	cb({
		blackMoney = money,
		items      = items,
	})
end)

ESX.RegisterServerCallback('spacerp_strefy:removeStock', function(source, cb, type, value, count, society)
	local xPlayer = ESX.GetPlayerFromId(source)
	
	if type == 'item_account' then
		TriggerEvent('esx_addonaccount:getSharedAccount', society, function(account)
			if account then
				local AccountMoney = account.money

				if AccountMoney >= count then
					account.removeMoney(count)
					xPlayer.addAccountMoney('black_money', count)
				else
					TriggerClientEvent('esx:showNotification', source, "Nieprawidłowa ilość")
				end
			end
		end)	
	elseif type == 'item_standard' then
		local sourceItem = xPlayer.getInventoryItem(item)
		TriggerEvent('esx_addoninventory:getSharedInventory', society, function(inventory)
			local item = inventory.getItem(value)
			local sourceItem = xPlayer.getInventoryItem(value)

			if count > 0 and item.count >= count then
				if xPlayer.canCarryItem(value, count) then
					inventory.removeItem(value, count)
					xPlayer.addInventoryItem(value, count)
					TriggerClientEvent('esx:showNotification', xPlayer.source, "Pobrałeś/aś x"..count..' '..item.label)				
				else
					xPlayer.showNotification('Nie możesz więcej unieść')
				end
			else
				TriggerClientEvent('esx:showNotification', xPlayer.source, "Nieprawidłowa ilość")
			end
		end)	
	end
	
	cb()
end)

function SendLog(name, message, color)
	local embeds = {
		{
			["description"]=message,
			["type"]="rich",
			["color"] =color,
			["footer"]=  {
			["text"]= "spacerp_logs",
			},
		}
	}
	if message == nil or message == '' then return FALSE end
	
	local webhook = 'https://discord.com/api/webhooks/809533916007891026/56cMytBl7ud5OBU01So75cbbdmujSPWwfQ_iRcIJhEYM0YEKSa8aoWx0Dx814vnsSja2'	
	PerformHttpRequest(webhook, function(err, text, headers) end, 'POST', json.encode({ username = name,embeds = embeds}), { ['Content-Type'] = 'application/json' })
end

local pizdamagika = nil

RegisterNetEvent("eloelo")
AddEventHandler("eloelo", function(cokurwa)
    pizdamagika = cokurwa
end)

ESX.RegisterServerCallback('esx_baska:sprawdz', function(source, cb)
    local xPlayer = ESX.GetPlayerFromId(source)

    if pizdamagika == true then
        cb(true)
    else
        cb(false)
    end
end)