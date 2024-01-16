{ ... }: {
  programs.alacritty = {
    enable = true;
    settings = {
      font = {
        normal = {
          family = "JetBrainsMono NF";
          style = "Regular";
        };
        size = 10;
      };
      window = {
        opacity = 0.4;
      };
    } // (import ./theme.nix).alacritty;
  };
}
