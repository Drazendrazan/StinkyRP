Config                            = {}
Config.DrawDistance               = 15.0
Config.MarkerColor                = { r = 56, g = 197, b = 201 }
Config.MarkerSize                 = { x = 1.5, y = 1.5, z = 1.0 }
Config.Sprite  = 61
Config.Display = 4
Config.Scale   = 1.0
Config.Colour  = 0
Config.ReviveReward               = 5000 -- revive reward, set to 0 if you don't want it enabled
Config.AntiCombatLog              = true -- enable anti-combat logging?
Config.LoadIpl                    = false -- disable if you're using fivem-ipl or other IPL loaders
Config.Locale = 'en'
Config.RespawnToHospitalDelay		= 60000

bedNames = {
	'v_med_bed2',
}


Config.CenaNaprawki = 3500

local second = 1000
local minute = 60 * second

-- How much time before auto respawn at hospital
Config.RespawnDelayAfterRPDeath   = 5 * minute

Config.EnablePlayerManagement       = true
Config.EnableSocietyOwnedVehicles   = false

Config.RemoveWeaponsAfterRPDeath    = false
Config.RemoveCashAfterRPDeath       = false
Config.RemoveItemsAfterRPDeath      = true

-- Will display a timer that shows RespawnDelayAfterRPDeath as a countdown
Config.ShowDeathTimer               = true

-- Will allow respawn after half of RespawnDelayAfterRPDeath has elapsed.
Config.EarlyRespawn                 = false
-- The player will be fined for respawning early (on bank account)
Config.EarlyRespawnFine                  = false
Config.EarlyRespawnFineAmount            = 500

Config.RespawnPlaceLS = vector3(-816.182, -1215.1994, 7.93)
Config.RespawnPlaceSANDY = vector3(1836.2681, 3671.073, 34.3267)
Config.RespawnPlacePALETO = vector3(-247.4772, 6330.8159, 32.4761)
Config.RespawnPlacebs1 = vector3(-463.98, -1703.72, 18.85)
Config.RespawnPlacebs2 = vector3(2662.15, 3265.2, 55.25)
Config.RespawnPlacebs3 = vector3(180.49, 2793.34, 45.67)

Config.Blips = {
	{
		coords = vector3(1817.81 , 3671.48, 44.64)
	},
	{
		coords = vector3(304.90 , -586.41, 42.31)
	},
	{
		coords = vector3(-253.73 , 6322.73, 39.56)
	},
	{
		coords = vector3(-812.43 , -1232.77, 7.56)
	},
}

Config.OnlySamsBlip = {
	{
		Pos     = { x = -718.77, y = -1326.51, z = 1.5 },
		Sprite  = 427,
		Display = 4,
		Scale   = 0.6,
		Colour  = 3
	},
	{
		Pos     = { x = 2836.1272, y = -732.8671, z = 0.416 },
		Sprite  = 427,
		Display = 4,
		Scale   = 0.6,
		Colour  = 3
	},
	{
		Pos     = { x = -3420.7292, y = 955.541, z = 7.3967 },
		Sprite  = 427,
		Display = 4,
		Scale   = 0.6,
		Colour  = 3
	},
	{
		Pos     = { x = 3373.7449, y = 5183.4521, z = 0.5102 },
		Sprite  = 427,
		Display = 4,
		Scale   = 0.6,
		Colour  = 3
	},
	{
		Pos     = { x = 1736.29, y = 3976.24, z = 31.98 },
		Sprite  = 427,
		Display = 4,
		Scale   = 0.6,
		Colour  = 3
	},
	{
		Pos	= { x = -285.01, y = 6627.6, z = 7.2 },
		Sprite  = 427,
		Display = 4,
		Scale   = 0.6,
		Colour  = 3
	},
}
Config.VehicleGroups = {
	'PATROL', -- 1
	'TRANSPORT', -- 2
	'DODATKOWE', -- 3
}
 
-- https://wiki.rage.mp/index.php?title=Vehicles
Config.AuthorizedVehicles = {
	{
		grade = 0,
		model = 'pd_dirtbike',
		label = 'Cross',
		groups = {3},
		livery = 2,
		extrason = {},
		extrasoff = {},
	},
		{
			grade = 0,
			model = 'ms_coach',
			label = 'Autobus',
			groups = {2},
			livery = 0,
			extrason = {1,3,4,5,6,7},
			extrasoff = {2},
			tint = 1,
		},
		{
			grade = 4,
			model = 'ms_explorer',
			label = 'Ford Explorer',
			groups = {1},
			livery = 0,
			extrason = {1,3,4,5,6,7},
			extrasoff = {2},
			tint = 1,
		},
		{
			grade = 2,
			model = 'ms_jeep',
			label = 'Jeep Cherokee',
			groups = {1},
			livery = 0,
			extrason = {1,3,4,5,6,7},
			extrasoff = {2},
			tint = 1,
		},
		{
			grade = 2,
			model = 'ms_impala',
			label = 'Chevrolet Imapala',
			groups = {1},
			livery = 0,
			extrason = {1,3,4,5,6,7},
			extrasoff = {2},
			tint = 1,
		},
		{
			grade = 6,
			model = 'ms_charger',
			label = 'Dodge Charger 2018',
			groups = {1},
			livery = 0,
			extrason = {1,3,4,5,6,7},
			extrasoff = {2},
			tint = 1,
		},
		{
			grade = 10,
			model = 'ms_m5',
			label = 'BMW M5',
			groups = {1},
			livery = 0,
			extrason = {1,3,4,5,6,7},
			extrasoff = {2},
			tint = 1,
		},
		{
			grade = 4,
			model = 'ms_raptor',
			label = 'Ford Raptor',
			groups = {1},
			livery = 0,
			extrason = {1,2,3},
			extrasoff = {4,5},
		},
		{
			grade = 4,
			model = 'ms_tahoe21',
			label = 'Chevrolet Tahoe 21',
			groups = {1},
			livery = 0,
			extrason = {1,2,3},
			extrasoff = {4,5},
		},
		{
			grade = 5,
			model = 'ms_tundra',
			label = 'Toyota Tundra',
			groups = {1},
			livery = 0,
			extrason = {1,2,3},
			extrasoff = {4,5},
		},
		{
			grade = 3,
			model = 'ms_ram19',
			label = 'Dodge Ram',
			groups = {1},
			livery = 0,
			extrason = {1,2,3},
			extrasoff = {4,5},
		},
		{
			grade = 1,
			model = 'ms_tahoe',
			label = 'Chevrolet Tahoe 19',
			groups = {1},
			livery = 0,
			extrason = {1,2,3},
			extrasoff = {4,5},
		},
		{
			grade = 0,
			model = 'ms_transformer',
			label = 'Ford F350',
			groups = {1},
			livery = 0,
			extrason = {1,2},
			extrasoff = {},
		},
		{
			grade = 1,
			model = 'ms_outlander',
			label = 'Quad',
			groups = {3},
			livery = 0,
			extrason = {1},
			extrasoff = {},
		},
		{
			grade = 0,
			model = 'ms_bike',
			label = 'Rower Medyczny',
			groups = {3},
			livery = 0,
			extrason = {1,2},
			extrasoff = {},
		},		
		{
			grade = 4,
			model = 'ms_Bronco',
			label = 'Ford Bronco',
			groups = {2},
			livery = 1,
			extrason = {1,3,4,5,6},
			extrasoff = {},
		},
		{
			grade = 4,
			model = 'ms_charger18',
			label = 'Dodge Charger 2018',
			groups = {2},
			livery = 2,
			extrason = {1,2,3,4,5,6,7},
			extrasoff = {},
		},
		{
			grade = 4,
			model = 'ms_colorado',
			label = 'Chevrolet Colorado',
			groups = {2},
			livery = 2,
			extrason = {1,2,3,4,5,6},
			extrasoff = {},
		},
		{
			grade = 1,
			model = 'ms_everest14',
			label = 'Ford Everest',
			groups = {1},
			livery = 1,
			extrason = {1,2,3,4,5,6},
			extrasoff = {},
		},
		{
			grade = 1,
			model = 'ms_f150',
			label = 'Ford F150',
			groups = {2},
			livery = 0,
			extrason = {1,2,3,4,5,6,7,8,9,10,12},
			extrasoff = {11},
		},
		{
			grade = 0,
			model = 'ms_fj',
			label = 'Toyota FJ',
			groups = {2},
			livery = 0,
			extrason = {1,2,3,4,5,6,7,10,11},
			extrasoff = {},
		},
		{
			grade = 5,
			model = 'ms_focus',
			label = 'Ford Focus',
			groups = {2},
			livery = 0,
			extrason = {1,2,3},
			extrasoff = {},
		},
		{
			grade = 4,
			model = 'ms_lexus',
			label = 'Lexus',
			groups = {2},
			livery = 1,
			extrason = {1,2},
			extrasoff = {},
		},
		{
			grade = 10,
			model = 'ms_mustang',
			label = 'Ford Mustang',
			groups = {2},
			livery = 0,
			extrason = {1,2,3,4,6,8,9},
			extrasoff = {5,7},
		},
		{
			grade = 0,
			model = 'ms_paka',
			label = 'Karetka',
			groups = {2},
			livery = 2,
			extrason = {5,8,10},
			extrasoff = {},
		},
		{
			grade = 1,
			model = 'ms_silv2020w',
			label = 'Chevrolet Silverado 2020',
			groups = {2},
			livery = 0,
			extrason = {1,2,3,4,5,6,7,8,9},
			extrasoff = {},
		},
		{
			grade = 1,
			model = 'ms_silvleo',
			label = 'Chevrolet Silverado',
			groups = {2},
			livery = 0,
			extrason = {1,2,4},
			extrasoff = {3},
		},
		{
			grade = 10,
			model = 'ms_tesla',
			label = 'Tesla',
			groups = {2},
			livery = 0,
			extrason = {1,2},
			extrasoff = {},
		},
		{
			grade = 2,
			model = 'ms_titan',
			label = 'Nissan Titan',
			groups = {2},
			livery = 1,
			extrason = {1,2,9},
			extrasoff = {},
		},
		{
			grade = 9,
			model = 'ms_wrxp',
			label = 'Subaru WRXP',
			groups = {1},
			livery = 0,
			extrason = {2,3},
			extrasoff = {1,4,5,6,7},
		},
		{
			grade = 10,
			model = 'ms_rs7',
			label = 'Audi RS7',
			groups = {1},
			livery = 0,
			extrason = {},
			extrasoff = {1,2,3,10,11},
		},
	}
Config.AuthorizedHeli = {
	{
	   model = 'ms_heli',
	   label = 'Helikopter'
	},
}
Config.AuthorizedBoats = {
	{
		model = 'dinghy',
		label = 'Łódź'
	},	
}

Config.Ambulance = {
	Cloakrooms = {
		{
			coords = vector3(375.53, -1434.63, 31.61),
		},
		{
			coords = vector3(1839.1, 3689.31, 33.31),
		},
		{
			coords = vector3(1133.86, -1548.72, 34.45),
		},
		{
			coords = vector3(-434.43, -320.67, 33.96),
		},
		{
			coords = vector3(-252.58, 6309.52, 31.53),
		},
		{
			coords = vector3(-826.24, -1237.0, 6.35),
		},
		{
			coords = vector3(298.80, -598.29, 42.33),
		},
	},
	Vehicles = {
		{
			coords = vector3(309.45, -1437.66, 28.9),
			spawnPoint = vector3(309.4, -1439.63, 28.9),
			heading = 228.34
		},
		{
			coords = vector3(1171.72, -1527.78, 34.1),
			spawnPoint = vector3(1177.06, -1545.05, 33.74),
			heading = 358.8
		},
		{
			coords = vector3(-483.53, -352.71, 23.28),
			spawnPoint = vector3(-475.83, -349.85, 23.28),
			heading = 206.33
		},
		{
			coords = vector3(1825.14, 3690.48, 33.32),
			spawnPoint = vector3(1826.99, 3693.65, 33.81),
			heading = 299.56
		},
		{
			coords = vector3(-245.32, 6333.09, 31.5),
			spawnPoint = vector3(-242.14, 6337.03, 31.64), -- PALETO
			heading = 225.37
		},
		{
			coords = vector3(-846.13, -1229.19, 5.96),
			spawnPoint = vector3(-844.06, -1231.93, 5.98),
			heading = 318.81
		},
		{
			coords = vector3(338.45, -586.45, 27.84),
			spawnPoint = vector3(329.56, -589.67, 27.84),
			heading = 340.7
		},
		{
			coords = vector3(293.7124, -597.9155, 42.3245),
			spawnPoint = vector3(292.6684, -607.4559, 41.4887),
			heading = 70.9
		},
	},
	Boats = {
		{
			coords = vector3(-718.77, -1326.51, 0.7),
			spawnPoint = vector3(-724.68, -1328.62, 0.12), -- LODKA1
			heading = 229.75
		},
		{
			coords = vector3(1736.29, 3976.24, 31.08),
			spawnPoint = vector3(1736.63, 3986.54, 30.33), -- LODKA2
			heading = 17.2
		},
		{
			coords = vector3(-285.01, 6627.6, 6.24),
			spawnPoint = vector3(-287.84, 6624.39, -0.2), -- LODKA3
			heading = 47.37
			
		},
		{
			coords = vector3(-3420.4172, 955.6319, 7.3967),
			spawnPoint = vector3(-3434.8318, 945.8564, 0.5458), -- LODKA4
			heading = 88.32
			
		},
		{
			coords = vector3(2836.5044, -732.4112, 0.3822),
			spawnPoint = vector3(2853.5557, -728.2502, 0.3811), -- LODKA5
			heading = 261.94
			
		},
		{
			coords = vector3(3373.8213, 5183.4863, 0.5161),
			spawnPoint = vector3(3384.6956, 5181.6299, 0.5161), -- LODKA6
			heading = 271.24
			
		},
	},
	Helicopters = {
		{
			coords = vector3(314.25, -1453.21, 45.61),
			spawnPoint = vector3(313.37, -1464.98, 46.51),
			heading = 143.87
		},
		{
			coords = vector3(-704.30, 319.73, 139.25),
			spawnPoint = vector3(-703.2, 323.97, 140.15),
			heading = 172.5
		},
		{
			coords = vector3(-256.98, 6314.35, 38.76),
			spawnPoint = vector3(-252.3, 6319.14, 38.76),
			heading = 317.67
		},
		{
			coords = vector3(1201.61, -1535.58, 38.44),
			spawnPoint = vector3(1206.35, -1536.11, 38.45),
			heading = 0.0
		},
		{
			coords = vector3(1832.7971, 3691.7437, 37.4334),
			spawnPoint = vector3(1833.4216, 3680.6487, 39.1894),
			heading = 33.05
		},
		{
			coords = vector3(-783.27, -1200.8, 50.16),
			spawnPoint = vector3(-790.97, -1191.68, 53.02), -- VICEROY
			heading = 53.55
		},
		{
			coords = vector3(341.52, -581.72, 73.21),
			spawnPoint = vector3(352.23, -588.06, 73.21), -- PILLBOX
			heading = 68.83
		},
	},
	VehicleDeleters = {
		{
			coords = vector3(292.06, -585.27, 42.24), -- PILLBOX GORA
		},
		{
			coords = vector3(364.41, -591.48, 27.71), -- PILBOX DOL
		},
		{
			coords = vector3(1827.14, 3693.51, 33.32), -- SANDY
		},
		{
			coords = vector3(-242.14, 6337.03, 31.44), -- PALETO
		},
		{
			coords = vector3(329.56, -589.67, 27.84), -- PILLBOX DOL
		},
		{
			coords = vector3(-828.81, -1217.55, 5.99), -- VICEROY
		},
		{
			coords = vector3(-724.68, -1328.62, 0.12), -- LODKA1
		},
		{
			coords = vector3(1736.63, 3986.54, 30.33), -- LODKA2
		},
		{
			coords = vector3(-287.84, 6624.39, -0.2), -- LODKA3
		},
		{
			coords = vector3(-3434.8318, 945.8564, 0.5458), -- LODKA4
		},
		{
			coords = vector3(2853.5557, -728.2502, 0.3811), -- LODKA5
		},
		{
			coords = vector3(3384.6956, 5181.6299, 0.5161), -- LODKA6
		},
	},
	Inventories = {
		{
			coords = vector3(311.45, -563.46, 42.35), -- PILLBOX
		},
		{
			coords = vector3(1822.25, 3675.82, 33.29), -- SANDY
		},
		{
			coords = vector3(-263.71, 6325.16, 31.45), -- PALETO
		},
		{
			coords = vector3(-802.75, -1208.94, 6.35), -- VICEROY
		},
	},
	Pharmacies = {
		{
			coords = vector3(1826.73, 3677.18, 33.31), -- SANDY
		},
		{
			coords = vector3(-255.51, 6316.91, 31.44), -- PALETO
		},
		{
			coords = vector3(309.59, -568.38, 42.33), -- PILLBOX
		},
		{
			coords = vector3(-805.79, -1212.61, 6.35), -- VICEROY
		},
	},
	BossActions = {
		{
			coords = vector3(310.1, -595.01, 42.33), -- PILLBOX
		},
		{
			coords = vector3(1835.41, 3683.71, 33.29), -- SANDY
		},
		{
			coords = vector3(-258.45, 6330.29, 31.44), -- PALETO
		},
		{
			coords = vector3(-814.23, -1237.01, 6.35), -- VICEROY
		},
	}
	--[[SkinMenu = {
		{
			coords = vector3(-257.3, 6325.08, 31.47), -- PALETO
			coords = vector3(1839.01, 3689.21, 33.31), -- SANDY
			coords = vector3(301.62, -599.12, 42.33), -- PILLBOX
		},
	}--]]
}

Config.Uniforms = {
	pielegniarz_wear = {
		male = {
			['tshirt_1'] = 208,  ['tshirt_2'] = 1,
			['torso_1'] = 418,   ['torso_2'] = 4,
			['decals_1'] = 0,   ['decals_2'] = 0,
			['arms'] = 94,
			['pants_1'] = 152,   ['pants_2'] = 10,
			['shoes_1'] = 106,   ['shoes_2'] = 0,
			['helmet_1'] = 171,  ['helmet_2'] = 2,
			['chain_1'] = 30,    ['chain_2'] = 0,
			['ears_1'] = -1,     ['ears_2'] = 0,
			['bproof_1'] = 0,  ['bproof_2'] = 0,
			['mask_1'] = 0,   ['mask_2'] = 0,
			['bags_1'] = 147,  ['bags_2'] = 1
		},
		female = {
			['tshirt_1'] = 14,  ['tshirt_2'] = 0,
			['torso_1'] = 434,   ['torso_2'] = 0,
			['decals_1'] = 0,   ['decals_2'] = 0,
			['arms'] = 109,
			['pants_1'] = 168,   ['pants_2'] = 1,
			['shoes_1'] = 11,   ['shoes_2'] = 0,
			['helmet_1'] = -1,  ['helmet_2'] = 0,
			['chain_1'] = 96,    ['chain_2'] = 0,
			['ears_1'] = -1,     ['ears_2'] = 0,
			['bproof_1'] = 0,  ['bproof_2'] = 0,
			['bags_1'] = 150,  ['bags_2'] = 1
		}
	},
	ratownik_wear = {
		male = {
			['tshirt_1'] = 208,  ['tshirt_2'] = 0,
			['torso_1'] = 418,   ['torso_2'] = 5,
			['decals_1'] = 0,   ['decals_2'] = 0,
			['arms'] = 94,
			['pants_1'] = 152,   ['pants_2'] = 10,
			['shoes_1'] = 106,   ['shoes_2'] = 1,
			['helmet_1'] = 171,  ['helmet_2'] = 2,
			['chain_1'] = 30,    ['chain_2'] = 0,
			['ears_1'] = -1,     ['ears_2'] = 0,
			['bproof_1'] = 0,  ['bproof_2'] = 0,
			['mask_1'] = 0,   ['mask_2'] = 0,
			['bags_1'] = 147,  ['bags_2'] = 1
		},
		female = {
			['tshirt_1'] = 14,  ['tshirt_2'] = 0,
			['torso_1'] = 435,   ['torso_2'] = 0,
			['decals_1'] = 0,   ['decals_2'] = 0,
			['arms'] = 106,
			['pants_1'] = 168,   ['pants_2'] = 1,
			['shoes_1'] = 11,   ['shoes_2'] = 0,
			['helmet_1'] = -1,  ['helmet_2'] = 0,
			['chain_1'] = 96,    ['chain_2'] = 0,
			['ears_1'] = -1,     ['ears_2'] = 0,
			['bproof_1'] = 0,  ['bproof_2'] = 0,
			['mask_1'] = 0,   ['mask_2'] = 0,
			['bags_1'] = 150,  ['bags_2'] = 1
		}
	},
	stratownik_wear = {
		male = {
			['tshirt_1'] = 15,  ['tshirt_2'] = 0,
			['torso_1'] = 416,   ['torso_2'] = 1,
			['decals_1'] = 0,   ['decals_2'] = 0,
			['arms'] = 91,
			['pants_1'] = 26,   ['pants_2'] = 3,
			['shoes_1'] = 105,   ['shoes_2'] = 12,
			['helmet_1'] = 171,  ['helmet_2'] = 2,
			['chain_1'] = 30,    ['chain_2'] = 0,
			['ears_1'] = -1,     ['ears_2'] = 0,
			['bproof_1'] = 0,  ['bproof_2'] = 0,
			['bags_1'] = 147,  ['bags_2'] = 1
		},
		female = {
			['tshirt_1'] = 14,  ['tshirt_2'] = 0,
			['torso_1'] = 436,   ['torso_2'] = 0,
			['decals_1'] = 0,   ['decals_2'] = 0,
			['arms'] = 101,
			['pants_1'] = 168,   ['pants_2'] = 1,
			['shoes_1'] = 11,   ['shoes_2'] = 0,
			['helmet_1'] = -1,  ['helmet_2'] = 0,
			['chain_1'] = 96,    ['chain_2'] = 0,
			['ears_1'] = -1,     ['ears_2'] = 0,
			['bproof_1'] = 0,  ['bproof_2'] = 0,
			['bags_1'] = 150,  ['bags_2'] = 1
		}
	},
	lekarz_wear = {
		male = {
			['tshirt_1'] = 15,  ['tshirt_2'] = 0,
			['torso_1'] = 410,   ['torso_2'] = 1,
			['decals_1'] = 0,   ['decals_2'] = 0,
			['arms'] = 92,
			['pants_1'] = 28,   ['pants_2'] = 0,
			['shoes_1'] = 105,   ['shoes_2'] = 12,
			['helmet_1'] = -1,  ['helmet_2'] = 0,
			['chain_1'] = 30,    ['chain_2'] = 0,
			['ears_1'] = -1,     ['ears_2'] = 0,
			['bproof_1'] = 0,  ['bproof_2'] = 0,
			['bags_1'] = 106,  ['bags_2'] = 3
		},
		female = {
			['tshirt_1'] = 14,  ['tshirt_2'] = 0,
			['torso_1'] = 432,   ['torso_2'] = 1,
			['decals_1'] = 0,   ['decals_2'] = 0,
			['arms'] = 101,
			['pants_1'] = 168,   ['pants_2'] = 1,
			['shoes_1'] = 11,   ['shoes_2'] = 0,
			['helmet_1'] = -1,  ['helmet_2'] = 0,
			['chain_1'] = 96,    ['chain_2'] = 0,
			['ears_1'] = -1,     ['ears_2'] = 0,
			['bproof_1'] = 0,  ['bproof_2'] = 0,
			['bags_1'] = 0,  ['bags_2'] = 0
		}
	},
	lekarzsoru_wear = {
		male = {
			['tshirt_1'] = 15,  ['tshirt_2'] = 0,
			['torso_1'] = 410,   ['torso_2'] = 3,
			['decals_1'] = 0,   ['decals_2'] = 0,
			['arms'] = 92,
			['pants_1'] = 28,   ['pants_2'] = 0,
			['shoes_1'] = 105,   ['shoes_2'] = 12,
			['helmet_1'] = -1,  ['helmet_2'] = 0,
			['chain_1'] = 30,    ['chain_2'] = 0,
			['ears_1'] = -1,     ['ears_2'] = 0,
			['bproof_1'] = 0,  ['bproof_2'] = 0,
			['bags_1'] = 106,  ['bags_2'] = 4
		},
		female = {
			['tshirt_1'] = 14,  ['tshirt_2'] = 0,
			['torso_1'] = 432,   ['torso_2'] = 3,
			['decals_1'] = 0,   ['decals_2'] = 0,
			['arms'] = 101,
			['pants_1'] = 168,   ['pants_2'] = 1,
			['shoes_1'] = 11,   ['shoes_2'] = 0,
			['helmet_1'] = -1,  ['helmet_2'] = 0,
			['chain_1'] = 96,    ['chain_2'] = 0,
			['ears_1'] = -1,     ['ears_2'] = 0,
			['bproof_1'] = 0,  ['bproof_2'] = 0,
			['bags_1'] = 0,  ['bags_2'] = 0
		}
	},
	lekarzspecjalista_wear = {
		male = {
			['tshirt_1'] = 15,  ['tshirt_2'] = 0,
			['torso_1'] = 411,   ['torso_2'] = 9,
			['decals_1'] = 0,   ['decals_2'] = 0,
			['arms'] = 88,
			['pants_1'] = 28,   ['pants_2'] = 1,
			['shoes_1'] = 105,   ['shoes_2'] = 12,
			['helmet_1'] = -1,  ['helmet_2'] = 0,
			['chain_1'] = 30,    ['chain_2'] = 0,
			['ears_1'] = -1,     ['ears_2'] = 0,
			['bproof_1'] = 0,  ['bproof_2'] = 0,
			['bags_1'] = 106,  ['bags_2'] = 5
		},
		female = {
			['tshirt_1'] = 14,  ['tshirt_2'] = 0,
			['torso_1'] = 432,   ['torso_2'] = 9,
			['decals_1'] = 0,   ['decals_2'] = 0,
			['arms'] = 101,
			['pants_1'] = 168,   ['pants_2'] = 1,
			['shoes_1'] = 11,   ['shoes_2'] = 0,
			['helmet_1'] = -1,  ['helmet_2'] = 0,
			['chain_1'] = 96,    ['chain_2'] = 0,
			['ears_1'] = -1,     ['ears_2'] = 0,
			['bproof_1'] = 0,  ['bproof_2'] = 0,
			['bags_1'] = 0,  ['bags_2'] = 0
		}
	},
	doktor_wear = {
		male = {
			['tshirt_1'] = 15,  ['tshirt_2'] = 0,
			['torso_1'] = 414,   ['torso_2'] = 1,
			['decals_1'] = 0,   ['decals_2'] = 0,
			['arms'] = 88,
			['pants_1'] = 28,   ['pants_2'] = 0,
			['shoes_1'] = 105,   ['shoes_2'] = 12,
			['helmet_1'] = -1,  ['helmet_2'] = 0,
			['chain_1'] = 30,    ['chain_2'] = 0,
			['ears_1'] = -1,     ['ears_2'] = 0,
			['bproof_1'] = 0,  ['bproof_2'] = 0,
			['bags_1'] = 106,  ['bags_2'] = 6
		},
		female = {
			['tshirt_1'] = 14,  ['tshirt_2'] = 0,
			['torso_1'] = 433,   ['torso_2'] = 1,
			['decals_1'] = 0,   ['decals_2'] = 0,
			['arms'] = 101,
			['pants_1'] = 168,   ['pants_2'] = 1,
			['shoes_1'] = 11,   ['shoes_2'] = 0,
			['helmet_1'] = -1,  ['helmet_2'] = 0,
			['chain_1'] = 96,    ['chain_2'] = 0,
			['ears_1'] = -1,     ['ears_2'] = 0,
			['bproof_1'] = 0,  ['bproof_2'] = 0,
			['bags_1'] = 0,  ['bags_2'] = 0
		}
	},
	chirurg_wear = {
		male = {
			['tshirt_1'] = 15,  ['tshirt_2'] = 0,
			['torso_1'] = 414,   ['torso_2'] = 3,
			['decals_1'] = 0,   ['decals_2'] = 0,
			['arms'] = 88,
			['pants_1'] = 28,   ['pants_2'] = 0,
			['shoes_1'] = 105,   ['shoes_2'] = 12,
			['helmet_1'] = -1,  ['helmet_2'] = 0,
			['chain_1'] = 30,    ['chain_2'] = 0,
			['ears_1'] = -1,     ['ears_2'] = 0,
			['bproof_1'] = 0,  ['bproof_2'] = 0,
			['bags_1'] = 106,  ['bags_2'] = 7
		},
		female = {
			['tshirt_1'] = 14,  ['tshirt_2'] = 0,
			['torso_1'] = 433,   ['torso_2'] = 3,
			['decals_1'] = 0,  ['decals_2'] = 0,
			['arms'] = 101,
			['pants_1'] = 168,   ['pants_2'] = 1,
			['shoes_1'] = 11,   ['shoes_2'] = 0,
			['helmet_1'] = -1,  ['helmet_2'] = 0,
			['chain_1'] = 96,    ['chain_2'] = 0,
			['ears_1'] = -1,     ['ears_2'] = 0,
			['bproof_1'] = 0,  ['bproof_2'] = 0,
			['bags_1'] = 105,  ['bags_2'] = 7
		}
	},
	neurochirurg_wear = {
		male = {
			['tshirt_1'] = 15,  ['tshirt_2'] = 0,
			['torso_1'] = 414,   ['torso_2'] = 4,
			['decals_1'] = 0,   ['decals_2'] = 0,
			['arms'] = 88,
			['pants_1'] = 28,   ['pants_2'] = 0,
			['shoes_1'] = 11,   ['shoes_2'] = 12,
			['helmet_1'] = -1,  ['helmet_2'] = 0,
			['chain_1'] = 30,    ['chain_2'] = 0,
			['ears_1'] = -1,     ['ears_2'] = 0,
			['bproof_1'] = 0,  ['bproof_2'] = 0,
			['bags_1'] = 106,  ['bags_2'] = 8
		},
		female = {
			['tshirt_1'] = 14,  ['tshirt_2'] = 0,
			['torso_1'] = 433,   ['torso_2'] = 4,
			['decals_1'] = 0,   ['decals_2'] = 0,
			['arms'] = 101,
			['pants_1'] = 168,   ['pants_2'] = 1,
			['shoes_1'] = 11,   ['shoes_2'] = 0,
			['helmet_1'] = -1,  ['helmet_2'] = 0,
			['chain_1'] = 96,    ['chain_2'] = 0,
			['ears_1'] = -1,     ['ears_2'] = 0,
			['bproof_1'] = 0,  ['bproof_2'] = 0,
			['bags_1'] = 105,  ['bags_2'] = 8
		}
	},
	nurek_wear = { 
		male = {
			['tshirt_1'] = 123,  ['tshirt_2'] = 0,
			['torso_1'] = 243,   ['torso_2'] = 0,
			['decals_1'] = 0,   ['decals_2'] = 0,
			['arms'] = 17,
			['pants_1'] = 94,   ['pants_2'] = 0,
			['shoes_1'] = 67,   ['shoes_2'] = 0,
			['helmet_1'] = -1,  ['helmet_2'] = 0,
			['chain_1'] = 0,    ['chain_2'] = 0
 
		},
		female = {
			['tshirt_1'] = 153,  ['tshirt_2'] = 0,
			['torso_1'] = 251,   ['torso_2'] = 0,
			['decals_1'] = 0,   ['decals_2'] = 0,
			['arms'] = 18,
			['pants_1'] = 97,   ['pants_2'] = 0,
			['shoes_1'] = 70,   ['shoes_2'] = 0,
			['helmet_1'] = -1,  ['helmet_2'] = 0,
			['chain_1'] = 1,    ['chain_2'] = 0,
			['ears_1'] = 2,     ['ears_2'] = 0,
			['bproof_1'] = 0,  ['bproof_2'] = 0,
			['bags_1'] = 0,  ['bags_2'] = 0
 
		}
	},
}
