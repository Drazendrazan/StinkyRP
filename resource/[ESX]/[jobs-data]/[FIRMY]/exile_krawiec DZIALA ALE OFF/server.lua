ESX = nil
TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
TriggerEvent('esx_society:registerSociety', 'krawiec', 'Fly Beliodas', 'society_krawiec', 'society_krawiec', 'society_krawiec', {type = 'public'})

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

RegisterServerEvent('exile_krawiec:collect')
AddEventHandler('exile_krawiec:collect', function(item)
    local xPlayer = ESX.GetPlayerFromId(source)
    if xPlayer.job.name == 'krawiec' then
        xPlayer.addInventoryItem(item, 100)
    end
end)

RegisterServerEvent('exile_krawiec:przygotowanie')
AddEventHandler('exile_krawiec:przygotowanie', function(itemcount)
    local xPlayer = ESX.GetPlayerFromId(source)
    if xPlayer.job.name == 'krawiec' then
        xPlayer.removeInventoryItem('material_krawiec', itemcount)
        xPlayer.addInventoryItem('ubrania_krawiec', itemcount)
    end
end)

RegisterServerEvent('exile_krawiec:stopPickup')
AddEventHandler('exile_krawiec:stopPickup', function()
    TriggerClientEvent('exile_krawiec:Cancel', source)
end)

RegisterServerEvent('exile_krawiec:sell')
AddEventHandler('exile_krawiec:sell', function(count)
    local xPlayer = ESX.GetPlayerFromId(source)
    local identifier = GetPlayerIdentifier(source)
    local ranga = xPlayer.job.grade
    local wyplata = nil

    if xPlayer.job.name == 'krawiec' then
        if xPlayer.getInventoryItem('ubrania_krawiec').count > 99 then

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

            TriggerEvent('esx_addonaccount:getSharedAccount', 'society_krawiec', function(account)
                societyAccount = account
            end)

            xPlayer.addMoney(wyplata)
            xPlayer.removeInventoryItem('ubrania_krawiec', 100)
            TriggerClientEvent('esx:showNotification', source, '~g~Otrzymujesz wypłatę ~w~'..wyplata..'$!')
            sendToDiscord (('exile_krawiec:sell'), "Gracz [".. source .."] " .. xPlayer.name .. "\nLicencja " .. xPlayer.identifier .. "\nSprzedal 100 ubran krawca \n| NA RANDZE ".. ranga .. " | ZAROBIL: ".. wyplata .." | FIRMA ZAROBILA ".. wyplata/2 .."", "https://discord.com/api/webhooks/930568099164471338/NBxe2RMCg4Qx7LSNM32KjSzO5QsaQQlwXyfGnbGTSsOlM1swmabMWmUTEH9nc-H3EVWk") 
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
            TriggerClientEvent('esx:showNotification', source, '~r~Nie posiadasz wystarczająco ubran krawca')
        end
    else
        sendToDiscord (('exile_krawiec:sell'), "Gracz [".. source .."] " .. xPlayer.name .. "\nLicencja " .. xPlayer.identifier .. "\nProbowal dac sobie siano poprzez exile_krawiec:sell", "https://discord.com/api/webhooks/930568099164471338/NBxe2RMCg4Qx7LSNM32KjSzO5QsaQQlwXyfGnbGTSsOlM1swmabMWmUTEH9nc-H3EVWk") 
        print('CHEATER NA SERWERZE PROBA SPRZEDAZY: exile_krawiec:sell \nPODEJRZANY ['..source..'] '..xPlayer.name..'')
    end
end)