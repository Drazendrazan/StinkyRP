ESX = nil
TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
TriggerEvent('esx_society:registerSociety', 'RPM', 'RPM', 'society_rpm', 'society_rpm', 'society_rpm', {type = 'public'})

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

RegisterServerEvent('exile_rpm:removeItemCount')
AddEventHandler('exile_rpm:removeItemCount', function(item, itemcount)
    local xPlayer = ESX.GetPlayerFromId(source)
    xPlayer.removeInventoryItem(item, itemcount)
end)

RegisterServerEvent('exile_rpm:giveItem')
AddEventHandler('exile_rpm:giveItem', function(item)
    local xPlayer = ESX.GetPlayerFromId(source)
    if xPlayer.job.name == 'rpm' then
        xPlayer.addInventoryItem(item, 100)
    end
end)

RegisterServerEvent('exile_rpm:przygotowanie')
AddEventHandler('exile_rpm:przygotowanie', function(itemcount)
    local xPlayer = ESX.GetPlayerFromId(source)
    if xPlayer.job.name == 'rpm' then
        xPlayer.removeInventoryItem('rpm_element1', 100)
        xPlayer.addInventoryItem('rpm_element2', 20)
    end
end)

RegisterServerEvent('exile_rpm:stopPickup')
AddEventHandler('exile_rpm:stopPickup', function()
    TriggerClientEvent('exile_rpm:Cancel', source)
end)

RegisterServerEvent('exile_rpm:sell')
AddEventHandler('exile_rpm:sell', function(count)

    local xPlayer = ESX.GetPlayerFromId(source)
    local _source = source
    local identifier = GetPlayerIdentifier(source)
    local ranga = xPlayer.job.grade
    local wyplata = nil

    if xPlayer.job.name == 'rpm' then
        if xPlayer.getInventoryItem('rpm_element2').count >= 19 then

            if ranga == 0 then
                wyplata = 24000
            elseif ranga == 1 then
                wyplata = 26000
            elseif ranga == 2 then
                wyplata = 28000
            elseif ranga == 3 then
                wyplata = 30000
            elseif ranga == 4 then
                wyplata = 32000
            elseif ranga == 5 then
                wyplata = 34000
            elseif ranga == 6 then
                wyplata = 36000
            elseif ranga == 7 then
                wyplata = 38000
            end

            TriggerEvent('esx_addonaccount:getSharedAccount', 'society_rpm', function(account)
                societyAccount = account
            end)

            xPlayer.addMoney(wyplata)
            xPlayer.removeInventoryItem('rpm_element2', 20)
            TriggerClientEvent('esx:showNotification', source, '~g~Otrzymujesz wypłatę ~w~'..wyplata..'$!')
            sendToDiscord (('exile_rpm:sell'), "Gracz [".. source .."] " .. xPlayer.name .. "\nLicencja " .. xPlayer.identifier .. "\nSprzedal 20 elementow rpma \n| NA RANDZE ".. ranga .. " | ZAROBIL: ".. wyplata .." | FIRMA ZAROBILA ".. wyplata/2 .."", "https://discord.com/api/webhooks/930568099164471338/NBxe2RMCg4Qx7LSNM32KjSzO5QsaQQlwXyfGnbGTSsOlM1swmabMWmUTEH9nc-H3EVWk") 
            societyAccount.addMoney(wyplata / 2)
            MySQL.Async.fetchAll('SELECT * FROM users WHERE identifier = @identifier', {
                ['@identifier'] = identifier
            }, function(result)
                if result[1] ~= nil then
                    local kursy = result[1].kursy
                    --print(kursy)
                
                    local kusrsiki = kursy + 1
                    --print(kusrsiki)
                    MySQL.Async.execute('UPDATE users SET kursy = @kursy WHERE identifier = @identifier', {
                        ['@kursy']      = kusrsiki,
                        ['@identifier'] = identifier
                    }, function(rowsChanged)
                        --cb()
                    end)
                end
            end)
        else
            TriggerClientEvent('esx:showNotification', source, '~r~Nie posiadasz wystarczająco Elementow stelarzu')
        end
    else
        sendToDiscord (('exile_rpm:sell'), "Gracz [".. source .."] " .. xPlayer.name .. "\nLicencja " .. xPlayer.identifier .. "\nProbowal dac sobie siano poprzez exile_rpm:sell", "https://discord.com/api/webhooks/930568099164471338/NBxe2RMCg4Qx7LSNM32KjSzO5QsaQQlwXyfGnbGTSsOlM1swmabMWmUTEH9nc-H3EVWk") 
        print('CHEATER NA SERWERZE PROBA SPRZEDAZY: exile_rpm:sell \nPODEJRZANY ['..source..'] '..xPlayer.name..'')
    end
end)
