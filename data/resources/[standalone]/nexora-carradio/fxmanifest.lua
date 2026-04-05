fx_version 'cerulean'
game 'gta5'
lua54 'yes'

author 'Nexora RP'
description 'Araç Hoparlör Sistemi - Bass, Tiz, Ses Ayarları'
version '1.0.0'

shared_scripts {
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
    'html/script.js'
}

dependencies {
    'xsound'
}
