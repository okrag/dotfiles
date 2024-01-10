{ pkgs, pkgs-master, ... }: {
  home.packages = with pkgs; [
    mdcat
    nodePackages.nodemon

    networkmanagerapplet
    jetbrains.idea-community
    jdk17
    brave
    discord
    spotify
    # webcord_patched
    openboard

    wl-clipboard
    playerctl
    gnome.simple-scan

    krita

    freshfetch
    nodePackages.pnpm
    nodejs-slim_20
    bun
    tor-browser-bundle-bin
    baobab
    gnome.gnome-system-monitor

    signal-desktop
    pavucontrol

    qemu
    woeusb-ng

    prismlauncher
    glfw-wayland-minecraft

    steam-run

    # Rust
    pcmanfm
    rustup
    pkg-config
    gcc

    # C/C++ Language Server and tools
    ccls
    gnumake

    # Screenshots
    grim
    slurp

    # Wallpaper
    swww

    # Nix language formatter
    nixpkgs-fmt

    # Libs
    openssl_3
    libnotify
  ];
}
