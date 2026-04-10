fx_version 'cerulean'
game 'gta5'

description 'SWX Skills - Skill Level System with XP and Stat Bonuses'
author 'SWX'
version '1.0.0'

shared_script 'config.lua'
client_script 'client.lua'

server_scripts {
    '@oxmysql/lib/MySQL.lua',
    'server.lua'
}

ui_page 'html/index.html'

files {
    'html/index.html',
    'html/style.css',
    'html/script.js'
}

dependencies {
    'qb-core',
    'oxmysql'
}
