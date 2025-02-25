Config                            = {}
Config.Przycisk					  = 23
Config.DrawDistance               = 15.0
Config.MarkerType                 = 1
Config.MarkerSize                 = { x = 1.5, y = 1.5, z = 1.0 }
Config.MarkerColor                = { r = 0, g = 130, b = 204 }

Config.EnablePlayerManagement     = true
Config.EnableArmoryManagement     = false
Config.EnableESXIdentity          = true
Config.EnableNonFreemodePeds      = false
Config.EnableSocietyOwnedVehicles = false
Config.EnableLicenses             = true

Config.EnableHandcuffTimer        = true
Config.HandcuffTimer              = 15 * 60000

Config.EnableJobBlip              = true

Config.MaxInService               = -1
Config.Locale = 'en'

Config.PoliceCount = {
	{
		coords = vector3(441.32, -983.56, 29.79)
	},
}

Config.Blips = {
	
}

Config.PoliceStations = {
	Cloakrooms = {
		{
			coords = vector3(462.4731, -999.1086, 29.7395)
		},
		{
			coords = vector3(-568.52, -115.18, 32.98)
		},
		{
			coords = vector3(-62.65, -2512.03, 6.55),
		},
		{
			coords = vector3(-1097.27, -832.92, 13.38)
		},
		{
			coords = vector3(623.64, -3.38, 75.67) -- vinewood
		},
		{
			coords = vector3(1856.92, 3689.73, 33.30) -- sandy
		},
		{
			coords = vector3(1538.3743, 810.8719, 76.7059)
		},
		{
			coords = vector3(-450.65, 6008.24, 30.99),
		},
		{
			coords = vector3(381.9328, -1610.0856, 28.3421),
		},
	},
	
	
	Pharmacy = {
		{
			coords = vector3(478.9467, -996.7096, 29.742)
		},
		{
			coords = vector3(-578.6, -114.35, 32.98)
		},
		{
			coords = vector3(-49.14, -2520.95, 6.49)
		},
		{
			coords = vector3(-1087.23, -821.81, 10.14)
		},
		{
			coords = vector3(603.92, -19.28, 75.67) -- vinewood
		},
		{
			coords = vector3(1858.52, 3691.05, 33.32) -- sandy
		},
		{
			coords = vector3(1549.2769, 836.8367, 76.7058)
		},
		{
			coords = vector3(-429.57, 5996.18, 30.9)
		},
		{
			coords = vector3(370.1848, -1597.7797, 28.3421)
		},
	},
	
	SERTArmory = {
		{
			coords = vector3(482.6145, -995.7883, 29.7396)
		},
		{
			coords = vector3(-579.94, -110.36, 32.99)
		},
		{
			coords = vector3(-1079.35, -822.99, 13.98)
		},
		{
			coords = vector3(1860.75, 3688.76, 33.32) -- sandy
		},
		{
			coords = vector3(-426.97, 5998.82, 30.90)
		},
		{
			coords = vector3(1550.1853, 841.5833, 76.7058)
		},
	},

	Vehicles = {
		{
			coords	= vector3(1532.8798, 789.4587, 76.504),
			spawnPoint = vector3(1521.1335, 789.8227, 76.4907),
			heading	= 136.98
		},
		{
			coords	= vector3(371.616, -1612.6169, 28.3421),
			spawnPoint = vector3(374.4328, -1610.9198, 28.3421),
			heading	= 221.37
		},
		{
			coords	= vector3(468.376, -974.7727, 25.3233),
			spawnPoint = vector3(450.6531, -975.8537, 24.7498),
			heading	= 86.82
		},
		{
			coords	= vector3(472.6868, -1019.3616, 27.1808),
			spawnPoint = vector3(472.5453, -1027.4117, 27.2191),
			heading	= 272.83
		},
		{
			coords	= vector3(-581.26, -119.57, 32.8),
			spawnPoint = vector3(-588.99, -117.93, 33.3),
			heading	= 202.11
		},
		{
			coords	= vector3(-59.77, -2523.11, 5.25),
			spawnPoint = vector3(-60.38, -2527.03, 4.7),
			heading	= 55.12
		},
		{
			coords	= vector3(-1084.41, -846.72, 3.98), --
			spawnPoint = vector3(-1077.78, -845.53, 4.47),
			heading	= 218.32
		},
		{
			coords	= vector3(-1109.76, -839.38, 12.44),
			spawnPoint = vector3(-1115.37, -835.82, 12.92),
			heading	= 128.63
		},
		{
			coords	= vector3(605.04, 0.76, 69.67), -- vinewood
			spawnPoint = vector3(597.73, -2.46, 69.67),
			heading	= 79.53
		},
		{
			coords	= vector3(1858.12, 3701.94, 33.37),
			spawnPoint = vector3(1863.7, 3705.37, 32.96),
			heading	= 210.43
		},
		{
			coords	= vector3(-459.81, 6015.57, 30.59),
			spawnPoint = vector3(-462.65, 6019.08, 30.93),
			heading	= 317.49
		},
		{
			coords	= vector3(468.341, -992.4555, 25.3233),
			spawnPoint = vector3(436.6855, -976.0679, 24.7498),
			heading	= 90.29
		},
	},
	Lodzie = {
		{
			coords	= vector3(-793.66, -1492.08, 0.7),
			spawnPoint = vector3(-794.07, -1500.97, 0.49),
			heading	= 110.07
		},
		{
			coords	= vector3(1735.36, 3978.49, 31.08),
			spawnPoint = vector3(1727.0, 3984.0, 30.55),
			heading	= 23.0
		},
		{  -- Molo Lewa Strona
			coords	= vector3(-1620.9193, -1115.5621, 2.2115),
			spawnPoint = vector3(-1637.426, -1159.1534, -0.6621),
			heading	= 144.22
		},
		{     -- Molo milosci prawa strona
			coords	= vector3(-2146.3152, -496.4081, 1.1401),
			spawnPoint = vector3(-2160.4053, -511.85, -0.3853),
			heading	= 138.9
		},
		{ --  Molo Chumash
			coords	= vector3(-3303.2083, 983.5123, 1.0641),
			spawnPoint = vector3(-3317.9622, 988.2432, -0.7429),
			heading	= 82.03
		},
		{    --- Molo Paleto
			coords	= vector3(-258.9682, 6651.8325, 0.7976),
			spawnPoint = vector3(-285.5122, 6664.5391, -0.989),
			heading	= 64.64
		},
		{    --- Latarnia
			coords	= vector3(3371.6121, 5183.6074, 0.5102),
			spawnPoint = vector3(3373.9976, 5189.8711, -0.7229),
			heading	= 273.56
		},
		{    --- Sustancia Road
			coords	= vector3(2836.5708, -723.2911, 0.6063),
			spawnPoint = vector3(2852.5557, -724.638, 0.0085),
			heading	= 267.61
		},
		{    --- Port Dolny Prawy Mapa
			coords	= vector3(682.2568, -3178.5488, 5.6581),
			spawnPoint = vector3(670.9327, -3187.2688, 1.0147),
			heading	= 132.2
		},
		{    --- Na kurwierze
			coords	= vector3(-549.4282, -2860.7339, 5.0503),
			spawnPoint = vector3(-561.3381, -2866.2405, -0.3302),
			heading	= 99.59
		},
	},
	Helicopters = {
		{
			coords    = vector3(1569.5293, 833.8819, 76.1915),
			spawnPoint = vector3(1564.2985, 844.0234, 76.1915),
			heading    = 60.68
		},
		{
			coords    = vector3(463.16, -982.45, 42.79),
			spawnPoint = vector3(449.3, -981.17, 43.69),
			heading    = 2.68
		},
		{
			coords    = vector3(-1092.22, -840.33, 36.8),
			spawnPoint = vector3(-1096.17, -832.38, 37.7),
			heading    = 310.42
		},
		{
			coords    = vector3(566.47, 6.72, 102.33),
			spawnPoint = vector3(579.99, 11.58, 103.23),
			heading    = 359.35
		},
		{
			coords    = vector3(-469.46, 6001.06, 30.4),
			spawnPoint = vector3(-475.22, 5988.74, 31.34),
			heading    = 317.21
		},
		{
			coords    = vector3(1831.4998, 3687.6494, 39.1894),
			spawnPoint = vector3(1833.4812, 3680.8623, 39.1894),
			heading    = 34.6
		},
		{
			coords    = vector3(369.2853, -1599.4941, 35.9987),
			spawnPoint = vector3(362.9648, -1598.4795, 35.9987),
			heading    = 322.66
		},
	},


	VehicleDodatki = {
		{
			coords = vector3(449.94976806641, -976.06903076172, 24.74)
		},
		{
			coords = vector3(-592.43, -103.43, 32.81)
		},
		{
			coords = vector3(-1061.75, -853.57, 3.97)
		},
		{
			coords = vector3(601.59, -4.85, 69.69) -- vinewood
		},
		{
			coords = vector3(-466.9, 6026.53, 30.44)
		},
		{
			coords = vector3(1873.61, 3695.83, 32.67)
		},
		{
			coords = vector3(-1123.5161, -861.8075, 12.6129)
		},
		{
			coords = vector3(1518.2633, 794.934, 76.4907)
		},
		{
			coords = vector3(386.3375, -1635.4127, 28.3421)
		},
		{
			coords = vector3(-57.2662, -2529.7886, 5.06)
		},
	},

	VehicleDeleters = {
		{
			coords = vector3(459.1839, -993.9727, 24.7498)
		},
		{
			coords = vector3(378.3728, -1628.509, 27.6455)
		},
		{
			coords = vector3(362.9648, -1598.4795, 35.9987)
		},
		{
			coords = vector3(474.0662, -1022.9456, 27.1616)
		},
		{
			coords = vector3(449.3, -981.17, 42.79)
		},
		{
			coords = vector3(-588.15, -112.92, 32.81)
		},
		{
			coords = vector3(-63.83, -2527.2, 5.11)
		},
		{
			coords = vector3(-1077.53, -845.68, 3.98)
		},
		{
			coords = vector3(-1113.69, -834.59, 12.44)
		},
		{
			coords = vector3(-1096.17, -832.38, 36.8)
		},
		{
			coords = vector3(579.99, 11.58, 102.33)
		},
		{
			coords = vector3(594.43, 2.95, 69.69) -- vinewood
		},
		{
			coords = vector3(1859.94, 3710.18, 32.38)
		},
		{
			coords = vector3(-475.22, 5988.74, 30.44)
		},
		{
			coords = vector3(-470.49, 6012.55, 30.44)
		},
		{
			coords = vector3(-794.07, -1500.97, 0.11)
		},
		{
			coords = vector3(1731.38, 3989.23, 30.33)
		},
		{
			coords = vector3(1833.4812, 3680.8623, 39.1894)
		},
		{
			coords = vector3(1536.3887, 783.4149, 76.4932)
		},
		{
			coords = vector3(1564.2985, 844.0234, 76.1915)
		},
		{
			coords = vector3(-1637.426, -1159.1534, -0.3621) --molo lewo
		},
		{
			coords = vector3(-2160.4053, -511.85, 0.1853) --Molo milosci prawa strona
		},
		{
			coords = vector3(-3317.9622, 988.2432, -0.5029) --molo cumash
		},
		{
			coords = vector3(-285.5122, 6664.5391, -0.689) --molo paleto
		},
		{
			coords = vector3(3373.9976, 5189.8711, -0.4229) --latarnia
		},
		{
			coords = vector3(2852.5557, -724.638, 0.1085) --systancia road
		},
		{
			coords = vector3(670.9327, -3187.2688, 1.3147) --port dolny prawa mapa
		},
		{
			coords = vector3(-561.3381, -2866.2405, 0.1302) --na kurwierze
		},
	},


	SkinMenu = {
		{
			coords = vector3(461.6663, -996.538, 29.7395),
		},
		{
			coords = vector3(-64.57, -2515.31, 6.49)
		},
		{
			coords = vector3(-1093.65, -831.56, 13.38),
		},
		{
			coords = vector3(609.03, 3.31, 89.65), -- vinewood
		},
		{
			coords = vector3(1847.23, 3694.44, 33.32),
		},	
		{
			coords = vector3(-452.52, 6010.2, 30.97),
		},	
		{
			coords = vector3(1539.8662, 809.0111, 76.7059),
		},	
		{
			coords = vector3(380.1674, -1608.5087, 28.3421),
		},
	},

	BossActions = {
		{
			coords = vector3(460.4559, -985.3085, 29.7781)
		},
		{
			coords = vector3(-554.73, -114.86, 32.97)
		},
		{
			coords = vector3(-43.41, -2516.12, 6.49)
		},
		{
			coords = vector3(-1113.24, -833.3, 33.46)
		},
		{
			coords = vector3(587.22, -17.43, 86.56) -- vinewood
		},
		{
			coords = vector3(1857.74, 3690.24, 37.12)
		},
		{
			coords = vector3(-456.15, 6013.83, 30.76)
		},
		{
			coords = vector3(1539.0076, 815.7371, 81.1806)
		},
		{
			coords = vector3(388.0264, -1601.5522, 28.3421)
		},
	},
}

Config.VehicleGroups = {
	'ADAM', -- 1
	'MARY', -- 2
	'OFF-ROAD', -- 3
	'TASK', -- 4
	'SEU', -- 5
	'UNMARKED', -- 6
	'SERT', -- 7
	'SASD', -- 8
	'USMS', -- 9
	'HWP', -- 10
	'HWP UNMARKED', --11
	'AIAD',
	'SWAT', --13
}

Config.LodzieGroups = {
	'Łodzie', -- 1
	'Pościgowe', -- 2
}

-- https://wiki.rage.mp/index.php?title=Vehicles
Config.AuthorizedVehicles = {
	-- fib unmarked lokalne
			--SEU
					--hp
					{
						hidden = true,
						model = 'hp_zr1',
						label = '[HWP] Chevrolet Corvette ZR1',
						groups = {10},
						livery = 0,
						extrason = {1,2,3,4,5},
						extrasoff = {},
						tint = 0,
				},
				{
					grade = 1,
					model = 'pd_silv20',
					label = '[SASD] Chevrolet Silverado 2020',
					groups = {8},
					livery = 1,
					extrason = {1,2,3,4,5,6,7,8, 9},
					extrasoff = { },
					offroad = true,
				},
				{
					grade = 2,
					model = 'pd_capricel',
					label = '[SASD] Chevrolet Caprice',
					groups = {8},
					livery = 2,
					extrason = {1,2,3,4,5,6,9,10,11},
					extrasoff = {12},
				},
				{
					grade = 3,
					model = 'pd_fusion16',
					label = '[SASD] Ford Fusion 2016',
					groups = {8},
					livery = 3,
					extrason = {1,2,3,4,5,7,8,9,10,11,12},
					extrasoff = {6},
				},
--hp unmarked

	{
						hidden = true,
						grade = 4,
						model = 'hp_zr1',
						label = '[HWP UNMARKED] Chevrolet Corvette ZR1',
						groups = {11},
						livery = 1,
						extrason = {2},
						extrasoff = {},
						tint = 0,
				},
				{
				grade = 3,
				model = 'charglibk9',
				label = '[SEU SASD] Dodge Charger K9',
				groups = {5},
				livery = 1,
				extrason = {2,3,5,6,9,12},
				extrasoff = {1,7,8,10,11},
				},
					{
						grade = 10,
						model = 'pd_amggtr',
						label = '[SEU SASP]  Mercedes AMG-GTR',
						groups = {5},
						livery = 0,
						extrason = {1},
						extrasoff = {},
						tint = 0,
				},

				{
						grade = 11,
						model = 'pd_67impala',
						label = '[SEU SASP] Chevrolet Impala 1967',
						groups = {5},
						livery = 0,
						extrason = {1,2},
						extrasoff = {},
						tint = 0,
				},

				{
						grade = 11,
						model = 'pd_charger69',
						label = '[SEU SASP] Dodge Charger 1969',
						groups = {5},
						livery = 0,
						extrason = {1,2,3},
						extrasoff = {},
						tint = 0,
				},

				{
						grade = 5,
						model = 'challenger18',
						label = '[SEU SASP] Dodge Challenger Demon',
						groups = {5},
						livery = 0,
						extrason = {2,3,4,9},
						extrasoff = {},
						tint = 0,
				},

				{
				hidden = true,
						grade = 10,
						model = 'pd_amggtr',
						label = '[SEU SASD] Mercedes AMG-GTR',
						groups = {5},
						livery = 1,
						extrason = {1},
						extrasoff = {},
						tint = 1,
				},
		-- sert/swat

				{
					grade = 7,
					model = 'swat_jeep',
					label = '[SWAT] Jeep Wrangler',
					groups = {13},
					livery = 0,
					extrason = {1,2,3,4,5,6,7},
					extrasoff = {},
					bulletproof = true,
					tint = 1,
			},

			{
				grade = 7,
				model = 'swat_jeep',
				label = '[SERT] Jeep Wrangler',
				groups = {7},
				livery = 1,
				extrason = {1,2,3,4,5,6,7},
				extrasoff = {},
				bulletproof = true,
				tint = 1,
		},

				{
						grade = 8,
						model = 'pitbullbb',
						label = '[SWAT] Pitbull',
						groups = {13},
						livery = 1,
						extrason = {1,2,3,4},
						extrasoff = {},
						bulletproof = true,
						tint = 1,
				},

				{
					grade = 8,
					model = 'pitbullbb',
					label = '[SERT] Pitbull',
					groups = {7},
					livery = 1,
					extrason = {1,2,3,4},
					extrasoff = {},
					bulletproof = true,
					tint = 1,
			},
		--adam 
				{
						grade = 0,
						model = 'pd_96cv',
						label = '[ADAM] Crown Victoria 1996',
						groups = {1},
						livery = 1,
						extrason = {},
						extrasoff = {},
						tint = 0,
				},

				--HP

				{
				hidden = true,
						model = 'hp_charger18',
						label = '[HWP] Dodge Charger 2018',
						groups = {10},
						livery = 0,
						extrason = {1,3,4,5,6,7},
						extrasoff = {},
						tint = 0,
				},

				{
						hidden = true,
								model = 'hp_mustang',
								label = '[HWP] Ford Mustang GT',
								groups = {10},
								livery = 0,
								extrason = {2,3,4,6},
								extrasoff = {},
								tint = 0,
						},

						{
								hidden = true,
										model = 'hp_gt500',
										label = '[HWP] Ford Mustang Shelby GT500',
										groups = {10},
										livery = 0,
										extrason = {1,2,3},
										extrasoff = {},
										tint = 0,
								},

								{
										hidden = true,
												model = 'hp_camaro',
												label = '[HWP] Chevrolet Camaro',
												groups = {10},
												livery = 0,
												extrason = {2,3,4,5},
												extrasoff = {},
												tint = 0,
										},

								{
										hidden = true,
												model = 'hp_zl1',
												label = '[HWP] Chevrolet Camaro ZL1',
												groups = {10},
												livery = 0,
												extrason = {2,3,4,5,6,7,9,10,11,12},
												extrasoff = {},
												tint = 0,
										},

{
	grade = 9,
	model = 'h1',
	label = '[SHERIFF H1]',
	groups = {8},
	livery = 1,
	extrason = {1, 2, 3, 4, 5, 6, 7, 8, 9},
	extrasoff = { },
	--offroad = true,
	bulletproof = true,
	tint = 1,
},
								 --HP UNMARKED
										{
												hidden = true,
														grade = 0,
														model = 'hp_charger18',
														label = '[HWP UNMARKED] Dodge Charger 2018',
														groups = {11},
														livery = 1,
														extrason = {1,3,7},
														extrasoff = {},
														tint = 0,
										},
										{
												hidden = true,
														grade = 2,
														model = 'hp_camaro',
														label = '[HWP UNMARKED] Chevrolet Camaro',
														groups = {11},
														livery = 1,
														extrason = {2,3,4,5,7,12},
														extrasoff = {},
														tint = 0,
										},

										{
												hidden = true,
														grade = 1,
														model = 'hp_gt500',
														label = '[HWP UNMARKED] Ford Mustang Shelby GT500',
														groups = {11},
														livery = 1,
														extrason = {},
														extrasoff = {},
														tint = 0,
												},

												{
														hidden = true,
																grade = 5,
																model = 'hp_zl1',
																label = '[HWP UNMARKED] Chevrolet Camaro ZL1',
																groups = {11},
																livery = 1,
																extrason = {},
																extrasoff = {},
																tint = 0,
														},
											 
	{
		grade = 0,
		model = 'pd_rebla',
		label = '[AIAD] Rebla',
		groups = {12},
		livery = 1,
		extrason = {1,3,4,5,6,7},
		extrasoff = {2},
		tint = 1,
	},

	
	{
		grade = 0,
		model = 'pd_ss',
		label = '[AIAD] SS',
		groups = {12},
		livery = 1,
		extrason = {1,3,4,5,6,7},
		extrasoff = {2},
		tint = 1,
	},

	{
		grade = 0,
		model = 'pd_komoda',
		label = '[AIAD] Komoda',
		groups = {12},
		livery = 3,
		extrason = {1,3,4,5,6,7},
		extrasoff = {2},
		tint = 1,
	},

	{
		grade = 0,
		model = 'pd_tahoe21',
		label = '[AIAD] Tahoe 2021',
		groups = {12},
		livery = 1,
		extrason = {1,2,3,4,5,6,7,8},
		extrasoff = {},
		tint = 1,
		--offroad = false
	},

	{
		grade = 0,
		model = 'pd_victoria',
		label = '[AIAD] Victoria 2011',
		groups = {12},
		livery = 2,
		extrason = {1,3,4,5,6,7},
		extrasoff = {2},
		tint = 1,
	},

	{
		grade = 3,
		model = 'pd_charger18',
		label = '[AIAD] Charger 2018',
		groups = {12},
		livery = 1,
		extrason = {1,2,3,4,5,6,7},
		extrasoff = {},
		tint = 1,
	},
	{
		grade = 0,
		model = 'felon',
		label = '[FIB] Felon',
		groups = {6},
		livery = 0,
		extrason = {1,3,4,5,6,7},
		extrasoff = {2},
		tint = 1,
	},

	{
		grade = 0,
		model = 'gauntlet',
		label = '[FIB] Gauntlet',
		groups = {6},
		livery = 0,
		extrason = {1,3,4,5,6,7},
		extrasoff = {2},
		tint = 1,
	},

	{
		grade = 0,
		model = 'phoenix',
		label = '[FIB] Phoenix',
		groups = {6},
		livery = 0,
		extrason = {1,3,4,5,6,7},
		extrasoff = {2},
		tint = 1,
	},

	{
		grade = 0,
		model = 'Gresley',
		label = '[FIB] Gresley',
		groups = {6},
		livery = 0,
		extrason = {1,3,4,5,6,7},
		extrasoff = {2},
		tint = 1,
	},

	{
		grade = 0,
		model = 'rancherxl',
		label = '[FIB] Rancher XL',
		groups = {6},
		livery = 0,
		extrason = {1,3,4,5,6,7},
		extrasoff = {2},
		tint = 1,
	},
	
	--- ADAM ---
	{
		grade = 0,
		model = 'pd_komoda',
		label = '[ADAM] Lampadati Komoda',
		groups = {1},
		livery = 0,
		extrason = {1,3,4,5,6,7},
		extrasoff = {2},
		tint = 1,
	},

	{
		grade = 0,
		model = 'pd_victoria',
		label = '[ADAM] Crown Victoria 2011',
		groups = {1},
		livery = 0,
		extrason = {1,2,3,5,6,7,8,9,10,11,12},
		extrasoff = {},
	},

	{
		grade = 1,
		model = 'pd_charger10',
		label = '[ADAM] Dodge Charger 2010',
		groups = {1},
		livery = 0,
		extrason = {1,2,3,5,6,7,8,9,10,11,12},
		extrasoff = {},
	},

	{
		grade = 1,
		model = 'pd_charger14',
		label = '[ADAM] Dodge Charger 2014',
		groups = {1},
		livery = 0,
		extrason = {1,2,3,5,6,7,8,9,10,11,12},
		extrasoff = {},
	},

	{
		grade = 2,
		model = 'pd_taurus',
		label = '[ADAM] Ford Taurus 2013',
		groups = {1},
		livery = 0,
		extrason = {1,2,3,5,6,7,8,9,10,11,12},
		extrasoff = {},
	},

	{
		grade = 2,
		model = 'pd_capricel',
		label = '[ADAM] Chevrolet Caprice',
		groups = {1},
		livery = 0,
		extrason = {1,2,3,4,5,6,9,10,11},
		extrasoff = {12},
	},

	{
		grade = 3,
		model = 'pd_fusion16',
		label = '[ADAM] Ford Fusion 2016',
		groups = {1},
		livery = 0,
		extrason = {1,2,3,4,5,7,8,9,10,11,12},
		extrasoff = {6},
	},

	{
		grade = 3,
		model = 'pd_impala19',
		label = '[ADAM] Chevrolet Impala 2019',
		groups = {1},
		livery = 0,
		extrason = {1,2,3,4,5,7,8,9,10,11,12},
		extrasoff = {6},
	},
	
	{
		grade = 3,
		model = 'pd_charger18',
		label = '[ADAM] Dodge Charger 2018',
		groups = {1},
		livery = 0,
		extrason = {1,2,3,4,5,6,7},
		extrasoff = {},
	},

	{
		grade = 4,
		model = 'pd_ss',
		label = '[ADAM] Chevrolet SS',
		groups = {1},
		livery = 0,
		extrason = {1,2,3,4,5,7,8,9,10,11,12},
		extrasoff = {6},
	},
	
	
		--- MARY ---
	
	{
		grade = 1,
		model = 'pd_harley',
		label = '[MARY] Harley',
		groups = {2},
		livery = 0,
		extrason = {1},
		extrasoff = {},
	},

	{
		hidden = true,
		grade = 1,
		model = 'pd_dirtbike',
		label = '[MARY SASD] Cross',
		groups = {2},
		livery = 1,
		extrason = {},
		extrasoff = {},
	},

	{
		grade = 1,
		model = 'pd_dirtbike',
		label = '[MARY SASP] Cross',
		groups = {2},
		livery = 0,
		extrason = {},
		extrasoff = {},
	},

	{
		grade = 1,
		model = 'pd_outlander',
		label = '[MARY] Quad',
		groups = {2},
		livery = 0,
		extrason = {},
		extrasoff = {},
	},
	
		--- BOY ---
	{
		grade = 1,
		model = 'pd_everest14',
		label = '[BOY] Ford Everest 2014',
		groups = {3},
		livery = 0,
		extrason = {1,2,3,4,5,6},
		extrasoff = {},
	},

	{
		grade = 1,
		model = 'pd_freecrawler',
		label = '[BOY] FreeCrawler',
		groups = {3},
		livery = 0,
		extrason = {1,2,3,5,6},
		extrasoff = {},
	},
	{
		grade = 4,
		model = 'pd_explo',
		label = '[UNMARKED] Ford Explorer 2020',
		groups = {6},
		livery = 2,
		extrason = {},
		extrasoff = {1,2,3,5,6,7,8,9,10,11,12},
		tint = 1,
	},
	{
		grade = 2,
		model = 'pd_silv20',
		label = '[BOY] Chevrolet Silverado 2020',
		groups = {3},
		livery = 0,
		extrason = {1,2,3,4,5,6,7,8},
		extrasoff = {9},
		offroad = true
	},

	{
		grade = 2,
		model = 'pd_fj',
		label = '[BOY] Toyota FJ Cruiser',
		groups = {3},
		livery = 0,
		extrason = {1,2,3,4,5,6,7,10,11},
		extrasoff = {},
		offroad = false
	},

	{
		grade = 3,
		model = 'pd_tahoe18',
		label = '[BOY] Chevy Tahoe 2018',
		groups = {3},
		livery = 0,
		extrason = {1,2,3,5,6,7,8,9,10,11,12},
		extrasoff = {},
		offroad = false
	},

	
	{
		grade = 3,
		model = 'pd_ford150',
		label = '[BOY] Ford F150',
		groups = {3},
		livery = 0,
		extrason = {1,2,3,4,5,7,10,12},
		extrasoff = {6,8,9,11},
		--offroad = false
	},

	{
		grade = 4,
		model = 'pd_ram16',
		label = '[BOY] Dodge Ram 2500 2017',
		groups = {3},
		livery = 0,
		extrason = {1,2,3,5,6,7,8,9,10,12},
		extrasoff = {11},
		offroad = false
	},

	{
		grade = 4,
		model = 'pd_explo',
		label = '[BOY] Ford Explorer',
		groups = {3},
		livery = 0,
		extrason = {1,2,3,5,6,7,8,9,10,11,12},
		extrasoff = {},
	},

	{
		grade = 4,
		model = 'pd_ranger',
		label = '[BOY] Ford Ranger',
		groups = {3},
		livery = 0,
		extrason = {1,2,3},
		extrasoff = {},
		--offroad = true
	},

	{
		grade = 5,
		model = 'pd_bronco',
		label = '[BOY] Ford Bronco',
		groups = {3},
		livery = 0,
		extrason = {1,4,5,6},
		extrasoff = {3},
		--offroad = true
	},

	{
		grade = 5,
		model = 'pd_durango',
		label = '[BOY] Dodge Durango 2018',
		groups = {3},
		livery = 0,
		extrason = {1,2,3,4,5,6,7,8,9,10,11},
		extrasoff = {},
		offroad = false
	},


	{
		grade = 5,
		model = 'pd_tahoe21',
		label = '[BOY] Chevrolet Tahoe 2021',
		groups = {3},
		livery = 0,
		extrason = {1,2,3,4,5,6,7,8},
		extrasoff = {},
		--offroad = false
	},

	{
		grade = 5,
		model = 'pd_tundra',
		label = '[BOY] Toyota Tundra',
		groups = {3},
		livery = 0,
		extrason = {},
		extrasoff = {},
		--offroad = true
	},

	{
		grade = 6,
		model = 'pd_colorado',
		label = '[BOY] Chevrolet Colorado',
		groups = {3},
		livery = 0,
		extrason = {1,2,3,4,5,6},
		extrasoff = {},
		offroad = false
	},

		--- TASK ---
	
	{
		grade = 0,
		model = 'pbike',
		label = '[MARY] Rower',
		groups = {2},
		livery = 0,
		extrason = {1,2},
		extrasoff = {},
	},

	{
		grade = 0,
		model = 'pd_fordtow',
		label = '[TASK] Holownik',
		groups = {4},
		livery = 0,
		extrason = {1,2},
		extrasoff = {},
	},

	{
		grade = 0,
		model = 'pd_response',
		label = '[TASK] Centrum Operacyjne',
		groups = {4},
		livery = 0,
		extrason = {1,2,5,7,8,9,10,11,12},
		extrasoff = {3,4,6},
	},
	
	{
		grade = 1,
		model = 'riot',
		label = '[TASK] Riot',
		groups = {4},
		livery = 0,
		extrason = {1},
		extrasoff = {},
		offroad = true
	},

	{
		grade = 1,
		model = 'pbus',
		label = '[TASK] Bus',
		groups = {4},
		livery = 0,
		extrason = {},
		extrasoff = {},
	},

	{
		grade = 1,
		model = 'pd_coach',
		label = '[TASK] Autobus',
		groups = {4},
		livery = 0,
		extrason = {},
		extrasoff = {},
	},

	{
		grade = 1,
		model = 'pd_van',
		label = '[TASK] Chevrolet Express',
		groups = {4},
		livery = 1,
		extrason = {},
		extrasoff = {},
		offroad = false
	},

		--- UNMARKED ---
	-- {
	-- 	grade = 0,
	-- 	model = 'cvpilib',
	-- 	label = 'Ford Crown Victoria',
	-- 	groups = {6},
	-- 	livery = 0,
	-- 	extrason = {},
	-- 	extrasoff = {1},
	-- },
	

	 {
		 grade = 0,
		 model = 'pd_hellcat',
		 label = '[UNMARKED] Dodge Charger Hellcat',
		 groups = {6},
		 livery = 1,
		 extrason = {},
		 extrasoff = {1,2,3,4,5,6},
	 },

	-- {
	-- 	grade = 0,
	-- 	model = 'unmar2020',
	-- 	label = 'Ford explorer',
	-- 	groups = {6},
	-- 	livery = 0,
	-- 	extrason = {},
	-- 	extrasoff = {},
	-- },

	-- {
	-- 	grade = 0,
	-- 	model = 'ngt19',
	-- 	label = 'Nissan gtr',
	-- 	groups = {6},
	-- 	livery = 0,
	-- 	extrason = {1,2},
	-- 	extrasoff = {3},
	-- },
	 {
		grade = 5,
		model = 'jeeppol',
		label = '[SEU SASD] Jeep Wrangler',
		groups = {5},
		livery = 1,
		extrason = {1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12},
		extrasoff = { },
		--offroad = true,
		bulletproof = true,
		tint = 1,
	 },
	 {
		grade = 5,
		model = 'jeeppol',
		label = '[SEU SASP] Jeep Wrangler',
		groups = {5},
		livery = 0,
		extrason = {1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12},
		extrasoff = { },
		--offroad = true,
		bulletproof = true,
		tint = 1,
	 },
	 {
		 grade = 0,
		 model = '19mustang',
		 label = '[UNMARKED] Ford Mustang Shelby',
		 groups = {6},
		 livery = 0,
		 extrason = {},
		 extrasoff = {1,2,3,4,5,6,7,8,9},
	 },

	 {
		 grade = 0,
		 model = 'challengerum',
		 label = '[UNMARKED] Dodge Challenger',
		 groups = {6},
		 livery = 0,
		 extrason = {},
		 extrasoff = {1},
	 },

	 {
		grade = 7,
		model = '19sierra',
		label = '[UNMARKED] GMC Sierra 2019',
		groups = {6},
		livery = 0,
		extrason = {1,2,3,4},
		extrasoff = {},
		tint = 1,
	},



		--- SEU ---
	{
		hidden = true,
		grade = 11,
		model = 'hp_rs6',
		label = '[SEU SASP] Audi RS6',
		groups = {5},
		livery = 1,
		extrason = {1,2},
		extrasoff = {},
		tint = 1,
	},
		
	{
		grade = 3,
		model = 'pd_bmw',
		label = '[SEU SASP] Ścigacz BMW',
		groups = {5},
		livery = 0,
		extrason = {1},
		extrasoff = {},
	},

	{
		grade = 3,
		model = 'pd_hellcat',
		label = '[SEU SASP] Dodge Charger Hellcat',
		groups = {5},
		livery = 0,
		extrason = {2,5,6,9},
		extrasoff = {1,3,7,8,10,11,12},
	},

	{
		grade = 4,
		model = 'pd_lexus',
		label = '[SEU SASP] Lexus GS350',
		groups = {5},
		livery = 0,
		extrason = {1,2},
		extrasoff = {},
	},

	{
		grade = 5,
		model = 'pd_kawasaki',
		label = '[SEU SASP] Ścigacz Kawasaki',
		groups = {5},
		livery = 0,
		extrason = {1,2,3,4},
		extrasoff = {5,6},
	},

	{
		grade = 5,
		model = 'pd_jeep',
		label = '[SEU SASP] Jeep Grand Cherokee',
		groups = {5},
		livery = 0,
		extrason = {2,3,4,5,6,7,8},
		extrasoff = {9,10},
	},

	{
		grade = 6,
		model = 'pd_mustang',
		label = '[SEU SASP] Ford Mustang 2019',
		groups = {5},
		livery = 0,
		extrason = {1,2,3,4,5,6,7,8,9},
		extrasoff = {},
	},

	{
		grade = 6,
		model = 'pd_raptor',
		label = '[SEU SASP] Ford Raptor',
		groups = {5},
		livery = 0,
		extrason = {3,4,5,6,7,8,9},
		extrasoff = {1,2},
	},

	{
		grade = 7,
		model = 'pd_titan17',
		label = '[SEU SASP] Nissan Titan',
		groups = {5},
		livery = 0,
		extrason = {1,2},
		extrasoff = {3},
	},

	{
		grade = 7,
		model = 'pd_camaro',
		label = '[SEU SASP] Chevrolet Camaro',
		groups = {5},
		livery = 0,
		extrason = {1,2,3,4},
		extrasoff = {5,6,7,8,9},
	},

	{
		grade = 8,
		model = 'pd_rangerover',
		label = '[SEU SASP] Range Rover',
		groups = {5},
		livery = 0,
		extrason = {1,2,3,4,5,6,7,8},
		extrasoff = {},
		tint = 1,
	},

	{
		grade = 9,
		model = 'pd_zr1',
		label = '[SEU SASP] Chevrolet Corvette ZR1',
		groups = {5},
		livery = 0,
		extrason = {1,2,3,4,5},
		extrasoff = {},
	},

	{
		grade = 10,
		model = 'pd_c8',
		label = '[SEU SASP] Chevrolet Corvette C8',
		groups = {5},
		livery = 0,
		extrason = {1,2,3,4,5,6},
		extrasoff = {7,8,9},
	},

	{
		grade = 12,
		model = 'pd_tesla',
		label = '[SEU SASP] Tesla Model S',
		groups = {5},
		livery = 0,
		extrason = {1,2},
		extrasoff = {},
	},


	--- sheriff seu
	{
		hidden = true,
		grade = 3,
		model = 'pd_hellcat',
		label = '[SEU SASD] Dodge Charger Hellcat',
		groups = {5},
		livery = 2,
		extrason = {2,5,6,9},
		extrasoff = {1,3,7,8,10,11,12},
	},

	{
		hidden = true,
		grade = 4,
		model = 'pd_lexus',
		label = '[SEU SASD] Lexus GS350',
		groups = {5},
		livery = 2,
		extrason = {1,2},
		extrasoff = {},
	},

	{
		hidden = true,
		grade = 4,
		model = 'pd_ram16',
		label = '[SASD] Dodge Ram 2500 2017',
		groups = {8},
		livery = 1,
		extrason = {1,2,3,5,6,7,8,9,10,12},
		extrasoff = {11},
		offroad = false
	},
	{
		hidden = true,
		grade = 5,
		model = 'pd_jeep',
		label = '[SEU SASD] Jeep Grand Cherokee',
		groups = {5},
		livery = 1,
		extrason = {2,3,4,5,6,7,8},
		extrasoff = {9,10},
	},
	{
		hidden = true,
		grade = 6,
		model = 'pd_mustang',
		label = '[SEU SASD] Ford Mustang 2019',
		groups = {5},
		livery = 1,
		extrason = {1,2,3,4,5,6,7,8,9},
		extrasoff = {},
	},
	{
		hidden = true,
		grade = 6,
		model = 'pd_raptor',
		label = '[SEU SASD] Ford Raptor',
		groups = {5},
		livery = 1,
		extrason = {3,4,5,6,7,8,9},
		extrasoff = {1,2},
	},
	{
		hidden = true,
		grade = 7,
		model = 'pd_titan17',
		label = '[SEU SASD] Nissan Titan',
		groups = {5},
		livery = 1,
		extrason = {1,2},
		extrasoff = {3},
	},

	{
		hidden = true,
		grade = 7,
		model = 'pd_camaro',
		label = '[SEU SASD] Chevrolet Camaro',
		groups = {5},
		livery = 2,
		extrason = {1,2,3,4},
		extrasoff = {5,6,7,8,9},
	},
	
	{
		grade = 8,
		model = 'pd_rangerover',
		label = '[SEU SASD] Range Rover',
		groups = {5},
		livery = 2,
		extrason = {1,2,3,4,5,6,7,8},
		extrasoff = {},
		tint = 1,
	},
	
	{
		grade = 9,
		model = 'pd_zr1',
		label = '[SEU SASD] Chevrolet Corvette ZR1',
		groups = {5},
		livery = 1,
		extrason = {1,2,3,4,5},
		extrasoff = {},
	},

	{
		grade = 10,
		model = 'pd_c8',
		label = '[SEU SASD] Chevrolet Corvette C8',
		groups = {5},
		livery = 2,
		extrason = {1,2,3,4,5,6},
		extrasoff = {7,8,9},
	},
	--- SERT ---

	{
		grade = 4,
		model = 'pd_hellcat',
		label = '[SERT] Dodge Charger Hellcat',
		groups = {7},
		livery = 1,
		extrason = {2,5,6,9},
		extrasoff = {1,3,7,8,10,11,12},
		bulletproof = true,
		tint = 1,
	},

	{
		grade = 4,
		model = 'pd_hellcat',
		label = '[SWAT] Dodge Charger Hellcat',
		groups = {13},
		livery = 1,
		extrason = {2,5,6,9},
		extrasoff = {1,3,7,8,10,11,12},
		bulletproof = true,
		tint = 1,
	},

	{
		grade = 4,
		model = 'sub',
		label = '[SERT] Chevrolet Suburban',
		groups = {7},
		livery = 0,
		extrason = {2,3,4,5,6,7,10,11},
		extrasoff = {8,12},
		--offroad = true,
		bulletproof = true,
		tint = 1,
	},

	{
		grade = 4,
		model = 'sub',
		label = '[SWAT] Chevrolet Suburban',
		groups = {13},
		livery = 0,
		extrason = {2,3,4,5,6,7,10,11},
		extrasoff = {8,12},
		--offroad = true,
		bulletproof = true,
		tint = 1,
	},

	{
		grade = 4,
		model = 'pd_explorer',
		label = '[SERT] Ford Explorer',
		groups = {7},
		livery = 0,
		extrason = {1},
		extrasoff = {},
		bulletproof = true,
		tint = 1,
	},

	{
		grade = 4,
		model = 'pd_explorer',
		label = '[SWAT] Ford Explorer',
		groups = {13},
		livery = 0,
		extrason = {1},
		extrasoff = {},
		bulletproof = true,
		tint = 1,
	},

	{
		grade = 5,
		model = 'pd_gwagon',
		label = '[SERT] Mercedes G Class',
		groups = {7},
		livery = 0,
		extrason = {2,11},
		extrasoff = {3,6,7},
		--offroad = true,
		bulletproof = true,
		tint = 1,
	},

	{
		grade = 5,
		model = 'pd_gwagon',
		label = '[SWAT] Mercedes G Class',
		groups = {13},
		livery = 0,
		extrason = {2,11},
		extrasoff = {3,6,7},
		--offroad = true,
		bulletproof = true,
		tint = 1,
	},

	{
		grade = 4,
		model = 'pd_escalader',
		label = '[SERT] Cadillac Escalade',
		groups = {7},
		livery = 0,
		extrason = {2,3,4,5},
		extrasoff = {},
		--offroad = true,
		bulletproof = true,
		tint = 1,
	},

	{
		grade = 4,
		model = 'pd_escalader',
		label = '[SWAT] Cadillac Escalade',
		groups = {13},
		livery = 0,
		extrason = {2,3,4,5},
		extrasoff = {},
		--offroad = true,
		bulletproof = true,
		tint = 1,
	},

	{
		grade = 5,
		model = 'pd_h1',
		label = '[SERT] Hummer H1',
		groups = {7},
		livery = 0,
		extrason = {1,2,3,5,6,7,8,9},
		extrasoff = {},
		offroad = false,
		bulletproof = true,
		tint = 1,
	},

	{
		grade = 5,
		model = 'pd_h2',
		label = '[SERT] Hummer H2',
		groups = {7},
		livery = 0,
		extrason = {},
		extrasoff = {12},
		--offroad = true,
		bulletproof = true,
		tint = 1,
	},

	{
		grade = 5,
		model = 'pd_h1',
		label = '[SWAT] Hummer H1',
		groups = {13},
		livery = 0,
		extrason = {1,2,3,5,6,7,8,9},
		extrasoff = {},
		offroad = false,
		bulletproof = true,
		tint = 1,
	},

	{
		grade = 5,
		model = 'pd_h2',
		label = '[SWAT] Hummer H2',
		groups = {13},
		livery = 0,
		extrason = {},
		extrasoff = {12},
		--offroad = true,
		bulletproof = true,
		tint = 1,
	},

	{
		grade = 6,
		model = 'pd_sprinter',
		label = '[SWAT] Sprinter',
		groups = {13},
		livery = 0,
		extrason = {1},
		extrasoff = {},
		--offroad = true,
		bulletproof = true,
		tint = 1,
	},

	{
		grade = 6,
		model = 'pd_sprinter',
		label = '[SERT] Sprinter',
		groups = {7},
		livery = 0,
		extrason = {1},
		extrasoff = {},
		--offroad = true,
		bulletproof = true,
		tint = 1,
	},

	{
		grade = 8,
		model = 'BEARCAT',
		label = '[SWAT] Bearcat',
		groups = {13},
		livery = 4,
		extrason = {},
		extrasoff = {},
		--offroad = true,
		bulletproof = true,
		tint = 1,
	},

	{
		grade = 8,
		model = 'BEARCAT',
		label = '[SERT] Bearcat',
		groups = {7},
		livery = 1,
		extrason = {},
		extrasoff = {},
		--offroad = true,
		bulletproof = true,
		tint = 1,
	},

	{
		grade = 6,
		model = 'pd_coach',
		label = '[SWAT] Autobus',
		groups = {13},
		livery = 2,
		extrason = {},
		extrasoff = {},
		--offroad = true,
		bulletproof = true,
		tint = 1,
	},

	{
		grade = 7,
		model = 'pd_insurgent',
		label = '[SWAT] Insurgent',
		groups = {13},
		livery = 0,
		extrason = {1,2,3,4},
		extrasoff = {},
		--offroad = true,
		bulletproof = true,
		tint = 1,
	},

	{
		grade = 7,
		model = 'pd_insurgent',
		label = '[SERT] Insurgent',
		groups = {7},
		livery = 0,
		extrason = {1,2,3,4},
		extrasoff = {},
		--offroad = true,
		bulletproof = true,
		tint = 1,
	},

	{
		grade = 10,
		model = 'pd_hummerSU',
		label = '[SERT] Hummer H1 Alpha',
		groups = {7},
		livery = 0,
		extrason = {2,3,9},
		extrasoff = {1},
		--offroad = true,
		bulletproof = true,
		tint = 1,
	},

	{
		grade = 10,
		model = 'pd_hummerSU',
		label = '[SWAT] Hummer H1 Alpha',
		groups = {13},
		livery = 1,
		extrason = {2,3,9},
		extrasoff = {1},
		--offroad = true,
		bulletproof = true,
		tint = 1,
	},

	{
		grade = 8,
		model = 'pd_camarosu',
		label = '[SERT] Chevrolet Camaro',
		groups = {7},
		livery = 1,
		extrason = {2,3,4,5,6,7,8,9,10,11,12},
		extrasoff = {1},
		--offroad = true,
		bulletproof = true,
		tint = 1,
	},

	{
		grade = 8,
		model = 'pd_camarosu',
		label = '[SWAT] Chevrolet Camaro',
		groups = {13},
		livery = 0,
		extrason = {2,3,4,5,6,7,8,9,10,11,12},
		extrasoff = {1},
		--offroad = true,
		bulletproof = true,
		tint = 1,
	},

	{
		grade = 12,
		model = 'pd_entry',
		label = '[SWAT] Łazik',
		groups = {13},
		livery = 0,
		extrason = {1,2,5,10},
		extrasoff = {3},
		--offroad = true,
		bulletproof = true,
		tint = 1,
	},

	{
		grade = 14,
		model = 'pd_bulldog',
		label = '[SWAT] Sikawa',
		groups = {13},
		livery = 0,
		extrason = {1,2,3,4,5,6},
		extrasoff = {},
		bulletproof = true,
		tint = 1,
	},

	{
		grade = 12,
		model = 'pd_entry',
		label = '[SERT] Łazik',
		groups = {7},
		livery = 0,
		extrason = {1,2,5,10},
		extrasoff = {3},
		--offroad = true,
		bulletproof = true,
		tint = 1,
	},

	{
		grade = 14,
		model = 'pd_bulldog',
		label = '[SERT] Sikawa',
		groups = {7},
		livery = 0,
		extrason = {1,2,3,4,5,6},
		extrasoff = {},
		bulletproof = true,
		tint = 1,
	},

	-- SHERIFF
	{
		grade = 0,
		model = 'pd_komoda',
		label = '[SASD] Lampadati Komoda',
		groups = {8},
		livery = 1,
		extrason = {1,3,4,5,6,7},
		extrasoff = {2},
		tint = 1,
	},
	{
		hidden = true,
		grade = 0,
		model = 'pd_victoria',
		label = '[SASD] Crown Victoria 2011',
		groups = {8},
		livery = 1,
		extrason = {1,2,3,5,6,7,8,9,10,11,12},
		extrasoff = {},
	},
	{
		hidden = true,
		grade = 1,
		model = 'pd_charger10',
		label = '[SASD] Dodge Charger 2010',
		groups = {8},
		livery = 1,
		extrason = {1,2,3,5,6,7,8,9,10,11,12},
		extrasoff = {},
	},
	
	{
		hidden = true,
		grade = 1,
		model = 'pd_charger14',
		label = '[SASD] Dodge Charger 2014',
		groups = {8},
		livery = 1,
		extrason = {1,2,3,5,6,7,8,9,10,11,12},
		extrasoff = {},
	},
	{
		grade = 1,
		model = 'pd_freecrawler',
		label = '[SASD] FreeCrawler',
		groups = {8},
		livery = 1,
		extrason = {1,2,3,5,6},
		extrasoff = {},
	},
	{
		hidden = true,
		grade = 2,
		model = 'pd_gmc',
		label = '[SASD] GMC Sierra 2018',
		groups = {8},
		livery = 0,
		extrason = {},
		extrasoff = {},
		--offroad = true
	},
	{
		hidden = true,
		grade = 2,
		model = 'pd_taurus',
		label = '[SASD] Ford Taurus 2013',
		groups = {8},
		livery = 1,
		extrason = {1,2,3,5,6,7,8,9,10,11,12},
		extrasoff = {},
	},
	{
		hidden = true,
		grade = 2,
		model = 'pd_fj',
		label = '[SASD] Toyota FJ Cruiser',
		groups = {8},
		livery = 2,
		extrason = {1,2,3,4,5,6,7,10,11},
		extrasoff = {},
	},
	{
		hidden = true,
		grade = 3,
		model = 'pd_tahoe18',
		label = '[SASD] Chevy Tahoe 2018',
		groups = {8},
		livery = 1,
		extrason = {1,2,3,5,6,7,8,9,10,11,12},
		extrasoff = {},
		offroad = false
	},
	{
		hidden = true,
		grade = 3,
		model = 'pd_impala19',
		label = '[SASD] Chevrolet Impala 2019',
		groups = {8},
		livery = 2,
		extrason = {1,2,3,4,5,7,8,9,10,11,12},
		extrasoff = {6},
	},
	{
		hidden = true,
		grade = 3,
		model = 'pd_charger18',
		label = '[SASD] Dodge Charger 2018',
		groups = {8},
		livery = 2,
		extrason = {1,2,3,4,5,6,7},
		extrasoff = {},
	},
	{
		grade = 3,
		model = 'pd_ford150',
		label = '[SASD] Ford F150',
		groups = {8},
		livery = 2,
		extrason = {1,2,3,4,5,7,10,12},
		extrasoff = {6,8,9,11},
		--offroad = false
	},
	{
		hidden = true,
		grade = 4,
		model = 'pd_ranger',
		label = '[SASD] Ford Ranger',
		groups = {8},
		livery = 2,
		extrason = {1,2,3},
		extrasoff = {},
		--offroad = true
	},
	{
		hidden = true,
		grade = 4,
		model = 'pd_ss',
		label = '[SASD] Chevrolet SS',
		groups = {8},
		livery = 2,
		extrason = {1,2,3,4,5,7,8,9,10,11,12},
		extrasoff = {6},
	},
	{
		hidden = true,
		grade = 4,
		model = 'pd_explo',
		label = '[SASD] Ford Explorer',
		groups = {8},
		livery = 1,
		extrason = {1,2,3,5,6,7,8,9,10,11,12},
		extrasoff = {},
	},
	{
		grade = 5,
		model = 'pd_bronco',
		label = '[SASD] Ford Bronco',
		groups = {8},
		livery = 2,
		extrason = {1,4,5,6},
		extrasoff = {3},
	},
	{
		hidden = true,
		grade = 5,
		model = 'pd_tahoe21',
		label = '[SASD] Chevrolet Tahoe 2021',
		groups = {8},
		livery = 3,
		extrason = {1,2,3,4,5,6,7,8},
		extrasoff = {},
		--offroad = false
	},
	{
		grade = 5,
		model = 'pd_durango',
		label = '[SASD] Dodge Durango 2018',
		groups = {8},
		livery = 2,
		extrason = {1,2,3,4,5,6,7,8,9,10,11},
		extrasoff = {},
		offroad = false
	},
	{
		hidden = true,
		grade = 6,
		model = 'pd_colorado',
		label = '[SASD] Chevrolet Colorado',
		groups = {8},
		livery = 1,
		extrason = {1,2,3,4,5,6},
		extrasoff = {},
		offroad = false
	},
	{
		hidden = true,
		grade = 7,
		model = 'pd_silverado19',
		label = '[SASD] Chevrolet Silverado 2019',
		groups = {8},
		livery = 0,
		extrason = {1,2,3,4,6,8,10,12},
		extrasoff = {},
		tint = 0,
	},
	{
		hidden = true,
		grade = 8,
		model = 'pd_rangerover', 
		label = '[SASD] Range Rover',
		groups = {8},
		livery = 2,
		extrason = {1,2,3,4,5,6,7,8},
		extrasoff = {},
	},
	{
		hidden = true,
		grade = 11,
		model = 'so_challenger', 
		label = '[SASD] Challenger Demon',
		groups = {8},
		livery = 0,
		extrason = {2,3,4},
		extrasoff = {1,5,6,7,8,9},
	},

	---USMS---
	{
		grade = 3,
		model = 'pd_rebla',
		label = '[USMS UNMARKED] Rebla',
		groups = {9},
		livery = 1,
		extrason = {1,3,4,5,6,7},
		extrasoff = {2},
		tint = 1,
	},
	{
		grade = 3,
		model = 'pd_explorer',
		label = '[USMS UNMARKED] Ford Explorer',
		groups = {9},
		livery = 0,
		extrason = {},
		extrasoff = {},
		tint = 1,
	},
	{
		grade = 3,
		model = 'pd_escalader',
		label = '[USMS UNMARKED] Cadillac Escalade',
		groups = {9},
		livery = 0,
		extrason = {},
		extrasoff = {},
		tint = 1,
	},
	
	{
		grade = 3,
		model = 'pd_ss',
		label = '[USMS UNMARKED] SS',
		groups = {9},
		livery = 1,
		extrason = {1,3,4,5,6,7},
		extrasoff = {2},
		tint = 1,
	},

	{
		grade = 1,
		model = 'pd_komoda',
		label = '[USMS UNMARKED] Komoda',
		groups = {9},
		livery = 3,
		extrason = {1,3,4,5,6,7},
		extrasoff = {2},
		tint = 1,
	},

	{
		grade = 5,
		model = 'pd_tahoe21',
		label = '[USMS UNMARKED] Tahoe 2021',
		groups = {9},
		livery = 1,
		extrason = {1,2,3,4,5,6,7,8},
		extrasoff = {},
		tint = 1,
		--offroad = false
	},

	{
		grade = 1,
		model = 'pd_victoria',
		label = '[USMS UNMARKED] Victoria 2011',
		groups = {9},
		livery = 2,
		extrason = {1,3,4,5,6,7},
		extrasoff = {2},
		tint = 1,
	},

	{
		grade = 3,
		model = 'pd_charger18',
		label = '[USMS UNMARKED] Charger 2018',
		groups = {9},
		livery = 1,
		extrason = {1,2,3,4,5,6,7},
		extrasoff = {},
		tint = 1,
	},
	{
		grade = 1,
		model = 'pd_van',
		label = '[USMS] Van',
		groups = {9},
		livery = 0,
		extrason = {},
		extrasoff = {},
		offroad = false,
		tint = 1,
	},
	{
		grade = 1,
		model = 'pd_coach',
		label = '[USMS] Autobus',
		groups = {9},
		livery = 1,
		extrason = {},
		extrasoff = {},
		offroad = false,
		tint = 1,
	},
	{
		grade = 2,
		model = 'pd_ss',
		label = '[USMS] SS',
		groups = {9},
		livery = 3,
		extrason = {},
		extrasoff = {},
		offroad = false,
	},
{
		grade = 1,
		model = 'pd_van',
		label = '[USMS] Chevrolet Express',
		groups = {9},
		livery = 0,
		extrason = {},
		extrasoff = {},
		offroad = false,
	},
	{
		grade = 1,
		model = 'pd_silv20',
		label = '[USMS] Chevrolet Silverado 2020',
		groups = {9},
		livery = 3,
		extrason = {1,2,3,4,5,6,7,8},
		extrasoff = {9},
		offroad = true,
		tint = 1,
	},
	{
		grade = 1,
		model = 'pd_charger14',
		label = '[USMS] Dodge Charger 2014',
		groups = {9},
		livery = 3,
		extrason = {1,2,3,5,6,7,8,9,10,11,12},
		extrasoff = {},
	},
	{
		grade = 1,
		model = 'hp_explorer',
		label = '[USMS] Ford Explorer 2016',
		groups = {9},
		livery = 2,
		extrason = {},
		extrasoff = {},
		tint = 1,
	},
	{
		grade = 3,
		model = 'pd_fusion16',
		label = '[USMS] Ford Fusion 2016',
		groups = {9},
		livery = 2,
		extrason = {1,2,3,4,5,7,8,9,10,11,12},
		extrasoff = {6},
	},
	{
		grade = 3,
		model = 'pd_charger18',
		label = '[USMS] Dodge Charger 2018',
		groups = {9},
		livery = 3,
		extrason = {1,2,3,4,5,6,7},
		extrasoff = {},
	},
	{
		grade = 5,
		model = 'pd_tahoe21',
		label = '[USMS] Chevrolet Tahoe 2021',
		groups = {9},
		livery = 2,
		extrason = {1,2,3,4,5,6,7,8},
		extrasoff = {},
		--offroad = false
	},
	{
		grade = 5,
		model = 'pd_durango',
		label = '[USMS] Dodge Durango 2018',
		groups = {9},
		livery = 3,
		extrason = {1,2,3,4,5,6,7,8,9,10,11},
		extrasoff = {},
		offroad = false,
	},
	{
		grade = 4,
		model = 'pd_ram16',
		label = '[USMS] Dodge Ram 2500 2017',
		groups = {9},
		livery = 3,
		extrason = {1,2,3,5,6,7,8,9,10,12},
		extrasoff = {11},
		offroad = false,
		tint = 1,
	},
	{
		grade = 5,
		model = 'pd_snake',
		label = '[USMS SEU] Ford Mustang Shelby 2019',
		groups = {9},
		livery = 6,
		extrason = {},
		extrasoff = {},
		tint = 1,
	},
	{
		grade = 5,
		model = 'pd_mustang',
		label = '[USMS SEU] Ford Mustang 2019',
		groups = {9},
		livery = 3,
		extrason = {},
		extrasoff = {},
		tint = 1,
	},
	{
		grade = 5,
		model = 'pd_raptor',
		label = '[USMS SEU] Ford Raptor',
		groups = {9},
		livery = 3,
		extrason = {3,4,5,6,7,8,9},
		extrasoff = {1,2},
		tint = 1,
	},

	-- HIGHWAY PATROL
	{
		hidden = true,
		model = 'pd_komoda',
		label = '[HWP] Lampadati Komoda',
		groups = {10},
		livery = 2,
		extrason = {1,3,4,5,6},
		extrasoff = {2,7},
		tint = 1,
	},
	{
		hidden = true,
		model = 'hp_rangerover',
		label = '[HWP] Range Rover',
		groups = {10},
		livery = 0,
		extrason = {1,2,3,4,5,6,7,8},
		extrasoff = {},
		tint = 1,
	},
	{
		hidden = true,
		model = 'pd_sugoi',
		label = '[HWP] Sugoi',
		groups = {10},
		livery = 0,
		extrason = {1,3,4,5,6},
		extrasoff = {2},
		tint = 1,
	},
	{
		hidden = true,
		model = 'pd_caracara',
		label = '[HWP] Caracara',
		groups = {10},
		livery = 0,
		extrason = {1,3,4,5,6},
		extrasoff = {2},
		tint = 1,
	},
	{
		hidden = true,
		model = 'pd_rebla',
		label = '[HWP] Rebla',
		groups = {10},
		livery = 0,
		extrason = {1,3,4,5,6},
		extrasoff = {2},
		tint = 1,
	},
	{
		hidden = true,
		model = 'pd_paragon',
		label = '[HWP] Paragon',
		groups = {10},
		livery = 0,
		extrason = {1,3,4,5,6},
		extrasoff = {2},
		tint = 1,
	},
	{
		hidden = true,
		model = 'hp_victoria',
		label = '[HWP] Ford Crown Victoria',
		groups = {10},
		livery = 0,
		extrason = {1,2,3,4,5,7,8,9,10,11},
		extrasoff = {6,12},
	},
	{
		hidden = true,
		model = 'hp_explorer',
		label = '[HWP] Ford Explorer 2016',
		groups = {10},
		livery = 0,
		extrason = {1,2,3,4,5,8,9,10,11},
		extrasoff = {6,7,12},
	},
	{
		hidden = true,
		model = 'hp_gt63s',
		label = '[HWP] Mercedes AMG GT63s',
		groups = {10},
		livery = 0,
		extrason = {1,2},
		extrasoff = {},
		tint = 1,
	},
	{
		hidden = true,
		model = 'hp_wrxp',
		label = '[HWP] Subaru Impreza WRX STi',
		groups = {10},
		livery = 0,
		extrason = {3,4,5},
		extrasoff = {1,6,7}
	},
	{
		hidden = true,
		model = 'hp_x6',
		label = '[HWP]  BMW X6M',
		groups = {10},
		livery = 0,
		extrason = {1,2},
		extrasoff = {3,4},
		tint = 1,
	},
	{
		hidden = true,
		model = 'hp_bmw',
		label = '[HWP]  Ścigacz BMW',
		groups = {10},
		livery = 0,
		extrason = {1},
		extrasoff = {},
	},
	{
		hidden = true,
		model = 'hp_hell',
		label = '[HWP] Dodge Charger Hellcat',
		groups = {10},
		livery = 0,
		extrason = {1},
		extrasoff = {},
		tint = 1,
	},
	{
		hidden = true,
		model = 'hp_c8',
		label = '[HWP] Corvette C8',
		groups = {10},
		livery = 0,
		extrason = {1,2},
		extrasoff = {},
		tint = 1,
	},
	{
		hidden = true,
		model = 'hp_challenger',
		label = '[HWP] Dodge Challenger Demon',
		groups = {10},
		livery = 0,
		extrason = {1,2,3,4,6},
		extrasoff = {5,7,8,9},
	},
	{
		hidden = true,
		model = 'hp_r35',
		label = '[HWP] Nissan GTR',
		groups = {10},
		livery = 0,
		extrason = {2,3,4,5,6,7,8,9,11},
		extrasoff = {1,10,12},
	},
	{
		hidden = true,
		model = 'hp_a45',
		label = '[HWP] Mercedes AMG A45s',
		groups = {10},
		livery = 0,
		extrason = {1,2,3,4,5,6},
		extrasoff = {},
		tint = 1,
	},
	{
		hidden = true,
		model = 'hp_f430',
		label = '[HWP] Ferrari F430',
		groups = {10},
		livery = 0,
		extrason = {1},
		extrasoff = {},
	},
	{
		hidden = true,
		model = 'pd_snake',
		label = '[HWP] Ford Mustang Shelby GT350',
		groups = {10},
		livery = 2,
		extrason = {1,2,3,4},
		extrasoff = {5,6,7,8},
		tint = 1,
	},
	{
		hidden = true,
		model = 'hp_rs5',
		label = '[HWP] Audi RS5 ABT',
		groups = {10},
		livery = 0,
		extrason = {1},
		extrasoff = {},
		tint = 1,
	},
	{
		hidden = true,
		model = 'hp_bmwm5',
		label = '[HWP] BMW M5',
		groups = {10},
		livery = 0,
		extrason = {1},
		extrasoff = {},
	},
	{
		hidden = true,
		model = 'hp_g63',
		label = '[HWP] Mercedes AMG G63 6x6',
		groups = {10},
		livery = 0,
		extrason = {1,6,7},
		extrasoff = {},
		tint = 1,
	},
	{
		hidden = true,
		model = 'hp_911',
		label = '[HWP] Porsche 911',
		groups = {10},
		livery = 0,
		extrason = {1},
		extrasoff = {},
		tint = 1,
	},
	{
		hidden = true,
		model = 'hp_rs6',
		label = '[HWP] Audi RS6',
		groups = {10},
		livery = 0,
		extrason = {1,2},
		extrasoff = {},
		tint = 1,
	},
	{
		hidden = true,
		model = 'hp_sf90',
		label = '[HWP] Ferrari SF90',
		groups = {10},
		livery = 0,
		extrason = {1,2,3,4},
		extrasoff = {},
	},
	{
		hidden = true,
		model = 'hp_lambo',
		label = '[HWP] Lamborghini Huracan',
		groups = {10},
		livery = 0,
		extrason = {1},
		extrasoff = {},
		tint = 1,
	},
	{
		hidden = true,
		model = 'hp_m8',
		label = '[HWP] BMW M8',
		groups = {10},
		livery = 0,
		extrason = {1},
		extrasoff = {2},
	},
	{
		hidden = true,
		model = 'hp_laferrari',
		label = '[HWP] Ferrari Laferrari Aperta',
		groups = {10},
		livery = 0,
		extrason = {1},
		extrasoff = {},
		tint = 1,
	},
	{
		hidden = true,
		model = 'hp_mustangwb',
		label = '[HWP] Ford Mustang Widebody',
		groups = {10},
		livery = 0,
		extrason = {3,4,5,7},
		extrasoff = {1,2},
		tint = 1,
	},
	{
		hidden = true,
		model = 'hp_veyron',
		label = '[HWP] Bugatti Veyron',
		groups = {10},
		livery = 0,
		extrason = {1},
		extrasoff = {},
	},
	{
		hidden = true,
		model = 'hp_gt17',
		label = '[HWP] Ford GT',
		groups = {10},
		livery = 0,
		extrason = {1},
		extrasoff = {},
	},
	{
		hidden = true,
		model = 'hp_chiron',
		label = '[HWP] Bugatti Chiron',
		groups = {10},
		livery = 0,
		extrason = {1},
		extrasoff = {},
	},
	{
		hidden = true,
		model = 'hp_p1',
		label = '[HWP] McLaren P1',
		groups = {10},
		livery = 0,
		extrason = {1},
		extrasoff = {},
		tint = 1,
	},
	{
		hidden = true,
		model = 'pd_hellcatwb',
		label = '[HWP] Dodge Charger Hellcat WB',
		groups = {10},
		livery = 0,
		extrason = {2,3,4,5,7,9,10},
		extrasoff = {1,11},
	},
	{
		hidden = true,
		model = 'pd_turismo',
		label = '[HWP] Turismo',
		groups = {10},
		livery = 0,
		extrason = {1,3,4,5,6},
		extrasoff = {2},
		tint = 1,
	},


	-- HIGHWAY PATROL UNMARKED
	{
		hidden = true,
		model = 'pd_komoda',
		label = '[HWP UNMARKED] Lampadati Komoda',
		groups = {11},
		livery = 3,
		extrason = {3,4,5,6},
		extrasoff = {1,2,7},
		tint = 1,
	},
	{
		hidden = true,
		model = 'hp_rangerover',
		label = '[HWP UNMARKED] Range Rover',
		groups = {101},
		livery = 1,
		extrason = {},
		extrasoff = {1,2,3,4,5,6,7,8},
		tint = 1,
	},
	{
		hidden = true,
		model = 'pd_sugoi',
		label = '[HWP UNMARKED] Sugoi',
		groups = {11},
		livery = 1,
		extrason = {3,4,5,6},
		extrasoff = {1,2},
		tint = 1,
	},
	{
		hidden = true,
		model = 'pd_caracara',
		label = '[HWP UNMARKED] Caracara',
		groups = {11},
		livery = 1,
		extrason = {3,4,5,6},
		extrasoff = {1,2},
		tint = 1,
	},
	{
		hidden = true,
		model = 'pd_rebla',
		label = '[HWP UNMARKED] Rebla',
		groups = {11},
		livery = 1,
		extrason = {3,4,5,6},
		extrasoff = {1,2},
		tint = 1,
	},
	{
		hidden = true,
		model = 'pd_paragon',
		label = '[HWP UNMARKED] Paragon',
		groups = {11},
		livery = 1,
		extrason = {3,4,5,6},
		extrasoff = {1,2},
		tint = 1,
	},
	{
		hidden = true,
		model = 'hp_victoria',
		label = '[HWP UNMARKED] Ford Crown Victoria',
		groups = {11},
		livery = 1,
		extrason = {2,3,4,5,7,8,9,10,11},
		extrasoff = {1,6,12},
	},
	{
		grade = 1,
		model = 'pd_freecrawler',
		label = '[HWP UNMARKED] FreeCrawler',
		groups = {11},
		livery = 2,
		extrason = {2,3,5,6},
		extrasoff = {1},
	},
	{
		hidden = true,
		model = 'hp_explorer',
		label = '[HWP UNMARKED] Ford Explorer 2016',
		groups = {11},
		livery = 1,
		extrason = {2,3,4,5,8,9,10,11},
		extrasoff = {1,6,7,12},
	},
	{
		hidden = true,
		model = 'hp_gt63s',
		label = '[HWP UNMARKED] Mercedes AMG GT63s',
		groups = {11},
		livery = 1,
		extrason = {2},
		extrasoff = {1},
		tint = 1,
	},
	{
		hidden = true,
		model = 'hp_wrxp',
		label = '[HWP UNMARKED] Subaru Impreza WRX STi',
		groups = {11},
		livery = 1,
		extrason = {3,4,5},
		extrasoff = {1,6,7},
	},
	{
		hidden = true,
		model = 'hp_x6',
		label = '[HWP UNMARKED]  BMW X6M',
		groups = {11},
		livery = 1,
		extrason = {1},
		extrasoff = {2,3,4},
		tint = 1,
	},
	{
		hidden = true,
		model = 'hp_hell',
		label = '[HWP UNMARKED] Dodge Charger Hellcat',
		groups = {11},
		livery = 1,
		extrason = {1},
		extrasoff = {},
		tint = 1,
	},
	{
		hidden = true,
		model = 'hp_c8',
		label = '[HWP UNMARKED] Corvette c8',
		groups = {11},
		livery = 1,
		extrason = {1,2},
		extrasoff = {},
		tint = 1,
	},
	{
		hidden = true,
		model = 'hp_challenger',
		label = '[HWP UNMARKED] Dodge Challenger Demon',
		groups = {11},
		livery = 1,
		extrason = {2,3,4},
		extrasoff = {1,5,6,7,8,9},
	},
	{
		hidden = true,
		model = 'hp_r35',
		label = '[HWP UNMARKED] Nissan GTR',
		groups = {11},
		livery = 1,
		extrason = {2,3,4,5,6,7,8,9},
		extrasoff = {1,10,11,12},
	},
	{
		hidden = true,
		model = 'hp_a45',
		label = '[HWP UNMARKED] Mercedes AMG A45s',
		groups = {11},
		livery = 1,
		extrason = {1,2,3,4,5,6},
		extrasoff = {},
		tint = 1,
	},
	{
		hidden = true,
		model = 'hp_f430',
		label = '[HWP UNMARKED] Ferrari F430',
		groups = {11},
		livery = 1,
		extrason = {1},
		extrasoff = {},
	},
	{
		hidden = true,
		model = 'hp_snake',
		label = '[HWP UNMARKED] Ford Mustang Shelby GT350',
		groups = {11},
		livery = 1,
		extrason = {1,2,3,4},
		extrasoff = {5,6,7,8},
		tint = 1,
	},
	{
		hidden = true,
		model = 'hp_rs5',
		label = '[HWP UNMARKED] Audi RS5 ABT',
		groups = {11},
		livery = 1,
		extrason = {1},
		extrasoff = {},
		tint = 1,
	},
	{
		hidden = true,
		model = 'hp_bmwm5',
		label = '[HWP UNMARKED] BMW M5',
		groups = {11},
		livery = 1,
		extrason = {1},
		extrasoff = {},
	},
	{
		hidden = true,
		model = 'hp_g63',
		label = '[HWP UNMARKED]  Mercedes AMG G63 6x6',
		groups = {11},
		livery = 1,
		extrason = {1,6,7},
		extrasoff = {},
		tint = 1,
	},
	{
		hidden = true,
		model = 'hp_911',
		label = '[HWP UNMARKED] Porsche 911',
		groups = {11},
		livery = 1,
		extrason = {1},
		extrasoff = {},
		tint = 1,
	},
	{
		hidden = true,
		model = 'hp_rs6',
		label = '[HWP UNMARKED] Audi RS6',
		groups = {11},
		livery = 1,
		extrason = {1,2},
		extrasoff = {},
		tint = 1,
	},
	{
		hidden = true,
		model = 'hp_sf90',
		label = '[HWP UNMARKED] Ferrari SF90',
		groups = {11},
		livery = 1,
		extrason = {2,3,4},
		extrasoff = {1},
	},
	{
		hidden = true,
		model = 'hp_lambo',
		label = '[HWP UNMARKED] Lamborghini Huracan',
		groups = {11},
		livery = 1,
		extrason = {1},
		extrasoff = {},
		tint = 1,
	},
	{
		hidden = true,
		model = 'hp_m8',
		label = '[HWP UNMARKED] BMW M8',
		groups = {11},
		livery = 1,
		extrason = {1},
		extrasoff = {2},
	},
	{
		hidden = true,
		model = 'hp_laferrari',
		label = '[HWP UNMARKED] Ferrari Laferrari Aperta',
		groups = {11},
		livery = 1,
		extrason = {1},
		extrasoff = {},
		tint = 1,
	},
	{
		hidden = true,
		model = 'hp_mustangwb',
		label = '[HWP UNMARKED] Ford Mustang Widebody',
		groups = {11},
		livery = 1,
		extrason = {3,4,5,7},
		extrasoff = {1,2},
		tint = 1,
	},
	{
		hidden = true,
		model = 'hp_veyron',
		label = '[HWP UNMARKED] Bugatti Veyron',
		groups = {11},
		livery = 1,
		extrason = {1},
		extrasoff = {},
	},
	{
		hidden = true,
		model = 'hp_gt17',
		label = '[HWP UNMARKED] Ford GT',
		groups = {11},
		livery = 1,
		extrason = {1},
		extrasoff = {},
	},
	{
		hidden = true,
		model = 'hp_chiron',
		label = '[HWP UNMARKED] Bugatti Chiron',
		groups = {11},
		livery = 1,
		extrason = {1},
		extrasoff = {},
	},
	{
		hidden = true,
		model = 'hp_p1',
		label = '[HWP UNMARKED] McLaren P1',
		groups = {11},
		livery = 1,
		extrason = {1},
		extrasoff = {},
		tint = 1,
	},
	{
		hidden = true,
		model = 'pd_hellcatwb',
		label = '[HWP UNMARKED] Dodge Charger Hellcat WB',
		groups = {11},
		livery = 1,
		extrason = {2,3,4,5,7,9,10},
		extrasoff = {1,11},
	},
	 {
		hidden = true,
		model = 'pd_turismo',
		label = '[HWP UNMARKED] Turismo',
		groups = {11},
		livery = 1,
		extrason = {3,4,5,6},
		extrasoff = {1,2},
		tint = 1,
	},
}

Config.AuthorizedLodzie = {
	{
		grade = 1,
		model = 'pd_boat1',
		label = 'Ponton',
		groups = {1},
		livery = 0,
		extrason = {},
		extrasoff = {},
	},
	{
		grade = 1,
		model = 'pd_boat1',
		label = 'Ponton',
		groups = {1},
		livery = 1,
		extrason = {},
		extrasoff = {},
	},
	{
		grade = 1,
		model = 'pd_boat2',
		label = 'Transportowa',
		groups = {1},
		livery = 0,
		extrason = {},
		extrasoff = {},
	},
	{
		grade = 1,
		model = 'pd_boat3',
		label = 'Skuter Wodny',
		groups = {1},
		livery = 0,
		extrason = {},
		extrasoff = {},
	},
}


-- CHECK SKINCHANGER CLIENT MAIN.LUA for matching elements
Config.AuthorizedVehiclesSASD = {	
	
	--- ADAM SASD---
	{
		hidden = true,
		grade = 0,
		model = 'pd_komoda',
		label = '[ADAM] Lampadati Komoda Policyjna',
		groups = {1},
		livery = 1,
		extrason = {1,3,4,5,6,7},
		extrasoff = {2},
		tint = 1,
	},
	
	{
		hidden = true,
		grade = 0,
		model = 'pd_victoria',
		label = '[ADAM] Crown Victoria 2011',
		groups = {1},
		livery = 1,
		extrason = {1,2,3,5,6,7,8,9,10,11,12},
		extrasoff = {},
	},

	{
		hidden = true,
		grade = 1,
		model = 'pd_charger10',
		label = '[ADAM] Dodge Charger 2010',
		groups = {1},
		livery = 1,
		extrason = {1,2,3,5,6,7,8,9,10,11,12},
		extrasoff = {},
	},

	{
		hidden = true,
		grade = 1,
		model = 'pd_charger14',
		label = '[ADAM] Dodge Charger 2014',
		groups = {1},
		livery = 1,
		extrason = {1,2,3,5,6,7,8,9,10,11,12},
		extrasoff = {},
	},

	{
		hidden = true,
		grade = 2,
		model = 'pd_taurus',
		label = '[ADAM] Ford Taurus 2013',
		groups = {1},
		livery = 1,
		extrason = {1,2,3,5,6,7,8,9,10,11,12},
		extrasoff = {},
	},

	{
		hidden = true,
		grade = 2,
		model = 'pd_capricel',
		label = '[ADAM] Chevrolet Caprice',
		groups = {1},
		livery = 2,
		extrason = {1,2,3,4,5,6,9,10,11},
		extrasoff = {12},
	},

	{
		hidden = true,
		grade = 3,
		model = 'pd_fusion16',
		label = '[ADAM] Ford Fusion 2016',
		groups = {1},
		livery = 3,
		extrason = {1,2,3,4,5,7,8,9,10,11,12},
		extrasoff = {6},
	},

	{
		hidden = true,
		grade = 3,
		model = 'pd_impala19',
		label = '[ADAM] Chevrolet Impala 2019',
		groups = {1},
		livery = 2,
		extrason = {1,2,3,4,5,7,8,9,10,11,12},
		extrasoff = {6},
	},
	
	{
		hidden = true,
		grade = 4,
		model = 'pd_charger18',
		label = '[ADAM] Dodge Charger 2018',
		groups = {1},
		livery = 2,
		extrason = {1,2,3,4,5,6,7},
		extrasoff = {},
	},

	{
		hidden = true,
		grade = 4,
		model = 'pd_ss',
		label = '[ADAM] Chevrolet SS',
		groups = {1},
		livery = 2,
		extrason = {1,2,3,4,5,7,8,9,10,11,12},
		extrasoff = {6},
	},
	
		--- MARY SASD ---
	
	{
		hidden = true,
		grade = 1,
		model = 'pd_harley',
		label = '[MARY] Harley',
		groups = {2},
		livery = 0,
		extrason = {1},
		extrasoff = {},
	},

	{
		hidden = true,
		grade = 1,
		model = 'pd_dirtbike',
		label = '[MARY] Cross',
		groups = {2},
		livery = 1,
		extrason = {},
		extrasoff = {},
	},

	{
		hidden = true,
		grade = 1,
		model = 'pd_outlander',
		label = '[MARY] Quad',
		groups = {2},
		livery = 1,
		extrason = {},
		extrasoff = {},
	},
	
		--- BOY SASD ---
	{
		hidden = true,
		grade = 1,
		model = 'pd_freecrawler',
		label = '[BOY] FreeCrawler Policyjny',
		groups = {3},
		livery = 1,
		extrason = {1,2,3,5,6},
		extrasoff = {},
	},
	{
		hidden = true,
		grade = 1,
		model = 'pd_explo',
		label = '[BOY] Ford Explorer 2020',
		groups = {3},
		livery = 1,
		extrason = {1,2,3,5,6,7,8,9,10,11,12},
		extrasoff = {},
	},

	{
		hidden = true,
		grade = 1,
		model = 'pd_gmc',
		label = '[BOY] GMC Sierra',
		groups = {3},
		livery = 0,
		extrason = {1,2,3,4,6,7,8,12},
		extrasoff = {5,9,10,11},
		offroad = true
	},

	{
		hidden = true,
		grade = 2,
		model = 'pd_ranger',
		label = '[BOY] Ford Ranger',
		groups = {3},
		livery = 2,
		extrason = {1,2,3},
		extrasoff = {},
		--offroad = true
	},

	{
		hidden = true,
		grade = 2,
		model = 'pd_fj',
		label = '[BOY] Toyota FJ Cruiser',
		groups = {3},
		livery = 2,
		extrason = {1,2,3,4,5,6,7,10,11},
		extrasoff = {},
		offroad = false
	},

	{
		hidden = true,
		grade = 3,
		model = 'pd_tahoe18',
		label = '[BOY] Chevy Tahoe 2018',
		groups = {3},
		livery = 1,
		extrason = {1,2,3,5,6,7,8,9,10,11,12},
		extrasoff = {},
		offroad = false
	},

	
	{
		hidden = true,
		grade = 3,
		model = 'pd_ford150',
		label = '[BOY] Ford F150',
		groups = {3},
		livery = 2,
		extrason = {1,2,3,4,5,7,10,12},
		extrasoff = {6,8,9,11},
		--offroad = false
	},

	{
		hidden = true,
		grade = 4,
		model = 'pd_durango',
		label = '[BOY] Dodge Durango 2018',
		groups = {3},
		livery = 2,
		extrason = {1,2,3,4,5,6,7,8,9,10,11},
		extrasoff = {},
		offroad = false
	},

	{
		hidden = true,
		grade = 4,
		model = 'pd_ram16',
		label = '[BOY] Dodge Ram 2500 2017',
		groups = {3},
		livery = 1,
		extrason = {1,2,3,5,6,7,8,9,10,12},
		extrasoff = {11},
		offroad = false
	},

	{
		hidden = true,
		grade = 4,
		model = 'pd_tahoe21',
		label = '[BOY] Chevrolet Tahoe 2021',
		groups = {3},
		livery = 3,
		extrason = {1,2,3,4,5,6,7,8},
		extrasoff = {},
		--offroad = false
	},

	{
		hidden = true,
		grade = 6,
		model = 'pd_colorado',
		label = '[BOY] Chevrolet Colorado',
		groups = {3},
		livery = 1,
		extrason = {1,2,3,4,5,6},
		extrasoff = {},
		offroad = false
	},
	
	--- SEU SASD ---
	{
		hidden = true,
		grade = 3,
		model = 'pd_hellcat',
		label = '[SEU] Dodge Charger Hellcat',
		groups = {4},
		livery = 2,
		extrason = {2,5,6,9},
		extrasoff = {1,3,7,8,10,11,12},
	},
	
	{
		hidden = true,
		grade = 9,
		model = 'pd_zr1',
		label = '[SEU] Chevrolet Corvette ZR1',
		groups = {4},
		livery = 1,
		extrason = {1,2,3,4,5},
		extrasoff = {},
	},
	
	{
		hidden = true,
		grade = 10,
		model = 'pd_c8',
		label = '[SEU] Chevrolet Corvette C8',
		groups = {4},
		livery = 2,
		extrason = {1,2,3,4,5,6},
		extrasoff = {7,8,9},
	},
	
	{
		hidden = true,
		grade = 5,
		model = 'pd_kawasaki',
		label = '[SEU] Ścigacz Kawasaki',
		groups = {4},
		livery = 1,
		extrason = {1,2,3,4},
		extrasoff = {5,6},
	},

	{
		hidden = true,
		grade = 3,
		model = 'pd_bronco',
		label = '[SEU] Ford Bronco',
		groups = {4},
		livery = 2,
		extrason = {1,4,5,6},
		extrasoff = {3},
		--offroad = true
	},

	{
		hidden = true,
		grade = 4,
		model = 'pd_lexus',
		label = '[SEU] Lexus GS350',
		groups = {4},
		livery = 2,
		extrason = {1,2},
		extrasoff = {},
	},

	{
		hidden = true,
		grade = 4,
		model = 'pd_ram16',
		label = '[SEU] Dodge Ram 2500 2017',
		groups = {4},
		livery = 1,
		extrason = {1,2,3,5,6,7,8,9,10,12},
		extrasoff = {11},
		offroad = false
	},
	{
		hidden = true,
		grade = 5,
		model = 'pd_jeep',
		label = '[SEU] Jeep Grand Cherokee',
		groups = {4},
		livery = 1,
		extrason = {2,3,4,5,6,7,8},
		extrasoff = {9,10},
	},
	{
		hidden = true,
		grade = 6,
		model = 'pd_mustang',
		label = '[SEU] Ford Mustang 2019',
		groups = {4},
		livery = 1,
		extrason = {1,2,3,4,5,6,7,8,9},
		extrasoff = {},
	},
	{
		hidden = true,
		grade = 6,
		model = 'pd_raptor',
		label = '[SEU] Ford Raptor',
		groups = {4},
		livery = 1,
		extrason = {3,4,5,6,7,8,9},
		extrasoff = {1,2},
	},
	{
		hidden = true,
		grade = 7,
		model = 'pd_titan17',
		label = '[SEU] Nissan Titan',
		groups = {4},
		livery = 1,
		extrason = {1,2},
		extrasoff = {3},
	},

	{
		hidden = true,
		grade = 7,
		model = 'pd_camaro',
		label = '[SEU] Chevrolet Camaro',
		groups = {4},
		livery = 2,
		extrason = {1,2,3,4},
		extrasoff = {5,6,7,8,9},
	},
	
	{
		hidden = true,
		grade = 8,
		model = 'pd_rangerover',
		label = '[SEU] Range Rover',
		groups = {4},
		livery = 2,
		extrason = {1,2,3,4,5,6,7,8},
		extrasoff = {},
		tint = 1
	},

	{
		hidden = true,
		grade = 13,
		model = 'so_challenger',
		label = '[SEU] Dodge Challanger',
		groups = {4},
		livery = 2,
		extrason = {1,2,3,4,5,6,7,8},
		extrasoff = {},
		tint = 1
	},
}
	
Config.AuthorizedLodzie = {
	{
		grade = 1,
		model = 'pd_boat1',
		label = 'Ponton',
		groups = {1},
		livery = 0,
		extrason = {},
		extrasoff = {},
	},
	{
		grade = 1,
		model = 'pd_boat2',
		label = 'Transportowa',
		groups = {1},
		livery = 0,
		extrason = {},
		extrasoff = {},
	},
	{
		grade = 1,
		model = 'pd_boat3',
		label = 'Skuter Wodny',
		groups = {1},
		livery = 0,
		extrason = {},
		extrasoff = {},
	},
}

Config.Uniforms = {
	probiehp = {
			male = {
				['tshirt_1'] = 189,  ['tshirt_2'] = 0,
				['torso_1'] = 398,   ['torso_2'] = 12,
				['decals_1'] = 0,   ['decals_2'] = 0,
				['arms'] = 4,
				['pants_1'] = 151,   ['pants_2'] = 1,
				['shoes_1'] = 10,   ['shoes_2'] = 0,
				['helmet_1'] = 164,  ['helmet_2'] = 6,
				['chain_1'] = 6,    ['chain_2'] = 0,
				['ears_1'] = -1,     ['ears_2'] = 0,
				['bproof_1'] = 3,  ['bproof_2'] = 0,
				['mask_1'] = 121,   ['mask_2'] = 0,
				['bags_1'] = 0,  ['bags_2'] = 0
			},
			female = {
				['tshirt_1'] = 28,  ['tshirt_2'] = 1,
				['torso_1'] = 419,   ['torso_2'] = 12,
				['decals_1'] = 0,   ['decals_2'] = 0,
				['arms'] = 26,
				['pants_1'] = 121,   ['pants_2'] = 12,
				['shoes_1'] = 25,   ['shoes_2'] = 0,
				['helmet_1'] = 164,  ['helmet_2'] = 2,
				['chain_1'] = 6,    ['chain_2'] = 0,
				['ears_1'] = -1,     ['ears_2'] = 0,
				['bproof_1'] = 0,  ['bproof_2'] = 0,
				['mask_1'] = 121,  ['mask_2'] = 0,
				['bags_1'] = 0,  ['bags_2'] = 0
			}
		},
		officerhp = {
			male = {
				['tshirt_1'] = 189,  ['tshirt_2'] = 0,
				['torso_1'] = 398,   ['torso_2'] = 10,
				['decals_1'] = 0,   ['decals_2'] = 0,
				['arms'] = 4,
				['pants_1'] = 151,   ['pants_2'] = 1,
				['shoes_1'] = 10,   ['shoes_2'] = 0,
				['helmet_1'] = 164,  ['helmet_2'] = 6,
				['chain_1'] = 6,    ['chain_2'] = 0,
				['ears_1'] = -1,     ['ears_2'] = 0,
				['bproof_1'] = 3,  ['bproof_2'] = 0,
				['mask_1'] = 121,   ['mask_2'] = 0,
				['bags_1'] = 0,  ['bags_2'] = 0
			},
			female = {
				['tshirt_1'] = 28,  ['tshirt_2'] = 1,
				['torso_1'] = 422,   ['torso_2'] = 10,
				['decals_1'] = 0,   ['decals_2'] = 0,
				['arms'] = 26,
				['pants_1'] = 121,   ['pants_2'] = 12,
				['shoes_1'] = 25,   ['shoes_2'] = 0,
				['helmet_1'] = 164,  ['helmet_2'] = 2,
				['chain_1'] = 6,    ['chain_2'] = 0,
				['ears_1'] = -1,     ['ears_2'] = 0,
				['bproof_1'] = 0,  ['bproof_2'] = 0,
				['mask_1'] = 121,  ['mask_2'] = 0,
				['bags_1'] = 0,  ['bags_2'] = 0
			}
		},
		sergeanthp = {
			male = {
				['tshirt_1'] = 75,  ['tshirt_2'] = 3,
				['torso_1'] = 289,   ['torso_2'] = 11,
				['decals_1'] = 0,   ['decals_2'] = 0,
				['arms'] = 1,
				['pants_1'] = 114,   ['pants_2'] = 12,
				['shoes_1'] = 25,   ['shoes_2'] = 0,
				['helmet_1'] = 164,  ['helmet_2'] = 6,
				['chain_1'] = 1,    ['chain_2'] = 0,
				['ears_1'] = -1,     ['ears_2'] = 0,
				['bproof_1'] = 72,  ['bproof_2'] = 0,
				['mask_1'] = 121,   ['mask_2'] = 0,
				['bags_1'] = 0,  ['bags_2'] = 0
			},
			female = {
				['tshirt_1'] = 28,  ['tshirt_2'] = 1,
				['torso_1'] = 428,   ['torso_2'] = 13,
				['decals_1'] = 0,   ['decals_2'] = 0,
				['arms'] = 21,
				['pants_1'] = 121,   ['pants_2'] = 12,
				['shoes_1'] = 25,   ['shoes_2'] = 0,
				['helmet_1'] = 164,  ['helmet_2'] = 2,
				['chain_1'] = 6,    ['chain_2'] = 0,
				['ears_1'] = -1,     ['ears_2'] = 0,
				['bproof_1'] = 0,  ['bproof_2'] = 0,
				['mask_1'] = 121,  ['mask_2'] = 0,
				['bags_1'] = 0,  ['bags_2'] = 0
			}
		},
		lieutenanthp = {
			male = {
				['tshirt_1'] = 15,  ['tshirt_2'] = 0,
				['torso_1'] = 409,   ['torso_2'] = 9,
				['decals_1'] = 0,   ['decals_2'] = 0,
				['arms'] = 4,
				['pants_1'] = 114,   ['pants_2'] = 12,
				['shoes_1'] = 25,   ['shoes_2'] = 0,
				['helmet_1'] = 108,  ['helmet_2'] = 13,
				['chain_1'] = 6,    ['chain_2'] = 0,
				['ears_1'] = -1,     ['ears_2'] = 0,
				['bproof_1'] = 0,  ['bproof_2'] = 0,
				['mask_1'] = 121,   ['mask_2'] = 0,
				['bags_1'] = 0,  ['bags_2'] = 0
			},
			female = {
				['tshirt_1'] = 28,  ['tshirt_2'] = 1,
				['torso_1'] = 421,   ['torso_2'] = 2,
				['decals_1'] = 0,   ['decals_2'] = 0,
				['arms'] = 23,
				['pants_1'] = 121,   ['pants_2'] = 12,
				['shoes_1'] = 25,   ['shoes_2'] = 0,
				['helmet_1'] = 164,  ['helmet_2'] = 2,
				['chain_1'] = 6,    ['chain_2'] = 0,
				['ears_1'] = -1,     ['ears_2'] = 0,
				['bproof_1'] = 0,  ['bproof_2'] = 0,
				['mask_1'] = 121,  ['mask_2'] = 0,
				['bags_1'] = 0,  ['bags_2'] = 0
			}
		},
		captainhp = {
			male = {
				['tshirt_1'] = 192,  ['tshirt_2'] = 0,
				['torso_1'] = 288,   ['torso_2'] = 7,
				['decals_1'] = 0,   ['decals_2'] = 0,
				['arms'] = 4,
				['pants_1'] = 114,   ['pants_2'] = 12,
				['shoes_1'] = 25,   ['shoes_2'] = 0,
				['helmet_1'] = 108,  ['helmet_2'] = 13,
				['chain_1'] = 6,    ['chain_2'] = 0,
				['ears_1'] = -1,     ['ears_2'] = 0,
				['bproof_1'] = 89,  ['bproof_2'] = 0,
				['mask_1'] = 121,   ['mask_2'] = 0,
				['bags_1'] = 0,  ['bags_2'] = 0
			},
			female = {
				['tshirt_1'] = 28,  ['tshirt_2'] = 1,
				['torso_1'] = 423,   ['torso_2'] = 14,
				['decals_1'] = 0,   ['decals_2'] = 0,
				['arms'] = 31,
				['pants_1'] = 121,   ['pants_2'] = 12,
				['shoes_1'] = 25,   ['shoes_2'] = 0,
				['helmet_1'] = 164,  ['helmet_2'] = 2,
				['chain_1'] = 6,    ['chain_2'] = 0,
				['ears_1'] = -1,     ['ears_2'] = 0,
				['bproof_1'] = 0,  ['bproof_2'] = 0,
				['mask_1'] = 121,  ['mask_2'] = 0,
				['bags_1'] = 0,  ['bags_2'] = 0
			}
		},
		officialhp = {
			male = {
				['tshirt_1'] = 15,  ['tshirt_2'] = 0,
				['torso_1'] = 404,   ['torso_2'] = 2,
				['decals_1'] = 0,   ['decals_2'] = 0,
				['arms'] = 77,
				['pants_1'] = 151,   ['pants_2'] = 1,
				['shoes_1'] = 10,   ['shoes_2'] = 0,
				['helmet_1'] = 166,  ['helmet_2'] = 2,
				['chain_1'] = 0,    ['chain_2'] = 0,
				['ears_1'] = -1,     ['ears_2'] = 0,
				['bproof_1'] = 0,  ['bproof_2'] = 0,
				['mask_1'] = 0,   ['mask_2'] = 0,
				['bags_1'] = 0,   ['bags_2'] = 0
			},
			female = {
				['tshirt_1'] = 6,  ['tshirt_2'] = 0,
				['torso_1'] = 427,   ['torso_2'] = 2,
				['decals_1'] = 0,   ['decals_2'] = 0,
				['arms'] = 88,
				['pants_1'] = 52,   ['pants_2'] = 2,
				['shoes_1'] = 29,   ['shoes_2'] = 0,
				['helmet_1'] = 164,  ['helmet_2'] = 2,
				['chain_1'] = 0,    ['chain_2'] = 0,
				['ears_1'] = -1,     ['ears_2'] = 0,
				['bproof_1'] = 0,  ['bproof_2'] = 0,
				['bags_1'] = 0,  ['bags_2'] = 0,
				['mask_1'] = 0,  ['mask_2'] = 0
			}
		},
		dtu = {
			male = {
				['tshirt_1'] = 15,  ['tshirt_2'] = 0,
				['torso_1'] = 502,   ['torso_2'] = 4,
				['decals_1'] = 0,   ['decals_2'] = 0,
				['arms'] = 29,
				['pants_1'] = 160,   ['pants_2'] = 2,
				['shoes_1'] = 14,   ['shoes_2'] = 0,
				['helmet_1'] = 109,  ['helmet_2'] = 3,
				['chain_1'] = 1,    ['chain_2'] = 0,
				['ears_1'] = -1,     ['ears_2'] = 0,
				['bproof_1'] = 68,  ['bproof_2'] = 6,
				['mask_1'] = 169,   ['mask_2'] = 0,
				['bags_1'] = 0,  ['bags_2'] = 0
			},
			female = {
				['tshirt_1'] = 35,  ['tshirt_2'] = 0,
				['torso_1'] = 48,   ['torso_2'] = 0,
				['decals_1'] = 0,   ['decals_2'] = 0,
				['arms'] = 44,
				['pants_1'] = 3,   ['pants_2'] = 3,
				['shoes_1'] = 25,   ['shoes_2'] = 0,
				['helmet_1'] = 1,  ['helmet_2'] = 0,
				['chain_1'] = 8,    ['chain_2'] = 0,
				['ears_1'] = -1,     ['ears_2'] = 0,
				['bproof_1'] = 19,  ['bproof_2'] = 4
			}
		},
		dtu1 = {
			male = {
				['tshirt_1'] = 141,  ['tshirt_2'] = 0,
				['torso_1'] = 519,   ['torso_2'] = 0,
				['decals_1'] = 0,   ['decals_2'] = 0,
				['arms'] = 4,
				['pants_1'] = 160,   ['pants_2'] = 2,
				['shoes_1'] = 105,   ['shoes_2'] = 3,
				['helmet_1'] = -1,  ['helmet_2'] = 0,
				['chain_1'] = 1,    ['chain_2'] = 0,
				['ears_1'] = -1,     ['ears_2'] = 0,
				['bproof_1'] = 68,  ['bproof_2'] = 6,
				['mask_1'] = 169,   ['mask_2'] = 0,
				['bags_1'] = 0,  ['bags_2'] = 0
			},
			female = {
				['tshirt_1'] = 35,  ['tshirt_2'] = 0,
				['torso_1'] = 48,   ['torso_2'] = 0,
				['decals_1'] = 0,   ['decals_2'] = 0,
				['arms'] = 44,
				['pants_1'] = 3,   ['pants_2'] = 3,
				['shoes_1'] = 25,   ['shoes_2'] = 0,
				['helmet_1'] = 1,  ['helmet_2'] = 0,
				['chain_1'] = 8,    ['chain_2'] = 0,
				['ears_1'] = -1,     ['ears_2'] = 0,
				['bproof_1'] = 19,  ['bproof_2'] = 4
			}
		},
		dtu2 = {
			male = {
				['tshirt_1'] = 15,  ['tshirt_2'] = 0,
				['torso_1'] = 426,   ['torso_2'] = 0,
				['decals_1'] = 0,   ['decals_2'] = 0,
				['arms'] = 4,
				['pants_1'] = 28,   ['pants_2'] = 0,
				['shoes_1'] = 21,   ['shoes_2'] = 0,
				['helmet_1'] = -1,  ['helmet_2'] = 0,
				['chain_1'] = 1,    ['chain_2'] = 0,
				['ears_1'] = -1,     ['ears_2'] = 0,
				['bproof_1'] = 68,  ['bproof_2'] = 6,
				['mask_1'] = 121,   ['mask_2'] = 0,
				['bags_1'] = 0,  ['bags_2'] = 0
			},
			female = {
				['tshirt_1'] = 35,  ['tshirt_2'] = 0,
				['torso_1'] = 48,   ['torso_2'] = 0,
				['decals_1'] = 0,   ['decals_2'] = 0,
				['arms'] = 44,
				['pants_1'] = 3,   ['pants_2'] = 3,
				['shoes_1'] = 25,   ['shoes_2'] = 0,
				['helmet_1'] = 1,  ['helmet_2'] = 0,
				['chain_1'] = 8,    ['chain_2'] = 0,
				['ears_1'] = -1,     ['ears_2'] = 0,
				['bproof_1'] = 19,  ['bproof_2'] = 4
			}
		},
		dtu3 = {
			male = {
				['tshirt_1'] = 15,  ['tshirt_2'] = 0,
				['torso_1'] = 433,   ['torso_2'] = 6,
				['decals_1'] = 0,   ['decals_2'] = 0,
				['arms'] = 8,
				['pants_1'] = 156,   ['pants_2'] = 0,
				['shoes_1'] = 105,   ['shoes_2'] = 3,
				['helmet_1'] = -1,  ['helmet_2'] = 0,
				['chain_1'] = 1,    ['chain_2'] = 0,
				['ears_1'] = -1,     ['ears_2'] = 0,
				['bproof_1'] = 68,  ['bproof_2'] = 6,
				['mask_1'] = 169,   ['mask_2'] = 0,
				['bags_1'] = 0,  ['bags_2'] = 0
			},
			female = {
				['tshirt_1'] = 35,  ['tshirt_2'] = 0,
				['torso_1'] = 48,   ['torso_2'] = 0,
				['decals_1'] = 0,   ['decals_2'] = 0,
				['arms'] = 44,
				['pants_1'] = 3,   ['pants_2'] = 3,
				['shoes_1'] = 25,   ['shoes_2'] = 0,
				['helmet_1'] = 1,  ['helmet_2'] = 0,
				['chain_1'] = 8,    ['chain_2'] = 0,
				['ears_1'] = -1,     ['ears_2'] = 0,
				['bproof_1'] = 19,  ['bproof_2'] = 4
			}
		},
		dtu4 = {
			male = {
				['tshirt_1'] = 15,  ['tshirt_2'] = 0,
				['torso_1'] = 438,   ['torso_2'] = 0,
				['decals_1'] = 0,   ['decals_2'] = 0,
				['arms'] = 0,
				['pants_1'] = 160,   ['pants_2'] = 2,
				['shoes_1'] = 86,   ['shoes_2'] = 1,
				['helmet_1'] = -1,  ['helmet_2'] = 0,
				['chain_1'] = 1,    ['chain_2'] = 0,
				['ears_1'] = -1,     ['ears_2'] = 0,
				['bproof_1'] = 68,  ['bproof_2'] = 6,
				['mask_1'] = 169,   ['mask_2'] = 1,
				['bags_1'] = 0,  ['bags_2'] = 0
			},
			female = {
				['tshirt_1'] = 35,  ['tshirt_2'] = 0,
				['torso_1'] = 48,   ['torso_2'] = 0,
				['decals_1'] = 0,   ['decals_2'] = 0,
				['arms'] = 44,
				['pants_1'] = 3,   ['pants_2'] = 3,
				['shoes_1'] = 25,   ['shoes_2'] = 0,
				['helmet_1'] = 1,  ['helmet_2'] = 0,
				['chain_1'] = 8,    ['chain_2'] = 0,
				['ears_1'] = -1,     ['ears_2'] = 0,
				['bproof_1'] = 19,  ['bproof_2'] = 4
			}
		},
		dtu6 = {
			male = {
				['tshirt_1'] = 15,  ['tshirt_2'] = 0,
				['torso_1'] = 205,   ['torso_2'] = 0,
				['decals_1'] = 0,   ['decals_2'] = 0,
				['arms'] = 2,
				['pants_1'] = 6,   ['pants_2'] = 1,
				['shoes_1'] = 14,   ['shoes_2'] = 0,
				['helmet_1'] = 9,  ['helmet_2'] = 4,
				['chain_1'] = 1,    ['chain_2'] = 0,
				['ears_1'] = -1,     ['ears_2'] = 0,
				['bproof_1'] = 59,  ['bproof_2'] = 9,
				['mask_1'] = 169,   ['mask_2'] = 1,
				['bags_1'] = 0,  ['bags_2'] = 0
			},
			female = {
				['tshirt_1'] = 35,  ['tshirt_2'] = 0,
				['torso_1'] = 48,   ['torso_2'] = 0,
				['decals_1'] = 0,   ['decals_2'] = 0,
				['arms'] = 44,
				['pants_1'] = 3,   ['pants_2'] = 3,
				['shoes_1'] = 25,   ['shoes_2'] = 0,
				['helmet_1'] = 1,  ['helmet_2'] = 0,
				['chain_1'] = 8,    ['chain_2'] = 0,
				['ears_1'] = -1,     ['ears_2'] = 0,
				['bproof_1'] = 19,  ['bproof_2'] = 4
			}
		},
		dtu7 = {
			male = {
				['tshirt_1'] = 39,  ['tshirt_2'] = 0,
				['torso_1'] = 111,   ['torso_2'] = 3,
				['decals_1'] = 0,   ['decals_2'] = 0,
				['arms'] = 4,
				['pants_1'] = 114,   ['pants_2'] = 0,
				['shoes_1'] = 25,   ['shoes_2'] = 0,
				['helmet_1'] = 142,  ['helmet_2'] = 0,
				['chain_1'] = 1,    ['chain_2'] = 0,
				['ears_1'] = -1,     ['ears_2'] = 0,
				['bproof_1'] = 64,  ['bproof_2'] = 3,
				['mask_1'] = 169,   ['mask_2'] = 0,
				['bags_1'] = 0,  ['bags_2'] = 0
			},
			female = {
				['tshirt_1'] = 35,  ['tshirt_2'] = 0,
				['torso_1'] = 48,   ['torso_2'] = 0,
				['decals_1'] = 0,   ['decals_2'] = 0,
				['arms'] = 44,
				['pants_1'] = 3,   ['pants_2'] = 3,
				['shoes_1'] = 25,   ['shoes_2'] = 0,
				['helmet_1'] = 1,  ['helmet_2'] = 0,
				['chain_1'] = 8,    ['chain_2'] = 0,
				['ears_1'] = -1,     ['ears_2'] = 0,
				['bproof_1'] = 19,  ['bproof_2'] = 4
			}
		},
		nat_wear1 = {
			male = {
				['tshirt_1'] = 32,  ['tshirt_2'] = 0,
				['torso_1'] = 294,   ['torso_2'] = 0,
				['decals_1'] = 0,   ['decals_2'] = 0,
				['arms'] = 33,
				['pants_1'] = 24,   ['pants_2'] = 0,
				['shoes_1'] = 10,   ['shoes_2'] = 0,
				['helmet_1'] = -1,  ['helmet_2'] = 0,
				['chain_1'] = 125,    ['chain_2'] = 0,
				['ears_1'] = -1,     ['ears_2'] = 0,
				['bproof_1'] = 0,  ['bproof_2'] = 0,
				['mask_1'] = 113,   ['mask_2'] = 11,
				['bags_1'] = 0,  ['bags_2'] = 0
			},
			female = {
				['tshirt_1'] = 35,  ['tshirt_2'] = 0,
				['torso_1'] = 48,   ['torso_2'] = 0,
				['decals_1'] = 0,   ['decals_2'] = 0,
				['arms'] = 44,
				['pants_1'] = 3,   ['pants_2'] = 3,
				['shoes_1'] = 25,   ['shoes_2'] = 0,
				['helmet_1'] = 1,  ['helmet_2'] = 0,
				['chain_1'] = 8,    ['chain_2'] = 0,
				['ears_1'] = -1,     ['ears_2'] = 0,
				['bproof_1'] = 19,  ['bproof_2'] = 4
			}
		},
		sa_wear1 = {
			male = {
				['tshirt_1'] = 20,  ['tshirt_2'] = 0,
				['torso_1'] = 395,   ['torso_2'] = 1,
				['decals_1'] = 0,   ['decals_2'] = 0,
				['arms'] = 33,
				['pants_1'] = 24,   ['pants_2'] = 0,
				['shoes_1'] = 10,   ['shoes_2'] = 0,
				['helmet_1'] = -1,  ['helmet_2'] = 0,
				['chain_1'] = 10,    ['chain_2'] = 0,
				['ears_1'] = -1,     ['ears_2'] = 0,
				['bproof_1'] = 0,  ['bproof_2'] = 0,
				['mask_1'] = 57,   ['mask_2'] = 0,
				['bags_1'] = 0,  ['bags_2'] = 0
			},
			female = {
				['tshirt_1'] = 35,  ['tshirt_2'] = 0,
				['torso_1'] = 48,   ['torso_2'] = 0,
				['decals_1'] = 0,   ['decals_2'] = 0,
				['arms'] = 44,
				['pants_1'] = 3,   ['pants_2'] = 3,
				['shoes_1'] = 25,   ['shoes_2'] = 0,
				['helmet_1'] = -1,  ['helmet_2'] = 0,
				['chain_1'] = 8,    ['chain_2'] = 0,
				['ears_1'] = -1,     ['ears_2'] = 0,
				['bproof_1'] = 19,  ['bproof_2'] = 4
			}
		},
		ma_wear1 = {
			male = {
				['tshirt_1'] = 20,  ['tshirt_2'] = 0,
				['torso_1'] = 395,   ['torso_2'] = 1,
				['decals_1'] = 0,   ['decals_2'] = 0,
				['arms'] = 33,
				['pants_1'] = 24,   ['pants_2'] = 0,
				['shoes_1'] = 10,   ['shoes_2'] = 0,
				['helmet_1'] = -1,  ['helmet_2'] = 0,
				['chain_1'] = 10,    ['chain_2'] = 0,
				['ears_1'] = -1,     ['ears_2'] = 0,
				['bproof_1'] = 0,  ['bproof_2'] = 0,
				['mask_1'] = 57,   ['mask_2'] = 0,
				['bags_1'] = 0,  ['bags_2'] = 0
			},
			female = {
				['tshirt_1'] = 35,  ['tshirt_2'] = 0,
				['torso_1'] = 48,   ['torso_2'] = 0,
				['decals_1'] = 0,   ['decals_2'] = 0,
				['arms'] = 44,
				['pants_1'] = 3,   ['pants_2'] = 3,
				['shoes_1'] = 25,   ['shoes_2'] = 0,
				['helmet_1'] = 1,  ['helmet_2'] = 0,
				['chain_1'] = 8,    ['chain_2'] = 0,
				['ears_1'] = -1,     ['ears_2'] = 0,
				['bproof_1'] = 19,  ['bproof_2'] = 4
			}
		},
		dd_wear1 = {
			male = {
				['tshirt_1'] = 20,  ['tshirt_2'] = 0,
				['torso_1'] = 395,   ['torso_2'] = 1,
				['decals_1'] = 0,   ['decals_2'] = 0,
				['arms'] = 33,
				['pants_1'] = 24,   ['pants_2'] = 0,
				['shoes_1'] = 10,   ['shoes_2'] = 0,
				['helmet_1'] = -1,  ['helmet_2'] = 0,
				['chain_1'] = 10,    ['chain_2'] = 0,
				['ears_1'] = -1,     ['ears_2'] = 0,
				['bproof_1'] = 0,  ['bproof_2'] = 0,
				['mask_1'] = 57,   ['mask_2'] = 0,
				['bags_1'] = 0,  ['bags_2'] = 0
			},
			female = {
				['tshirt_1'] = 35,  ['tshirt_2'] = 0,
				['torso_1'] = 48,   ['torso_2'] = 0,
				['decals_1'] = 0,   ['decals_2'] = 0,
				['arms'] = 44,
				['pants_1'] = 3,   ['pants_2'] = 3,
				['shoes_1'] = 25,   ['shoes_2'] = 0,
				['helmet_1'] = 1,  ['helmet_2'] = 0,
				['chain_1'] = 8,    ['chain_2'] = 0,
				['ears_1'] = -1,     ['ears_2'] = 0,
				['bproof_1'] = 19,  ['bproof_2'] = 4
			}
		},
		fib_patrol2 = {
			male = {
				['tshirt_1'] = 37,  ['tshirt_2'] = 0,
				['torso_1'] = 289,   ['torso_2'] = 2,
				['decals_1'] = 0,   ['decals_2'] = 0,
				['arms'] = 41,
				['pants_1'] = 114,   ['pants_2'] = 4,
				['shoes_1'] = 25,   ['shoes_2'] = 0,
				['helmet_1'] = -1,  ['helmet_2'] = 0,
				['chain_1'] = 13,    ['chain_2'] = 0,
				['ears_1'] = -1,     ['ears_2'] = 0,
				['bproof_1'] = 0,  ['bproof_2'] = 0,
				['mask_1'] = 121,   ['mask_2'] = 0,
				['bags_1'] = 0,  ['bags_2'] = 0
			},
			female = {
				['tshirt_1'] = 35,  ['tshirt_2'] = 0,
				['torso_1'] = 48,   ['torso_2'] = 0,
				['decals_1'] = 0,   ['decals_2'] = 0,
				['arms'] = 44,
				['pants_1'] = 3,   ['pants_2'] = 3,
				['shoes_1'] = 25,   ['shoes_2'] = 0,
				['helmet_1'] = -1,  ['helmet_2'] = 0,
				['chain_1'] = 8,    ['chain_2'] = 0,
				['ears_1'] = -1,     ['ears_2'] = 0,
				['bproof_1'] = 19,  ['bproof_2'] = 4
			}
		},
		fib_patrol3 = {
			male = {
				['tshirt_1'] = 37,  ['tshirt_2'] = 0,
				['torso_1'] = 289,   ['torso_2'] = 2,
				['decals_1'] = 0,   ['decals_2'] = 0,
				['arms'] = 41,
				['pants_1'] = 114,   ['pants_2'] = 4,
				['shoes_1'] = 25,   ['shoes_2'] = 0,
				['helmet_1'] = -1,  ['helmet_2'] = 0,
				['chain_1'] = 13,    ['chain_2'] = 0,
				['ears_1'] = -1,     ['ears_2'] = 0,
				['bproof_1'] = 0,  ['bproof_2'] = 0,
				['mask_1'] = 121,   ['mask_2'] = 0,
				['bags_1'] = 0,  ['bags_2'] = 0
			},
			female = {
				['tshirt_1'] = 35,  ['tshirt_2'] = 0,
				['torso_1'] = 48,   ['torso_2'] = 0,
				['decals_1'] = 0,   ['decals_2'] = 0,
				['arms'] = 44,
				['pants_1'] = 3,   ['pants_2'] = 3,
				['shoes_1'] = 25,   ['shoes_2'] = 0,
				['helmet_1'] = 1,  ['helmet_2'] = 0,
				['chain_1'] = 8,    ['chain_2'] = 0,
				['ears_1'] = -1,     ['ears_2'] = 0,
				['bproof_1'] = 19,  ['bproof_2'] = 4
			}
		},
		fib_patrol4 = {
			male = {
				['tshirt_1'] = 37,  ['tshirt_2'] = 0,
				['torso_1'] = 289,   ['torso_2'] = 2,
				['decals_1'] = 0,   ['decals_2'] = 0,
				['arms'] = 41,
				['pants_1'] = 114,   ['pants_2'] = 4,
				['shoes_1'] = 25,   ['shoes_2'] = 0,
				['helmet_1'] = -1,  ['helmet_2'] = 0,
				['chain_1'] = 13,    ['chain_2'] = 0,
				['ears_1'] = -1,     ['ears_2'] = 0,
				['bproof_1'] = 0,  ['bproof_2'] = 0,
				['mask_1'] = 121,   ['mask_2'] = 0,
				['bags_1'] = 0,  ['bags_2'] = 0
			},
			female = {
				['tshirt_1'] = 35,  ['tshirt_2'] = 0,
				['torso_1'] = 48,   ['torso_2'] = 0,
				['decals_1'] = 0,   ['decals_2'] = 0,
				['arms'] = 44,
				['pants_1'] = 3,   ['pants_2'] = 3,
				['shoes_1'] = 25,   ['shoes_2'] = 0,
				['helmet_1'] = 1,  ['helmet_2'] = 0,
				['chain_1'] = 8,    ['chain_2'] = 0,
				['ears_1'] = -1,     ['ears_2'] = 0,
				['bproof_1'] = 19,  ['bproof_2'] = 4
			}
		},
		recruit_wear = {
			male = {
				['tshirt_1'] = 191,  ['tshirt_2'] = 0,
				['torso_1'] = 396,   ['torso_2'] = 7,
				['decals_1'] = 130,   ['decals_2'] = 0,
				['arms'] = 11,
				['pants_1'] = 145,   ['pants_2'] = 3,
				['shoes_1'] = 25,   ['shoes_2'] = 0,
				['helmet_1'] = 164,  ['helmet_2'] = 0,
				['chain_1'] = 6,    ['chain_2'] = 0,
				['ears_1'] = -1,     ['ears_2'] = 0,
				['bproof_1'] = 67,  ['bproof_2'] = 0,
				['mask_1'] = 121,   ['mask_2'] = 0,
				['bags_1'] = 101,  ['bags_2'] = 2
			},
			female = {
				['tshirt_1'] = 237,  ['tshirt_2'] = 1,
				['torso_1'] = 418,   ['torso_2'] = 7,
				['decals_1'] = 140,   ['decals_2'] = 0,
				['arms'] = 14,
				['pants_1'] = 152,   ['pants_2'] = 3,
				['shoes_1'] = 25,   ['shoes_2'] = 0,
				['helmet_1'] = 163,  ['helmet_2'] = 0,
				['chain_1'] = 6,    ['chain_2'] = 0,
				['ears_1'] = -1,     ['ears_2'] = 0,
				['bproof_1'] = 66,  ['bproof_2'] = 0,
				['mask_1'] = 11,    ['mask_2'] = 0,
				['bags_1'] = 101,  ['bags_2'] = 2
			}
		},
		probie_wear = {
			male = {
				['tshirt_1'] = 58,  ['tshirt_2'] = 0,
				['torso_1'] = 55,   ['torso_2'] = 0,
				['decals_1'] = 0,   ['decals_2'] = 0,
				['arms'] = 41,
				['pants_1'] = 35,   ['pants_2'] = 0,
				['shoes_1'] = 51,   ['shoes_2'] = 0,
				['helmet_1'] = 1,  ['helmet_2'] = 0,
				['chain_1'] = 6,    ['chain_2'] = 0,
				['ears_1'] = -1,     ['ears_2'] = 0,
				['bproof_1'] = 66,  ['bproof_2'] = 1,
				['mask_1'] = 0,   ['mask_2'] = 0,
				['bags_1'] = 0,  ['bags_2'] = 0
			},
			female = {
				['tshirt_1'] = 35,  ['tshirt_2'] = 0,
				['torso_1'] = 48,   ['torso_2'] = 0,
				['decals_1'] = 0,   ['decals_2'] = 0,
				['arms'] = 44,
				['pants_1'] = 3,   ['pants_2'] = 3,
				['shoes_1'] = 25,   ['shoes_2'] = 0,
				['helmet_1'] = 1,  ['helmet_2'] = 0,
				['chain_1'] = 8,    ['chain_2'] = 0,
				['ears_1'] = -1,     ['ears_2'] = 0,
				['bproof_1'] = 19,  ['bproof_2'] = 3,
				['mask_1'] = 0,   ['mask_2'] = 0,
				['bags_1'] = 0,  ['bags_2'] = 0
			}
		},
						 --- OFFICER KRÓTKI ---
			officer_wear = {
				male = {
					['tshirt_1'] = 191,  ['tshirt_2'] = 0,
					['torso_1'] = 396,   ['torso_2'] = 7,
					['decals_1'] = 130,   ['decals_2'] = 0,
					['arms'] = 11,
					['pants_1'] = 145,   ['pants_2'] = 3,
					['shoes_1'] = 25,   ['shoes_2'] = 0,
					['helmet_1'] = 164,  ['helmet_2'] = 0,
					['chain_1'] = 6,    ['chain_2'] = 0,
					['ears_1'] = -1,     ['ears_2'] = 0,
					['bproof_1'] = 74,  ['bproof_2'] = 0,
					['mask_1'] = 121,   ['mask_2'] = 0,
					['bags_1'] = 101,  ['bags_2'] = 2
				},
				female = {
					['tshirt_1'] = 237,  ['tshirt_2'] = 1,
					['torso_1'] = 418,   ['torso_2'] = 7,
					['decals_1'] = 140,   ['decals_2'] = 0,
					['arms'] = 14,
					['pants_1'] = 152,   ['pants_2'] = 3,
					['shoes_1'] = 25,   ['shoes_2'] = 0,
					['helmet_1'] = 163,  ['helmet_2'] = 0,
					['chain_1'] = 6,    ['chain_2'] = 0,
					['ears_1'] = -1,     ['ears_2'] = 0,
					['bproof_1'] = 69,  ['bproof_2'] = 0,
					['mask_1'] = 11,    ['mask_2'] = 0,
					['bags_1'] = 101,  ['bags_2'] = 2
				}
		},
		recruit2_wear = {
			male = {
				['tshirt_1'] = 191,  ['tshirt_2'] = 0,
				['torso_1'] = 398,   ['torso_2'] = 2,
				['decals_1'] = 0,   ['decals_2'] = 0,
				['arms'] = 1,
				['pants_1'] = 145,   ['pants_2'] = 1,
				['shoes_1'] = 25,   ['shoes_2'] = 0,
				['helmet_1'] = 164,  ['helmet_2'] = 2,
				['chain_1'] = 6,    ['chain_2'] = 0,
				['ears_1'] = -1,     ['ears_2'] = 0,
				['bproof_1'] = 67,  ['bproof_2'] = 1
			},
			female = {
				['tshirt_1'] = 237,  ['tshirt_2'] = 0,
				['torso_1'] = 418,   ['torso_2'] = 2,
				['decals_1'] = 140,   ['decals_2'] = 0,
				['arms'] = 14,
				['pants_1'] = 152,   ['pants_2'] = 1,
				['shoes_1'] = 25,   ['shoes_2'] = 0,
				['helmet_1'] = 163,  ['helmet_2'] = 3,
				['chain_1'] = 6,    ['chain_2'] = 0,
				['ears_1'] = -1,     ['ears_2'] = 0,
				['bproof_1'] = 66,  ['bproof_2'] = 1,
				['mask_1'] = 11,    ['mask_2'] = 0,
				['bags_1'] = 100,  ['bags_2'] = 0
			}
		},
		deputy_wear = {
				male = {
					['tshirt_1'] = 191,  ['tshirt_2'] = 0,
					['torso_1'] = 396,   ['torso_2'] = 2,
					['decals_1'] = 130,   ['decals_2'] = 0,
					['arms'] = 11,
					['pants_1'] = 145,   ['pants_2'] = 1,
					['shoes_1'] = 25,   ['shoes_2'] = 0,
					['helmet_1'] = 164,  ['helmet_2'] = 2,
					['chain_1'] = 6,    ['chain_2'] = 0,
					['ears_1'] = -1,     ['ears_2'] = 0,
					['bproof_1'] = 74,  ['bproof_2'] = 0,
					['mask_1'] = 121,   ['mask_2'] = 0,
					['bags_1'] = 100,  ['bags_2'] = 0
				},
				female = {
					['tshirt_1'] = 237,  ['tshirt_2'] = 0,
					['torso_1'] = 418,   ['torso_2'] = 2,
					['decals_1'] = 140,   ['decals_2'] = 0,
					['arms'] = 14,
					['pants_1'] = 152,   ['pants_2'] = 1,
					['shoes_1'] = 25,   ['shoes_2'] = 0,
					['helmet_1'] = 163,  ['helmet_2'] = 3,
					['chain_1'] = 6,    ['chain_2'] = 0,
					['ears_1'] = -1,     ['ears_2'] = 0,
					['bproof_1'] = 69,  ['bproof_2'] = 0,
					['mask_1'] = 11,    ['mask_2'] = 0,
					['bags_1'] = 100,  ['bags_2'] = 0
				}
		},
							 
			--- OFFICER DŁUGI ---
		officer_wear2 = {
				male = {
					['tshirt_1'] = 191,  ['tshirt_2'] = 0,
					['torso_1'] = 398,   ['torso_2'] = 7,
					['decals_1'] = 131,   ['decals_2'] = 0,
					['arms'] = 4,
					['pants_1'] = 145,   ['pants_2'] = 3,
					['shoes_1'] = 25,   ['shoes_2'] = 0,
					['helmet_1'] = 164,  ['helmet_2'] = 0,
					['chain_1'] = 6,    ['chain_2'] = 0,
					['ears_1'] = -1,     ['ears_2'] = 0,
					['bproof_1'] = 74,  ['bproof_2'] = 0,
					['mask_1'] = 121,   ['mask_2'] = 0,
					['bags_1'] = 101,  ['bags_2'] = 2
				},
				female = {
					['tshirt_1'] = 237,  ['tshirt_2'] = 1,
					['torso_1'] = 419,   ['torso_2'] = 7,
					['decals_1'] = 141,   ['decals_2'] = 0,
					['arms'] = 14,
					['pants_1'] = 152,   ['pants_2'] = 3,
					['shoes_1'] = 25,   ['shoes_2'] = 0,
					['helmet_1'] = 163,  ['helmet_2'] = 0,
					['chain_1'] = 6,    ['chain_2'] = 0,
					['ears_1'] = -1,     ['ears_2'] = 0,
					['bproof_1'] = 69,  ['bproof_2'] = 0,
					['mask_1'] = 11,    ['mask_2'] = 0,
					['bags_1'] = 101,  ['bags_2'] = 2
				}
		},
		deputy_wear2 = {
				male = {
					['tshirt_1'] = 189,  ['tshirt_2'] = 0,
					['torso_1'] = 398,   ['torso2'] = 2,
					['decals'] = 8,   ['decals_2'] = 0,
					['arms'] = 1,
					['pants_1'] = 145,   ['pants_2'] = 1,
					['shoes_1'] = 25,   ['shoes_2'] = 0,
					['helmet_1'] = 164,  ['helmet_2'] = 2,
					['chain_1'] = 6,    ['chain_2'] = 0,
					['ears_1'] = -1,     ['ears_2'] = 0,
					['bproof_1'] = 2,  ['bproof_2'] = 0,
					['mask_1'] = 121,   ['mask_2'] = 0,
					['bags_1'] = 100,  ['bags_2'] = 0
				},
				female = {
					['tshirt_1'] = 237,  ['tshirt_2'] = 0,
					['torso_1'] = 419,   ['torso_2'] = 2,
					['decals_1'] = 141,   ['decals_2'] = 0,
					['arms'] = 14,
					['pants_1'] = 152,   ['pants_2'] = 1,
					['shoes_1'] = 25,   ['shoes_2'] = 0,
					['helmet_1'] = 163,  ['helmet_2'] = 3,
					['chain_1'] = 6,    ['chain_2'] = 0,
					['ears_1'] = -1,     ['ears_2'] = 0,
					['bproof_1'] = 69,  ['bproof_2'] = 0,
					['mask_1'] = 11,    ['mask_2'] = 0,
					['bags_1'] = 100,  ['bags_2'] = 0
				}
		},
	
				--- OFICER DŁUGI KRAWAT ---
				officer_wear3 = {
				male = {
					['tshirt_1'] = 191,  ['tshirt_2'] = 0,
					['torso_1'] = 399,   ['torso_2'] = 7,
					['decals_1'] = 131,   ['decals_2'] = 0,
					['arms'] = 4,
					['pants_1'] = 145,   ['pants_2'] = 3,
					['shoes_1'] = 25,   ['shoes_2'] = 0,
					['helmet_1'] = 164,  ['helmet_2'] = 0,
					['chain_1'] = 6,    ['chain_2'] = 0,
					['ears_1'] = -1,     ['ears_2'] = 0,
					['bproof_1'] = 74,  ['bproof_2'] = 0,
					['mask_1'] = 121,   ['mask_2'] = 0,
					['bags_1'] = 101,  ['bags_2'] = 2
				},
				female = {
					['tshirt_1'] = 237,  ['tshirt_2'] = 1,
					['torso_1'] = 422,   ['torso_2'] = 7,
					['decals_1'] = 141,   ['decals_2'] = 0,
					['arms'] = 14,
					['pants_1'] = 152,   ['pants_2'] = 3,
					['shoes_1'] = 25,   ['shoes_2'] = 0,
					['helmet_1'] = 163,  ['helmet_2'] = 0,
					['chain_1'] = 6,    ['chain_2'] = 0,
					['ears_1'] = -1,     ['ears_2'] = 0,
					['bproof_1'] = 69,  ['bproof_2'] = 0,
					['mask_1'] = 11,    ['mask_2'] = 0,
					['bags_1'] = 101,  ['bags_2'] = 2
				}
			},
				deputy_wear3 = {
				male = {
					['tshirt_1'] = 191,  ['tshirt_2'] = 0,
					['torso_1'] = 399,   ['torso_2'] = 2,
					['decals_1'] = 131,   ['decals_2'] = 0,
					['arms'] = 4,
					['pants_1'] = 145,   ['pants_2'] = 1,
					['shoes_1'] = 25,   ['shoes_2'] = 0,
					['helmet_1'] = 164,  ['helmet_2'] = 2,
					['chain_1'] = 6,    ['chain_2'] = 0,
					['ears_1'] = -1,     ['ears_2'] = 0,
					['bproof_1'] = 74,  ['bproof_2'] = 0,
					['mask_1'] = 121,   ['mask_2'] = 0,
					['bags_1'] = 100,  ['bags_2'] = 0
				},
				female = {
					['tshirt_1'] = 237,  ['tshirt_2'] = 0,
					['torso_1'] = 422,   ['torso_2'] = 2,
					['decals_1'] = 141,   ['decals_2'] = 0,
					['arms'] = 14,
					['pants_1'] = 152,   ['pants_2'] = 1,
					['shoes_1'] = 25,   ['shoes_2'] = 0,
					['helmet_1'] = 163,  ['helmet_2'] = 3,
					['chain_1'] = 6,    ['chain_2'] = 0,
					['ears_1'] = -1,     ['ears_2'] = 0,
					['bproof_1'] = 69,  ['bproof_2'] = 0,
					['mask_1'] = 11,    ['mask_2'] = 0,
					['bags_1'] = 100,  ['bags_2'] = 0
				}
			},
	
		--- SIERZANT KRÓTKI ---
			sergeant_wear = {
			male = {
				['tshirt_1'] = 191,  ['tshirt_2'] = 0,
				['torso_1'] = 396,   ['torso_2'] = 7,
				['decals_1'] = 130,   ['decals_2'] = 3,
				['arms'] = 11,
				['pants_1'] = 114,   ['pants_2'] = 1,
				['shoes_1'] = 25,   ['shoes_2'] = 0,
				['helmet_1'] = 164,  ['helmet_2'] = 0,
				['chain_1'] = 6,    ['chain_2'] = 0,
				['ears_1'] = -1,     ['ears_2'] = 0,
				['bproof_1'] = 74,  ['bproof_2'] = 0,
				['mask_1'] = 121,   ['mask_2'] = 0,
				['bags_1'] = 101,  ['bags_2'] = 4
		},
			female = {
				['tshirt_1'] = 237,  ['tshirt_2'] = 1,
				['torso_1'] = 418,   ['torso_2'] = 7,
				['decals_1'] = 140,   ['decals_2'] = 3,
				['arms'] = 14,
				['pants_1'] = 121,   ['pants_2'] = 1,
				['shoes_1'] = 25,   ['shoes_2'] = 0,
				['helmet_1'] = 163,  ['helmet_2'] = 0,
				['chain_1'] = 8,    ['chain_2'] = 0,
				['ears_1'] = -1,     ['ears_2'] = 0,
				['bproof_1'] = 69,  ['bproof_2'] = 0,
				['mask_1'] = 11,    ['mask_2'] = 0,
				['bags_1'] = 101,  ['bags_2'] = 4
			}
		},
	sergeantsh_wear = {
			male = {
				['tshirt_1'] = 191,  ['tshirt_2'] = 0,
				['torso_1'] = 396,   ['torso_2'] = 2,
				['decals_1'] = 130,   ['decals_2'] = 3,
				['arms'] = 11,
				['pants_1'] = 114,   ['pants_2'] = 4,
				['shoes_1'] = 25,   ['shoes_2'] = 0,
				['helmet_1'] = 164,  ['helmet_2'] = 2,
				['chain_1'] = 6,    ['chain_2'] = 0,
				['ears_1'] = -1,     ['ears_2'] = 0,
				['bproof_1'] = 74,  ['bproof_2'] = 0,
				['mask_1'] = 121,   ['mask_2'] = 0,
				['bags_1'] = 100,  ['bags_2'] = 3
			},
			female = {
				['tshirt_1'] = 237,  ['tshirt_2'] = 0,
				['torso_1'] = 418,   ['torso_2'] = 2,
				['decals_1'] = 140,   ['decals_2'] = 0,
				['arms'] = 14,
				['pants_1'] = 121,   ['pants_2'] = 4,
				['shoes_1'] = 25,   ['shoes_2'] = 0,
				['helmet_1'] = 163,  ['helmet_2'] = 3,
				['chain_1'] = 6,    ['chain_2'] = 0,
				['ears_1'] = -1,     ['ears_2'] = 0,
				['bproof_1'] = 69,  ['bproof_2'] = 0,
				['mask_1'] = 11,    ['mask_2'] = 0,
				['bags_1'] = 100,  ['bags_2'] = 3
			}
	},
			--- SIERZANT DŁUGI ---
		sergeant_wear2 = {
				male = {
					['tshirt_1'] = 191,  ['tshirt_2'] = 0,
					['torso_1'] = 398,   ['torso_2'] = 7,
					['decals_1'] = 131,   ['decals_2'] = 3,
					['arms'] = 4,
					['pants_1'] = 114,   ['pants_2'] = 1,
					['shoes_1'] = 25,   ['shoes_2'] = 0,
					['helmet_1'] = 164,  ['helmet_2'] = 0,
					['chain_1'] = 6,    ['chain_2'] = 0,
					['ears_1'] = -1,     ['ears_2'] = 0,
					['bproof_1'] = 74,  ['bproof_2'] = 0,
					['mask_1'] = 121,   ['mask_2'] = 0,
					['bags_1'] = 101,  ['bags_2'] = 4
				},
				female = {
					['tshirt_1'] = 237,  ['tshirt_2'] = 1,
					['torso_1'] = 419,   ['torso_2'] = 7,
					['decals_1'] = 141,   ['decals_2'] = 3,
					['arms'] = 14,
					['pants_1'] = 121,   ['pants_2'] = 1,
					['shoes_1'] = 25,   ['shoes_2'] = 0,
					['helmet_1'] = 163,  ['helmet_2'] = 0,
					['chain_1'] = 8,    ['chain_2'] = 0,
					['ears_1'] = -1,     ['ears_2'] = 0,
					['bproof_1'] = 69,  ['bproof_2'] = 0,
					['mask_1'] = 11,    ['mask_2'] = 0,
					['bags_1'] = 101,  ['bags_2'] = 4
				}
		},
		sergeantsh_wear2 = {
				male = {
					['tshirt_1'] = 191,  ['tshirt_2'] = 0,
					['torso_1'] = 398,   ['torso_2'] = 2,
					['decals_1'] = 131,   ['decals_2'] = 3,
					['arms'] = 12,
					['pants_1'] = 114,   ['pants_2'] = 4,
					['shoes_1'] = 25,   ['shoes_2'] = 0,
					['helmet_1'] = 164,  ['helmet_2'] = 2,
					['chain_1'] = 6,    ['chain_2'] = 0,
					['ears_1'] = -1,     ['ears_2'] = 0,
					['bproof_1'] = 74,  ['bproof_2'] = 0,
					['mask_1'] = 121,   ['mask_2'] = 0,
					['bags_1'] = 100,  ['bags_2'] = 3
				},
				female = {
					['tshirt_1'] = 237,  ['tshirt_2'] = 0,
					['torso_1'] = 419,   ['torso_2'] = 2,
					['decals_1'] = 141,   ['decals_2'] = 3,
					['arms'] = 14,
					['pants_1'] = 121,   ['pants_2'] = 4,
					['shoes_1'] = 9,   ['shoes_2'] = 0,
					['helmet_1'] = 163,  ['helmet_2'] = 3,
					['chain_1'] = 8,    ['chain_2'] = 0,
					['ears_1'] = 0,     ['ears_2'] = 0,
					['bproof_1'] = 69,  ['bproof_2'] = 0,
					['mask_1'] = 11,    ['mask_2'] = 0,
					['bags_1'] = 100,  ['bags_2'] = 3
				}
		},
		
		--- SIERŻANT DŁUGI KRAWAT ---
		sergeant_wear3 = {
				male = {
					['tshirt_1'] = 191,  ['tshirt_2'] = 0,
					['torso_1'] = 399,   ['torso_2'] = 7,
					['decals_1'] = 131,   ['decals_2'] = 3,
					['arms'] = 4,
					['pants_1'] = 114,   ['pants_2'] = 1,
					['shoes_1'] = 25,   ['shoes_2'] = 0,
					['helmet_1'] = 164,  ['helmet_2'] = 0,
					['chain_1'] = 6,    ['chain_2'] = 0,
					['ears_1'] = -1,     ['ears_2'] = 0,
					['bproof_1'] = 74,  ['bproof_2'] = 0,
					['mask_1'] = 121,   ['mask_2'] = 0,
					['bags_1'] = 101,  ['bags_2'] = 4
				},
				female = {
					['tshirt_1'] = 237,  ['tshirt_2'] = 1,
					['torso_1'] = 422,   ['torso_2'] = 7,
					['decals_1'] = 141,   ['decals_2'] = 3,
					['arms'] = 14,
					['pants_1'] = 121,   ['pants_2'] = 1,
					['shoes_1'] = 25,   ['shoes_2'] = 0,
					['helmet_1'] = 163,  ['helmet_2'] = 0,
					['chain_1'] = 8,    ['chain_2'] = 0,
					['ears_1'] = -1,     ['ears_2'] = 0,
					['bproof_1'] = 69,  ['bproof_2'] = 0,
					['mask_1'] = 11,    ['mask_2'] = 0,
					['bags_1'] = 101,  ['bags_2'] = 4
				}
			},
		sergeantsh_wear3 = {
			male = {
				['tshirt_1'] = 191,  ['tshirt_2'] = 0,
				['torso_1'] = 399,   ['torso_2'] = 2,
				['decals_1'] = 81,   ['decals_2'] = 3,
				['arms'] = 4,
				['pants_1'] = 114,   ['pants_2'] = 4,
				['shoes_1'] = 25,   ['shoes_2'] = 0,
				['helmet_1'] = 164,  ['helmet_2'] = 2,
				['chain_1'] = 6,    ['chain_2'] = 0,
				['ears_1'] = -1,     ['ears_2'] = 0,
				['bproof_1'] = 74,  ['bproof_2'] = 0,
				['mask_1'] = 121,   ['mask_2'] = 0,
				['bags_1'] = 100,  ['bags_2'] = 3
			},
			female = {
				['tshirt_1'] = 237,  ['tshirt_2'] = 0,
				['torso_1'] = 422,   ['torso_2'] = 2,
				['decals_1'] = 141,   ['decals_2'] = 3,
				['arms'] = 14,
				['pants_1'] = 121,   ['pants_2'] = 4,
				['shoes_1'] = 25,   ['shoes_2'] = 0,
				['helmet_1'] = 163,  ['helmet_2'] = 4,
				['chain_1'] = 8,    ['chain_2'] = 0,
				['ears_1'] = 0,     ['ears_2'] = 0,
				['bproof_1'] = 69,  ['bproof_2'] = 0,
				['mask_1'] = 11,    ['mask_2'] = 0,
				['bags_1'] = 100,  ['bags_2'] = 3
			}
		},
	
	
	
	
						--- PORUCZNIK KRÓTKI ---
		lieutenant_wear = { 	
			male = {
				['tshirt_1'] = 191,  ['tshirt_2'] = 0,
				['torso_1'] = 396,   ['torso_2'] = 6,
				['decals_1'] = 0,   ['decals_2'] = 0,
				['arms'] = 11,
				['pants_1'] = 114,   ['pants_2'] = 2,
				['shoes_1'] = 25,   ['shoes_2'] = 0,
				['helmet_1'] = 166,  ['helmet_2'] = 1,
				['chain_1'] = 6,    ['chain_2'] = 0,
				['ears_1'] = -1,     ['ears_2'] = 0,
				['bproof_1'] = 74,  ['bproof_2'] = 0,
				['mask_1'] = 121,   ['mask_2'] = 0,
				['bags_1'] = 101,  ['bags_2'] = 7
			},
			female = {
				['tshirt_1'] = 237,  ['tshirt_2'] = 1,
				['torso_1'] = 418,   ['torso_2'] = 6,
				['decals_1'] = 0,   ['decals_2'] = 0,
				['arms'] = 14,
				['pants_1'] = 121,   ['pants_2'] = 2,
				['shoes_1'] = 25,   ['shoes_2'] = 0,
				['helmet_1'] = 164,  ['helmet_2'] = 1,
				['chain_1'] = 8,    ['chain_2'] = 0,
				['ears_1'] = -1,     ['ears_2'] = 0,
				['bproof_1'] = 69,  ['bproof_2'] = 0,
				['mask_1'] = 11,    ['mask_2'] = 0,
				['bags_1'] = 101,  ['bags_2'] = 7
			}
		},
		lieutenantsh_wear = {
			male = {
				['tshirt_1'] = 191,  ['tshirt_2'] = 0,
				['torso_1'] = 396,   ['torso_2'] = 3,
				['decals_1'] = 0,   ['decals_2'] = 0,
				['arms'] = 11,
				['pants_1'] = 114,   ['pants_2'] = 5,
				['shoes_1'] = 25,   ['shoes_2'] = 0,
				['helmet_1'] = 166,  ['helmet_2'] = 0,
				['chain_1'] = 6,    ['chain_2'] = 0,
				['ears_1'] = -1,     ['ears_2'] = 0,
				['bproof_1'] = 74,  ['bproof_2'] = 0,
				['mask_1'] = 121,   ['mask_2'] = 0,
				['bags_1'] = 100,  ['bags_2'] = 5
			},
			female = {
				['tshirt_1'] = 237,  ['tshirt_2'] = 1,
				['torso_1'] = 418,   ['torso_2'] = 3,
				['decals_1'] = 0,   ['decals_2'] = 0,
				['arms'] = 14,
				['pants_1'] = 121,   ['pants_2'] = 5,
				['shoes_1'] = 25,   ['shoes_2'] = 0,
				['helmet_1'] = 164,  ['helmet_2'] = 0,
				['chain_1'] = 8,    ['chain_2'] = 0,
				['ears_1'] = -1,     ['ears_2'] = 0,
				['bproof_1'] = 69,  ['bproof_2'] = 0,
				['mask_1'] = 11,    ['mask_2'] = 0,
				['bags_1'] = 100,  ['bags_2'] = 5
			}
		},
		
							--- PORUCZNIK DŁUGI ---
		lieutenant_wear2 = { 	
			male = {
				['tshirt_1'] = 191,  ['tshirt_2'] = 0,
				['torso_1'] = 398,   ['torso_2'] = 6,
				['decals_1'] = 0,   ['decals_2'] = 0,
				['arms'] = 4,
				['pants_1'] = 114,   ['pants_2'] = 2,
				['shoes_1'] = 25,   ['shoes_2'] = 0,
				['helmet_1'] = 166,  ['helmet_2'] = 1,
				['chain_1'] = 6,    ['chain_2'] = 0,
				['ears_1'] = -1,     ['ears_2'] = 0,
				['bproof_1'] = 74,  ['bproof_2'] = 0,
				['mask_1'] = 121,   ['mask_2'] = 0,
				['bags_1'] = 101,  ['bags_2'] = 7
			},
			female = {
				['tshirt_1'] = 237,  ['tshirt_2'] = 1,
				['torso_1'] = 419,   ['torso_2'] = 6,
				['decals_1'] = 0,   ['decals_2'] = 0,
				['arms'] = 14,
				['pants_1'] = 121,   ['pants_2'] = 2,
				['shoes_1'] = 25,   ['shoes_2'] = 0,
				['helmet_1'] = 164,  ['helmet_2'] = 1,
				['chain_1'] = 8,    ['chain_2'] = 0,
				['ears_1'] = -1,     ['ears_2'] = 0,
				['bproof_1'] = 69,  ['bproof_2'] = 0,
				['mask_1'] = 11,    ['mask_2'] = 0,
				['bags_1'] = 101,  ['bags_2'] = 7
			}
		},
		lieutenantsh_wear2 = {
			male = {
				['tshirt_1'] = 191,  ['tshirt_2'] = 0,
				['torso_1'] = 398,   ['torso_2'] = 3,
				['decals_1'] = 0,   ['decals_2'] = 0,
				['arms'] = 4,
				['pants_1'] = 114,   ['pants_2'] = 5,
				['shoes_1'] = 25,   ['shoes_2'] = 0,
				['helmet_1'] = 166,  ['helmet_2'] = 0,
				['chain_1'] = 6,    ['chain_2'] = 0,
				['ears_1'] = -1,     ['ears_2'] = 0,
				['bproof_1'] = 74,  ['bproof_2'] = 0,
				['mask_1'] = 121,   ['mask_2'] = 0,
				['bags_1'] = 100,  ['bags_2'] = 5
			},
			female = {
				['tshirt_1'] = 237,  ['tshirt_2'] = 1,
				['torso_1'] = 419,   ['torso_2'] = 3,
				['decals_1'] = 0,   ['decals_2'] = 0,
				['arms'] = 14,
				['pants_1'] = 121,   ['pants_2'] = 5,
				['shoes_1'] = 25,   ['shoes_2'] = 0,
				['helmet_1'] = 164,  ['helmet_2'] = 0,
				['chain_1'] = 8,    ['chain_2'] = 0,
				['ears_1'] = -1,     ['ears_2'] = 0,
				['bproof_1'] = 69,  ['bproof_2'] = 0,
				['mask_1'] = 11,    ['mask_2'] = 0,
				['bags_1'] = 100,  ['bags_2'] = 5
			}
		},
	
		--- PORUCZNIK DŁUGI KRAWAT ---
		lieutenant_wear3 = { 	
			male = {
				['tshirt_1'] = 191,  ['tshirt_2'] = 0,
				['torso_1'] = 399,   ['torso_2'] = 6,
				['decals_1'] = 132,   ['decals_2'] = 0,
				['arms'] = 4,
				['pants_1'] = 114,   ['pants_2'] = 2,
				['shoes_1'] = 25,   ['shoes_2'] = 0,
				['helmet_1'] = 166,  ['helmet_2'] = 1,
				['chain_1'] = 6,    ['chain_2'] = 0,
				['ears_1'] = -1,     ['ears_2'] = 0,
				['bproof_1'] = 74,  ['bproof_2'] = 0,
				['mask_1'] = 121,   ['mask_2'] = 0,
				['bags_1'] = 101,  ['bags_2'] = 7
			},
			female = {
				['tshirt_1'] = 237,  ['tshirt_2'] = 1,
				['torso_1'] = 422,   ['torso_2'] = 6,
				['decals_1'] = 142,   ['decals_2'] = 0,
				['arms'] = 14,
				['pants_1'] = 121,   ['pants_2'] = 2,
				['shoes_1'] = 25,   ['shoes_2'] = 0,
				['helmet_1'] = 164,  ['helmet_2'] = 1,
				['chain_1'] = 8,    ['chain_2'] = 0,
				['ears_1'] = -1,     ['ears_2'] = 0,
				['bproof_1'] = 69,  ['bproof_2'] = 0,
				['mask_1'] = 11,    ['mask_2'] = 0,
				['bags_1'] = 101,  ['bags_2'] = 7
			}
		},
		lieutenantsh_wear3 = {
			male = {
				['tshirt_1'] = 191,  ['tshirt_2'] = 0,
				['torso_1'] = 399,   ['torso_2'] = 3,
				['decals_1'] = 132,   ['decals_2'] = 6,
				['arms'] = 4,
				['pants_1'] = 114,   ['pants_2'] = 5,
				['shoes_1'] = 25,   ['shoes_2'] = 0,
				['helmet_1'] = 166,  ['helmet_2'] = 0,
				['chain_1'] = 6,    ['chain_2'] = 0,
				['ears_1'] = -1,     ['ears_2'] = 0,
				['bproof_1'] = 74,  ['bproof_2'] = 0,
				['mask_1'] = 121,   ['mask_2'] = 0,
				['bags_1'] = 100,  ['bags_2'] = 5
			},
			female = {
				['tshirt_1'] = 237,  ['tshirt_2'] = 1,
				['torso_1'] = 422,   ['torso_2'] = 3,
				['decals_1'] = 142,   ['decals_2'] = 6,
				['arms'] = 14,
				['pants_1'] = 121,   ['pants_2'] = 5,
				['shoes_1'] = 25,   ['shoes_2'] = 0,
				['helmet_1'] = 164,  ['helmet_2'] = 0,
				['chain_1'] = 8,    ['chain_2'] = 0,
				['ears_1'] = -1,     ['ears_2'] = 0,
				['bproof_1'] = 69,  ['bproof_2'] = 0,
				['mask_1'] = 11,    ['mask_2'] = 0,
				['bags_1'] = 100,  ['bags_2'] = 5
			}
		},
	
					--- KAPITAN KRÓTKI ---
		captain_wear = { 	
		male = {
			['tshirt_1'] = 191,  ['tshirt_2'] = 0,
			['torso_1'] = 396,   ['torso_2'] = 5,
			['decals_1'] = 0,   ['decals_2'] = 0,
			['arms'] = 11,
			['pants_1'] = 114,   ['pants_2'] = 2,
			['shoes_1'] = 25,   ['shoes_2'] = 0,
			['helmet_1'] = 166,  ['helmet_2'] = 1,
			['chain_1'] = 6,    ['chain_2'] = 0,
			['ears_1'] = -1,     ['ears_2'] = 0,
			['bproof_1'] = 74,  ['bproof_2'] = 0,
			['mask_1'] = 121,   ['mask_2'] = 0,
			['bags_1'] = 101,  ['bags_2'] = 9
		},
		female = {
			['tshirt_1'] = 237,  ['tshirt_2'] = 1,
			['torso_1'] = 418,   ['torso_2'] = 5,
			['decals_1'] = 0,   ['decals_2'] = 0,
			['arms'] = 14,
			['pants_1'] = 121,   ['pants_2'] = 2,
			['shoes_1'] = 25,   ['shoes_2'] = 0,
			['helmet_1'] = 164,  ['helmet_2'] = 1,
			['chain_1'] = 8,    ['chain_2'] = 0,
			['ears_1'] = -1,     ['ears_2'] = 0,
			['bproof_1'] = 69,  ['bproof_2'] = 0,
			['mask_1'] = 11,    ['mask_2'] = 0,
			['bags_1'] = 101,  ['bags_2'] = 9
		}
	},
		captainsh_wear = {
			male = {
				['tshirt_1'] = 191,  ['tshirt_2'] = 0,
				['torso_1'] = 396,   ['torso_2'] = 1,
				['decals_1'] = 0,   ['decals_2'] = 0,
				['arms'] = 11,
				['pants_1'] = 114,   ['pants_2'] = 5,
				['shoes_1'] = 25,   ['shoes_2'] = 0,
				['helmet_1'] = 166,  ['helmet_2'] = 0,
				['chain_1'] = 6,    ['chain_2'] = 0,
				['ears_1'] = -1,     ['ears_2'] = 0,
				['bproof_1'] = 74,  ['bproof_2'] = 0,
				['mask_1'] = 121,   ['mask_2'] = 0,
				['bags_1'] = 100,  ['bags_2'] = 7
			},
			female = {
				['tshirt_1'] = 237,  ['tshirt_2'] = 0,
				['torso_1'] = 418,   ['torso_2'] = 1,
				['decals_1'] = 0,   ['decals_2'] = 0,
				['arms'] = 14,
				['pants_1'] = 121,   ['pants_2'] = 5,
				['shoes_1'] = 25,   ['shoes_2'] = 0,
				['helmet_1'] = 164,  ['helmet_2'] = 0,
				['chain_1'] = 8,    ['chain_2'] = 0,
				['ears_1'] = 0,     ['ears_2'] = 0,
				['bproof_1'] = 69,  ['bproof_2'] = 0,
				['mask_1'] = 11,    ['mask_2'] = 0,
				['bags_1'] = 100,  ['bags_2'] = 7
			}
		},
		
	
					--- KAPITAN DŁUGI ---
		captain_wear2 = { 	
			male = {
				['tshirt_1'] = 191,  ['tshirt_2'] = 0,
				['torso_1'] = 398,   ['torso_2'] = 5,
				['decals_1'] = 0,   ['decals_2'] = 0,
				['arms'] = 4,
				['pants_1'] = 114,   ['pants_2'] = 2,
				['shoes_1'] = 25,   ['shoes_2'] = 0,
				['helmet_1'] = 166,  ['helmet_2'] = 1,
				['chain_1'] = 6,    ['chain_2'] = 0,
				['ears_1'] = -1,     ['ears_2'] = 0,
				['bproof_1'] = 74,  ['bproof_2'] = 0,
				['mask_1'] = 121,   ['mask_2'] = 0,
				['bags_1'] = 101,  ['bags_2'] = 9
			},
			female = {
				['tshirt_1'] = 237,  ['tshirt_2'] = 1,
				['torso_1'] = 419,   ['torso_2'] = 5,
				['decals_1'] = 0,   ['decals_2'] = 0,
				['arms'] = 14,
				['pants_1'] = 121,   ['pants_2'] = 2,
				['shoes_1'] = 25,   ['shoes_2'] = 0,
				['helmet_1'] = 164,  ['helmet_2'] = 1,
				['chain_1'] = 8,    ['chain_2'] = 0,
				['ears_1'] = -1,     ['ears_2'] = 0,
				['bproof_1'] = 70,  ['bproof_2'] = 0,
				['mask_1'] = 11,    ['mask_2'] = 0,
				['bags_1'] = 101,  ['bags_2'] = 0
			}
	},
		captainsh_wear2 = {
			male = {
				['tshirt_1'] = 191,  ['tshirt_2'] = 0,
				['torso_1'] = 398,   ['torso_2'] = 1,
				['decals_1'] = 0,   ['decals_2'] = 0,
				['arms'] = 4,
				['pants_1'] = 114,   ['pants_2'] = 5,
				['shoes_1'] = 25,   ['shoes_2'] = 0,
				['helmet_1'] = 166,  ['helmet_2'] = 0,
				['chain_1'] = 6,    ['chain_2'] = 0,
				['ears_1'] = -1,     ['ears_2'] = 0,
				['bproof_1'] = 74,  ['bproof_2'] = 0,
				['mask_1'] = 121,   ['mask_2'] = 0,
				['bags_1'] = 100,  ['bags_2'] = 7
			},
			female = {
				['tshirt_1'] = 237,  ['tshirt_2'] = 0,
				['torso_1'] = 419,   ['torso_2'] = 1,
				['decals_1'] = 0,   ['decals_2'] = 0,
				['arms'] = 14,
				['pants_1'] = 121,   ['pants_2'] = 5,
				['shoes_1'] = 25,   ['shoes_2'] = 0,
				['helmet_1'] = 164,  ['helmet_2'] = 0,
				['chain_1'] = 8,    ['chain_2'] = 0,
				['ears_1'] = 0,     ['ears_2'] = 0,
				['bproof_1'] = 70,  ['bproof_2'] = 0,
				['mask_1'] = 11,    ['mask_2'] = 0,
				['bags_1'] = 100,  ['bags_2'] = 7
			}
		},
	
				--- KAPITAN KRAWAT DŁUGI ---
			captain_wear3 = { 	
				male = {
					['tshirt_1'] = 191,  ['tshirt_2'] = 0,
					['torso_1'] = 399,   ['torso_2'] = 5,
					['decals_1'] = 132,   ['decals_2'] = 1,
					['arms'] = 4,
					['pants_1'] = 114,   ['pants_2'] = 2,
					['shoes_1'] = 25,   ['shoes_2'] = 0,
					['helmet_1'] = 166,  ['helmet_2'] = 1,
					['chain_1'] = 6,    ['chain_2'] = 0,
					['ears_1'] = -1,     ['ears_2'] = 0,
					['bproof_1'] = 74,  ['bproof_2'] = 0,
					['mask_1'] = 121,   ['mask_2'] = 0,
					['bags_1'] = 101,  ['bags_2'] = 9
				},
				female = {
					['tshirt_1'] = 237,  ['tshirt_2'] = 1,
					['torso_1'] = 422,   ['torso_2'] = 5,
					['decals_1'] = 142,   ['decals_2'] = 1,
					['arms'] = 14,
					['pants_1'] = 121,   ['pants_2'] = 2,
					['shoes_1'] = 25,   ['shoes_2'] = 0,
					['helmet_1'] = 164,  ['helmet_2'] = 1,
					['chain_1'] = 8,    ['chain_2'] = 0,
					['ears_1'] = -1,     ['ears_2'] = 0,
					['bproof_1'] = 70,  ['bproof_2'] = 0,
					['mask_1'] = 11,    ['mask_2'] = 0,
					['bags_1'] = 101,  ['bags_2'] = 9
				}
		},
			captainsh_wear3 = {
				male = {
					['tshirt_1'] = 191,  ['tshirt_2'] = 0,
					['torso_1'] = 399,   ['torso_2'] = 1,
					['decals_1'] = 132,   ['decals_2'] = 5,
					['arms'] = 4,
					['pants_1'] = 114,   ['pants_2'] = 5,
					['shoes_1'] = 25,   ['shoes_2'] = 0,
					['helmet_1'] = 166,  ['helmet_2'] = 0,
					['chain_1'] = 6,    ['chain_2'] = 0,
					['ears_1'] = -1,     ['ears_2'] = 0,
					['bproof_1'] = 74,  ['bproof_2'] = 0,
					['mask_1'] = 121,   ['mask_2'] = 0,
					['bags_1'] = 100,  ['bags_2'] = 9
				},
				female = {
					['tshirt_1'] = 237,  ['tshirt_2'] = 0,
					['torso_1'] = 422,   ['torso_2'] = 1,
					['decals_1'] = 0,   ['decals_2'] = 0,
					['arms'] = 14,
					['pants_1'] = 121,   ['pants_2'] = 7,
					['shoes_1'] = 25,   ['shoes_2'] = 0,
					['helmet_1'] = 164,  ['helmet_2'] = 0,
					['chain_1'] = 8,    ['chain_2'] = 0,
					['ears_1'] = 0,     ['ears_2'] = 0,
					['bproof_1'] = 70,  ['bproof_2'] = 0,
					['mask_1'] = 11,    ['mask_2'] = 0,
					['bags_1'] = 100,  ['bags_2'] = 9
				}
			},
	
					--- ZARZAD LSPD ---
		chef_wear = {	
			male = {
				['tshirt_1'] = 44,  ['tshirt_2'] = 0,
				['torso_1'] = 38,   ['torso_2'] = 0,
				['decals_1'] = 0,   ['decals_2'] = 0,
				['arms'] = 41,
				['pants_1'] = 46,   ['pants_2'] = 0,
				['shoes_1'] = 25,   ['shoes_2'] = 0,
				['helmet_1'] = 13,  ['helmet_2'] = 0,
				['chain_1'] = 8,    ['chain_2'] = 0,
				['ears_1'] = -1,     ['ears_2'] = 0,
				['bproof_1'] = 19,  ['bproof_2'] = 0,
				['mask_1'] = 0,   ['mask_2'] = 0
			},
			female = {
				['tshirt_1'] = 34,  ['tshirt_2'] = 0,
				['torso_1'] = 266,   ['torso_2'] = 0,
				['decals_1'] = 0,   ['decals_2'] = 0,
				['arms'] = 31,
				['pants_1'] = 48,   ['pants_2'] = 0,
				['shoes_1'] = 25,   ['shoes_2'] = 0,
				['helmet_1'] = 38,  ['helmet_2'] = 1,
				['chain_1'] = 8,    ['chain_2'] = 0,
				['ears_1'] = -1,     ['ears_2'] = 0,
				['bproof_1'] = 14,  ['bproof_2'] = 0
			}
		},
		boss_wear = { 
		male = {
			['tshirt_1'] = 44,  ['tshirt_2'] = 0,
			['torso_1'] = 38,   ['torso_2'] = 0,
			['decals_1'] = 0,   ['decals_2'] = 0,
			['arms'] = 41,
			['pants_1'] = 47,   ['pants_2'] = 0,
			['shoes_1'] = 25,   ['shoes_2'] = 0,
			['helmet_1'] = 13,  ['helmet_2'] = 0,
			['chain_1'] = 8,    ['chain_2'] = 0,
			['ears_1'] = -1,     ['ears_2'] = 0,
			['bproof_1'] = 0,  ['bproof_2'] = 0,
			['mask_1'] = 0,   ['mask_2'] = 0
		},
		female = {
			['tshirt_1'] = 34,  ['tshirt_2'] = 0,
			['torso_1'] = 266,   ['torso_2'] = 0,
			['decals_1'] = 0,   ['decals_2'] = 0,
			['arms'] = 31,
			['pants_1'] = 48,   ['pants_2'] = 0,
			['shoes_1'] = 25,   ['shoes_2'] = 0,
			['helmet_1'] = 38,  ['helmet_2'] = 1,
			['chain_1'] = 8,    ['chain_2'] = 0,
			['ears_1'] = -1,     ['ears_2'] = 0,
			['bproof_1'] = 14,  ['bproof_2'] = 0,
			['mask_1'] = 11,    ['mask_2'] = 2
		}
	},
	
				--- MUNDUR K9 ---
	k9_wear = { 
	male = {
		['tshirt_1'] = 191,  ['tshirt_2'] = 0,
		['torso_1'] = 400,   ['torso_2'] = 10,
		['decals_1'] = 0,   ['decals_2'] = 0,
		['arms'] = 0,
		['pants_1'] = 114,   ['pants_2'] = 11,
		['shoes_1'] = 25,   ['shoes_2'] = 0,
		['helmet_1'] = 108,  ['helmet_2'] = 12,
		['chain_1'] = 1,    ['chain_2'] = 0,
		['ears_1'] = -1,     ['ears_2'] = 0,
		['bproof_1'] = 72,  ['bproof_2'] = 0,
		['mask_1'] = 121,   ['mask_2'] = 0,
		['bags_1'] = 0,  ['bags_2'] = 0
	},
	female = {
		['tshirt_1'] = 237,  ['tshirt_2'] = 1,
		['torso_1'] = 423,   ['torso_2'] = 9,
		['decals_1'] = 0,   ['decals_2'] = 0,
		['arms'] = 31,
		['pants_1'] = 121,   ['pants_2'] = 11,
		['shoes_1'] = 25,   ['shoes_2'] = 0,
		['helmet_1'] = 106,  ['helmet_2'] = 12,
		['chain_1'] = 3,    ['chain_2'] = 0,
		['ears_1'] = 0,     ['ears_2'] = 0,
		['bproof_1'] = 72,  ['bproof_2'] = 0,
		['mask_1'] = 121,    ['mask_2'] = 0,
		['glasses_1'] = 5, ['glasses_2'] = 0
	}
	},
				--- MUNDUR MOTOCYKLOWY ---
	motocykl_wear = { 
		male = {
			['tshirt_1'] = 71,  ['tshirt_2'] = 3,
			['torso_1'] = 403,   ['torso_2'] = 1,
			['decals_1'] = 0,   ['decals_2'] = 0,
			['arms'] = 17,
			['pants_1'] = 148,   ['pants_2'] = 2,
			['shoes_1'] = 13,   ['shoes_2'] = 1,
			['helmet_1'] = 169,  ['helmet_2'] = 0,
			['chain_1'] = 13,    ['chain_2'] = 0,
			['ears_1'] = -1,     ['ears_2'] = 0,
			['bproof_1'] = 0,  ['bproof_2'] = 0,
			['mask_1'] = 169,   ['mask_2'] = 0,
			['glasses_1'] = 5, ['glasses_2'] = 0
		},
		female = {
			['tshirt_1'] = 66,  ['tshirt_2'] = 2,
			['torso_1'] = 425,   ['torso_2'] = 1,
			['decals_1'] = 0,   ['decals_2'] = 0,
			['arms'] = 23,
			['pants_1'] = 117,   ['pants_2'] = 2,
			['shoes_1'] = 25,   ['shoes_2'] = 0,
			['helmet_1'] = 168,  ['helmet_2'] = 0,
			['chain_1'] = 5,    ['chain_2'] = 0,
			['ears_1'] = -1,     ['ears_2'] = 0,
			['bproof_1'] = 0,  ['bproof_2'] = 0,
			['mask_1'] = 169,    ['mask_2'] = 0,
			['glasses_1'] = 11, ['glasses_2'] = 0
		}
	},
	
	
	--sherif motocykl
	motocyklsheriff_wear = { 
		male = {
			['tshirt_1'] = 71,  ['tshirt_2'] = 2,
			['torso_1'] = 403,   ['torso_2'] = 2,
			['decals_1'] = 0,   ['decals_2'] = 0,
			['arms'] = 17,
			['pants_1'] = 148,   ['pants_2'] = 2,
			['shoes_1'] = 13,   ['shoes_2'] = 0,
			['helmet_1'] = 169,  ['helmet_2'] = 3,
			['chain_1'] = 13,    ['chain_2'] = 0,
			['ears_1'] = -1,     ['ears_2'] = 0,
			['bproof_1'] = 0,  ['bproof_2'] = 0,
			['mask_1'] = 169,   ['mask_2'] = 0,
			['bags_1'] = 0,  ['bags_2'] = 0
		},
		female = {
			['tshirt_1'] = 66,  ['tshirt_2'] = 4,
			['torso_1'] = 425,   ['torso_2'] = 2,
			['decals_1'] = 0,   ['decals_2'] = 0,
			['arms'] = 23,
			['pants_1'] = 117,   ['pants_2'] = 2,
			['shoes_1'] = 25,   ['shoes_2'] = 0,
			['helmet_1'] = 168,  ['helmet_2'] = 3,
			['chain_1'] = 7,    ['chain_2'] = 0,
			['ears_1'] = -1,     ['ears_2'] = 0,
			['bproof_1'] = 0,  ['bproof_2'] = 0,
			['mask_1'] = 169,    ['mask_2'] = 0,
			['glasses_1'] = 11, ['glasses_2'] = 0
		}
	},
				--- STROJ NURKA ---
	nurek_wear = { 
		male = {
			['tshirt_1'] = 123,  ['tshirt_2'] = 0,
			['torso_1'] = 243,   ['torso_2'] = 1,
			['decals_1'] = 0,   ['decals_2'] = 0,
			['arms'] = 17,
			['pants_1'] = 128,   ['pants_2'] = 8,
			['shoes_1'] = 67,   ['shoes_2'] = 0,
			['helmet_1'] = -1,  ['helmet_2'] = 0,
			['chain_1'] = 0,    ['chain_2'] = 0,
			['ears_1'] = -1,     ['ears_2'] = 0,
			['bproof_1'] = 0,  ['bproof_2'] = 0,
			['mask_1'] = 122,   ['mask_2'] = 0,
			['bags_1'] = 0,  ['bags_2'] = 0
	
		},
		female = {
			['tshirt_1'] = 153,  ['tshirt_2'] = 0,
			['torso_1'] = 251,   ['torso_2'] = 8,
			['decals_1'] = 0,   ['decals_2'] = 0,
			['arms'] = 18,
			['pants_1'] = 97,   ['pants_2'] = 8,
			['shoes_1'] = 70,   ['shoes_2'] = 8,
			['helmet_1'] = -1,  ['helmet_2'] = 0,
			['chain_1'] = 1,    ['chain_2'] = 0,
			['ears_1'] = 2,     ['ears_2'] = 0,
			['bproof_1'] = 0,  ['bproof_2'] = 0,
			['bags_1'] = 0,  ['bags_2'] = 0,
			['glasses_1'] = 23,  ['glasses_2'] = 0,
			['mask_1'] = 52,  ['mask_2'] = 0
	
		}
	},
				--- MUNDUR OFICJALNY ---
	oficjalny_wear = { 
		male = {
			['tshirt_1'] = 15,  ['tshirt_2'] = 0,
			['torso_1'] = 404,   ['torso_2'] = 0,
			['decals_1'] = 0,   ['decals_2'] = 0,
			['arms'] = 77,
			['pants_1'] = 151,   ['pants_2'] = 1,
			['shoes_1'] = 10,   ['shoes_2'] = 0,
			['helmet_1'] = 166,  ['helmet_2'] = 1,
			['chain_1'] = 0,    ['chain_2'] = 0,
			['ears_1'] = -1,     ['ears_2'] = 0,
			['bproof_1'] = 0,  ['bproof_2'] = 0,
			['mask_1'] = 0,   ['mask_2'] = 0,
			['bags_1'] = 0,   ['bags_2'] = 0
		},
		female = {
			['tshirt_1'] = 14,  ['tshirt_2'] = 0,
			['torso_1'] = 427,   ['torso_2'] = 0,
			['decals_1'] = 0,   ['decals_2'] = 0,
			['arms'] = 88,
			['pants_1'] = 52,   ['pants_2'] = 2,
			['shoes_1'] = 29,   ['shoes_2'] = 0,
			['helmet_1'] = 164,  ['helmet_2'] = 1,
			['chain_1'] = 0,    ['chain_2'] = 0,
			['ears_1'] = -1,     ['ears_2'] = 0,
			['bproof_1'] = 0,  ['bproof_2'] = 0,
			['bags_1'] = 0,  ['bags_2'] = 0,
			['glasses_1'] = 11,  ['glasses_2'] = 0,
			['mask_1'] = 0,  ['mask_2'] = 0
		
		}
		},
		sheriff_official = { 
			male = {
				['tshirt_1'] = 15,  ['tshirt_2'] = 0,
				['torso_1'] = 404,   ['torso_2'] = 1,
				['decals_1'] = 0,   ['decals_2'] = 0,
				['arms'] = 77,
				['pants_1'] = 151,   ['pants_2'] = 1,
				['shoes_1'] = 10,   ['shoes_2'] = 0,
				['helmet_1'] = 166,  ['helmet_2'] = 0,
				['chain_1'] = 0,    ['chain_2'] = 0,
				['ears_1'] = -1,     ['ears_2'] = 0,
				['bproof_1'] = 0,  ['bproof_2'] = 0,
				['mask_1'] = 0,   ['mask_2'] = 0,
				['bags_1'] = 0,   ['bags_2'] = 0
			
			},
			female = {
				['tshirt_1'] = 6,  ['tshirt_2'] = 0,
				['torso_1'] = 427,   ['torso_2'] = 1,
				['decals_1'] = 0,   ['decals_2'] = 0,
				['arms'] = 88,
				['pants_1'] = 52,   ['pants_2'] = 2,
				['shoes_1'] = 29,   ['shoes_2'] = 0,
				['helmet_1'] = 164,  ['helmet_2'] = 0,
				['chain_1'] = 0,    ['chain_2'] = 0,
				['ears_1'] = -1,     ['ears_2'] = 0,
				['bproof_1'] = 0,  ['bproof_2'] = 0,
				['bags_1'] = 0,  ['bags_2'] = 0,
				['mask_1'] = 0,  ['mask_2'] = 0
			
			}
		},
	
					--- MUNDUR BOJOWY OFFICER ---
			police_patrol = {
				male = {
					['tshirt_1'] = 189,  ['tshirt_2'] = 0,
					['torso_1'] = 400,   ['torso_2'] = 0,
					['decals_1'] = 0,   ['decals_2'] = 0,
					['arms'] = 0,
					['pants_1'] = 145,   ['pants_2'] = 3,
					['shoes_1'] = 25,   ['shoes_2'] = 0,
					['helmet_1'] = 164,  ['helmet_2'] = 0,
					['chain_1'] = 6,    ['chain_2'] = 0,
					['ears_1'] = -1,     ['ears_2'] = 0,
					['bproof_1'] = 58,  ['bproof_2'] = 0,
					['mask_1'] = 121,   ['mask_2'] = 0,
					['bags_1'] = 0,  ['bags_2'] = 0
				},
				female = {
					['tshirt_1'] = 237,  ['tshirt_2'] = 1,
					['torso_1'] = 423,   ['torso_2'] = 0,
					['decals_1'] = 0,   ['decals_2'] = 0,
					['arms'] = 14,
					['pants_1'] = 152,   ['pants_2'] = 3,
					['shoes_1'] = 25,   ['shoes_2'] = 0,
					['helmet_1'] = 163,  ['helmet_2'] = 0,
					['chain_1'] = 6,    ['chain_2'] = 0,
					['ears_1'] = 0,     ['ears_2'] = 0,
					['bproof_1'] = 57,  ['bproof_2'] = 0,
					['mask_1'] = 11,    ['mask_2'] = 0,
					['glasses_1'] = 11, ['glasses_2'] = 0
				}
			},
				
			sheriff_patrol = {
					male = {
						['tshirt_1'] = 189,  ['tshirt_2'] = 0,
						['torso_1'] = 400,   ['torso_2'] = 4,
						['decals_1'] = 0,   ['decals_2'] = 0,
						['arms'] = 0,
						['pants_1'] = 145,   ['pants_2'] = 1,
						['shoes_1'] = 25,   ['shoes_2'] = 0,
						['helmet_1'] = 164,  ['helmet_2'] = 2,
						['chain_1'] = 6,    ['chain_2'] = 0,
						['ears_1'] = -1,     ['ears_2'] = 0,
						['bproof_1'] = 58,  ['bproof_2'] = 1,
						['mask_1'] = 121,   ['mask_2'] = 0,
						['bags_1'] = 0,  ['bags_2'] = 0
				},
				female = {
					['tshirt_1'] = 237,  ['tshirt_2'] = 0,
					['torso_1'] = 423,   ['torso_2'] = 4,
					['decals_1'] = 0,   ['decals_2'] = 0,
					['arms'] = 14,
					['pants_1'] = 152,   ['pants_2'] = 1,
					['shoes_1'] = 25,   ['shoes_2'] = 0,
					['helmet_1'] = 163,  ['helmet_2'] = 2,
					['chain_1'] = 8,    ['chain_2'] = 0,
					['ears_1'] = 0,     ['ears_2'] = 0,
					['bproof_1'] = 57,  ['bproof_2'] = 1,
					['mask_1'] = 11,    ['mask_2'] = 0,
					['bags_1'] = 0,  ['bags_2'] = 0
				}
			},
	
				--- MUNDUR BOJOWY SIERŻANTA ---
			police_patrol2 = { 
				male = {
					['tshirt_1'] = 189,  ['tshirt_2'] = 0,
					['torso_1'] = 400,   ['torso_2'] = 0,
					['decals_1'] = 0,   ['decals_2'] = 0,
					['arms'] = 41,
					['pants_1'] = 114,   ['pants_2'] = 1,
					['shoes_1'] = 25,   ['shoes_2'] = 0,
					['helmet_1'] = 108,  ['helmet_2'] = 0,
					['chain_1'] = 6,    ['chain_2'] = 0,
					['ears_1'] = -1,     ['ears_2'] = 0,
					['bproof_1'] = 60,  ['bproof_2'] = 0,
					['mask_1'] = 121,   ['mask_2'] = 0,
					['bags_1'] = 0,  ['bags_2'] = 0
				
				},
				female = {
					['tshirt_1'] = 236,  ['tshirt_2'] = 0,
					['torso_1'] = 423,   ['torso_2'] = 0,
					['decals_1'] = 0,   ['decals_2'] = 0,
					['arms'] = 14,
					['pants_1'] = 121,   ['pants_2'] = 1,
					['shoes_1'] = 25,   ['shoes_2'] = 0,
					['helmet_1'] = 106,  ['helmet_2'] = 0,
					['chain_1'] = 6,    ['chain_2'] = 0,
					['ears_1'] = 0,     ['ears_2'] = 0,
					['bproof_1'] = 61,  ['bproof_2'] = 0,
					['mask_1'] = 11,    ['mask_2'] = 0,
					['glasses_1'] = 11, ['glasses_2'] = 0
				}
			},
			sheriff_patrol2 = { 
				male = {
					['tshirt_1'] = 189,  ['tshirt_2'] = 0,
					['torso_1'] = 400,   ['torso_2'] = 4,
					['decals_1'] = 0,   ['decals_2'] = 0,
					['arms'] = 41,
					['pants_1'] = 114,   ['pants_2'] = 4,
					['shoes_1'] = 25,   ['shoes_2'] = 0,
					['helmet_1'] = 108,  ['helmet_2'] = 4,
					['chain_1'] = 6,    ['chain_2'] = 0,
					['ears_1'] = -1,     ['ears_2'] = 0,
					['bproof_1'] = 60,  ['bproof_2'] = 1,
					['mask_1'] = 121,   ['mask_2'] = 0,
					['bags_1'] = 0,  ['bags_2'] = 0
				},
				female = {
					['tshirt_1'] = 236,  ['tshirt_2'] = 0,
					['torso_1'] = 423,   ['torso_2'] = 4,
					['decals_1'] = 0,   ['decals_2'] = 0,
					['arms'] = 14,
					['pants_1'] = 121,   ['pants_2'] = 4,
					['shoes_1'] = 25,   ['shoes_2'] = 0,
					['helmet_1'] = 106,  ['helmet_2'] = 5,
					['chain_1'] = 6,    ['chain_2'] = 0,
					['ears_1'] = 0,     ['ears_2'] = 0,
					['bproof_1'] = 61,  ['bproof_2'] = 1,
					['mask_1'] = 11,  ['mask_2'] = 0,
					['bags_1'] = 0,  ['bags_2'] = 0
				}
			},
			
				--- MUNDUR BOJOWY PORUCZNIKA ---
			police_patrol3 = { 
				male = {
					['tshirt_1'] = 189,  ['tshirt_2'] = 0,
					['torso_1'] = 400,   ['torso_2'] = 1,
					['decals_1'] = 0,   ['decals_2'] = 0,
					['arms'] = 41,
					['pants_1'] = 114,   ['pants_2'] = 2,
					['shoes_1'] = 25,   ['shoes_2'] = 0,
					['helmet_1'] = 108,  ['helmet_2'] = 2,
					['chain_1'] = 6,    ['chain_2'] = 0,
					['ears_1'] = -1,     ['ears_2'] = 0,
					['bproof_1'] = 62,  ['bproof_2'] = 0,
					['mask_1'] = 121,   ['mask_2'] = 0,
					['bags_1'] = 0,  ['bags_2'] = 0
				},
				female = {
					['tshirt_1'] = 236,  ['tshirt_2'] = 0,
					['torso_1'] = 423,   ['torso_2'] = 1,
					['decals_1'] = 0,   ['decals_2'] = 0,
					['arms'] = 14,
					['pants_1'] = 121,   ['pants_2'] = 2,
					['shoes_1'] = 25,   ['shoes_2'] = 0,
					['helmet_1'] = 106,  ['helmet_2'] = 1,
					['chain_1'] = 0,    ['chain_2'] = 0,
					['ears_1'] = 0,     ['ears_2'] = 0,
					['bproof_1'] = 58,  ['bproof_2'] = 0,
					['mask_1'] = 11,    ['mask_2'] = 0,
					['glasses_1'] = 11, ['glasses_2'] = 0
				}
			},
			sheriff_patrol3 = { 
				male = {
					['tshirt_1'] = 189,  ['tshirt_2'] = 0,
					['torso_1'] = 400,   ['torso_2'] = 5,
					['decals_1'] = 0,   ['decals_2'] = 0,
					['arms'] = 41,
					['pants_1'] = 114,   ['pants_2'] = 5,
					['shoes_1'] = 25,   ['shoes_2'] = 0,
					['helmet_1'] = 108,  ['helmet_2'] = 5,
					['chain_1'] = 6,    ['chain_2'] = 0,
					['ears_1'] = -1,     ['ears_2'] = 0,
					['bproof_1'] = 62,  ['bproof_2'] = 1,
					['mask_1'] = 121,   ['mask_2'] = 0,
					['bags_1'] = 0,  ['bags_2'] = 0
				},
				female = {
					['tshirt_1'] = 236,  ['tshirt_2'] = 0,
					['torso_1'] = 423,   ['torso_2'] = 5,
					['decals_1'] = 0,   ['decals_2'] = 0,
					['arms'] = 14,
					['pants_1'] = 121,   ['pants_2'] = 5,
					['shoes_1'] = 25,   ['shoes_2'] = 0,
					['helmet_1'] = 106,  ['helmet_2'] = 5,
					['chain_1'] = 6,    ['chain_2'] = 0,
					['ears_1'] = 0,     ['ears_2'] = 0,
					['bproof_1'] = 58,  ['bproof_2'] = 1,
					['mask_1'] = 11,  ['mask_2'] = 0,
					['bags_1'] = 0,  ['bags_2'] = 0
				}
			},
			
				--- MUNDUR BOJOWY KAPITANA ---
		police_patrol4 = { 
			male = {
				['tshirt_1'] = 189,  ['tshirt_2'] = 0,
				['torso_1'] = 400,   ['torso_2'] = 2,
				['decals_1'] = 0,   ['decals_2'] = 0,
				['arms'] = 41,
				['pants_1'] = 114,   ['pants_2'] = 2,
				['shoes_1'] = 25,   ['shoes_2'] = 0,
				['helmet_1'] = 108,  ['helmet_2'] = 2,
				['chain_1'] = 1,    ['chain_2'] = 0,
				['ears_1'] = -1,     ['ears_2'] = 0,
				['bproof_1'] = 83,  ['bproof_2'] = 0,
				['mask_1'] = 121,   ['mask_2'] = 0,
				['bags_1'] = 0,  ['bags_2'] = 0
			},
			female = {
				['tshirt_1'] = 236,  ['tshirt_2'] = 0,
				['torso_1'] = 423,   ['torso_2'] = 2,
				['decals_1'] = 0,   ['decals_2'] = 0,
				['arms'] = 14,
				['pants_1'] = 121,   ['pants_2'] = 2,
				['shoes_1'] = 25,   ['shoes_2'] = 0,
				['helmet_1'] = 106,  ['helmet_2'] = 1,
				['chain_1'] = 1,    ['chain_2'] = 0,
				['ears_1'] = 0,     ['ears_2'] = 0,
				['bproof_1'] = 79,  ['bproof_2'] = 0,
				['mask_1'] = 11,    ['mask_2'] = 0,
				['glasses_1'] = 11, ['glasses_2'] = 0
			}
			},
			sheriff_patrol4 = { 
				male = {
					['tshirt_1'] = 189,  ['tshirt_2'] = 0,
					['torso_1'] = 400,   ['torso_2'] = 6,
					['decals_1'] = 0,   ['decals_2'] = 0,
					['arms'] = 41,
					['pants_1'] = 114,   ['pants_2'] = 5,
					['shoes_1'] = 25,   ['shoes_2'] = 0,
					['helmet_1'] = 96,  ['helmet_2'] = 5,
					['chain_1'] = 1,    ['chain_2'] = 0,
					['ears_1'] = -1,     ['ears_2'] = 0,
					['bproof_1'] = 83,  ['bproof_2'] = 1,
					['mask_1'] = 121,   ['mask_2'] = 0,
					['bags_1'] = 0,  ['bags_2'] = 0
				
				},
				female = {
					['tshirt_1'] = 236,  ['tshirt_2'] = 0,
					['torso_1'] = 423,   ['torso_2'] = 6,
					['decals_1'] = 0,   ['decals_2'] = 0,
					['arms'] = 14,
					['pants_1'] = 121,   ['pants_2'] = 5,
					['shoes_1'] = 25,   ['shoes_2'] = 0,
					['helmet_1'] = 106,  ['helmet_2'] = 5,
					['chain_1'] = 1,    ['chain_2'] = 0,
					['ears_1'] = 2,     ['ears_2'] = 0,
					['bproof_1'] = 79,  ['bproof_2'] = 1,
					['mask_1'] = 11,  ['mask_2'] = 0,
					['bags_1'] = 0,  ['bags_2'] = 0
				
				}
			},
	
					--- STROJE SERT/SWAT ---
					--- STROJE SERT/SWAT ---
					sert_wear = { 
						male = {
							['tshirt_1'] = 192,  ['tshirt_2'] = 0,
							['torso_1'] = 400,   ['torso_2'] = 9,
							['decals_1'] = 0,   ['decals_2'] = 0,
							['arms'] = 19,
							['pants_1'] = 114,   ['pants_2'] = 8,
							['shoes_1'] = 25,   ['shoes_2'] = 0,
							['helmet_1'] = 108,  ['helmet_2'] = 8,
							['chain_1'] = 0,    ['chain_2'] = 0,
							['ears_1'] = -1,     ['ears_2'] = 0,
							['bproof_1'] = 0,  ['bproof_2'] = 0,
							['mask_1'] = 0,   ['mask_2'] = 0,
							['bags_1'] = 0,  ['bags_2'] = 0
						},
						female = {
							['tshirt_1'] = 90,  ['tshirt_2'] = 0,
							['torso_1'] = 266,   ['torso_2'] = 8,
							['decals_1'] = 0,   ['decals_2'] = 0,
							['arms'] = 31,
							['pants_1'] = 117,   ['pants_2'] = 0,
							['shoes_1'] = 25,   ['shoes_2'] = 0,
							['helmet_1'] = 106,  ['helmet_2'] = 8,
							['chain_1'] = 1,    ['chain_2'] = 0,
							['ears_1'] = -1,     ['ears_2'] = 0,
							['bproof_1'] = 24,  ['bproof_2'] = 5,
							['bags_1'] = 0,  ['bags_2'] = 0,
							['glasses_1'] = 9,  ['glasses_2'] = 1,
							['mask_1'] = 169,  ['mask_2'] = 13
			
						},
					},
						sert_wear2 = { 
						male = {
							['tshirt_1'] = 189,  ['tshirt_2'] = 0,
							['torso_1'] = 405,   ['torso_2'] = 8,
							['decals_1'] = 0,   ['decals_2'] = 0,
							['arms'] = 22,
							['pants_1'] = 114,   ['pants_2'] = 8,
							['shoes_1'] = 25,   ['shoes_2'] = 0,
							['helmet_1'] = 108,  ['helmet_2'] = 8,
							['chain_1'] = 6,    ['chain_2'] = 0,
							['ears_1'] = -1,     ['ears_2'] = 0,
							['bproof_1'] = 64,  ['bproof_2'] = 0,
							['mask_1'] = 169,   ['mask_2'] = 13,
							['bags_1'] = 0,  ['bags_2'] = 0
			
						},
						female = {
							['tshirt_1'] = 237,  ['tshirt_2'] = 0,
							['torso_1'] = 428,   ['torso_2'] = 8,
							['decals_1'] = 0,   ['decals_2'] = 0,
							['arms'] = 21,
							['pants_1'] = 121,   ['pants_2'] = 8,
							['shoes_1'] = 25,   ['shoes_2'] = 0,
							['helmet_1'] = 106,  ['helmet_2'] = 8,
							['chain_1'] = 3,    ['chain_2'] = 0,
							['ears_1'] = -1,     ['ears_2'] = 0,
							['bproof_1'] = 60,  ['bproof_2'] = 4,
							['bags_1'] = 0,  ['bags_2'] = 0,
							['glasses_1'] = 27,  ['glasses_2'] = 1,
							['mask_1'] = 169,  ['mask_2'] = 0	
						},
					},
						sert_wear3 = { 
						male = {
							['tshirt_1'] = 15,  ['tshirt_2'] = 0,
							['torso_1'] = 409,   ['torso_2'] = 4,
							['decals_1'] = 0,   ['decals_2'] = 0,
							['arms'] = 20,
							['pants_1'] = 114,   ['pants_2'] = 8,
							['shoes_1'] = 25,   ['shoes_2'] = 0,
							['helmet_1'] = 108,  ['helmet_2'] = 8,
							['chain_1'] = 6,    ['chain_2'] = 0,
							['ears_1'] = -1,     ['ears_2'] = 0,
							['bproof_1'] = 0,  ['bproof_2'] = 0,
							['mask_1'] = 0,   ['mask_2'] = 0,
							['bags_1'] = 0,  ['bags_2'] = 0
									},
						female = {
							['tshirt_1'] = 15,  ['tshirt_2'] = 0,
							['torso_1'] = 431,   ['torso_2'] = 2,
							['decals_1'] = 0,   ['decals_2'] = 0,
							['arms'] = 21,
							['pants_1'] = 121,   ['pants_2'] = 8,
							['shoes_1'] = 25,   ['shoes_2'] = 0,
							['helmet_1'] = 106,  ['helmet_2'] = 8,
							['chain_1'] = 5,    ['chain_2'] = 0,
							['ears_1'] = -1,     ['ears_2'] = 0,
							['bproof_1'] = 0,  ['bproof_2'] = 0,
							['bags_1'] = 0,  ['bags_2'] = 0,
							['glasses_1'] = 27,  ['glasses_2'] = 1,
							['mask_1'] = 169,  ['mask_2'] = 0	
				
					}
						},
						sert_wear4 = { 
							male = {
								['tshirt_1'] = 195,  ['tshirt_2'] = 0,
								['torso_1'] = 402,   ['torso_2'] = 15,
								['decals_1'] = 0,   ['decals_2'] = 0,
								['arms'] = 33,
								['pants_1'] = 114,   ['pants_2'] = 8,
								['shoes_1'] = 25,   ['shoes_2'] = 0,
								['helmet_1'] = 39,  ['helmet_2'] = 0,
								['chain_1'] = 0,    ['chain_2'] = 0,
								['ears_1'] = -1,     ['ears_2'] = 0,
								['bproof_1'] = 64,  ['bproof_2'] = 0,
								['mask_1'] = 169,   ['mask_2'] = 0,
								['bags_1'] = 105,  ['bags_2'] = 2
								
							},
							female = {
								['tshirt_1'] = 237,  ['tshirt_2'] = 0,
								['torso_1'] = 428,   ['torso_2'] = 8,
								['decals_1'] = 0,   ['decals_2'] = 0,
								['arms'] = 21,
								['pants_1'] = 121,   ['pants_2'] = 8,
								['shoes_1'] = 25,   ['shoes_2'] = 0,
								['helmet_1'] = 111,  ['helmet_2'] = 0,
								['chain_1'] = 3,    ['chain_2'] = 0,
								['ears_1'] = -1,     ['ears_2'] = 0,
								['bproof_1'] = 63,  ['bproof_2'] = 0,
								['bags_1'] = 0,  ['bags_2'] = 0,
								['glasses_1'] = 27,  ['glasses_2'] = 1,
								['mask_1'] = 169,  ['mask_2'] = 0
					
						}
							},
	
							swat_david1 = { 
								male = {
									['tshirt_1'] = 194,  ['tshirt_2'] = 0,
									['torso_1'] = 402,   ['torso_2'] = 21,
									['decals_1'] = 0,   ['decals_2'] = 0,
									['arms'] = 176,
									['pants_1'] = 144,   ['pants_2'] = 1,
									['shoes_1'] = 25,   ['shoes_2'] = 0,
									['helmet_1'] = 39,  ['helmet_2'] = 1,
									['chain_1'] = 7,    ['chain_2'] = 0,
									['ears_1'] = -1,     ['ears_2'] = 0,
									['bproof_1'] = 82,  ['bproof_2'] = 6,
									['mask_1'] = 104,   ['mask_2'] = 25,
									['bags_1'] = 83,  ['bags_2'] = 0
									
								},
								female = {
									['tshirt_1'] = 237,  ['tshirt_2'] = 0,
									['torso_1'] = 426,   ['torso_2'] = 21,
									['decals_1'] = 0,   ['decals_2'] = 0,
									['arms'] = 18,
									['pants_1'] = 153,   ['pants_2'] = 1,
									['shoes_1'] = 25,   ['shoes_2'] = 0,
									['helmet_1'] = 111,  ['helmet_2'] = 1,
									['chain_1'] = 3,    ['chain_2'] = 0,
									['ears_1'] = -1,     ['ears_2'] = 0,
									['bproof_1'] = 63,  ['bproof_2'] = 1,
									['bags_1'] = 0,  ['bags_2'] = 0,
									['glasses_1'] = 0,  ['glasses_2'] = 0,
									['mask_1'] = 169,  ['mask_2'] = 0
						
							}
								},
	
								swat_david2 = { 
									male = {
										['tshirt_1'] = 194,  ['tshirt_2'] = 0,
										['torso_1'] = 402,   ['torso_2'] = 23,
										['decals_1'] = 0,   ['decals_2'] = 0,
										['arms'] = 176,
										['pants_1'] = 144,   ['pants_2'] = 2,
										['shoes_1'] = 25,   ['shoes_2'] = 0,
										['helmet_1'] = 39,  ['helmet_2'] = 1,
										['chain_1'] = 7,    ['chain_2'] = 0,
										['ears_1'] = -1,     ['ears_2'] = 0,
										['bproof_1'] = 82,  ['bproof_2'] = 6,
										['mask_1'] = 104,   ['mask_2'] = 25,
										['bags_1'] = 83,  ['bags_2'] = 0
										
									},
									female = {
										['tshirt_1'] = 237,  ['tshirt_2'] = 0,
										['torso_1'] = 426,   ['torso_2'] = 23,
										['decals_1'] = 0,   ['decals_2'] = 0,
										['arms'] = 18,
										['pants_1'] = 153,   ['pants_2'] = 2,
										['shoes_1'] = 25,   ['shoes_2'] = 0,
										['helmet_1'] = 111,  ['helmet_2'] = 1,
										['chain_1'] = 3,    ['chain_2'] = 0,
										['ears_1'] = -1,     ['ears_2'] = 0,
										['bproof_1'] = 63,  ['bproof_2'] = 1,
										['bags_1'] = 0,  ['bags_2'] = 0,
										['glasses_1'] = 0,  ['glasses_2'] = 0,
										['mask_1'] = 169,  ['mask_2'] = 0
							
								}
									},
	
									swat_david3 = { 
										male = {
											['tshirt_1'] = 194,  ['tshirt_2'] = 0,
											['torso_1'] = 402,   ['torso_2'] = 22,
											['decals_1'] = 0,   ['decals_2'] = 0,
											['arms'] = 176,
											['pants_1'] = 144,   ['pants_2'] = 0,
											['shoes_1'] = 25,   ['shoes_2'] = 0,
											['helmet_1'] = 39,  ['helmet_2'] = 1,
											['chain_1'] = 7,    ['chain_2'] = 0,
											['ears_1'] = -1,     ['ears_2'] = 0,
											['bproof_1'] = 82,  ['bproof_2'] = 6,
											['mask_1'] = 104,   ['mask_2'] = 25,
											['bags_1'] = 83,  ['bags_2'] = 0
											
										},
										female = {
											['tshirt_1'] = 237,  ['tshirt_2'] = 0,
											['torso_1'] = 426,   ['torso_2'] = 22,
											['decals_1'] = 0,   ['decals_2'] = 0,
											['arms'] = 18,
											['pants_1'] = 153,   ['pants_2'] = 0,
											['shoes_1'] = 25,   ['shoes_2'] = 0,
											['helmet_1'] = 111,  ['helmet_2'] = 1,
											['chain_1'] = 3,    ['chain_2'] = 0,
											['ears_1'] = -1,     ['ears_2'] = 0,
											['bproof_1'] = 63,  ['bproof_2'] = 1,
											['bags_1'] = 0,  ['bags_2'] = 0,
											['glasses_1'] = 0,  ['glasses_2'] = 0,
											['mask_1'] = 169,  ['mask_2'] = 0
								
									}
										},
	
										swat_david4 = { 
											male = {
												['tshirt_1'] = 194,  ['tshirt_2'] = 0,
												['torso_1'] = 402,   ['torso_2'] = 24,
												['decals_1'] = 0,   ['decals_2'] = 0,
												['arms'] = 176,
												['pants_1'] = 144,   ['pants_2'] = 3,
												['shoes_1'] = 25,   ['shoes_2'] = 0,
												['helmet_1'] = 39,  ['helmet_2'] = 1,
												['chain_1'] = 7,    ['chain_2'] = 0,
												['ears_1'] = -1,     ['ears_2'] = 0,
												['bproof_1'] = 82,  ['bproof_2'] = 6,
												['mask_1'] = 104,   ['mask_2'] = 25,
												['bags_1'] = 83,  ['bags_2'] = 0
												
											},
											female = {
												['tshirt_1'] = 237,  ['tshirt_2'] = 0,
												['torso_1'] = 426,   ['torso_2'] = 24,
												['decals_1'] = 0,   ['decals_2'] = 0,
												['arms'] = 18,
												['pants_1'] = 153,   ['pants_2'] = 3,
												['shoes_1'] = 25,   ['shoes_2'] = 0,
												['helmet_1'] = 111,  ['helmet_2'] = 1,
												['chain_1'] = 3,    ['chain_2'] = 0,
												['ears_1'] = -1,     ['ears_2'] = 0,
												['bproof_1'] = 63,  ['bproof_2'] = 1,
												['bags_1'] = 0,  ['bags_2'] = 0,
												['glasses_1'] = 0,  ['glasses_2'] = 0,
												['mask_1'] = 169,  ['mask_2'] = 0
									
										}
											},
	
											sert_david1 = { 
												male = {
													['tshirt_1'] = 194,  ['tshirt_2'] = 0,
													['torso_1'] = 402,   ['torso_2'] = 16,
													['decals_1'] = 0,   ['decals_2'] = 0,
													['arms'] = 176,
													['pants_1'] = 144,   ['pants_2'] = 1,
													['shoes_1'] = 25,   ['shoes_2'] = 0,
													['helmet_1'] = 39,  ['helmet_2'] = 0,
													['chain_1'] = 7,    ['chain_2'] = 0,
													['ears_1'] = -1,     ['ears_2'] = 0,
													['bproof_1'] = 82,  ['bproof_2'] = 5,
													['mask_1'] = 104,   ['mask_2'] = 25,
													['bags_1'] = 83,  ['bags_2'] = 0
													
												},
												female = {
													['tshirt_1'] = 237,  ['tshirt_2'] = 0,
													['torso_1'] = 426,   ['torso_2'] = 16,
													['decals_1'] = 0,   ['decals_2'] = 0,
													['arms'] = 18,
													['pants_1'] = 153,   ['pants_2'] = 1,
													['shoes_1'] = 25,   ['shoes_2'] = 0,
													['helmet_1'] = 111,  ['helmet_2'] = 0,
													['chain_1'] = 3,    ['chain_2'] = 0,
													['ears_1'] = -1,     ['ears_2'] = 0,
													['bproof_1'] = 63,  ['bproof_2'] = 0,
													['bags_1'] = 0,  ['bags_2'] = 0,
													['glasses_1'] = 0,  ['glasses_2'] = 0,
													['mask_1'] = 169,  ['mask_2'] = 0
										
											}
												},
					
												sert_david2 = { 
													male = {
														['tshirt_1'] = 194,  ['tshirt_2'] = 0,
														['torso_1'] = 402,   ['torso_2'] = 18,
														['decals_1'] = 0,   ['decals_2'] = 0,
														['arms'] = 176,
														['pants_1'] = 144,   ['pants_2'] = 2,
														['shoes_1'] = 25,   ['shoes_2'] = 0,
														['helmet_1'] = 39,  ['helmet_2'] = 0,
														['chain_1'] = 7,    ['chain_2'] = 0,
														['ears_1'] = -1,     ['ears_2'] = 0,
														['bproof_1'] = 82,  ['bproof_2'] = 5,
														['mask_1'] = 104,   ['mask_2'] = 25,
														['bags_1'] = 83,  ['bags_2'] = 0
														
													},
													female = {
														['tshirt_1'] = 237,  ['tshirt_2'] = 0,
														['torso_1'] = 426,   ['torso_2'] = 18,
														['decals_1'] = 0,   ['decals_2'] = 0,
														['arms'] = 18,
														['pants_1'] = 153,   ['pants_2'] = 2,
														['shoes_1'] = 25,   ['shoes_2'] = 0,
														['helmet_1'] = 111,  ['helmet_2'] = 0,
														['chain_1'] = 3,    ['chain_2'] = 0,
														['ears_1'] = -1,     ['ears_2'] = 0,
														['bproof_1'] = 63,  ['bproof_2'] = 0,
														['bags_1'] = 0,  ['bags_2'] = 0,
														['glasses_1'] = 0,  ['glasses_2'] = 0,
														['mask_1'] = 169,  ['mask_2'] = 0
											
												}
													},
					
													sert_david3 = { 
														male = {
															['tshirt_1'] = 194,  ['tshirt_2'] = 0,
															['torso_1'] = 402,   ['torso_2'] = 17,
															['decals_1'] = 0,   ['decals_2'] = 0,
															['arms'] = 176,
															['pants_1'] = 144,   ['pants_2'] = 0,
															['shoes_1'] = 25,   ['shoes_2'] = 0,
															['helmet_1'] = 39,  ['helmet_2'] = 0,
															['chain_1'] = 7,    ['chain_2'] = 0,
															['ears_1'] = -1,     ['ears_2'] = 0,
															['bproof_1'] = 82,  ['bproof_2'] = 5,
															['mask_1'] = 104,   ['mask_2'] = 25,
															['bags_1'] = 83,  ['bags_2'] = 0
															
														},
														female = {
															['tshirt_1'] = 237,  ['tshirt_2'] = 0,
															['torso_1'] = 426,   ['torso_2'] = 17,
															['decals_1'] = 0,   ['decals_2'] = 0,
															['arms'] = 18,
															['pants_1'] = 153,   ['pants_2'] = 0,
															['shoes_1'] = 25,   ['shoes_2'] = 0,
															['helmet_1'] = 111,  ['helmet_2'] = 0,
															['chain_1'] = 3,    ['chain_2'] = 0,
															['ears_1'] = -1,     ['ears_2'] = 0,
															['bproof_1'] = 63,  ['bproof_2'] = 0,
															['bags_1'] = 0,  ['bags_2'] = 0,
															['glasses_1'] = 0,  ['glasses_2'] = 0,
															['mask_1'] = 169,  ['mask_2'] = 0
												
													}
														},
					
														sert_david4 = { 
															male = {
																['tshirt_1'] = 194,  ['tshirt_2'] = 0,
																['torso_1'] = 402,   ['torso_2'] = 19,
																['decals_1'] = 0,   ['decals_2'] = 0,
																['arms'] = 176,
																['pants_1'] = 144,   ['pants_2'] = 3,
																['shoes_1'] = 25,   ['shoes_2'] = 0,
																['helmet_1'] = 39,  ['helmet_2'] = 0,
																['chain_1'] = 7,    ['chain_2'] = 0,
																['ears_1'] = -1,     ['ears_2'] = 0,
																['bproof_1'] = 82,  ['bproof_2'] = 5,
																['mask_1'] = 104,   ['mask_2'] = 25,
																['bags_1'] = 83,  ['bags_2'] = 0
																
															},
															female = {
																['tshirt_1'] = 237,  ['tshirt_2'] = 0,
																['torso_1'] = 426,   ['torso_2'] = 19,
																['decals_1'] = 0,   ['decals_2'] = 0,
																['arms'] = 18,
																['pants_1'] = 153,   ['pants_2'] = 3,
																['shoes_1'] = 25,   ['shoes_2'] = 0,
																['helmet_1'] = 111,  ['helmet_2'] = 0,
																['chain_1'] = 3,    ['chain_2'] = 0,
																['ears_1'] = -1,     ['ears_2'] = 0,
																['bproof_1'] = 63,  ['bproof_2'] = 0,
																['bags_1'] = 0,  ['bags_2'] = 0,
																['glasses_1'] = 0,  ['glasses_2'] = 0,
																['mask_1'] = 169,  ['mask_2'] = 0
													
														}
															},
	
			
						swat_wear = { 
							male = {
								['tshirt_1'] = 189,  ['tshirt_2'] = 0,
											['torso_1'] = 400,   ['torso_2'] = 10,
											['decals_1'] = 0,   ['decals_2'] = 0,
											['arms'] = 19,
											['pants_1'] = 114,   ['pants_2'] = 9,
											['shoes_1'] = 25,   ['shoes_2'] = 0,
											['helmet_1'] = 108,  ['helmet_2'] = 9,
											['chain_1'] = 0,    ['chain_2'] = 0,
											['ears_1'] = -1,     ['ears_2'] = 0,
											['bproof_1'] = 0,  ['bproof_2'] = 1,
											['mask_1'] = 0,   ['mask_2'] = 0,
											['bags_1'] = 0,  ['bags_2'] = 0
							},
							female = {
								['tshirt_1'] = 90,  ['tshirt_2'] = 0,
								['torso_1'] = 266,   ['torso_2'] = 8,
								['decals_1'] = 0,   ['decals_2'] = 0,
								['arms'] = 57,
								['pants_1'] = 117,   ['pants_2'] = 0,
								['shoes_1'] = 25,   ['shoes_2'] = 0,
								['helmet_1'] = 106,  ['helmet_2'] = 9,
								['chain_1'] = 1,    ['chain_2'] = 0,
								['ears_1'] = -1,     ['ears_2'] = 0,
								['bproof_1'] = 0,  ['bproof_2'] = 0,
								['bags_1'] = 0,  ['bags_2'] = 0,
								['glasses_1'] = 9,  ['glasses_2'] = 1,
								['mask_1'] = 0,  ['mask_2'] = 0
					
						}
							},
						swat_wear2 = { 
							male = {
								['tshirt_1'] = 189,  ['tshirt_2'] = 0,
								['torso_1'] = 405,   ['torso_2'] = 9,
								['decals_1'] = 0,   ['decals_2'] = 0,
								['arms'] = 18,
								['pants_1'] = 114,   ['pants_2'] = 9,
								['shoes_1'] = 25,   ['shoes_2'] = 0,
								['helmet_1'] = 108,  ['helmet_2'] = 8,
								['chain_1'] = 0,    ['chain_2'] = 0,
								['ears_1'] = -1,     ['ears_2'] = 0,
								['bproof_1'] = 64,  ['bproof_2'] = 1,
								['mask_1'] = 169,   ['mask_2'] = 0,
								['bags_1'] = 0,  ['bags_2'] = 0
							},
							female = {
								['tshirt_1'] = 237,  ['tshirt_2'] = 0,
								['torso_1'] = 428,   ['torso_2'] = 9,
								['decals_1'] = 0,   ['decals_2'] = 0,
								['arms'] = 21,
								['pants_1'] = 121,   ['pants_2'] = 9,
								['shoes_1'] = 25,   ['shoes_2'] = 0,
								['helmet_1'] = 106,  ['helmet_2'] = 9,
								['chain_1'] = 3,    ['chain_2'] = 0,
								['ears_1'] = -1,     ['ears_2'] = 0,
								['bproof_1'] = 60,  ['bproof_2'] = 5,
								['bags_1'] = 0,  ['bags_2'] = 0,
								['glasses_1'] = 27,  ['glasses_2'] = 1,
								['mask_1'] = 169,  ['mask_2'] = 0					
						},
							},
						swat_wear3 = { 
							male = {
								['tshirt_1'] = 16,  ['tshirt_2'] = 0,
								['torso_1'] = 409,   ['torso_2'] = 5,
								['decals_1'] = 0,   ['decals_2'] = 0,
								['arms'] = 20,
								['pants_1'] = 114,   ['pants_2'] = 9,
								['shoes_1'] = 25,   ['shoes_2'] = 0,
								['helmet_1'] = 108,  ['helmet_2'] = 9,
								['chain_1'] = 7,    ['chain_2'] = 0,
								['ears_1'] = -1,     ['ears_2'] = 0,
								['bproof_1'] = 0,  ['bproof_2'] = 0,
								['mask_1'] = 121,   ['mask_2'] = 0,
								['bags_1'] = 0,  ['bags_2'] = 0
							},
							female = {
								['tshirt_1'] = 15,  ['tshirt_2'] = 0,
								['torso_1'] = 431,   ['torso_2'] = 3,
								['decals_1'] = 0,   ['decals_2'] = 0,
								['arms'] = 21,
								['pants_1'] = 121,   ['pants_2'] = 9,
								['shoes_1'] = 25,   ['shoes_2'] = 0,
								['helmet_1'] = 106,  ['helmet_2'] = 9,
								['chain_1'] = 5,    ['chain_2'] = 0,
								['ears_1'] = -1,     ['ears_2'] = 0,
								['bproof_1'] = 0,  ['bproof_2'] = 0,
								['bags_1'] = 0,  ['bags_2'] = 0,
								['glasses_1'] = 27,  ['glasses_2'] = 1,
								['mask_1'] = 169,  ['mask_2'] = 0					
						}
							},
						swat_wear4 = { 
							male = {
								['tshirt_1'] = 195,  ['tshirt_2'] = 0,
								['torso_1'] = 405,   ['torso_2'] = 9,
								['decals_1'] = 0,   ['decals_2'] = 0,
								['arms'] = 33,
								['pants_1'] = 114,   ['pants_2'] = 9,
								['shoes_1'] = 25,   ['shoes_2'] = 0,
								['helmet_1'] = 39,  ['helmet_2'] = 1,
								['chain_1'] = 0,    ['chain_2'] = 0,
								['ears_1'] = -1,     ['ears_2'] = 0,
								['bproof_1'] = 64,  ['bproof_2'] = 1,
								['mask_1'] = 169,   ['mask_2'] = 0,
								['bags_1'] = 0,  ['bags_2'] = 0
							},
							female = {
								['tshirt_1'] = 237,  ['tshirt_2'] = 0,
								['torso_1'] = 428,   ['torso_2'] = 9,
								['decals_1'] = 0,   ['decals_2'] = 0,
								['arms'] = 21,
								['pants_1'] = 121,   ['pants_2'] = 9,
								['shoes_1'] = 25,   ['shoes_2'] = 0,
								['helmet_1'] = 111,  ['helmet_2'] = 1,
								['chain_1'] = 3,    ['chain_2'] = 0,
								['ears_1'] = -1,     ['ears_2'] = 0,
								['bproof_1'] = 63,  ['bproof_2'] = 1,
								['bags_1'] = 0,  ['bags_2'] = 0,
								['glasses_1'] = 27,  ['glasses_2'] = 1,
								['mask_1'] = 169,  ['mask_2'] = 0
					
						}
							},
							swat_koszulka1 = { 
								male = {
									['tshirt_1'] = 189,  ['tshirt_2'] = 0,
									['torso_1'] = 400,   ['torso_2'] = 19,
									['decals_1'] = 0,   ['decals_2'] = 0,
									['arms'] = 19,
									['pants_1'] = 114,   ['pants_2'] = 9,
									['shoes_1'] = 25,   ['shoes_2'] = 0,
									['helmet_1'] = -1,  ['helmet_2'] = 0,
									['chain_1'] = 1,    ['chain_2'] = 0,
									['ears_1'] = -1,     ['ears_2'] = 0,
									['bproof_1'] = 3,  ['bproof_2'] = 0,
									['mask_1'] = 121,   ['mask_2'] = 0,
									['bags_1'] = 0,  ['bags_2'] = 0
								},
								female = {
									['tshirt_1'] = 237,  ['tshirt_2'] = 0,
									['torso_1'] = 423,   ['torso_2'] = 19,
									['decals_1'] = 0,   ['decals_2'] = 0,
									['arms'] = 31,
									['pants_1'] = 121,   ['pants_2'] = 9,
									['shoes_1'] = 25,   ['shoes_2'] = 0,
									['helmet_1'] = -1,  ['helmet_2'] = 0,
									['chain_1'] = 3,    ['chain_2'] = 0,
									['ears_1'] = -1,     ['ears_2'] = 0,
									['bproof_1'] = 72,  ['bproof_2'] = 0,
									['bags_1'] = 0,  ['bags_2'] = 0,
									['glasses_1'] = 5,  ['glasses_2'] = 0,
									['mask_1'] = 121,  ['mask_2'] = 0
						
							}
								},
								swat_koszulka2 = { 
									male = {
										['tshirt_1'] = 189,  ['tshirt_2'] = 0,
										['torso_1'] = 400,   ['torso_2'] = 21,
										['decals_1'] = 0,   ['decals_2'] = 0,
										['arms'] = 19,
										['pants_1'] = 114,   ['pants_2'] = 9,
										['shoes_1'] = 25,   ['shoes_2'] = 0,
										['helmet_1'] = -1,  ['helmet_2'] = 0,
										['chain_1'] = 1,    ['chain_2'] = 0,
										['ears_1'] = -1,     ['ears_2'] = 0,
										['bproof_1'] = 3,  ['bproof_2'] = 0,
										['mask_1'] = 121,   ['mask_2'] = 0,
										['bags_1'] = 0,  ['bags_2'] = 0
									},
									female = {
										['tshirt_1'] = 237,  ['tshirt_2'] = 0,
										['torso_1'] = 423,   ['torso_2'] = 21,
										['decals_1'] = 0,   ['decals_2'] = 0,
										['arms'] = 31,
										['pants_1'] = 121,   ['pants_2'] = 9,
										['shoes_1'] = 25,   ['shoes_2'] = 0,
										['helmet_1'] = -1,  ['helmet_2'] = 0,
										['chain_1'] = 3,    ['chain_2'] = 0,
										['ears_1'] = -1,     ['ears_2'] = 0,
										['bproof_1'] = 72,  ['bproof_2'] = 0,
										['bags_1'] = 0,  ['bags_2'] = 0,
										['glasses_1'] = 5,  ['glasses_2'] = 0,
										['mask_1'] = 121,  ['mask_2'] = 0
							
								}
									},
									swat_koszulka3 = { 
										male = {
											['tshirt_1'] = 189,  ['tshirt_2'] = 0,
											['torso_1'] = 400,   ['torso_2'] = 20,
											['decals_1'] = 0,   ['decals_2'] = 0,
											['arms'] = 19,
											['pants_1'] = 114,   ['pants_2'] = 9,
											['shoes_1'] = 25,   ['shoes_2'] = 0,
											['helmet_1'] = -1,  ['helmet_2'] = 0,
											['chain_1'] = 1,    ['chain_2'] = 0,
											['ears_1'] = -1,     ['ears_2'] = 0,
											['bproof_1'] = 3,  ['bproof_2'] = 0,
											['mask_1'] = 121,   ['mask_2'] = 0,
											['bags_1'] = 0,  ['bags_2'] = 0
										},
										female = {
											['tshirt_1'] = 237,  ['tshirt_2'] = 0,
											['torso_1'] = 423,   ['torso_2'] = 20,
											['decals_1'] = 0,   ['decals_2'] = 0,
											['arms'] = 31,
											['pants_1'] = 121,   ['pants_2'] = 9,
											['shoes_1'] = 25,   ['shoes_2'] = 0,
											['helmet_1'] = -1,  ['helmet_2'] = 0,
											['chain_1'] = 3,    ['chain_2'] = 0,
											['ears_1'] = -1,     ['ears_2'] = 0,
											['bproof_1'] = 72,  ['bproof_2'] = 0,
											['bags_1'] = 0,  ['bags_2'] = 0,
											['glasses_1'] = 5,  ['glasses_2'] = 0,
											['mask_1'] = 121,  ['mask_2'] = 0
								
									}
										},
										swat_koszulka4 = { 
											male = {
												['tshirt_1'] = 189,  ['tshirt_2'] = 0,
												['torso_1'] = 400,   ['torso_2'] = 22,
												['decals_1'] = 0,   ['decals_2'] = 0,
												['arms'] = 19,
												['pants_1'] = 114,   ['pants_2'] = 9,
												['shoes_1'] = 25,   ['shoes_2'] = 0,
												['helmet_1'] = -1,  ['helmet_2'] = 0,
												['chain_1'] = 1,    ['chain_2'] = 0,
												['ears_1'] = -1,     ['ears_2'] = 0,
												['bproof_1'] = 3,  ['bproof_2'] = 0,
												['mask_1'] = 121,   ['mask_2'] = 0,
												['bags_1'] = 0,  ['bags_2'] = 0
											},
											female = {
												['tshirt_1'] = 237,  ['tshirt_2'] = 0,
												['torso_1'] = 423,   ['torso_2'] = 22,
												['decals_1'] = 0,   ['decals_2'] = 0,
												['arms'] = 31,
												['pants_1'] = 121,   ['pants_2'] = 9,
												['shoes_1'] = 25,   ['shoes_2'] = 0,
												['helmet_1'] = -1,  ['helmet_2'] = 0,
												['chain_1'] = 3,    ['chain_2'] = 0,
												['ears_1'] = -1,     ['ears_2'] = 0,
												['bproof_1'] = 72,  ['bproof_2'] = 0,
												['bags_1'] = 0,  ['bags_2'] = 0,
												['glasses_1'] = 5,  ['glasses_2'] = 0,
												['mask_1'] = 121,  ['mask_2'] = 0
									
										}
											},
											sert_koszulka1 = { 
												male = {
													['tshirt_1'] = 192,  ['tshirt_2'] = 0,
													['torso_1'] = 400,   ['torso_2'] = 15,
													['decals_1'] = 0,   ['decals_2'] = 0,
													['arms'] = 19,
													['pants_1'] = 114,   ['pants_2'] = 8,
													['shoes_1'] = 25,   ['shoes_2'] = 0,
													['helmet_1'] = 108,  ['helmet_2'] = 8,
													['chain_1'] = 0,    ['chain_2'] = 0,
													['ears_1'] = -1,     ['ears_2'] = 0,
													['bproof_1'] = 0,  ['bproof_2'] = 0,
													['mask_1'] = 121,   ['mask_2'] = 0,
													['bags_1'] = 0,  ['bags_2'] = 0
												},
												female = {
													['tshirt_1'] = 237,  ['tshirt_2'] = 0,
													['torso_1'] = 423,   ['torso_2'] = 15,
													['decals_1'] = 0,   ['decals_2'] = 0,
													['arms'] = 31,
													['pants_1'] = 121,   ['pants_2'] = 8,
													['shoes_1'] = 25,   ['shoes_2'] = 0,
													['helmet_1'] = -1,  ['helmet_2'] = 0,
													['chain_1'] = 3,    ['chain_2'] = 0,
													['ears_1'] = -1,     ['ears_2'] = 0,
													['bproof_1'] = 72,  ['bproof_2'] = 0,
													['bags_1'] = 0,  ['bags_2'] = 0,
													['glasses_1'] = 5,  ['glasses_2'] = 0,
													['mask_1'] = 121,  ['mask_2'] = 0
										
											}
												},
												sert_koszulka2 = { 
													male = {
														['tshirt_1'] = 189,  ['tshirt_2'] = 0,
														['torso_1'] = 400,   ['torso_2'] = 17,
														['decals_1'] = 0,   ['decals_2'] = 0,
														['arms'] = 19,
														['pants_1'] = 114,   ['pants_2'] = 8,
														['shoes_1'] = 25,   ['shoes_2'] = 0,
														['helmet_1'] = -1,  ['helmet_2'] = 0,
														['chain_1'] = 1,    ['chain_2'] = 0,
														['ears_1'] = -1,     ['ears_2'] = 0,
														['bproof_1'] = 3,  ['bproof_2'] = 0,
														['mask_1'] = 121,   ['mask_2'] = 0,
														['bags_1'] = 0,  ['bags_2'] = 0
													},
													female = {
														['tshirt_1'] = 237,  ['tshirt_2'] = 0,
														['torso_1'] = 423,   ['torso_2'] = 17,
														['decals_1'] = 0,   ['decals_2'] = 0,
														['arms'] = 31,
														['pants_1'] = 121,   ['pants_2'] = 8,
														['shoes_1'] = 25,   ['shoes_2'] = 0,
														['helmet_1'] = -1,  ['helmet_2'] = 0,
														['chain_1'] = 3,    ['chain_2'] = 0,
														['ears_1'] = -1,     ['ears_2'] = 0,
														['bproof_1'] = 72,  ['bproof_2'] = 0,
														['bags_1'] = 0,  ['bags_2'] = 0,
														['glasses_1'] = 5,  ['glasses_2'] = 0,
														['mask_1'] = 121,  ['mask_2'] = 0
											
												}
													},
													sert_koszulka3 = { 
														male = {
															['tshirt_1'] = 189,  ['tshirt_2'] = 0,
															['torso_1'] = 400,   ['torso_2'] = 16,
															['decals_1'] = 0,   ['decals_2'] = 0,
															['arms'] = 19,
															['pants_1'] = 114,   ['pants_2'] = 8,
															['shoes_1'] = 25,   ['shoes_2'] = 0,
															['helmet_1'] = -1,  ['helmet_2'] = 0,
															['chain_1'] = 1,    ['chain_2'] = 0,
															['ears_1'] = -1,     ['ears_2'] = 0,
															['bproof_1'] = 3,  ['bproof_2'] = 0,
															['mask_1'] = 121,   ['mask_2'] = 0,
															['bags_1'] = 0,  ['bags_2'] = 0
														},
														female = {
															['tshirt_1'] = 237,  ['tshirt_2'] = 0,
															['torso_1'] = 423,   ['torso_2'] = 16,
															['decals_1'] = 0,   ['decals_2'] = 0,
															['arms'] = 31,
															['pants_1'] = 121,   ['pants_2'] = 8,
															['shoes_1'] = 25,   ['shoes_2'] = 0,
															['helmet_1'] = -1,  ['helmet_2'] = 0,
															['chain_1'] = 3,    ['chain_2'] = 0,
															['ears_1'] = -1,     ['ears_2'] = 0,
															['bproof_1'] = 72,  ['bproof_2'] = 0,
															['bags_1'] = 0,  ['bags_2'] = 0,
															['glasses_1'] = 5,  ['glasses_2'] = 0,
															['mask_1'] = 121,  ['mask_2'] = 0
												
													}
														},
														sert_koszulka4 = { 
															male = {
																['tshirt_1'] = 189,  ['tshirt_2'] = 0,
																['torso_1'] = 400,   ['torso_2'] = 18,
																['decals_1'] = 0,   ['decals_2'] = 0,
																['arms'] = 19,
																['pants_1'] = 114,   ['pants_2'] = 8,
																['shoes_1'] = 25,   ['shoes_2'] = 0,
																['helmet_1'] = -1,  ['helmet_2'] = 0,
																['chain_1'] = 1,    ['chain_2'] = 0,
																['ears_1'] = -1,     ['ears_2'] = 0,
																['bproof_1'] = 3,  ['bproof_2'] = 0,
																['mask_1'] = 121,   ['mask_2'] = 0,
																['bags_1'] = 0,  ['bags_2'] = 0
															},
															female = {
																['tshirt_1'] = 237,  ['tshirt_2'] = 0,
																['torso_1'] = 423,   ['torso_2'] = 18,
																['decals_1'] = 0,   ['decals_2'] = 0,
																['arms'] = 31,
																['pants_1'] = 121,   ['pants_2'] = 8,
																['shoes_1'] = 25,   ['shoes_2'] = 0,
																['helmet_1'] = -1,  ['helmet_2'] = 0,
																['chain_1'] = 3,    ['chain_2'] = 0,
																['ears_1'] = -1,     ['ears_2'] = 0,
																['bproof_1'] = 72,  ['bproof_2'] = 0,
																['bags_1'] = 0,  ['bags_2'] = 0,
																['glasses_1'] = 5,  ['glasses_2'] = 0,
																['mask_1'] = 121,  ['mask_2'] = 0
													
														}
															},
	
						--- USMS ---
				usmstraining_uniform = {
				male = {
					['tshirt_1'] = 39,  ['tshirt_2'] = 0,
					['torso_1'] = 375,   ['torso_2'] = 11,
					['decals_1'] = 0,   ['decals_2'] = 0,
					['arms'] = 19,
					['pants_1'] = 114,   ['pants_2'] = 10,
					['shoes_1'] = 25,   ['shoes_2'] = 0,
					['helmet_1'] = 108,  ['helmet_2'] = 11,
					['chain_1'] = 0,    ['chain_2'] = 0,
					['ears_1'] = -1,     ['ears_2'] = 0,
					['bproof_1'] = 2,  ['bproof_2'] = 0,
					['mask_1'] = 0,   ['mask_2'] = 0,
					['bags_1'] = 0,  ['bags_2'] = 0
	
				},
				female = {
					['tshirt_1'] = 28,  ['tshirt_2'] = 0,
					['torso_1'] = 390,   ['torso_2'] = 9,
					['decals_1'] = 0,   ['decals_2'] = 0,
					['arms'] = 44,
					['pants_1'] = 117,   ['pants_2'] = 1,
					['shoes_1'] = 25,   ['shoes_2'] = 0,
					['helmet_1'] = 106,  ['helmet_2'] = 11,
					['chain_1'] = -1,    ['chain_2'] = 0,
					['ears_1'] = -1,     ['ears_2'] = 0,
					['bproof_1'] = 69,  ['bproof_2'] = 0,
					['mask_1'] = 0,  ['mask_2'] = 0,
					['bags_1'] = 0,  ['bags_2'] = 0
	
					}
				},
				usmsdeputy_uniform = {
					male = {
						['tshirt_1'] = 1,  ['tshirt_2'] = 0,
						['torso_1'] = 369,   ['torso_2'] = 11,
						['decals_1'] = 0,   ['decals_2'] = 0,
						['arms'] = 19,
						['pants_1'] = 114,   ['pants_2'] = 10,
						['shoes_1'] = 25,   ['shoes_2'] = 0,
						['helmet_1'] = 108,  ['helmet_2'] = 11,
						['chain_1'] = 0,    ['chain_2'] = 0,
						['ears_1'] = -1,     ['ears_2'] = 0,
						['bproof_1'] = 2,  ['bproof_2'] = 0,
						['mask_1'] = 0,   ['mask_2'] = 0,
						['bags_1'] = 0,  ['bags_2'] = 0
		
					},
					female = {
						['tshirt_1'] = 28,  ['tshirt_2'] = 0,
						['torso_1'] = 390,   ['torso_2'] = 9,
						['decals_1'] = 0,   ['decals_2'] = 0,
						['arms'] = 44,
						['pants_1'] = 117,   ['pants_2'] = 1,
						['shoes_1'] = 25,   ['shoes_2'] = 0,
						['helmet_1'] = 106,  ['helmet_2'] = 11,
						['chain_1'] = -1,    ['chain_2'] = 0,
						['ears_1'] = -1,     ['ears_2'] = 0,
						['bproof_1'] = 69,  ['bproof_2'] = 0,
						['mask_1'] = 0,  ['mask_2'] = 0,
						['bags_1'] = 0,  ['bags_2'] = 0
		
						}
					},
				usmscombat_uniform = { 
				male = {
					['tshirt_1'] = 189,  ['tshirt_2'] = 0,
					['torso_1'] = 400,   ['torso_2'] = 9,
					['decals_1'] = 0,   ['decals_2'] = 0,
					['arms'] = 19,
					['pants_1'] = 114,   ['pants_2'] = 10,
					['shoes_1'] = 25,   ['shoes_2'] = 0,
					['helmet_1'] = 108,  ['helmet_2'] = 11,
					['chain_1'] = 6,    ['chain_2'] = 0,
					['ears_1'] = -1,     ['ears_2'] = 0,
					['bproof_1'] = 59,  ['bproof_2'] = 4,
					['mask_1'] = 121,   ['mask_2'] = 0,
					['bags_1'] = 0,  ['bags_2'] = 0
	
				},
				female = {
					['tshirt_1'] = 28,  ['tshirt_2'] = 1,
					['torso_1'] = 423,   ['torso_2'] = 12,
					['decals_1'] = 0,   ['decals_2'] = 0,
					['arms'] = 44,
					['pants_1'] = 117,   ['pants_2'] = 1,
					['shoes_1'] = 25,   ['shoes_2'] = 0,
					['helmet_1'] = 106,  ['helmet_2'] = 11,
					['chain_1'] = 1,    ['chain_2'] = 0,
					['ears_1'] = -1,     ['ears_2'] = 0,
					['bproof_1'] = 58,  ['bproof_2'] = 3,
					['mask_1'] = 0,  ['mask_2'] = 0,
					['bags_1'] = 0,  ['bags_2'] = 0
	
					}
			},
			usmsofficial_uniform = { 
				male = {
					['tshirt_1'] = 15,  ['tshirt_2'] = 0,
					['torso_1'] = 404,   ['torso_2'] = 2,
					['decals_1'] = 0,   ['decals_2'] = 0,
					['arms'] = 77,
					['pants_1'] = 145,   ['pants_2'] = 0,
					['shoes_1'] = 10,   ['shoes_2'] = 0,
					['helmet_1'] = 166,  ['helmet_2'] = 0,
					['chain_1'] = 0,    ['chain_2'] = 0,
					['ears_1'] = -1,     ['ears_2'] = 0,
					['bproof_1'] = 0,  ['bproof_2'] = 0,
					['mask_1'] = 0,   ['mask_2'] = 0,
					['bags_1'] = 0,  ['bags_2'] = 0
	
				},
				female = {
					['tshirt_1'] = 15,  ['tshirt_2'] = 0,
					['torso_1'] = 393,   ['torso_2'] = 2,
					['decals_1'] = 0,   ['decals_2'] = 0,
					['arms'] = 88,
					['pants_1'] = 133,   ['pants_2'] = 23,
					['shoes_1'] = 29,   ['shoes_2'] = 0,
					['helmet_1'] = 13,  ['helmet_2'] = 5,
					['chain_1'] = 0,    ['chain_2'] = 0,
					['ears_1'] = -1,     ['ears_2'] = 0,
					['bproof_1'] = 0,  ['bproof_2'] = 0,
					['mask_1'] = 121,  ['mask_2'] = 0,
					['bags_1'] = 0,  ['bags_2'] = 0
	
					}
			},
			usmspatrol_uniform = { 
				male = {
					['tshirt_1'] = 189,  ['tshirt_2'] = 0,
					['torso_1'] = 399,   ['torso_2'] = 14,
					['decals_1'] = 0,   ['decals_2'] = 0,
					['arms'] = 12,
					['pants_1'] = 114,   ['pants_2'] = 10,
					['shoes_1'] = 25,   ['shoes_2'] = 0,
					['helmet_1'] = 166,  ['helmet_2'] = 2,
					['chain_1'] = 6,    ['chain_2'] = 0,
					['ears_1'] = -1,     ['ears_2'] = 0,
					['bproof_1'] = 3,  ['bproof_2'] = 0,
					['mask_1'] = 0,   ['mask_2'] = 0,
					['bags_1'] = 0,  ['bags_2'] = 0
	
				},
				female = {
					['tshirt_1'] = 28,  ['tshirt_2'] = 0,
					['torso_1'] = 388,   ['torso_2'] = 14,
					['decals_1'] = 0,   ['decals_2'] = 0,
					['arms'] = 44,
					['pants_1'] = 117,   ['pants_2'] = 1,
					['shoes_1'] = 25,   ['shoes_2'] = 0,
					['helmet_1'] = 13,  ['helmet_2'] = 5,
					['chain_1'] = 0,    ['chain_2'] = 0,
					['ears_1'] = -1,     ['ears_2'] = 0,
					['bproof_1'] = 0,  ['bproof_2'] = 0,
					['mask_1'] = 0,  ['mask_2'] = 0,
					['bags_1'] = 0,  ['bags_2'] = 0
	
					}
			},
			usmsbluza_uniform = { 
				male = {
					['tshirt_1'] = 15,  ['tshirt_2'] = 0,
					['torso_1'] = 409,   ['torso_2'] = 6,
					['decals_1'] = 0,   ['decals_2'] = 0,
					['arms'] = 19,
					['pants_1'] = 114,   ['pants_2'] = 10,
					['shoes_1'] = 25,   ['shoes_2'] = 0,
					['helmet_1'] = 108,  ['helmet_2'] = 11,
					['chain_1'] = 0,    ['chain_2'] = 0,
					['ears_1'] = -1,     ['ears_2'] = 0,
					['bproof_1'] = 0,  ['bproof_2'] = 0,
					['mask_1'] = 121,   ['mask_2'] = 0,
					['bags_1'] = 0,  ['bags_2'] = 0
	
				},
				female = {
					['tshirt_1'] = 28,  ['tshirt_2'] = 0,
					['torso_1'] = 397,   ['torso_2'] = 4,
					['decals_1'] = 0,   ['decals_2'] = 0,
					['arms'] = 47,
					['pants_1'] = 117,   ['pants_2'] = 1,
					['shoes_1'] = 25,   ['shoes_2'] = 0,
					['helmet_1'] = 13,  ['helmet_2'] = 5,
					['chain_1'] = 0,    ['chain_2'] = 0,
					['ears_1'] = -1,     ['ears_2'] = 0,
					['bproof_1'] = 0,  ['bproof_2'] = 0,
					['mask_1'] = 0,  ['mask_2'] = 0,
					['bags_1'] = 0,  ['bags_2'] = 0
	
					}
			},
			longsleeve_uniform = { 
				male = {
					['tshirt_1'] = 189,  ['tshirt_2'] = 0,
					['torso_1'] = 405,   ['torso_2'] = 11,
					['decals_1'] = 0,   ['decals_2'] = 0,
					['arms'] = 11,
					['pants_1'] = 114,   ['pants_2'] = 10,
					['shoes_1'] = 25,   ['shoes_2'] = 0,
					['helmet_1'] = 108,  ['helmet_2'] = 11,
					['chain_1'] = 6,    ['chain_2'] = 0,
					['ears_1'] = -1,     ['ears_2'] = 0,
					['bproof_1'] = 3,  ['bproof_2'] = 0,
					['mask_1'] = 121,   ['mask_2'] = 0,
					['bags_1'] = 0,  ['bags_2'] = 0
	
				},
				female = {
					['tshirt_1'] = 28,  ['tshirt_2'] = 0,
					['torso_1'] = 394,   ['torso_2'] = 11,
					['decals_1'] = 0,   ['decals_2'] = 0,
					['arms'] = 41,
					['pants_1'] = 117,   ['pants_2'] = 1,
					['shoes_1'] = 25,   ['shoes_2'] = 0,
					['helmet_1'] = 13,  ['helmet_2'] = 5,
					['chain_1'] = 0,    ['chain_2'] = 0,
					['ears_1'] = -1,     ['ears_2'] = 0,
					['bproof_1'] = 0,  ['bproof_2'] = 0,
					['mask_1'] = 0,  ['mask_2'] = 0,
					['bags_1'] = 0,  ['bags_2'] = 0
	
					}
			},
			usmskurtka_uniform = { 
				male = {
					['tshirt_1'] = 189,  ['tshirt_2'] = 0,
					['torso_1'] = 278,   ['torso_2'] = 11,
					['decals_1'] = 0,   ['decals_2'] = 0,
					['arms'] = 20,
					['pants_1'] = 114,   ['pants_2'] = 10,
					['shoes_1'] = 25,   ['shoes_2'] = 0,
					['helmet_1'] = 108,  ['helmet_2'] = 11,
					['chain_1'] = 6,    ['chain_2'] = 0,
					['ears_1'] = -1,     ['ears_2'] = 0,
					['bproof_1'] = 0,  ['bproof_2'] = 0,
					['mask_1'] = 121,   ['mask_2'] = 0,
					['bags_1'] = 0,  ['bags_2'] = 0
	
				},
				female = {
					['tshirt_1'] = 15,  ['tshirt_2'] = 0,
					['torso_1'] = 393,   ['torso_2'] = 2,
					['decals_1'] = 0,   ['decals_2'] = 0,
					['arms'] = 88,
					['pants_1'] = 133,   ['pants_2'] = 23,
					['shoes_1'] = 29,   ['shoes_2'] = 0,
					['helmet_1'] = 13,  ['helmet_2'] = 5,
					['chain_1'] = 0,    ['chain_2'] = 0,
					['ears_1'] = -1,     ['ears_2'] = 0,
					['bproof_1'] = 0,  ['bproof_2'] = 0,
					['mask_1'] = 121,  ['mask_2'] = 0,
					['bags_1'] = 0,  ['bags_2'] = 0
	
					}
			},
			usmskurtka2_uniform = { 
				male = {
					['tshirt_1'] = 189,  ['tshirt_2'] = 0,
					['torso_1'] = 401,   ['torso_2'] = 8,
					['decals_1'] = 0,   ['decals_2'] = 0,
					['arms'] = 33,
					['pants_1'] = 114,   ['pants_2'] = 10,
					['shoes_1'] = 25,   ['shoes_2'] = 0,
					['helmet_1'] = 170,  ['helmet_2'] = 1,
					['chain_1'] = 6,    ['chain_2'] = 0,
					['ears_1'] = -1,     ['ears_2'] = 0,
					['bproof_1'] = 0,  ['bproof_2'] = 0,
					['mask_1'] = 121,   ['mask_2'] = 0,
					['bags_1'] = 0,  ['bags_2'] = 0
	
				},
				female = {
					['tshirt_1'] = 28,  ['tshirt_2'] = 0,
					['torso_1'] = 381,   ['torso_2'] = 11,
					['decals_1'] = 0,   ['decals_2'] = 0,
					['arms'] = 23,
					['pants_1'] = 117,   ['pants_2'] = 1,
					['shoes_1'] = 25,   ['shoes_2'] = 0,
					['helmet_1'] = 13,  ['helmet_2'] = 5,
					['chain_1'] = 0,    ['chain_2'] = 0,
					['ears_1'] = -1,     ['ears_2'] = 0,
					['bproof_1'] = 0,  ['bproof_2'] = 0,
					['mask_1'] = 0,  ['mask_2'] = 0,
					['bags_1'] = 0,  ['bags_2'] = 0
	
					}
			},
				--- AIAD ---
				aiadpatrol_uniform = {
					male = {
						['tshirt_1'] = 191,  ['tshirt_2'] = 0,
						['torso_1'] = 400,   ['torso_2'] = 8,
						['decals_1'] = 0,   ['decals_2'] = 0,
						['arms'] = 30,
						['pants_1'] = 114,   ['pants_2'] = 7,
						['shoes_1'] =25,   ['shoes_2'] = 0,
						['helmet_1'] = 164,  ['helmet_2'] = 4,
						['chain_1'] = 1,    ['chain_2'] =0,
						['ears_1'] = -0,     ['ears_2'] = 0,
						['bproof_1'] = 0,  ['bproof_2'] = 0,
						['mask_1'] = 121,   ['mask_2'] = 0,
						['bags_1'] = 0,  ['bags_2'] = 0,
		
					},
					female = {
						['tshirt_1'] = 28,  ['tshirt_2'] = 1,
						['torso_1'] = 423,   ['torso_2'] = 8,
						['decals_1'] = 0,   ['decals_2'] = 0,
						['arms'] = 44,
						['pants_1'] = 121,   ['pants_2'] = 7,
						['shoes_1'] = 25,   ['shoes_2'] = 0,
						['helmet_1'] = 163,  ['helmet_2'] = 6,
						['chain_1'] = 1,    ['chain_2'] = 0,
						['ears_1'] = -1,     ['ears_2'] = 0,
						['bproof_1'] = 58,  ['bproof_2'] = 2,
						['mask_1'] = 0,  ['mask_2'] = 0,
						['bags_1'] = 0,  ['bags_2'] = 0
						}
					},
				aiadcombat_uniform = {
					male = {
						['tshirt_1'] = 191,  ['tshirt_2'] = 0,
						['torso_1'] = 400,   ['torso_2'] = 8,
						['decals_1'] = 0,   ['decals_2'] = 0,
						['arms'] = 30,
						['pants_1'] = 114,   ['pants_2'] = 7,
						['shoes_1'] =25,   ['shoes_2'] = 0,
						['helmet_1'] = 164,  ['helmet_2'] = 4,
						['chain_1'] = 1,    ['chain_2'] =0,
						['ears_1'] = -0,     ['ears_2'] = 0,
						['bproof_1'] = 57,  ['bproof_2'] = 3,
						['mask_1'] = 121,   ['mask_2'] = 0,
						['bags_1'] = 0,  ['bags_2'] = 0,		
		
					},
					female = {
						['tshirt_1'] = 28,  ['tshirt_2'] = 1,
						['torso_1'] = 423,   ['torso_2'] = 8,
						['decals_1'] = 0,   ['decals_2'] = 0,
						['arms'] = 44,
						['pants_1'] = 121,   ['pants_2'] = 7,
						['shoes_1'] = 25,   ['shoes_2'] = 0,
						['helmet_1'] = 163,  ['helmet_2'] = 6,
						['chain_1'] = 1,    ['chain_2'] = 0,
						['ears_1'] = -1,     ['ears_2'] = 0,
						['bproof_1'] = 58,  ['bproof_2'] = 2,
						['mask_1'] = 0,  ['mask_2'] = 0,
						['bags_1'] = 0,  ['bags_2'] = 0
		
						}
					},
				aiadcombat2_uniform = {
					male = {
						['tshirt_1'] = 39,  ['tshirt_2'] = 0,
						['torso_1'] = 368,   ['torso_2'] = 9,
						['decals_1'] = 0,   ['decals_2'] = 0,
						['arms'] = 28,
						['pants_1'] = 114,   ['pants_2'] = 7,
						['shoes_1'] = 25,   ['shoes_2'] = 0,
						['helmet_1'] = 13,  ['helmet_2'] = 4,
						['chain_1'] = 8,    ['chain_2'] = 0,
						['ears_1'] = -1,     ['ears_2'] = 0,
						['bproof_1'] = 59,  ['bproof_2'] = 2,
						['mask_1'] = 0,   ['mask_2'] = 0,
						['bags_1'] = 0,  ['bags_2'] = 0
		
					},
					female = {
						['tshirt_1'] = 28,  ['tshirt_2'] = 0,
						['torso_1'] = 385,   ['torso_2'] = 9,
						['decals_1'] = 0,   ['decals_2'] = 0,
						['arms'] = 27,
						['pants_1'] = 117,   ['pants_2'] = 2,
						['shoes_1'] = 25,   ['shoes_2'] = 0,
						['helmet_1'] = 13,  ['helmet_2'] = 4,
						['chain_1'] = 1,    ['chain_2'] = 0,
						['ears_1'] = -1,     ['ears_2'] = 0,
						['bproof_1'] = 59,  ['bproof_2'] = 2,
						['mask_1'] = 0,   ['mask_2'] = 0,
						['bags_1'] = 0,  ['bags_2'] = 0
		
						}
					},
				aiadofficial_uniform = {
					male = {
						['tshirt_1'] = 15,  ['tshirt_2'] = 0,
						['torso_1'] = 404,   ['torso_2'] = 3,
						['decals_1'] = 0,   ['decals_2'] = 0,
						['arms'] = 77,
						['pants_1'] = 151,   ['pants_2'] = 1,
						['shoes_1'] = 10,   ['shoes_2'] = 0,
						['helmet_1'] = 166,  ['helmet_2'] = 3,
						['chain_1'] = 0,    ['chain_2'] = 0,
						['ears_1'] = -1,     ['ears_2'] = 0,
						['bproof_1'] = 0,  ['bproof_2'] = 0,
						['mask_1'] = 0,   ['mask_2'] = 0,
						['bags_1'] = 0,  ['bags_2'] = 0
		
					},
					female = {
						['tshirt_1'] = 14,  ['tshirt_2'] = 0,
						['torso_1'] = 427,   ['torso_2'] = 3,
						['decals_1'] = 0,   ['decals_2'] = 0,
						['arms'] = 88,
						['pants_1'] = 52,   ['pants_2'] = 2,
						['shoes_1'] = 29,   ['shoes_2'] = 0,
						['helmet_1'] = 164,  ['helmet_2'] = 3,
						['chain_1'] = 0,    ['chain_2'] = 0,
						['ears_1'] = -1,     ['ears_2'] = 0,
						['bproof_1'] = 0,  ['bproof_2'] = 0,
						['mask_1'] = 0,   ['mask_2'] = 0,
						['bags_1'] = 0,  ['bags_2'] = 0
		
						}
					},
					tdacademy_uniform = {
						male = {
							['tshirt_1'] = 189,  ['tshirt_2'] = 0,
							['torso_1'] = 400,   ['torso_2'] = 1,
							['decals_1'] = 0,   ['decals_2'] = 0,
							['arms'] = 171,
							['pants_1'] = 114,   ['pants_2'] = 2,
							['shoes_1'] = 25,   ['shoes_2'] = 0,
							['helmet_1'] = 166,  ['helmet_2'] = 0,
							['chain_1'] = 6,    ['chain_2'] = 0,
							['ears_1'] = -1,     ['ears_2'] = 0,
							['bproof_1'] = 0,  ['bproof_2'] = 0,
							['mask_1'] = 121,   ['mask_2'] = 0,
							['bags_1'] = 0,  ['bags_2'] = 0
			
						},
						female = {
							['tshirt_1'] = 28,  ['tshirt_2'] = 0,
							['torso_1'] = 385,   ['torso_2'] = 9,
							['decals_1'] = 0,   ['decals_2'] = 0,
							['arms'] = 27,
							['pants_1'] = 117,   ['pants_2'] = 2,
							['shoes_1'] = 25,   ['shoes_2'] = 0,
							['helmet_1'] = 13,  ['helmet_2'] = 4,
							['chain_1'] = 1,    ['chain_2'] = 0,
							['ears_1'] = -1,     ['ears_2'] = 0,
							['bproof_1'] = 80,  ['bproof_2'] = 0,
							['mask_1'] = 0,   ['mask_2'] = 0,
							['bags_1'] = 0,  ['bags_2'] = 0
			
							}
						},
						tdacademy2_uniform = {
							male = {
								['tshirt_1'] = 189,  ['tshirt_2'] = 0,
								['torso_1'] = 400,   ['torso_2'] = 2,
								['decals_1'] = 0,   ['decals_2'] = 0,
								['arms'] = 171,
								['pants_1'] = 114,   ['pants_2'] = 3,
								['shoes_1'] = 25,   ['shoes_2'] = 0,
								['helmet_1'] = -1,  ['helmet_2'] = 0,
								['chain_1'] = 6,    ['chain_2'] = 0,
								['ears_1'] = -1,     ['ears_2'] = 0,
								['bproof_1'] = 0,  ['bproof_2'] = 0,
								['mask_1'] = 121,   ['mask_2'] = 0,
								['bags_1'] = 0,  ['bags_2'] = 0
				
							},
							female = {
								['tshirt_1'] = 28,  ['tshirt_2'] = 0,
								['torso_1'] = 385,   ['torso_2'] = 9,
								['decals_1'] = 0,   ['decals_2'] = 0,
								['arms'] = 27,
								['pants_1'] = 117,   ['pants_2'] = 2,
								['shoes_1'] = 25,   ['shoes_2'] = 0,
								['helmet_1'] = 13,  ['helmet_2'] = 4,
								['chain_1'] = 1,    ['chain_2'] = 0,
								['ears_1'] = -1,     ['ears_2'] = 0,
								['bproof_1'] = 80,  ['bproof_2'] = 0,
								['mask_1'] = 0,   ['mask_2'] = 0,
								['bags_1'] = 0,  ['bags_2'] = 0
				
								}
							},
							pedalskisheriff = {
								male = {
								['tshirt_1'] = 192,  ['tshirt_2'] = 0,
								['torso_1'] = 400,   ['torso_2'] = 4,
								['decals_1'] = 0,   ['decals_2'] = 0,
								['arms'] = 0,
								['pants_1'] = 114,   ['pants_2'] = 4,
								['shoes_1'] = 25,   ['shoes_2'] = 0,
								['helmet_1'] = 108,  ['helmet_2'] = 4,
								['chain_1'] = 6,    ['chain_2'] = 0,
								['ears_1'] = -1,     ['ears_2'] = 0,
								['bproof_1'] = 82,  ['bproof_2'] = 1,
								['mask_1'] = 121,   ['mask_2'] = 0,
								['bags_1'] = 0,  ['bags_2'] = 0
					
								},
								female = {
									['tshirt_1'] = 28,  ['tshirt_2'] = 0,
									['torso_1'] = 385,   ['torso_2'] = 9,
									['decals_1'] = 0,   ['decals_2'] = 0,
									['arms'] = 27,
									['pants_1'] = 117,   ['pants_2'] = 2,
									['shoes_1'] = 25,   ['shoes_2'] = 0,
									['helmet_1'] = 13,  ['helmet_2'] = 4,
									['chain_1'] = 1,    ['chain_2'] = 0,
									['ears_1'] = -1,     ['ears_2'] = 0,
									['bproof_1'] = 80,  ['bproof_2'] = 0,
									['mask_1'] = 0,   ['mask_2'] = 0,
									['bags_1'] = 0,  ['bags_2'] = 0
					
									}
								},
					
				--- KAMIZELKI ---
				usmsbullet_wear = {
					male = {
						['bproof_1'] = 62,  ['bproof_2'] = 3
					},
					female = {
						['bproof_1'] = 58,  ['bproof_2'] = 3
					}
				},
			bullet_wear = {
			male = {
				['bproof_1'] = 80,  ['bproof_2'] = 0
			},
			female = {
				['bproof_1'] = 56,  ['bproof_2'] = 0
			}
		},
		tdbullet_wear = {
			male = {
				['bproof_1'] = 80,  ['bproof_2'] = 0
			},
			female = {
				['bproof_1'] = 56,  ['bproof_2'] = 0
			}
		},
		gilet_wear = {
			male = {
				['bproof_1'] = 67,  ['bproof_2'] = 4
			},
			female = {
				['bproof_1'] = 66,  ['bproof_2'] = 3
			}
		},
		s_vest = {
			male = {
				['bproof_1'] = 80,  ['bproof_2'] = 1
			},
			female = {
				['bproof_1'] = 40,  ['bproof_2'] = 1,
			}
		},
		s_vestfib = {
			male = {
				['bproof_1'] = 17,  ['bproof_2'] = 9
			},
			female = {
				['bproof_1'] = 40,  ['bproof_2'] = 1,
			}
		},
		slight_vest = {
			male = {
				['bproof_1'] = 8,  ['bproof_2'] = 0
			},
			female = {
				['bproof_1'] = 22,  ['bproof_2'] = 4,
			}
		},
		sheavy_vest = {
			male = {
				['bproof_1'] = 25,  ['bproof_2'] = 3
			},
			female = {
				['bproof_1'] = 3,  ['bproof_2'] = 1,
			}
		},
		scombat_vest = {
			male = {
				['bproof_1'] = 7,  ['bproof_2'] = 3
			},
			female = {
				['bproof_1'] = 3,  ['bproof_2'] = 1,
			}
		},
	
		torba_wear = {
			male = {
				['bags_1'] = 21,  ['bags_2'] = 0
			},
			female = {
				['bags_1'] = 21,  ['bags_2'] = 0
			}
		},
	
		bullet2_wear = {
			male = {
				['bproof_1'] = 12,  ['bproof_2'] = 1
			},
			female = {
				['bproof_1'] = 3,  ['bproof_2'] = 2
			}
		},
		gilet2_wear = {
			male = {
				['bproof_1'] = 0,  ['bproof_2'] = 0
			},
			female = {
				['bproof_1'] = 0,  ['bproof_2'] = 0
			}
		},
		odblask_wear = {
			male = {
				['bproof_1'] = 67,  ['bproof_2'] = 0
			},
			female = {
				['bproof_1'] = 66,  ['bproof_2'] = 0
			}
		},
		rekawiczki1_wear = {
			male = {
				['arms'] = 93
			},
			female = {
				['arms'] = 93
			}
		},
		rekawiczki2_wear = {
			male = {
				['arms'] = 92
			},
			female = {
				['arms'] = 92
			}
		},
		rekawiczki3_wear = {
			male = {
				['arms'] = 85
			},
			female = {
				['arms'] = 92
			}
		},
		rekawiczki4_wear = {
			male = {
				['arms'] = 85
			},
			female = {
				['arms'] = 92
			}
		},
	}

Config.WeaponShop = {
	{ name = 'WEAPON_NIGHTSTICK', price = 0, grade = 0, type = 'weapon'},
	{ name = 'WEAPON_FLASHLIGHT', price = 0, grade = 0, type = 'weapon'},
	{ name = 'WEAPON_STUNGUN', price = 0, grade = 0, type = 'weapon'},
	{ name = 'WEAPON_COMBATPISTOL', price = 0, grade = 0, type = 'weapon'},
	{ name = 'WEAPON_KNIFE', price = 0, grade = 4, type = 'weapon'},
	{ name = 'WEAPON_HEAVYPISTOL', price = 100000, type = 'weapon', grade = 11, job_name = 'boss'}
}