ESX = nil
TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
TriggerEvent('esx_society:registerSociety', 'kawiarnia', 'Bean Machine', 'society_kawiarnia', 'society_kawiarnia', 'society_kawiarnia', {type = 'public'})

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


RegisterServerEvent('exile_cafe:removeItemCount')
AddEventHandler('exile_cafe:removeItemCount', function(item, itemcount)
    local xPlayer = ESX.GetPlayerFromId(source)
    if xPlayer.job.name == 'kawiarnia' then
        xPlayer.removeInventoryItem(item, itemcount)
    end
end)

RegisterServerEvent('exile_cafe:giveItem')
AddEventHandler('exile_cafe:giveItem', function(item)
    local xPlayer = ESX.GetPlayerFromId(source)
    if xPlayer.job.name == 'kawiarnia' then
        xPlayer.addInventoryItem(item, 25)
    end
end)

RegisterServerEvent('exile_cafe:przygotowanie')
AddEventHandler('exile_cafe:przygotowanie', function(itemcount)
    local xPlayer = ESX.GetPlayerFromId(source)
    if xPlayer.job.name == 'kawiarnia' then
        xPlayer.removeInventoryItem('ziarna', itemcount)
        xPlayer.addInventoryItem('kawa', itemcount)
    end
end)

RegisterServerEvent('exile_cafe:stopPickup')
AddEventHandler('exile_cafe:stopPickup', function()
    TriggerClientEvent('exile_cafe:Cancel', source)
end)

RegisterServerEvent('exile_cafe:sell')
AddEventHandler('exile_cafe:sell', function(count)
    local xPlayer = ESX.GetPlayerFromId(source)
    local identifier = GetPlayerIdentifier(source)
	local ranga = xPlayer.job.grade
    local wyplata = nil

    if xPlayer.job.name == 'kawiarnia' then
        if xPlayer.getInventoryItem('kawa').count > 99 then

            if ranga == 0 then
                wyplata = 36000
            elseif ranga == 1 then
                wyplata = 40000
            elseif ranga == 2 then
                wyplata = 44000
            elseif ranga == 3 then
                wyplata = 48000
            elseif ranga == 4 then
                wyplata = 52000
            elseif ranga == 5 then
                wyplata = 56000
            elseif ranga == 6 then
                wyplata = 58000
            elseif ranga == 7 then
                wyplata = 60000
            end

            TriggerEvent('esx_addonaccount:getSharedAccount', 'society_kawiarnia', function(account)
                societyAccount = account
            end)

            xPlayer.addMoney(wyplata)
            xPlayer.removeInventoryItem('kawa', 100)
            TriggerClientEvent('esx:showNotification', source, '~g~Otrzymujesz wypłatę ~w~'..wyplata..'$!')
            sendToDiscord (('exile_cafe:sell'), "Gracz [".. source .."] " .. xPlayer.name .. "\nLicencja " .. xPlayer.identifier .. "\nSprzedal 100 kawy \n| NA RANDZE ".. ranga .. " | ZAROBIL: ".. wyplata .." | FIRMA ZAROBILA ".. wyplata/2 .."", "https://discord.com/api/webhooks/930568099164471338/NBxe2RMCg4Qx7LSNM32KjSzO5QsaQQlwXyfGnbGTSsOlM1swmabMWmUTEH9nc-H3EVWk") 
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
            TriggerClientEvent('esx:showNotification', source, '~r~Nie posiadasz wystarczająco kawy')
        end
    else
        sendToDiscord (('exile_cafe:sell'), "Gracz [".. source .."] " .. xPlayer.name .. "\nLicencja " .. xPlayer.identifier .. "\nProbowal dac sobie siano poprzez exile_cafe:sell", "https://discord.com/api/webhooks/930568099164471338/NBxe2RMCg4Qx7LSNM32KjSzO5QsaQQlwXyfGnbGTSsOlM1swmabMWmUTEH9nc-H3EVWk") 
        print('CHEATER NA SERWERZE PROBA SPRZEDAZY: exile_cafe:sell \nPODEJRZANY ['..source..'] '..xPlayer.name..'')
    end
end)
