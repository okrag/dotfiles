{ wallpaper, lock, pkgs }: [
  "${pkgs.dunst}/bin/dunst -layer overlay"
  "${pkgs.waybar}/bin/waybar"
  "${pkgs.xwaylandvideobridge}/bin/xwaylandvideobridge"

  "dbus-update-activation-environment --all"
  "${pkgs.polkit_gnome}/libexec/polkit-gnome-authentication-agent-1"

  "sleep 1 && swww init && swww img --outputs DVI-D-1 ${../wallpapers/painting.jpg} && swww img --outputs DP-1 ${../wallpapers/hut.jpg}"
]
