ESX = nil
Citizen.CreateThread(function()
	local GUI = {
		Time = 0
	}
	while ESX == nil do
		TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
		Citizen.Wait(0)
	end

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

	local MenuType = 'default'
	local OpenedMenus = {}
	local MenuFocus = false
	local Trace = {}

	local openMenu = function(namespace, name, data)
		OpenedMenus[namespace .. '_' .. name] = true
		SendNUIMessage({
			action    = 'openMenu',
			namespace = namespace,
			name      = name,
			data      = data
		})

	end

	local closeMenu = function(namespace, name)
		OpenedMenus[namespace .. '_' .. name] = nil
		SendNUIMessage({
			action    = 'closeMenu',
			namespace = namespace,
			name      = name
		})
	end

	ESX.UI.Menu.RegisterType(MenuType, openMenu, closeMenu)
	local ValidateData = function(e, a)
		if not a then
			print('[ESX] Empty data menu during ' .. e)
			for _, t in ipairs(Trace) do
				print(table.concat(t, ' '))
			end

			return false
		end

		if #Trace > 9 then
			repeat
				table.remove(Trace, 1)
			until #Trace < 10
		end

		table.insert(Trace, {e, a._namespace, a._name})
		return true
	end

	local ValidateMenu = function(obj, ns, n)
		if obj then
			return true
		end

		closeMenu(ns, n)
		return false
	end

	RegisterNUICallback('menu_submit', function(data, cb)
		assert(ValidateData('submit', data))

		local menu = ESX.UI.Menu.GetOpened(MenuType, data._namespace, data._name)
		if not ValidateMenu(menu, data._namespace, data._name) then
			return
		end

		if menu.submit ~= nil then
			PlaySound(-1, "SELECT", "HUD_FRONTEND_DEFAULT_SOUNDSET", 0, 0, 1)
			menu.submit(data, menu)
		end

		if MenuFocus then
			SetNuiFocus(false)
			MenuFocus = false

			SendNUIMessage({
				action  = 'focusMenu',
				control = false
			})
		end

		cb('ok')
	end)

	RegisterNUICallback('menu_delete', function(data, cb)
		assert(ValidateData('delete', data))

		local menu = ESX.UI.Menu.GetOpened(MenuType, data._namespace, data._name)
		if not ValidateMenu(menu, data._namespace, data._name) then
			return
		end

		if menu.delete ~= nil then
			PlaySound(-1, "SELECT", "HUD_FRONTEND_DEFAULT_SOUNDSET", 0, 0, 1)
			menu.delete(data, menu)
		end

		if MenuFocus then
			SetNuiFocus(false)
			MenuFocus = false

			SendNUIMessage({
				action  = 'focusMenu',
				control = false
			})
		end

		cb('ok')
	end)

	RegisterNUICallback('menu_cancel', function(data, cb)
		assert(ValidateData('cancel', data))

		local menu = ESX.UI.Menu.GetOpened(MenuType, data._namespace, data._name)
		if not ValidateMenu(menu, data._namespace, data._name) then
			return
		end

		if menu.cancel ~= nil then
			PlaySound(-1, "EXIT", "HUD_FRONTEND_DEFAULT_SOUNDSET", 0, 0, 1)
			menu.cancel(data, menu)
		end

		if MenuFocus then
			SetNuiFocus(false)
			MenuFocus = false

			SendNUIMessage({
				action  = 'focusMenu',
				control = false
			})
		end

		cb('ok')
	end)

	RegisterNUICallback('menu_change', function(data, cb)
		assert(ValidateData('change', data))

		local menu = ESX.UI.Menu.GetOpened(MenuType, data._namespace, data._name)
		if not ValidateMenu(menu, data._namespace, data._name) then
			return
		end

		for i, element in ipairs(data.elements) do
			menu.setElement(i, 'value', element.value)
			if element.selected then
				PlaySound(-1, "SELECT", "HUD_FRONTEND_DEFAULT_SOUNDSET", 0, 0, 1)
				menu.setElement(i, 'selected', true)
			else
				PlaySound(-1, "SELECT", "HUD_FRONTEND_DEFAULT_SOUNDSET", 0, 0, 1)
				menu.setElement(i, 'selected', false)
			end

		end

		if menu.change ~= nil then
			menu.change(data, menu)
		end

		if MenuFocus then
			SetNuiFocus(false)
			MenuFocus = false

			SendNUIMessage({
				action  = 'focusMenu',
				control = false
			})
		end

		cb('ok')
	end)

	RegisterNUICallback('menu_focus', function(data, cb)
		if data.focus ~= MenuFocus then
			if data.focus then
				PlaySound(-1, "SELECT", "HUD_FRONTEND_DEFAULT_SOUNDSET", 0, 0, 1)
				MenuFocus = true
				SetNuiFocus(true, true)
			else
				PlaySound(-1, "SELECT", "HUD_FRONTEND_DEFAULT_SOUNDSET", 0, 0, 1)
				MenuFocus = false
				SetNuiFocus(false)
			end

			SendNUIMessage({
				action  = 'focusMenu',
				focus   = data.focus
			})
		end

		cb('ok')
	end)

	RegisterNUICallback('menu_shortcut', function(data, cb)
		assert(ValidateData('shortcut', data))

		local menu = ESX.UI.Menu.GetOpened(MenuType, data._namespace, data._name)
		if not ValidateMenu(menu, data._namespace, data._name) then
			return
		end

		if menu.shortcut ~= nil then
			menu.shortcut(data, menu)
		end

		if MenuFocus then
			SetNuiFocus(false)
			MenuFocus = false

			SendNUIMessage({
				action  = 'focusMenu',
				control = false
			})
		end

		cb('ok')
	end)

	Citizen.CreateThread(function()
		while true do
			Citizen.Wait(0)

			local IsInventory, OpenedMenuCount = false, 0
			for k, v in pairs(OpenedMenus) do
				if v == true then
					OpenedMenuCount = OpenedMenuCount + 1
					if k == 'inventory' then
						IsInventory = true
					end
				end
			end

			if OpenedMenuCount > 0 then
				DisableControlAction(0, Keys['ENTER'], true)
				if IsDisabledControlPressed(0, Keys['ENTER']) and GetLastInputMethod(2) and (GetGameTimer() - GUI.Time) > 150 then
					SendNUIMessage({
						action  = 'controlPressed',
						control = 'ENTER'
					})
					GUI.Time = GetGameTimer()
				end

				DisableControlAction(0, Keys['DELETE'], true)
				if IsDisabledControlPressed(0, Keys['DELETE']) and GetLastInputMethod(2) and (GetGameTimer() - GUI.Time) > 150 then
					GlobalState.SuppressBoom = true
					SendNUIMessage({
						action  = 'controlPressed',
						control = 'DELETE'
					})
					GUI.Time = GetGameTimer()
				end

				DisableControlAction(0, Keys['NENTER'], true)
				if IsDisabledControlPressed(0, Keys['NENTER']) and GetLastInputMethod(2) and (GetGameTimer() - GUI.Time) > 150 then
					SendNUIMessage({
						action  = 'controlPressed',
						control = 'NENTER'
					})
					GUI.Time = GetGameTimer()
				end

				DisableControlAction(0, Keys['BACKSPACE'], true)
				if IsDisabledControlPressed(0, Keys['BACKSPACE']) and GetLastInputMethod(2) and (GetGameTimer() - GUI.Time) > 150 then
					SendNUIMessage({
						action  = 'controlPressed',
						control = 'BACKSPACE'
					})
					GUI.Time = GetGameTimer()
				end

				DisableControlAction(0, Keys['TOP'], true)
				DisableControlAction(0, 17, true) -- WEAPONS

				local b = IsDisabledControlPressed(0, Keys['TOP'])
				if (b or IsDisabledControlPressed(0, 17)) and GetLastInputMethod(2) and (GetGameTimer() - GUI.Time) > (b and 150 or 30) then
					SendNUIMessage({
						action  = 'controlPressed',
						control = 'TOP'
					})
					GUI.Time = GetGameTimer()
				end

				DisableControlAction(0, Keys['DOWN'], true)
				DisableControlAction(0, 16, true) -- WEAPONS

				b = IsDisabledControlPressed(0, Keys['DOWN'])
				if (b or IsDisabledControlPressed(0, 16)) and GetLastInputMethod(2) and (GetGameTimer() - GUI.Time) > (b and 150 or 30) then
					SendNUIMessage({
						action  = 'controlPressed',
						control = 'DOWN'
					})
					GUI.Time = GetGameTimer()
				end

				DisableControlAction(0, Keys['LEFT'], true)
				if IsDisabledControlPressed(0, Keys['LEFT']) and GetLastInputMethod(2) and (GetGameTimer() - GUI.Time) > 150 then
					SendNUIMessage({
						action  = 'controlPressed',
						control = 'LEFT'
					})
					GUI.Time = GetGameTimer()
				end

				DisableControlAction(0, Keys['RIGHT'], true)
				if IsDisabledControlPressed(0, Keys['RIGHT']) and GetLastInputMethod(2) and (GetGameTimer() - GUI.Time) > 150 then
					SendNUIMessage({
						action  = 'controlPressed',
						control = 'RIGHT'
					})
					GUI.Time = GetGameTimer()
				end

				DisableControlAction(0, Keys['TAB'], true)
				if IsInventory then
					for i = 1, 9 do
						DisableControlAction(0, Keys[tostring(i)], true)
					end

					if IsDisabledControlPressed(0, Keys['TAB']) then
						if GetLastInputMethod(2) and (GetGameTimer() - GUI.Time) > 150 then
							for i = 1, 9 do
								local I = tostring(i)
								if IsDisabledControlJustPressed(0, Keys[I]) then
									SendNUIMessage({
										action  = 'shortcut',
										control = I
									})
									GUI.Time = GetGameTimer()
									break
								end
							end
						end
					end
				end
			end
		end
	end)
end)
