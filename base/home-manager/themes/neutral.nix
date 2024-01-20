{
  waybar = {
    bg = "#1e1e2e";
    text = "#cdd6f4";
    border = "#89b4fa";

    clock = "#89b4fa";
    calendar = "#a6e3a1";
    cpu = "#a6e3a1";
    memory = "#f9e2af";

    bluetooth = "#3498db";

    temperature = "#cba6f7";
    temperature_critical = "#f38ba8";

    audio = "#89dceb";
    audio_muted = "#6c7086";

    current_window = "#e0b51a";
    kernel = "#f9e2af";

    active_background = "#394461";
  };

  alacritty = let color = c: builtins.substring 1 (builtins.stringLength c - 1) c; in
    {
      colors = {
        primary = {
          foreground = "#CDD6F4";
          background = "#1E1E2E";
        };

        selection = {
          text = "#1E1E2E";
          background = "#F5E0DC";
        };

        normal = {
          black = "#45475A";
          red = "#F38BA8";
          green = "#A6E3A1";
          yellow = "#F9E2AF";
          blue = "#89B4FA";
          magenta = "#F5C2E7";
          cyan = "#94E2D5";
          white = "#BAC2DE";
        };

        bright = {
          black = "#585B70";
          red = "#F38BA8";
          green = "#A6E3A1";
          yellow = "#F9E2AF";
          blue = "#89B4FA";
          magenta = "#F5C2E7";
          cyan = "#94E2D5";
          white = "#A6ADC8";
        };
      };
    };

  rofi = {
    border = "#89b4fa80";
    bg = "#1e1e2e80";
    prompt_bg = "#89b4fae6";
    prompt_text = "#1e1e2ee6";

    entry_bg = "#1e1e2e80";
    entry_text = "#cdd6f4e6";
    entry_selected_bg = "#1e1e2e80";
    entry_selected_text = "#f38ba8e6";

    button_bg = "#1e1e2ee6";
    button_text = "#6c7086e6";

    button_selected_bg = "#1e1e2ee6";
    button_selected_text = "#89b4fae6";

    message_bg = "#1e1e2e80";

    textbox_bg = "#1e1e2e80";
    textbox_text = "#89b4fae6";
  };

  dunst = {
    frame_color = "#89B4FA";

    low = {
      background = "#1E1E2E";
      foreground = "#CDD6F4";
    };
    normal = {
      background = "#1E1E2E";
      foreground = "#CDD6F4";
    };
    critical = {
      background = "#1E1E2E";
      foreground = "#CDD6F4";
      frame_color = "#FAB387";
    };
  };

  vscode = {
    theme = "Atom One Dark";
    extensions = { pkgs, ... }: pkgs.vscode-utils.extensionsFromVscodeMarketplace [
      {
        name = "vscode-theme-onedark";
        publisher = "akamud";
        version = "2.3.0";
        sha256 = "8GGv4L4poTYjdkDwZxgNYajuEmIB5XF1mhJMxO2Ho84=";
      }
    ];
  };

  hyprland = let rgb = (c: "rgb(${builtins.substring 1 (builtins.stringLength c - 1) c})"); in
    {
      border_inactive = rgb "#1e1e2e";
      border_active = "${rgb "#89b4fa"} ${rgb "#7f7486"} ${rgb "#9750c3"} 45deg";
    };
}
