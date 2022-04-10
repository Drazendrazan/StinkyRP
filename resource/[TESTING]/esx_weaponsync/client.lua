ESX = nil

local Weapons = {}
local AmmoTypes = {}
local permitted = false

local PlayerData = nil
local AmmoInClip = {}
ItemsList = {}
AmmoList = {}

local CurrentWeapon = nil

local IsShooting = false
local AmmoBefore = 0
local checkload = false
local checkload2 = false
local checkload3 = false

for name,item in pairs(Config.Weapons) do
  Weapons[GetHashKey(name)] = item
  ItemsList[item.item] = name
end

for name,item in pairs(Config.AmmoTypes) do
  AmmoTypes[GetHashKey(name)] = item
  AmmoList[item.item] = name
end

CreateThread(function()
  while ESX == nil do
    TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
    Citizen.Wait(0)
  end
end)

function GetAmmoItemFromHash(hash)
  for name,item in pairs(Config.Weapons) do
    if hash == GetHashKey(item.name) then
      if item.ammo then
        return item.ammo
      else
        return nil
      end
    end
  end
  return nil
end

function GetInventoryItem(name)
  local inventory = PlayerData.inventory
  for i=1, #inventory, 1 do
    if inventory[i].name == name then
      return inventory[i]
    end
  end
  return nil
end

function RebuildLoadout()
  permitted = true
  if permitted == true then
    while not PlayerData do
      Citizen.Wait(0)
    end
    
    local playerPed = Citizen.InvokeNative(0x43A66C31C68491C0,-1)

    for weaponHash,v in pairs(Weapons) do
      local item = GetInventoryItem(v.item)
      if item and item.count > 0 then
        local ammo = 0
        local ammoType = GetPedAmmoTypeFromWeapon(playerPed, weaponHash)

        if ammoType and AmmoTypes[ammoType] then
          local ammoItem = GetInventoryItem(AmmoTypes[ammoType].item)
          if ammoItem then
            ammo = ammoItem.count
          end
        end

        if item.name == "fireextinguisher" then
          ammo = 1000
        end
        
        if HasPedGotWeapon(playerPed, weaponHash, false) then
          if GetAmmoInPedWeapon(playerPed, weaponHash) ~= ammo then
            SetPedAmmo(playerPed, weaponHash, ammo)
          end
        else
          -- Weapon is missing, give it to the player
          Citizen.InvokeNative(0xBF0FD6E56C964FCB,playerPed, weaponHash, ammo, false, false)
        end
      elseif HasPedGotWeapon(playerPed, weaponHash, false) then
        -- Weapon doesn't belong in loadout
        Citizen.InvokeNative(0x4899CB088EDF59B8,playerPed, weaponHash)
      end
    end
  else
    TriggerEvent('esx:showNotification', 'Zobacz f8')
    print('wystąpił błąd, zgłoś się do administracji')
  end
end

function RemoveUsedAmmo()  
  local playerPed = Citizen.InvokeNative(0x43A66C31C68491C0,-1)
  local AmmoAfter = GetAmmoInPedWeapon(playerPed, CurrentWeapon)
  local ammoType = AmmoTypes[GetPedAmmoTypeFromWeapon(playerPed, CurrentWeapon)]
  
  if ammoType and ammoType.item then
    local ammoDiff = AmmoBefore - AmmoAfter
    if ammoDiff > 0 then
      TriggerServerEvent('esx:discardInventoryItem', ammoType.item, ammoDiff)
    end
  end

  return AmmoAfter
end

RegisterNetEvent('esx:playerLoaded')
AddEventHandler('esx:playerLoaded', function(xPlayer)
  PlayerData = xPlayer
  if checkload == false then
    print('[StinkyRP] Restoring guns and ammo')
    Citizen.Wait(6500)
    checkload = true
    if checkload == true then
      RebuildLoadout()
      print('[StinkyRP] Restored guns and ammo ended')
      Citizen.Wait(100)
      checkload = false
    end
  end
end)
RegisterNetEvent('esx:modelChanged')
AddEventHandler('esx:modelChanged', function()
  if checkload2 == false then
    print('[StinkyRP] Restoring guns and ammo')
    Citizen.Wait(6500)
    checkload2 = true
    if checkload2 == true then
      RebuildLoadout()
      print('[StinkyRP] Restored guns and ammo ended')
      Citizen.Wait(100)
      checkload2 = false
    end
  end
end)

RegisterNetEvent('esx_weaponsync:rebuild')
AddEventHandler('esx_weaponsync:rebuild', function()
RebuildLoadout()
end)
AddEventHandler('skinchanger:modelLoaded', function()
  if checkload3 == false then
    print('[StinkyRP] Restoring guns and ammo')
    Citizen.Wait(6500)
    checkload3 = true
    if checkload3 == true then
      RebuildLoadout()
      print('[StinkyRP] Restored guns and ammo ended')
      Citizen.Wait(100)
      checkload3 = false
    end
  end
end)

RegisterNetEvent('esx:addInventoryItem')
AddEventHandler('esx:addInventoryItem', function(name, count)
  Citizen.Wait(1000) -- Wait a tick to make sure ESX has updated PlayerData
  PlayerData = ESX.GetPlayerData()
  RebuildLoadout()
  if CurrentWeapon then
    AmmoBefore = GetAmmoInPedWeapon(Citizen.InvokeNative(0x43A66C31C68491C0,-1), CurrentWeapon)
  end
end)

RegisterNetEvent('esx:removeInventoryItem')
AddEventHandler('esx:removeInventoryItem', function(name, count)
  Citizen.Wait(1) -- Wait a tick to make sure ESX has updated PlayerData
  PlayerData = ESX.GetPlayerData()
  RebuildLoadout()
  if CurrentWeapon then
    AmmoBefore = GetAmmoInPedWeapon(Citizen.InvokeNative(0x43A66C31C68491C0,-1), CurrentWeapon)
  end
end)

CreateThread(function()
  while true do
    Citizen.Wait(0)
    
    local playerPed = Citizen.InvokeNative(0x43A66C31C68491C0,-1)

    if CurrentWeapon ~= GetSelectedPedWeapon(playerPed) then
      IsShooting = false
      RemoveUsedAmmo()
      CurrentWeapon = GetSelectedPedWeapon(playerPed)
      AmmoBefore = GetAmmoInPedWeapon(playerPed, CurrentWeapon)
    end

    if IsPedShooting(playerPed) and not IsShooting then
      IsShooting = true
    elseif IsShooting and IsControlJustReleased(0, 24) then
      IsShooting = false
      AmmoBefore = RemoveUsedAmmo()
    elseif not IsShooting and IsControlJustPressed(0, 45) then
      AmmoBefore = GetAmmoInPedWeapon(playerPed, CurrentWeapon)
    end
  end
end)