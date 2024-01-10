{ outputs, pkgs, config, ... }: with (import ./theme.nix).dunst; {
  services.dunst = {
    enable = true;
    settings = {
      global = {
        monitor = 0;
        follow = "keyboard";
        fram_color = frame_color;
        separator_color = "frame";
        frame_width = 2;
        corner_radius = 10;
        origin = "top-right";
        offset = "10x10";
        transparency = 95;
      };
      urgency_low = {
        background = low.background;
        foreground = low.foreground;
      };

      urgency_normal = {
        background = normal.background;
        foreground = normal.foreground;
      };

      urgency_critical = {
        background = critical.background;
        foreground = critical.foreground;
        frame_color = critical.frame_color;
      };
    };
  };
}
