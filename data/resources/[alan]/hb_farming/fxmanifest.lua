fx_version 'cerulean'
game 'gta5'

author 'Senin İsmin'
description 'Dynamic Farming Job'
version '1.0.0'

shared_scripts {
    '@qb-core/shared/locale.lua',
    'config.lua'  -- Burada olmalı
}

client_scripts {
    'client.lua'
}

server_scripts {
    '@oxmysql/lib/MySQL.lua',
    'server.lua'
}
