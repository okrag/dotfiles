{
  waybar = {
    bg = "#2e2505";
    text = "#fefcf6";
    border = "#ffc909";

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

    active_background = "#624e06";
  };

  foot = let color = c: builtins.substring 1 (builtins.stringLength c - 1) c; in
    {
      cursor = {
        style = "beam";
        color = "${color "#1E1E2E"} ${color "#ffc909"}";
        blink = true;
      };

      colors = {
        alpha = 0.7;
        foreground = color "#fefcf6";
        background = color "#292105";

        selection-foreground = color "#1E1E2E";
        selection-background = color "#ffc909";

        urls = color "#F5E0DC";

        regular0 = color "#45475A";
        bright0 = color "#585B70";

        regular1 = color "#F38BA8";
        bright1 = color "#F38BA8";

        regular2 = color "#A6E3A1";
        bright2 = color "#A6E3A1";

        regular3 = color "#F9E2AF";
        bright3 = color "#F9E2AF";

        regular4 = color "#89B4FA";
        bright4 = color "#89B4FA";

        regular5 = color "#F5C2E7";
        bright5 = color "#F5C2E7";

        regular6 = color "#94E2D5";
        bright6 = color "#94E2D5";

        regular7 = color "#BAC2DE";
        bright7 = color "#A6ADC8";
      };
    };



  rofi = {
    border = "#ffc909e6";
    bg = "#2e2505e6";
    prompt_bg = "#ffc909e6";
    prompt_text = "#2e2505e6";

    entry_bg = "#2e2505e6";
    entry_text = "#fefcf6e6";
    entry_selected_bg = "#2e2505e6";
    entry_selected_text = "#f38ba8e6";

    button_bg = "#2e2505e6";
    button_text = "#6c7086e6";

    button_selected_bg = "#2e2505e6";
    button_selected_text = "#ffc909e6";

    message_bg = "#2e2505e6";

    textbox_bg = "#2e2505e6";
    textbox_text = "#ffc909e6";
  };
  dunst = {
    frame_color = "#ffc909";

    low = {
      background = "#2e2505";
      foreground = "#fefcf6";
    };
    normal = {
      background = "#2e2505";
      foreground = "#fefcf6";
    };
    critical = {
      background = "#2e2505";
      foreground = "#fefcf6";
      frame_color = "#f38ba8";
    };
  };

  vscode = {
    theme = "Kimbie Dark";
    extensions = { pkgs, ... }: [ ];
  };

  hyprland = let rgb = (c: "rgb(${builtins.substring 1 (builtins.stringLength c - 1) c})"); in
    {
      border_inactive = rgb "#292105";
      border_active = "${rgb "#ffc909"} ${rgb "#5be335"} 45deg";
    };
}
