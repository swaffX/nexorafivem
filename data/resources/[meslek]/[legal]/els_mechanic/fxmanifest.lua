ui_page 'html/index.html'

-- minden ügyféloldali fájlt hozzá kell adni az erőforrás-csomagfájlhoz!
files {
  'html/index.html',
  'html/sounds/*.ogg',
  'html/*.png'
    

}

client_scripts {
    'config.lua',
    'client.lua'

}

server_scripts {
    '@oxmysql/lib/MySQL.lua',
    'config.lua',
    'server.lua'
}


fx_version 'adamant'
games {'gta5'}