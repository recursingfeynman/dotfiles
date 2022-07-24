---------------------------
-- noaccOS' Nord minimal theme --
---------------------------

local theme_assets = require("beautiful.theme_assets")
local xresources = require("beautiful.xresources")
local dpi = xresources.apply_dpi

local gfs = require("gears.filesystem")
local theme_path = "~/.config/awesome/config/themes/"

local theme = {}

--local screen_width = awful.screen.focused().geometry.width
--local screen_height = awful.screen.focused().geometry.height

theme.wibar_bg_color = '#000000'

theme.font          = "Roboto 15"

theme.wibar_bg = theme.wibar_bg_color
theme.wibar_height = 35

local taglist_square_size = dpi(0)
theme.taglist_squares_sel = theme_assets.taglist_squares_sel(
    taglist_square_size, theme.fg_focus
)
theme.taglist_squares_unsel = theme_assets.taglist_squares_unsel(
    taglist_square_size, theme.fg_normal
)

theme.taglist_text_font = 'Roboto 29'

theme.taglist_text_empty    = {'', '', '', '', ''}
theme.taglist_text_occupied = {'', '', '', '', ''}
theme.taglist_text_focused  = {'', '', '', '', ''}
theme.taglist_text_urgent   = {'', '', '', '', ''}

theme.taglist_spacing = 7

theme.taglist_bg_focus = theme.wibar_bg_color
theme.taglist_fg_focus = '#83a598'

theme.taglist_bg_occupied = theme.wibar_bg_color
theme.taglist_fg_occupied = '#f9f5d7'

theme.taglist_bg_empty = theme.wibar_bg_color
theme.taglist_fg_empty = '#bdae93'

theme.taglist_bg_urgent = theme.wibar_bg_color
theme.taglist_fg_urgent = '#fabd2f'

return theme

