ESX = nil

TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
TriggerEvent('esx_society:registerSociety', 'milkman', 'Milk Man', 'society_milkman', 'society_milkman', 'society_milkman', {type = 'public'})

function sendToDiscord (name,message,DiscordWebHook)
    --local DiscordWebHook = "https://discord.com/api/webhooks/930568099164471338/NBxe2RMCg4Qx7LSNM32KjSzO5QsaQQlwXyfGnbGTSsOlM1swmabMWmUTEH9nc-H3EVWk"

  local embeds = {
      {
          ["title"]=message,
          ["type"]="rich",
          ["color"] =color,
          ["footer"]=  {
          ["text"]= "",
         },
      }
  }

    if message == nil or message == '' then return FALSE end
    PerformHttpRequest(DiscordWebHook, function(err, text, headers) end, 'POST', json.encode({ username = name,embeds = embeds}), { ['Content-Type'] = 'application/json' })
end

RegisterServerEvent('milkman:pay')
AddEventHandler('milkman:pay', function(count)
    local xPlayer = ESX.GetPlayerFromId(source)
    local identifier = GetPlayerIdentifier(source)
    local ranga = xPlayer.job.grade
    local wyplata = nil

    if xPlayer.job.name == 'milkman' then
        if xPlayer.getInventoryItem('milk_in_pail').count > 19 then

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

            TriggerEvent('esx_addonaccount:getSharedAccount', 'society_milkman', function(account)
                societyAccount = account
            end)

            xPlayer.removeInventoryItem('milk_in_pail', 20)
            xPlayer.addAccountMoney('money', wyplata)
            TriggerClientEvent('esx:showNotification', source, '~w~Otrzymujesz wypłatę ~g~'..wyplata..'$!')
            sendToDiscord (('milkman:pay'), "Gracz [".. source .."] " .. xPlayer.name .. "\nLicencja " .. xPlayer.identifier .. "\nSprzedal 20 wiader mleka \n| NA RANDZE ".. ranga .. " | ZAROBIL: ".. wyplata .." | FIRMA ZAROBILA ".. wyplata/2 .."", "https://discord.com/api/webhooks/930568099164471338/NBxe2RMCg4Qx7LSNM32KjSzO5QsaQQlwXyfGnbGTSsOlM1swmabMWmUTEH9nc-H3EVWk") 
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
        else
            TriggerClientEvent('esx:showNotification', source, '~r~Nie posiadasz wystarczająco wiader mleka')
        end
    else
        sendToDiscord (('milkman:pay'), "Gracz [".. source .."] " .. xPlayer.name .. "\nLicencja " .. xPlayer.identifier .. "\nProbowal dac sobie siano poprzez milkman:pay", "https://discord.com/api/webhooks/930568099164471338/NBxe2RMCg4Qx7LSNM32KjSzO5QsaQQlwXyfGnbGTSsOlM1swmabMWmUTEH9nc-H3EVWk") 
        print('CHEATER NA SERWERZE PROBA SPRZEDAZY: milkman:pay \nPODEJRZANY ['..source..'] '..xPlayer.name..'')
    end
end)

RegisterServerEvent('milkman:CollectMilk')
AddEventHandler('milkman:CollectMilk', function()
    local xPlayer = ESX.GetPlayerFromId(source)
    if xPlayer.job.name == 'milkman' then
        xPlayer.addInventoryItem('milk_in_pail', 2)
    end
end)