fx_version 'cerulean'
game 'gta5'

author 'swaffdev'
description 'Nexora RP - QB-Inventory Kıyafet Entegrasyonu'
version '1.0.0'

-- Bu script qb-inventory ile birlikte çalışır
-- qb-inventory'nin HTML/CSS/JS dosyalarını modifiye eder

shared_scripts {
    '@ox_lib/init.lua',
    'config.lua'
}

server_scripts {
    'server.lua'
}

client_scripts {
    'client_new.lua',
    'clothing.lua'
}

lua54 'yes'

-- Bağımlılıklar
dependencies {
    'qb-inventory',
    'qb-core'
}
