local awful = require('awful')

awful.spawn.with_shell('picom --experimental-backends')
awful.spawn.with_shell('feh --bg-scale ~/.config/awesome/config/wallpaper/wallpaper1.jpg')
awful.spawn.with_shell('~/.config/redshift/autostart.sh')
-- awful.spawn.with_shell('~/.config/awesome/config/autostart/x0vncserver.service')
--awful.spawn.with_shell('rustdesk')


