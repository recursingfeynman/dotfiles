local revelation=require("revelation")
local awful = require("awful")
local menubar = require("menubar")
local hotkeys_popup = require("awful.hotkeys_popup")

require("awful.hotkeys_popup.keys")



awful.mouse.append_global_mousebindings({
    awful.button({ }, 3, function () mymainmenu:toggle() end)
})

---- Keygrabbers ----

--	modkey = 'Mod4'		-- Super left
	alt = 'Mod1'		-- Alt left

---- Keybindings ----

awful.keyboard.append_global_keybindings({

	awful.key({ modkey, "Shift" }, "s", 
		function() 
			awful.layout.set(awful.layout.suit.floating) 
		end, {description='Set floating layout', group='layout'}),
	
	awful.key({ modkey, "Shift" }, "i", 
		function ()
			awful.layout.set(awful.layout.suit.spiral.dwindle) 
		end, {description='Set spiral layout', group='layout'}),

	awful.key({ modkey }, "s", hotkeys_popup.show_help,
			 {description="Show help", group="awesome"}),

    awful.key({ modkey }, "Left", awful.tag.viewprev,
             {description = "View previous", group = "tag"}),

    awful.key({ modkey }, "Right", awful.tag.viewnext,
             {description = "view next", group = "tag"}),

    awful.key({ modkey }, "Escape", awful.tag.history.restore,
             {description = "go back", group = "tag"}),

    awful.key({ modkey }, "e", revelation),
    
	awful.key({ modkey }, "j", 
		function ()
			awful.client.focus.byidx( 1)
		end,{description = "focus next by index", group = "client"}),

    awful.key({ alt }, "Tab", 
		function ()
			awful.client.focus.byidx(-1) 
		end, {description = "focus previous by index", group = "client"}),

    awful.key({ modkey }, "w", 
		function ()
			mymainmenu:show() 
		end, {description = "show main menu", group = "awesome"}),

    -- Layout manipulation

    awful.key({ modkey, "Shift"   }, "j", 
		function () 
			awful.client.swap.byidx(  1) 
		end, {description = "swap with next client by index", group = "client"}),
    
	awful.key({ modkey, "Shift" }, "k", 
		function () 
			awful.client.swap.byidx( -1) 
		end, {description = "swap with previous client by index", group = "client"}),
    
	awful.key({ modkey, "Control" }, "j", 
		function () 
			awful.screen.focus_relative( 1) 
		end, {description = "focus the next screen", group = "screen"}),

    awful.key({ modkey, "Control" }, "k", 
		function () 
			awful.screen.focus_relative(-1) 
		end, {description = "focus the previous screen", group = "screen"}),

    awful.key({ modkey }, "u", 
		awful.client.urgent.jumpto,
        {description = "jump to urgent client", group = "client"}),
    
	awful.key({ modkey }, "Tab",
        function ()
            awful.client.focus.history.previous()
            if client.focus then
                client.focus:raise()
            end
        end,
        {description = "go back", group = "client"}),

    -- Standard program
    awful.key({ modkey }, "Return", 
		function () 
			awful.spawn(terminal) 
		end, {description = "open a terminal", group = "launcher"}),
    
	awful.key({ modkey, "Control" }, "r", 
		awesome.restart,
        {description = "reload awesome", group = "awesome"}),
    
	awful.key({ modkey, "Shift"   }, "q", 
		awesome.quit,
        {description = "quit awesome", group = "awesome"}),

    awful.key({ modkey }, "l",     
		function () 
			awful.tag.incmwfact(0.05)          
		end, {description = "increase master width factor", group = "layout"}),
    
	awful.key({ modkey }, "h",     
		function () 
			awful.tag.incmwfact(-0.05)
		end, {description = "decrease master width factor", group = "layout"}),
    
	awful.key({ modkey, "Shift" }, "h", 
		function () 
			awful.tag.incnmaster( 1, nil, true) 
		end, {description = "increase the number of master clients", group = "layout"}),
    
	awful.key({ modkey, "Shift" }, "l",
		function () 
			awful.tag.incnmaster(-1, nil, true) 
		end, {description = "decrease the number of master clients", group = "layout"}),
    
	awful.key({ modkey, "Control" }, "h", 
		function () 
			awful.tag.incncol( 1, nil, true)
		end, {description = "increase the number of columns", group = "layout"}),
    
	awful.key({ modkey, "Control" }, "l",
		function () 
			awful.tag.incncol(-1, nil, true)
		end, {description = "decrease the number of columns", group = "layout"}),
    
	awful.key({ modkey }, "g", 
		function () 
			awful.layout.inc( 1)
		end, {description = "select next", group = "layout"}),
    
	awful.key({ modkey }, "v", 
		function () 
			awful.layout.inc(-1)
		end, {description = "select previous", group = "layout"}),

    awful.key({ modkey, "Control" }, "n",
              function ()
                  local c = awful.client.restore()
                  -- Focus restored client
                  if c then
                    c:emit_signal(
                        "request::activate", "key.unminimize", {raise = true}
                    )
                  end
              end, {description = "restore minimized", group = "client"}),


    -- Demnu
    awful.key({ 'Control' }, "space", 
		function () 
			awful.util.spawn("dmenu_run -m 0") 
		end, {description = "Launch Dmenu", group = "amadeus"}),

    -- Demnu
--    awful.key({ "Control" }, "space", function () 
--		awful.util.spawn("~/.scripts/search")
--		end, {description = "Perform a web search, dmenu script", group = "amadeus"}),

    -- Emoji
--    awful.key({ modkey , "Shift" }, "space", function () 
--		awful.util.spawn("~/.scripts/emoji") 
--		end, {description = "Copy and Paste some Emoji!!!", group = "amadeus"}),

    -- Google
    awful.key({ modkey }, "b", 
		function ()
			awful.util.spawn("google-chrome-stable") 
		end, {description = "Launch a Google Chrome", group = "amadeus"}),

    -- Google
    awful.key( { }, "Print", 
		function ()
			awful.util.spawn("flameshot screen -p /home/amadeus/Downloads/") 
		end, {description = "Take Screenshot", group = "amadeus"}),

    -- Feh
--    awful.key({ modkey }, "c", function ()
--		awful.util.spawn("~/.scripts/wall")
--		end, {description = "Change Wallpaer", group = "amadeus"}),

	-- Lock Screen
    awful.key({ "Control" , "Shift" }, "Delete", 
		function ()
			awful.util.spawn("i3lock -i /home/amadeus/.config/awesome/config/wallpaper/wallpaper1_blurred.png -B sigma -k -e --indicator --ring-width 0 --radius 90 --inside-color=00000000 --ring-color=00000000 --insidewrong-color=00000000") 
		end, {description = "Lock Screen (i3 Lock)", group = "amadeus"}),
    
	-- Menubar
    awful.key({ modkey , "Shift"}, "p", 
		function() 
			menubar.show() 
		end, {description = "show the menubar", group = "launcher"}),

})




client.connect_signal("request::default_mousebindings", function()
    
	awful.mouse.append_client_mousebindings({

        awful.button({ }, 1, 
			function (c)
				c:activate { context = "mouse_click" }
			end),

        awful.button({ modkey }, 1,	
			function (c)
				c:activate { context = "mouse_click", action = "mouse_move"  }
			end),

        awful.button({ modkey }, 3, 
			function (c)
				c:activate { context = "mouse_click", action = "mouse_resize"}
			end),

		})

end)


    
client.connect_signal("request::default_keybindings", function ()
	
	awful.keyboard.append_client_keybindings({
		
		awful.key({ modkey }, "f", 
			function (c)
				c.fullscreen = not c.fullscreen
				c:raise()
			end, {description = "toggle fullscreen", group = "client"}),
    
		awful.key({ modkey }, "q", 
			function (c) 
				c:kill() 
			end, {description = "close", group = "makc"}),
		
		awful.key({ modkey, "Control" }, "space",  
			awful.client.floating.toggle,
			{description = "toggle floating", group = "client"}),
		
		awful.key({ modkey, "Control" }, "Return", 
			function (c) 
				c:swap(awful.client.getmaster()) 
			end, {description = "move to master", group = "client"}),
		
		awful.key({ modkey }, "o", 
			function (c) 
				c:move_to_screen() 
			end, {description = "move to screen", group = "client"}),

		awful.key({ modkey }, "t", 
			function (c) 
				c.ontop = not c.ontop 
			end, {description = "toggle keep on top", group = "client"}),

		awful.key({ modkey, "Control", "Shift" }, "n", 
			function (c)
				c.minimized = true 
			end , {description = "minimize", group = "client"}),

		awful.key({ modkey }, "m", 
			function (c)
				c.maximized = not c.maximized
				c:raise()
			end , {description = "(un)maximize", group = "client"}),

		awful.key({ modkey, "Control" }, "m", 
			function (c)
				c.maximized_vertical = not c.maximized_vertical
				c:raise()
			end , {description = "(un)maximize vertically", group = "client"}),

		awful.key({ modkey, "Shift"   }, "m", 
			function (c)
				c.maximized_horizontal = not c.maximized_horizontal
				c:raise()
			end , {description = "(un)maximize horizontally", group = "client"})
	
		})

end)



for i = 1, 9 do
    
	awful.keyboard.append_global_keybindings({   
	    
		awful.key({ modkey }, "#" .. i + 9,
			function ()
                local screen = awful.screen.focused()
                local tag = screen.tags[i]
                if tag then
					tag:view_only()
                end
            end, {description = "view tag #"..i, group = "tag"}),
        
		-- Toggle tag display.
        awful.key({ modkey, "Control" }, "#" .. i + 9,
                  function ()
                      local screen = awful.screen.focused()
                      local tag = screen.tags[i]
                      if tag then
                         awful.tag.viewtoggle(tag)
                      end
                  end, {description = "toggle tag #" .. i, group = "tag"}),

        -- Move client to tag.
        awful.key({ modkey, "Shift" }, "#" .. i + 9,
                  function ()
                      if client.focus then
                          local tag = client.focus.screen.tags[i]
                          if tag then
                              client.focus:move_to_tag(tag)
                          end
                     end
                  end, {description = "move focused client to tag #"..i, group = "tag"}),

        -- Toggle tag on focused client.
        awful.key({ modkey, "Control", "Shift" }, "#" .. i + 9,
                  function ()
                      if client.focus then
                          local tag = client.focus.screen.tags[i]
                          if tag then
                              client.focus:toggle_tag(tag)
                          end
                      end
                  end, {description = "toggle focused client on tag #" .. i, group = "tag"})
	
	})

end

root.keys(globalkeys)



