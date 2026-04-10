fx_version 'cerulean'
game 'gta5'

author 'swaffdev'
description 'Nexora RP - Yeni Oyuncu Karşılama Sistemi'
version '1.0.0'

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
