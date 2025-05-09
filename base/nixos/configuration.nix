# This is your system's configuration file.
# Use this to configure your system environment (it replaces /etc/nixos/configuration.nix)

{ inputs, outputs, lib, config, pkgs, ... }: {
  # You can import other NixOS modules here
  imports = [
    ./hardware-configuration.nix
  ];

  nixpkgs = {
    # You can add overlays here
    overlays = [
      # Add overlays your own flake exports (from overlays and pkgs dir):
      outputs.overlays.additions
      outputs.overlays.modifications

      # You can also add overlays exported from other flakes:
      # neovim-nightly-overlay.overlays.default

      # Or define it inline, for example:
      # (final: prev: {
      #   hi = final.hello.overrideAttrs (oldAttrs: {
      #     patches = [ ./change-hello-to-hi.patch ];
      #   });
      # })
    ];
    # Configure your nixpkgs instance
    config = {
      # Disable if you don't want unfree packages
      allowUnfree = true;
    };
  };

  nix = {
    # This will add each flake input as a registry
    # To make nix3 commands consistent with your flake
    registry = lib.mapAttrs (_: value: { flake = value; }) inputs;

    # This will additionally add your inputs to the system's legacy channels
    # Making legacy nix commands consistent as well, awesome!
    nixPath = lib.mapAttrsToList (key: value: "${key}=${value.to.path}") config.nix.registry;

    settings = {
      # Enable flakes and new 'nix' command
      experimental-features = "nix-command flakes";
      # Deduplicate and optimize nix store
      auto-optimise-store = true;
    };
  };

  boot.supportedFilesystems = [ "ntfs" ];

  boot.loader = {
    grub = {
      enable = true;
      efiSupport = true;
      device = "nodev";
      configurationLimit = 10;
      useOSProber = true;

      gfxmodeEfi = "1920x1080,1280x1024,auto";

      extraEntries = ''
        menuentry 'UEFI Firmware' $menuentry_id_option 'uefi-firmware' {
          fwsetup
        }
      '';


      # minegrub-theme = {
      #   enable = true;
      #   background = "1.18";
      #   splashes = [
      #     "100% Flakes!"
      #     "I use NixOS BTW!"
      #     "Now with 100% more Linux!"
      #     "GNU's not UNIX!"
      #     "Praise Tux!"
      #     "Wine is not an Emulator!"
      #     "I am Root!"
      #     "Still stuck in Vim!"
      #     "Won't sell your data!"
      #     "Now with Rust!"
      #     "Full of Distros!"
      #     "Do redistribute!"
      #     "May contain penguins!"
      #     "Support FOSS devs!"
      #     "Bailing out!"
      #     "Everything is a file!"
      #     "May contain systemd..."
      #     "Open source!"
      #     "Made in Finland!"
      #     "It's not a bug, it's a feature!"
      #     "It's GNU/Linux!"
      #     "sudo rm -rf!"
      #     "Yes, do as I say!"
      #     "90% bug free!"
      #     "Not water proof!"
      #     "Used by billions!"
      #     "12345 is a bad password!"
      #     "Turing complete!"
      #     "Woah."
      #     "I have a suggestion."
      #     "pls fix"
      #     "beep beep"
      #     "Boop!"
      #     "Splash!"
      #     "[Insert splash text here]"
      #     "Made by \"real\" people!"
      #     "Viruses have no power here!"
      #     "No place like ~"
      #     "Used in space!"
      #     "No reboots required!"
      #     "Case sensitive!"
      #     ".exe won't work here!"
      #     "No ads!"
      #     "May contain spaghetti..."
      #     "No registry needed!"
      #     "Forward slashes only!"
      #     "No DLLs needed!"
      #     "127.0.0.1 > localhost :)"
      #     "No caffeine!"
      #     "Zero calories!"
      #     "Do not eat!"
      #   ];
      # };
    };
    efi.canTouchEfiVariables = true;
  };

  boot.plymouth = {
    enable = true;

    themePackages = with pkgs; [ plymouth-mc ];

    theme = "minecraft";
  };

  boot.initrd.systemd.enable = true;

  boot.initrd.secrets = {
    "/crypto_keyfile.bin" = null;
  };

  documentation.doc.enable = false;

  networking.hostName = "okrag";
  # networking.wireless.enable = true;  # Enables wireless support via wpa_supplicant.

  # Configure network proxy if necessary
  # networking.proxy.default = "http://user:password@proxy:port/";
  # networking.proxy.noProxy = "127.0.0.1,localhost,internal.domain";

  # Enable networking
  networking.networkmanager.enable = true;

  # Set your time zone.
  time.timeZone = "Europe/Warsaw";

  # Windows compatibility
  time.hardwareClockInLocalTime = true;

  # Select internationalisation properties.
  i18n.defaultLocale = "es_ES.UTF-8";

  i18n.extraLocaleSettings = {
    LANGUAGE = "es_ES.UTF-8";
    LC_ALL = "es_ES.UTF-8";
    LC_ADDRESS = "es_ES.UTF-8";
    LC_IDENTIFICATION = "es_ES.UTF-8";
    LC_MEASUREMENT = "es_ES.UTF-8";
    LC_MONETARY = "es_ES.UTF-8";
    LC_NAME = "es_ES.UTF-8";
    LC_NUMERIC = "es_ES.UTF-8";
    LC_PAPER = "es_ES.UTF-8";
    LC_TELEPHONE = "es_ES.UTF-8";
    LC_TIME = "es_ES.UTF-8";
  };

  console.keyMap = "pl2";

  users.users.okrag = {
    isNormalUser = true;
    description = "okrag";
    extraGroups = [ "networkmanager" "wheel" "scanner" "lp" "libvirtd" ];
    packages = with pkgs; [ ];
    shell = pkgs.zsh;
  };

  services.getty.autologinUser = "okrag";

  environment.systemPackages = with pkgs; [
    home-manager
    git
    usb-modeswitch
    opentabletdriver
  ];
  environment.defaultPackages = [ ];

  fonts.packages = with pkgs; [
    noto-fonts
    noto-fonts-cjk-sans
    noto-fonts-emoji
    nerd-fonts.symbols-only
    jetbrains-mono
  ];

  security.sudo.enable = false;
  security.doas = {
    enable = true;
    extraRules = [
      {
        persist = true;
        groups = [ "wheel" ];
      }
    ];
  };

  # security.polkit.enable = true;
  # security.polkit.package = pkgs.hyprpolkitagent;
  security.pam.services.swaylock = { };

  xdg.portal.enable = true;
  xdg.portal.configPackages = [ pkgs.xdg-desktop-portal-hyprland ];
  xdg.portal.extraPortals = [ pkgs.xdg-desktop-portal-hyprland ];

  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
    jack.enable = true;
    wireplumber.enable = true;
  };
  services.printing.enable = true;
  services.printing.drivers = [ pkgs.brlaser ];
  services.avahi.enable = true;
  services.avahi.nssmdns4 = true;
  # for a WiFi printer
  services.avahi.openFirewall = true;

  programs.zsh.enable = true;
  programs.dconf.enable = true;

  environment.sessionVariables = {
    WLR_NO_HARDWARE_CURSORS = "1";
    NIXOS_OZONE_WL = "1";
    DOTNET_ROOT = "${pkgs.dotnet-sdk_8}";
  };

  hardware.graphics = {
    enable = true;
    enable32Bit = true;
  };
  services.xserver.videoDrivers = [ "nvidia" ];
  hardware.nvidia = {
    modesetting.enable = true;

    powerManagement.enable = true;

    open = false;

    nvidiaSettings = true;
  };
  hardware.sane = {
    enable = true;
    brscan5 = {
      enable = true;
      netDevices = {
        main = {
          ip = "192.168.1.109";
          model = "DCP-L2520DW";
        };
      };
    };
  };


  hardware.bluetooth.enable = true;
  services.blueman.enable = true;

  # services.logmein-hamachi.enable = true;
  services.tailscale.enable = true;

  programs.virt-manager.enable = true;
  virtualisation.libvirtd = {
    enable = true;
  };
  # Some programs need SUID wrappers, can be configured further or are
  # started in user sessions.
  # programs.mtr.enable = true;
  # programs.gnupg.agent = {
  #   enable = true;
  #   enableSSHSupport = true;
  # };

  # List services that you want to enable:

  # Enable the OpenSSH daemon.
  # services.openssh.enable = true;

  # Open ports in the firewall.
  # networking.firewall.allowedTCPPorts = [ ... ];
  # networking.firewall.allowedUDPPorts = [ ... ];
  # Or disable the firewall altogether.
  networking.firewall.enable = false;

  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "23.05"; # Did you read the comment?
}
