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
      initExtraFirst = ''
        source ${./p10k.zsh}
      '';
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

          __pre_sys_repo_action_pwd="~"

          function __start_sys_repo_action {
            __pre_sys_repo_action_pwd="$(pwd)"
            cd ${configPath}
            mv .git .git.b
            cd patched
            mv .git .git.b
          }

          function __end_sys_repo_action {
            mv .git.b .git
            cd ..
            mv .git.b .git
            cd $__pre_sys_repo_action_pwd
          }

          function homeupdate {
            __start_sys_repo_action
            
            home-manager switch --flake .\#okrag
            
            nix run nixpkgs\#betterdiscordctl install

            __end_sys_repo_action
          }

          function sysupdate {
            __start_sys_repo_action

            doas nixos-rebuild switch --flake .\#okrag

            __end_sys_repo_action
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
        theme = "fino-time";
      };
      antidote = {
        enable = true;
        plugins = [ "romkatv/powerlevel10k" ];
      };
    };
}

