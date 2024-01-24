{
  description = "NixOS";

  inputs = {
    # Nixpkgs
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";

    # Home manager
    home-manager.url = "github:nix-community/home-manager/master";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";

    hyprland.url = "github:hyprwm/Hyprland";
    hyprland.inputs.nixpkgs.follows = "nixpkgs";
  };

  outputs = { self, nixpkgs, home-manager, hyprland, ... }@inputs:
    let
      inherit (self) outputs;
      system = "x86_64-linux";
      pkgs = nixpkgs.legacyPackages.${system};
    in
    rec {
      packages = import ./pkgs { inherit pkgs; };
      devShells.${system} = import ./shell.nix { inherit pkgs; };
      overlays = import ./overlays { inherit inputs; };

      nixosConfigurations = {
        okrag = nixpkgs.lib.nixosSystem {
          specialArgs = { inherit inputs outputs; };
          modules = [
            ./nixos/configuration.nix
          ];
        };
      };

      homeConfigurations = {
        okrag = home-manager.lib.homeManagerConfiguration {
          inherit pkgs;
          extraSpecialArgs = { inherit inputs outputs hyprland; };
          modules = [
            ./home-manager/home.nix
          ];
        };
      };
    };
}
