fx_version 'cerulean'
game 'gta5'
lua54 'yes'

author 'vames™️'
description 'vms_vehicleshop'
version '1.0.7'

shared_scripts {
	'config/config.vehicles.lua',
	'config/config.lua',
}

client_scripts {
	'config/config.client.lua',
	'client/*.lua',
}

server_scripts {
	'@oxmysql/lib/MySQL.lua',
	'server/*.lua',
	'config/config.server.lua',
}

ui_page 'html/ui.html'

files {
	'html/**/*.*',
	'html/*.*',
	'config/translation.js'
}

exports {
	'GeneratePlate' -- exports['vms_vehicleshop']:GeneratePlate() <-- its generating plate
}

escrow_ignore {
	'config/*.lua',
	'client/*.lua',
	'server/*.lua',

}
dependency '/assetpacks'