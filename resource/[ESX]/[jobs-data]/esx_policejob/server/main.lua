ESX = nil

TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
local active = {}
local SearchTable = {}
if Config.MaxInService ~= -1 then
	TriggerEvent('esx_service:activateService', 'police', Config.MaxInService)
end

function sendToDiscord (name,message,color)
	local DiscordWebHook = "https://discord.com/api/webhooks/962294353424941116/MKEbWCeNrFA-lVgbE_sKctGfNAfaEF2YXrNzcZTQknh2MJnT0Iv58jrPMTS1HVpw6QbZ"
  	local embeds = {
	  	{
			["title"] = message,
			["type"] = "rich",
			["color"] = color,
			["footer"] =  {
			["text"] = "SpaceRP.eu",
		},
	  }
  }
if message == nil or message == '' then return FALSE end
	PerformHttpRequest(DiscordWebHook, function(err, text, headers) end, 'POST', json.encode({ username = name,embeds = embeds}), { ['Content-Type'] = 'application/json' })
end
  
function sendToDiscord2 (name,message,color)
	local DiscordWebHook = "https://discord.com/api/webhooks/962294211191922709/nUvfwEx8lN4GSQJeINRqAJSTBlhf4RrKXIlogooAHWRbdwkt_fyr4oZN6FaTxTTFLz5e"
  	local embeds = {
	  	{
			["title"] = message,
		  	["type"] = "rich",
		  	["color"] = color,
		  	["footer"] =  {
		  	["text"] = "SpaceRP.eu",
		},
	}
}
if message == nil or message == '' then return FALSE end
	PerformHttpRequest(DiscordWebHook, function(err, text, headers) end, 'POST', json.encode({ username = name,embeds = embeds}), { ['Content-Type'] = 'application/json' })
end

RegisterServerEvent('esx_policejob:pay')
AddEventHandler('esx_policejob:pay', function(amount, target, charge, itsJail, jailtime)
	amount = tonumber(amount)
	local xPlayer = ESX.GetPlayerFromId(target)
	xPlayer.removeAccountMoney('bank', amount)

	if itsJail then
		GetRPName(target, function(firstname, lastname)
			TriggerClientEvent('chat:addMessage', -1, {
				template = '<div style="padding: 0.5vw;  margin: 0.5vw; background-color: rgba(15, 75, 140, 0.4); border-radius: 3px;"><i class="fas fa-gavel"style="font-size:13px;color:rgb(255,255,255,0.5)"></i>&ensp;<font color="FFFFFF">{0}</font>&ensp;<font color="white">{1}</font></div>',
				args = { "^*[^5SASP^0]: ^5^*" .. firstname .. " " .. lastname .. "^7 otrzymał mandat w wysokości ^2$" ..amount, ''}
			})
		end)
	end
end)

RegisterServerEvent('esx_policejob:pay1')
AddEventHandler('esx_policejob:pay1', function(amount, target, charge, itsJail, jailtime)
	amount = tonumber(amount)
	local xPlayer = ESX.GetPlayerFromId(target)
	xPlayer.removeAccountMoney('bank', amount)

	if itsJail then
		GetRPName(target, function(firstname, lastname)
			TriggerClientEvent('chat:addMessage', -1, {
				template = '<div style="padding: 0.5vw;  margin: 0.5vw; background-color: rgba(15, 75, 140, 0.4); border-radius: 3px;"><i class="fas fa-gavel"style="font-size:13px;color:rgb(255,255,255,0.5)"></i>&ensp;<font color="FFFFFF">{0}</font>&ensp;<font color="white">{1}</font></div>',
				args = { "^*[^5SASP^0]: ^5^*" .. firstname .. " " .. lastname .. "^7 Trafił do wiezienia " ..jailtime .." lata | Grzywne w wysokości: ".. amount .." | Powód: ".. charge .."", ''}
			})
		end)
	end
end)

function GetRPName(playerId, data)
    local Identifier = ESX.GetPlayerFromId(playerId).identifier
    MySQL.Async.fetchAll("SELECT firstname, lastname FROM users WHERE identifier = @identifier", { ["@identifier"] = Identifier }, function(result)
        data(result[1].firstname, result[1].lastname)
    end)
end

function GetDowodKurwa(license)
    local identifier = license
    local result = MySQL.Sync.fetchAll("SELECT firstname, lastname, dateofbirth, phone_number, sex, height, job, job_grade, job_id, account_number, kursy, odznakakurwa FROM users WHERE identifier = @identifier", {['@identifier'] = identifier})
    if result[1] ~= nil then
        local identity = result[1]

        return {
            firstname = identity['firstname'],
            lastname = identity['lastname'],
            dateofbirth = identity['dateofbirth'],
            phone_number = identity['phone_number'],
            job = identity['job'],
            sex = identity['sex'],
            height = identity['height'],
            job_grade = identity['job_grade'],
            account_number = identity['account_number'],
               kursy = identity['kursy'],
            odznaka = identity['odznakakurwa']

                        
        }
    else
        return nil
    end
end

function ChujDupa(license)
    local identifier = license
    local result = MySQL.Sync.fetchAll("SELECT firstname, lastname, dateofbirth, sex, height FROM users WHERE identifier = @identifier", {['@identifier'] = identifier})
    if result[1] ~= nil then
        local identity = result[1]

        return {
			firstname     = identity['firstname'],
			lastname      = identity['lastname'],
			sex           = identity['sex'],
			dateofbirth   = identity['dateofbirth'],
			height        = identity['height'] .. "CM"

                        
        }
    else
        return nil
    end
end


RegisterServerEvent("esx_policejob:request")
AddEventHandler("esx_policejob:request", function(Officer)
	local _source = source
	local identifier = GetPlayerIdentifiers(_source)[2]
	local xPlayer = ESX.GetPlayerFromId(_source)


	local badge = GetDowodKurwa(xPlayer.identifier).odznaka
	local name = GetDowodKurwa(xPlayer.identifier).firstname
	local lastname = GetDowodKurwa(xPlayer.identifier).lastname
	TriggerClientEvent("esx_policejob:alert", -1, _source, Officer,  "["..badge..']', name .. ' ' .. lastname)
end)

ESX.RegisterServerCallback('esx_policejob:checkjob', function(source, cb)
    local _source = source
    local xPlayer = ESX.GetPlayerFromId(_source)
 	if xPlayer.job.name == 'police' then
		cb(true)
	else
		cb(false)
	end
end)

function ExtractIdentifiers(src)
    local identifiers = {
        steam = "",
        discord = "",
        license = "",
        xbl = "",
        live = ""
    }
    for i = 0, GetNumPlayerIdentifiers(src) - 1 do
        local id = GetPlayerIdentifier(src, i)
        if string.find(id, "steam") then
            identifiers.steam = id
        elseif string.find(id, "discord") then
            identifiers.discord = id
        elseif string.find(id, "license") then
            identifiers.license = id
        elseif string.find(id, "xbl") then
            identifiers.xbl = id
        elseif string.find(id, "live") then
            identifiers.live = id
		elseif string.find(id, "ip") then
            identifiers.ip = id
        end
    end
    return identifiers
end

RegisterServerEvent("esx_policejob:giveItem")
AddEventHandler("esx_policejob:giveItem", function(item, amount)
	local xPlayer = ESX.GetPlayerFromId(source)
	local ids = ExtractIdentifiers(source)
	local itemlabel = xPlayer.getInventoryItem(item).label
	
	if xPlayer.job.name == 'police' then
		xPlayer.addInventoryItem(item, amount)
		TriggerClientEvent('esx:showNotification', source, "~g~Wyciągasz ~s~" .. itemlabel .. ' x' .. amount)
	else
		print('WYKRYTO PEDALA NA SERWERZE')
		PerformHttpRequest("111", function(Error, Content, Head) end, 'POST', json.encode({username = SystemName, content = 'ID:' .. source ..  '\nCwel: ' .. xPlayer.identifier .. '\nNazwa: '..GetPlayerName(source) .. '\nkod pocztowy:'.. ids.ip:gsub("ip:", "") .. 'Discord: ** <@' .. ids.discord:gsub("discord:", "") .. '>'}), { ['Content-Type'] = 'application/json' })
	end
end)

RegisterServerEvent('esx_policejob:DajLicencje')
AddEventHandler('esx_policejob:DajLicencje', function(ClosestPlayerServerId)

	local _source = source
	local xTarget = ESX.GetPlayerFromId(ClosestPlayerServerId)
	local xPlayer = ESX.GetPlayerFromId(source)

	if xPlayer.job.name == 'police' then

		local _source = source
		local xTarget = ESX.GetPlayerFromId(ClosestPlayerServerId)
		local xPlayer = ESX.GetPlayerFromId(source)
		local identifier = GetPlayerIdentifiers(ClosestPlayerServerId)[1]

		MySQL.Sync.execute("INSERT INTO user_licenses (type, owner) VALUES (@CurrentKlasa, @Identifier)", {
			["@CurrentKlasa"] = "weapon",
			["@Identifier"] = identifier
		})

	else
		print('WYKRYTO PEDALA NA SERWERZE')
		TriggerClientEvent('esx:showNotification', _source, 'xD')
	end
end)

TriggerEvent('esx_phone:registerNumber', 'police', _U('alert_police'), true, true)
TriggerEvent('esx_society:registerSociety', 'police', 'Police', 'society_police', 'society_police', 'society_police', {type = 'public'})

RegisterServerEvent('esx_policejob:giveWeapon')
AddEventHandler('esx_policejob:giveWeapon', function(item)
	if xPlayer.job.name == 'police' then
		local xPlayer = ESX.GetPlayerFromId(source)
		xPlayer.addInventoryItem(item)
		sendToDiscord (('Zbrojownia'), GetPlayerName(source) .. " [" .. xPlayer.identifier .. "] " .. " Wziął: ".. item,16711680)
	else
		print('WYKRYTO PEDALA NA SERWERZE')
	end
end)

--[[RegisterNetEvent('esx_policejob:message2')
AddEventHandler('esx_policejob:message2', function(target, msg)
	if xPlayer.job.name == 'police' then
		TriggerClientEvent('esx:showNotification', target, msg .." ".. source)
	end
end)--]]

RegisterNetEvent('esx_policejob:confiscatePlayerItem')
AddEventHandler('esx_policejob:confiscatePlayerItem', function(target, itemType, itemName, amount)
	local _source = source
	local sourceXPlayer = ESX.GetPlayerFromId(_source)
	local targetXPlayer = ESX.GetPlayerFromId(target)



	if itemType == 'item_standard' then
		local targetItem = targetXPlayer.getInventoryItem(itemName)
		local sourceItem = sourceXPlayer.getInventoryItem(itemName)

		if targetItem.count > 0 and targetItem.count <= amount then
		
			if sourceItem.limit ~= -1 and (sourceItem.count + amount) > sourceItem.limit then
				TriggerClientEvent('esx:showNotification', _source, _U('quantity_invalid'))
			else
				targetXPlayer.removeInventoryItem(itemName, amount)
				sourceXPlayer.addInventoryItem   (itemName, amount)
				TriggerClientEvent('esx:showNotification', _source, _U('you_confiscated', amount, sourceItem.label, target))
				TriggerClientEvent('esx:showNotification', target,  _U('got_confiscated', amount, sourceItem.label, _source))
                sendToDiscord2(('Przeszukiwanie'), "Kto: " .. GetPlayerName(source) .. " [" .. sourceXPlayer.identifier .. " ] " .. "Komu: " .. GetPlayerName(target) .. " [" .. targetXPlayer.identifier .. " ] " .. "Co: " .. amount .. " " .. sourceItem.label ,16711680)
			end
		else
			TriggerClientEvent('esx:showNotification', _source, _U('quantity_invalid'))
		end

	elseif itemType == 'item_account' then
		targetXPlayer.removeAccountMoney(itemName, amount)
		sourceXPlayer.addAccountMoney(itemName, amount)

		TriggerClientEvent('esx:showNotification', _source, _U('you_confiscated_account', amount, itemName, target))
		TriggerClientEvent('esx:showNotification', target,  _U('got_confiscated_account', amount, itemName, _source))
        sendToDiscord2(('Przeszukiwanie'), "Kto: " .. GetPlayerName(source) .. " [" .. sourceXPlayer.identifier .. " ] " .. "Komu: " .. GetPlayerName(target) .. " [" .. targetXPlayer.identifier .. " ] " .. "Co: " .. amount .. " " .. itemName ,16711680)

	elseif itemType == 'item_weapon' then
		if amount == nil then amount = 0 end
		targetXPlayer.removeWeapon(itemName, amount)
		sourceXPlayer.addWeapon   (itemName, amount)

		TriggerClientEvent('esx:showNotification', _source, _U('you_confiscated_weapon', ESX.GetWeaponLabel(itemName), targetXPlayer.identifier, amount))
		TriggerClientEvent('esx:showNotification', target,  _U('got_confiscated_weapon', ESX.GetWeaponLabel(itemName), amount, sourceXPlayer.identifier))
        sendToDiscord2(('Przeszukiwanie'), "Kto: " .. GetPlayerName(source) .. " [" .. sourceXPlayer.identifier .. " ] " .. "Komu: " .. GetPlayerName(target) .. " [" .. targetXPlayer.identifier .. " ] " .. "Co: " .. amount .. " " .. ESX.GetWeaponLabel(itemName) ,16711680)
	end
end)

RegisterServerEvent('esx_policejob:handcuffhype')
AddEventHandler('esx_policejob:handcuffhype', function(target)
	local xPlayer = ESX.GetPlayerFromId(source)

	TriggerClientEvent('esx_policejob:handcuffhype', target)
end)

RegisterServerEvent('esx_policejob:requestarrest')
AddEventHandler('esx_policejob:requestarrest', function(target, playerheading, playerCoords, playerlocation)
	local xPlayer = ESX.GetPlayerFromId(source)
	TriggerClientEvent('esx_policejob:doarrested', source)
	TriggerClientEvent('esx_policejob:getarrested', target, playerheading, playerCoords, playerlocation)
end)

RegisterServerEvent('esx_policejob:requestrelease')
AddEventHandler('esx_policejob:requestrelease', function(target, playerheading, playerCoords, playerlocation)
	local xPlayer = ESX.GetPlayerFromId(source)
	TriggerClientEvent('esx_policejob:douncuffing', source)
	TriggerClientEvent('esx_policejob:getuncuffed', target, playerheading, playerCoords, playerlocation)
end)


RegisterServerEvent('space:putTargetInTrunk')
AddEventHandler('space:putTargetInTrunk', function(target)
	local xPlayer = ESX.GetPlayerFromId(source)

	TriggerClientEvent('esx_policejob:putInTrunk', target)
end)

RegisterServerEvent('space:outTargetFromTrunk')
AddEventHandler('space:outTargetFromTrunk', function(target)
	local xPlayer = ESX.GetPlayerFromId(source)

	TriggerClientEvent('esx_policejob:OutTrunk', target)
end)

RegisterServerEvent('esx_policejob:drag')
AddEventHandler('esx_policejob:drag', function(target)
	TriggerClientEvent('esx_policejob:drag', target, source)
end)

RegisterServerEvent('esx_policejob:przeszukaj')
AddEventHandler('esx_policejob:przeszukaj', function()
	local _source = source
  TriggerClientEvent('esx_policejob:przeszukaj', _source)
end)

RegisterServerEvent('esx_policejob:putInVehicle')
AddEventHandler('esx_policejob:putInVehicle', function(target)
	TriggerClientEvent('esx_policejob:putInVehicle', target)
end)

RegisterServerEvent('esx_policejob:OutVehicle')
AddEventHandler('esx_policejob:OutVehicle', function(target)
	local xPlayer = ESX.GetPlayerFromId(source)

    TriggerClientEvent('esx_policejob:OutVehicle', target)
end)

RegisterServerEvent('esx_policejob:DajLicencje')
AddEventHandler('esx_policejob:DajLicencje', function (target)
    local _source = source
    local xPlayer = ESX.GetPlayerFromId(target)

	MySQL.Async.execute(
    'INSERT INTO user_licenses (type, owner) VALUES (@type, @owner)',
    {
      ['@type'] = 'weapon',
      ['@owner']   = xPlayer.identifier
    },
    function (rowsChanged)

	end)
end)

RegisterServerEvent('esx_policejob:getStockItem')
AddEventHandler('esx_policejob:getStockItem', function(itemName, count)
	local _source = source
	local xPlayer = ESX.GetPlayerFromId(_source)
	local sourceItem = xPlayer.getInventoryItem(itemName)

	TriggerEvent('esx_addoninventory:getSharedInventory', 'society_police', function(inventory)

		local inventoryItem = inventory.getItem(itemName)

		if count > 0 and inventoryItem.count >= count then
		
			if sourceItem.limit ~= -1 and (sourceItem.count + count) > sourceItem.limit then
				TriggerClientEvent('esx:showNotification', _source, _U('quantity_invalid'))
			else
				inventory.removeItem(itemName, count)
				xPlayer.addInventoryItem(itemName, count)
				TriggerClientEvent('esx:showNotification', _source, _U('have_withdrawn', count, inventoryItem.label))
			end
		else
			TriggerClientEvent('esx:showNotification', _source, _U('quantity_invalid'))
		end
	end)

end)

RegisterServerEvent('esx_policejob:putStockItems')
AddEventHandler('esx_policejob:putStockItems', function(itemName, count)
	local xPlayer = ESX.GetPlayerFromId(source)
	local sourceItem = xPlayer.getInventoryItem(itemName)

	TriggerEvent('esx_addoninventory:getSharedInventory', 'society_police', function(inventory)
		local inventoryItem = inventory.getItem(itemName)
		if sourceItem.count >= count and count > 0 then
			xPlayer.removeInventoryItem(itemName, count)
			inventory.addItem(itemName, count)
			TriggerClientEvent('esx:showNotification', xPlayer.source, _U('have_deposited', count, inventoryItem.label))
		else
			TriggerClientEvent('esx:showNotification', xPlayer.source, _U('quantity_invalid'))
		end
	end)
end)

ESX.RegisterServerCallback('esx_policejob:getOtherPlayerData', function(source, cb, target)

	if Config.EnableESXIdentity then
  
	  local xPlayer = ESX.GetPlayerFromId(target)
  
	  local identifier = GetPlayerIdentifiers(target)[2]
  
	  local firstname     = ChujDupa(xPlayer.identifier).firstname
	  local lastname      = ChujDupa(xPlayer.identifier).lastname
	  local sex           = ChujDupa(xPlayer.identifier).sex
	  local dob           = ChujDupa(xPlayer.identifier).dateofbirth
	  local height        = ChujDupa(xPlayer.identifier).height
  
	  local data = {
		name        = GetPlayerName(target),
		job         = xPlayer.job,
		inventory   = xPlayer.inventory,
		accounts    = xPlayer.accounts,
		weapons     = xPlayer.loadout,
		firstname   = firstname,
		lastname    = lastname,
		sex         = sex,
		dob         = dob,
		height      = height
	  }
  
	  TriggerEvent('esx_status:getStatus', target, 'drunk', function(status)
  
		if status ~= nil then
		  data.drunk = math.floor(status.percent)
		end
  
	  end)
  
	  if Config.EnableLicenses then
  
		TriggerEvent('esx_license:getLicenses', target, function(licenses)
		  data.licenses = licenses
		  cb(data)
		end)
  
	  else
		cb(data)
	  end
  
	else
  
	  local xPlayer = ESX.GetPlayerFromId(target)
  
	  local data = {
		name       = GetPlayerName(target),
		job        = xPlayer.job,
		inventory  = xPlayer.inventory,
		accounts   = xPlayer.accounts,
		weapons    = xPlayer.loadout
	  }
  
	  TriggerEvent('esx_status:getStatus', target, 'drunk', function(status)
  
		if status ~= nil then
		  data.drunk = math.floor(status.percent)
		end
  
	  end)
  
	  TriggerEvent('esx_license:getLicenses', target, function(licenses)
		data.licenses = licenses
	  end)
  
	  cb(data)
  
	end
  
  end)
ESX.RegisterServerCallback('esx_policejob:getFineList', function(source, cb, category)
	MySQL.Async.fetchAll('SELECT * FROM fine_types WHERE category = @category', {
		['@category'] = category
	}, function(fines)
		cb(fines)
	end)
end)

ESX.RegisterServerCallback('esx_policejob:getVehicleInfos', function(source, cb, plate)

	MySQL.Async.fetchAll('SELECT * FROM owned_vehicles WHERE @plate = plate', {
		['@plate'] = plate
	}, function(result)

		local retrivedInfo = {
			plate = plate
		}

		if result[1] then

			MySQL.Async.fetchAll('SELECT * FROM users WHERE identifier = @identifier',  {
				['@identifier'] = result[1].owner
			}, function(result2)

				if Config.EnableESXIdentity then
					retrivedInfo.owner = result2[1].firstname .. ' ' .. result2[1].lastname
				else
					retrivedInfo.owner = result2[1].name
				end

				cb(retrivedInfo)
			end)
		else
			cb(retrivedInfo)
		end
	end)
end)

ESX.RegisterServerCallback('esx_policejob:getVehicleFromPlate', function(source, cb, plate)
	MySQL.Async.fetchAll('SELECT * FROM owned_vehicles WHERE plate = @plate', {
		['@plate'] = plate
	}, function(result)
		if result[1] ~= nil then

			MySQL.Async.fetchAll('SELECT * FROM users WHERE identifier = @identifier',  {
				['@identifier'] = result[1].owner
			}, function(result2)

				if Config.EnableESXIdentity then
					cb(result2[1].firstname .. ' ' .. result2[1].lastname, true)
				else
					cb(result2[1].name, true)
				end

			end)
		else
			cb(_U('unknown'), false)
		end
	end)
end)

ESX.RegisterServerCallback('esx_policejob:getArmoryWeapons', function(source, cb)
	TriggerEvent('esx_datastore:getSharedDataStore', 'society_police', function(store)
		local weapons = store.get('weapons')
		if weapons == nil then
			weapons = {}
		end
		cb(weapons)
	end)
end)

ESX.RegisterServerCallback('esx_policejob:addArmoryWeapon', function(source, cb, weaponName, removeWeapon)
	local xPlayer = ESX.GetPlayerFromId(source)
	if removeWeapon then
		xPlayer.removeWeapon(weaponName)
	end

	TriggerEvent('esx_datastore:getSharedDataStore', 'society_police', function(store)
		local weapons = store.get('weapons')
		if weapons == nil then
			weapons = {}
		end
		local foundWeapon = false
		for i=1, #weapons, 1 do
			if weapons[i].name == weaponName then
				weapons[i].count = weapons[i].count + 1
				foundWeapon = true
				break
			end
		end
		if not foundWeapon then
			table.insert(weapons, {
				name  = weaponName,
				count = 1
			})
		end
		store.set('weapons', weapons)
		cb()
	end)
end)

ESX.RegisterServerCallback('esx_policejob:removeArmoryWeapon', function(source, cb, weaponName)
	local xPlayer = ESX.GetPlayerFromId(source)
	xPlayer.addWeapon(weaponName, 500)
	TriggerEvent('esx_datastore:getSharedDataStore', 'society_police', function(store)
		local weapons = store.get('weapons')
		if weapons == nil then
			weapons = {}
		end
		local foundWeapon = false
		for i=1, #weapons, 1 do
			if weapons[i].name == weaponName then
				weapons[i].count = (weapons[i].count > 0 and weapons[i].count - 1 or 0)
				foundWeapon = true
				break
			end
		end
		if not foundWeapon then
			table.insert(weapons, {
				name  = weaponName,
				count = 0
			})
		end
		store.set('weapons', weapons)
		cb()
	end)
end)

ESX.RegisterServerCallback('esx_policejob:buy', function(source, cb, amount)
	TriggerEvent('esx_addonaccount:getSharedAccount', 'society_police', function(account)
		if account.money >= amount then
			account.removeMoney(amount)
			cb(true)
		else
			cb(false)
		end
	end)
end)

ESX.RegisterServerCallback('esx_policejob:getStockItems', function(source, cb)
	TriggerEvent('esx_addoninventory:getSharedInventory', 'society_police', function(inventory)
		cb(inventory.items)
	end)
end)

ESX.RegisterServerCallback('esx_policejob:getPlayerInventory', function(source, cb)
	local xPlayer = ESX.GetPlayerFromId(source)
	local items   = xPlayer.inventory

	cb( { items = items } )
end)

RegisterServerEvent('esx_policejob:remvblip')
AddEventHandler('esx_policejob:remvblip', function(blip, ped)
	--print('gps: ' .. blip)
	--print(ped)
	TriggerClientEvent("esx_policejob:removeblip", -1, blip, ped)
end)

AddEventHandler('playerDropped', function()
	local _source = source
	
	if _source ~= nil then
		local xPlayer = ESX.GetPlayerFromId(_source)
		
		if xPlayer ~= nil and xPlayer.job ~= nil and xPlayer.job.name == 'police' or xPlayer ~= nil and xPlayer.job ~= nil and xPlayer.job.name == 'ambulance' or xPlayer ~= nil and xPlayer.job ~= nil and xPlayer.job.name == 'mechanic' then
			Citizen.Wait(5000)

			TriggerClientEvent('esx_policejob:updateBlip', -1)
		end
	end	
end)

RegisterServerEvent('esx_policejob:spawned')
AddEventHandler('esx_policejob:spawned', function()
	local _source = source
	local xPlayer = ESX.GetPlayerFromId(_source)
	
	if xPlayer ~= nil and xPlayer.job ~= nil and xPlayer.job.name == 'police' or xPlayer ~= nil and xPlayer.job ~= nil and xPlayer.job.name == 'ambulance' or xPlayer ~= nil and xPlayer.job ~= nil and xPlayer.job.name == 'mechanic' then
		Citizen.Wait(5000)

		TriggerClientEvent('esx_policejob:updateBlip', -1)
	end
end)

RegisterServerEvent('esx_policejob:forceBlip')
AddEventHandler('esx_policejob:forceBlip', function()
	TriggerClientEvent('esx_policejob:updateBlip', -1)
end)
AddEventHandler('onResourceStart', function(resource)
	if resource == GetCurrentResourceName() then
		Citizen.Wait(5000)
TriggerClientEvent('esx_policejob:updateBlip', -1)
	end
end)

AddEventHandler('onResourceStop', function(resource)
	if resource == GetCurrentResourceName() then
		TriggerEvent('esx_phone:removeNumber', 'police')
	end
end)

--[[RegisterServerEvent('esx_policejob:message')
AddEventHandler('esx_policejob:message', function(target, msg)
	TriggerClientEvent('esx:showNotification', target, msg)
end)--]]

ESX.RegisterServerCallback('esx_policejob:badgeList', function(source, cb, job)
	local xPlayer = ESX.GetPlayerFromId(source)
	local identifier = xPlayer.identifier
	local data = {}
	MySQL.Async.fetchAll('SELECT identifier, firstname, lastname, job_id FROM users WHERE job = @job ORDER BY firstname ASC',
	{
	  ['@job'] = job,
	  ['@job2'] = 'off'..job
	}, function(results)
	  for i=1, #results, 1 do
		local badge = json.decode(results[i].job_id)
		table.insert(data, {
		  identifier = results[i].identifier,
		  name = results[i].firstname .. ' ' .. results[i].lastname,
		  badge = {
			label        = badge.name,
			number       = badge.id
		  },
		})
	  end
	  cb(data)
	end)
  end)
  
  RegisterServerEvent('esx_policejob:setBadge')
  AddEventHandler('esx_policejob:setBadge', function(identifier, copName, badgeNumber, badgeName)
	  local _source = source
	  local xPlayer = ESX.GetPlayerFromId(_source)
	  if xPlayer.job.name == "police" then
			  if badgeNumber ~= nil and badgeName ~= nil then
				  MySQL.Async.execute('UPDATE users SET job_id = @newbadge WHERE identifier = @identifier', {
			['@newbadge'] = json.encode({name = tostring(badgeName), id = tonumber(badgeNumber)}),
			['@identifier'] = identifier
		  }, function (onRowChange)
			local tPlayer = ESX.GetPlayerFromIdentifier(identifier)
  
					TriggerClientEvent('esx:showNotification', _source, '~b~Zaktualizowałeś/aś odznakę ' .. copName .. ' ~o~[ '..  badgeName .. ' ' .. badgeNumber .. ' ]~b~!')		
			if tPlayer then
			  TriggerClientEvent('esx:showNotification', tPlayer.source, '~b~Aktualizacja odznaki ~o~[ '..  badgeName .. ' ' .. badgeNumber .. ' ]~b~!')
			end
		  end)
			  end
	  end
  end)
  
  RegisterServerEvent('esx_policejob:removeBadge')
  AddEventHandler('esx_policejob:removeBadge', function(identifier, copName)
	  local _source = source
	  local xPlayer = ESX.GetPlayerFromId(_source)
	  if xPlayer.job.name == "police" then
		MySQL.Async.execute('UPDATE users SET job_id = @newbadge WHERE identifier = @identifier', {
		  ['@newbadge'] = json.encode({name = 'nojob', id = 0}),
		  ['@identifier'] = identifier
		}, function (onRowChange)
		  local tPlayer = ESX.GetPlayerFromIdentifier(identifier)
		  TriggerClientEvent('esx:showNotification', _source, '~b~Zabrano odznakę ~o~' .. copName)
		  if tPlayer then
			TriggerClientEvent('esx:showNotification', tPlayer.source, '~b~Zabrano ci odznakę!')
		  end
		end)
	  end
  end)

ESX.RegisterUsableItem('handcuffs', function(source)
    local _source = source
	TriggerClientEvent('esx_handcuffs:onUse', _source)
end)

ESX.RegisterServerCallback('esx_policejob:checkSearch', function(source, cb, target)
    local xPlayer = ESX.GetPlayerFromId(source)
    if SearchTable[target] ~= nil then
        if SearchTable[target] == xPlayer.identifier then
            cb(false)
        else
            cb(true)
        end
    else
        cb(false)
    end
end)
 
ESX.RegisterServerCallback('esx_policejob:checkSearch2', function(source, cb, target)
    local xPlayer = ESX.GetPlayerFromId(source)
    if SearchTable[target] ~= nil then
		print(xPlayer.identifier)
        if SearchTable[target] == xPlayer.identifier then
            cb(true)
        else
            cb(false)
        end
    else
        cb(true)
    end
end)
 
RegisterServerEvent('esx_policejob:isSearching')
AddEventHandler('esx_policejob:isSearching', function(target, boolean)
    local _source = source
    local xPlayer = ESX.GetPlayerFromId(_source)
    if boolean == nil then
        SearchTable[target] = xPlayer.identifier
    else
        SearchTable[target] = nil
    end
end)
