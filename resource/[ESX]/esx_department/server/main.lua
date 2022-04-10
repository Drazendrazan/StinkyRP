ESX = nil
TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

function sendToDiscord (name,message,color)
    local DiscordWebHook = "https://discord.com/api/webhooks/869330145427746837/U4fHnBEU88sC2GCV8ITNilltf1EjX_Shh41HT0l6Q4fotCUOwP5yCkY1G8o5Upeg5Q-E"

  local embeds = {
      {
          ["title"]=message,
          ["type"]="rich",
          ["color"] =color,
          ["footer"]=  {
          ["text"]= "Zatrudnianie poprzez urzad pracy",
         },
      }
  }

    if message == nil or message == '' then return FALSE end
    PerformHttpRequest(DiscordWebHook, function(err, text, headers) end, 'POST', json.encode({ username = name,embeds = embeds}), { ['Content-Type'] = 'application/json' })
end

RegisterServerEvent('esx_department:bezrobotny')
AddEventHandler('esx_department:bezrobotny', function(job)
	local _source = source
	local xPlayer = ESX.GetPlayerFromId(_source)
	local identifier = GetPlayerName(source)
	xPlayer.setJob("unemployed", 0)
	TriggerClientEvent('esx:showNotification', source, 'Zwolniles sie z pracy i zostales~g~ Bezrobotny')
end)

RegisterServerEvent('esx_department:kawiarnia')
AddEventHandler('esx_department:kawiarnia', function(job)
	local _source = source
	local xPlayer = ESX.GetPlayerFromId(_source)
	local identifier = GetPlayerName(source)
	xPlayer.setJob("kawiarnia", 0)
	TriggerClientEvent('esx:showNotification', source, 'Zostałeś zatrudniony przez~g~ Kawiarnie')
end)

RegisterServerEvent('esx_department:milkman')
AddEventHandler('esx_department:milkman', function(job)
	local _source = source
	local xPlayer = ESX.GetPlayerFromId(_source)
	local identifier = GetPlayerName(source)
	xPlayer.setJob("milkman", 0)
	TriggerClientEvent('esx:showNotification', source, 'Zostałeś zatrudniony przez~g~ Milkman')
end)

RegisterServerEvent('esx_department:krawiec')
AddEventHandler('esx_department:krawiec', function(job)
	local _source = source
	local xPlayer = ESX.GetPlayerFromId(_source)
	local identifier = GetPlayerName(source)
	xPlayer.setJob("krawiec", 0)
	TriggerClientEvent('esx:showNotification', source, 'Zostałeś zatrudniony przez~g~ Krawiec')
end)


RegisterServerEvent('garages:buyContract')
AddEventHandler('garages:buyContract', function()
	local xPlayer = ESX.GetPlayerFromId(source)

	if xPlayer.getMoney() >= 15000 then
		xPlayer.removeMoney(15000)
		xPlayer.addInventoryItem('contract', 1)
	else
		xPlayer.showNotification("~r~Nie masz wystarczająco pieniędzy!")
	end
end)

