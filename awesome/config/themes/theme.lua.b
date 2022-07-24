--------------------------
-- Default awesome theme --
---------------------------

local theme_assets = require("beautiful.theme_assets")
local xresources = require("beautiful.xresources")
local rnotification = require("ruled.notification")
local dpi = xresources.apply_dpi
local gfs = require("gears.filesystem")
local themes_path = gfs.get_configuration_dir() .. ('config/themes/')

local theme = {}

theme.font          = "sans 8"

theme.bg_normal     = "#222222"
theme.bg_focus      = "#535d6c"
theme.bg_urgent     = "#ff0000"
theme.bg_minimize   = "#444444"
theme.bg_systray    = theme.bg_normal

theme.fg_normal     = 'red'
theme.fg_focus      = "#ffffff"
theme.fg_urgent     = "#ffffff"
theme.fg_minimize   = "#ffffff"

theme.useless_gap         = dpi(0)
theme.border_width        = dpi(1)
theme.border_color_normal = "#000000"
theme.border_color_active = "#535d6c"
theme.border_color_marked = "#91231c"

theme.icon_theme = nil

-- Generate taglist squares:
-- theme.wallpaper = "~/.config/awesome/themes/wallpaper2.jpg"

theme.taglist_text_empty    = {"9", "", "", "", ""}
theme.taglist_text_occupied = {"9", "", "", "", ""}
theme.taglist_text_focused  = {"9", "", "", "", ""}
theme.taglist_text_urgent   = {"9", "", "", "", ""}

--[[theme.taglist_bg_focus = 'red'
theme.taglist_fg_focus = 'red'
theme.taglist_bg_occupied = 'red'
theme.taglist_fg_occupied = 'red'
theme.taglist_bg_empty = 'red'
theme.taglist_fg_empty = 'red'
theme.taglist_bg_urgent = 'red'
theme.taglist_fg_urgent = 'red'--]]

return theme
