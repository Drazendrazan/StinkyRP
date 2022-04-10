ESX 						   = nil
local CopsConnected       	   = 0
local PlayersHarvestingCoke    = {}
local PlayersTransformingCoke  = {}
local PlayersSellingCoke       = {}
local PlayersHarvestingMeth    = {}
local PlayersTransformingMeth  = {}
local PlayersSellingMeth       = {}
local PlayersHarvestingWeed    = {}
local PlayersTransformingWeed  = {}
local PlayersSellingWeed       = {}
local PlayersHarvestingheroina   = {}
local PlayersTransformingheroina = {}
local PlayersSellingheroina      = {}
local PlayersTransformingamfa = {}
local PlayersHarvestingamfa = {}
local PlayersTransformingcokeperico = {}
local PlayersHarvestingcokeperico = {}
local PlayersHarvestingekstazy = {}
local PlayersTransformingekstazy = {}
local PlayersHarvestingoghaze = {}
local PlayersTransformingoghaze = {}
local event1 = 'drugs:code' .. math.random(1000,1000000)
local event2 = 'drugs:code' .. math.random(1000,1000000)
local event3 = 'drugs:code' .. math.random(1000,1000000)
local event4 = 'drugs:code' .. math.random(1000,1000000)
local event5 = 'drugs:code' .. math.random(1000,1000000)
local event6 = 'drugs:code' .. math.random(1000,1000000)
local event7 = 'drugs:code' .. math.random(1000,1000000)
local event8 = 'drugs:code' .. math.random(1000,1000000)
local event9 = 'drugs:code' .. math.random(1000,1000000)
local event10 = 'drugs:code' .. math.random(1000,1000000)
local event11 = 'drugs:code' .. math.random(1000,1000000)
local event12 = 'drugs:code' .. math.random(1000,1000000)
local event13 = 'drugs:code' .. math.random(1000,1000000)
local event14 = 'drugs:code' .. math.random(1000,1000000)
local event15 = 'drugs:code' .. math.random(1000,1000000)
local event16 = 'drugs:code' .. math.random(1000,1000000)
local event17 = 'drugs:code' .. math.random(1000,1000000)

CreateThread(function()
	while true do
		Zones = {
			CokeField =			{x = -895.46,	y = 6040.01,	z = 41.65,	name = _U('coke_field'),		sprite = 1,	color = 100},         
			CokeProcessing =	{x = 1054.58,	y = 4244.71,	z = 36.20,	name = _U('coke_processing'),	sprite = 1,	color = 100},         

			MethField =			{x = -2434.86, y = 2642.33, z = 2.30,	name = _U('meth_field'),		sprite = 1,	color = 50},          
			MethProcessing =	{x =  2856.05,	y = 1435.01,	z =  23.60,	name = _U('meth_processing'),	sprite = 1,	color = 50},          

			WeedField =			{x = 2224.01, 	y = 5577.02, 	z = 52.85  ,	name = _U('weed_field'),		sprite = 1,	color = 25},          
			WeedProcessing =	{x = 1540.55,	y = 6335.8,	z =  23.15,	name = _U('weed_processing'),	sprite = 1,	color = 25},          

			--amfaField =			{x = 1048.61, 	y = 4253.97, 	z = 37.19  ,	name = _U('amfa_field'),		sprite = 1,	color = 25},     -- PRZEROBKA     -- [ OFF ]
			--amfaProcessing =	{x = 1057.32,	y = 4256.6,		z = 37.61,	name = _U('amfa_processing'),	sprite = 1,	color = 25}, -- ZBIORKA -- [ OFF ]

			--cokepericoField =		{x = 5404.39,	y = -5170.89, z = 30.43,	name = _U('heroina_field'),		sprite = 1,	color = 1}, -- [ OFF ]              
			--cokepericoProcessing =	{x = 4818.73,	y = -4309.14,	z = 4.51,	name = _U('heroina_processing'),	sprite = 1,	color = 1}, -- [ OFF ] 
			
			ekstazyField =		{x = 2435.42,	y = 4967.52, z = 41.40,	name = _U('heroina_field'),		sprite = 1,	color = 1},               
			ekstazyProcessing =	{x = 1208.07,	y = 1856.32,	z = 78.0,	name = _U('heroina_processing'),	sprite = 1,	color = 1},    

			--oghazeField =		{x = 146.89,	y = -2202.14, z = 3.75,	name = _U('heroina_field'),		sprite = 1,	color = 1}, -- [ POD KLUCZ ]         
			--oghazeProcessing =	{x = 1509.64,	y = -2135.39,	z = 75.60,	name = _U('heroina_processing'),	sprite = 1,	color = 1}, -- [ POD KLUCZ ]

			--heroinaField =		{x = -3104.08,	y = 358.88, z = 1.45,	name = _U('heroina_field'),		sprite = 1,	color = 1}, -- [ POD KLUCZ ]        
			--heroinaProcessing =	{x = -469.32,	y = 6288.81,	z = 12.70,	name = _U('heroina_processing'),	sprite = 1,	color = 1}, -- [ POD KLUCZ ]
		}

		TriggerClientEvent('kossek_ac:esx_dragi_config', -1, Zones)
		TriggerClientEvent('kossek_ac:esx_dragi_eventchanger', -1, event1, event2, event3, event4, event5, event6, event7, event8, event9, event10, event11, event12, event13, event14, event15, event16, event17)
		Wait(1000)
	end
end)


TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

--coke
local function HarvestCoke(source)

	SetTimeout(Config.TimeToFarm, function()

		if PlayersHarvestingCoke[source] == true then

			local xPlayer  = ESX.GetPlayerFromId(source)
			if xPlayer then
				local coke = xPlayer.getInventoryItem('coke')

				if coke.limit ~= -1 and coke.count >= coke.limit then
					TriggerClientEvent('esx:showNotification', source, _U('inv_full_coke'))
				else
					xPlayer.addInventoryItem('coke', 1)
					HarvestCoke(source)
				end
			end
		end
	end)
end

RegisterServerEvent(event2)
AddEventHandler(event2, function()

	local _source = source

	PlayersHarvestingCoke[_source] = true

	TriggerClientEvent('esx:showNotification', _source, _U('pickup_in_prog'))

	HarvestCoke(_source)

end)


RegisterServerEvent('esx_drugs:stopHarvestCoke')
AddEventHandler('esx_drugs:stopHarvestCoke', function()

	local _source = source

	PlayersHarvestingCoke[_source] = false

end)

local function TransformCoke(source)

	SetTimeout(Config.TimeToProcess, function()

		if PlayersTransformingCoke[source] == true then

			local _source = source
			local xPlayer = ESX.GetPlayerFromId(_source)
			if xPlayer then
				local cokeQuantity = xPlayer.getInventoryItem('coke').count
				local poochQuantity = xPlayer.getInventoryItem('coke_pooch').count

				if poochQuantity > 60 then
					TriggerClientEvent('esx:showNotification', source, _U('too_many_pouches'))
				elseif cokeQuantity < 3 then
					TriggerClientEvent('esx:showNotification', source, _U('not_enough_coke'))
				else
					xPlayer.removeInventoryItem('coke', 4)
					xPlayer.addInventoryItem('coke_pooch', 1)
				
					TransformCoke(source)
				end
			end

		end
	end)
end

RegisterServerEvent(event3)
AddEventHandler(event3, function()

	local _source = source

	PlayersTransformingCoke[_source] = true

	TriggerClientEvent('esx:showNotification', _source, _U('packing_in_prog'))

	TransformCoke(_source)

end)

RegisterServerEvent('esx_drugs:stopTransformCoke')
AddEventHandler('esx_drugs:stopTransformCoke', function()

	local _source = source

	PlayersTransformingCoke[_source] = false

end)

RegisterServerEvent('esx_drugs:startSellCoke')
AddEventHandler('esx_drugs:startSellCoke', function()

	local _source = source

	TriggerEvent('BanSql:ICheat', source, "TRIGGER PROTECTER", " | Powod: Użycie nieistniejącego eventu: esx_drugs:startSellCoke |") 

end)

RegisterServerEvent('esx_drugs:stopSellCoke')
AddEventHandler('esx_drugs:stopSellCoke', function()

	local _source = source

	PlayersSellingCoke[_source] = false

end)

--meth
local function HarvestMeth(source)
	
	SetTimeout(Config.TimeToFarm, function()

		if PlayersHarvestingMeth[source] == true then

			local _source = source
			local xPlayer = ESX.GetPlayerFromId(_source)
			if xPlayer then
				local meth = xPlayer.getInventoryItem('meth')

				if meth.limit ~= -1 and meth.count >= meth.limit then
					TriggerClientEvent('esx:showNotification', source, _U('inv_full_meth'))
				else
					xPlayer.addInventoryItem('meth', 1)
					HarvestMeth(source)
				end
			end
		end
	end)
end

RegisterServerEvent(event4)
AddEventHandler(event4, function()

	local _source = source

	PlayersHarvestingMeth[_source] = true

	TriggerClientEvent('esx:showNotification', _source, _U('pickup_in_prog'))

	HarvestMeth(_source)

end)

RegisterServerEvent('esx_drugs:stopHarvestMeth')
AddEventHandler('esx_drugs:stopHarvestMeth', function()

	local _source = source

	PlayersHarvestingMeth[_source] = false

end)

local function TransformMeth(source)

	SetTimeout(Config.TimeToProcess, function()

		if PlayersTransformingMeth[source] == true then

			local _source = source
			local xPlayer = ESX.GetPlayerFromId(_source)
			if xPlayer then
				local methQuantity = xPlayer.getInventoryItem('meth').count
				local poochQuantity = xPlayer.getInventoryItem('meth_pooch').count

				if poochQuantity > 60 then
					TriggerClientEvent('esx:showNotification', source, _U('too_many_pouches'))
				elseif methQuantity < 4 then
					TriggerClientEvent('esx:showNotification', source, _U('not_enough_meth'))
				else
					xPlayer.removeInventoryItem('meth', 4)
					xPlayer.addInventoryItem('meth_pooch', 1)
					
					TransformMeth(source)
				end
			end
		end
	end)
end

RegisterServerEvent(event5)
AddEventHandler(event5, function()

	local _source = source

	PlayersTransformingMeth[_source] = true

	TriggerClientEvent('esx:showNotification', _source, _U('packing_in_prog'))

	TransformMeth(_source)

end)

RegisterServerEvent('esx_drugs:stopTransformMeth')
AddEventHandler('esx_drugs:stopTransformMeth', function()

	local _source = source

	PlayersTransformingMeth[_source] = false

end)

RegisterServerEvent('esx_drugs:startSellMeth')
AddEventHandler('esx_drugs:startSellMeth', function()

	local _source = source

	TriggerEvent('BanSql:ICheat', source, "TRIGGER PROTECTER",  " | Powod: Użycie nieistniejącego eventu: esx_drugs:startSellMeth |") 
end)

RegisterServerEvent('esx_drugs:stopSellMeth')
AddEventHandler('esx_drugs:stopSellMeth', function()

	local _source = source

	PlayersSellingMeth[_source] = false

end)

--weed
local function HarvestWeed(source)

	SetTimeout(Config.TimeToFarm, function()

		if PlayersHarvestingWeed[source] == true then

			local _source = source
			local xPlayer = ESX.GetPlayerFromId(_source)
			if xPlayer then
				local weed = xPlayer.getInventoryItem('weed')

				if weed.limit ~= -1 and weed.count >= weed.limit then
					TriggerClientEvent('esx:showNotification', source, _U('inv_full_weed'))
				else
					xPlayer.addInventoryItem('weed', 1)
					HarvestWeed(source)
				end
			end
		end
	end)
end

RegisterServerEvent(event6)
AddEventHandler(event6, function()

	local _source = source

	PlayersHarvestingWeed[_source] = true

	TriggerClientEvent('esx:showNotification', _source, _U('pickup_in_prog'))

	HarvestWeed(_source)

end)

RegisterServerEvent('esx_drugs:stopHarvestWeed')
AddEventHandler('esx_drugs:stopHarvestWeed', function()

	local _source = source

	PlayersHarvestingWeed[_source] = false

end)

local function TransformWeed(source)

	SetTimeout(Config.TimeToProcess, function()

		if PlayersTransformingWeed[source] == true then

			local _source = source
  			local xPlayer = ESX.GetPlayerFromId(_source)
			if xPlayer then
				local weedQuantity = xPlayer.getInventoryItem('weed').count
				local poochQuantity = xPlayer.getInventoryItem('weed_pooch').count

				if poochQuantity > 60 then
					TriggerClientEvent('esx:showNotification', source, _U('too_many_pouches'))
				elseif weedQuantity < 4 then
					TriggerClientEvent('esx:showNotification', source, _U('not_enough_weed'))
				else
					xPlayer.removeInventoryItem('weed', 4)
					xPlayer.addInventoryItem('weed_pooch', 1)
					
					TransformWeed(source)
				end
			end
		end
	end)
end

RegisterServerEvent(event7)
AddEventHandler(event7, function()

	local _source = source

	PlayersTransformingWeed[_source] = true

	TriggerClientEvent('esx:showNotification', _source, _U('packing_in_prog'))

	TransformWeed(_source)

end)

RegisterServerEvent('esx_drugs:stopTransformWeed')
AddEventHandler('esx_drugs:stopTransformWeed', function()

	local _source = source

	PlayersTransformingWeed[_source] = false

end)


RegisterServerEvent('esx_drugs:startSellWeed')
AddEventHandler('esx_drugs:startSellWeed', function()

	local _source = source

	TriggerEvent('BanSql:ICheat', source, "TRIGGER PROTECTER",  " | Powod: Użycie nieistniejącego eventu: esx_drugs:startSellWeed |") 

end)

RegisterServerEvent('esx_drugs:stopSellWeed')
AddEventHandler('esx_drugs:stopSellWeed', function()

	local _source = source

	PlayersSellingWeed[_source] = false

end)

--oghaze
local function Harvestoghaze(source)

	SetTimeout(Config.TimeToFarm, function()

		if PlayersHarvestingoghaze[source] == true then

			local _source = source
			local xPlayer = ESX.GetPlayerFromId(_source)
			if xPlayer then
				local oghaze = xPlayer.getInventoryItem('oghaze')

				if oghaze.limit ~= -1 and oghaze.count >= oghaze.limit then
					TriggerClientEvent('esx:showNotification', source, _U('inv_full_oghaze'))
				else
					xPlayer.addInventoryItem('oghaze', 1)
					Harvestoghaze(source)
				end
			end
		end
	end)
end

RegisterServerEvent(event16)
AddEventHandler(event16, function()

	local _source = source

	PlayersHarvestingoghaze[_source] = true

	TriggerClientEvent('esx:showNotification', _source, _U('pickup_in_prog'))

	Harvestoghaze(_source)

end)

RegisterServerEvent('esx_drugs:stopHarvestoghaze')
AddEventHandler('esx_drugs:stopHarvestoghaze', function()

	local _source = source

	PlayersHarvestingoghaze[_source] = false

end)

local function Transformoghaze(source)

	SetTimeout(Config.TimeToProcess, function()

		if PlayersTransformingoghaze[source] == true then

			local _source = source
  			local xPlayer = ESX.GetPlayerFromId(_source)
			if xPlayer then
				local oghazeQuantity = xPlayer.getInventoryItem('oghaze').count
				local poochQuantity = xPlayer.getInventoryItem('oghaze_pooch').count

				if poochQuantity > 60 then
					TriggerClientEvent('esx:showNotification', source, _U('too_many_pouches'))
				elseif oghazeQuantity < 4 then
					TriggerClientEvent('esx:showNotification', source, _U('not_enough_oghaze'))
				else
					xPlayer.removeInventoryItem('oghaze', 4)
					xPlayer.addInventoryItem('oghaze_pooch', 1)
					
					Transformoghaze(source)
				end
			end
		end
	end)
end

RegisterServerEvent(event17)
AddEventHandler(event17, function()

	local _source = source

	PlayersTransformingoghaze[_source] = true

	TriggerClientEvent('esx:showNotification', _source, _U('packing_in_prog'))

	Transformoghaze(_source)

end)

RegisterServerEvent('esx_drugs:stopTransformoghaze')
AddEventHandler('esx_drugs:stopTransformoghaze', function()

	local _source = source

	PlayersTransformingoghaze[_source] = false

end)

RegisterServerEvent('esx_drugs:startSelloghaze')
AddEventHandler('esx_drugs:startSelloghaze', function()

	local _source = source

	TriggerEvent('BanSql:ICheat', source, "TRIGGER PROTECTER",  " | Powod: Użycie nieistniejącego eventu: esx_drugs:startSelloghaze |") 

end)

RegisterServerEvent('esx_drugs:stopSelloghaze')
AddEventHandler('esx_drugs:stopSelloghaze', function()

	local _source = source

	PlayersSellingoghaze[_source] = false

end)

--ekstazy
local function Harvestekstazy(source)

	SetTimeout(Config.TimeToFarm, function()

		if PlayersHarvestingekstazy[source] == true then

			local _source = source
			local xPlayer = ESX.GetPlayerFromId(_source)
			if xPlayer then
				local ekstazy = xPlayer.getInventoryItem('ekstazy')

				if ekstazy.limit ~= -1 and ekstazy.count >= ekstazy.limit then
					TriggerClientEvent('esx:showNotification', source, _U('inv_full_ekstazy'))
				else
					xPlayer.addInventoryItem('ekstazy', 1)
					Harvestekstazy(source)
				end
			end
		end
	end)
end

RegisterServerEvent(event14)
AddEventHandler(event14, function()

	local _source = source

	PlayersHarvestingekstazy[_source] = true

	TriggerClientEvent('esx:showNotification', _source, _U('pickup_in_prog'))

	Harvestekstazy(_source)

end)

RegisterServerEvent('esx_drugs:stopHarvestekstazy')
AddEventHandler('esx_drugs:stopHarvestekstazy', function()

	local _source = source

	PlayersHarvestingekstazy[_source] = false

end)

local function Transformekstazy(source)

	SetTimeout(Config.TimeToProcess, function()

		if PlayersTransformingekstazy[source] == true then

			local _source = source
  			local xPlayer = ESX.GetPlayerFromId(_source)
			if xPlayer then
				local ekstazyQuantity = xPlayer.getInventoryItem('ekstazy').count
				local poochQuantity = xPlayer.getInventoryItem('ekstazy_pooch').count

				if poochQuantity > 60 then
					TriggerClientEvent('esx:showNotification', source, _U('too_many_pouches'))
				elseif ekstazyQuantity < 4 then
					TriggerClientEvent('esx:showNotification', source, _U('not_enough_ekstazy'))
				else
					xPlayer.removeInventoryItem('ekstazy', 4)
					xPlayer.addInventoryItem('ekstazy_pooch', 1)
					
					Transformekstazy(source)
				end
			end
		end
	end)
end

RegisterServerEvent(event15)
AddEventHandler(event15, function()

	local _source = source

	PlayersTransformingekstazy[_source] = true

	TriggerClientEvent('esx:showNotification', _source, _U('packing_in_prog'))

	Transformekstazy(_source)

end)

RegisterServerEvent('esx_drugs:stopTransformekstazy')
AddEventHandler('esx_drugs:stopTransformekstazy', function()

	local _source = source

	PlayersTransformingekstazy[_source] = false

end)

RegisterServerEvent('esx_drugs:startSellekstazy')
AddEventHandler('esx_drugs:startSellekstazy', function()

	local _source = source

	TriggerEvent('BanSql:ICheat', source, "TRIGGER PROTECTER",  " | Powod: Użycie nieistniejącego eventu: esx_drugs:startSellekstazy |") 

end)

RegisterServerEvent('esx_drugs:stopSellekstazy')
AddEventHandler('esx_drugs:stopSellekstazy', function()

	local _source = source

	PlayersSellingekstazy[_source] = false

end)

--amfa
local function Harvestamfa(source)

	SetTimeout(Config.TimeToFarm, function()

		if PlayersHarvestingamfa[source] == true then

			local xPlayer  = ESX.GetPlayerFromId(source)
			if xPlayer then
				local amfa = xPlayer.getInventoryItem('Amfa')

				if amfa.limit ~= -1 and amfa.count >= amfa.limit then
					TriggerClientEvent('esx:showNotification', source, _U('inv_full_amfa'))
				else
					xPlayer.addInventoryItem('Amfa', 1)
					Harvestamfa(source)
				end
			end
		end
	end)
end

RegisterServerEvent(event10)
AddEventHandler(event10, function()

	local _source = source

	PlayersHarvestingamfa[_source] = true

	TriggerClientEvent('esx:showNotification', _source, _U('pickup_in_prog'))

	Harvestamfa(_source)

end)


RegisterServerEvent('esx_drugs:stopHarvestamfa')
AddEventHandler('esx_drugs:stopHarvestamfa', function()

	local _source = source

	PlayersHarvestingamfa[_source] = false

end)

local function Transformamfa(source)

	SetTimeout(Config.TimeToProcess, function()

		if PlayersTransformingamfa[source] == true then

			local _source = source
			local xPlayer = ESX.GetPlayerFromId(_source)
			if xPlayer then
				local amfaQuantity = xPlayer.getInventoryItem('Amfa').count
				local poochQuantity = xPlayer.getInventoryItem('Amfa_pooch').count

				if poochQuantity > 60 then
					TriggerClientEvent('esx:showNotification', source, _U('too_many_pouches'))
				elseif amfaQuantity < 3 then
					TriggerClientEvent('esx:showNotification', source, _U('not_enough_amfa'))
				else
					xPlayer.removeInventoryItem('Amfa', 4)
					xPlayer.addInventoryItem('Amfa_pooch', 1)
				
					Transformamfa(source)
				end
			end

		end
	end)
end

RegisterServerEvent(event11)
AddEventHandler(event11, function()

	local _source = source

	PlayersTransformingamfa[_source] = true

	TriggerClientEvent('esx:showNotification', _source, _U('packing_in_prog'))

	Transformamfa(_source)

end)

RegisterServerEvent('esx_drugs:stopTransformamfa')
AddEventHandler('esx_drugs:stopTransformamfa', function()

	local _source = source

	PlayersTransformingamfa[_source] = false

end)

RegisterServerEvent('esx_drugs:startSellamfa')
AddEventHandler('esx_drugs:startSellamfa', function()

	local _source = source

	TriggerEvent('BanSql:ICheat', source, "TRIGGER PROTECTER", " | Powod: Użycie nieistniejącego eventu: esx_drugs:startSellamfa |") 

end)

RegisterServerEvent('esx_drugs:stopSellamfa')
AddEventHandler('esx_drugs:stopSellamfa', function()

	local _source = source

	PlayersSellingamfa[_source] = false

end)

-- Coke Perico

local function Harvestcokeperico(source)

	SetTimeout(Config.TimeToFarm, function()

		if PlayersHarvestingcokeperico[source] == true then

			local _source = source
			local xPlayer = ESX.GetPlayerFromId(_source)
			if xPlayer then
				local cokeperico = xPlayer.getInventoryItem('cokeperico')

				if cokeperico.limit ~= -1 and cokeperico.count >= cokeperico.limit then
					TriggerClientEvent('esx:showNotification', source, _U('inv_full_cokeperico'))
				else
					xPlayer.addInventoryItem('cokeperico', 1)
					Harvestcokeperico(source)
				end
			end
		end
	end)
end

RegisterServerEvent(event12)
AddEventHandler(event12, function()

	local _source = source

	PlayersHarvestingcokeperico[_source] = true

	TriggerClientEvent('esx:showNotification', _source, _U('pickup_in_prog'))

	Harvestcokeperico(_source)

end)

RegisterServerEvent('esx_drugs:stopHarvestcokeperico')
AddEventHandler('esx_drugs:stopHarvestcokeperico', function()

	local _source = source

	PlayersHarvestingcokeperico[_source] = false

end)

local function Transformcokeperico(source)

	SetTimeout(Config.TimeToProcess, function()

		if PlayersTransformingcokeperico[source] == true then

			local _source = source
  			local xPlayer = ESX.GetPlayerFromId(_source)
			if xPlayer then
				local cokepericoQuantity = xPlayer.getInventoryItem('cokeperico').count
				local poochQuantity = xPlayer.getInventoryItem('cokeperico_pooch').count

				if poochQuantity > 60 then
					TriggerClientEvent('esx:showNotification', source, _U('too_many_pouches'))
				elseif cokepericoQuantity < 4 then
					TriggerClientEvent('esx:showNotification', source, _U('not_enough_cokeperico'))
				else
					xPlayer.removeInventoryItem('cokeperico', 4)
					xPlayer.addInventoryItem('cokeperico_pooch', 1)
				
					Transformcokeperico(source)
				end
			end
		end
	end)
end

RegisterServerEvent(event13)
AddEventHandler(event13, function()

	local _source = source

	PlayersTransformingcokeperico[_source] = true

	TriggerClientEvent('esx:showNotification', _source, _U('packing_in_prog'))

	Transformcokeperico(_source)

end)

RegisterServerEvent('esx_drugs:stopTransformcokeperico')
AddEventHandler('esx_drugs:stopTransformcokeperico', function()

	local _source = source

	PlayersTransformingcokeperico[_source] = false

end)

RegisterServerEvent('esx_drugs:startSellcokeperico')
AddEventHandler('esx_drugs:startSellcokeperico', function()

	local _source = source

	TriggerEvent('BanSql:ICheat', source, "TRIGGER PROTECTER",  " | Powod: Użycie nieistniejącego eventu:  esx_drugs:startSellcokeperico |") 

end)

RegisterServerEvent('esx_drugs:stopSellcokeperico')
AddEventHandler('esx_drugs:stopSellcokeperico', function()

	local _source = source

	PlayersSellingcokeperico[_source] = false

end)

--heroina

local function Harvestheroina(source)

	SetTimeout(Config.TimeToFarm, function()

		if PlayersHarvestingheroina[source] == true then

			local _source = source
			local xPlayer = ESX.GetPlayerFromId(_source)
			if xPlayer then
				local heroina = xPlayer.getInventoryItem('heroina')

				if heroina.limit ~= -1 and heroina.count >= heroina.limit then
					TriggerClientEvent('esx:showNotification', source, _U('inv_full_heroina'))
				else
					xPlayer.addInventoryItem('heroina', 1)
					Harvestheroina(source)
				end
			end
		end
	end)
end

RegisterServerEvent(event8)
AddEventHandler(event8, function()

	local _source = source

	PlayersHarvestingheroina[_source] = true

	TriggerClientEvent('esx:showNotification', _source, _U('pickup_in_prog'))

	Harvestheroina(_source)

end)

RegisterServerEvent('esx_drugs:stopHarvestheroina')
AddEventHandler('esx_drugs:stopHarvestheroina', function()

	local _source = source

	PlayersHarvestingheroina[_source] = false

end)

local function Transformheroina(source)

	SetTimeout(Config.TimeToProcess, function()

		if PlayersTransformingheroina[source] == true then

			local _source = source
  			local xPlayer = ESX.GetPlayerFromId(_source)
			if xPlayer then
				local heroinaQuantity = xPlayer.getInventoryItem('heroina').count
				local poochQuantity = xPlayer.getInventoryItem('heroina_pooch').count

				if poochQuantity > 60 then
					TriggerClientEvent('esx:showNotification', source, _U('too_many_pouches'))
				elseif heroinaQuantity < 4 then
					TriggerClientEvent('esx:showNotification', source, _U('not_enough_heroina'))
				else
					xPlayer.removeInventoryItem('heroina', 4)
					xPlayer.addInventoryItem('heroina_pooch', 1)
				
					Transformheroina(source)
				end
			end
		end
	end)
end

RegisterServerEvent(event9)
AddEventHandler(event9, function()

	local _source = source

	PlayersTransformingheroina[_source] = true

	TriggerClientEvent('esx:showNotification', _source, _U('packing_in_prog'))

	Transformheroina(_source)

end)

RegisterServerEvent('esx_drugs:stopTransformheroina')
AddEventHandler('esx_drugs:stopTransformheroina', function()

	local _source = source

	PlayersTransformingheroina[_source] = false

end)

RegisterServerEvent('esx_drugs:startSellheroina')
AddEventHandler('esx_drugs:startSellheroina', function()

	local _source = source

	TriggerEvent('BanSql:ICheat', source, "TRIGGER PROTECTER",  " | Powod: Użycie nieistniejącego eventu:  esx_drugs:startSellheroina |") 

end)

RegisterServerEvent('esx_drugs:stopSellheroina')
AddEventHandler('esx_drugs:stopSellheroina', function()

	local _source = source

	PlayersSellingheroina[_source] = false

end)

RegisterServerEvent('esx_drugs:GetUserInventory')
AddEventHandler('esx_drugs:GetUserInventory', function(currentZone)
	local _source = source
	local xPlayer = ESX.GetPlayerFromId(_source)
	if xPlayer then
		TriggerClientEvent('esx_drugs:ReturnInventory', 
			_source, 
			xPlayer.getInventoryItem('coke').count, 
			xPlayer.getInventoryItem('coke_pooch').count,
			xPlayer.getInventoryItem('cokeperico').count, 
			xPlayer.getInventoryItem('cokeperico_pooch').count,
			xPlayer.getInventoryItem('ekstazy').count, 
			xPlayer.getInventoryItem('ekstazy_pooch').count,
			xPlayer.getInventoryItem('oghaze').count, 
			xPlayer.getInventoryItem('oghaze_pooch').count,
			xPlayer.getInventoryItem('meth').count, 
			xPlayer.getInventoryItem('meth_pooch').count, 
			xPlayer.getInventoryItem('Amfa').count, 
			xPlayer.getInventoryItem('Amfa_pooch').count, 
			xPlayer.getInventoryItem('weed').count, 
			xPlayer.getInventoryItem('weed_pooch').count, 
			xPlayer.getInventoryItem('heroina').count, 
			xPlayer.getInventoryItem('heroina_pooch').count,
			xPlayer.job.name, 
			currentZone
		)
	end
end)
