Config                            = {}
Config.DrawDistance               = 10.0

Config.Organisations = {
    ['doj'] = {
		Label = 'Department Of Justice',
		Cloakroom = {
			coords = vector3(-78.28, -812.49, 243.39),
		},
		Inventory = {
			coords = vector3(-82.24, -809.39, 243.39),
			from = 0, -- grade od ktorego to ma
		},
		BossMenu = {
			coords = vector3(-80.62, -802.11, 243.4),
			from = 3 -- grade od ktorego to ma
		}
 	},
	['psycholog'] = {
		Label = 'Psycholog',
		Cloakroom = {
			coords = vector3(-1006.8, -481.19, 50.03),
		},
		Inventory = {
			coords = vector3(-1006.45, -473.71, 50.03),
			from = 0, -- grade od ktorego to ma
		},
		BossMenu = {
			coords = vector3(-1008.19, -475.31, 50.03),
			from = 3 -- grade od ktorego to ma
		}
 	},
	['cardealer'] = {
        Label = 'Broker',
        Cloakroom = {
            coords = vector3(144.28, -165.72, 59.49),
        },
        Inventory = {
            coords = vector3(116.4, -132.82, 59.49),
            from = 0, -- grade od ktorego to ma
        },
        BossMenu = {
            coords = vector3(120.0, -122.53, 59.49),
            from = 4 -- grade od ktorego to ma
        }
    }
}

Config.Interactions = {
    ['doj'] = {
		repair = 0,
	},
	['psycholog'] = {
		repair = 0,
	},
	['cardealer'] = {
		repair = 0,
	},
}