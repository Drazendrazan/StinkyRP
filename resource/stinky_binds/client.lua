ESX = nil
local settings = {
    cache = {},
    cache_used = {},
    hide = false,
    timer = {
        [1] = 0,
        [2] = 0
    }
}

Citizen.CreateThread(function()
    while true do
      Citizen.Wait(0)
      DisableControlAction(0,37,true) -- disable TAB
      DisableControlAction(0,47,true) -- disable weapon
      DisableControlAction(0,58,true) -- disable weapon
     end
  end)

CreateThread(function()
	while ESX == nil do
		TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
		Wait(0)
	end	
	Wait(5000)
	PlayerData = ESX.GetPlayerData()
    TriggerServerEvent("definitelynotPK:LoadSlots")
    Wait(5000)
    ESX.TriggerServerCallback('Stinky:getBinds', function(a,b,c,d,e)
        if a ~= 'Brak' and a ~= nil then
            SendNUIMessage({action = "img1", img1 = "img/"..a..".png" })
        else
            SendNUIMessage({action = "delimg1"})
        end
        if b ~= 'Brak' and b ~= nil then
            SendNUIMessage({action = "img2", img2 = "img/"..b..".png" })
        else
            SendNUIMessage({action = "delimg2"})
        end
        if c ~= 'Brak' and c ~= nil then
            SendNUIMessage({action = "img3", img3 = "img/"..c..".png" })
        else
            SendNUIMessage({action = "delimg3"})
        end
        if d ~= 'Brak' and d ~= nil then
            SendNUIMessage({action = "img4", img4 = "img/"..d..".png" })
        else
            SendNUIMessage({action = "delimg4"})
        end
        if e ~= 'Brak' and e ~= nil then
            SendNUIMessage({action = "img5", img5 = "img/"..e..".png" })
        else
            SendNUIMessage({action = "delimg5"})
        end
    end)
end)

CreateThread(function()
	while true do
		Wait(1000)
		TriggerEvent('Stinky:bindHud', true)
		break
	end
end)

RegisterCommand('bindmanage', function()
	openBindManage()
end)

RegisterKeyMapping('+menu_zarzadania_bindami', 'Menu Zarzadania Bindami', 'mouse_button', 'MOUSE_MIDDLE')

RegisterCommand('+menu_zarzadania_bindami', function()
    if settings.hide == false then
        CreateThread(function()
            while true do 
                Wait(1000)
                TriggerEvent('Stinky:bindHud', false)
                settings.hide = true
                break
            end
        end)
    elseif settings.hide == true then
        CreateThread(function()
            while true do 
                Wait(1000)
                TriggerEvent('Stinky:bindHud', true)
                settings.hide = false
                break
            end
        end)
    end
end)

RegisterNetEvent('Stinky:IsWeapon')
AddEventHandler('Stinky:IsWeapon', function(item)
    if GetGameTimer() > settings.timer[1] then
        settings.timer[1] = GetGameTimer() + 2000   
        local weapon = 'weapon_'..item
        local weaponHash = GetHashKey(weapon)
        local playerPed = PlayerPedId()
        if GetSelectedPedWeapon(playerPed) == weaponHash then
            Citizen.InvokeNative(0xADF692B254977C0C, playerPed, GetHashKey('WEAPON_UNARMED'), true)
            TriggerServerEvent("binds:notify2", item)
        else
            Citizen.InvokeNative(0xADF692B254977C0C, playerPed, weaponHash, true)
            TriggerServerEvent("binds:notify", item)
        end
    end
end)

for i=1, 5, 1 do
    RegisterCommand('+-slot'..i, function()    
        if i == tonumber(1) then
            Select('first', 1)
        elseif i == tonumber(2) then
            Select('second', 2)
        elseif i == tonumber(3) then
            Select('third', 3)
        elseif i == tonumber(4) then
            Select('fourth', 4)
        elseif i == tonumber(5) then
            Select('fifth', 5)
        end
    end)
    RegisterKeyMapping('+-slot'..i, 'slot '..i, 'keyboard', i)
end

RegisterNetEvent('Stinky:useItem')
AddEventHandler('Stinky:useItem', function(item)
	if GetGameTimer() > settings.timer[2] then
	    settings.timer[2] = GetGameTimer() + 2000    
	    TriggerServerEvent('esx:useItem', item)
	end
end)

Select = function(who, val)
    TriggerServerEvent('Stinky:UseItemFromBind', who)
end

openBindManage = function()
    ESX.UI.Menu.CloseAll()

    local elements = {}
    ESX.TriggerServerCallback('Stinky:getBinds', function(a,b,c,d,e)
        if a ~= 'Brak' and a ~= nil then
            table.insert(elements, { label = '[1] Naćisnij aby usunąć - '..tostring(a), value = '1' })
        else
            table.insert(elements, { label = '[1] Brak przypisanego klawisza pod item'})
        end
        if b ~= 'Brak' and b ~= nil then
            table.insert(elements, { label = '[2] Naćisnij aby usunąć - '..tostring(b), value = '2' })
        else
            table.insert(elements, { label = '[2] Brak przypisanego klawisza pod item'})
        end
        if c ~= 'Brak' and c ~= nil then
            table.insert(elements, { label = '[3] Naciśnij aby usunąć - '..tostring(c), value = '3' })
        else
            table.insert(elements, { label = '[3] Brak przypisanego klawisza pod item'})
        end
        if d ~= 'Brak' and d ~= nil then
            table.insert(elements, { label = '[4] Naciśnij aby usunąć - '..tostring(d), value = '4' })
        else
            table.insert(elements, { label = '[4] Brak przypisanego klawisza pod item'})
        end
        if e ~= 'Brak' and e ~= nil then
            table.insert(elements, { label = '[5] Naciśnij aby usunąć - '..tostring(e), value = '5'})
        else
            table.insert(elements, { label = '[5] Brak przypisanego klawisza pod item'})
        end
    end)

    Wait(500)

    ESX.UI.Menu.Open(
        'default', GetCurrentResourceName(), 'bagol',
        {
            title    = "Zarządzanie Ekwipunkiem",
            align     = "bottom-right",
            elements = elements
        }, function(data, menu)
            local value = data.current.value
            if value == '1' then
                data_value = 'first'
            elseif value == '2' then
                data_value = 'second'
            elseif value == '3' then
                data_value = 'third'
            elseif value == '4' then
                data_value = 'fourth'
            elseif value == '5' then
                data_value = 'fifth'
            end
            TriggerServerEvent('Stinky:deleteBind', data_value)
            openBindManage()
        end,

    function(data, menu)
        menu.close()
    end)
end

RegisterNetEvent('Stinky:bindHud')
AddEventHandler('Stinky:bindHud', function(boolean)
    SendNUIMessage({
        type = "open",
        display = boolean,
    })
end)

RegisterNetEvent('Stinky:updatebinds')
AddEventHandler('Stinky:updatebinds', function(awsd)
    local data = awsd
    if data.first ~= 'Brak' and data.first ~= nil then
        SendNUIMessage({action = "img1", img1 = "img/"..data.first..".png" })
    else
        SendNUIMessage({action = "delimg1"})
    end
    if data.second ~= 'Brak' and data.second ~= nil then
        SendNUIMessage({action = "img2", img2 = "img/"..data.second..".png" })
    else
        SendNUIMessage({action = "delimg2"})
    end
    if data.third ~= 'Brak' and data.third ~= nil then
        SendNUIMessage({action = "img3", img3 = "img/"..data.third..".png" })
    else
        SendNUIMessage({action = "delimg3"})
    end
    if data.fourth ~= 'Brak' and data.fourth ~= nil then
        SendNUIMessage({action = "img4", img4 = "img/"..data.fourth..".png" })
    else
        SendNUIMessage({action = "delimg4"})
    end
    if data.fifth ~= 'Brak' and data.fifth ~= nil then
        SendNUIMessage({action = "img5", img5 = "img/"..data.fifth..".png" })
    else
        SendNUIMessage({action = "delimg5"})
    end
end)
