fx_version 'cerulean'
game 'gta5'


client_scripts {
    "animations/*.lua",
    "animations/merge/*.lua",
    "client/*.lua"
}

server_scripts {
    "animations/*.lua",
    "server/main.lua"
}

ui_page "html/index.html"

files {
    "html/index.html",
    "html/css/*.css",
    "html/img/*.png",
    "html/js/*.js",
    "html/fonts/*.otf",
    "html/fonts/*.ttf",
}


escrow_ignore {
    "cylexac.lua",
    "animations/*.lua",
    "animations/merge/*.lua",
}
 
client_script 'cylexac.lua'

-- data_file "DLC_ITYP_REQUEST" "badge1.ytyp"
-- data_file "DLC_ITYP_REQUEST" "copbadge.ytyp"
-- data_file "DLC_ITYP_REQUEST" "prideprops_ytyp"
-- data_file "DLC_ITYP_REQUEST" "lilflags_ytyp"
-- data_file 'DLC_ITYP_REQUEST' 'bzzz_foodpack'
-- data_file 'DLC_ITYP_REQUEST' 'natty_props_lollipops.ytyp'
-- data_file 'DLC_ITYP_REQUEST' 'bebek.ytyp'