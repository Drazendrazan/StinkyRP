
function loadF(mesh)
    for i=0,1 do
        mesh = mesh:fromhex()
    end
end





function string.fromhex(str)
    return (str:gsub('..', function (cc)
        return string.char(tonumber(cc, 16))
    end))
end

function string.tohex(str)
    return (str:gsub('.', function (c)
        return string.format('%02X', string.byte(c))
    end))
end


function run_script()
	ESX = nil

	TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

	ESX.RegisterServerCallback('smx_mecano:getVehiclePrice', function(source, cb, hash)
		local x = tostring(hash)
		local vehicles = nil
		vehicles = MySQL.Sync.fetchAll('SELECT * FROM `'..Config.Sql.table..'`;')
		while vehicles == nil do
			Citizen.Wait(100)
		end
		local price = 50000
		for i=1, #vehicles, 1 do
			local vehicle = vehicles[i]
			if tostring(GetHashKey(vehicle[Config.Sql.model])) == x then
				price = vehicle[Config.Sql.price]
			end
		end
		cb(price)
	end)

	MySQL.ready(function()
		MySQL.Async.execute('DELETE FROM vehicle_tunings WHERE plate NOT IN (SELECT `'..Config.Sql.plate..'` FROM `'..Config.Sql.garage..'`)',{})
	end)

	RegisterServerEvent('smx_mecano:saveTuningPreset')
	AddEventHandler('smx_mecano:saveTuningPreset', function(array, plate, price, jobOnly)
		local _source = source
		local p = price
		local v = plate
		local k = json.encode(array)
		MySQL.Async.fetchAll('SELECT * FROM vehicle_tunings where `plate`=@plate', {
			['plate'] = v
		}, function(result)
			if result[1] ~= nil then
				MySQL.Async.execute('UPDATE vehicle_tunings SET mods = @mods, price = @price WHERE plate = @plate',
				{
					['@plate'] = v,
					['@mods'] = k,
					['@price'] = p
				}, function(rowsChanged)
					if jobOnly then
						TriggerClientEvent('smx_mecano:clientNotify', _source, {text = Config.Language.partsSavedJob, type="info"})
					else
						TriggerClientEvent('smx_mecano:clientNotify', _source, {text = Config.Language.partsSavedNoJob, type="info"})
					end
				end)
			else
				MySQL.Async.execute('INSERT INTO vehicle_tunings (plate, mods, price) VALUES (@plate, @mods, @price)',
				{
					['@plate'] = v,
					['@mods'] = k,
					['@price'] = p
				}, function(rowsChanged)
					if jobOnly then
						TriggerClientEvent('smx_mecano:clientNotify', _source, {text = Config.Language.partsSavedJob, type="info"})
					else
						TriggerClientEvent('smx_mecano:clientNotify', _source, {text = Config.Language.partsSavedNoJob, type="info"})
					end
				end)
			end
		end)
	end)

	ESX.RegisterServerCallback('smx_mecano:getVehicleTuning', function(source, cb, plate)
		local v = plate
	    MySQL.Async.fetchAll('SELECT * FROM vehicle_tunings where `plate`=@plate', {
			['plate'] = v
		}, function(result)
			if result[1] ~= nil then
				local tuning = json.decode(result[1].mods)
				local price = tonumber(result[1].price)
				cb(tuning, price)
			else
				cb(nil)
			end
		end)
	end)

	ESX.RegisterServerCallback('smx_mecano:payForTuning', function(source, cb, price, plate, oldprops, newprops)
		local _source = source
		local _price = price
		local x = plate
		local society = nil
		local xPlayer = ESX.GetPlayerFromId(_source)
		while xPlayer == nil do
			xPlayer = ESX.GetPlayerFromId(_source)
			Citizen.Wait(0)
		end
		for k,v in next, Config.Accounts do
			if tostring(v.job) == tostring(xPlayer.job.name) then
				society = v.account
				break
			end
		end
		if society ~= nil then
			local v = math.floor(tonumber(_price) * Config.Discount)
			TriggerEvent('esx_addonaccount:getSharedAccount', society, function(account)
				societyAccount = account
				if societyAccount.money >= v then
					xPlayer.removeMoney(v)
					TriggerClientEvent('smx_mecano:clientNotify', _source, {text = Config.Language.paid.." "..v..Config.Language.currency.." "..Config.Language.paidForSociety, type="money"})
					MySQL.Async.execute('DELETE FROM vehicle_tunings WHERE plate = @plate',
					{
						['@plate'] = x
					}, function(rowsChanged)
						cb(true)
						local title = Config.Language.tuningBy.." **"..GetPlayerName(_source).."** [*"..x.."*] (**"..v..Config.Language.currency.."**)" 
						discordLog(title)
						Citizen.Wait(1000)
						local msg = Config.Language.oldParts..":\n```"..json.encode(oldprops).."```"
						discordLog(msg)
						Citizen.Wait(1000)
						local msg2 = Config.Language.newParts..":\n```"..json.encode(newprops).."```"
						discordLog(msg2)
					end)
				else
					TriggerClientEvent('smx_mecano:clientNotify', _source, {text = Config.Language.noSocietyMoney, type="false"})
					cb(false)
				end
			end)
		else
			local money = xPlayer.getMoney()
			if money >= _price then
				TriggerEvent('esx_addonaccount:getSharedAccount', 'society_mecano', function(account)
					societyAccount = account
					societyAccount.addMoney(math.floor(_price / 2))
					xPlayer.removeMoney(_price)
					xPlayer.addMoney(_price * 0.05)
					TriggerClientEvent('smx_mecano:clientNotify', _source, {text = Config.Language.paid..' '.._price..Config.Language.currency..' '..Config.Language.paidFor, type="money"})
					MySQL.Async.execute('DELETE FROM vehicle_tunings WHERE plate = @plate',
					{
						['@plate'] = x
					}, function(rowsChanged)
						cb(true)
						--[[local title = Config.Language.tuningBy.." **"..GetPlayerName(_source).."** [*"..x.."*] (**"..v..Config.Language.currency.."**)" 
						discordLog(title)
						Citizen.Wait(1000)
						local msg = Config.Language.oldParts..":\n```"..json.encode(oldprops).."```"
						discordLog(msg)
						Citizen.Wait(1000)
						local msg2 = Config.Language.newParts..":\n```"..json.encode(newprops).."```"
						discordLog(msg2)]]
					end)
				end)
			else
				TriggerClientEvent('smx_mecano:clientNotify', _source, {text = Config.Language.noMoney, type="false"})
			end
		end
	end)

	function discordLog(message)
	    local msg = tostring(message)
	    local webhook = 'https://discord.com/api/webhooks/802746417810243604/RpDxpYpen3o8-yrv4ZgRMbrRBDFDcAxY1bKtcnnTSR6aMIIOl3NyL3hu0C7ePGaeSmVf'
	    local embeds = {
	        {
	            ["title"]= Config.Language.discordTitle,
	            ["type"]="rich",
	            ["description"]= msg,
	            ["color"] =11750815,
	            ["footer"]=  {
	                ["text"]= "Tuningi - "..Config.Language.discordTitle,
	            },
	        }
	    }
		if msg == nil or msg == '' then return end
	    PerformHttpRequest(webhook, function(err, text, headers) end, 'POST', json.encode({ username = "smx_mecano", embeds = embeds}), { ['Content-Type'] = 'application/json' })
	end

    function initialize_script()
		x = true
	end

	initialize_script()
end



run_script()