Config                            = {}

Config.DrawDistance               = 25.0

Config.JuiceSellEarnings		  = 500

Config.NPCJobEarnings             = {min = 300, max = 600}
Config.MinimumDistance            = 3000

Config.MaxInService               = -1
Config.EnablePlayerManagement     = false

Config.Locale                     = 'pl'

Config.AuthorizedVehicles = {
	{
		model = 'bison3',
		label = 'Bison',
		price = 10000
	}
}


Config.Zones = {

	--[[VehicleSpawner = {
		Pos   = {x = 424.955, y = 6472.3716, z = 28.8527},
		Size  = {x = 1.0, y = 1.0, z = 1.0},
		Color = {r = 0, g = 203, b = 214},
		Text = 'Nacisnij ~b~[E] ~s~aby otworzyć garaż',
		Type  = 36, Rotate = true
	},]]--
	VehicleSpawner2 = {
		Pos   = {x = 407.79, y = 6496.03, z = 26.90},
		Size  = {x = 1.5, y = 1.5, z = 1.5},
		Color = {r = 0, g = 203, b = 214},
		Text = 'Nacisnij ~b~[E] ~s~aby otworzyć garaż',
		Type  = 27, Rotate = true
	},

	--[[VehicleSpawnPoint = {
		Pos     = {x = 424.9314, y = 6472.3833, z = 27.8527},
		Size    = {x = 1.5, y = 1.5, z = 1.0},
		Type    = -1, Rotate = true,
		Heading = 53.95
	},]]--

	VehicleDeleter = {
		Pos   = {x = 425.93, y = 6471.95, z = 27.85},
		Size  = {x = 3.0, y = 3.0, z = 0.25},
		Color = {r = 255, g = 0, b = 0},
		Text = 'Nacisnij ~b~[E] ~s~aby schować pojazd do garażu',
		Type  = 27, Rotate = false
	},

	OrchardActions = {
		Pos   = {x = 1938.54, y = 4656.07, z = 43.26},
		Size  = {x = 1.0, y = 1.0, z = 1.0},
		Color = {r = 0, g = 203, b = 214},
		Text = 'Nacisnij ~b~[E] ~s~aby otworzyć biuro szefa.',
		Type  = 20, Rotate = false
	},

	Cloakroom = {
		Pos     = {x = 405.75, y = 6526.29, z = 26.77},
		Size    = {x = 1.5, y = 1.5, z = 1.0},
		Color   = {r = 0, g = 203, b = 214},
		Text = 'Nacisnij ~b~[E] ~s~aby otworzyć szatnię',
		Type    = 27, Rotate = false
	},

	Cloakroom2 = {
		Pos     = {x = 2738.75, y = 4411.29, z = 999.21},
		Size    = {x = 1.0, y = 1.0, z = 1.0},
		Color   = {r = 0, g = 203, b = 214},
		Text = 'Nacisnij ~b~[E] ~s~aby otworzyć szatnię',
		Type    = 21, Rotate = false
	},

	Help = {
		Pos     = {x = 405.23, y = 6522.35, z = 999.68},
		Size    = {x = 1.0, y = 1.0, z = 1.0},
		Color   = {r = 0, g = 203, b = 214},
		Text = 'Nacisnij ~b~[E] ~s~aby zobaczyć pomoc',
		Type    = 32, Rotate = false
	},

	BuyVehicle = {
		Pos   = {x = 407.79, y = 6496.03, z = 999.88},
		Size    = {x = 1.5, y = 1.5, z = 1.0},
		Color = {r = 0, g = 203, b = 214},
		Text = 'Nacisnij ~b~[E] ~s~aby wyporzyczyc pojazd',
		Type  = 27, Rotate = false
	},

	Job1 = {
		Pos   = {x = 354.81, y = 6516.67, z = 28.52},
		Size  = {x = 25.0, y = .0, z = .0},
		Color = {r = 0, g = 203, b = 214},
		Text = 'Nacisnij ~b~[E] ~s~aby zacząć zbieranie owoców',
		Type  = 27, Rotate = false
	},


	Job1b = {
		Pos   = {x = 247.94, y = 6513.16, z = 29.50},
		Size  = {x = 20.0, y = .0, z = .0},
		Color = {r = 0, g = 203, b = 214},
		Text = 'Nacisnij ~b~[E] ~s~aby zacząć zbieranie owoców',
		Type  = 27, Rotate = false
	},

	Job2 = {
		Pos   = {x = -249.61, y = 6063.83, z = 30.80},
		Size  = {x = 2.0, y = 2.0, z = 1.0},
		Color =	{r = 0, g = 203, b = 214},
		Text = 'Nacisnij ~b~[E] ~s~aby skorzystać z hurtownii.',
		Type  = 27, Rotate = false
	},

	Job3 = {
		Pos   = {x = 1729.465, y = 6413.518, z = 34.039},
		Size  = {x = 1.2, y = 1.2, z = 1.0},
		Color = {r = 0, g = 203, b = 214},
		Text = 'Nacisnij ~b~[E] ~s~aby sprzedać owoce',
		Type  = 27, Rotate = false
	},

	Job3a = {
		Pos   = {x = 2739.931, y = 4403.824, z = 48.50},
		Size  = {x = 1.0, y = 1.0, z = 1.0},
		Color = {r = 0, g = 203, b = 214},
		Text = 'Nacisnij ~b~[E] ~s~aby sprzedać soki',
		Type  = 22, Rotate = false
	},

	JuiceSell = {
		Pos   = {x = 2743.837, y = 4415.7, z = 47.65},
		Size  = {x = 2.0, y = 2.0, z = 1.0},
		Color = {r = 0, g = 203, b = 214},
		Text = 'Nacisnij ~b~[E] ~s~aby sprzedać soki',
		Type  = 27, Rotate = false
	}

}

Config.Blips = {
	Cloakroom = {Sprite = 85},
	pear = {Sprite = 85},
	Orange = {Sprite = 85},
	Juice = {Sprite = 499},
	SellJuice = {Sprite = 85},
	SellFruits = {Sprite = 499},
}

Config.Help = {
	Title = 'POMOC',
	Text = 'Z dwóch pobliskich sadów zbierz po 40 sztuk jabłek oraz pomarańczy. Zanieś zbiory do służbowego auta i sprzedaj bezpośrednio w sklepie, bądź przerób na sok by zwiększyć zyski.',
	Time = 5,
}
