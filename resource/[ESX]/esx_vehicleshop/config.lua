Config                            = {}
Config.DrawDistance               = 10.0
Config.MarkerColor                = {r = 18, g = 105, b = 202}
Config.EnablePlayerManagement     = false -- enables the actual car dealer job. You'll need esx_addonaccount, esx_billing and esx_society
Config.EnableOwnedVehicles        = true
Config.EnableSocietyOwnedVehicles = false -- use with EnablePlayerManagement disabled, or else it wont have any effects
Config.ResellPercentage           = 50

Config.Locale                     = 'pl'

Config.LicenseEnable = false -- require people to own drivers license when buying vehicles? Only applies if EnablePlayerManagement is disabled. Requires esx_license

-- looks like this: 'LLL NNN'
-- The maximum plate length is 8 chars (including spaces & symbols), don't go past it!
Config.PlateLetters  = 4
Config.PlateNumbers  = 4
Config.PlateUseSpace = false

Config.TestDrive = { coords = vector3(148.67, -1505.18, 29.14), heading = 219.72 }

Config.Zones = {

	ShopEntering = {
		Pos   = { x = 104.53, y = -1500.52, z = 28.26},
		Size  = { x = 1.5, y = 1.5, z = 1.0 },
		Type  = 27
	},

	ShopInside = {
		Pos     = { x = 111.41, y = -1493.89, z = 29.97 },
		Size    = { x = 1.5, y = 1.5, z = 1.0 },
		Heading = 145.36,
		Type    = -1
	},

	ShopOutside = {
		Pos     = { x = 148.67, y = -1505.18, z = 29.14},
		Size    = { x = 1.5, y = 1.5, z = 1.0 },
		Heading = 219.72,
		Type    = -1
	},

	BossActions = {
		Pos   = { x = -32.065, y = -1114.277, z = 25.422 },
		Size  = { x = 1.5, y = 1.5, z = 1.0 },
		Type  = -1
	},

	GiveBackVehicle = {
		Pos   = { x = -18.227, y = -1078.558, z = 25.675 },
		Size  = { x = 3.0, y = 3.0, z = 1.0 },
		Type  = (Config.EnablePlayerManagement and 1 or -1)
	},

	ResellVehicle = {
		Pos   = { x = -44.630, y = -1080.738, z = 222225.683 },
		Size  = { x = 3.0, y = 3.0, z = 1.0 },
		Type  = 1
	}

}
