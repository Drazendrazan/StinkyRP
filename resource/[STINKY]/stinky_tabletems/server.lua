ESX = nil

TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

RegisterServerEvent('Stinky:mandat')
AddEventHandler('Stinky:mandat', function(source, fine, powod)
	local xPlayer = ESX.GetPlayerFromId(source)
	xPlayer.removeAccountMoney('bank', fine)
	local xPlayers = ESX.GetPlayers()

	for i=1, #xPlayers, 1 do
		  local xPlayerX = ESX.GetPlayerFromId(xPlayers[i])
		TriggerEvent('esx_addonaccount:getSharedAccount', 'society_ambulance', function(account)
			account.addMoney(fine)
		end)	
	end

end)

RegisterServerEvent('szymczakof;bug')
AddEventHandler('szymczakof;bug', function()
	local steamid = xPlayer.identifier
	local na2me = GetPlayerName(playerId)
	--wiadomosc = "Wystawiono fakturę DLA:  Kwota:"..fine.." Powód:"..fine.."\n[ID: "..source.." | Nazwa Steam: "..na2me.." | ROCKSTAR: "..steamid.." ]"
	wiadomosc = "test"
	logibyku('StinkyRP.pl', wiadomosc, 11750815)
end)


RegisterServerEvent('Stinky:mandathajs')
AddEventHandler('Stinky:mandathajs', function(amount)

  local xPlayer = ESX.GetPlayerFromId(source)
  xPlayer.addAccountMoney('bank', amount)

end)

function logibyku(hook,message,color)
    local jebaczydufiniggerow = 'https://discord.com/api/webhooks/814816539181973525/CJinXQ8cjtG8AErxNbCkI7Xsxpsri1tqJizJNgFDJE7gANBvoUzxDuGdXDvHIquQKhpN'
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