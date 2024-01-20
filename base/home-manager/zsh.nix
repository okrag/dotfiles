{ ... }: {
  programs.zsh =
    let configPath = "~/.system"; in
    {
      enable = true;
      enableAutosuggestions = true;
      shellAliases = {
        cleangarbage = "doas nix-collect-garbage --delete-older-than 5d";
        editsys = "pwd=$(pwd) && cd ${configPath} && $EDITOR . && cd $pwd";
      };
      initExtra = let title_prefix = " "; in
        ''
          DISABLE_AUTO_TITLE="true"

          freshfetch

          function precmd {
            echo -en "\e]2;${title_prefix}''${PWD/#$HOME/~}\a"
          }
          function preexec {
            echo -en "\e]2;${title_prefix}$1\a"
          }

          function homeupdate {
            pwd=$(pwd)
            cd ${configPath}
            mv .git .git.b
            cd patched
            mv .git .git.b
            home-manager switch --flake .#okrag
            mv .git.b .git
            cd ..
            mv .git.b .git
            nix run nixpkgs#betterdiscordctl install
            cd $pwd
          }

          function sysupdate {
            pwd=$(pwd)
            cd ${configPath}
            mv .git .git.b
            cd patched
            mv .git .git.b
            doas nixos-rebuild switch --flake .#okrag
            mv .git.b .git
            cd ..
            mv .git.b .git
            cd $pwd
          }
        '';

      envExtra = ''
        path+="$HOME/.cargo/bin"
      '';
      profileExtra = ''
        Hyprland
      '';
      oh-my-zsh = {
        enable = true;
        plugins = [ "git" ];
        theme = "robbyrussell";
      };
    };
}

