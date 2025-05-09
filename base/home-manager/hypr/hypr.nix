{ pkgs, hyprland, ... }:
let
  conf = rec {
    wallpaper = ../wallpapers/mac.jpg;
    lock = "${../lock.sh} ${pkgs.swayidle}/bin/swayidle ${wallpaper}";
    terminal = "${pkgs.alacritty}/bin/alacritty";
    browser = "${pkgs.brave}/bin/brave";
    terminal_class = "alacritty";
    inherit pkgs;
  };
in
{
  wayland.windowManager.hyprland = {
    enable = true;
    xwayland = {
      enable = true;
    };
    extraConfig = import ./keybinds.nix conf;
    settings = import ./config.nix conf;
    package = pkgs.hyprland;
    # portalPacksage = hyprland.packages.${pkgs.system}.xdg-desktop-portal-hyprland;
  };
}
