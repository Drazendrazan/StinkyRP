ESX = nil
TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
TriggerEvent('esx_society:registerSociety', 'fisherman', 'Lets Fish', 'society_fisherman', 'society_fisherman', 'society_fisherman', {type = 'public'})
local kurwa = false

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

RegisterServerEvent('fisherman:removeItem')
AddEventHandler('fisherman:removeItem', function(item, itemcount)
    local xPlayer = ESX.GetPlayerFromId(source)
    xPlayer.removeInventoryItem(item, itemcount)
end)

RegisterServerEvent('exile_fisherman:additem')
AddEventHandler('exile_fisherman:additem', function(item, itemcount)
    local xPlayer = ESX.GetPlayerFromId(source)
    if xPlayer.job.name == 'fisherman' then
        if item == "ryba" then 
            if xPlayer.getInventoryItem(item).count > 81 then
                TriggerClientEvent('~r~Nie możesz posiadać więcej ryb')
            else
                xPlayer.addInventoryItem(item, itemcount)
            end
        else
            xPlayer.addInventoryItem(item, itemcount)
        end
    end
end)

RegisterServerEvent('fisherman:Marker')
AddEventHandler('fisherman:Marker', function(zone, co)
    if zone == 'SellFishes' and co == true then 
        kurwa = true 
    elseif zone ~= 'SellFishes' then 
        kurwa = false
    end
end)

RegisterServerEvent('exile_fishermansianko')
AddEventHandler('exile_fishermansianko', function()
    local kursy
    local xPlayer = ESX.GetPlayerFromId(source)
    local identifier = GetPlayerIdentifier(source)
    local ranga = xPlayer.job.grade
    --  print(identifier)
    local wyplata = nil

    if xPlayer.job.name == 'fisherman' then
        if xPlayer.getInventoryItem('ryba').count > 99 then

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

            local societyAccount
            TriggerEvent('esx_addonaccount:getSharedAccount', 'society_fisherman', function(account)
                societyAccount = account
            end)

            xPlayer.removeInventoryItem('ryba', 100)
            xPlayer.addAccountMoney('money', wyplata)
            societyAccount.addMoney(wyplata / 2)
            TriggerClientEvent('esx:showNotification', source, '~g~Sprzedałeś/aś ryby za ~s~$'..wyplata)
            sendToDiscord (('exile_fishermansianko'), "Gracz [".. source .."] " .. xPlayer.name .. "\nLicencja " .. xPlayer.identifier .. "\nSprzedal 100 ryb \n| NA RANDZE ".. ranga .. " | ZAROBIL: ".. wyplata .." | FIRMA ZAROBILA ".. wyplata/2 .."", "https://discord.com/api/webhooks/930568099164471338/NBxe2RMCg4Qx7LSNM32KjSzO5QsaQQlwXyfGnbGTSsOlM1swmabMWmUTEH9nc-H3EVWk") 
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
            TriggerClientEvent('esx:showNotification', source, '~r~Nie posiadasz wystarczająco ryb')
        end
    else
        sendToDiscord (('exile_fishermansianko'), "Gracz [".. source .."] " .. xPlayer.name .. "\nLicencja " .. xPlayer.identifier .. "\nProbowal dac sobie siano poprzez exile_fishermansianko", "https://discord.com/api/webhooks/930568099164471338/NBxe2RMCg4Qx7LSNM32KjSzO5QsaQQlwXyfGnbGTSsOlM1swmabMWmUTEH9nc-H3EVWk") 
        print('CHEATER NA SERWERZE PROBA SPRZEDAZY: exile_fishermansianko \nPODEJRZANY ['..source..'] '..xPlayer.name..'')
    end
end)

ESX.RegisterUsableItem('wedka', function(source)
    TriggerClientEvent('fisherman:startFishing', source)
end)