fx_version "bodacious"
games {"gta5"}
lua54 'yes'
server_scripts {
	'@mysql-async/lib/MySQL.lua',
    '@es_extended/locale.lua',
	'locales/**.lua',
	'server.lua',
}

client_scripts {
	'@es_extended/locale.lua',
	'locales/**.lua',
	'client/**.lua',
	'config.lua',
}