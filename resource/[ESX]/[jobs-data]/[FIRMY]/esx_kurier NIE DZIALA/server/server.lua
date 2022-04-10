ESX = nil

TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
TriggerEvent('esx_society:registerSociety', 'gopostal', 'Go Postal', 'society_gopostal', 'society_gopostal', 'society_gopostal', {type = 'public'})

RegisterServerEvent('esx_kurier:pay')
AddEventHandler('esx_kurier:pay', function()
    local _source = source
    local xPlayer = ESX.GetPlayerFromId(_source)
    local identifier = GetPlayerIdentifier(_source)
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

    TriggerEvent('esx_addonaccount:getSharedAccount', 'society_gopostal', function(account)
		societyAccount = account
	end)

    xPlayer.addMoney(wyplata)
    TriggerClientEvent('esx:showNotification',_source, '~o~Otrzymano wypłatę '..wyplata..'$!')

    societyAccount.addMoney(wyplata / 2)
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