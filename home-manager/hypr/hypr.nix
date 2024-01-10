{ pkgs, ... }:
let conf = rec {
  wallpaper = ../wallpapers/mac.jpg;
  lock = "${../lock.sh} ${pkgs.swayidle}/bin/swayidle ${wallpaper}";
  terminal = "${pkgs.foot}/bin/foot";
  terminal_class = "foot";
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
