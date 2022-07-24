local awful = require('awful')
local beautiful = require('beautiful')
local wibox = require("wibox")
local gears = require('gears')
local dpi = require("beautiful.xresources").apply_dpi
local calendar_widget = require("config.widgets.calendar")

--local build_widget = require('config.build_widget')


-- local theme = beautiful.init(gears.filesystem.get_configuration_dir() .. 'config/themes/theme.lua')



-------------------------------
---- ┬ ┬┌─┐┬  ┌─┐┌─┐┬─┐┌─┐ ----
---- ├─┤├┤ │  ├─┘├┤ ├┬┘└─┐ ----
---- ┴ ┴└─┘┴─┘┴  └─┘┴└─└─┘ ----
-------------------------------
	function colorize_text(txt, fg)
		return "<span foreground='" .. fg .."'>" .. txt .. "</span>"
	end


	local taglist_buttons = gears.table.join(
		awful.button({ }, 1, function(t) t:view_only() end),
		awful.button({ modkey }, 1, function(t)
			if client.focus then
	            client.focus:move_to_tag(t)
	        end
	    end),
		awful.button({ }, 3, awful.tag.viewtoggle),
		awful.button({ modkey }, 3, function(t)
			if client.focus then
				client.focus:toggle_tag(t)
			end
		end),
	    awful.button({ }, 4, function(t) awful.tag.viewnext(t.screen) end),
	    awful.button({ }, 5, function(t) awful.tag.viewprev(t.screen) end)
	)


	local update_taglist = function (item, tag, index)
	  if tag.selected then
	    item.markup = colorize_text(beautiful.taglist_text_focused[index], beautiful.taglist_fg_focus)
	  elseif tag.urgent then
	    item.markup = colorize_text(beautiful.taglist_text_urgent[index], beautiful.taglist_fg_urgent)
	  elseif #tag:clients() > 0 then
	    item.markup = colorize_text(beautiful.taglist_text_occupied[index], beautiful.taglist_fg_occupied)
	  else
	    item.markup = colorize_text(beautiful.taglist_text_empty[index], beautiful.taglist_fg_empty)
	  end
	end



----------------------------
---- ┬  ┌─┐┬ ┬┌─┐┬ ┬┌┬┐ ----
---- │  ├─┤└┬┘│ ││ │ │  ----
---- ┴─┘┴ ┴ ┴ └─┘└─┘ ┴  ----
----------------------------

tag.connect_signal("request::default_layouts", function()
    awful.layout.append_default_layouts({
        awful.layout.suit.floating,
        awful.layout.suit.spiral.dwindle,
        awful.layout.suit.max,
        awful.layout.suit.fair,
        awful.layout.suit.magnifier,
		awful.layout.suit.tile,
		awful.layout.suit.tile.top,
		awful.layout.suit.tile.bottom,
		awful.layout.suit.tile.left,
		awful.layout.suit.tile.right,
--        awful.layout.suit.fair.horizontal,
--        awful.layout.suit.spiral,
--        awful.layout.suit.spiral.dwindle,
--        awful.layout.suit.max,
--        awful.layout.suit.max.fullscreen,
--        awful.layout.suit.magnifier,
--        awful.layout.suit.corner.nw,
    })
end)

	awful.screen.connect_for_each_screen(function(s)
    
		local l = awful.layout.suit 
    
		local layouts = {
	        l.floating,
	        l.spiral.dwindle,
	        l.tile,
	        l.max,
			l.floating
	    }

		local tagnames = beautiful.tagnames or { "1", "2", "3", "4", "5"}

		awful.tag(tagnames, s , layouts)
		

		local month = wibox.widget {
			widget = wibox.container.background,
			fg = '#fbf1c7',
			{
				widget = wibox.container.margin,
				right = 4,
				{
					widget = wibox.widget.textclock,
					format = '%b',
					font = 'Montserrat Medium 14',
				},
			},
		}

		local day = wibox.widget {
			widget = wibox.container.background,
			fg = '#fbf1c7',
			{
				widget = wibox.container.margin,
				right = 15,
				{
					widget = wibox.widget.textclock,
					format = '%d',
					font = 'Montserrat Medium 14',
				},
			},

		}


		local time = wibox.widget {
			widget = wibox.container.background,
			fg = '#fabd2f',
			{ 
				widget = wibox.container.margin,
				right = 15,
				{ 
					widget = wibox.widget.textclock,
					format = "%H:%M",
					font = 'Montserrat Bold 14',				
				},
			},
					
		}

--]]

	s.mywibox = awful.wibar({
		position = 'top',
		screen = s,
		opacity = 0.8,
	})



local taglist = wibox.widget {


	widget = wibox.container.background,
	{
		widget = wibox.container.margin,
		left = 1,
		bottom = 2,
		awful.widget.taglist {
			screen = s,
			filter = awful.widget.taglist.filter.all,
			widget_template = {
				widget = wibox.widget.textbox,
				create_callback = function ( self, tag, index, _ )
					self.font = beautiful.taglist_text_font
					update_taglist( self, tag, index )
				end,
				update_callback = function ( self, tag, index, _ )
					update_taglist ( self, tag, index )
				end,
			},
			buttons = taglist_buttons
		},
	},
}



		s.systray = wibox.widget.systray()
		s.systray.visible = false




    -- Add widgets to the wibox
	s.mywibox:setup {
			layout = wibox.layout.align.horizontal,
			expand = "none",

        { -- Left widgets
            layout = wibox.layout.fixed.horizontal,
			

           
		},

		{ -- Middle widgets
			layout = wibox.layout.fixed.horizontal,
			taglist,

		},
		
		{ -- Right widgets
			layout = wibox.layout.fixed.horizontal,
		--	bashdate,
			--test,
			--wibox.container.margin(bashdate, 0,0,0,0),
			month,
			day,
			time,

        },
    }

	end)



