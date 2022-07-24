pcall(require, "luarocks.loader")

local revelation=require("revelation")
local gears = require("gears")
local awful = require("awful")
local beautiful = require("beautiful")
local menubar = require("menubar")

local theme = beautiful.init(gears.filesystem.get_configuration_dir() .. 'config/themes/theme.lua')

require('awful.autofocus')

revelation.init()

terminal = "kitty"
editor = os.getenv("nvim") or "nvim"
editor_cmd = terminal .. " -e " .. editor

modkey = "Mod4"


myawesomemenu = {
   { "hotkeys", function() hotkeys_popup.show_help(nil, awful.screen.focused()) end },
   { "manual", terminal .. " -e man awesome" },
   { "edit config", editor_cmd .. " " .. awesome.conffile },
   { "restart", awesome.restart },
   { "quit", function() awesome.quit() end },
}

mymainmenu = awful.menu({ 
	items = {
		{ 
			"awesome", myawesomemenu
		},
        { 
			"open terminal", terminal 
		}
    }
})

--- Exclude later
menubar.utils.terminal = terminal -- Set the terminal for applications that require it

local function set_wallpaper(s)
    
    if beautiful.wallpaper then
        local wallpaper = beautiful.wallpaper
    
        if type(wallpaper) == "function" then
            wallpaper = wallpaper(s)
        end
        gears.wallpaper.maximized(wallpaper, s, true)
    end
end


screen.connect_signal("property::geometry", set_wallpaper)

client.connect_signal("manage", function (c)
    if awesome.startup
      and not c.size_hints.user_position
      and not c.size_hints.program_position then
        -- Prevent clients from being unreachable after screen count changes.
        awful.placement.no_offscreen(c)
    end
end)
--- 

modules = {}

require('config.errors')

require('config.keys')

require('config.rules')

require('config.layout')

require('config.autostart')




beautiful.useless_gap = 10
beautiful.notification_opacity = '100'
beautiful.notification_icon_size = 80
beautiful.notification_bg = '(0,0,0)'
beautiful.notification_fg = '#d4be98'


collectgarbage("setpause", 110)
collectgarbage("setstepmul", 1000)


