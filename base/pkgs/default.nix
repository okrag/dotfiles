# Custom packages, that can be defined similarly to ones from nixpkgs
# You can build them using 'nix build .#example' or (legacy) 'nix-build -A example'

{ pkgs ? (import ../nixpkgs.nix) { }, hyprland }: {
  plymouth-mc = pkgs.callPackage ./plymouth-mc.nix { };
  hyprland = hyprland.packages.${pkgs.system}.hyprland;
  xdg-desktop-portal-hyprland = hyprland.packages.${pkgs.system}.xdg-desktop-portal-hyprland;
  # hyprpolkitagent = hyprland.packages.${pkgs.system}.hyprpolkitagent;
}
