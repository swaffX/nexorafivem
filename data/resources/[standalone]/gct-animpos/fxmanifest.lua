fx_version 'bodacious'
game 'gta5'
version '1.0.0'
lua54 "yes"
author "guneyct & ra1der"
description "Modern tasarıma sahip animasyon pozlama sistemi. (discord.gg/wilddev)"

shared_scripts {
	"config/config.lua",
	"@ox_lib/init.lua"
  }
  
ui_page "html/index.html"

files {
	"config/**/*",
	"html/**/*",
}

client_scripts {
	"config/config.lua",
	"client.lua"
}

server_scripts {
	"config/config.lua",
	"server.lua"
}
