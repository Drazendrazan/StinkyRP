Config = {}
-- [[ MARKERY/BLIPY ]] --
Config.DrawDistance = 5
Config.Size         = { x = 2, y = 2, z = 0.5 }
Config.Color        = {r = 0, g = 128, b = 255}
Config.Type         = 27
Config.Zones = {
	Exchange = {
		Pos = {
			{x = 206.6,   y = -1851.44,  z = 27.48},
		}
	}
}
Config.Blips = {
	{name="Wymiana Jaj Wielkanocnych", color=2, id=676, x=206.6, y=-1851.44, z=27.48, size = 0.9}
}

-- [[ WYMAGANA ILOSC ]] --

Config.RequiredLegalCase1 = 800
Config.RequiredLegalCase2 = 400
Config.RequiredLegalCase3 = 800
Config.RequiredLegalCase4 = 1500
Config.RequiredIllLegalCase1 = 200
Config.RequiredIllLegalCase2 = 400
Config.RequiredIllLegalCase3 = 800
Config.RequiredIllLegalCase4 = 1500

-- [[ SKRZYNKI ]] --
Config["image_source"] = "https://cfx-nui-Stinky_binds/html/img/"

Config["chance"] = {
	[1] = { name = "Zwykła", rate = 52 },
	[2] = { name = "Rzadka", rate = 28 },
	[3] = { name = "Epicka", rate = 13 },
	[4] = { name = "Wyjątkowa", rate = 6 } ,
	[5] = { name = "Legendarna", rate = 1 },
}

Config["exilecases"] = {
	["legalna"] = { 
        name = "Stinky Legal Chest",
        list = {
			{ money = 800000, tier = 1 },
			{ item = "bon19", amount= 2, tier = 1 }, ---Zmiana rejestracji w pojeździe---
			{ item = "bon34", amount= 1, tier = 1 }, ---Zniżka 25% na tuning do auta---
			{ money = 2200000, tier = 2 },
			{ item = "bon20", amount= 1, tier = 2 }, ---Zniżka 50% na tuning do auta---
			{ item = "bon21", amount= 1, tier = 2 }, ---Auto z brokera do 3,5mln---
			{ item = "bon22", amount= 1, tier = 2 }, ---Zniżka do brokera 10%---
			{ item = "bon19", amount= 5, tier = 2 }, ---Zmiana rejestracji w pojeździe---
			{ item = "legalna", amount= 1, tier = 2 },
			{ item = "crimowa", amount= 1, tier = 2 },
			{ money = 5500000, tier = 3 },
			{ item = "bon23", amount= 1, tier = 3 }, ---Auto z brokera do 7mln---
			{ item = "bon24", amount= 1, tier = 3 }, ---Zniżka 20% do brokera---
			{ item = "bon25", amount= 1, tier = 3 }, ---Bon na darmowy tuning do auta---
			{ item = "legalna", amount= 2, tier = 3 },
			{ item = "crimowa", amount= 2, tier = 3 },
			{ money = 9000000, tier = 4 },
			{ item = "bon26", amount= 1, tier = 4 }, ---Auto z brokera do 11mln---
			{ item = "bon27", amount= 1, tier = 4 }, ---Zniżka 35% do brokera---
			{ item = "bon28", amount= 1, tier = 4 }, ---Skrócenie bana o 24h---
			{ money = 16000000, tier = 5 },
           	{ item = "bon29", amount= 1, tier = 5 }, ---Auto limitowane---
	       	{ item = "bon30", amount= 1, tier = 5 }, ---Dom limitowany---	
	       	{ item = "bon31", amount= 1, tier = 5 }, ---Śmigłowiec lub Samolot---	
			{ item = "bon32", amount= 1, tier = 4 }, ---Skrócenie bana o 72h---			
        }
    },
	["crimowa"] = { 
        name = "Stinky Illegal Chest",
        list = {
			{ black_money = 1200000, tier = 1 },
			{ black_money = 1200000, tier = 1 },
			{ item = "clip", amount= 1000, tier = 1 },
			{ item = "clipsmg", amount= 100, tier = 1 },
			{ item = "extendedclip", amount= 70, tier = 1 },
			{ item = "stinkyenergy", amount= 1000, tier = 1 },
			{ item = "radio", amount= 100, tier = 1 },
			{ item = "snspistol_mk2", amount= 25, tier = 1 },
			{ item = "vintagepistol", amount= 20, tier = 1 },
			{ item = "doubleaction", amount= 4, tier = 3 },
			{ item = "kamzasmall", amount= 40, tier = 1 },
			{ item = "kamzaduza", amount= 20, tier = 1 },
			{ item = "coke_pooch", amount= 250, tier = 1 },
			{ item = "meth_pooch", amount= 400, tier = 1 },
			{ black_money = 2500000, tier = 2 },
			{ item = "snspistol_mk2", amount= 40, tier = 2 },
			{ item = "vintagepistol", amount= 35, tier = 2 },
			{ item = "opium_pooch", amount= 400, tier = 2 },
			{ item = "kamzaduza", amount= 40, tier = 2 },
			{ item = "kamzasmall", amount= 80, tier = 2 },
			{ item = "clip_drum", amount= 20, tier = 2 },
			{ item = "clip_extended", amount= 25, tier = 2 },
			{ item = "doubleaction", amount= 4, tier = 2 },
			{ item = "legalna", amount= 1, tier = 2 },
			{ item = "crimowa", amount= 1, tier = 2 },
			{ black_money = 6500000, tier = 3 },
			{ item = "microsmg", amount= 2, tier = 3 },
			{ item = "minismg", amount= 3, tier = 3 },
			{ item = "legalna", amount= 2, tier = 3 },
			{ item = "crimowa", amount= 2, tier = 3 },
			{ black_money = 12000000, tier = 4 },
			{ item = "compactrifle", amount= 2, tier = 4 },
			{ item = "combatpdw", amount= 2, tier = 4 },
			{ item = "bon28", amount= 1, tier = 4 }, ---Skrócenie bana o 24h---
			{ black_money = 20000000, tier = 5 },
			{ item = "pompshotgun", amount= 1, tier = 5 },
			{ item = "assaultrifle", amount= 1, tier = 5 },
			{ item = "rpg", amount= 1, tier = 5 },
           	{ item = "musket", amount= 1, tier = 5 },
          	{ item = "bon30", amount= 1, tier = 5 }, ---Dom Limitowany---
	     	{ item = "bon33", amount= 1, tier = 5 }, ---Nissan Titan---
			{ item = "bon32", amount= 1, tier = 5 }, ---Skrócenie bana o 72h---
        }
    },
	["weaponchest"] = { 
        name = "Stinky Weapon Chest",
        list = {
			{ item = "vintagepistol", amount= 25, tier = 1 },
			{ item = "snspistol_mk2", amount= 25, tier = 1 },
			{ item = "ceramicpistol", amount= 25, tier = 1 },
			{ item = "doubleaction", amount= 5, tier = 1 },
			{ item = "minismg", amount= 2, tier = 2 },
			{ item = "microsmg", amount= 2, tier = 2 },
			{ item = "machinepistol", amount= 2, tier = 2 },
			{ item = "doubleaction", amount= 10, tier = 2 },
			{ item = "gusenberg", amount= 2, tier = 3 },
			{ item = "compactrifle", amount= 2, tier = 3 },
			{ item = "combatpdw", amount= 2, tier = 3 },
			{ item = "appistol", amount= 3, tier = 3 },
			{ item = "carabinerifle", amount= 1, tier = 4 },
			{ item = "assaultrifle", amount= 1, tier = 4 },
			{ item = "rpg", amount= 1, tier = 5 },
			{ item = "musket", amount= 1, tier = 5 },
			{ item = "pompshotgun", amount= 1, tier = 5 },
			{ item = "mg", amount= 1, tier = 5 },
			{ item = "sawoffshotgun", amount= 1, tier = 5 },
        }
    },
	["carchest"] = { 
        name = "Stinky Car Chest",
        list = {
			{ money = 800000, tier = 1 },
			{ item = "bon34", amount= 1, tier = 1 }, ---Zniżka 25% na tuning do auta---	
			{ item = "bon19", amount= 2, tier = 1 }, ---Zmiana rejestracji w aucie---	
			{ item = "bon22", amount= 1, tier = 2 }, ---Zniżka do brokera 10%---	
			{ item = "bon19", amount= 4, tier = 2 }, ---Zmiana rejestracji w aucie---
			{ item = "bon20", amount= 1, tier = 2 }, ---Zniżka 50% na tuning do auta---
			{ item = "bon21", amount= 1, tier = 2 }, ---Auto z brokera do 3,5mln---
			{ money = 2200000, tier = 2 },
			{ money = 5500000, tier = 3 },
			{ item = "bon35", amount= 1, tier = 3 }, ---Ubranie z wybraną przez ciebie grafiką---	
			{ item = "bon24", amount= 1, tier = 3 }, ---Zniżka 20% do brokera---
			{ item = "bon25", amount= 2, tier = 3 }, ---Bon na darmowy tuning do auta---
			{ item = "bon23", amount= 1, tier = 3 }, ---Auto z brokera do 7mln---
			{ item = "bon28", amount= 1, tier = 3 }, ---Skrócenie bana o 24h---
			{ item = "bon36", amount= 1, tier = 4 }, ---Limitowane malowanie na dowolne auto---	
			{ item = "bon32", amount= 1, tier = 4 }, ---Skrócenie bana o 72h---	
			{ item = "bon25", amount= 3, tier = 4 }, ---Darmowy Full Tune do auta---	
			{ item = "bon37", amount= 1, tier = 4 }, ---Dowolne auto car dealera---
			{ item = "bon26", amount= 1, tier = 4 }, ---Auto z brokera do 11mln---
			{ money = 9000000, tier = 4 },
			{ item = "bon38", amount= 1, tier = 5 }, ---BMW M2 EXILE EDITION---
			{ item = "bon39", amount= 1, tier = 5 }, ---Challenger Kim3n EDITION---
			{ item = "bon31", amount= 1, tier = 5 }, ---Śmigłowiec lub Samolot---	
			{ item = "bon40", amount= 1, tier = 5 }, ---Dowolna limitka z limited dźwiękiem---
			{ item = "bon41", amount= 1, tier = 5 }, ---Pakiet limitek 2+1---
		}
	},
	["localchest"] = { 
        name = "Stinky Local Chest",
        list = {
			{ money = 1500000, tier = 4 },
			{ money = 2200000, tier = 5 },
			{ black_money = 5500000, tier = 5 },
			{ item = "water", amount= 20, tier = 1 }, 
			{ item = "bread", amount= 20, tier = 1 }, 
			{ item = "stinkyenergy", amount= 50, tier = 2 }, 
			{ item = "bon34", amount= 1, tier = 5 }, ---Zniżka 25% na tuning do auta---	
			{ item = "bon25", amount= 1, tier = 5 }, ---Bon na darmowy tuning do auta---
			{ item = "radio", amount= 100, tier = 3 },
			{ item = "vintagepistol", amount= 10, tier = 3 },
			{ item = "snspistol_mk2", amount= 10, tier = 3 },
			{ item = "pistol_ammo", amount= 500, tier = 2 },
		}
	},
}