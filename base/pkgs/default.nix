# Custom packages, that can be defined similarly to ones from nixpkgs
# You can build them using 'nix build .#example' or (legacy) 'nix-build -A example'

{ pkgs ? (import ../nixpkgs.nix) { } }: {
  xwaylandvideobridge = pkgs.callPackage ./xwaylandvideobridge.nix { };
  plymouth-mc = pkgs.callPackage ./plymouth-mc.nix { };
  # webcord_patched = pkgs.callPackage ./webcord_patched.nix { };
}
