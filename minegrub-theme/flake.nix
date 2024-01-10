{
  description = "flake support minegrub theme nixos module";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
  };

  outputs = { self, nixpkgs }:
    let
      inherit (nixpkgs.lib) genAttrs optional;
      eachSystem = f: genAttrs
        [
          "aarch64-darwin"
          "aarch64-linux"
          "x86_64-darwin"
          "x86_64-linux"
        ]
        (system: f nixpkgs.legacyPackages.${system});

      minegrub =
        { pkgs, background ? "1.8", splashes ? "", customSplashes ? splashes != "", ... }:
        pkgs.stdenv.mkDerivation {
          name = "minegrub-theme";
          src = "${self}";

          buildInputs = with pkgs; [
            (python3.withPackages
              (p: [ p.pillow ]))
            # neofetch
          ];

          buildPhase = ''
            echo "${builtins.concatStringsSep "\n" splashes}" > minegrub/assets/splashes.txt
            python minegrub/update_theme.py
                   
            rm minegrub/background.png
            cp backgrounds/${background}\ -\ *.png minegrub/background.png
          '';


          installPhase = ''
            mkdir -p $out/grub/themes/minegrub
            mkdir -p $out/grub/themes/minegrub/assets

            cp minegrub/*.png $out/grub/themes/minegrub
            cp minegrub/*.pf2 $out/grub/themes/minegrub
            cp minegrub/theme.txt $out/grub/themes/minegrub
            cp minegrub/update_theme.py $out/grub/themes/minegrub

            cp minegrub/assets/splashes.txt $out/grub/themes/minegrub/assets
            cp minegrub/assets/MinecraftRegular-Bmg3.otf $out/grub/themes/minegrub/assets
            cp minegrub/assets/logo_clear.png $out/grub/themes/minegrub/assets
          '';
        };
    in
    {
      nixosModules.default = { config, pkgs, ... }:
        let
          cfg = config.boot.loader.grub.minegrub-theme;
          inherit (nixpkgs.lib) mkOption types mkIf;
        in
        {
          options = {
            boot.loader.grub.minegrub-theme = {
              splashes = mkOption {
                default = null;
                example = [ "Infinite recursion" ];
                type = types.listOf types.str;
                description = ''
                  Splash text on logo.
                '';
              };
              background = mkOption {
                default = "1.8";
                example = "1.18";
                type = types.enum [
                  "1.8"
                  "1.13"
                  "1.14"
                  "1.15"
                  "1.16"
                  "1.17"
                  "1.18"
                ];
                description = ''
                  "1.8"  - Classic Minecraft
                  "1.13" - Aquatic update
                  "1.14" - Village and Pillage
                  "1.15" - Buzzy Bees
                  "1.16" - Nether Update
                  "1.17" - Caves And Cliffs
                  "1.18" - Caves And Cliffs 2
                '';
              };
              enable = mkOption {
                default = false;
                example = true;
                type = types.bool;
                description = ''
                  Enable minegrub theme.
                '';
              };
            };
          };
          config = mkIf cfg.enable {
            boot.loader.grub =
              let
                minegrub-theme = minegrub {
                  inherit pkgs;
                  splashes = cfg.splashes;
                  background = cfg.background;
                };
              in
              {
                theme = "${minegrub-theme}/grub/themes/minegrub";
                splashImage = "${minegrub-theme}/grub/themes/minegrub/background.png";
              };

            systemd.services.minegrub-theme-update = {
              description = "minegrub theme splash update service";
              script = "${pkgs.python3.withPackages (p: [p.pillow])}/bin/python /boot/theme/update_theme.py";
              wantedBy = [ "multi-user.target" ];
            };
          };
        };

      packages = eachSystem
        (pkgs: {
          default = minegrub {
            inherit pkgs;
            # splash = "custom splash text";
          };
        });
    };
}
