ESX = nil

TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

RegisterCommand('rzadowy', function(source, args, nazwa)
    local xPlayer = ESX.GetPlayerFromId(source)
    local nazwa = xPlayer.getName(source)
    if (xPlayer.group == 'best' or xPlayer.group == 'superadmin' or xPlayer.group == 'admin' or xPlayer.group == 'moderator' or xPlayer.group == 'support' or xPlayer.group == 'trialsupport') then
        if args[1] ~= nil then
            if GetPlayerName(tonumber(args[1])) ~= nil then
                TriggerClientEvent('rzadowy:call', tonumber(args[1]), nazwa)
                TriggerClientEvent('esx:showNotification', source, 'Wezwales Gracza [ '..tonumber(args[1])..' ] '.. xPlayer.name..'')
                TriggerClientEvent('esx:showNotification', tonumber(args[1]), 'Administrator: ~g~'.. nazwa ..'~s~ zaprasza Cię na kanał pomocy')
            end
        else
            TriggerClientEvent('esx:showNotification', source, 'Wpisz ID!')
        end
    else
        TriggerClientEvent('esx:showNotification', source, 'Nie masz permisji!')
    end
end, false)