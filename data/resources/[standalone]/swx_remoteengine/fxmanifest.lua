fx_version 'cerulean'
game 'gta5'

description 'SWX Remote Engine Starter - Uzaktan Araç Çalıştırma'
version '1.0.0'
author 'SWX'

shared_scripts {
    'config.lua',
    '@ox_lib/init.lua'
}

client_scripts {
    'client.lua'
}

server_scripts {
    'server.lua'
}

lua54 'yes'

dependency 'ox_lib'
dependency 'qb-vehiclekeys'
