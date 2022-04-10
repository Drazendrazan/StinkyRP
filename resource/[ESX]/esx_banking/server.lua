ESX = nil

TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

function getIdentity(source)
	local identifier = GetPlayerIdentifiers(source)[1]
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
                        konto = identity['account_number']
			
		}
	else
		return nil
	end
end

function getRandomBankNumber()
    return math.random(11111111,99999999)
end

function getOrGenerateBankNumber (identifier, cb)
   local identifier = identifier
   local bankNumber = getBankNumber(identifier)
   if bankNumber == '0' or bankNumber == nil then
       bankNumber = getRandomBankNumber()
       MySQL.Async.insert("UPDATE users SET account_number = @account_number WHERE identifier = @identifier", { 
           ['@account_number'] = account_number,
           ['@identifier'] = identifier
       }, function ()
           cb(bankNumber)
       end)
   else
       cb(bankNumber)
   end
end

function getBankNumber(identifier)
   local result = MySQL.Sync.fetchAll("SELECT users.account_number FROM users WHERE users.identifier = @identifier", {
       ['@identifier'] = identifier
   })
   if result[1] ~= nil then
       return result[1].account_number
   end
   return nil
end

AddEventHandler('esx:playerLoaded',function(playerId, xPlayer)
   local sourcePlayer = playerId
   local identifier = xPlayer.identifier

   getOrGenerateBankNumber(identifier, function (bankNumber)
       
   end)
end)


RegisterServerEvent('bank:deposit')
AddEventHandler('bank:deposit', function(amount)
	local _source = source
	
	local xPlayer = ESX.GetPlayerFromId(_source)
	if amount == nil or amount <= 0 or amount > xPlayer.getMoney() then
		TriggerClientEvent('bank:result', _source, "error", "Brak środków.")
	else
		xPlayer.removeMoney(amount)
		xPlayer.addAccountMoney('bank', tonumber(amount))
		TriggerClientEvent('bank:result', _source, "success", "Wpłacono.")
		local xPlayer = ESX.GetPlayerFromId(source)
		local steamid = xPlayer.identifier
		local name = GetPlayerName(source)
		wiadomosc = name.." | Bankomat \n[WPŁATA: $"..amount.."] \n[ID: "..source.." | Nazwa: "..name.." | SteamID: "..steamid.." ]" 
		DiscordHookdeposit('packv6.pl', wiadomosc, 11750815)
	end
end)

-- funkcja;
function DiscordHookdeposit(hook,message,color)
    local deposit2 = 'https://discord.com/api/webhook/802731556774608916/Y8clLxwIGXXmIltKA3-M4zU76dvztwEjhcaVqC9sYuHDWuZKD1XqhPpH6pQRYw8SsM-r'
    local embeds = {
                {
            ["title"] = message,
            ["type"] = "rich",
            ["color"] = color,
            ["footer"] = {
				["text"] = 'packv6.pl'
                    },
                }
            }
    if message == nil or message == '' then return FALSE end
    PerformHttpRequest(deposit2, function(err, text, headers) end, 'POST', json.encode({ username = hook,embeds = embeds}), { ['Content-Type'] = 'application/json' })
end

RegisterServerEvent('bank:withdraw')
AddEventHandler('bank:withdraw', function(amount)
	local _source = source
	local xPlayer = ESX.GetPlayerFromId(_source)
	local base = 0
	amount = tonumber(amount)
	base = xPlayer.getAccount('bank').money
	if amount == nil or amount <= 0 or amount > base then
		TriggerClientEvent('bank:result', _source, "error", "Brak środków.")
	else
		xPlayer.removeAccountMoney('bank', amount)
		xPlayer.addMoney(amount)
		TriggerClientEvent('bank:result', _source, "success", "Wypłacono.")
		local xPlayer = ESX.GetPlayerFromId(source)
		local steamid = xPlayer.identifier
		local name = GetPlayerName(source)
		wiadomosc = name.." | Bankomat \n[WYPŁATA: $"..amount.."] \n[ID: "..source.." | Nazwa: "..name.." | SteamID: "..steamid.." ]" 
		DiscordHookwithdraw('packv6.pl', wiadomosc, 11750815)
	end
end)

-- funkcja;
function DiscordHookwithdraw(hook,message,color)
    local withdraw2 = 'https://discord.com/api/webhook/802732083230670898/c3-Ciir09lXKN10nUng-9WXTeN7wn4G8oRuk4HnBd1LelnUjYjCpO4zTi0qqNUhchuqI'
    local embeds = {
                {
            ["title"] = message,
            ["type"] = "rich",
            ["color"] = color,
            ["footer"] = {
				["text"] = 'packv6.pl'
                    },
                }
            }
    if message == nil or message == '' then return FALSE end
    PerformHttpRequest(withdraw2, function(err, text, headers) end, 'POST', json.encode({ username = hook,embeds = embeds}), { ['Content-Type'] = 'application/json' })
end

RegisterServerEvent('bank:balance')
AddEventHandler('bank:balance', function()
	local _source = source
	local xPlayer = ESX.GetPlayerFromId(_source)
	balance = xPlayer.getAccount('bank').money
	TriggerClientEvent('currentbalance1', _source, balance)
end)

-- funkcja;
function DiscordHooktransfer(hook,message,color)
    local transfer2 = 'https://discord.com/api/webhook/802732525101121547/nd4tDIt4Q5_1u3euSPh3HPdFICsZIBEjpsyTnYBBtA3iR59oWOYaMSs0WXh2Wl7hdaU9'
    local embeds = {
                {
            ["title"] = message,
            ["type"] = "rich",
            ["color"] = color,
            ["footer"] = {
				["text"] = 'packv6.pl'
                    },
                }
            }
    if message == nil or message == '' then return FALSE end
    PerformHttpRequest(transfer2, function(err, text, headers) end, 'POST', json.encode({ username = hook,embeds = embeds}), { ['Content-Type'] = 'application/json' })
end

RegisterServerEvent('bank:transfer')
AddEventHandler('bank:transfer', function(to, amountt)
	local _source = source
	local xPlayer = ESX.GetPlayerFromId(_source)
	local xPlayers = ESX.GetPlayers()
	local identifier = xPlayer.identifier
    local steamhex = GetPlayerIdentifier(_source)
	local balance = 0
	local found = false
	MySQL.Async.fetchAll('SELECT * FROM users WHERE account_number = @account_number',
	{ 
		['@account_number'] = to
	},
	function (result)
		if result[1] ~= nil then
			local targetbankaccount = result[1].account_number
			local targetbabkbalance = json.decode(result[1].accounts)
			local targetidentifier = result[1].identifier
			MySQL.Async.fetchAll('SELECT * FROM users WHERE identifier = @identifier',
			{ 
				['@identifier'] = identifier
			}, function (result2)
				if result2[1] ~= nil then
					local sourcebankaccount = result2[1].account_number
					if targetbankaccount == sourcebankaccount then
						TriggerClientEvent('bank:result', _source, "error", "Przelew nieudany.")
						TriggerClientEvent('esx:showNotification', _source, "~r~Przelew nieudany.")
					else
						balance = xPlayer.getAccount('bank').money
						if balance <= 0 or balance < tonumber(amountt) or tonumber(amountt) <= 0 then
							TriggerClientEvent('bank:result', _source, "error", "Przelew nieudany.")
							TriggerClientEvent('esx:showNotification', _source, "~r~Przelew nieudany.")
						else
							local newtargetbabkbalance = targetbabkbalance.bank + amountt
							xPlayer.removeAccountMoney('bank', tonumber(amountt))
							for i=1, #xPlayers, 1 do
								local xPlayerx = ESX.GetPlayerFromId(xPlayers[i])
								if xPlayerx.identifier == targetidentifier then
									xPlayerx.addAccountMoney('bank', tonumber(amountt))
									found = true
									TriggerClientEvent('esx:showNotification', xPlayers[i], "~g~Otrzymales przelew!\nZ numeru konta: ~y~"..sourcebankaccount)
									ESX.SavePlayers()
									local steamid = xPlayer.identifier
									local zsteamid = xPlayerx.identifier
									local zPlayer = ESX.GetPlayerFromId(to)
									local zPlayer1 = '?'
									local name = GetPlayerName(_source)
									wiadomosc = name.." | Bankomat \n[PRZELEW: $"..amountt.."] \n[ ID: ".._source.." | Nazwa: "..name.." | Licencja: "..steamid.." ]\n[ PRZELAŁ PIENIĄDZE DO ID: "..xPlayers[i].." Licencja: "..zsteamid.." ]" 
									DiscordHooktransfer('packv6.pl', wiadomosc, 11750815)
								end
							end
							if not found then
								MySQL.Async.execute('UPDATE users SET accounts = JSON_SET(accounts, "$.bank", @newBank) WHERE account_number = @account_number',
									{
										['@account_number'] = targetbankaccount,
										['@newBank'] = newtargetbabkbalance
									}
								)
								local steamid = xPlayer.identifier
								local name = GetPlayerName(_source)
								wiadomosc = name.." | Bankomat \n[PRZELEW: $"..amountt.."] \n[ ID: "..source.." | Nazwa: "..name.." | Licencja: "..steamid.." ]\n[ PRZELAŁ PIENIĄDZE DO ID: "..xPlayers[i].." Licencja: "..zsteamid.." ]" 
								DiscordHooktransfer('packv6.pl', wiadomosc, 11750815)
							end
							TriggerClientEvent('bank:result', _source, "success", "Pieniadze zostaly przelane na inne konto.")
							TriggerClientEvent('esx:showNotification', _source, "~g~Pieniadze zostaly przelane na inne konto.")
						end
					end
				else
					TriggerClientEvent('bank:result', _source, "error", "Przelew nieudany.")
					TriggerClientEvent('esx:showNotification', _source, "~r~Przelew nieudany.")
				end
			end)
		else
			TriggerClientEvent('bank:result', _source, "error", "Przelew nieudany.")
			TriggerClientEvent('esx:showNotification', _source, "~r~Przelew nieudany.")
		end
	end)
end)





