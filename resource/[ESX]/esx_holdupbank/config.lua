 Config = {}
Config.Locale = 'en'
Config.NumberOfCopsRequired = 2 -- 5
Config.NumberOfCopsRequiredZBrojownia = 2 -- 12
Config.NumberOfCopsRequiredHumman = 2  -- 8
Config.NumberOfCopsRequiredSkarbiec = 2  -- 6
Config.NumberOfCopsRequiredKawiarnia = 2 -- 4

Banks = {
	["fleeca"] = {
		position = { ['x'] = 147.04908752441, ['y'] = -1044.9448242188, ['z'] = 29.36802482605 },
		reward = math.random(725000, 950000),
		nameofbank = "Fleeca Bank (Plaza)",
		lastrobbed = 3600
	},
	["fleeca2"] = {
		position = { ['x'] = -2957.6674804688, ['y'] = 481.45776367188, ['z'] = 15.697026252747 },
		reward = math.random(725000, 950000),
		nameofbank = "Fleeca Bank (Great Ocean Highway)",
		lastrobbed = 3600
	},
	["fleeca3"] = {
		position = { ['x'] = -1212.02, ['y'] = -335.98, ['z'] = 37.10 },
		reward = math.random(725000, 950000),
		nameofbank = "Fleeca Bank (Rockford Hills)",
		lastrobbed = 3600
	},
	["fleeca4"] = {
		position = { ['x'] = 310.5, ['y'] = -283.13, ['z'] = 53.78 },
		reward = math.random(725000, 950000),
		nameofbank = "Fleeca Bank (East Vinewood)",
		lastrobbed = 3600
	},
	["fleeca6"] = {
		position = { ['x'] = -1310.1, ['y'] = -810.54, ['z'] = 16.20 },
		reward = math.random(725000, 950000),
		nameofbank = "MazeBank",
		lastrobbed = 3600
	},
	["fleeca7"] = {
		position = { ['x'] = 1176.3, ['y'] = 2711.61, ['z'] = 37.09 },
		reward = math.random(725000, 950000),
		nameofbank = "Fleeca Bank (Route 68)",
		lastrobbed = 3600
	},
	["jubiler"] = {
		position = { ['x'] = -631.419, ['y'] = -229.689, ['z'] = 38.05706024 },
		reward = math.random(600000, 800000),
		nameofbank = "Jubiler",
		lastrobbed = 2700
	},
	--[[["yacht"] = {
		position = { ['x'] = -2084.57, ['y'] = -1017.57, ['z'] = 12.78 },
		reward = math.random(2500000,3000000),
		nameofbank = "Yacht",
		lastrobbed = 10000
	},]]
	--[[["human"] = {
		position = { ['x'] = 3536.93, ['y'] = 3659.93, ['z'] = 27.4 },
		reward = math.random(1500000,2500000),
		nameofbank = "HumanLabs",
		lastrobbed = 7200
	},]]
	["blainecounty"] = {
		position = { ['x'] = -107.06505584717, ['y'] = 6474.8012695313, ['z'] = 31.62670135498 },
		reward = math.random(725000, 950000),
		nameofbank = "Blaine County Savings Bank",
		lastrobbed = 3600
	},
	["fleeca5"] = {
		position = { ['x'] = -353.94, ['y'] = -53.96, ['z'] = 48.10 },
		reward = math.random(725000, 950000),
		nameofbank = "Fleeca Bank (West Vinewood)",
		lastrobbed = 3600
	},
	--[[["PrincipalBank"] = {
		position = { ['x'] = 255.001098632813, ['y'] = 225.855895996094, ['z'] = 101.005694274902 },
		reward = math.random(800000,1400000),
		nameofbank = "Pacific Bank",
		lastrobbed = 6300
	},]]
	--[[["jacht"] = {
		position = { ['x'] = -2095.96, ['y'] = -1014.67, ['z'] = 7.98 },
		reward = math.random(350000,800000),
		nameofbank = "Jacht",
		lastrobbed = 0
	}]]--

}

Zbrojownia = {
	["Zbrojownia"] = {
		position = { ['x'] = -220.87, ['y'] = -2370.44, ['z'] = 25.33 },
		reward = math.random(2400000, 3500000),
		nameofbank = "Zbrojownia",
		lastrobbed = 6300
	},
}

Humman = {
	["Humman"] = {
		position = { ['x'] = 3536.93, ['y'] = 3659.93, ['z'] = 27.4 },
		reward = math.random(1700000, 2500000),
		nameofbank = "Humman Labs",
		lastrobbed = 6300
	},
}

Pacyfik = {
	["Pacyfik"] = {
		position = { ['x'] = 255.001098632813, ['y'] = 225.855895996094, ['z'] = 101.005694274902 },
		reward = math.random(1000000, 1500000),
		nameofbank = "Pacyfik Bank",
		lastrobbed = 6300
	},
}

Kawiarnia = {
	["Kawiarnia"] = {
		position = { ['x'] = -635.33, ['y'] = 235.28, ['z'] = 81.79 },
		reward = math.random(500000, 550000),
		nameofbank = "Kawiarnia",
		lastrobbed = 3600
	},
}
