{ wallpaper, lock, pkgs }: [
  "${pkgs.dunst}/bin/dunst -layer overlay"
  "${pkgs.waybar}/bin/waybar"

  "gsettings set org.gnome.desktop.interface color-scheme \"prefer-dark\""

  "dbus-update-activation-environment --all"
  "systemctl --user start hyprpolkitagent"

  "${pkgs.hyprsunset}"

  "sleep 1 && swww init && 
  swww img --outputs DVI-D-1 ${../wallpapers/painting.jpg} && 
  swww img --outputs DP-1 ${../wallpapers/hut.jpg}
  swww img --outputs HDMI-A-1 ${../wallpapers/win_red.jpg}
  "
]
