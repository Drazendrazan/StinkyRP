Config                   = {}
Config.MarkerLegs        = { type = 21, x = 0.5, y = 0.5, z = 0.5, r = 56, g = 197, b = 201, a = 175, rotate = false }
Config.MarkerCar         = { type = 27, x = 3.0, y = 3.0, z = 1.0, r = 56, g = 197, b = 201, a = 175, rotate = true }
Config.MarkerLift         = { type = 21, x = 0.5, y = 0.5, z = 0.5, r = 56, g = 197, b = 201, a = 175, rotate = false }
Config.DrawDistance		 = 10.0
Config.Display			 = 2

Config.TeleportsLegs = {
	{
		From = vector3(332.2655, -595.6385, 43.3341),
		To = vector3(344.3848, -586.332, 28.3469), -- PILLBOX
		Heading = 257.59,
		Visible = {'ambulance'}
	},
	{
		From = vector3(344.3848, -586.332, 28.3469),
		To = vector3(332.2655, -595.6385, 43.3341), -- PILLBOX
		Heading = 257.59,
		Visible = {'ambulance'}
	},
	{
		From = vector3(330.2648, -601.162, 43.3341),
		To = vector3(339.1555, -583.9985, 74.1341), -- PILLBOX
		Heading = 257.59,
		Visible = {'ambulance'}
	},
	{
		From = vector3(339.1555, -583.9985, 74.1341),
		To = vector3(330.2648, -601.162, 43.3341), -- PILLBOX
		Heading = 257.59,
		Visible = {'ambulance'}
	},
	{
		From = vector3(-794.31, -1245.65, 7.4341),
		To = vector3(-773.9248, -1207.42, 50.95), -- VICEROY
		Heading = 257.59,
		Visible = {'ambulance'}
	},
	{
		From = vector3(-773.9248, -1207.42, 50.95),
		To = vector3(-794.31, -1245.65, 7.4341), -- VICEROY
		Heading = 257.59,
		Visible = {'ambulance'}
	},
	{
		From = vector3(893.4086, -3241.2578, -99.2209+0.35),
		To = vector3(446.1831, -2197.0886, 5.1514+0.35),
		Heading = 290.2,
		Visible = {'org2'}
	},
	{
		From = vector3(446.1831, -2197.0886, 5.1550+0.35),
		To = vector3(893.4086, -3241.2578, -99.2209+0.35),
		Heading = 290.2,
		Visible = {'org2'}
	},
	{
		From = vector3(-762.1038, -2587.0129, 12.9339+0.35),
		To = vector3(-764.2, -2571.1243, -36.02+0.35),
		Heading = 290.2,
		Visible = {'org28'}
	},
	{
		From = vector3(-764.2, -2571.1243, -36.02+0.35),
		To = vector3(-762.1038, -2587.0129, 12.9339+0.35),
		Heading = 290.2,
		Visible = {'org28'}
	},
	{
		From = vector3(-68.0209, -801.3398, 43.2773+0.5),
		To = vector3(-79.7134, -832.9268, 242.4357),
		Heading = 120.95
	},
	{
		From = vector3(-79.7134, -832.9268, 242.4357+0.5),
		To = vector3(-68.0209, -801.3398, 43.2773),
		Heading = 120.95
	},
	{
		From = vector3(-81.8073, -818.434, 35.0781+0.5),
		To = vector3(-73.1722, -824.1892, 242.436),
		Heading = 120.95
	},
	{
		From = vector3(-73.1722, -824.1892, 242.436+0.5),
		To = vector3(-81.8073,  -818.434, 35.0781+0.5),
		Heading = 120.95
	},
	{
		From = vector3(722.0875, -2988.7407, -39.9499+0.5),
		To = vector3(-1545.4941, -529.7588, 35.1982+0.5),
		Heading = 120.95,
		Visible = {'org28'}
	},
	{
		From = vector3(417.2384, -10.8371, 99.6955),
		To = vector3(380.5508, -15.5242, 82.0477),
		Heading = 43.30,
		Visible = {'org1'}
	},
	{
		From = vector3(380.5508, -15.5242, 83.0477),
		To = vector3(417.2384, -10.8371, 99.6955),
		Heading = 43.30,
		Visible = {'org1'}
	},
	{
		From = vector3(-1545.4941, -529.7588, 35.1982+0.5),
		To = vector3(722.0875, -2988.7407, -39.9499+0.5),
		Heading = 120.95,
		Visible = {'org28'}
	},

	{
		From = vector3(1713.14, -1555.68, 113.94),
		To = vector3(997.34, -3200.62, -37.49),
		Heading = 270.03,
		Visible = {'org11'},
		License = 'opium_transform'
	},

	{
		From = vector3(997.34, -3200.62, -36.39),
		To = vector3(1713.14, -1555.68, 113.04),
		Heading = 249.94
	},

	{
		From = vector3(-1147.43, -1562.38, 4.39),
		To = vector3(1088.76, -3188.01, -39.89),
		Heading = 180.7,
		Visible = {'org11'},
		License = 'exctasy_transform'
	},

	{
		From = vector3(1088.76, -3188.01, -38.999),
		To = vector3(-1147.43, -1562.38, 3.49),
		Heading = 130.22
	},

	{
		From = vector3(138.2429, -137.2072, 54.9111),
		To = vector3(137.5044, -134.3136, 59.568),
		Heading = 160.28
	},
	{
		From = vector3(137.5044, -134.3136, 60.568),
		To = vector3(138.2429, -137.2072, 53.9111),
		Heading = 160.28
	},

    --[[ BAHAMA
    
    {
		From = vector3(-1388.39, -586.99, 30.22),
		To = vector3(-1387.54, -588.07, 30.32),
		Heading = 138.17
	},
	{
		From = vector3(-1387.54, -588.07, 30.32),
		To = vector3(-1388.39, -586.99, 30.22),
		Heading = 51.64
	},--]]
	
	-- Kasyno

	{
        From = vector3(967.3875, 7.5064, 81.2),
        To = vector3(965.176, 58.5666, 112.603),
        Heading = 43.30,
    },
	{
        From = vector3(965.176, 58.5666, 112.603),
        To = vector3(967.3875, 7.5064, 81.2),
        Heading = 43.30,
    },
	
}

Config.TeleportsCars = {
	{
		From = vector3(444.0103, -2195.8772, 5.1514),
		To = vector3(890.9127, -3245.2954, -99.2188),
		Heading = 87.29,
		Visible = {'org2'}
	},
	{
		From = vector3(890.9127, -3245.2954, -99.2188),
		To = vector3(439.3495, -2193.6787, 4.9677),
		Heading = 60.57,
		Visible = {'org2'}
	},
	{
		From = vector3(2553.9102, 4671.2915, 32.9814),
		To = vector3(720.5019, -2991.70, -39.94),
		Heading = 283.02,
		Visible = {'org3'}
	},
	{
		From = vector3(721.2424, -2991.6616, -39.9499),
		To = vector3(2553.9102, 4671.2915, 32.9814),
		Heading = 7.0,
		Visible = {'org3'}
	},
	{
		From = vector3(721.2424, -2991.6616, -39.9499),
		To = vector3(2553.9102, 4671.2915, 32.9814),
		Heading = 7.0,
		Visible = {'org3'}
	},
	{
		From = vector3(-758.7724, -2584.0516, 12.9339),
		To = vector3(-764.6202, -2575.2215, -35.0714),
		Heading = 7.0,
		Visible = {'org28'}
	},
	{
		From = vector3(-764.6202, -2575.2215, -35.0714),
		To = vector3(-758.7724, -2584.0516, 12.9339),
		Heading = 7.0,
		Visible = {'org28'}
	},
	{
		From = vector3(-1536.6924, -579.0541, 24.7578),
		To = vector3(722.5994, -2991.946, -39.9499),
		Heading = 271.05,
		Visible = {'org28'}
	},
	{
		From = vector3(722.5994, -2991.946, -39.9499),
		To = vector3(-1536.6924, -579.0541, 24.7578),
		Heading = 36.18,
		Visible = {'org28'}
	},
	{
		From = vector3(490.6221, 3010.8601, 40.5015),
		To = vector3(483.2526, 2987.6006, -152.0551),
		Heading = 145.13,
		Visible = {'org37'}
	},
	{
		From = vector3(483.2526, 2987.6006, -152.0551),
		To = vector3(490.6221, 3010.8601, 40.5015),
		Heading = 199.7,
		Visible = {'org37'}
	},
	{
		From = vector3(-2229.83, 2403.81, 11.231),
		To = vector3(-2228.79, 2399.22, -163.1448),
		Heading = 354.69,
		Visible = {'org38'}
	},
	{
		From = vector3(-2228.79, 2399.22, -163.1448),
		To = vector3(-2229.83, 2403.81, 11.231),
		Heading = 193.1,
		Visible = {'org38'}
	},
	{
		From = vector3(-3163.89, 1376.07, 16.7644),
		To = vector3(-3175.43, 1365.27, -150.646),
		Heading = 97.72,
		Visible = {'org39'}
	},
	{
		From = vector3(-3175.43, 1365.27, -150.646),
		To = vector3(-3163.89, 1376.07, 16.7644),
		Heading = 183.57,
		Visible = {'org39'}
	},
}


Config.Lifts = {
	{
		{
			Coords = vector3(-442.207, -343.2074, 35.0552),
			Label = "Lobby - Recepcja",
			Heading = 164.97
		},
		{
			Coords = vector3(-441.8999, -341.8568, 42.4813),
			Label = "I Piętro",
			Heading = 335.33
		}
	},
	{
		{
			Coords = vector3(-1215.897 , -204.1510, 39.3251),
			Label = "Recepcja",
			Heading = 62.8135,
			custom = true,
		},	

		{
			Coords = vector3(-1203.1069335938, -190.87379455566, 47.79),
			Label = "Piętro 1",
			Heading = 169.59108,
			custom = true,
		},	

		{
			Coords = vector3(-1203.1069335938, -190.87379455566, 51.79),
			Label = "Piętro 2",
			Heading = 169.59108,
			custom = true,
		},	

		{
			Coords = vector3(-1203.1069335938, -190.87379455566, 55.791 ),
			Label = "Piętro 3",
			Heading = 169.4608,
			custom = true,
		},	

		{
			Coords = vector3(-1203.1069335938, -190.87379455566, 59.79),
			Label = "Piętro 4",
			Heading = 169.4608,
			custom = true,
		},	

		{
			Coords = vector3(-1203.1069335938, -190.87379455566, 63.79),
			Label = "Piętro 5",
			Heading = 169.4608,
			custom = true,
		},	

		{
			Coords = vector3(-1203.1069335938, -190.87379455566, 67.79),
			Label = "Piętro 6",
			Heading = 169.4608,
			custom = true,
		},	

		{
			Coords = vector3(-1203.1069335938,-190.87379455566, 71.79),
			Label = "Piętro 7",
			Heading = 169.4608,
			custom = true,
		},	
	},
	{
		{
			Coords = vector3(-419.2288, -344.8389, 24.281),
			Label = "Parking",
			Heading = 108.46
		},
		{
			Coords = vector3(-436.0229, -359.6152, 34.99),
			Label = "Lobby - Recepcja",
			Heading = 350.41
		},
		{
			Coords = vector3(-490.5791, -327.4872, 69.55),
			Label = "II Piętro",
			Heading = 166.54
		}
	},
	{
		{
			Coords = vector3(511.08, 23.93, 69.49),
			Label = "Parking",
			Heading = 121.6,
			Allow = {['police'] = true, ['ambulance'] = true}
		},
		{
			Coords = vector3(598.53, -22.11, 90.65),
			Label = "II Piętro",
			Heading = 335.33,
			Allow = {['police'] = true, ['ambulance'] = true}
		}
	},
	{
		{
			Coords = vector3(-1096.04, -850.57, 38.24),
			Label = "Dach",
			Heading = 35.81,
			Allow = {['police'] = true, ['ambulance'] = true}
		},
		{
			Coords = vector3(-1096.04, -850.57, 34.36),
			Label = "Biuro szefa (V piętro)",
			Heading = 35.81,
			Allow = {['police'] = true, ['ambulance'] = true}
		},
		{
			Coords = vector3(-1096.04, -850.57, 30.76),
			Label = "Biuro operacyjne (IV piętro)",
			Heading = 35.81,
			Allow = {['police'] = true, ['ambulance'] = true}
		},
		{
			Coords = vector3(-1096.04, -850.57, 26.82),
			Label = "Siłownia (III piętro)",
			Heading = 35.81,
			Allow = {['police'] = true, ['ambulance'] = true}
		},
		{
			Coords = vector3(-1096.04, -850.57, 23.03),
			Label = "Kawiarnia (II piętro)",
			Heading = 35.81,
			Allow = {['police'] = true, ['ambulance'] = true}
		},
		{
			Coords = vector3(-1096.04, -850.57, 19.0),
			Label = "Lobby (I piętro)",
			Heading = 35.81,
			Allow = {['police'] = true, ['ambulance'] = true}
		},
		{
			Coords = vector3(-1096.04, -850.57, 13.69),
			Label = "Szatnia (-III Piętro)",
			Heading = 35.81,
			Allow = {['police'] = true, ['ambulance'] = true}
		},
		{
			Coords = vector3(-1096.04, -850.57, 10.28),
			Label = "Laboratorium (-II Piętro)",
			Heading = 35.81,
			Allow = {['police'] = true, ['ambulance'] = true}
		},
		{
			Coords = vector3(-1096.04, -850.57, 4.88),
			Label = "Garaż dolny (-I Piętro)",
			Heading = 35.81,
			Allow = {['police'] = true, ['ambulance'] = true}
		},
	},
	{
		{
			Coords = vector3(-1065.99, -833.78, 27.04),
			Label = "Siłownia (III Piętro)",
			Heading = 34.19,
			Allow = {['police'] = true, ['ambulance'] = true}
		},
		{
			Coords = vector3(-1065.99, -833.78, 19.03),
			Label = "Lobby (I Piętro)",
			Heading = 34.19,
			Allow = {['police'] = true, ['ambulance'] = true}
		},
		{
			Coords = vector3(-1065.99, -833.78, 14.88),
			Label = "Szatnia (-III Piętro)",
			Heading = 34.19,
			Allow = {['police'] = true, ['ambulance'] = true}
		},
		{
			Coords = vector3(-1065.99, -833.78, 11.04),
			Label = "Zbrojownia (-II Piętro)",
			Heading = 34.19,
			Allow = {['police'] = true, ['ambulance'] = true}
		},
		{
			Coords = vector3(-1065.99, -833.78, 5.48),
			Label = "Cele (-I Piętro)",
			Heading = 34.19,
			Allow = {['police'] = true, ['ambulance'] = true}
		},
	},
}

