fx_version 'cerulean'
game 'gta5'
author 'MS Studio'
description 'Modern FPS Booster & Server Optimizer'
version '1.0'

shared_scripts {
    'shared/locales.lua',
    'shared/locale_helper.lua',
    'shared/admins.lua',
    'shared/config.lua',
    'shared/bridge.lua'
}

client_scripts {
    'clientside/fps_booster.lua',
    'clientside/nuitro.lua',
    'clientside/main.lua'
}

server_scripts {
    'serverside/discord.lua',

    'serverside/security.lua',
    'serverside/admin_helper.lua',
    'serverside/main.lua'
}

ui_page 'ui/index.html'

files {
    'ui/index.html',
    'ui/style.css',
    'ui/script.js',
    'ui/assets/*.png' 
}

lua54 'yes'

escrow_ignore {
    'shared/admins.lua',
    'shared/config.lua',
    'shared/locales.lua',
    'serverside/discord.lua'
}
dependency '/assetpacks'