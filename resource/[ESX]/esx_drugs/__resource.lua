resource_manifest_version '44febabe-d386-4d18-afbe-5e627f4af937'
lua54 'yes'
server_scripts {
	'@es_extended/locale.lua',
	'locales/pl.lua',
	'server/server.lua',
	'server/uzytkowes.lua',
	'config.lua'
}

client_scripts {
	'@es_extended/locale.lua',
	'locales/pl.lua',
	'config.lua',
	'client/uzytkowec.lua',
	'client/client.lua'
}