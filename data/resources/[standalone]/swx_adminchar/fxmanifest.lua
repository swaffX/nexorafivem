fx_version 'cerulean'
game 'gta5'
lua54 'yes'

name "swx-adminchar"
author "Nexora"
description "Admin Character Delete Tool"
version "1.0.0"

shared_scripts {
    '@ox_lib/init.lua'
}

server_scripts {
    '@oxmysql/lib/MySQL.lua',
    'server.lua'
}

client_scripts {
    'client.lua'
}
