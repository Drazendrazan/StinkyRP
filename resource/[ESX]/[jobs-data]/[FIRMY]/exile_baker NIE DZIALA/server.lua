ESX = nil
TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
TriggerEvent('esx_society:registerSociety', 'baker', 'Piekarz', 'society_baker', 'society_baker', 'society_baker', {type = 'public'})

RegisterServerEvent('exile_baker:removeItemCount')
AddEventHandler('exile_baker:removeItemCount', function(item, itemcount)
    local xPlayer = ESX.GetPlayerFromId(source)
    xPlayer.removeInventoryItem(item, itemcount)
end)

RegisterServerEvent('exile_baker:giveItemCount')
AddEventHandler('exile_baker:giveItemCount', function(item, itemcount)
    local xPlayer = ESX.GetPlayerFromId(source)
    xPlayer.addInventoryItem(item, itemcount)
end)

RegisterServerEvent('exile_baker:changeToAnother')
AddEventHandler('exile_baker:changeToAnother', function(what, what2, cum, cum2)
    local xPlayer = ESX.GetPlayerFromId(source)
    xPlayer.removeInventoryItem(what2, cum)
    xPlayer.addInventoryItem(what, cum2)
end)

RegisterServerEvent('exile_bakerpay')
AddEventHandler('exile_bakerpay', function(jobReward)
    local xPlayer = ESX.GetPlayerFromId(source)
    local identifier = GetPlayerIdentifier(source)
    local societyAccount
    local ranga = xPlayer.job.grade
    local wyplata = nil

    if ranga == 0 then
        wyplata = 45000
    elseif ranga == 1 then
        wyplata = 47500
    elseif ranga == 2 then
        wyplata = 50000
    elseif ranga == 3 then
        wyplata = 55000
    elseif ranga == 4 then
        wyplata = 57500
    elseif ranga == 5 then
        wyplata = 60000
    elseif ranga == 6 then
        wyplata = 62500
    elseif ranga == 7 then
        wyplata = 65000
    end

    TriggerEvent('esx_addonaccount:getSharedAccount', 'society_baker', function(account)
		societyAccount = account
	end)
    societyAccount.addMoney(wyplata / 2)
    xPlayer.addMoney(wyplata)
    xPlayer.removeInventoryItem('breads', 100)
    TriggerClientEvent('esx:showNotification', source, '~w~Otrzymujesz wypłatę ~g~'..wyplata..'$!')
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
