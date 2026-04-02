fx_version 'cerulean'
game 'gta5'
ui_page 'html/index.html'
client_scripts {
	'@PolyZone/client.lua',
	'@PolyZone/BoxZone.lua',
	'@PolyZone/EntityZone.lua',
	'@PolyZone/CircleZone.lua',
	'@PolyZone/ComboZone.lua',
	'init.lua',
	'client.lua',
	'actions.lua',
}
server_scripts {
	-- 'server.lua',
}
files {
	'data/*.lua',
	'html/*.html',
	'html/css/*.css',
	'html/js/*.js',
	'html/sounds/*.mp3',
	'html/sounds/*.ogg',
}
lua54 'yes'
use_experimental_fxv2_oal 'yes'
dependency 'PolyZone'
