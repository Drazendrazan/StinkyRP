ESX = nil

TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)


local connectedPlayers = {}

function GetPlayers()
	return connectedPlayers
end

RegisterServerEvent('esx_scoreboard:players')
AddEventHandler('esx_scoreboard:players', function(sorce, xPlayer)
	local xPlayer = ESX.GetPlayerFromId(source)

	if xPlayer.group == 'best' or xPlayer.group == 'superadmin' or xPlayer.group == 'admin' or xPlayer.group == 'moderator' or xPlayer.group == 'support' or xPlayer.group == 'trialsupport' then
		IsAdmin = true
	else
		IsAdmin = false
	end

	Counters = {
		['players'] = GetNumPlayerIndices(),
		['police'] = 0,
		['ambulance'] = 0,
		['mecano'] = 0, 
		['doj'] = 0,
	}

	local xPlayers = ESX.GetPlayers()
	for _, xP in ipairs(xPlayers) do 
		local xPlayer = ESX.GetPlayerFromId(xP)
		if Counters[xPlayer.job.name] then 
			Counters[xPlayer.job.name] = Counters[xPlayer.job.name] + 1
		end

		if xPlayer.jobs then 
			for i, _ in ipairs(xPlayer.jobs) do 
				if Counters[i] then 
					Counters[i] = Counters[i] + 1
				end
			end
		end
	end

	TriggerClientEvent('esx_scoreboard:players', source, Counters, IsAdmin)
end)

ESX.RegisterServerCallback('esx_scoreboard:getConnectedCops', function(source, cb)
	local xPlayer = ESX.GetPlayerFromId(source)
	ZlomusPlayers = {
		['players'] = GetNumPlayerIndices(),
		['maxPlayers'] = GetConvar('sv_maxclients'),
		['police'] = 0,
		['cardealer'] = 0,
		['ambulance'] = 0,
		['mecano'] = 0, 
		['doj'] = 0,
	}

	local xPlayers = ESX.GetPlayers()
	for _, xP in ipairs(xPlayers) do 
		local xPlayer = ESX.GetPlayerFromId(xP)
		if ZlomusPlayers[xPlayer.job.name] then 
			ZlomusPlayers[xPlayer.job.name] = ZlomusPlayers[xPlayer.job.name] + 1
		end

		if xPlayer.jobs then 
			for i, _ in ipairs(xPlayer.jobs) do 
				if ZlomusPlayers[i] then 
					ZlomusPlayers[i] = ZlomusPlayers[i] + 1
				end
			end
		end
	end
	cb(ZlomusPlayers)
end)

function Organizacje()
	local xPlayer = ESX.GetPlayerFromId(source)
	ZlomusPlayers = {
		['players'] = GetNumPlayerIndices(),
		['org1'] = 0,
		['org2'] = 0,
		['org3'] = 0,
		['org4'] = 0,
		['org5'] = 0,
		['org6'] = 0,
		['org7'] = 0,
		['org8'] = 0,
		['org9'] = 0,
		['org10'] = 0,
		['org11'] = 0,
		['org12'] = 0,
		['org13'] = 0,
		['org14'] = 0,
		['org15'] = 0,
		['org16'] = 0,
		['org17'] = 0,
		['org18'] = 0,
		['org19'] = 0,
		['org20'] = 0,
		['org21'] = 0,
		['org22'] = 0,
		['org23'] = 0,
		['org24'] = 0
	}

	local xPlayers = ESX.GetPlayers()
	for _, xP in ipairs(xPlayers) do 
		local xPlayer = ESX.GetPlayerFromId(xP)
		if ZlomusPlayers[xPlayer.hiddenjob.name] then 
			ZlomusPlayers[xPlayer.hiddenjob.name] = ZlomusPlayers[xPlayer.hiddenjob.name] + 1
		end

		if xPlayer.jobs then 
			for i, _ in ipairs(xPlayer.jobs) do 
				if ZlomusPlayers[i] then 
					ZlomusPlayers[i] = ZlomusPlayers[i] + 1
				end
			end
		end
	end
	return ZlomusPlayers
end

function ZlomusGetPlayers()
	return ESX.GetPlayers()
end

RegisterServerEvent('esx_scoreboard:Show')
AddEventHandler('esx_scoreboard:Show', function(text)
	local _source = source
	TriggerClientEvent("sendProximityMessageMe", -1, _source, _source, text)
end)

ESX.RegisterServerCallback('esx_scoreboard:getConnectedPlayers', function(source, cb)
	cb(connectedPlayers)
end)

AddEventHandler('esx:setJob', function(playerId, job, lastJob)
	connectedPlayers[playerId].job = job.name

	TriggerClientEvent('esx_scoreboard:counter', -1, connectedPlayers)
end)

AddEventHandler('esx:playerLoaded', function(playerId, xPlayer)
	AddPlayerToScoreboard(xPlayer, true)
end)

AddEventHandler('esx:playerDropped', function(playerId)
	connectedPlayers[playerId] = nil

	TriggerClientEvent('esx_scoreboard:counter', -1, connectedPlayers)
end)

AddEventHandler('onResourceStart', function(resource)
	if resource == GetCurrentResourceName() then
		Citizen.CreateThread(function()
			Citizen.Wait(1000)
			local players = ESX.GetPlayers()
			
			for _, player in ipairs(players) do
				local xPlayer = ESX.GetPlayerFromId(player)
				AddPlayerToScoreboard(xPlayer)
			end	
			
			--[[for i = 1, 256, 1 do
				connectedPlayers[i] = {}
				connectedPlayers[i].id = i
				connectedPlayers[i].identifier = 'hexik'..i
				connectedPlayers[i].name = 'nick'..i
				connectedPlayers[i].job = 'ambulance'
				connectedPlayers[i].group = 'user'			
			end]]
		end)
	end
end)

function AddPlayerToScoreboard(xPlayer, update)
	local playerId = xPlayer.source

	connectedPlayers[playerId] = {}
	connectedPlayers[playerId].id = playerId
	connectedPlayers[playerId].identifier = xPlayer.identifier
	connectedPlayers[playerId].name = xPlayer.getName()
	connectedPlayers[playerId].job = xPlayer.job.name
	connectedPlayers[playerId].hiddenjob = xPlayer.hiddenjob.name
	connectedPlayers[playerId].group = xPlayer.group

	if update then
		TriggerClientEvent('esx_scoreboard:counter', -1, connectedPlayers)
	end
end