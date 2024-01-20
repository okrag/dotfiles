{ lock, terminal, pkgs, browser, ... }: ''
  #################### It just works™ keybinds ###################
  # Volume
  bindl = ,XF86AudioMute, exec, pactl set-sink-mute @DEFAULT_SINK@ toggle
  bindle=, XF86AudioRaiseVolume, exec, wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%+
  bindle=, XF86AudioLowerVolume, exec, wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-
  bindle = , XF86AudioRaiseVolume, exec, ~/.config/eww/scripts/volume osd &
  bindle = , XF86AudioLowerVolume, exec, ~/.config/eww/scripts/volume osd &
  bindl = , XF86AudioMute, exec, ~/.config/eww/scripts/volume osd &

  # Brightness
  #bindle=, XF86MonBrightnessUp, exec, light -A 3 && ~/.config/eww/scripts/brightness osd &
  #bindle=, XF86MonBrightnessDown, exec, light -U 3 && ~/.config/eww/scripts/brightness osd &

  ######################################## Keybinds ########################################
  # Apps: just normal apps
  bind = SUPER, Return, exec, ${terminal}
  bind = SUPER, B, exec, ${browser}

  # Actions 
  bind = SUPERSHIFT, Period, exec, pkill wofi || wofi-emoji
  bind = SUPER, Q, killactive,
  bind = SUPERALT, Space, togglefloating, 
  bind = SHIFTSUPER, Q, exec, hyprctl kill
  bind = CONTROLSHIFTALTSUPER, Delete, exec, systemctl poweroff

  # Screenshot, Record, OCR (Optical Character Recognition), Color picker, Clipboard history
  bind = SUPERSHIFTALT, S, exec, grim -g "$(slurp)" - | swappy -f -
  bindl =,Print,exec,grim - | wl-copy
  bind = SUPERSHIFT, S, exec, grim -g "$(slurp)" - | wl-copy
  bind = SUPERSHIFT, C, exec, hyprpicker -a

  # Media
  #bind = SUPERSHIFT, N, exec, playerctl next || playerctl position `bc <<< "100 * $(playerctl metadata mpris:length) / 1000000 / 100"`
  #bind = SUPERSHIFT, B, exec, playerctl previous
  #bind = SUPERSHIFT, P, exec, playerctl play-pause

  #Lock screen
  bind = SUPER, L, exec, ${lock}
  bind = SUPERSHIFT, L, exec, ${lock}
  bindl = SUPERSHIFT, L, exec, sleep 0.1 && systemctl suspend

  # App launcher
  bindr = SUPER, SUPER_L, exec, rofi -show drun -modi drun
  bind = SUPER, P, exec, rofi -show p -modi p:\'${pkgs.rofi-power-menu}/bin/rofi-power-menu\'
  bind = SUPER, C, exec, rofi -show calc -modi calc

  ############################ Keybinds for Hyprland ############################
  # Swap windows
  bind = SUPERSHIFT, left, movewindow, l
  bind = SUPERSHIFT, right, movewindow, r
  bind = SUPERSHIFT, up, movewindow, u
  bind = SUPERSHIFT, down, movewindow, d
  # Move focus
  bind = SUPER, left, movefocus, l
  bind = SUPER, right, movefocus, r
  bind = SUPER, up, movefocus, u
  bind = SUPER, down, movefocus, d
  bind = SUPER, BracketLeft, movefocus, l
  bind = SUPER, BracketRight, movefocus, r
  # Exit hyprland
  bind = CONTROLALT, Delete, exit


  # Workspace, window, tab switch with keyboard
  bind = CONTROLSUPER, right, workspace, +1
  bind = CONTROLSUPER, left, workspace, -1
  bind = CONTROLSUPER, BracketLeft, workspace, -1
  bind = CONTROLSUPER, BracketRight, workspace, +1
  bind = CONTROLSUPER, up, workspace, -5
  bind = CONTROLSUPER, down, workspace, +5
  bind = SUPER, Page_Down, workspace, +1
  bind = SUPER, Page_Up, workspace, -1
  bind = CONTROLSUPER, Page_Down, workspace, +1
  bind = CONTROLSUPER, Page_Up, workspace, -1
  bind = SUPERSHIFT, Page_Down, movetoworkspace, +1
  bind = SUPERSHIFT, Page_Up, movetoworkspace, -1
  bind = CONTROLSUPERSHIFT, Right, movetoworkspace, +1
  bind = CONTROLSUPERSHIFT, Left, movetoworkspace, -1
  bind = SUPERSHIFT, mouse_down, movetoworkspace, -1
  bind = SUPERSHIFT, mouse_up, movetoworkspace, +1

  # Window split ratio
  binde = SUPER, Minus, splitratio, -0.1
  binde = SUPER, Equal, splitratio, 0.1
  binde = SUPER, Semicolon, splitratio, -0.1
  binde = SUPER, Apostrophe, splitratio, 0.1

  # Fullscreen
  bind = SUPER, F, fullscreen
  bind = SUPER, Z, fullscreen, 1

  # Switching
  ${builtins.concatStringsSep "\n" (builtins.genList (i: "bind = SUPER, ${toString (i + 1)}, exec, hyprsome workspace ${toString (i + 1)}") 9)}
  bind = SUPER, 0, exec, hyprsome workspace 10
  bind = ALT, Tab, cyclenext
  bind = ALT, Tab, bringactivetotop,   # bring it to the top

  # Move window to workspace Super + Shift + [0-9] 
  ${builtins.concatStringsSep "\n" (builtins.genList (i: "bind = SUPER SHIFT, ${toString (i + 1)}, exec, hyprsome move ${toString (i + 1)}") 9)}
  bind = SUPER SHIFT, 0, exec, hyprsome move 10

  # Scroll through existing workspaces with (Control) + Super + scroll
  bind = SUPER, mouse_up, workspace, +1
  bind = SUPER, mouse_down, workspace, -1
  bind = CONTROLSUPER, mouse_up, workspace, +1
  bind = CONTROLSUPER, mouse_down, workspace, -1

  # Move/resize windows with Super + LMB/RMB and dragging
  bindm = SUPER, mouse:272, movewindow
  bindm = SUPER, mouse:273, resizewindow
  bind = CONTROLSUPER, Backslash, resizeactive, exact 640 480
''
