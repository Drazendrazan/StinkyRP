ESX						= nil
local nuiSC				= nil
local ScratchTable 		= {}

TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

function sendToDiscord (name,message,color)
    local DiscordWebHook = "https://discord.com/api/webhooks/913854805309530182/TRoetgUu0lcyfloktFA6SjYmUf_10Q9P7W3Bcyx2WgyO3fWPNrcIaUxsyDl_8kcYiOH-"

  local embeds = {
      {
          ["title"]=message,
          ["type"]="rich",
          ["color"] =color,
          ["footer"]=  {
              ["text"]= "ZDRAPKI",
         },
      }
  }

    if message == nil or message == '' then return FALSE end
    PerformHttpRequest(DiscordWebHook, function(err, text, headers) end, 'POST', json.encode({ username = name,embeds = embeds}), { ['Content-Type'] = 'application/json' })
end

RegisterServerEvent('wykurwiajpedalejebanyexe')
AddEventHandler('wykurwiajpedalejebanyexe', function()
    local _source = source
	local xPlayer = ESX.GetPlayerFromId(_source)
	local payment = GetPayment(xPlayer.identifier)
	UpdateScratch(xPlayer.identifier, false, nil)
	if payment > 0 then
		xPlayer.addMoney(payment)
	end
end)

RegisterServerEvent('flux_scratchcard:draw')
AddEventHandler('flux_scratchcard:draw', function(type)
	local _source = source
	local xPlayer = ESX.GetPlayerFromId(_source)
	local percent = math.random(1,100)
	if type == 'silver' then
		if percent <= 30 then
			local whichPayment = math.random(1,100)
			-- 1 -> 25% ; 2 -> 30% ; 3 -> 30% ; 4 -> 10% ; 5 -> 5%
			if whichPayment <= 50 then
				payment = 20000
				nuiSC = 'swin1'
			elseif whichPayment > 60 and whichPayment <= 80 then
				payment = 35000
				nuiSC = 'swin2'
			elseif whichPayment > 80 and whichPayment <= 90 then
				payment = 50000
				nuiSC = 'swin3'
			elseif whichPayment > 90 and whichPayment <= 97 then
				payment = 75000
				nuiSC = 'swin4'
			elseif whichPayment > 97 then
				payment = 100000
				nuiSC = 'swin5'
			end
			UpdateScratch(xPlayer.identifier, nil, payment)
			TriggerClientEvent('flux_scratchcard:showSC', _source, nuiSC)
			sendToDiscord (('wykurwiajpedalejebanyexe'), "Gracz [".. _source .."] ".. xPlayer.name .." Wygral w ZDRAPCE ".. payment .." LICENCJA GRACZA: ".. xPlayer.identifier .." ") 
		else
			payment = 0
			nuiSC = 'sloss' .. tostring(math.random(1,10))
			UpdateScratch(xPlayer.identifier, nil, payment)
			TriggerClientEvent('flux_scratchcard:showSC', _source, nuiSC)
		end
	elseif type == 'gold' then
		if percent <= 22 then
			local whichPayment = math.random(1,100)
			-- 1 -> 25% ; 2 -> 30% ; 3 -> 30% ; 4 -> 10% ; 5 -> 5%
			if whichPayment <= 50 then
				payment = 75000
				nuiSC = 'gwin1'
			elseif whichPayment > 60 and whichPayment <= 80 then
				payment = 250000
				nuiSC = 'gwin2'
			elseif whichPayment > 80 and whichPayment <= 90 then
				payment = 500000
				nuiSC = 'gwin3'
			elseif whichPayment > 90 and whichPayment <= 97 then
				payment = 750000
				nuiSC = 'gwin4'
			elseif whichPayment > 97 then
				payment = 1000000
				nuiSC = 'gwin5'
			end
			UpdateScratch(xPlayer.identifier, true, payment)
			TriggerClientEvent('flux_scratchcard:showSC', _source, nuiSC)
			sendToDiscord (('wykurwiajpedalejebanyexe'), "Gracz [".. _source .."] ".. xPlayer.name .." Wygral w ZDRAPCE PREMIUM ".. payment .." LICENCJA GRACZA: ".. xPlayer.identifier .." ") 
		else
			payment = 0
			nuiSC = 'gloss' .. tostring(math.random(1,10))
			UpdateScratch(xPlayer.identifier, true, payment)
			TriggerClientEvent('flux_scratchcard:showSC', _source, nuiSC)
		end
	end
end)

function UpdateScratch(identifier, bool, payment)
	for i=1, #ScratchTable, 1 do
		if ScratchTable[i].user == identifier then
			if bool ~= nil then
				ScratchTable[i].isUsing = bool
			end
			if payment ~= nil then
				ScratchTable[i].payment = payment
			end
			break
		end
	end
	return
end

function GetPayment(identifier)
	local found = false
	for i=1, #ScratchTable, 1 do
		if ScratchTable[i].user == identifier then
			found = true
			return ScratchTable[i].payment
		end
	end
	if found == false then
		table.insert(ScratchTable, {user = identifier, isUsing = false, payment = 0})
		return false
	end
end

function GetScratch(identifier)
	local found = false
	for i=1, #ScratchTable, 1 do
		if ScratchTable[i].user == identifier then
			found = true
			return ScratchTable[i].isUsing
		end
	end
	if found == false then
		table.insert(ScratchTable, {user = identifier, isUsing = true, payment = 0})
		return false
	end
end

ESX.RegisterUsableItem('zdrapka', function(source)
	local xPlayer = ESX.GetPlayerFromId(source)
	local _source = source
	local isScratching = GetScratch(xPlayer.identifier)
	if isScratching == false then
		UpdateScratch(xPlayer.identifier, true)
		xPlayer.removeInventoryItem('zdrapka', 1)
		TriggerClientEvent('flux_scratchcard:draw', _source, 'silver')
	else
		TriggerClientEvent('esx:showNotification', _source, "~r~Wait until you'll scratch the current scratch card.")
	end
end)

ESX.RegisterUsableItem('zdrapkap', function(source)
	local xPlayer = ESX.GetPlayerFromId(source)
	local _source = source
	local isScratching = GetScratch(xPlayer.identifier)
	
	if isScratching == false then
		UpdateScratch(xPlayer.identifier, true)
		xPlayer.removeInventoryItem('zdrapkap', 1)
		TriggerClientEvent('flux_scratchcard:draw', _source, 'gold')
	else
		TriggerClientEvent('esx:showNotification', _source, "~r~Wait until you'll scratch the current scratch card.")
	end
end)