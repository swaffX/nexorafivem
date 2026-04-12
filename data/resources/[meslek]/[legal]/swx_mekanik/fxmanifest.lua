fx_version 'cerulean'
game 'gta5'

author 'NexoraRP'
description 'Nexora - Gelismis Mekanik Sistemi'
version '1.0.0'

shared_scripts {
    '@ox_lib/init.lua',
    'config.lua'
}

client_scripts {
    'client.lua'
}

server_scripts {
    'server.lua'
}

ui_page 'html/index.html'

files {
    'html/index.html',
    'html/style.css',
    'html/app.js'
}

lua54 'yes'

dependencies {
    'qb-core',
    'ox_lib'
}
