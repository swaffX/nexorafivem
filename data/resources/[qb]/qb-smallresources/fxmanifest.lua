fx_version 'cerulean'
game 'gta5'
lua54 'yes'
use_experimental_fxv2_oal 'yes'
author 'Kakarot'
description 'Various small code snippets compiled into one resource for ease of use'
version '1.4.0'

shared_scripts {
    '@qb-core/shared/locale.lua',
    'locales/en.lua',
    'locales/*.lua',
    'config.lua'
}
server_script 'server/*.lua'
client_scripts {
    '@PolyZone/client.lua',
    '@PolyZone/BoxZone.lua',
    '@PolyZone/ComboZone.lua',
    'client/afk.lua',
    'client/arkadakilerigormeme.lua',
    'client/binoculars.lua',
    'client/calmai.lua',
    'client/consumables.lua',
    'client/crouchprone.lua',
    'client/cruise.lua',
    'client/discord.lua',
    'client/editor.lua',
    'client/fireworks.lua',
    'client/handsup.lua',
    'client/hudcomponents.lua',
    'client/ignore.lua',
    'client/noshuff.lua',
    'client/point.lua',
    'client/removeentities.lua',
    -- 'client/seatbelt.lua', -- DISABLED: wais-hudv6 has its own seatbelt system
    'client/tackle.lua',
    'client/teleports.lua',
    'client/vehiclepush.lua',
    'client/vehicletext.lua',
    'client/weapdrop.lua'
}

data_file 'FIVEM_LOVES_YOU_4B38E96CC036038F' 'events.meta'
data_file 'FIVEM_LOVES_YOU_341B23A2F0E0F131' 'popgroups.ymt'

files {
    'events.meta',
    'popgroups.ymt',
    'relationships.dat'
}
