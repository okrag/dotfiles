{ pkgs, ... }:
let conf = rec {
  wallpaper = ../wallpapers/mac.jpg;
  lock = "${../lock.sh} ${pkgs.swayidle}/bin/swayidle ${wallpaper}";
  terminal = "${pkgs.alacritty}/bin/alacritty";
  browser = "${pkgs.floorp}/bin/floorp";
  terminal_class = "alacritty";
  inherit pkgs;
}; in
{
  wayland.windowManager.hyprland = {
    enable = true;
    # enableNvidiaPatches = true;
    xwayland = {
      enable = true;
    };
    extraConfig = import ./keybinds.nix conf;
    settings = import ./config.nix conf;
  };
}
