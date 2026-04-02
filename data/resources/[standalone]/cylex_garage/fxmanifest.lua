fx_version 'adamant'
games { 'gta5' }

lua54 'yes'

client_scripts {
    'config.lua',
    'client.lua',

    'interaction.lua'

}

server_scripts {
    'config.lua',
    'functions.lua',
    'server.lua'
}

ui_page 'ui/index.html'

files {
    'ui/index.html',
    'ui/css/*.css',
    'ui/js/*.js',
    'ui/img/*.svg',
    'ui/img/*.png',
    
    'ui/fonts/*.ttf'
}

escrow_ignore {
    'interaction.lua',
    'config.lua',
    'functions.lua',
}

server_scripts { '@oxmysql/lib/MySQL.lua' }