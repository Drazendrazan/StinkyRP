fx_version "bodacious"
games {"gta5"}
lua54 'yes'
server_scripts {
	'@mysql-async/lib/MySQL.lua',
    '@es_extended/locale.lua',
	'client/config.lua',
	'server/server.lua',
}

client_scripts {
	'@es_extended/locale.lua',
	'client/config.lua',
	'client/client.lua',
}