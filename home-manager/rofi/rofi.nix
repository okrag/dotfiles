{ config, pkgs, ... }: {
  programs.rofi = {
    enable = true;
    package = pkgs.rofi-wayland;
    #theme = import ./theme.nix { inherit config; };
    theme = "${./spotlight.rasi}";
    font = "JetBrainsMono Nerd Font 12";
    terminal = "${pkgs.foot}/bin/foot";
    plugins = with pkgs; [
      rofi-calc
    ];
    extraConfig = {
      icon-theme = "Oranchelo";
      show-icons = true;
      drun-display-format = "{icon} {name}";
      location = 0;
      disable-history = false;
      hide-scrollbar = true;
      display-drun = "   Apps ";
      display-run = "   Run ";
      display-window = "   Window";
      display-Network = " 󰤨  Network";
      display-calc = "   Calc";
      display-p = " ⏻  Power Menu";
      sidebar-mode = true;
    };
  };
}
