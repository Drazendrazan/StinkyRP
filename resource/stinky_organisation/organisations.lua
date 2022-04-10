Organisations = {}

Organisations.DrawDistance = 10.0
Organisations.BlipTime = 140 
Organisations.Cooldown = 140

Organisations.Jobs = {
	'org1',
}

Organisations.Blips = {
	['org1'] = vector3(262.79, 2592.34, 44.95)
}

Organisations.List = {
	[1] = 'SNS',
	[2] = 'snspistol',
	[3] = 'SNS MK2',
	[4] = 'snspistol_mk2',
	[5] = 'Pistolet',
	[6] = 'pistol',
	[7] = 'Pistolet MK2',
	[8] = 'pistol_mk2',
	[9] = 'Vintage',
	[10] = 'vintagepistol',
	[11] = 'machete',
	[12] = 'Toporek',
	[13] = 'battleaxe',
	[14] = 'Kij bejsbolowy',
	[15] = 'bat',
	[16] = 'Nóż',
	[17] = 'knife',
}  

Organisations.Organisations = {
	['org1'] = {
		Label = 'CBS',
		Cloakroom = {
			coords = vector3(262.79, 2592.34, 44.95),
		},
		Inventory = {
			coords = vector3(266.8, 2584.11, 44.92),
			from = 3,
		},
		BossMenu = {
			coords = vector3(255.43, 2583.01, 45.05),
			from = 3
		},
		LevelUp = {
			coords = vector3(256.24, 2585.74, 44.91),
			from = 4
		},
		Contract = {
			coords = vector3(260.35, 2583.19, 44.82),
			from = 0,
			Utils = {
				Label = Organisations.List[3],
				Weapon = Organisations.List[4],
				Account = 'black_money',
				Price = 80000,
				Ammo = {
					Account = 'black_money',
					Price = 1000,
					Number = 50,
				},
			},
		}
	}
}

Organisations.Interactions = {
    ['org1'] = {
		handcuffs = 0, 
		repair = 0,
		worek = 0
	}
}