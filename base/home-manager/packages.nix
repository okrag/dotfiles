{ pkgs, ... }: {
  home.packages = with pkgs; [
    # Other
    freshfetch
    mdcat
    qemu
    woeusb-ng
    file

    # Apps
    networkmanagerapplet
    brave
    discord
    spotify
    openboard
    simple-scan
    tor-browser-bundle-bin
    baobab
    # gnome-system-monitor
    krita
    signal-desktop
    pavucontrol
    transmission_4

    # Java
    jetbrains.idea-community
    jdk17

    # JS
    bun
    nodePackages.pnpm
    nodejs-slim_20
    nodePackages.nodemon

    # Gaming
    prismlauncher
    glfw-wayland-minecraft
    steam-run

    # Rust
    pcmanfm
    rustup
    pkg-config

    # C/C++ Language Server and tools
    ccls
    gnumake
    gcc

    # Screenshots
    grim
    slurp
    swappy

    hyprpicker
    hyprsome
    hyprpolkitagent


    # Libs
    openssl_3
    libnotify
    wl-clipboard
    swww
    playerctl
    xwayland
    bottles
  ];
}
