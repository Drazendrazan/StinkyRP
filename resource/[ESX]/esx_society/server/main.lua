dESX                 = nil
local Jobs = {}
local RegisteredSocieties = {}


TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

function GetSociety(name)
	for i=1, #RegisteredSocieties, 1 do
		if RegisteredSocieties[i].name == name then
			return RegisteredSocieties[i]
		end
	end
end

MySQL.ready(function()
	local result = MySQL.Sync.fetchAll('SELECT * FROM jobs', {})

	for i=1, #result, 1 do
		Jobs[result[i].name]        = result[i]
		Jobs[result[i].name].grades = {}
	end

	local result2 = MySQL.Sync.fetchAll('SELECT * FROM job_grades', {})

	for i=1, #result2, 1 do
		Jobs[result2[i].job_name].grades[tostring(result2[i].grade)] = result2[i]
	end
end)
function getIdentity(source)
	local identifier = GetPlayerIdentifiers(source)[1]
	if identifier == nil then
		DropPlayer(source, "Wystąpił problem z Twoją postacią. Połącz się z serwerem ponownie lub napisz ticket!")
	else
		local result = MySQL.Sync.fetchAll("SELECT * FROM users WHERE identifier = @identifier", {['@identifier'] = identifier})
		if result[1] ~= nil then
			local identity = result[1]

			return {
				identifier = identity['identifier'],
				firstname = identity['firstname'],
				lastname = identity['lastname'],
				dateofbirth = identity['dateofbirth'],	
				sex = identity['sex'],
				height = identity['height'],
				job = identity['job'],
				hiddenjob = identity['hiddenjob'],
				hiddenjob_grade = identity['hiddenjob_grade']
			}
		else
			return nil
		end
	end
end


function getIdentityGPS(source)
	local identifier = GetPlayerIdentifiers(source)[1]
	if identifier == nil then
		DropPlayer(source, "Wystąpił problem z Twoją postacią. Połącz się z serwerem ponownie lub napisz ticket!")
		return {
				firstname = "off",
				lastname = "off"
			}
	else
		local result = MySQL.Sync.fetchAll("SELECT firstname, lastname FROM users WHERE identifier = @identifier", {['@identifier'] = identifier})
		
		if result[1] ~= nil then
			local identity = result[1]
			return {
				firstname = identity.firstname,
				lastname = identity.lastname
			}
		else
			return {
				firstname = "off",
				lastname = "off"
			}
		end
	end
end


AddEventHandler('esx_society:registerSociety', function(name, label, account, datastore, inventory, data)
	local found = false

	local society = {
		name      = name,
		label     = label,
		account   = account,
		datastore = datastore,
		inventory = inventory,
		data      = data,
	}

	for i=1, #RegisteredSocieties, 1 do
		if RegisteredSocieties[i].name == name then
			found = true
			RegisteredSocieties[i] = society
			break
		end
	end

	if not found then
		table.insert(RegisteredSocieties, society)
	end
end)

AddEventHandler('esx_society:getSocieties', function(cb)
	cb(RegisteredSocieties)
end)

AddEventHandler('esx_society:getSociety', function(name, cb)
	cb(GetSociety(name))
end)

RegisterServerEvent('esx_society:withdrawMoney')
AddEventHandler('esx_society:withdrawMoney', function(society, amount)
	local xPlayer = ESX.GetPlayerFromId(source)
	local society = GetSociety(society)
	amount = ESX.Math.Round(tonumber(amount))

	if xPlayer.job.name ~= society.name then
		print(('esx_society: %s attempted to call withdrawMoney!'):format(xPlayer.identifier))
		return
	end

	TriggerEvent('esx_addonaccount:getSharedAccount', society.account, function(account)
		if amount > 0 and account.money >= amount then
			account.removeMoney(amount)
			xPlayer.addMoney(amount)
			TriggerEvent('atlantisNSA:society', society.account, xPlayer.name, " pobranie hajsu: ", tostring(amount))
			TriggerClientEvent('esx:showNotification', xPlayer.source, _U('have_withdrawn', ESX.Math.GroupDigits(amount)))
		else
			TriggerClientEvent('esx:showNotification', xPlayer.source, _U('invalid_amount'))
		end
	end)
end)

RegisterServerEvent('esx_society:withdrawMoney2')
AddEventHandler('esx_society:withdrawMoney2', function(society, amount)
	local xPlayer = ESX.GetPlayerFromId(source)
	local society = GetSociety(society)
	amount = ESX.Math.Round(tonumber(amount))

	if xPlayer.hiddenjob.name ~= society.name then
		--print(('esx_society: %s attempted to call withdrawMoney!'):format(xPlayer.identifier))
		return
	end

	TriggerEvent('esx_addonaccount:getSharedAccount', society.account, function(account)
		if amount > 0 and account.money >= amount then
			account.removeMoney(amount)
			xPlayer.addMoney(amount)
			TriggerEvent('atlantisNSA:society', society.account, xPlayer.name, " pobranie hajsu: ", tostring(amount))
			TriggerClientEvent('esx:showNotification', xPlayer.source, _U('have_withdrawn', ESX.Math.GroupDigits(amount)))
		else
			TriggerClientEvent('esx:showNotification', xPlayer.source, _U('invalid_amount'))
		end
	end)
end)

RegisterServerEvent('esx_society:depositMoney')
AddEventHandler('esx_society:depositMoney', function(society, amount, paying)
	local xPlayer = ESX.GetPlayerFromId(source)
	local society = GetSociety(society)
	amount = ESX.Math.Round(tonumber(amount))

	if paying == 1 then 
		if amount > 0  then
			TriggerEvent('esx_addonaccount:getSharedAccount', society.account, function(account)
				account.addMoney(amount)
				TriggerEvent('atlantisNSA:society', society.account, xPlayer.name, " depozyt hajsu (systemowy): ", tostring(amount))
			end)
		else
			TriggerClientEvent('esx:showNotification', xPlayer.source, _U('invalid_amount'))
		end

	else
		if amount > 0 and xPlayer.getMoney() >= amount  then

			TriggerEvent('esx_addonaccount:getSharedAccount', society.account, function(account)
				xPlayer.removeMoney(amount)
				account.addMoney(amount)
				TriggerEvent('atlantisNSA:society', society.account, xPlayer.name, " depozyt hajsu: ", tostring(amount))
			end)

			TriggerClientEvent('esx:showNotification', xPlayer.source, _U('have_deposited', ESX.Math.GroupDigits(amount)))

		else
			TriggerClientEvent('esx:showNotification', xPlayer.source, _U('invalid_amount'))
		end
	end
	if xPlayer.job.name ~= society.name then
		print(('esx_society: %s attempted to call depositMoney!'):format(xPlayer.identifier))
		return
	end

	
end)

RegisterServerEvent('esx_society:depositMoney2')
AddEventHandler('esx_society:depositMoney2', function(society, amount)
	local xPlayer = ESX.GetPlayerFromId(source)
	local society = GetSociety(society)
	amount = ESX.Math.Round(tonumber(amount))

	if xPlayer.hiddenjob.name ~= society.name then
		--print(('esx_society: %s attempted to call depositMoney!'):format(xPlayer.identifier))
		return
	end

	if amount > 0 and xPlayer.getMoney() >= amount  then
		TriggerEvent('esx_addonaccount:getSharedAccount', society.account, function(account)
			xPlayer.removeMoney(amount)
			account.addMoney(amount)
			TriggerEvent('atlantisNSA:society', society.account, xPlayer.name, " depozyt hajsu: ", tostring(amount))
		end)
		TriggerClientEvent('esx:showNotification', xPlayer.source, _U('have_deposited', ESX.Math.GroupDigits(amount)))
	else
		TriggerClientEvent('esx:showNotification', xPlayer.source, _U('invalid_amount'))
	end
end)

RegisterServerEvent('esx_society:washMoney')
AddEventHandler('esx_society:washMoney', function(society, amount)
	local xPlayer = ESX.GetPlayerFromId(source)
	local account = xPlayer.getAccount('black_money')
	amount = ESX.Math.Round(tonumber(amount))

	if xPlayer.job.name ~= society.name then
		print(('esx_society: %s attempted to call washMoney!'):format(xPlayer.identifier))
		return
	end

	if amount and amount > 0 and account.money >= amount then
		xPlayer.removeAccountMoney('black_money', amount)

		MySQL.Async.execute('INSERT INTO society_moneywash (identifier, society, amount) VALUES (@identifier, @society, @amount)', {
			['@identifier'] = xPlayer.identifier,
			['@society']    = society,
			['@amount']     = amount
		}, function(rowsChanged)
			TriggerClientEvent('esx:showNotification', xPlayer.source, _U('you_have', ESX.Math.GroupDigits(amount)))
		end)

	else
		TriggerClientEvent('esx:showNotification', xPlayer.source, _U('invalid_amount'))
	end

end)

RegisterServerEvent('esx_society:washMoney2')
AddEventHandler('esx_society:washMoney2', function(society, amount)
	local xPlayer = ESX.GetPlayerFromId(source)
	local account = xPlayer.getAccount('black_money')
	amount = ESX.Math.Round(tonumber(amount))

	if xPlayer.hiddenjob.name ~= society.name then
		--print(('esx_society: %s attempted to call washMoney!'):format(xPlayer.identifier))
		return
	end

	if amount and amount > 0 and account.money >= amount then
		local amountToAdd = math.floor(amount*0.9)
		xPlayer.removeAccountMoney('black_money', amount)
		xPlayer.addMoney(amountToAdd)
		TriggerClientEvent('esx:showNotification', xPlayer.source, ("Przeprałeś %s$ i otrzymałeś %s$ czystej gotówki!"):format(amount, amountToAdd))
	else
		TriggerClientEvent('esx:showNotification', xPlayer.source, _U('invalid_amount'))
	end
end)

RegisterServerEvent('esx_society:putVehicleInGarage')
AddEventHandler('esx_society:putVehicleInGarage', function(societyName, vehicle)
	local society = GetSociety(societyName)

	TriggerEvent('esx_datastore:getSharedDataStore', society.datastore, function(store)
		local garage = store.get('garage') or {}

		table.insert(garage, vehicle)
		store.set('garage', garage)
	end)
end)

RegisterServerEvent('esx_society:removeVehicleFromGarage')
AddEventHandler('esx_society:removeVehicleFromGarage', function(societyName, vehicle)
	local society = GetSociety(societyName)

	TriggerEvent('esx_datastore:getSharedDataStore', society.datastore, function(store)
		local garage = store.get('garage') or {}

		for i=1, #garage, 1 do
			if garage[i].plate == vehicle.plate then
				table.remove(garage, i)
				break
			end
		end

		store.set('garage', garage)
	end)
end)

ESX.RegisterServerCallback('esx_society:getSocietyMoney', function(source, cb, societyName)
	local society = GetSociety(societyName)
	--print(societyName, json.encode(society))

	--if society then

		TriggerEvent('esx_addonaccount:getSharedAccount', 'society_'..societyName, function(account)
			cb(account.money)
			
		end)

	--else
		--cb(0)
	--end
end)

ESX.RegisterServerCallback('esx_society:getEmployees', function(source, cb, society)
	if Config.EnableESXIdentity then

		MySQL.Async.fetchAll('SELECT firstname, lastname, identifier, job, job_grade, kursy, odznakakurwa, czas FROM users WHERE job = @job ORDER BY job_grade DESC', {
			['@job'] = society
		}, function (results)
			local employees = {}

			for i=1, #results, 1 do
				print(results[i].identifier)
				table.insert(employees, {
					name       = results[i].firstname .. ' ' .. results[i].lastname,
					identifier = results[i].identifier,
					job = {
						name        = results[i].job,
						label       = Jobs[results[i].job].label,
						grade       = results[i].job_grade,
						grade_name  = Jobs[results[i].job].grades[tostring(results[i].job_grade)].name,
						grade_label = Jobs[results[i].job].grades[tostring(results[i].job_grade)].label,
						kursy		= results[i].kursy,
						czas 		= results[i].czas,
					},
					badge = {
						number        = results[i].odznakakurwa,
					}
				})
			end

			cb(employees)
		end)
	else
		MySQL.Async.fetchAll('SELECT name, identifier, job, job_grade, kursy FROM users WHERE job = @job ORDER BY job_grade DESC', {
			['@job'] = society
		}, function (result)
			local employees = {}

			for i=1, #result, 1 do
				table.insert(employees, {
					name       = result[i].name,
					identifier = result[i].identifier,
					job = {
						name        = result[i].job,
						label       = Jobs[result[i].job].label,
						grade       = result[i].job_grade,
						grade_name  = Jobs[result[i].job].grades[tostring(result[i].job_grade)].name,
						grade_label = Jobs[result[i].job].grades[tostring(result[i].job_grade)].label,
						kursy		= results[i].kursy
					},
					badge = {
						number        = results[i].odznakakurwa,
					}
				})
			end

			cb(employees)
		end)
	end
end)

ESX.RegisterServerCallback('esx_society:hiddenjob', function(source, cb)
	local player = getIdentity(source)
	local hiddenjobname = player.hiddenjob

	cb(hiddenjobname)
end)

RegisterServerEvent('esx_society:setBadge')
AddEventHandler('esx_society:setBadge', function(identifier, amount)
	local xPlayer = ESX.GetPlayerFromId(source)
	local isBoss = xPlayer.job.grade_name == 'boss'
	if isBoss then
		local xTarget = ESX.GetPlayerFromIdentifier(identifier)

		if xTarget then
			TriggerClientEvent('esx:showNotification', xPlayer.source, '~g~Zaktualizowano odznakę dla: ' ..  xTarget.source)
			TriggerClientEvent('esx:showNotification', xTarget.source, '~g~Twoja odznaka została zaktualizowana przez: '.. xPlayer.source)
			MySQL.Async.execute('UPDATE users SET odznakakurwa = @odznakakurwa WHERE identifier = @identifier', {
				['@odznakakurwa']      = amount,
				['@identifier'] = identifier
			}, function(rowsChanged)
			--	cb()
			end)
		else
			TriggerClientEvent('esx:showNotification', xPlayer.source, '~g~Zaktualizowano odznakę!')
			MySQL.Async.execute('UPDATE users SET odznakakurwa = @odznakakurwa WHERE identifier = @identifier', {
				['@odznakakurwa']      = amount,
				['@identifier'] = identifier
			}, function(rowsChanged)
				--cb()
			end)
		end
	else
		print(('esx_society: %s attempted to zajebac komus kursy!!!!'):format(xPlayer.identifier))
		cb()
	end
end)

ESX.RegisterServerCallback('esx_society:getEmployees2', function(source, cb, society)
	if Config.EnableESXIdentity then

		MySQL.Async.fetchAll('SELECT firstname, lastname, identifier, hiddenjob, hiddenjob_grade FROM users WHERE hiddenjob = @hiddenjob ORDER BY hiddenjob_grade DESC', {
			['@hiddenjob'] = society
		}, function (results)
			local employees = {}

			for i=1, #results, 1 do
				table.insert(employees, {
					name       = results[i].firstname .. ' ' .. results[i].lastname,
					identifier = results[i].identifier,
					hiddenjob = results[i].hiddenjob,
					hiddenjob_grade = results[i].hiddenjob_grade
				})
			end

			cb(employees)
		end)
	else
		MySQL.Async.fetchAll('SELECT name, identifier, hiddenjob, hiddenjob_grade FROM users WHERE hiddenjob = @hiddenjob ORDER BY hiddenjob_grade DESC', {
			['@hiddenjob'] = society
		}, function (result)
			local employees = {}

			for i=1, #result, 1 do
				table.insert(employees, {
					name       = result[i].name,
					identifier = result[i].identifier,
					hiddenjob = results[i].hiddenjob,
					hiddenjob_grade = results[i].hiddenjob_grade
				})
			end

			cb(employees)
		end)
	end
end)

ESX.RegisterServerCallback('esx_society:getJob', function(source, cb, society)
	local job    = json.decode(json.encode(Jobs[society]))
	local grades = {}

	for k,v in pairs(job.grades) do
		table.insert(grades, v)
	end

	table.sort(grades, function(a, b)
		return a.grade < b.grade
	end)

	job.grades = grades

	cb(job)
end)

ESX.RegisterServerCallback('esx_society:setJob', function(source, cb, identifier, job, grade, type)
	local xPlayer = ESX.GetPlayerFromId(source)
	local isBoss = xPlayer.job.grade_name == 'boss' or xPlayer.job.grade_name == 'urzednik6' or xPlayer.job.grade_name == 'zcadyrektora' or xPlayer.job.grade_name == 'zcakomenda' or xPlayer.job.grade_name == 'uber' or xPlayer.job.grade_name == 'kierownik' or xPlayer.job.grade_name == 'kapitan3'

	if isBoss then
		local xTarget = ESX.GetPlayerFromIdentifier(identifier)

		if xTarget then
			xTarget.setJob(job, grade)


			if type == 'hire' then
				TriggerClientEvent('esx:showNotification', xTarget.source, _U('you_have_been_hired', job))
			elseif type == 'promote' then
				TriggerClientEvent('esx:showNotification', xTarget.source, _U('you_have_been_promoted'))
			elseif type == 'fire' then
				TriggerClientEvent('esx:showNotification', xTarget.source, _U('you_have_been_fired', xTarget.getJob().label))
			end
			cb()
					else
			MySQL.Async.execute('UPDATE users SET job = @job, job_grade = @job_grade WHERE identifier = @identifier', {
				['@job']        = job,
				['@job_grade']  = grade,
				['@identifier'] = identifier
			}, function(rowsChanged)
				cb()
			end)
		end
	else
		print(('esx_society: %s attempted to setJob'):format(xPlayer.identifier))
		cb()
	end
end)

ESX.RegisterServerCallback('esx_society:zeruj_kursy', function(source, cb, identifier)
	local xPlayer = ESX.GetPlayerFromId(source)
	local isBoss = xPlayer.job.grade_name == 'boss'
	print(identifier)
	if isBoss then
		local xTarget = ESX.GetPlayerFromIdentifier(identifier)

		if xTarget then
			TriggerClientEvent('esx:showNotification', xTarget.source, 'Twoje kursy zostały zresetowwane!')
			MySQL.Async.execute('UPDATE users SET kursy = @kursy WHERE identifier = @identifier', {
				['@kursy']      = '0',
				['@identifier'] = identifier
			}, function(rowsChanged)
				cb()
			end)
		else
			MySQL.Async.execute('UPDATE users SET kursy = @kursy WHERE identifier = @identifier', {
				['@kursy']      = '0',
				['@identifier'] = identifier
			}, function(rowsChanged)
				cb()
			end)
		end
	else
		print(('esx_society: %s attempted to zajebac komus kursy!!!!'):format(xPlayer.identifier))
		cb()
	end
end)

ESX.RegisterServerCallback('esx_society:zeruj_czas', function(source, cb, identifier)
	local xPlayer = ESX.GetPlayerFromId(source)
	local isBoss = xPlayer.job.grade_name == 'boss'
	print(identifier)
	if isBoss then
		local xTarget = ESX.GetPlayerFromIdentifier(identifier)

		if xTarget then
			TriggerClientEvent('esx:showNotification', xTarget.source, 'Twoje czas zostały zresetowwane!')
			MySQL.Async.execute('UPDATE users SET czas = @czas WHERE identifier = @identifier', {
				['@czas']      = '0',
				['@identifier'] = identifier
			}, function(rowsChanged)
				cb()
			end)
		else
			MySQL.Async.execute('UPDATE users SET czas = @czas WHERE identifier = @identifier', {
				['@czas']      = '0',
				['@identifier'] = identifier
			}, function(rowsChanged)
				cb()
			end)
		end
	else
		print(('esx_society: %s attempted to zajebac komus czas!!!!'):format(xPlayer.identifier))
		cb()
	end
end)

ESX.RegisterServerCallback('esx_society:setHiddenJob', function(source, cb, identifier, job, grade, type)
	local xPlayer = ESX.GetPlayerFromId(source)
	local xTarget = ESX.GetPlayerFromIdentifier(identifier)

	if xTarget then
		xTarget.setHiddenJob(job, grade)

		if xTarget.source then


			if type == 'hire' then
				TriggerClientEvent('esx:showNotification', xTarget.source, _U('you_have_been_hired', job))
			elseif type == 'promote' then
				TriggerClientEvent('esx:showNotification', xTarget.source, _U('you_have_been_promoted'))
			elseif type == 'fire' then
				TriggerClientEvent('esx:showNotification', xTarget.source, _U('you_have_been_fired', xTarget.gethiddenjob().label))
			end

			MySQL.Async.execute('UPDATE users SET hiddenjob = @hiddenjob, hiddenjob_grade = @hiddenjob_grade WHERE identifier = @identifier', {
				['@hiddenjob']        = job,
				['@hiddenjob_grade']  = grade,
				['@identifier'] = identifier
			}, function(rowsChanged)

				cb()
			end)
		else
			MySQL.Async.execute('UPDATE users SET hiddenjob = @hiddenjob, hiddenjob_grade = @hiddenjob_grade WHERE identifier = @identifier', {
				['@hiddenjob']        = job,
				['@hiddenjob_grade']  = grade,
				['@identifier'] 	  = identifier
			}, function(rowsChanged)
				cb()
			end)
		end
	else
		MySQL.Async.execute('UPDATE users SET hiddenjob = @hiddenjob, hiddenjob_grade = @hiddenjob_grade WHERE identifier = @identifier', {
			['@hiddenjob']        = job,
			['@hiddenjob_grade']  = grade,
			['@identifier'] 	  = identifier
		}, function(rowsChanged)
			cb()
		end)
	end
end)

RegisterServerEvent('esx_society:giveLicense')
AddEventHandler('esx_society:giveLicense', function(identifier, data)
	MySQL.Async.execute('INSERT INTO user_licenses (owner, type, time) VALUES (@owner, @type, -1)', {
		['@owner'] = identifier,
		['@type']    = data,
	}, function(rowsChanged)
	--	TriggerClientEvent('esx:showNotification', xPlayer.source, _U('you_have', ESX.Math.GroupDigits(amount)))
	end)
end)

RegisterServerEvent('esx_society:getLicense')
AddEventHandler('esx_society:getLicense', function(identifier, data)
	MySQL.Async.execute('DELETE FROM user_licenses WHERE owner = @owner and type = @type', {
		['@owner'] = identifier,
		['@type']  = data,
	}, function(rowsChanged)
	--	TriggerClientEvent('esx:showNotification', xPlayer.source, _U('you_have', ESX.Math.GroupDigits(amount)))
	end)
end)

ESX.RegisterServerCallback('esx_society:getkurwaplayer', function(source, cb, chuj)
	local seu = false
	local sert = false
	local usms = false
	local dtu = false
	local heli = false	
	local nurek = false	
	local aiad = false
	print(chuj)
	MySQL.Async.fetchAll('SELECT * FROM user_licenses WHERE owner = @owner', {
		['@owner'] = chuj,	
	}, function (results2)
		for k,v in pairs (results2) do
			
			if v.type == 'seu' then
				seu = true
			elseif v.type == 'sert' then
				sert = true
			elseif v.type == 'usms' then
				usms = true
			elseif v.type == 'dtu' then
				dtu = true
			elseif v.type == 'heli' then
				heli = true
			elseif v.type == 'nurek' then
				nurek = true
			elseif v.type == 'aiad' then
				aiad = true
			end	
		end
		cb(seu, sert, usms, dtu, heli, nurek, aiad)
	end)
end)

ESX.RegisterServerCallback('esx_society:getEmployeeslic', function(source, cb, society)
	MySQL.Async.fetchAll('SELECT firstname, lastname, identifier, job, job_grade FROM users WHERE job = @job ORDER BY job_grade DESC', {
		['@job'] = society	
	}, function (results)
		local employees = {}
		local count = 0		
		for i=1,99 do if results[i] ~= nil then count = i else break end end
			
			for i=1, #results, 1 do
				print('elo')
				local seu = false
				local sert = false
				local usms = false
				local usms = false
				local dtu = false
				local heli = false	
				local nurek = false	
                local aiad = false
				MySQL.Async.fetchAll('SELECT * FROM user_licenses WHERE owner = @owner', {
					['@owner'] = results[i].identifier,	
				}, function (results2)
					for k,v in pairs (results2) do
						
						if v.type == 'seu' then
							seu = true
						elseif v.type == 'sert' then
							sert = true
						elseif v.type == 'usms' then
							usms = true
						elseif v.type == 'dtu' then
							dtu = true
						elseif v.type == 'heli' then
							heli = true
						elseif v.type == 'nurek' then
							nurek = true
						elseif v.type == 'aiad' then
							aiad = true
						end
					end	
					table.insert(employees, {
						name       = results[i].firstname .. ' ' .. results[i].lastname,
						identifier = results[i].identifier,
						licensess = {
						--	name = {
								seu = seu,
								sert = sert,
								usms = usms,
								dtu = dtu,
								heli = heli,
								nurek = nurek,
								aiad = aiad,
						--	}
						},
	
				})	
				table.sort(employees, function(a, b) return a.name < b.name end)
				if count == i then
					cb(employees)
				end				
			end)	
		end
	end)
end)


ESX.RegisterServerCallback('esx_society:setJobSalary', function(source, cb, job, grade, salary)
	local isBoss = isPlayerBoss(source, job)

	local identifier = GetPlayerIdentifier(source, 0)
	if isBoss then
		if salary <= Config.MaxSalary then
			MySQL.Async.execute('UPDATE job_grades SET salary = @salary WHERE job_name = @job_name AND grade = @grade', {
				['@salary']   = salary,
				['@job_name'] = job,
				['@grade']    = grade
			}, function(rowsChanged)
				Jobs[job].grades[tostring(grade)].salary = salary
				local xPlayers = ESX.GetPlayers()

				for i=1, #xPlayers, 1 do
					local xPlayer = ESX.GetPlayerFromId(xPlayers[i])

 					if xPlayer.job.name == job and xPlayer.job.grade == grade then
						xPlayer.setJob(job, grade)
					end
				end

 				cb()
			end)
		else
			print(('esx_society: %s attempted to setJobSalary over config limit!'):format(identifier))
			cb()
		end
	else
		print(('esx_society: %s attempted to setJobSalary'):format(identifier))
		cb()
	end
end)

ESX.RegisterServerCallback('esx_society:getOnlinePlayers', function(source, cb)
	local xPlayers = ESX.GetPlayers()
	local players  = {}
	
	for i=1, #xPlayers, 1 do
		local xPlayer = ESX.GetPlayerFromId(xPlayers[i])
		table.insert(players, {
			source     = xPlayer.source,
			identifier = xPlayer.identifier,
			name       = xPlayer.source,
			job        = xPlayer.job
		})
	end

	cb(players)
end)

ESX.RegisterServerCallback('esx_society:getOnlinePlayersGPS', function(source, cb)
	local xPlayers = ESX.GetPlayers()
	local players  = {}

	for i=1, #xPlayers, 1 do
		local xPlayer = ESX.GetPlayerFromId(xPlayers[i])
		local moreinfo = getIdentityGPS(xPlayers[i])  		-- more info potrzebne do callbacków na GPS, zeby pobrac imie i nazwisko gracza
		if moreinfo ~= nil then
			table.insert(players, {
				source     = xPlayer.source,
				identifier = xPlayer.identifier,
				name       = xPlayer.name,
				firstname  = moreinfo.firstname,
				lastname   = moreinfo.lastname,
				job        = xPlayer.job
			})
		else
			table.insert(players, {
				source     = xPlayer.source,
				identifier = xPlayer.identifier,
				name       = xPlayer.name,
				firstname  = "off",
				lastname   = "off",
				job        = xPlayer.job
			})
		end
		
		
	end
	cb(players)
end)


ESX.RegisterServerCallback('esx_society:getVehiclesInGarage', function(source, cb, societyName)
	local society = GetSociety(societyName)

	TriggerEvent('esx_datastore:getSharedDataStore', society.datastore, function(store)
		local garage = store.get('garage') or {}
		cb(garage)
	end)
end)

ESX.RegisterServerCallback('esx_society:isBoss', function(source, cb, job)
	cb(isPlayerBoss(source, job))
end)

function isPlayerBoss(playerId, job)
	local xPlayer = ESX.GetPlayerFromId(playerId)

	if xPlayer.job.name == job and xPlayer.job.grade_name == 'boss' or xPlayer.job.grade_name == 'urzednik6' or xPlayer.job.grade_name == 'zcadyrektora' or xPlayer.job.grade_name == 'zcakomenda' or xPlayer.job.grade_name == 'uber' or xPlayer.job.grade_name == 'kierownik' or xPlayer.job.grade_name == 'kapitan3' then
		return true
	else
		print(('esx_society: %s attempted open a society boss menu!'):format(xPlayer.identifier))
		return false
	end
end

function WashMoneyCRON(d, h, m)
	MySQL.Async.fetchAll('SELECT * FROM society_moneywash', {}, function(result)
		for i=1, #result, 1 do
			local society = GetSociety(result[i].society)
			local xPlayer = ESX.GetPlayerFromIdentifier(result[i].identifier)

			-- add society money
			TriggerEvent('esx_addonaccount:getSharedAccount', society.account, function(account)
				account.addMoney(result[i].amount)

			end)

			-- send notification if player is online
			if xPlayer then
				TriggerClientEvent('esx:showNotification', xPlayer.source, _U('you_have_laundered', ESX.Math.GroupDigits(result[i].amount)))
			end

			MySQL.Async.execute('DELETE FROM society_moneywash WHERE id = @id', {
				['@id'] = result[i].id
			})
		end
	end)
end

RegisterCommand('dodawnie123', function()
	TriggerServerEvent('test:123')
end)

RegisterServerEvent('test:123')
AddEventHandler('test:123', function(count)
    local xPlayer = ESX.GetPlayerFromId(source)

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

TriggerEvent('cron:runAt', 3, 0, WashMoneyCRON)
