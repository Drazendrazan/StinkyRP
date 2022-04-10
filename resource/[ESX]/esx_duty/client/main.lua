--[[local Keys = {
  ["ESC"] = 322, ["F1"] = 288, ["F2"] = 289, ["F3"] = 170, ["F5"] = 166, ["F6"] = 167, ["F7"] = 168, ["F8"] = 169, ["F9"] = 56, ["F10"] = 57,
  ["~"] = 243, ["1"] = 157, ["2"] = 158, ["3"] = 160, ["4"] = 164, ["5"] = 165, ["6"] = 159, ["7"] = 161, ["8"] = 162, ["9"] = 163, ["-"] = 84, ["="] = 83, ["BACKSPACE"] = 177,
  ["TAB"] = 37, ["Q"] = 44, ["W"] = 32, ["E"] = 38, ["R"] = 45, ["T"] = 245, ["Y"] = 246, ["U"] = 303, ["P"] = 199, ["["] = 39, ["]"] = 40, ["ENTER"] = 18,
  ["CAPS"] = 137, ["A"] = 34, ["S"] = 8, ["D"] = 9, ["F"] = 23, ["G"] = 47, ["H"] = 74, ["K"] = 311, ["L"] = 182,
  ["LEFTSHIFT"] = 21, ["Z"] = 20, ["X"] = 73, ["C"] = 26, ["V"] = 0, ["B"] = 29, ["N"] = 249, ["M"] = 244, [","] = 82, ["."] = 81,
  ["LEFTCTRL"] = 36, ["LEFTALT"] = 19, ["SPACE"] = 22, ["RIGHTCTRL"] = 70,
  ["HOME"] = 213, ["PAGEUP"] = 10, ["PAGEDOWN"] = 11, ["DELETE"] = 178,
  ["LEFT"] = 174, ["RIGHT"] = 175, ["TOP"] = 27, ["DOWN"] = 173,
}


--- action functions
local CurrentAction           = nil
local CurrentActionMsg        = ''
local CurrentActionData       = {}
local HasAlreadyEnteredMarker = false
local LastZone                = nil


--- esx
local GUI = {}
ESX                           = nil
GUI.Time                      = 0]]
local PlayerData              = {}
local pCoords = nil

CreateThread(function ()
  while ESX == nil do
    TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
    Citizen.Wait(0)
 	PlayerData = ESX.GetPlayerData()
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

--[[
AddEventHandler('esx_duty:hasEnteredMarker', function (zone)
  if zone == 'AmbulanceDuty' then
    CurrentAction     = 'ambulance_duty'
    CurrentActionMsg  = _U('duty')
    CurrentActionData = {}
  end
  if zone == 'PoliceDuty' then
    CurrentAction     = 'police_duty'
    CurrentActionMsg  = _U('duty')
    CurrentActionData = {}
  end
end)

AddEventHandler('esx_duty:hasExitedMarker', function (zone)
  CurrentAction = nil
end)]]


--[[
CreateThread(function ()
  while true do
    Citizen.Wait(0)

      local playerPed = PlayerPedId()

    if CurrentAction ~= nil then
      SetTextComponentFormat('STRING')
      AddTextComponentString(CurrentActionMsg)
      DisplayHelpTextFromStringLabel(0, 0, 1, -1)

      if IsControlPressed(0, Keys['E']) then
        if CurrentAction == 'ambulance_duty' then
          if PlayerData.job.name == 'ambulance' or PlayerData.job.name == 'offambulance' then
            TriggerServerEvent('duty:ambulance')
          if PlayerData.job.name == 'ambulance' then
            TriggerEvent('esx:showAdvancedNotification', _U('offduty'))
            Wait(1000)
          else
            TriggerEvent('esx:showAdvancedNotification', _U('onduty'))
            Wait(1000)
          end
        else
          TriggerEvent('esx:showAdvancedNotification', _U('notamb'))
          Wait(1000)
        end
      end

        if CurrentAction == 'police_duty' then
          if PlayerData.job.name == 'police' or PlayerData.job.name == 'offpolice' then
            TriggerServerEvent('duty:police')
          if PlayerData.job.name == 'police' then
            TriggerEvent('esx:showAdvancedNotification', _U('offduty'))
            Wait(1000)
          else
            TriggerEvent('esx:showAdvancedNotification', _U('onduty'))
            Wait(1000)
          end
        else
          TriggerEvent('esx:showAdvancedNotification', _U('notpol'))
          Wait(1000)
          end
        end
      end
    end
  end       
end)

-- Display markers
CreateThread(function ()
  while true do
    Wait(0)

    local coords = GetEntityCoords(PlayerPedId())

    for k,v in pairs(Config.Zones) do
      if(v.Type ~= -1 and GetDistanceBetweenCoords(coords, v.Pos.x, v.Pos.y, v.Pos.z, true) < Config.DrawDistance) then
        DrawMarker(v.Type, v.Pos.x, v.Pos.y, v.Pos.z, 0.0, 0.0, 0.0, 0, 0.0, 0.0, v.Size.x, v.Size.y, v.Size.z, v.Color.r, v.Color.g, v.Color.b, 100, false, true, 2, false, false, false, false)
      end
    end
  end
end)]]

local Cfg = {
  Duty = {
		{
			coords = vector3(304.89, -586.42, 43.29), -- PILLBOX
		},
    {
			coords = vector3(-808.19, -1238.22, 7.29), -- VICEROY
		},
    {
			coords = vector3(430.98, -982.52, 25.7), -- Mission Row
		},
    {
			coords = vector3(1830.08, 3672.29, 34.27), -- SANDY KOMENDA/SZPITAL
		},
    {
			coords = vector3(-445.21, 6015.17, 31.72), -- Paleto KOMENDA
		},
    {
			coords = vector3(-253.06, 6332.59, 32.43), -- Paleto SZPITAL
		},
    {
			coords = vector3(835.27, -896.57, 25.25), -- Mechanik miasto
		},
  }
}

canUse = function(coords)
	for k,v in pairs(Cfg.Duty) do
    local coords, sleep = GetEntityCoords(PlayerPedId()), true
		if #(v.coords - coords) < 250.0 then
			return true
		end	
	end
	return false
end

RegisterCommand('dutylst', function(source, args, rawCommand)
  if PlayerData.job.name == 'mecano' or PlayerData.job.name == 'offmecano' then
    if canUse(pCoords) then
      TriggerServerEvent('duty:mecano')
      if PlayerData.job.name == 'mecano' then
        TriggerEvent('esx:showNotification', _U('offduty'))
        Wait(1000)
      else
        TriggerEvent('esx:showNotification', _U('onduty'))
        Wait(1000)
      end
    else
      TriggerEvent('esx:showNotification', 'Nie jesteś na terenie Warsztatu!')
    end
  else
    TriggerEvent('esx:showNotification', 'Nie jesteś zatrudniony w LST!')
    Wait(1000)
  end
end)

RegisterCommand('dutysams', function(source, args, rawCommand)
  if PlayerData.job.name == 'ambulance' or PlayerData.job.name == 'offambulance' then
    if canUse(pCoords) then
      TriggerServerEvent('duty:ambulance')
      if PlayerData.job.name == 'ambulance' then
        TriggerEvent('esx:showNotification', _U('offduty'))
      else
        TriggerEvent('esx:showNotification', _U('onduty'))
      end
    else
      TriggerEvent('esx:showNotification', 'Nie jesteś na terenie Szpitala!')
    end
  else
    TriggerEvent('esx:showNotification', 'Nie jesteś zatrudniony w SAMS!')
  end
end)


RegisterCommand('dutysasp', function(source, args, rawCommand)
  if PlayerData.job.name == 'police' or PlayerData.job.name == 'offpolice' then
    if canUse(pCoords) then
      TriggerServerEvent('duty:police')
      TriggerEvent('duty:boats')
      if PlayerData.job.name == 'police' then
        TriggerEvent('esx:showNotification', _U('offduty'))
        Wait(1000)
      else
        TriggerEvent('esx:showNotification', _U('onduty'))
        Wait(1000)
      end
    else
      TriggerEvent('esx:showNotification', 'Nie jesteś na terenie Komendy!')
    end
  else
    TriggerEvent('esx:showNotification', 'Nie jesteś zatrudniony w SASP!')
    Wait(1000)
  end
end)

--[[
CreateThread(function ()
  while true do
    Wait(0)

    local coords      = GetEntityCoords(PlayerPedId())
    local isInMarker  = false
    local currentZone = nil

    for k,v in pairs(Config.Zones) do
      if(GetDistanceBetweenCoords(coords, v.Pos.x, v.Pos.y, v.Pos.z, true) < v.Size.x) then
        isInMarker  = true
        currentZone = k
      end
    end

    if (isInMarker and not HasAlreadyEnteredMarker) or (isInMarker and LastZone ~= currentZone) then
      HasAlreadyEnteredMarker = true
      LastZone                = currentZone
      TriggerEvent('esx_duty:hasEnteredMarker', currentZone)
    end

    if not isInMarker and HasAlreadyEnteredMarker then
      HasAlreadyEnteredMarker = false
      TriggerEvent('esx_duty:hasExitedMarker', LastZone)
    end
  end
end)]]

--notification
function sendNotification(message, messageType, messageTimeout)
	TriggerEvent("pNotify:SendNotification", {
		text = message,
		type = messageType,
		queue = "duty",
		timeout = messageTimeout,
		layout = "bottomCenter"
	})
end