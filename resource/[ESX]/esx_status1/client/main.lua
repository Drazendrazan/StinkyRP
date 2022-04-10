ESX = nil
Citizen.CreateThread(function()
	while ESX == nil do
		TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
		Citizen.Wait(1500)
	end
end)

RegisterNetEvent('esx:playerLoaded')
AddEventHandler('esx:playerLoaded', function(xPlayer)
	ESX.PlayerData = xPlayer
end)

RegisterNetEvent('esx:setJob')
AddEventHandler('esx:setJob', function(job)
	ESX.PlayerData.job = job
end)

RegisterNetEvent('esx:addInventoryItem')
AddEventHandler('esx:addInventoryItem', function(item, count)
	if ESX.PlayerData and ESX.PlayerData.inventory then
		Citizen.CreateThread(function()
			Citizen.Wait(1500)
			ESX.PlayerData = ESX.GetPlayerData()

			local found = false
			for i = 1, #ESX.PlayerData.inventory, 1 do
				if ESX.PlayerData.inventory[i].name == item.name then
					ESX.PlayerData.inventory[i] = item
					found = true
					break
				end
			end

			if not found then
				ESX.TriggerServerCallback('esx:isValidItem', function(status)
					if status then
						table.insert(ESX.PlayerData.inventory, item)
					end
				end, item.name)
			end
		end)
	end
end)

RegisterNetEvent('esx:removeInventoryItem')
AddEventHandler('esx:removeInventoryItem', function(item, count)
	if ESX.PlayerData and ESX.PlayerData.inventory then
		Citizen.CreateThread(function()
			Citizen.Wait(1500)
			ESX.PlayerData = ESX.GetPlayerData()

			local found = false
			for i = 1, #ESX.PlayerData.inventory, 1 do
				if ESX.PlayerData.inventory[i].name == item.name then
					ESX.PlayerData.inventory[i] = item
					found = true
					break
				end
			end

			if not found then
				ESX.TriggerServerCallback('esx:isValidItem', function(status)
					if status then
						table.insert(ESX.PlayerData.inventory, item)
					end
				end, item.name)
			end
		end)
	end
end)

local Status = {}
local loaded = false
local isPaused = false

local display = true
local displayRadio = false
local displayGPS = false

local radio = {
	status = nil,
	channel = nil,
	mode = 0
}

function GetStatusData(ped, health, armor)
	local statuses = {
		{ 
			name = 'health',
			val = (health or GetEntityHealth(ped)),
			percent = 0
		},
		{
			name = 'armor',
			val = (armor or GetPedArmour(ped)),
			percent = 0
		}
	}
	for _, status in ipairs(Status) do
		table.insert(statuses, {
			name	= status.name,
			val		= status.val,
			percent	= (status.val / Config.StatusMax) * 100
		})
		
	end

	return statuses
end


RegisterNetEvent('esx_status:load')
AddEventHandler('esx_status:load', function(statuses)
	for _, status in ipairs(Status) do
		for _, _status in ipairs(statuses) do
			if status.name == _status.name then
				status.set(_status.val)
			end
		end
	end

	loaded = true
end)

RegisterNetEvent('esx_status:set')
AddEventHandler('esx_status:set', function(name, val)
	for _, status in ipairs(Status) do
		if status.name == name then
			status.set(val)
			break
		end
	end

	TriggerServerEvent('esx_status:update', GetStatusData(ped, health, armor))
end)

RegisterNetEvent('esx_status:add')
AddEventHandler('esx_status:add', function(name, val)
	for _, status in ipairs(Status) do
		if status.name == name then
			status.add(val)
			break
		end
	end

	TriggerServerEvent('esx_status:update', GetStatusData(ped, health, armor))
end)

RegisterNetEvent('esx_status:remove')
AddEventHandler('esx_status:remove', function(name, val)
	for _, status in ipairs(Status) do
		if status.name == name then
			status.remove(val)
			break
		end
	end

	TriggerServerEvent('esx_status:update', GetStatusData(ped, health, armor))
end)

RegisterNetEvent('esx_status:updateColor')
AddEventHandler('esx_status:updateColor', function(name, color)
	for _, status in ipairs(Status) do
		if status.name == name then
			status.updateColor(color)
			break
		end
	end

	TriggerServerEvent('esx_status:update', GetStatusData(ped, health, armor))
end)

AddEventHandler('esx_status:registerStatus', function(name, default, color, visible, tickCallback)
	local s = CreateStatus(name, default, color, visible, tickCallback)
	table.insert(Status, s)
end)

AddEventHandler('esx_status:getStatus', function(name, cb)
	for _, status in ipairs(Status) do
		if status.name == name then
			cb(status)
			return
		end
	end
end)



Citizen.CreateThread(function()
	TriggerEvent('esx_status:loaded')

    RequestStreamedTextureDict('mpleaderboard')
    while not HasStreamedTextureDictLoaded('mpleaderboard') do
        Citizen.Wait(250)
    end

	local updateTimer, tickTimer, updateGlobal
	while true do
		Citizen.Wait(50)
		if IsPauseMenuActive() then
			if not isPaused then
				isPaused = true
			end
		elseif isPaused then
			isPaused = false
		end
		if loaded then
			local timer = GetGameTimer()
			if not tickTimer or tickTimer < timer then
				for _, status in ipairs(Status) do
					status.onTick()
				end

				tickTimer = timer + Config.TickTime
			end

			if not updateTimer or updateTimer < timer then
				TriggerServerEvent('esx_status:update', GetStatusData())
				updateTimer = timer + Config.UpdateInterval
			end

			if not updateGlobal or updateGlobal < timer then
				TriggerServerEvent('esx_status:updateDB')
				updateGlobal = timer + Config.UpdateGlobal
			end
		end
	end
end)