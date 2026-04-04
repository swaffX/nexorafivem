-- =====================================================
--  decrypted by https://discord.gg/6NCbAv2VNK 𝐀𝐤 𝐋𝐞𝐚𝐤𝐬 
--		Cleaned By Said Ak Using Claude Sonnet 4.5
-- =====================================================

-- Author: Ayazwai <https://ayazwai.dev>
-- Github: https://github.com/ayazwai
-- Discord: https://discord.gg/0resmon
-- LinkendIn: https://www.linkedin.com/in/ayaz-ekrem-770305212/

use_experimental_fxv2_oal 'yes'
fx_version 'bodacious'
lua54 'yes'
game 'gta5'

--[[ Resource Information ]]--

author 'vorax'
version '1.0.7'
scriptname 'wais-hudv6'
description 'FiveM hud with customizable, advanced user interface and features.'

--[[ Resource Information ]]--

shared_scripts {
    'config.lua',
    'locales/*.lua',
    'bridge/editable/location.lua',
    'bridge/editable/weapons.lua',
    'bridge/editable/postal.lua',
    'bridge/framework.lua',
    '@ox_lib/init.lua',
}

client_scripts {
    'bridge/editable/belt.lua',
    'bridge/editable/client.lua',
    'bridge/esx/client.lua',
    'bridge/qb/client.lua',
    'bridge/ox_inventory_bridge.lua', -- OX_INVENTORY BRIDGE
    'client/client.lua',
}

server_scripts {
    'bridge/editable/server.lua',
    'bridge/esx/server.lua',
    'bridge/qb/server.lua',
    'server/server.lua',
}

dependencys {
    'xsound',
    'ox_lib',
}

ui_page "web/dist/index.html"
files {
    'web/dist/*.js',
    'web/dist/index.html',

    'web/public/*.json',
    'web/public/**/*.png',
    'web/public/css/*.*',
    'web/public/fonts/*.*',
    'web/public/locales/*.json',
}