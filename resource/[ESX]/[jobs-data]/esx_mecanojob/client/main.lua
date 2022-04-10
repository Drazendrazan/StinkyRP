local Keys = {
  ["ESC"] = 322, ["F1"] = 288, ["F2"] = 289, ["F3"] = 170, ["F5"] = 166, ["F6"] = 167, ["F7"] = 168, ["F8"] = 169, ["F9"] = 56, ["F10"] = 57,
  ["~"] = 243, ["1"] = 157, ["2"] = 158, ["3"] = 160, ["4"] = 164, ["5"] = 165, ["6"] = 159, ["7"] = 161, ["8"] = 162, ["9"] = 163, ["-"] = 84, ["="] = 83, ["BACKSPACE"] = 177,
  ["TAB"] = 37, ["Q"] = 44, ["W"] = 32, ["E"] = 38, ["R"] = 45, ["T"] = 245, ["Y"] = 246, ["U"] = 303, ["P"] = 199, ["["] = 39, ["]"] = 40, ["ENTER"] = 18,
  ["CAPS"] = 137, ["A"] = 34, ["S"] = 8, ["D"] = 9, ["F"] = 23, ["G"] = 47, ["H"] = 74, ["K"] = 311, ["L"] = 182,
  ["LEFTSHIFT"] = 21, ["Z"] = 20, ["X"] = 73, ["C"] = 26, ["V"] = 0, ["B"] = 29, ["N"] = 249, ["M"] = 244, [","] = 82, ["."] = 81,
  ["LEFTCTRL"] = 36, ["LEFTALT"] = 19, ["SPACE"] = 22, ["RIGHTCTRL"] = 70,
  ["HOME"] = 213, ["PAGEUP"] = 10, ["PAGEDOWN"] = 11, ["DELETE"] = 178,
  ["LEFT"] = 174, ["RIGHT"] = 175, ["TOP"] = 27, ["DOWN"] = 173,
  ["NENTER"] = 201, ["N4"] = 108, ["N5"] = 60, ["N6"] = 107, ["N+"] = 96, ["N-"] = 97, ["N7"] = 117, ["N8"] = 61, ["N9"] = 118
}

local PlayerData              = {}
local HasAlreadyEnteredMarker = false
local LastZone                = nil
local CurrentAction           = nil
local CurrentActionMsg        = ''
local CurrentActionData       = {}
local OnJob                   = false
local CurrentlyTowedVehicle   = nil
local Blips                   = {}
local NPCOnJob                = false
local NPCTargetTowable        = nil
local NPCTargetTowableZone    = nil
local NPCHasSpawnedTowable    = false
local NPCLastCancel           = GetGameTimer() - 5 * 60000
local NPCHasBeenNextToTowable = false
local NPCTargetDeleterZone    = false
local IsDead                  = false
local IsBusy                  = false

ESX                           = nil

Citizen.CreateThread(function()
	while ESX == nil do
		TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
		Citizen.Wait(250)
	end
	
	Citizen.Wait(5000)
	PlayerData = ESX.GetPlayerData()
end)

function SetVehicleMaxMods(vehicle)
	local t = {
		modEngine       = 3,
		modBrakes       = 2,
		modTransmission = 2,
		modSuspension   = 3,
		modArmor        = 4,
		modXenon        = true,
		modTurbo        = true,
		dirtLevel       = 0
	}

	ESX.Game.SetVehicleProperties(vehicle, t)
end

function SelectRandomTowable()

  local index = GetRandomIntInRange(1,  #Config.Towables)

  for k,v in pairs(Config.Zones) do
    if v.Pos.x == Config.Towables[index].x and v.Pos.y == Config.Towables[index].y and v.Pos.z == Config.Towables[index].z then
      return k
    end
  end

end

function StartNPCJob()

  NPCOnJob = true

  NPCTargetTowableZone = SelectRandomTowable()
  local zone       = Config.Zones[NPCTargetTowableZone]

  Blips['NPCTargetTowableZone'] = AddBlipForCoord(zone.Pos.x,  zone.Pos.y,  zone.Pos.z)
  SetBlipRoute(Blips['NPCTargetTowableZone'], true)

  ESX.ShowNotification(_U('drive_to_indicated'))
end

function StopNPCJob(cancel)

  if Blips['NPCTargetTowableZone'] ~= nil then
    RemoveBlip(Blips['NPCTargetTowableZone'])
    Blips['NPCTargetTowableZone'] = nil
  end

  if Blips['NPCDelivery'] ~= nil then
    RemoveBlip(Blips['NPCDelivery'])
    Blips['NPCDelivery'] = nil
  end


  Config.Zones.VehicleDelivery.Type = -1

  NPCOnJob                = false
  NPCTargetTowable        = nil
  NPCTargetTowableZone    = nil
  NPCHasSpawnedTowable    = false
  NPCHasBeenNextToTowable = false

  if cancel then
    ESX.ShowNotification(_U('mission_canceled'))
  else
    TriggerServerEvent('esx_mecanojob:onNPCJobCompleted')
  end

end

function OpenMechanicVehicleSpawner(currZone)
	local elements = {
		{label = "Laweta", value = 'lsc_flatbed'},
		{label = 'Ford 150', value = 'lsc_ford150'},
    {label = 'Ford 550', value = 'lsc_fordf550'},
		{label = "Widlak", value = 'forklift'},
	}

	ESX.UI.Menu.CloseAll()

	ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'spawn_vehicle', {
		title    = _U('service_vehicle'),
		align    = 'bottom-right',
		elements = elements
	}, function(data, menu)
		local vehicleProps = data.current.value
		ESX.Game.SpawnVehicle(data.current.value, Config.Zones.VehicleSpawnPoint.Pos, Config.Zones.VehicleSpawnPoint.Heading, function(vehicle)
			local playerPed = PlayerPedId()
			ESX.Game.SetVehicleProperties(vehicle, vehicleProps)
			SetVehicleMaxMods(vehicle)
			local plate = "LST " .. math.random(100,999)
			SetVehicleNumberPlateText(vehicle, plate)
			local localVehPlate = string.lower(GetVehicleNumberPlateText(vehicle))
			TriggerEvent('ls:dodajklucze2', localVehPlate)
			TaskWarpPedIntoVehicle(playerPed, vehicle, -1)
		end)

		menu.close()
	end, function(data, menu)
		menu.close()
		CurrentAction     = 'mechanic_vehicle_spawner'
		CurrentActionMsg  = "Naciśnij ~INPUT_CONTEXT~, aby wyciągnąć pojazd"
		CurrentActionData = {}
	end)
end

function OpenMecanoActionsMenu()

  local elements = {
    {label = 'Szafka', value = 'szafka'},
    --{label = 'Szatnia',      value = 'narzedziakurwo23'},
    --{label = _U('vehicle_list'),   value = 'vehicle_list'}
  }

  if Config.EnablePlayerManagement and PlayerData.job ~= nil and PlayerData.job.grade_name == 'boss' then
    table.insert(elements, {label = _U('boss_actions'), value = 'boss_actions'})
  end


  ESX.UI.Menu.CloseAll()

--[[function OpenVehiclesMenu()

  local elements = {

    {label = 'Pojazdy', value = 'vehicle_list'}

  }
end
  ESX.UI.Menu.CloseAll()]]

  ESX.UI.Menu.Open(
    'default', GetCurrentResourceName(), 'mecano_actions',
    {
      title    = _U('mechanic'),
      align    = 'center',
      elements = elements
    },
    function(data, menu)

    if data.current.value == 'szafka' then
    OpenMechnaikMenu()
    end
    if data.current.value == 'boss_actions' then
      TriggerEvent('esx_society:openBossMenu', 'mecano', function(data, menu)
        menu.close()
      end)
    end

    end,
    function(data, menu)
      menu.close()
      CurrentAction     = 'mecano_actions_menu'
      CurrentActionMsg  = _U('open_actions')
      CurrentActionData = {}
    end
  )
end

local cfgme = {

  icon = 'CustomLogo',
  
	empty = ''

}

function OpenMechnaikMenu()
    ESX.UI.Menu.CloseAll()
	if PlayerData.job ~= nil and (PlayerData.job.name == 'mecano' or PlayerData.job.name == 'offmecano') then
    ESX.UI.Menu.Open(
        'default', GetCurrentResourceName(), 'szafka',
        {
			align    = 'center',
            title    = 'LST',
            elements = {
              {label = 'Narzędzia', value = 'narzedziakurwo'},
              {label = 'Włóż przedmiot', value = 'put_stock'},
              {label = 'Wyciągnij przedmiot', value = 'get_stock'},
              {label = 'Wyciągnij GPS', value = 'gps'}
            }
        },
        function(data, menu)
        if data.current.value == 'narzedziakurwo' then
            OpenMechanikszmatoNardzedzia()
        elseif data.current.value == 'mechanikurwotako' then
            OpenMechanikShop()
        elseif data.current.value == 'put_stock' then
            OpenPutStocksMenu()
        elseif data.current.value == 'get_stock' then
            OpenGetStocksMenu()
        elseif data.current.value == 'gps' then
          TriggerServerEvent('esx_mecanojob:giveItemtakichuj', data.current.value)
        elseif data.current.value == 'cotyrobiszdebilu' then
        OpenMechnaikMenu()
            end
        end,
        function(data, menu)
      OpenMecanoActionsMenu()
        end
	)
end
end


function OpenMechanikShop()
    ESX.UI.Menu.CloseAll()

    ESX.UI.Menu.Open(
        'default', GetCurrentResourceName(), 'mechanikshop',
        {
			align    = 'center',
            title    = 'LST - Żywność',
            elements = {
				{label = 'Woda', value = 'water'},
				{label = 'Chleb', value = 'bread'},
            }
        },
        function(data, menu)
            if data.current.value == 'protein_shake' then
				TriggerServerEvent('esx_gym:Shakemechanik')
            elseif data.current.value == 'water' then
				TriggerServerEvent('esx_gym:Watermechanik')
            elseif data.current.value == 'bread' then
				TriggerServerEvent('esx_gym:Breadmechanik')
            elseif data.current.value == 'redbull' then
				TriggerServerEvent('esx_gym:Redbullmechanik')
            end
        end,
        function(data, menu)
             OpenMechnaikMenu()
        end
    )
end


function OpenMechanikszmatoNardzedzia()

  ESX.UI.Menu.CloseAll()

    ESX.UI.Menu.Open(
        'default', GetCurrentResourceName(), 'mechanikurwotako',
        {
			align    = 'center',
            title    = 'LST - Narzędzia',
            elements = {
              {label = 'Butla z gazem', value = 'gazbottle'},
              {label = 'Zestaw naprawczy', value = 'fixtool'},
            }
        },
        function(data, menu)
          if data.current.value == 'gazbottle' then
            TriggerServerEvent('esx_mecanojob:giveItemtakichuj', data.current.value)
          elseif data.current.value == 'fixtool' then
            TriggerServerEvent('esx_mecanojob:giveItemtakichuj', data.current.value)
          elseif data.current.value == 'carotool' then
            TriggerServerEvent('esx_mecanojob:giveItemtakichuj', data.current.value)
          elseif data.current.value == 'blowpipe' then
            TriggerServerEvent('esx_mecanojob:giveItemtakichuj', data.current.value)
          elseif data.current.value == 'fixkit' then
            TriggerServerEvent('esx_mecanojob:giveItemtakichuj', data.current.value)
          elseif data.current.value == 'carokit' then
		        TriggerServerEvent('esx_mecanojob:giveItemtakichuj', data.current.value)
            end
        end,
        function(data, menu)
             OpenMechnaikMenu()
        end
    )
end

function setUniform(job, playerPed)
	TriggerEvent('skinchanger:getSkin', function(skin)
		if skin.sex == 0 then
			if Config.Uniforms[job].male ~= nil then
				TriggerEvent('skinchanger:loadClothes', skin, Config.Uniforms[job].male)
			else
				ESX.ShowNotification(_U('no_outfit'))
			end
		else
			if Config.Uniforms[job].female ~= nil then
				TriggerEvent('skinchanger:loadClothes', skin, Config.Uniforms[job].female)
			else
				ESX.ShowNotification(_U('no_outfit'))
			end
		end
	end)
end

function OpenSzatniaMenu()
  ESX.UI.Menu.CloseAll()
  local elements = {
    { label = ('Ubranie Cywilne'), value = 'citizen_wear' },
    { label = 'Ubrania Mechanikow', value = 'LSPD'},
    --{ label = 'Ubrania Mechaniczek', value = 'bojowe'},
  }

  ESX.UI.Menu.Open(
    'default', GetCurrentResourceName(), 'cloakroom',
    {
      title    = ('Szatnia'),
      align    = 'center',
      elements = elements,
    },
    function(data, menu)
      if data.current.value == 'citizen_wear' then
        ESX.TriggerServerCallback('esx_skin:getPlayerSkin', function(skin)
          TriggerEvent('skinchanger:loadSkin', skin)
			GetPedData()
			reloadskin()
        end)

		elseif data.current.value == 'LSPD' then
			local elements2 = {
				--[[{label = "Recruit", value = 'recruit_wear'},
				{label = "Novice", value = 'novice_wear'},
				{label = "Master", value = 'master_wear'},
				{label = "Expert", value = 'expert_wear'},
				{label = "Professionalist", value = 'professionalist_wear'},
				{label = "Specialist", value = 'specialist_wear'},
				{label = "Coordinator of LST", value = 'coordinator_wear'},
				{label = "Deputy Chief of LST", value = 'deputychief_wear'},
				{label = "Chief of LST", value = 'chief_wear'},
				{label = "Committee of LST", value = 'chief_wear'},--]]
			}
      if PlayerData.job.grade >= 0 then
        table.insert(elements2, {label = 'Recruit', value = 'recruit_wear'})
      end
      if PlayerData.job.grade >= 1 then
        table.insert(elements2, {label = 'Novice', value = 'novice_wear'})
      end
      if PlayerData.job.grade >= 2 then
        table.insert(elements2, {label = 'Master', value = 'master_wear'})
      end
      if PlayerData.job.grade >= 3 then
        table.insert(elements2, {label = 'Professionalist', value = 'professionalist_wear'})
      end
      if PlayerData.job.grade >= 4 then
        table.insert(elements2, {label = 'Specialist', value = 'specialist_wear'})
      end
      if PlayerData.job.grade >= 5 then
        table.insert(elements2, {label = 'Coordinator of LST', value = 'coordinator_wear'})
      end
      if PlayerData.job.grade >= 6 then
        table.insert(elements2, {label = 'Deputy Chief of LST', value = 'deputychief_wear'})
      end
      if PlayerData.job.grade >= 7 then
        table.insert(elements2, {label = 'Chief of LST', value = 'chief_wear'})
      end
      if PlayerData.job.grade >= 8 then
        table.insert(elements2, {label = 'Committee of LST', value = 'chief_wear'})
      end

			ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'dodatki', {
				title    = "Szatnia",
				align    = 'right',
				elements = elements2
			}, function(data2, menu2)
				if data2.current.value == 'armour' then
					setArmour(75, playerPed)
				else
					setUniform(data2.current.value, playerPed)
				end
			end, function(data2, menu2)
				menu2.close()
			end)
      else
        setUniform(data.current.value, playerPed)
      end
    end
  )
end

function reloadskin()
    SetPlayerHealthRechargeMultiplier(PlayerId(), 0.0)
    TriggerEvent('esx:showNotification', 'Ładowanie postaci..')
    Wait(1)
    ESX.TriggerServerCallback('esx_skin:getPlayerSkin', function(skin)
        TriggerEvent('skinchanger:loadSkin', skin)
    end)
    TriggerEvent('esx_tattooshop:refreshTattoos')
end

function GetPedData()
	return Ped
end

--[[function PrzebierzSzatnia(styl)
  SetPedComponentVariation(PlayerPedId(), 7, 0, 0, 2)    -- SZYJA
  SetPedComponentVariation(PlayerPedId(), 1, 0, 0, 2)    -- MASKA
  ClearPedProp(PlayerPedId(), 0)                         -- KAPELUSZ
  ClearPedProp(PlayerPedId(), 6)                         -- ZEGAREK
  ClearPedProp(PlayerPedId(), 7)                         -- OPASKA
  ClearPedProp(PlayerPedId(), 1)                         -- OKULARY
  SetPedComponentVariation(PlayerPedId(), 5, 0, 0, 2)    -- TORBA
  SetPedComponentVariation(PlayerPedId(), 10, 0, 0, 2)   -- NASZYWKI
  if styl == 'ubranieK1' then
    SetPedComponentVariation(PlayerPedId(), 8, 56, 0, 2)   -- PODKOSZULEK
    SetPedComponentVariation(PlayerPedId(), 11, 136, 3, 2)  -- TOP
    SetPedComponentVariation(PlayerPedId(), 3, 62, 0, 2)   -- RĘCE
    SetPedComponentVariation(PlayerPedId(), 4, 61, 0, 2)   -- SPODNIE
    SetPedComponentVariation(PlayerPedId(), 6, 24, 1, 2)   -- BUTY
  elseif styl == 'ubranieM1' then
    SetPedComponentVariation(PlayerPedId(), 8, 140, 1, 2)   -- PODKOSZULEK
    SetPedComponentVariation(PlayerPedId(), 11, 247, 0, 2)  -- TOP
    SetPedComponentVariation(PlayerPedId(), 3, 52, 0, 2)   -- RĘCE
    SetPedComponentVariation(PlayerPedId(), 4, 97, 1, 2)   -- SPODNIE
    SetPedComponentVariation(PlayerPedId(), 6, 24, 0, 2)   -- BUTY

  end
end--]]

function OpenMecanoHarvestMenu()

  if Config.EnablePlayerManagement and PlayerData.job ~= nil and PlayerData.job.grade_name ~= 'recrue' then
    local elements = {
      {label = _U('gas_can'), value = 'gaz_bottle'},
      {label = _U('repair_tools'), value = 'fix_tool'},
      {label = _U('body_work_tools'), value = 'caro_tool'}
    }

    ESX.UI.Menu.CloseAll()

    ESX.UI.Menu.Open(
      'default', GetCurrentResourceName(), 'mecano_harvest',
      {
        title    = _U('harvest'),
        align    = 'center',
        elements = elements
      },
      function(data, menu)
        if data.current.value == 'gaz_bottle' then
          menu.close()
          TriggerServerEvent('esx_mecanojob:startHarvest')
        end

        if data.current.value == 'fix_tool' then
          menu.close()
          TriggerServerEvent('esx_mecanojob:startHarvest2')
        end

        if data.current.value == 'caro_tool' then
          menu.close()
          TriggerServerEvent('esx_mecanojob:startHarvest3')
        end

      end,
      function(data, menu)
        menu.close()
        CurrentAction     = 'mecano_harvest_menu'
        CurrentActionMsg  = _U('harvest_menu')
        CurrentActionData = {}
      end
    )
  else
    ESX.ShowNotification(_U('not_experienced_enough'))
  end
end

function OpenMecanoCraftMenu()
  if Config.EnablePlayerManagement and PlayerData.job ~= nil and PlayerData.job.grade_name ~= 'recrue' then

    local elements = {
      {label = _U('blowtorch'),  value = 'blow_pipe'},
      {label = _U('repair_kit'), value = 'fix_kit'},
      {label = _U('body_kit'),   value = 'caro_kit'}
    }

    ESX.UI.Menu.CloseAll()

    ESX.UI.Menu.Open(
      'default', GetCurrentResourceName(), 'mecano_craft',
      {
        title    = _U('craft'),
        align    = 'center',
        elements = elements
      },
      function(data, menu)
        if data.current.value == 'blow_pipe' then
          menu.close()
          TriggerServerEvent('esx_mecanojob:startCraft')
        end

        if data.current.value == 'fix_kit' then
          menu.close()
          TriggerServerEvent('esx_mecanojob:startCraft2')
        end

        if data.current.value == 'caro_kit' then
          menu.close()
          TriggerServerEvent('esx_mecanojob:startCraft3')
        end

      end,
      function(data, menu)
        menu.close()
        CurrentAction     = 'mecano_craft_menu'
        CurrentActionMsg  = _U('craft_menu')
        CurrentActionData = {}
      end
    )
  else
    ESX.ShowNotification(_U('not_experienced_enough'))
  end
end

function OpenMobileMecanoActionsMenu()

  ESX.UI.Menu.CloseAll()

  ESX.UI.Menu.Open(
    'default', GetCurrentResourceName(), 'mobile_mecano_actions',
    {
      title    = _U('mechanic'),
      align    = 'center',
      elements = {
        --{label = _U('billing'),       value = 'billing'},
        {label = ('Tablet LST'),      value = 'tablet'},
        {label = _U('hijack'),        value = 'hijack_vehicle'},
        {label = _U('repair'),        value = 'fix_vehicle'},
        {label = _U('clean'),         value = 'clean_vehicle'},
        {label = _U('imp_veh'),       value = 'del_vehicle'},
        {label = _U('flat_bed'),      value = 'dep_vehicle'},
        --{label = _U('place_objects'), value = 'object_spawner'}
      }
    },
	function(data, menu)
      if IsBusy then return end

      if data.current.value == 'billing' then
        ESX.UI.Menu.Open(
          'dialog', GetCurrentResourceName(), 'billing',
          {
            title = _U('invoice_amount')
          },
          function(data, menu)
            local amount = tonumber(data.value)
            if amount == nil or amount < 0 then
              ESX.ShowNotification(_U('amount_invalid'))
            else
              
              local closestPlayer, closestDistance = ESX.Game.GetClosestPlayer()
              if closestPlayer == -1 or closestDistance > 3.0 then
                ESX.ShowNotification(_U('no_players_nearby'))
			  else
				menu.close()
                TriggerServerEvent('esx_billing:sendBill', GetPlayerServerId(closestPlayer), 'society_mecano', _U('mechanic'), amount)
              end
            end
          end,
        function(data, menu)
          menu.close()
        end
        )
      end

      if data.current.value == 'hijack_vehicle' then

		local playerPed = PlayerPedId()
		local vehicle   = ESX.Game.GetVehicleInDirection()
		local coords    = GetEntityCoords(playerPed)

		if IsPedSittingInAnyVehicle(playerPed) then
			ESX.ShowNotification(_U('inside_vehicle'))
			return
		end

		if DoesEntityExist(vehicle) then
			IsBusy = true
			TaskStartScenarioInPlace(playerPed, "WORLD_HUMAN_WELDING", 0, true)
			Citizen.CreateThread(function()
				Citizen.Wait(10000)

				SetVehicleDoorsLocked(vehicle, 1)
				SetVehicleDoorsLockedForAllPlayers(vehicle, false)
				ClearPedTasksImmediately(playerPed)

				ESX.ShowNotification(_U('vehicle_unlocked'))
				IsBusy = false
			end)
		else
			ESX.ShowNotification(_U('no_vehicle_nearby'))
		end
  elseif data.current.value == 'tablet' then -- revive
    menu.close()
    TriggerEvent('tablet_lst:opentab')
	elseif data.current.value == 'fix_vehicle' then

		local playerPed = PlayerPedId()
		local vehicle   = ESX.Game.GetVehicleInDirection()
		local coords    = GetEntityCoords(playerPed)

		if IsPedSittingInAnyVehicle(playerPed) then
			ESX.ShowNotification(_U('inside_vehicle'))
			return
		end

		if DoesEntityExist(vehicle) then
			IsBusy = true
			TaskStartScenarioInPlace(playerPed, "PROP_HUMAN_BUM_BIN", 0, true)
			Citizen.CreateThread(function()
				Citizen.Wait(20000)

				SetVehicleFixed(vehicle)
				SetVehicleDeformationFixed(vehicle)
				SetVehicleUndriveable(vehicle, false)
				SetVehicleEngineOn(vehicle, true, true)
				ClearPedTasksImmediately(playerPed)

				ESX.ShowNotification(_U('vehicle_repaired'))
				IsBusy = false
			end)
		else
			ESX.ShowNotification(_U('no_vehicle_nearby'))
		end

	elseif data.current.value == 'clean_vehicle' then

		local playerPed = PlayerPedId()
		local vehicle   = ESX.Game.GetVehicleInDirection()
		local coords    = GetEntityCoords(playerPed)

		if IsPedSittingInAnyVehicle(playerPed) then
			ESX.ShowNotification(_U('inside_vehicle'))
			return
		end

		if DoesEntityExist(vehicle) then
			IsBusy = true
			TaskStartScenarioInPlace(playerPed, "WORLD_HUMAN_MAID_CLEAN", 0, true)
			Citizen.CreateThread(function()
				Citizen.Wait(10000)

				SetVehicleDirtLevel(vehicle, 0)
				ClearPedTasksImmediately(playerPed)

				ESX.ShowNotification(_U('vehicle_cleaned'))
				IsBusy = false
			end)
		else
			ESX.ShowNotification(_U('no_vehicle_nearby'))
		end

      elseif data.current.value == 'del_vehicle' then

        local ped = PlayerPedId()

        if DoesEntityExist(ped) and not IsEntityDead(ped) then
          local pos = GetEntityCoords( ped )

          	TaskPlayAnim(PlayerPedId(), "amb@prop_human_bum_bin@idle_b", "idle_d", 8.0, 8.0, 5000, 1, 0, false, false, false)
          exports["stinky_taskbar"]:taskBar(5000, "Trwa Odholowywanie", false, true)

          if IsPedSittingInAnyVehicle(ped) then
            local vehicle = GetVehiclePedIsIn( ped, false )

            if GetPedInVehicleSeat(vehicle, -1) == ped then
              ESX.ShowNotification(_U('vehicle_impounded'))
              ESX.Game.DeleteVehicle(vehicle)
            else
              ESX.ShowNotification(_U('must_seat_driver'))
            end
          else
            local vehicle = ESX.Game.GetVehicleInDirection()

            if DoesEntityExist(vehicle) then
              ESX.ShowNotification(_U('vehicle_impounded'))
              ESX.Game.DeleteVehicle(vehicle)
            else
              ESX.ShowNotification(_U('must_near'))
            end
          end
        end
      end

      if data.current.value == 'dep_vehicle' then

        local playerped = PlayerPedId()
        local vehicle = GetVehiclePedIsIn(playerped, true)

        local towmodel = GetHashKey('flatbed')
        local isVehicleTow = IsVehicleModel(vehicle, towmodel)

        if isVehicleTow then
          local targetVehicle = ESX.Game.GetVehicleInDirection()

          if CurrentlyTowedVehicle == nil then
            if targetVehicle ~= 0 then
              if not IsPedInAnyVehicle(playerped, true) then
                if vehicle ~= targetVehicle then
                  AttachEntityToEntity(targetVehicle, vehicle, 20, -0.5, -5.0, 1.0, 0.0, 0.0, 0.0, false, false, false, false, 20, true)
                  CurrentlyTowedVehicle = targetVehicle
                  ESX.ShowNotification(_U('vehicle_success_attached'))

                  if NPCOnJob then

                    if NPCTargetTowable == targetVehicle then
                      ESX.ShowNotification(_U('please_drop_off'))

                      Config.Zones.VehicleDelivery.Type = 1

                      if Blips['NPCTargetTowableZone'] ~= nil then
                        RemoveBlip(Blips['NPCTargetTowableZone'])
                        Blips['NPCTargetTowableZone'] = nil
                      end

                      Blips['NPCDelivery'] = AddBlipForCoord(Config.Zones.VehicleDelivery.Pos.x,  Config.Zones.VehicleDelivery.Pos.y,  Config.Zones.VehicleDelivery.Pos.z)

                      SetBlipRoute(Blips['NPCDelivery'], true)

                    end

                  end

                else
                  ESX.ShowNotification(_U('cant_attach_own_tt'))
                end
              end
            else
              ESX.ShowNotification(_U('no_veh_att'))
            end
          else

            AttachEntityToEntity(CurrentlyTowedVehicle, vehicle, 20, -0.5, -12.0, 1.0, 0.0, 0.0, 0.0, false, false, false, false, 20, true)
            DetachEntity(CurrentlyTowedVehicle, true, true)

            if NPCOnJob then

              if NPCTargetDeleterZone then

                if CurrentlyTowedVehicle == NPCTargetTowable then
                  ESX.Game.DeleteVehicle(NPCTargetTowable)
                  TriggerServerEvent('esx_mecanojob:onNPCJobMissionCompleted')
                  StopNPCJob()
                  NPCTargetDeleterZone = false

                else
                  ESX.ShowNotification(_U('not_right_veh'))
                end

              else
                ESX.ShowNotification(_U('not_right_place'))
              end

            end

            CurrentlyTowedVehicle = nil

            ESX.ShowNotification(_U('veh_det_succ'))
          end
        else
          ESX.ShowNotification(_U('imp_flatbed'))
        end
      end

      if data.current.value == 'object_spawner' then
		local playerPed = PlayerPedId()

		if IsPedSittingInAnyVehicle(playerPed) then
			ESX.ShowNotification(_U('inside_vehicle'))
			return
		end

        ESX.UI.Menu.Open(
          'default', GetCurrentResourceName(), 'mobile_mecano_actions_spawn',
          {
            title    = _U('objects'),
            align    = 'center',
            elements = {
              {label = _U('roadcone'),     value = 'prop_roadcone02a'},
              {label = _U('toolbox'), value = 'prop_toolchest_01'},
            },
          },
          function(data2, menu2)

            local model     = data2.current.value
            local coords    = GetEntityCoords(playerPed)
            local forward   = GetEntityForwardVector(playerPed)
            local x, y, z   = table.unpack(coords + forward * 1.0)

            if model == 'prop_roadcone02a' then
              z = z - 2.0
            elseif model == 'prop_toolchest_01' then
              z = z - 2.0
            end

            ESX.Game.SpawnObject(model, {
              x = x,
              y = y,
              z = z
            }, function(obj)
              SetEntityHeading(obj, GetEntityHeading(playerPed))
              PlaceObjectOnGroundProperly(obj)
            end)

          end,
          function(data2, menu2)
            menu2.close()
          end
        )

      end

    end,
  function(data, menu)
    menu.close()
  end
  )
end

function OpenGetStocksMenu()
  ESX.TriggerServerCallback('esx_mecanojob:getStockItems', function(items)
    local elements = {}

    for i=1, #items, 1 do
      table.insert(elements, {label = 'x' .. items[i].count .. ' ' .. items[i].label, value = items[i].name})
    end

    ESX.UI.Menu.Open(
      'default', GetCurrentResourceName(), 'stocks_menu',
      {
        title    = _U('mechanic_stock'),
        align    = 'center',
        elements = elements
      },
      function(data, menu)

        local itemName = data.current.value

        ESX.UI.Menu.Open(
          'dialog', GetCurrentResourceName(), 'stocks_menu_get_item_count',
          {
            title = _U('quantity')
          },
          function(data2, menu2)

            local count = tonumber(data2.value)

            if count == nil then
              ESX.ShowNotification(_U('invalid_quantity'))
            else
              menu2.close()
              menu.close()
              TriggerServerEvent('esx_mecanojob:getStockItem', itemName, count)

              Citizen.Wait(1000)
              OpenGetStocksMenu()
            end


          end,
          function(data2, menu2)
            menu2.close()
          end
        )

      end,
      function(data, menu)
        menu.close()
      end
    )

  end)

end

function OpenPutStocksMenu()

ESX.TriggerServerCallback('esx_mecanojob:getPlayerInventory', function(inventory)

    local elements = {}

    for i=1, #inventory.items, 1 do

      local item = inventory.items[i]

      if item.count > 0 then
        table.insert(elements, {label = item.label .. ' x' .. item.count, type = 'item_standard', value = item.name})
      end

    end

    ESX.UI.Menu.Open(
      'default', GetCurrentResourceName(), 'stocks_menu',
      {
        title    = _U('inventory'),
        align    = 'center',
        elements = elements
      },
      function(data, menu)

        local itemName = data.current.value

        ESX.UI.Menu.Open(
          'dialog', GetCurrentResourceName(), 'stocks_menu_put_item_count',
          {
            title = _U('quantity')
          },
          function(data2, menu2)

            local count = tonumber(data2.value)

            if count == nil then
              ESX.ShowNotification(_U('invalid_quantity'))
            else
              menu2.close()
              menu.close()
              TriggerServerEvent('esx_mecanojob:putStockItems', itemName, count)

              Citizen.Wait(1000)
              OpenPutStocksMenu()
            end

          end,
          function(data2, menu2)
            menu2.close()
          end
        )

      end,
      function(data, menu)
        menu.close()
      end
    )

  end)

end


RegisterNetEvent('esx_mecanojob:onHijack')
AddEventHandler('esx_mecanojob:onHijack', function()
  local playerPed = PlayerPedId()
  local coords    = GetEntityCoords(playerPed)

  if IsAnyVehicleNearPoint(coords.x, coords.y, coords.z, 5.0) then

    local vehicle = nil

    if IsPedInAnyVehicle(playerPed, false) then
      vehicle = GetVehiclePedIsIn(playerPed, false)
    else
      vehicle = GetClosestVehicle(coords.x, coords.y, coords.z, 5.0, 0, 71)
    end

    local crochete = math.random(100)
    local alarm    = math.random(100)

    if DoesEntityExist(vehicle) then
      if alarm <= 33 then
        SetVehicleAlarm(vehicle, true)
        StartVehicleAlarm(vehicle)
      end
      TaskStartScenarioInPlace(playerPed, "WORLD_HUMAN_WELDING", 0, true)
      Citizen.CreateThread(function()
        Citizen.Wait(10000)
        if crochete <= 66 then
          SetVehicleDoorsLocked(vehicle, 1)
          SetVehicleDoorsLockedForAllPlayers(vehicle, false)
          ClearPedTasksImmediately(playerPed)
          ESX.ShowNotification(_U('veh_unlocked'))
        else
          ESX.ShowNotification(_U('hijack_failed'))
          ClearPedTasksImmediately(playerPed)
        end
      end)
    end

  end
end)

RegisterNetEvent('esx_mecanojob:onCarokit')
AddEventHandler('esx_mecanojob:onCarokit', function()
  local playerPed = PlayerPedId()
  local coords    = GetEntityCoords(playerPed)

  if IsAnyVehicleNearPoint(coords.x, coords.y, coords.z, 5.0) then

    local vehicle = nil

    if IsPedInAnyVehicle(playerPed, false) then
      vehicle = GetVehiclePedIsIn(playerPed, false)
    else
      vehicle = GetClosestVehicle(coords.x, coords.y, coords.z, 5.0, 0, 71)
    end

    if DoesEntityExist(vehicle) then
      TaskStartScenarioInPlace(playerPed, "WORLD_HUMAN_HAMMERING", 0, true)
      Citizen.CreateThread(function()
        Citizen.Wait(10000)
        SetVehicleFixed(vehicle)
        SetVehicleDeformationFixed(vehicle)
        ClearPedTasksImmediately(playerPed)
        ESX.ShowNotification(_U('body_repaired'))
      end)
    end
  end
end)

RegisterNetEvent('esx_mecanojob:onFixkit')
AddEventHandler('esx_mecanojob:onFixkit', function()
  local playerPed = PlayerPedId()
  local coords    = GetEntityCoords(playerPed)

  if IsAnyVehicleNearPoint(coords.x, coords.y, coords.z, 5.0) then

    local vehicle = nil

    if IsPedInAnyVehicle(playerPed, false) then
      vehicle = GetVehiclePedIsIn(playerPed, false)
    else
      vehicle = GetClosestVehicle(coords.x, coords.y, coords.z, 5.0, 0, 71)
    end

    if DoesEntityExist(vehicle) then
      TaskStartScenarioInPlace(playerPed, "PROP_HUMAN_BUM_BIN", 0, true)
      Citizen.CreateThread(function()
        exports["stinky_taskbar"]:taskBar(20000, "Naprawianie Auta", false, true)
		SetVehicleEngineHealth(vehicle, 1000)
		SetVehicleFixed(vehicle)
        SetVehicleUndriveable(vehicle, false)
        ClearPedTasksImmediately(playerPed)
        ESX.ShowNotification(_U('veh_repaired'))
      end)
    end
  end
end)

RegisterNetEvent('esx:playerLoaded')
AddEventHandler('esx:playerLoaded', function(xPlayer)
  PlayerData = xPlayer
end)

RegisterNetEvent('esx:setJob')
AddEventHandler('esx:setJob', function(job)
  PlayerData.job = job
end)

AddEventHandler('esx_mecanojob:hasEnteredMarker', function(zone)

  if zone == NPCJobTargetTowable then

  end

  if zone =='VehicleDelivery' then
    NPCTargetDeleterZone = true
  end

  if zone == 'MecanoActions' then
    CurrentAction     = 'mecano_actions_menu'
    CurrentActionMsg  = _U('open_actions')
    CurrentActionData = {}
  end

  if zone == 'VehicleSpawner' then
    CurrentAction     = 'mechanic_vehicle_spawner'
    CurrentActionMsg  = "Naciśnij ~INPUT_CONTEXT~, aby wyciągnąć pojazd"
    CurrentActionData = {}
  end

  if zone == 'ClothesZone' then
    CurrentAction     = 'clotheszone'
    CurrentActionMsg  = "Wcisnij ~INPUT_CONTEXT~ aby otworzyć menu szatni"
    CurrentActionData = {}
  end

  if zone == 'Garage' then
    CurrentAction     = 'mecano_harvest_menu'
    CurrentActionMsg  = _U('harvest_menu')
    CurrentActionData = {}
  end

  if zone == 'Craft' then
    CurrentAction     = 'mecano_craft_menu'
    CurrentActionMsg  = _U('craft_menu')
    CurrentActionData = {}
  end

  if zone == 'VehicleDeleter' then

    local playerPed = PlayerPedId()

    if IsPedInAnyVehicle(playerPed,  false) then

      local vehicle = GetVehiclePedIsIn(playerPed,  false)

      CurrentAction     = 'delete_vehicle'
      CurrentActionMsg  = _U('veh_stored')
      CurrentActionData = {vehicle = vehicle}
    end
  end

end)

AddEventHandler('esx_mecanojob:hasExitedMarker', function(zone)

  if zone =='VehicleDelivery' then
    NPCTargetDeleterZone = false
  end

  if zone == 'Craft' then
    TriggerServerEvent('esx_mecanojob:stopCraft')
    TriggerServerEvent('esx_mecanojob:stopCraft2')
    TriggerServerEvent('esx_mecanojob:stopCraft3')
  end

  if zone == 'Garage' then
    TriggerServerEvent('esx_mecanojob:stopHarvest')
    TriggerServerEvent('esx_mecanojob:stopHarvest2')
    TriggerServerEvent('esx_mecanojob:stopHarvest3')
  end

  CurrentAction = nil
  ESX.UI.Menu.CloseAll()
end)

AddEventHandler('esx_mecanojob:hasEnteredEntityZone', function(entity)

  local playerPed = PlayerPedId()

  if PlayerData.job ~= nil and PlayerData.job.name == 'mecano' and not IsPedInAnyVehicle(playerPed, false) then
    CurrentAction     = 'remove_entity'
    CurrentActionMsg  = _U('press_remove_obj')
    CurrentActionData = {entity = entity}
  end

end)

AddEventHandler('esx_mecanojob:hasExitedEntityZone', function(entity)

  if CurrentAction == 'remove_entity' then
    CurrentAction = nil
  end

end)

RegisterNetEvent('esx_phone:loaded')
AddEventHandler('esx_phone:loaded', function(phoneNumber, contacts)
  local specialContact = {
    name       = _U('mechanic'),
    number     = 'mecano',
    base64Icon = 'data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAACAAAAAgCAYAAABzenr0AAAABHNCSVQICAgIfAhkiAAAAAlwSFlzAAALEwAACxMBAJqcGAAAA4BJREFUWIXtll9oU3cUx7/nJA02aSSlFouWMnXVB0ejU3wcRteHjv1puoc9rA978cUi2IqgRYWIZkMwrahUGfgkFMEZUdg6C+u21z1o3fbgqigVi7NzUtNcmsac40Npltz7S3rvUHzxQODec87vfD+/e0/O/QFv7Q0beV3QeXqmgV74/7H7fZJvuLwv8q/Xeux1gUrNBpN/nmtavdaqDqBK8VT2RDyV2VHmF1lvLERSBtCVynzYmcp+A9WqT9kcVKX4gHUehF0CEVY+1jYTTIwvt7YSIQnCTvsSUYz6gX5uDt7MP7KOKuQAgxmqQ+neUA+I1B1AiXi5X6ZAvKrabirmVYFwAMRT2RMg7F9SyKspvk73hfrtbkMPyIhA5FVqi0iBiEZMMQdAui/8E4GPv0oAJkpc6Q3+6goAAGpWBxNQmTLFmgL3jSJNgQdGv4pMts2EKm7ICJB/aG0xNdz74VEk13UYCx1/twPR8JjDT8wttyLZtkoAxSb8ZDCz0gdfKxWkFURf2v9qTYH7SK7rQIDn0P3nA0ehixvfwZwE0X9vBE/mW8piohhl1WH18UQBhYnre8N/L8b8xQvlx4ACbB4NnzaeRYDnKm0EALCMLXy84hwuTCXL/ExoB1E7qcK/8NCLIq5HcTT0i6u8TYbXUM1cAyyveVq8Xls7XhYrvY/4n3gC8C+dsmAzL1YUiyfWxvHzsy/w/dNd+KjhW2yvv/RfXr7x9QDcmo1he2RBiCCI1Q8jVj9szPNixVfgz+UiIGyDSrcoRu2J16d3I6e1VYvNSQjXpnucAcEPUOkGYZs/l4uUhowt/3kqu1UIv9n90fAY9jT3YBlbRvFTD4fw++wHjhiTRL/bG75t0jI2ITcHb5om4Xgmhv57xpGOg3d/NIqryOR7z+r+MC6qBJB/ZB2t9Om1D5lFm843G/3E3HI7Yh1xDRAfzLQr5EClBf/HBHK462TG2J0OABXeyWDPZ8VqxmBWYscpyghwtTd4EKpDTjCZdCNmzFM9k+4LHXIFACJN94Z6FiFEpKDQw9HndWsEuhnADVMhAUaYJBp9XrcGQKJ4qFE9k+6r2+MG3k5N8VQ22TVglbX2ZwOzX2VvNKr91zmY6S7N6zqZicVT2WNLyVSehESaBhxnOALfMeYX+K/S2yv7wmMAlvwyuR7FxQUyf0fgc/jztfkJr7XeGgC8BJJgWNV8ImT+AAAAAElFTkSuQmCC'
  }
  TriggerEvent('esx_phone:addSpecialContact', specialContact.name, specialContact.number, specialContact.base64Icon)
end)

-- Pop NPC mission vehicle when inside area
Citizen.CreateThread(function()
  while true do

    Wait(0)

    if NPCTargetTowableZone ~= nil and not NPCHasSpawnedTowable then

      local coords = GetEntityCoords(PlayerPedId())
      local zone   = Config.Zones[NPCTargetTowableZone]

      if GetDistanceBetweenCoords(coords, zone.Pos.x, zone.Pos.y, zone.Pos.z, true) < Config.NPCSpawnDistance then

        local model = Config.Vehicles[GetRandomIntInRange(1,  #Config.Vehicles)]

        ESX.Game.SpawnVehicle(model, zone.Pos, 0, function(vehicle)
          NPCTargetTowable = vehicle
        end)

        NPCHasSpawnedTowable = true

      end

    end

    if NPCTargetTowableZone ~= nil and NPCHasSpawnedTowable and not NPCHasBeenNextToTowable then

      local coords = GetEntityCoords(PlayerPedId())
      local zone   = Config.Zones[NPCTargetTowableZone]

      if(GetDistanceBetweenCoords(coords, zone.Pos.x, zone.Pos.y, zone.Pos.z, true) < Config.NPCNextToDistance) then
        ESX.ShowNotification(_U('please_tow'))
        NPCHasBeenNextToTowable = true
      end

    end

  end
end)

--[[ Create Blips
Citizen.CreateThread(function()
  local blip = AddBlipForCoord(Config.Zones.MecanoActions.Pos.x, Config.Zones.MecanoActions.Pos.y, Config.Zones.MecanoActions.Pos.z)
  SetBlipSprite (blip, 446)
  SetBlipDisplay(blip, 4)
  SetBlipScale  (blip, 1.4)
  SetBlipColour (blip, 5)
  SetBlipAsShortRange(blip, true)
  BeginTextCommandSetBlipName("STRING")
  AddTextComponentString(_U('mechanic'))
  EndTextCommandSetBlipName(blip)
end)]]

-- Display markers
Citizen.CreateThread(function()
  while true do
		Citizen.Wait(3)
    if PlayerData.job ~= nil and PlayerData.job.name == 'mecano' then

      local coords, sleep = GetEntityCoords(PlayerPedId()), true

      for k,v in pairs(Config.Zones) do
        if #(coords - vec3(v.Pos.x, v.Pos.y, v.Pos.z)) < Config.DrawDistance then
          --DrawMarker(27, v.Pos.x, v.Pos.y, v.Pos.z, 0.0, 0.0, 0.0, 0, 0.0, 0.0, v.Size.x, v.Size.y, v.Size.z, 0, 130, 204, 100, false, true, 2, false, false, false, false)
          DrawMarker(27, v.Pos.x, v.Pos.y, v.Pos.z, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 1.5, 1.5, 1.0, 0, 203, 214, 100, false, false, 2, false, nil, nil, false)
          sleep = false
        end
      end

      if sleep then
        Citizen.Wait(500)
      end

    else
			Citizen.Wait(2000)
		end
  end
end)

-- Enter / Exit marker events
Citizen.CreateThread(function()
  while true do
		Citizen.Wait(1000)
    if PlayerData.job ~= nil and PlayerData.job.name == 'mecano' then
      local coords      = GetEntityCoords(PlayerPedId())
      local isInMarker  = false
      local currentZone = nil
      for k,v in pairs(Config.Zones) do
        if #(coords - vec3(v.Pos.x, v.Pos.y, v.Pos.z)) < v.Size.x then
        --if(GetDistanceBetweenCoords(coords, v.Pos.x, v.Pos.y, v.Pos.z, true) < v.Size.x) then
          isInMarker  = true
          currentZone = k
        end
      end
      if (isInMarker and not HasAlreadyEnteredMarker) or (isInMarker and LastZone ~= currentZone) then
        HasAlreadyEnteredMarker = true
        LastZone                = currentZone
        TriggerEvent('esx_mecanojob:hasEnteredMarker', currentZone)
      end
      if not isInMarker and HasAlreadyEnteredMarker then
        HasAlreadyEnteredMarker = false
        TriggerEvent('esx_mecanojob:hasExitedMarker', LastZone)
      end
    else
			Citizen.Wait(500)
		end
  end
end)

Citizen.CreateThread(function()

  local trackedEntities = {
      'prop_roadcone02a',
      'prop_toolchest_01'
  }

  while true do

    Citizen.Wait(500)

    local playerPed = PlayerPedId()
    local coords    = GetEntityCoords(playerPed)

    local closestDistance = -1
    local closestEntity   = nil

    for i=1, #trackedEntities, 1 do

      local object = GetClosestObjectOfType(coords.x,  coords.y,  coords.z,  3.0,  GetHashKey(trackedEntities[i]), false, false, false)

      if DoesEntityExist(object) then

        local objCoords = GetEntityCoords(object)
        local distance  = GetDistanceBetweenCoords(coords.x,  coords.y,  coords.z,  objCoords.x,  objCoords.y,  objCoords.z,  true)

        if closestDistance == -1 or closestDistance > distance then
          closestDistance = distance
          closestEntity   = object
        end

      end

    end

    if closestDistance ~= -1 and closestDistance <= 3.0 then

      if LastEntity ~= closestEntity then
        TriggerEvent('esx_mecanojob:hasEnteredEntityZone', closestEntity)
        LastEntity = closestEntity
      end

    else

      if LastEntity ~= nil then
        TriggerEvent('esx_mecanojob:hasExitedEntityZone', LastEntity)
        LastEntity = nil
      end

    end

  end
end)

-- Key Controls
Citizen.CreateThread(function()
    while true do
        Citizen.Wait(0)

        if CurrentAction ~= nil then

          SetTextComponentFormat('STRING')
          AddTextComponentString(CurrentActionMsg)
          DisplayHelpTextFromStringLabel(0, 0, 1, -1)

          if IsControlJustReleased(0, Keys['E']) and PlayerData.job ~= nil and PlayerData.job.name == 'mecano' then

            if CurrentAction == 'mecano_actions_menu' then
                exports["stinky_taskbar"]:taskBar(2000, "Otwierasz Szafke", false, true)
                OpenMecanoActionsMenu()
            end

            if CurrentAction == 'mechanic_vehicle_spawner' then
              OpenMechanicVehicleSpawner(currZone)
            end

            if CurrentAction == 'mecano_harvest_menu' then
                OpenMecanoHarvestMenu()
            end

            if CurrentAction == 'clotheszone' then
              OpenSzatniaMenu()
          end

            if CurrentAction == 'mecano_craft_menu' then
                OpenMecanoCraftMenu()
            end

            if CurrentAction == 'delete_vehicle' then

              if Config.EnableSocietyOwnedVehicles then

                local vehicleProps = ESX.Game.GetVehicleProperties(CurrentActionData.vehicle)
                TriggerServerEvent('esx_society:putVehicleInGarage', 'mecano', vehicleProps)

              else

                if
                  GetEntityModel(vehicle) == GetHashKey('lsc_ford150')
                then
                  TriggerServerEvent('esx_service:disableService', 'mecano')
                end

              end

              ESX.Game.DeleteVehicle(CurrentActionData.vehicle)
            end

            if CurrentAction == 'remove_entity' then
              DeleteEntity(CurrentActionData.entity)
            end

            CurrentAction = nil
          end
        end

        if IsControlJustReleased(0, Keys['F6']) and not IsDead and PlayerData.job ~= nil and PlayerData.job.name == 'mecano' then
            OpenMobileMecanoActionsMenu()
        end

        if IsControlJustReleased(0, Keys['DELETE']) and not IsDead and PlayerData.job ~= nil and PlayerData.job.name == 'mecano' then

          if NPCOnJob then

            if GetGameTimer() - NPCLastCancel > 5 * 60000 then
              StopNPCJob(true)
              NPCLastCancel = GetGameTimer()
            else
              ESX.ShowNotification(_U('wait_five'))
            end

          else

            local playerPed = PlayerPedId()

            if IsPedInAnyVehicle(playerPed, false) and IsVehicleModel(GetVehiclePedIsIn(playerPed, false), GetHashKey("flatbed")) then
              StartNPCJob()
            else
              ESX.ShowNotification(_U('must_in_flatbed'))
            end

          end

        end

    end
end)

AddEventHandler('esx:onPlayerDeath', function()
	IsDead = true
end)

AddEventHandler('playerSpawned', function(spawn)
	IsDead = false
end)

function round(num, numDecimalPlaces)
  local mult = 100^(numDecimalPlaces or 0)
  return math.floor(num * mult + 0.5) / mult
end


-- exports

function whyuniggarepairingme()

  local playerPed = PlayerPedId()
  local vehicle   = ESX.Game.GetVehicleInDirection()
  local coords    = GetEntityCoords(playerPed)

  if IsPedSittingInAnyVehicle(playerPed) then
    ESX.ShowNotification(_U('inside_vehicle'))
    return
  end

  if DoesEntityExist(vehicle) then
    IsBusy = true
    TaskStartScenarioInPlace(playerPed, "PROP_HUMAN_BUM_BIN", 0, true)
    Citizen.CreateThread(function()
      exports["stinky_taskbar"]:taskBar(20000, "Naprawianie Auta", false, true)

      SetVehicleFixed(vehicle)
      SetVehicleDeformationFixed(vehicle)
      SetVehicleUndriveable(vehicle, false)
      SetVehicleEngineOn(vehicle, true, true)
      ClearPedTasksImmediately(playerPed)

      ESX.ShowNotification(_U('vehicle_repaired'))
      IsBusy = false
    end)
  else
    ESX.ShowNotification(_U('no_vehicle_nearby'))
  end

end