fx_version 'cerulean'
game 'gta5'

author 'swaffdev'
description 'Modern Vehicle Handling Editor with ox_lib'
version '2.0.0'

shared_scripts {
    '@ox_lib/init.lua'
}

server_scripts {
    '@oxmysql/lib/MySQL.lua',
    'config.lua',
    'server.lua'
}

client_scripts {
    'config.lua',
    'client.lua'
}

lua54 'yes'
