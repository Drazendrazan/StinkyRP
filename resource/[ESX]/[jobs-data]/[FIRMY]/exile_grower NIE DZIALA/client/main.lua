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
  
  local growerBlip 				= false
  local HasAlreadyEnteredMarker   = false
  local LastZone                  = nil
  local CurrentAction             = nil

  local CurrentActionMsg          = ''
  local CurrentActionData         = {}
  local OnJob                     = false
  local onDuty                    = false
  local CurrentCustomer           = nil
  local CurrentCustomerBlip       = nil
  local DestinationBlip           = nil
  local IsNearCustomer            = false
  local CustomerIsEnteringVehicle = false
  local CustomerEnteredVehicle    = false
  local TargetCoords              = nil
  local IsDead                    = false
  local showPro                 	= false
  local boxowocow 				        = nil
  local owoce						          = nil
  local soki                      = nil
  local isHoldingOwoce 			      = false
  local JobBlips                  = {}
  local BlipsAdded 				= false
  local cooldownclick             = false
  
  ESX                             = nil
  
  CreateThread(function()
	  while ESX == nil do
		  TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
		  Citizen.Wait(0)
	  end
  
	  while ESX.GetPlayerData().job == nil do
		  Citizen.Wait(10)
	  end
  
	  ESX.PlayerData = ESX.GetPlayerData()
  end)
  


  
  function DrawSub(msg, time)
	  ClearPrints()
	  SetTextEntry_2("STRING")
	  AddTextComponentString(msg)
	  DrawSubtitleTimed(time, 1)
  end
  
  function ShowLoadingPromt(msg, time, type)
	  CreateThread(function()
		  Citizen.Wait(0)
		  BeginTextCommandBusyString("STRING")
		  AddTextComponentString(msg)
		  EndTextCommandBusyString(type)
		  Citizen.Wait(time)
  
		  RemoveLoadingPrompt()
	  end)
  end
  
  function OpenCloakroom()
	  ESX.UI.Menu.CloseAll()
	  local elements = {
		  { label = _U('wear_citizen'), value = 'wear_citizen' },
		  { label = _U('wear_work'),    value = 'wear_work'}
	  }
	  if ESX.PlayerData.job.grade >= 6 then
		  table.insert(elements, {label = "Akcje szefa", value = 'boss'})
	  end
  
	  ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'grower_cloakroom',
	  {
		  title    = _U('cloakroom_menu'),
		  align    = 'right',
		  elements = elements,
	  }, function(data, menu)
		  if data.current.value == 'wear_citizen' then
		offduty()
		mainblip()
			  ESX.TriggerServerCallback('esx_skin:getPlayerSkin', function(skin)
				  TriggerEvent('skinchanger:loadSkin', skin)
			  end)
		  menu.close()
		  elseif data.current.value == 'wear_work' then
		onduty()
			  ESX.TriggerServerCallback('esx_skin:getPlayerSkin', function(skin, jobSkin)
				  if skin.sex == 0 then
					  TriggerEvent('skinchanger:loadClothes', skin, jobSkin.skin_male)
				  else
					  TriggerEvent('skinchanger:loadClothes', skin, jobSkin.skin_female)
				  end
			  end)
		  menu.close()
		  elseif data.current.value == 'boss' then
			  if ESX.PlayerData.job.grade == 6 then
				  TriggerEvent('esx_society:openBossMenu', 'grower', function(data, menu)
					  menu.close()
				  end, { showmoney = false, withdraw = false, deposit = true, wash = false, employees = true})
			  elseif ESX.PlayerData.job.grade >= 7 then
				  TriggerEvent('esx_society:openBossMenu', 'grower', function(data, menu)
					  menu.close()
				  end, { showmoney = true, withdraw = true, deposit = true, wash = false, employees = true})
			  end
		  end
	  end, function(data, menu)
		  menu.close()
  
		  CurrentAction     = 'cloakroom'
		  CurrentActionMsg  = _U('cloakroom_prompt')
		  CurrentActionData = {}
	  end)
  end
  
  function OpenJuice()
	  ESX.UI.Menu.CloseAll()
  
	  ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'grower_juice',
	  {
		  title    = _U('juice_menu'),
		  align    = 'right',
		  elements = {
			  { label = _U('juice_maker'), value = 'juice_maker' },
		  }
	  }, function(data, menu)
		  if data.current.value == 'juice_maker' then
	  if cooldownclick == false then
		if IsPedInAnyVehicle(PlayerPedId()) then
		  ESX.ShowNotification('Wyjdz z pojazdu.')
		else
		  cooldownclick = true
		  menu.close()
		  FreezeEntityPosition(PlayerPedId(), true)
		  Citizen.Wait(5000)
		  TriggerServerEvent('grower:job2')
		  FreezeEntityPosition(PlayerPedId(), false)
		end
	  end
	   end
	  end, function(data, menu)
		  menu.close()
  
		  CurrentAction     = 'grower_juice'
		  CurrentActionMsg  = _U('juice_prompt')
		  CurrentActionData = {}
	  end)
  end
  
  function OpenVehicleSpawnerMenu()
	ESX.UI.Menu.CloseAll()
	local elements = {}
	ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'vehicle_spawner',
	{
		title        = _U('spawn_veh'),
		align    = 'right',
		elements    = Config.AuthorizedVehicles
	}, function(data, menu)
		if not ESX.Game.IsSpawnPointClear(GetEntityCoords(PlayerPedId()), 5.0) then
			ESX.ShowNotification(_U('spawnpoint_blocked'))
		else

		menu.close()
		ESX.Game.SpawnVehicle(data.current.model, GetEntityCoords(PlayerPedId()), 173, function(vehicle)
			local playerPed = PlayerPedId()
			TaskWarpPedIntoVehicle(playerPed, vehicle, -1)
			Wait(200)
			grower_givekeys()
		end)
	  end
	end, function(data, menu)
		CurrentAction     = 'vehicle_spawner'
		CurrentActionMsg  = _U('spawner_prompt')
		CurrentActionData = {}

		menu.close()
	end)
end
  
  function DeleteJobVehicle()
	  local playerPed = PlayerPedId()
  
		  if IsInAuthorizedVehicle() then
  
			  local vehicleProps = ESX.Game.GetVehicleProperties(CurrentActionData.vehicle)
			  ESX.Game.DeleteVehicle(CurrentActionData.vehicle)
  
		  else
			  ESX.ShowNotification(_U('only_grower'))
	  end
  end
  
  
  function IsInAuthorizedVehicle()
	  local playerPed = PlayerPedId()
	  local vehModel  = GetEntityModel(GetVehiclePedIsIn(playerPed, false))
  
	  for i=1, #Config.AuthorizedVehicles, 1 do
		  if vehModel == GetHashKey(Config.AuthorizedVehicles[i].model) then
			  return true
		  end
	  end
  
	  return false
  end
  ---------------------------------------------------------------------
  RegisterNetEvent('esx:playerLoaded')
  AddEventHandler('esx:playerLoaded', function(xPlayer)
	  ESX.PlayerData = xPlayer
  end)
  
  RegisterNetEvent('esx:setJob')
  AddEventHandler('esx:setJob', function(job)
	  ESX.PlayerData.job = job
		offduty()
		 mainblip()
  end)
  
  AddEventHandler('esx_grower:hasEnteredMarker', function(zone)
	  if zone == 'VehicleSpawner' then
		  CurrentAction     = 'vehicle_spawner'
		  CurrentActionMsg  = _U('spawner_prompt')
		  CurrentActionData = {}
	  elseif zone == 'VehicleSpawner2' then
			  CurrentAction     = 'vehicle_spawner'
			  CurrentActionMsg  = _U('spawner_prompt')
			  CurrentActionData = {}
	  elseif zone == 'VehicleDeleter' then
		  local playerPed = PlayerPedId()
		  local vehicle   = GetVehiclePedIsIn(playerPed, false)
  
		  if IsPedInAnyVehicle(playerPed, false) and GetPedInVehicleSeat(vehicle, -1) == playerPed then
			  CurrentAction     = 'delete_vehicle'
			  CurrentActionMsg  = _U('store_veh')
			  CurrentActionData = { vehicle = vehicle }
		  end
  
	  elseif zone == 'Cloakroom' then
		  CurrentAction     = 'cloakroom'
		  CurrentActionMsg  = _U('cloakroom_prompt')
		  CurrentActionData = {}
  
	elseif zone == 'Help' then
	  CurrentAction     = 'help'
	  CurrentActionMsg  = ('Nacisnij ~g~~INPUT_CONTEXT~~s~ aby uzyskac pomoc')
	  CurrentActionData = {}
  
  
		  elseif zone == 'Job1' then
		  CurrentAction     = 'Job1'
		  CurrentActionMsg  = _U('press_to_work')
		  CurrentActionData = {}
  
		  elseif zone == 'Job1b' then
		  CurrentAction     = 'Job1b'
		  CurrentActionMsg  = _U('press_to_work')
		  CurrentActionData = {}
  
		  elseif zone == 'Job2' then
		  CurrentAction     = 'Job2'
		  CurrentActionMsg  = _U('juice_work')
		  CurrentActionData = {}
  
		  elseif zone == 'Job3' then
		  CurrentAction     = 'Job3'
		  CurrentActionMsg  = _U('sell_prompt')
		  CurrentActionData = {}
  
		  elseif zone == 'Job3a' then
		  CurrentAction     = 'Job3a'
		  CurrentActionMsg  = _U('press_to_work')
		  CurrentActionData = {}
  
	  end
  end)
  
  AddEventHandler('esx_grower:hasExitedMarker', function(zone)
	  ESX.UI.Menu.CloseAll()
	  CurrentAction = nil
  end)


  CreateThread(function()
	  while true do
		  Citizen.Wait(5)
		  if ESX.PlayerData.job and ESX.PlayerData.job.name == 'grower' and not onDuty then
			  local coords = GetEntityCoords(PlayerPedId())
			  local distance = #(coords - vec3(Config.Zones.Cloakroom.Pos.x, Config.Zones.Cloakroom.Pos.y, Config.Zones.Cloakroom.Pos.z))
			  local distance2 = #(coords - vec3(Config.Zones.Cloakroom2.Pos.x, Config.Zones.Cloakroom2.Pos.y, Config.Zones.Cloakroom2.Pos.z))
  
			  local isInMarker, currentZone = false
  
			  if distance < Config.DrawDistance then
				  DrawMarker(Config.Zones.Cloakroom.Type, Config.Zones.Cloakroom.Pos.x, Config.Zones.Cloakroom.Pos.y, Config.Zones.Cloakroom.Pos.z, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, Config.Zones.Cloakroom.Size.x, Config.Zones.Cloakroom.Size.y, Config.Zones.Cloakroom.Size.z, Config.Zones.Cloakroom.Color.r, Config.Zones.Cloakroom.Color.g, Config.Zones.Cloakroom.Color.b, 100, false, false, 2, Config.Zones.Cloakroom.Rotate, nil, nil, false)
				--  DrawText3Ds(Config.Zones.Cloakroom.Pos.x, Config.Zones.Cloakroom.Pos.y, Config.Zones.Cloakroom.Pos.z+0.5, Config.Zones.Cloakroom.Text)
			  end
			  if distance < Config.Zones.Cloakroom.Size.x then
				  isInMarker, currentZone = true, 'Cloakroom'
			  end
  
			  
			  if distance2 < Config.DrawDistance then
				  DrawMarker(Config.Zones.Cloakroom2.Type, Config.Zones.Cloakroom2.Pos.x, Config.Zones.Cloakroom2.Pos.y, Config.Zones.Cloakroom2.Pos.z, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, Config.Zones.Cloakroom.Size.x, Config.Zones.Cloakroom.Size.y, Config.Zones.Cloakroom.Size.z, Config.Zones.Cloakroom.Color.r, Config.Zones.Cloakroom.Color.g, Config.Zones.Cloakroom.Color.b, 100, false, false, 2, Config.Zones.Cloakroom.Rotate, nil, nil, false)
				--  DrawText3Ds(Config.Zones.Cloakroom2.Pos.x, Config.Zones.Cloakroom2.Pos.y, Config.Zones.Cloakroom2.Pos.z+0.5, Config.Zones.Cloakroom2.Text)
			  end
			  if distance2 < Config.Zones.Cloakroom2.Size.x then
				  isInMarker, currentZone = true, 'Cloakroom'
			  end
  
				if (isInMarker and not HasAlreadyEnteredMarker) or (isInMarker and LastZone ~= currentZone) then
				  HasAlreadyEnteredMarker, LastZone = true, currentZone
				  TriggerEvent('esx_grower:hasEnteredMarker', currentZone)
				end
  
				if not isInMarker and HasAlreadyEnteredMarker then
				  HasAlreadyEnteredMarker = false
				  TriggerEvent('esx_grower:hasExitedMarker', LastZone)
				end
  
			  if isInMarker and IsControlJustReleased(0, Keys['E']) then
				  OpenCloakroom()
				  CurrentAction = nil
			  end
			  if IsControlJustReleased(0, 167) and ESX.PlayerData.job.grade >= 6 then
				OpenMobileGrowerActionsMenu()
			end
		  else
			  Citizen.Wait(2000)
		  end
	  end
  end)
  
  CreateThread(function()
  mainblip()
	  while true do
		  Citizen.Wait(0)
		  if onDuty then
			  local coords = GetEntityCoords(PlayerPedId())
			  local isInMarker, currentZone = false
  
  
			  for k,v in pairs(Config.Zones) do
				  local distance = #(coords - vec3(v.Pos.x, v.Pos.y, v.Pos.z))
  
				  if v.Type ~= -1 then
					  --and distance < Config.DrawDistance then
					  if distance > 5 and distance < Config.DrawDistance then
					  DrawMarker(v.Type, v.Pos.x, v.Pos.y, v.Pos.z, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, v.Size.x, v.Size.y, v.Size.z, 0, 203, 214, 100, false, false, 2, v.Rotate, nil, nil, false)
					  --DrawText3Ds(v.Pos.x, v.Pos.y, v.Pos.z+0.5, v.Text)
					  elseif distance < 5 and distance < Config.DrawDistance then
						  DrawMarker(v.Type, v.Pos.x, v.Pos.y, v.Pos.z, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, v.Size.x, v.Size.y, v.Size.z, 0, 203, 214, 100, false, false, 2, v.Rotate, nil, nil, false)
						--  DrawText3Ds(v.Pos.x, v.Pos.y, v.Pos.z+0.5, v.Text)
					  end
				  end
  
				  if distance < v.Size.x then
					  isInMarker, currentZone = true, k
				  end
			  end
  
			if (isInMarker and not HasAlreadyEnteredMarker) or (isInMarker and LastZone ~= currentZone) then
			  HasAlreadyEnteredMarker, LastZone = true, currentZone
			  TriggerEvent('esx_grower:hasEnteredMarker', currentZone)
			end
  
			if not isInMarker and HasAlreadyEnteredMarker then
			  HasAlreadyEnteredMarker = false
			  TriggerEvent('esx_grower:hasExitedMarker', LastZone)
			end
		  else
			  Citizen.Wait(5000)
		  end
  
			if CurrentAction and not IsDead then
			  ESX.ShowHelpNotification(CurrentActionMsg)
  
			  if IsControlJustReleased(0, Keys['E']) and ESX.PlayerData.job and ESX.PlayerData.job.name == 'grower' then
				if CurrentAction == 'cloakroom' then
				  OpenCloakroom()
				elseif CurrentAction == 'help' then
				  sadownikhelp()
				elseif CurrentAction == 'vehicle_spawner' then
				  OpenVehicleSpawnerMenu()
				elseif CurrentAction == 'delete_vehicle' then
				  DeleteJobVehicle()
				elseif CurrentAction == 'Job1' then
				  WorkJob1()
				elseif CurrentAction == 'Job1b' then
				  WorkJob1b()
				elseif CurrentAction == 'Job2' then
				  OpenJuice()
				elseif CurrentAction == 'Job3a' then
				  WorkJob3a()
				end
  
				CurrentAction = nil
			end
		end
	  end
  end)
  
  -- 3x Marker Praca
  
  function WorkJob1()
  if onDuty == true then
	  if not ESX.Game.IsSpawnPointClear(Config.Zones.Job1.Pos, 20.0) then
		  ESX.ShowNotification('Ktoś pozostawił pojazd na terenie sadu, ~r~ZBIORY WSTRZYMANE!')
		  Citizen.Wait(2000)
		  HasAlreadyEnteredMarker, LastZone = true, currentZone
		  TriggerEvent('esx_grower:hasEnteredMarker', currentZone)
	  else
	  if IsPedInAnyVehicle(PlayerPedId()) then
		  ESX.ShowNotification("~r~Tej pracy nie możesz wykonywać bedąc w pojezdzie!")
		  Citizen.Wait(2000)
		  HasAlreadyEnteredMarker, LastZone = true, currentZone
		  TriggerEvent('esx_grower:hasEnteredMarker', currentZone)
	  else
		  local tree = dupa()
		  if tree ~= 0 then
			  if isHoldingOwoce == true then
				  ESX.ShowNotification('~r~Najpierw odstaw owoce do strefy pakowania')
			  else
			  animacjazbierania()
			  FreezeEntityPosition(PlayerPedId(), true)
			  Citizen.Wait(20000)
			  FreezeEntityPosition(PlayerPedId(), false)
			  TriggerServerEvent('grower:job1a')
			  ESX.ShowNotification("Odstaw owoce do auta.")
			  Citizen.Wait(3000)
			  HasAlreadyEnteredMarker, LastZone = true, currentZone
			  TriggerEvent('esx_grower:hasEnteredMarker', currentZone)
			  end
		  else
		  ESX.ShowNotification('Musisz podejść bliżej drzewa aby coś z niego zebrać.')
		  Citizen.Wait(2000)
		  HasAlreadyEnteredMarker, LastZone = true, currentZone
		  TriggerEvent('esx_grower:hasEnteredMarker', currentZone)
		  end
	  end
	  end
  else
	ESX.ShowNotification('Musisz się przebrać, aby pracować')
	end
  end
  
  function WorkJob1b()
  if onDuty == true then
	  if not ESX.Game.IsSpawnPointClear(Config.Zones.Job1.Pos, 20.0) then
		  ESX.ShowNotification('Ktoś pozostawił pojazd na terenie sadu, ~r~ZBIORY WSTRZYMANE!')
		  Citizen.Wait(2000)
		  HasAlreadyEnteredMarker, LastZone = true, currentZone
		  TriggerEvent('esx_grower:hasEnteredMarker', currentZone)
	  else
	  if IsPedInAnyVehicle(PlayerPedId()) then
	  ESX.ShowNotification("~r~Tej pracy nie możesz wykonywać bedąc w pojezdzie!")
	  Citizen.Wait(2000)
	  HasAlreadyEnteredMarker, LastZone = true, currentZone
	  TriggerEvent('esx_grower:hasEnteredMarker', currentZone)
	  else
	  local tree = dupa()
		  if tree ~= 0 then
		  if isHoldingOwoce == true then
			  ESX.ShowNotification("~r~Najpierw odstaw owoce do strefy pakowania")
		  else
		  animacjazbierania()
		  FreezeEntityPosition(PlayerPedId(), true)
		  Citizen.Wait(20000)
		  FreezeEntityPosition(PlayerPedId(), false)
		  TriggerServerEvent('grower:job1b')
		  ESX.ShowNotification("Odstaw owoce do auta.")
		  Citizen.Wait(3000)
		  HasAlreadyEnteredMarker, LastZone = true, currentZone
		  TriggerEvent('esx_grower:hasEnteredMarker', currentZone)
		  end
		  else
		  ESX.ShowNotification('Musisz podejść bliżej drzewa aby coś z niego zebrać.')
		  Citizen.Wait(2000)
		  HasAlreadyEnteredMarker, LastZone = true, currentZone
		  TriggerEvent('esx_grower:hasEnteredMarker', currentZone)
				  end
			  end
		  end
		  else
			  ESX.ShowNotification('Musisz się przebrać, aby pracować')
	  end
  end
  
  function WorkJob3a()
	local pojazd = GetVehiclePedIsIn(PlayerPedId(), false)
	if IsPedInAnyVehicle(PlayerPedId(), false) and IsInAuthorizedVehicle() then
	  TaskLeaveVehicle(PlayerPedId(), pojazd, 0)
	  FreezeEntityPosition(PlayerPedId(), true)
	  Citizen.Wait(2500)
	  FreezeEntityPosition(PlayerPedId(), false)
	  TriggerServerEvent('grower:job3')
	else
	  ESX.ShowNotification('Musisz byc w aucie')
	end
  end
  
  RegisterNetEvent('sadownik:anim')
  AddEventHandler('sadownik:anim', function()
	  ClearPedTasks(PlayerPedId())
	  Wait(750)
	  animacjanoszeniaowocow()
	TriggerEvent('sadownik:petelka')
  end)
  
  RegisterNetEvent('sadownik:anim2')
  AddEventHandler('sadownik:anim2', function()
		ESX.ShowNotification('Zanieś soki do pojazdu.')
	  animacjasoki()
		TriggerEvent('sadownik:petelka')
  end)
  
  RegisterNetEvent('sadownik:toomuch')
  AddEventHandler('sadownik:toomuch', function()
	  ESX.ShowNotification("~r~NIE UDZWIGNIESZ WIECEJ OWOCKÓW")
	  ClearPedTasks(PlayerPedId())
  end)
  
  RegisterNetEvent('sadownik:toomuchj')
  AddEventHandler('sadownik:toomuchj', function()
	  ESX.ShowNotification("~r~NIE UDZWIGNIESZ WIECEJ SOKÓW")
	  ClearPedSecondaryTask(PlayerPedId())
  end)
  
  RegisterNetEvent('sadownik:niemasz')
  AddEventHandler('sadownik:niemasz', function()
	  ESX.ShowNotification("~r~Nie posiadasz odpowiedniej ilosci owocow.")
	  ClearPedSecondaryTask(PlayerPedId())
  end)
  
  AddEventHandler('esx:onPlayerDeath', function()
	  IsDead = true
	--onDuty = false
	usunboxowocowx()
  end)
  
  AddEventHandler('playerSpawned', function(spawn)
	  IsDead = false
  end)
  
  function animacjazbierania()
	  local ad = "amb@prop_human_movie_bulb@base"
	  local anim = "base"
	  local player = PlayerPedId()
  
  
	  if ( DoesEntityExist( player ) and not IsEntityDead( player )) then
		  loadAnimDict( ad )
		  if ( IsEntityPlayingAnim( player, ad, anim, 8 ) ) then
			  TaskPlayAnim( player, ad, "exit", 8.0, 8.0, 1.0, 1, 1, 0, 0, 0 )
			  ClearPedSecondaryTask(player)
		  else
			  SetCurrentPedWeapon( player, GetHashKey("WEAPON_UNARMED"), equipNow)
			  Citizen.Wait(50)
			  TaskPlayAnim( player, ad, anim, 8.0, 8.0, 1.0, 1, 1, 0, 0, 0 )
		  end
	  end
  end
  
  function animacjasprzedaz()
	  local ad = "mini@repair"
	  local anim = "fixing_a_ped"
	  local player = PlayerPedId()
  
  
	  if ( DoesEntityExist( player ) and not IsEntityDead( player )) then
		  loadAnimDict( ad )
		  if ( IsEntityPlayingAnim( player, ad, anim, 8 ) ) then
			  TaskPlayAnim( player, ad, "exit", 8.0, -8.0, 0.2, 1, 0, 0, 0, 0 )
			  ClearPedSecondaryTask(player)
		  else
			  SetCurrentPedWeapon( player, GetHashKey("WEAPON_UNARMED"), equipNow)
			  Citizen.Wait(50)
			  TaskPlayAnim( player, ad, anim, 8.0, -8.0, 0.2, 1, 0, 0, 0, 0 )
		  end
	  end
  end
  
  function animacjanoszeniaowocow()
	  local ad = "anim@heists@box_carry@"
	  local anim = "idle"
	  local player = PlayerPedId()
  
  
	  if ( DoesEntityExist( player ) and not IsEntityDead( player )) then
		  loadAnimDict( ad )
		  if ( IsEntityPlayingAnim( player, ad, anim, 8 ) ) then
			  TaskPlayAnim( player, ad, "exit", 8.0, 8.0, 1.0, 50, 1, 0, 0, 0 )
			  ClearPedSecondaryTask(player)
		  else
			  usunpropboxowocowx()
			  SetCurrentPedWeapon( player, GetHashKey("WEAPON_UNARMED"), equipNow)
			  boxowocow = CreateObject(GetHashKey("prop_crate_float_1"), 0, 0, 0, true, true, false) -- creates object
			  owoce = CreateObject(GetHashKey("apa_mp_h_acc_fruitbowl_01"), 0, 0, 0, true, true, false) -- creates object
			  AttachEntityToEntity(boxowocow, Citizen.InvokeNative(0x43A66C31C68491C0, -1), GetPedBoneIndex(Citizen.InvokeNative(0x43A66C31C68491C0, -1), 28422), 0.0, -0.4, -0.2, 0, 0, 0, true, true, false, true, 1, true)
			  AttachEntityToEntity(owoce, boxowocow, GetPedBoneIndex(Citizen.InvokeNative(0x43A66C31C68491C0, -1), 28422), 0.0, 0.0, 0.1, 0, 0, 0, true, true, false, true, 1, true)
			  Citizen.Wait(50)
			  TaskPlayAnim( player, ad, anim, 8.0, 8.0, 1.0, 50, 1, 0, 0, 0 )
		  end
	  end
  end
  
  function animacjasoki()
	  local ad = "anim@heists@box_carry@"
	  local anim = "idle"
	  local player = PlayerPedId()
  
  
	  if ( DoesEntityExist( player ) and not IsEntityDead( player )) then
		  loadAnimDict( ad )
		  if ( IsEntityPlayingAnim( player, ad, anim, 8 ) ) then
			  TaskPlayAnim( player, ad, "exit", 8.0, 8.0, 1.0, 50, 1, 0, 0, 0 )
			  ClearPedSecondaryTask(player)
		  else
			  usunpropboxowocowx()
			  SetCurrentPedWeapon( player, GetHashKey("WEAPON_UNARMED"), equipNow)
			  soki = CreateObject(GetHashKey("prop_coolbox_01"), 0, 0, 0, true, true, true) -- creates object
			  AttachEntityToEntity(soki, Citizen.InvokeNative(0x43A66C31C68491C0, -1), GetPedBoneIndex(Citizen.InvokeNative(0x43A66C31C68491C0, -1), 28422), 0, -0.2, -0.2, 0, 0, 0, true, true, false, true, 1, true)
			  Citizen.Wait(50)
			  TaskPlayAnim( player, ad, anim, 8.0, 8.0, 1.0, 50, 1, 0, 0, 0 )
		  end
	  end
  end
  
  --- usuwanie propa owocow
  function usunboxowocowx()
	  --DetachEntity(boxowocow, true, false)
	  --Citizen.Wait(10000)
	  DeleteEntity(boxowocow)
	  DeleteEntity(owoce)
	  DeleteEntity(soki)
	  ClearPedSecondaryTask(PlayerPedId())
	  boxowocow = nil
	  owoce = nil
	  soki = nil
  end
  
  --- usuwanie samego propa owocow
  function usunpropboxowocowx()
	  DeleteEntity(boxowocow)
	  DeleteEntity(owoce)
	  DeleteEntity(soki)
  end
  
  -- pomoc dla debili
  RegisterCommand("sadownik", function(source, args, raw)
					sadownikhelp()
  end, false)
  
  function sadownikhelp()
		  ESX.Scaleform.ShowPopupWarning(Config.Help.Title, Config.Help.Text, bottom, Config.Help.Time)
  end
  
  RegisterNetEvent('sadownik:petelka')
  AddEventHandler('sadownik:petelka', function()
	  isHoldingOwoce = true
	while (isHoldingOwoce) do
	  Citizen.Wait(0)
		  if IsControlJustPressed(1, 38) then
			local coords = GetEntityCoords(PlayerPedId())
			local vehicle = GetClosestVehicle(coords.x, coords.y, coords.z, 2.0, 0, 70)
			local dupcia = GetEntityModel(vehicle)
			  for i=1, #Config.AuthorizedVehicles, 1 do
				  if dupcia == GetHashKey(Config.AuthorizedVehicles[i].model) then
					  usunboxowocowx()
					  isHoldingOwoce = false
				  else
					  ESX.ShowNotification("Za daleko do pojazdu lub nieautoryzowany model.")
				  end
		  end
			  end
	  end
  end)
  
  RegisterNetEvent('sadownik:oddajsoki')
  AddEventHandler('sadownik:oddajsoki', function()
	oddajsoki = true
	animacjasoki()
	  while (oddajsoki) do
		Citizen.Wait(10)
		local playerPed = PlayerPedId()
		local coordsy = GetEntityCoords(playerPed)
		local odlegloscodskupu = #(coordsy - vec3(2743.837, 4415.7, 48.623))
		DisableControlAction(0, 73, true) -- X
		  if IsControlJustReleased(0, Keys['E']) then
			if odlegloscodskupu < 1.5 then
			  usunboxowocowx()
			  oddajsoki = false
			  FreezeEntityPosition(PlayerPedId(), true)
			  Citizen.Wait(5000)
			  FreezeEntityPosition(PlayerPedId(), false)
			  TriggerServerEvent('grower:pay')
			else
			  ESX.ShowNotification("Oddaj soki")
			end
		  end
	  end
  end)
  
  RegisterNetEvent('sadownik:procenty')
  AddEventHandler('sadownik:procenty', function()
	showPro = true
	  while (showPro) do
		Citizen.Wait(5)
		local playerPed = PlayerPedId()
		local coords = GetEntityCoords(playerPed)
		DisableControlAction(0, 73, true) -- X
		DrawText3D(coords.x, coords.y, coords.z+0.1,'Pracuje...' , 0.4)
		DrawText3D(coords.x, coords.y, coords.z, TimeLeft .. '~g~%', 0.4)
	  end
  end)
  
  -- check na drzewo przy zbieraniu
  function dupa()
	  local player = PlayerId()
	  local plyPed = Citizen.InvokeNative(0x43A66C31C68491C0, player)
	  local plyPos = GetEntityCoords(plyPed, false)
	  local plyOffset = GetOffsetFromEntityInWorldCoords(plyPed, 0.0, 1.0, 0.0)
	  local radius = 0.5
	  local rayHandle = StartShapeTestCapsule(plyPos.x, plyPos.y, plyPos.z, plyOffset.x, plyOffset.y, plyOffset.z, radius, 1, plyPed, 5)
	  local _, _, _, _, tree = GetShapeTestResult(rayHandle)
	  return tree
  end
  
  
  function mainblip()
	  while ESX == nil do
		  Citizen.Wait(10)
	  end
	  if ESX.PlayerData.job ~= nil and ESX.PlayerData.job.name == 'grower' then
		  local blipgrower = AddBlipForCoord(Config.Zones.Cloakroom.Pos.x, Config.Zones.Cloakroom.Pos.y, Config.Zones.Cloakroom.Pos.z)
  
		  SetBlipSprite (blipgrower, Config.Blips.Cloakroom.Sprite)
		  SetBlipDisplay(blipgrower, 4)
		  SetBlipScale  (blipgrower, 1.0)
		  SetBlipColour (blipgrower, 2)
		  SetBlipAsShortRange(blipgrower, true)
  
		  BeginTextCommandSetBlipName("STRING")
		  AddTextComponentSubstringPlayerName('#1 Szatnia')
		  EndTextCommandSetBlipName(blipgrower)
		  table.insert(JobBlips, blipgrower)
	  end
  end
  
  -- wejscie na sluzbe i dodanie blipow
  function onduty()
  if not BlipsAdded then
	onDuty = true
	BlipsAdded = true 
	local blipgrower2 = AddBlipForCoord(Config.Zones.Job1.Pos.x, Config.Zones.Job1.Pos.y, Config.Zones.Job1.Pos.z)
	local blipgrower3 = AddBlipForCoord(Config.Zones.Job1b.Pos.x, Config.Zones.Job1b.Pos.y, Config.Zones.Job1b.Pos.z)
	local blipgrower4 = AddBlipForCoord(Config.Zones.Job2.Pos.x, Config.Zones.Job2.Pos.y, Config.Zones.Job2.Pos.z)
	--local blipgrower5 = AddBlipForCoord(Config.Zones.Job3.Pos.x, Config.Zones.Job3.Pos.y, Config.Zones.Job3.Pos.z)
	local blipgrower6 = AddBlipForCoord(Config.Zones.Job3a.Pos.x, Config.Zones.Job3a.Pos.y, Config.Zones.Job3a.Pos.z)
  
	SetBlipSprite (blipgrower2, Config.Blips.pear.Sprite)
	SetBlipDisplay(blipgrower2, 4)
	SetBlipScale  (blipgrower2, 1.0)
	SetBlipColour (blipgrower2, 1)
	SetBlipAsShortRange(blipgrower2, true)
  
	SetBlipSprite (blipgrower3, Config.Blips.Orange.Sprite)
	SetBlipDisplay(blipgrower3, 4)
	SetBlipScale  (blipgrower3, 1.0)
	SetBlipColour (blipgrower3, 47)
	SetBlipAsShortRange(blipgrower3, true)
  
	SetBlipSprite (blipgrower4, Config.Blips.Juice.Sprite)
	SetBlipDisplay(blipgrower4, 4)
	SetBlipScale  (blipgrower4, 1.0)
	SetBlipColour (blipgrower4, 35)
	SetBlipAsShortRange(blipgrower4, true)
  
	--[[SetBlipSprite (blipgrower5, Config.Blips.SellJuice.Sprite)
	SetBlipDisplay(blipgrower5, 4)
	SetBlipScale  (blipgrower5, 1.0)
	SetBlipColour (blipgrower5, 46)
	SetBlipAsShortRange(blipgrower5, true)]]
  
	SetBlipSprite (blipgrower6, Config.Blips.SellFruits.Sprite)
	SetBlipDisplay(blipgrower6, 4)
	SetBlipScale  (blipgrower6, 1.0)
	SetBlipColour (blipgrower6, 46)
	SetBlipAsShortRange(blipgrower6, true)
  
	BeginTextCommandSetBlipName("STRING")
	AddTextComponentSubstringPlayerName('#2 Zbieranie jablek')
	EndTextCommandSetBlipName(blipgrower2)
	table.insert(JobBlips, blipgrower2)
  
	BeginTextCommandSetBlipName("STRING")
	AddTextComponentSubstringPlayerName('#3 Zbieranie pomarańczy')
	EndTextCommandSetBlipName(blipgrower3)
	table.insert(JobBlips, blipgrower3)
  
	BeginTextCommandSetBlipName("STRING")
	AddTextComponentSubstringPlayerName('#4 Hurtownia soków')
	EndTextCommandSetBlipName(blipgrower4)
	table.insert(JobBlips, blipgrower4)
  
	--[[BeginTextCommandSetBlipName("STRING")
	AddTextComponentSubstringPlayerName('#4 Sprzedaż owoców')
	EndTextCommandSetBlipName(blipgrower5)
	table.insert(JobBlips, blipgrower5)]]
  
	BeginTextCommandSetBlipName("STRING")
	AddTextComponentSubstringPlayerName('#5 Skup soków')
	EndTextCommandSetBlipName(blipgrower6)
	table.insert(JobBlips, blipgrower6)
   else
	   ESX.ShowNotification('Masz juz służbowe ciuchy.')
   end
  end
  
  -- usuwanie blipow pracy oraz zejscie ze sluzby.
  function offduty()
	onDuty = false
	BlipsAdded = false
	if JobBlips[1] ~= nil then
		  for i=1, #JobBlips, 1 do
			  RemoveBlip(JobBlips[i])
			  JobBlips[i] = nil
		  end
	  end
  end
  
  function loadAnimDict(dict)
	  while (not HasAnimDictLoaded(dict)) do
		  RequestAnimDict(dict)
		  Citizen.Wait(5)
	  end
  end
  
  function procent(time)
	TriggerEvent('sadownik:procenty')
	TimeLeft = 0
	repeat
	TimeLeft = TimeLeft + 1
	Citizen.Wait(time)
	until(TimeLeft == 100)
	showPro = false
	cooldownclick = false
  end
  
  function grower_givekeys()
	  if(IsPedInAnyVehicle(PlayerPedId(), true))then
		  VehId = GetVehiclePedIsIn(Citizen.InvokeNative(0x43A66C31C68491C0, -1), false)
		  local VehPlateTest = GetVehicleNumberPlateText(VehId)
		  local VehLockStatus = GetVehicleDoorLockStatus(VehId)
		  if VehPlateTest ~= nil then
			  local VehPlate = string.lower(VehPlateTest)
			  TriggerServerEvent('ls:checkOwner', VehId, VehPlate, VehLockStatus)
		  end
	  end
  end
  
  function DrawText3D(x, y, z, text, scale)
	local onScreen, _x, _y = World3dToScreen2d(x, y, z)
	local pX, pY, pZ = table.unpack(GetGameplayCamCoords())
  
	SetTextScale(scale, scale)
	SetTextFont(4)
	SetTextProportional(1)
	SetTextEntry("STRING")
	SetTextCentre(1)
	SetTextColour(255, 255, 255, 255)
	SetTextOutline()
  
	AddTextComponentString(text)
	DrawText(_x, _y)
  
	local factor = (string.len(text)) / 270
	DrawRect(_x, _y + 0.015, 0.005 + factor, 0.03, 31, 31, 31, 155)
  end
  
  function DrawText3Ds(x,y,z, text)
	  local onScreen,_x,_y=World3dToScreen2d(x,y,z)
	  local px,py,pz=table.unpack(GetGameplayCamCoords())
  
	  SetTextScale(0.35, 0.35)
	  SetTextFont(4)
	  SetTextProportional(1)
	  SetTextColour(255, 255, 255, 215)
	  SetTextEntry("STRING")
	  SetTextCentre(1)
	  AddTextComponentString(text)
	  DrawText(_x,_y)
	  local factor = (string.len(text)) / 370
	  DrawRect(_x,_y+0.0125, 0.015+ factor, 0.03, 41, 11, 41, 68)
  end
  
  AddEventHandler('onResourceStart', function(resource)
	  if resource == GetCurrentResourceName() then
		  mainblip()
	  end
  end)
  
  AddEventHandler('onClientMapStart', function()
	  mainblip() 
  end)