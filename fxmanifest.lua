fx_version "cerulean"
games { "gta5" }

author "Team BroCode"
description "Multi Stage ProgressBar"
version "1.0.0"
lua54 "yes"

ui_page "web/build/index.html"

client_scripts {
	"config.lua",
	"client.lua"
}

files {
	"web/build/index.html",
	"web/build/**/*"
}
