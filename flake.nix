{
  description = "NixOS";

  inputs = {
    # Nixpkgs
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    nixpkgs-master.url = "github:nixos/nixpkgs/master";

    # Home manager
    home-manager.url = "github:nix-community/home-manager/master";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";

    minegrub-theme.url = "./minegrub-theme";
    minegrub-theme.inputs.nixpkgs.follows = "nixpkgs";
  };

  outputs = { self, nixpkgs, home-manager, minegrub-theme, nixpkgs-master, ... }@inputs:
    let
      inherit (self) outputs;
      system = "x86_64-linux";
      pkgs = nixpkgs.legacyPackages.${system};
      pkgs-master = nixpkgs-master.legacyPackages.${system};
    in
    rec {
      packages = import ./pkgs { inherit pkgs; };
      devShells.${system} = import ./shell.nix { inherit pkgs; };
      overlays = import ./overlays { inherit inputs; };

      nixosConfigurations = {
        okrag = nixpkgs.lib.nixosSystem {
          specialArgs = { inherit inputs outputs pkgs-master; };
          modules = [
            ./nixos/configuration.nix
            minegrub-theme.nixosModules.default
          ];
        };
      };

      homeConfigurations = {
        okrag = home-manager.lib.homeManagerConfiguration {
          inherit pkgs;
          extraSpecialArgs = { inherit inputs outputs pkgs-master; };
          modules = [
            ./home-manager/home.nix
          ];
        };
      };
    };
}
