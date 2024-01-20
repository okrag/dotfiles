{ wallpaper, lock, pkgs, terminal, terminal_class }: {
  monitor = [
    "DP-2,1920x1080@144,0x0,1"
    "DP-1,1920x1080@144,0x0,1"
    "DVI-I-1,preffered,1920x0,1"
    "DVI-D-1,preffered,1920x0,1"
  ];

  workspace =
    let monitors = [ "DP-1" "DVI-D-1" ];
    in
    builtins.genList
      (i:
        "${toString (i + 1)},monitor:${builtins.elemAt monitors (builtins.floor (i / 10))}"
      )
      (builtins.length monitors * 10);

  env = import ./env.nix;

  exec-once = import ./execs.nix { inherit wallpaper lock pkgs; };

  general = {
    gaps_in = 4;
    gaps_out = 8;
    border_size = 3;

    # Fallback colors
    "col.active_border" = "rgba(0DB7D4FF) rgba(7AA2F7FF) rgba(9778D0FF) 45deg";
    "col.inactive_border" = "rgba(04404aaa)";

    # Functionality
    # resize_on_border = true
    layout = "dwindle";
  } // import ./colors.nix;

  input = {
    # force_no_accel = true;

    sensitivity = -0.5;

    kb_layout = "pl";
    # kb_variant = "dvorak";
    follow_mouse = 1;
    numlock_by_default = true;

    scroll_method = "2fg";

    touchpad = {
      natural_scroll = "yes";
      disable_while_typing = true;
      clickfinger_behavior = true;
      scroll_factor = 0.7;
    };
  };

  decoration = {
    rounding = 10;

    # Blur
    blur = {
      enabled = true;
      size = 3;
      passes = 2;
      new_optimizations = "on";
      ignore_opacity = false;
    };

    # Shadow
    drop_shadow = "no";
    shadow_range = 30;
    shadow_render_power = 3;
    "col.shadow" = "rgba(01010166)";

    # Shader
    screen_shader = "${./nightlight.frag}";

    # Dim
    dim_inactive = false;
    dim_strength = 0.1;
    dim_special = 0;
  };

  animations = {
    enabled = "yes";
    # Animation curves

    bezier = [
      "md3_standard, 0.2, 0.0, 0, 1.0"
      "md3_decel, 0.05, 0.7, 0.1, 1"
      "md3_accel, 0.3, 0, 0.8, 0.15"
      "overshot, 0.05, 0.9, 0.1, 1.05"
      "hyprnostretch, 0.05, 0.9, 0.1, 1.0"
      "win10, 0, 0, 0, 1"
      "gnome, 0, 0.85, 0.3, 1"
      "funky, 0.46, 0.35, -0.2, 1.2"
      "linear, 0, 0, 1, 1"
    ];

    # Animation configs
    animation = [
      "windows, 1, 2, md3_decel, popin"
      "border, 1, 10, default"
      "fade, 1, 0.0000001, default"
      "workspaces, 1, 4, md3_decel, slide"
    ];
  };

  misc = {
    vfr = 1;
    vrr = 0;
    focus_on_activate = true;
    animate_manual_resizes = true;
    animate_mouse_windowdragging = true;
    #suppress_portal_warnings = true
    enable_swallow = true;
    disable_hyprland_logo = true;
  };

  gestures = {
    workspace_swipe = false;
  };

  dwindle = {
    preserve_split = true; # you probably want this
    #no_gaps_when_only = true
  };

  windowrule = [
    "float, ^(steam)$"
    "float, ^(guifetch)$"
    "float, ^(pavucontrol)$"

    "float,title:^(Open File)(.*)$"
    "float,title:^(Open Folder)(.*)$"
    "float,title:^(Save As)(.*)$"
    "float,title:^(Library)(.*)$"

    "bordercolor rgba(D02377ff), xwayland:1"

    # "opacity 0.5, ^(${terminal_class})$"
  ];
  windowrulev2 = [
    "rounding 17, floating:1"

    # Hide xwaylandvideobridge
    "opacity 0.0 override 0.0 override,class:^(xwaylandvideobridge)$"
    "noanim,class:^(xwaylandvideobridge)$"
    "nofocus,class:^(xwaylandvideobridge)$"
    "noinitialfocus,class:^(xwaylandvideobridge)$"
  ];

  layerrule = [
    "blur, rofi"
    "blur, waybar"
  ];


}
