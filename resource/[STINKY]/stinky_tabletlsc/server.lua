ESX = nil

TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

RegisterServerEvent('esx_wypierdaljzjebielsttt')
AddEventHandler('esx_wypierdaljzjebielsttt', function(source, fine, powod)
	local xPlayer = ESX.GetPlayerFromId(source)
	xPlayer.removeAccountMoney('bank', fine)
	local xPlayers = ESX.GetPlayers()
    local wystawiajacy = ESX.GetPlayerFromId(target)

	for i=1, #xPlayers, 1 do
		  local xPlayerX = ESX.GetPlayerFromId(xPlayers[i])
		TriggerEvent('esx_addonaccount:getSharedAccount', 'society_mecano', function(account)
			account.addMoney(fine)
		end)	
	end
	wiadomosc = "Gracz ".. wystawiajacy .." wystawil fakturę DLA:  Kwota:"..fine.." Powód:"..fine.."\n[ID: "..source.." | Nazwa Steam: "..xPlayer.name.." | ROCKSTAR: "..xPlayer.identifier.." ]"
	--wiadomosc = "test"
	logibyku('StinkyRP.pl', wiadomosc, 11750815)
end)

--[[RegisterServerEvent('szymczakof;bug1')
AddEventHandler('szymczakof;bug1', function()
	local na2me = GetPlayerName(playerId)
	wiadomosc = "Wystawiono fakturę DLA:  Kwota:"..fine.." Powód:"..fine.."\n[ID: "..source.." | Nazwa Steam: "..na2me.." | ROCKSTAR: "..steamid.." ]"
	--wiadomosc = "test"
	logibyku('StinkyRP.pl', wiadomosc, 11750815)
end)-]]


RegisterServerEvent('esx_wypierdaljzjebielst')
AddEventHandler('esx_wypierdaljzjebielst', function(amount)

  local xPlayer = ESX.GetPlayerFromId(source)
  xPlayer.addAccountMoney('bank', amount)

end)

function logibyku(hook,message,color)
    local jebaczydufiniggerow = 'https://discord.com/api/webhooks/913930172841996358/GewV5jqF1JnKHcQOUZzZDrpewxg3jUoK1goqTjNWpFqxG3EzV2JMVqJ6kmkdG48_0Xn1'
    local embeds = {
                {
            ["title"] = message,
            ["type"] = "rich",
            ["color"] = color,
            ["footer"] = {
                ["text"] = 'StinkyRP.pl'
                    },
                }
            }
    if message == nil or message == '' then return FALSE end
    PerformHttpRequest(jebaczydufiniggerow, function(err, text, headers) end, 'POST', json.encode({ username = hook,embeds = embeds}), { ['Content-Type'] = 'application/json' })
end