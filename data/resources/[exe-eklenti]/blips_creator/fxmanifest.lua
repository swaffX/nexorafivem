fx_version 'cerulean'
game 'gta5'

author 'jaksam1074'
description 'POLY LEAKS | discord.gg/polyleaks'
version '2.0'

shared_script 'shared.lua'

client_scripts {
    "language.lua",
    'cl_config.lua',
    "client/nui_callbacks.lua",
    "client/main.lua",
}

server_scripts {
    "server/database.lua",
    "server/main.lua",
    "@mysql-async/lib/MySQL.lua",
}

ui_page 'html/index.html'

files {
    'html/index.html',
    'html/index.css',
    'html/index.js',
    'html/images/*.png',
    'html/images/blips/*.png',
}