fx_version 'cerulean'
game 'gta5'
lua54 'yes'

author 'SWX Scripts'
description 'Araç Hoparlör Sistemi - ox_lib Context Menu - Bass Boost Fix v1.2.1'
version '1.2.1'

shared_scripts {
    '@ox_lib/init.lua',
    'config.lua'
}

client_scripts {
    'client.lua'
}

server_scripts {
    '@oxmysql/lib/MySQL.lua',
    'server.lua'
}

dependencies {
    'ox_lib',
    'xsound',
    'oxmysql'
}
