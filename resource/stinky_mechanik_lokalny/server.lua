ESX = nil

TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)


function sendToDiscord505 (name,message,color)
	local DiscordWebHook = "https://discord.com/api/webhooks/906657379146403850/WxQCRQAItGasnTCg9In4_7Dhyp7lJibhe6f5CUKpC9CKKUEoizodANkTkkdo1pcV_RjY"
	-- Modify here your discordWebHook username = name, content = message,embeds = embeds
  
  local embeds = {
	  {
		  ["title"]=message,
		  ["type"]="rich",
		  ["color"] =color,
		  ["footer"]=  {
			  ["text"]= "ViceRP",
		 },
	  }
  }
  
	if message == nil or message == '' then return FALSE end
	PerformHttpRequest(DiscordWebHook, function(err, text, headers) end, 'POST', json.encode({ username = name,embeds = embeds}), { ['Content-Type'] = 'application/json' })
end

RegisterServerEvent('sandy_repair:naprawa1')
AddEventHandler('sandy_repair:naprawa1', function()
  local _source = source
  local xPlayer  = ESX.GetPlayerFromId(source)
  local kasa = xPlayer.getMoney()
  local price = 3500
  if kasa >= price then
      xPlayer.removeMoney(price)
	  TriggerEvent('esx_addonaccount:getSharedAccount', 'society_mecano', function(account)
		account.addMoney(price * 0.25)
		end)
	  TriggerClientEvent('sandy_repair:enginerepair', _source)
	  sendToDiscord505 (('Lokalny Mechanik'), xPlayer.name .. " [" .. xPlayer.identifier .. "] " .. " Wykupił naprawe i zapłacił 3500$")
  else
  	TriggerClientEvent('esx:showNotification', _source, '~r~Nie masz tyle pieniedzy!')
  end
end)

RegisterServerEvent('sandy_repair:naprawa2')
AddEventHandler('sandy_repair:naprawa2', function()
  local _source = source
  local xPlayer  = ESX.GetPlayerFromId(source)
  local kasa = xPlayer.getMoney()
  local price = 6500
  if kasa >= price then
      xPlayer.removeMoney(price)
	  TriggerEvent('esx_addonaccount:getSharedAccount', 'society_mecano', function(account)
		account.addMoney(price * 0.25)
		end)
	  TriggerClientEvent('sandy_repair:fullrepair', _source)
	  sendToDiscord505 (('Lokalny Mechanik'), xPlayer.name .. " [" .. xPlayer.identifier .. "] " .. " Wykupił naprawe i zapłacił 6500$")
  else
  	TriggerClientEvent('esx:showNotification', _source, '~r~Nie masz tyle pieniedzy!')
  end
end)


