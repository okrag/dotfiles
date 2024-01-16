{ outputs, pkgs, config, ... }: {
  imports = [
    ./alacritty.nix
    ./vscode.nix
    ./zsh.nix
    ./dunst.nix
    ./packages.nix

    ./hypr/hypr.nix
    ./rofi/rofi.nix
    ./neovim/neovim.nix
    ./waybar/waybar.nix
  ];

  nixpkgs = {
    overlays = [
      outputs.overlays.additions
      outputs.overlays.modifications

    ];
    config = {
      allowUnfree = true;
      allowUnfreePredicate = (_: true);
    };
  };

  xdg.mimeApps.defaultApplications = { };

  gtk = {
    enable = true;
    theme.name = "Adwaita-dark";
    iconTheme.package = pkgs.gnome.adwaita-icon-theme;
    iconTheme.name = "Adwaita-dark";

  };

  qt = {
    enable = true;
    platformTheme = "gtk";
    style.name = "adwaita-dark";
    style.package = pkgs.adwaita-qt;
  };

  dconf.settings = {
    "org/virt-manager/virt-manager/connections" = {
      autoconnect = [ "qemu:///system" ];
      uris = [ "qemu:///system" ];
    };
  };

  home = {
    username = "okrag";
    homeDirectory = "/home/okrag";
  };

  services = {
    gnome-keyring = {
      enable = true;
      components = [ "secrets" ];
    };

    swayidle = let lock = "${./lock.sh} ${pkgs.swayidle}/bin/swayidle ${./wallpapers/mac.jpg}"; in
      {
        enable = true;
        systemdTarget = "hyprland-session.target";
        events = [
          {
            event = "before-sleep";
            command = lock;
          }
        ];
        timeouts = [
          {
            timeout = 300;
            command = lock;
          }
          {
            timeout = 270;
            command = "hyprctl dispatch dpms off";
            resumeCommand = "hyprctl dispatch dpms on";
          }
          {
            timeout = 450;
            command = "systemctl suspend";
          }
        ];
      };

    playerctld.enable = true;
  };


  programs = {
    home-manager.enable = true;
    feh.enable = true;
    bat.enable = true;

    eza = {
      enable = true;
      enableAliases = true;
      icons = true;
    };

    git = {
      enable = true;
      userName = "okrag";
      userEmail = "48834705+okrag@users.noreply.github.com";
      delta.enable = true;
      extraConfig = { init.defaultBranch = "main"; };
    };

    swaylock = {
      enable = true;
      package = pkgs.swaylock-effects;
    };

    direnv = {
      enable = true;
      enableZshIntegration = true;
    };
  };

  # Nicely reload system units when changing configs
  systemd.user.startServices = "sd-switch";

  # https://nixos.wiki/wiki/FAQ/When_do_I_update_stateVersion
  home.stateVersion = "23.05";
}
