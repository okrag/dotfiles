{ ... }: {
  programs.zsh = {
    enable = true;
    enableAutosuggestions = true;
    shellAliases = let configPath = "~/.system"; in
      {
        sysupdate = "doas nixos-rebuild switch --flake ${configPath}#okrag";
        homeupdate = "home-manager switch --flake ${configPath}#okrag";
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


      '';

    envExtra = ''
      path+="$HOME/.cargo/bin"
    '';
    oh-my-zsh = {
      enable = true;
      plugins = [ "git" "sudo" ];
      theme = "robbyrussell";
    };
  };
}

