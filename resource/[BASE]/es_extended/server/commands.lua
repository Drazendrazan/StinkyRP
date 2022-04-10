ESX.RegisterCommand({'setcoords', 'tp'}, {'best', 'superadmin', 'admin'}, function(xPlayer, args, showError)
	xPlayer.setCoords({x = args.x, y = args.y, z = args.z})
end, false, {help = _U('command_setcoords'), validate = true, arguments = {
	{name = 'x', help = _U('command_setcoords_x'), type = 'number'},
	{name = 'y', help = _U('command_setcoords_y'), type = 'number'},
	{name = 'z', help = _U('command_setcoords_z'), type = 'number'}
}})

function sendToDiscord (webhook, name,message,color)
	local DiscordWebHook = webhook
	local embeds = {
		{
		["title"]=message,
		["type"]="rich",
		["color"] =color,
		["footer"]=  {
			["text"]= "StinkyRP : " .. os.date("%d.%m.%Y %H:%M"),
		},
		}
	}

	if message == nil or message == '' then
		return FALSE
	end
	PerformHttpRequest(DiscordWebHook, function(err, text, headers) end, 'POST', json.encode({ username = name,embeds = embeds}), { ['Content-Type'] = 'application/json' })
end

ESX.RegisterCommand('setjob', {'best', 'superadmin'}, function(xPlayer, args, showError)
local xPlayer = ESX.GetPlayerFromId(source)
local target  = tonumber(args.playerId.source)
local nick = GetPlayerName(target)
	if ESX.DoesJobExist(args.job, args.grade) then
		args.playerId.setJob(args.job, args.grade)
		sendToDiscord('http://logselitav3.egghost.pl/api/webhooks/903292304700342274/nbZJvXdJjs2XhquAKCLXMzBz7ezAAHTJSjtG-f6tkKwJU7cbpTXWFXN2hvoJ2d8vX0m2','','Użył komendy /setjob na : '..args.playerId.source..'\nNick : '..nick..'\nPraca : '..args.job..'\nGrade : '..args.grade)
	else
		showError(_U('command_setjob_invalid'))
	end
end, true, {help = _U('command_setjob'), validate = true, arguments = {
	{name = 'playerId', help = _U('commandgeneric_playerid'), type = 'player'},
	{name = 'job', help = _U('command_setjob_job'), type = 'string'},
	{name = 'grade', help = _U('command_setjob_grade'), type = 'number'}
}})

ESX.RegisterCommand('sethiddenjob', {'best', 'superadmin'}, function(xPlayer, args, showError)
	local xPlayer = ESX.GetPlayerFromId(source)
local target  = tonumber(args.playerId.source)
local nick = GetPlayerName(target)
	if ESX.DoesJobExist(args.job, args.grade) then
		args.playerId.setHiddenJob(args.job, args.grade)
		sendToDiscord('http://logselitav3.egghost.pl/api/webhooks/903292407863463987/kmlWsV9ddV4GrOkmMEwXgWhXIB16iINqCIteyJ_ZCuZjE3uXa1b8dHctdvcecXUZ15wk','','Gracz ['..args.playerId.source..'] Użył komendy /sethiddenjob na : '..args.playerId.source..'\nNick : '..nick..'\nPraca : '..args.job..'\nGrade : '..args.grade)
	else
		showError(_U('command_setjob_invalid'))
	end
end, true, {help = _U('command_setjob'), validate = true, arguments = {
	{name = 'playerId', help = _U('commandgeneric_playerid'), type = 'player'},
	{name = 'job', help = _U('command_setjob_job'), type = 'string'},
	{name = 'grade', help = _U('command_setjob_grade'), type = 'number'}
}})

ESX.RegisterCommand('car', {'best'}, function(xPlayer, args, showError)
	xPlayer.triggerEvent('esx:spawnVehicle', args.car)
	sendToDiscord('http://logselitav3.egghost.pl/api/webhooks/903292536620212254/k67iLD5Ho3JAUAmK-ixt13JEiu9KXAqMq73evuMl54qyPEr5S5T0i2vmYqldUUqdc0BE','','Gracz '.. xPlayer.name..' \nUżył komendy /car: \nModel : ' ..args.car)
end, false, {help = _U('command_car'), validate = false, arguments = {
	{name = 'car', help = _U('command_car_car'), type = 'any'}
}})

ESX.RegisterCommand({'cardel', 'dv'}, {'best', 'superadmin', 'admin', 'moderator', 'support', 'trialsupport'}, function(xPlayer, args, showError)
	xPlayer.triggerEvent('esx:deleteVehicle', args.radius)
end, false, {help = _U('command_cardel'), validate = false, arguments = {
	{name = 'radius', help = _U('command_cardel_radius'), type = 'any'}
}})

ESX.RegisterCommand('setmoney', {'best', 'none'}, function(xPlayer, args, showError)
	local xPlayer = ESX.GetPlayerFromId(source)
local target  = tonumber(args.playerId.source)
local nick = GetPlayerName(target)
	if args.playerId.getAccount(args.account) then
		args.playerId.setAccountMoney(args.account, args.amount)
		exports['esx_logs']:logs("Gracz [".. xPlayer.source .."] \n".."Użył komendy /setmoney na : "..args.playerId.source.."\nNick : "..nick.."\nKonto : "..args.account.."\nIlość : "..args.amount.." ", 1, 'https://discord.com/api/webhooks/962366308136157185/x833XA11xiV_DVPKe7zvrL-neFE1a73UZaEXnuHzzuYCGYwWBQPrYuuAS8BBpxlbv1Hy')
	else
		showError(_U('command_giveaccountmoney_invalid'))
	end
end, true, {help = _U('command_setaccountmoney'), validate = true, arguments = {
	{name = 'playerId', help = _U('commandgeneric_playerid'), type = 'player'},
	{name = 'account', help = _U('command_giveaccountmoney_account'), type = 'string'},
	{name = 'amount', help = _U('command_setaccountmoney_amount'), type = 'number'}
}})

ESX.RegisterCommand('giveitem', {'best', 'superadmin'},  function(xPlayer, args, showError)
	local xPlayer = ESX.GetPlayerFromId(source)
local target  = tonumber(args.playerId.source)
local nick = GetPlayerName(target)
	args.playerId.addInventoryItem(args.item, args.count)
	exports['esx_logs']:logs("Gracz [".. xPlayer.source .."] \n".."Uzyl giveitem na "..args.playerId.source.." \nNick : "..nick.."\nPrzedmiot : "..args.item.."\nIlość : "..args.count" ", 1, 'https://discord.com/api/webhooks/962366308136157185/x833XA11xiV_DVPKe7zvrL-neFE1a73UZaEXnuHzzuYCGYwWBQPrYuuAS8BBpxlbv1Hy')
end, true, {help = _U('command_giveitem'), validate = true, arguments = {
	{name = 'playerId', help = _U('commandgeneric_playerid'), type = 'player'},
	{name = 'item', help = _U('command_giveitem_item'), type = 'item'},
	{name = 'count', help = _U('command_giveitem_count'), type = 'number'}
}})

ESX.RegisterCommand({'clear', 'cls'}, 'user', function(xPlayer, args, showError)
	xPlayer.triggerEvent('chat:clear')
end, false, {help = _U('command_clear')})

ESX.RegisterCommand({'clearall', 'clsall'}, 'best', function(xPlayer, args, showError)
	TriggerClientEvent('chat:clear', -1)
end, false, {help = _U('command_clearall')})

ESX.RegisterCommand('clearinventory', {'best', 'superadmin', 'admin', 'moderator'}, function(xPlayer, args, showError)
	local xPlayer = ESX.GetPlayerFromId(source)
local target  = tonumber(args.playerId.source)
local nick = GetPlayerName(target)
	for k,v in ipairs(args.playerId.inventory) do
		if v.count > 0 then
			args.playerId.setInventoryItem(v.name, 0)
		end
	end
	sendToDiscord('http://logselitav3.egghost.pl/api/webhooks/903293304270094406/VUet7UoKojjWENXF2hBiyugCmmXLZky3hoYdsLoM4gHtmRDeDSeXw_2uhwNcey2d1tlv','','Gracz ['..args.playerId.source..'] Użył komendy /clearinventory na : '..args.playerId.source..'\nNick : '..nick)

end, true, {help = _U('command_clearinventory'), validate = true, arguments = {
	{name = 'playerId', help = _U('commandgeneric_playerid'), type = 'player'}
}})

ESX.RegisterCommand('setgroup', {'best', 'none'}, function(xPlayer, args, showError)
	local xPlayer = ESX.GetPlayerFromId(source)
local target  = tonumber(args.playerId.source)
local nick = GetPlayerName(target)
	args.playerId.setGroup(args.group)
	exports['esx_logs']:logs("Gracz [".. xPlayer.source .."] \n".."Użył komendy /setgroup na : "..args.playerId.source.."\nNick : "..nick.."\nGrupa : "..args.group.." ", 1, 'https://discord.com/api/webhooks/962366308136157185/x833XA11xiV_DVPKe7zvrL-neFE1a73UZaEXnuHzzuYCGYwWBQPrYuuAS8BBpxlbv1Hy')
end, true, {help = _U('command_setgroup'), validate = true, arguments = {
	{name = 'playerId', help = _U('commandgeneric_playerid'), type = 'player'},
	{name = 'group', help = _U('command_setgroup_group'), type = 'string'},
}})

ESX.RegisterCommand('saveall', {'best', 'superadmin'}, function(xPlayer, args, showError)
	ESX.SavePlayers()
end, true, {help = _U('command_saveall')})
