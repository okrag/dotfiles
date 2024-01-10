{ pkgs }:
let colors = import ./colors.nix; in
[
  {
    layer = "top"; # Waybar on highest layer so tooltips go over windows
    height = 36; # Set height to avoid jumping due to active workspace indicator

    margin-top = 5;
    margin-left = 10;
    margin-right = 10;

    modules-left = [ "hyprland/workspaces" "hyprland/window" "mpris" ]; # Sets modules for the left of the bar
    modules-center = [ "clock" ]; # Set modules for the center of the bar
    modules-right = [ "tray" "custom/nightlight" "temperature" "bluetooth" "cpu" "memory" "custom/kernel" "pulseaudio" ]; # Set modules for the right of the bar

    clock = {
      format = "{:<big><span color=\"${colors.clock}\">  </span>%H:%M</big>\t<span color=\"${colors.calendar}\">  </span>%A, %B %d}";
      #format-alt = "{:<big><span color=\"${colors.calendar}\"> </span>%A, %B %d</big>    <small><span color=\"${colors.clock}\">  </span>%H:%M</small>}";
      interval = 1;
    };

    mpris = {
      format = "{player_icon} {dynamic}";
      format-paused = "{status_icon} <i>{dynamic}</i>";
      dynamic-len = 40;
      dynamic-order = [
        "title"
        "artist"
        "album"
        # "position"
        # "length"
      ];
      player-icons = {
        default = "⏸";
        mpv = "🎵";
      };
      status-icons = {
        paused = "▶";
      };
    };


    cpu = {
      format = "<span color=\"${colors.cpu}\"> </span>{}%";
      interval = 2;
    };

    memory = {
      format = "<span color=\"${colors.memory}\"> </span>{used}GiB";
      interval = 2;
    };

    temperature = {
      hwmon-path = "/sys/class/hwmon/hwmon2/temp1_input";
      critical-threshold = 70;
      format = "<span color=\"${colors.temperature}\"> </span>{temperatureC}°C";
      format-critical = "<span color=\"${colors.temperature_critical}\">󰸁 </span>{temperatureC}°C";
      interval = 2;
    };

    pulseaudio = {
      scroll-step = 5; # %, can be a float
      format = "<span color=\"${colors.audio}\">{icon} </span>{volume}%";
      format-muted = "<span color=\"${colors.audio_muted}\"> </span>Muted";
      format-icons = [ "" "" "" ];
      on-click = "pavucontrol";
    };

    "bluetooth" = {
      format = "<span color=\"${colors.bluetooth}\"></span> {status}";
      format-connected = "<span color=\"${colors.bluetooth}\"></span> {device_alias}";
      format-connected-battery = "<span color=\"${colors.bluetooth}\"></span> {device_alias} {device_battery_percentage}%";
      tooltip-format = "{controller_alias}\t{controller_address}\n\n{num_connections} connected";
      tooltip-format-connected = "{controller_alias}\t{controller_address}\n\n{num_connections} connected\n\n{device_enumerate}";
      tooltip-format-enumerate-connected = "{device_alias}\t{device_address}";
      tooltip-format-enumerate-connected-battery = "{device_alias}\t{device_address}\t{device_battery_percentage}%";
    };

    "hyprland/window" = let prefix = "<span color=\"${colors.current_window}\"> </span>"; in
      {
        max-length = 48;
        format = "${prefix}{}";
        rewrite = {
          "${prefix}(.*) - Visual Studio Code" = "${prefix}󰨞 $1";
          "${prefix}(.*) - Brave" = "${prefix}󰇧 $1";
          "${prefix}(.*) — Tor Browser" = "${prefix}🧅";
        };
      };

    "custom/nightlight" = {
      on-click = "${pkgs.hyprshade}/bin/hyprshade toggle ${../hypr/nightlight.frag}";

      format = "<span color=\"${colors.kernel}\"> </span>";
    };
    "custom/kernel" = {
      exec = "uname -r | cut -d '-' -f1";
      interval = "once";
      format = "<span color=\"${colors.kernel}\"> </span>{}";
    };

    tray = {
      icon-size = 18;
      spacing = 8;
    };

    "hyprland/workspaces" = {
      # all-outputs = true
      format = "{id}: {icon}";
      format-icons = {
        "3" = "";
        urgent = "";
        active = "";
        default = "";
      };
    };
  }
]
