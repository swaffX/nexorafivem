fx_version 'cerulean'
game 'gta5'

description 'SWX Duyuru Sistemi - Modern Admin Announcements'
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

ui_page 'html/index.html'

files {
    'html/index.html',
    'html/voice.mp3'
}

lua54 'yes'

dependency 'ox_lib'
dependency 'qb-core'
