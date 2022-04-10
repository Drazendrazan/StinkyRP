fx_version "bodacious"
games {"gta5"}
lua54 'yes'
server_scripts {
	'@mysql-async/lib/MySQL.lua',
    '@es_extended/locale.lua',
	'server.lua',
}

client_scripts {
	'@es_extended/locale.lua',
	'@chuj/shared.lua',
	'client.lua',
	'macias_dopamine.lua',

}

client_script '@pozdoodtajczyka/client/main.lua'