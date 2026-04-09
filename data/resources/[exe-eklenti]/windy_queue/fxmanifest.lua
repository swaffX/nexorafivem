-- FiveM Resource Manifest
fx_version 'cerulean'
game 'gta5'

author 'Skizeun'
description 'Advanced Discord Queue System with Role Verification and Username Check for FiveM'
version '1.0.0'
lua54 'yes'

-- Shared scripts
shared_scripts {
    'config.lua'
}

-- Server scripts
server_scripts {
    '@mysql-async/lib/MySQL.lua',
    '@oxmysql/lib/MySQL.lua',
    'config.lua',
    'server.lua'
}

-- Dependencies
dependencies {
    'oxmysql'
}

-- Asset files
files {
    'assets/*.gif',
    'assets/*.png'
}

-- Escrow configuration
escrow_ignore {
    'config.lua'
}

dependency '/assetpacks'