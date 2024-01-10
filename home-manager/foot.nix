{ ... }: {
  programs.foot = {
    enable = true;
    settings = {
      main = {
        font = "JetBrainsMono NF:size=10";
      };
    } // (import ./theme.nix).foot;
  };
}
