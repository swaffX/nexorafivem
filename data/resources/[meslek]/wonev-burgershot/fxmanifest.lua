fx_version 'cerulean'
game 'gta5'

author 'Wonev'
description 'Wonev BurgerShot '
version '1.0.0'

-- ui_page 'ui/index.html'  

-- files {
--     'ui/index.html',
--     'ui/style.css',
--     'ui/script.js'
-- }

shared_scripts {
    'config.lua'
}

client_scripts {
    'client.lua'
}

server_scripts {
    '@oxmysql/lib/MySQL.lua',
    'server.lua'
}
