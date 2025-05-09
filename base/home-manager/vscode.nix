{ pkgs, ... }: {
  programs.vscode = {
    enable = true;
    profiles.default.extensions = with pkgs.vscode-extensions; [
      vscode-icons-team.vscode-icons
      jnoortheen.nix-ide
      naumovs.color-highlight
      esbenp.prettier-vscode
      ms-python.python
      svelte.svelte-vscode
    ] ++ pkgs.vscode-utils.extensionsFromVscodeMarketplace [
      {
        name = "intellij-idea-keybindings";
        publisher = "k--kato";
        version = "1.5.9";
        sha256 = "mSFaNMo8sLWZUBl0SAX/v2uoIBhArdxDOo0+XEHlKPY=";
      }
      {
        name = "yuck";
        publisher = "eww-yuck";
        version = "0.0.3";
        sha256 = "DITgLedaO0Ifrttu+ZXkiaVA7Ua5RXc4jXQHPYLqrcM=";
      }
      {
        name = "black-py";
        publisher = "mikoz";
        version = "1.0.3";
        sha256 = "88Il9kfSahmexBYUCMfA0mlLCel+9JSwkssBcuEFrt4=";
      }
      {
        name = "tauri-vscode";
        publisher = "tauri-apps";
        version = "0.2.6";
        sha256 = "O9NxFemUgt9XmhL6BnNArkqbCNtHguSbvVOYwlT0zg4=";
      }
      {
        name = "leptos-language-server";
        publisher = "bram209";
        version = "0.1.0";
        sha256 = "Giqw3tl7+/cGAbJeirSbJFTgAiTELKR9Gq/ZIQub0CE=";
      }
    ] ++ (import ./theme.nix).vscode.extensions pkgs;
    profiles.default.userSettings = {
      "explorer.confirmDragAndDrop" = false;
      "explorer.confirmDelete" = false;
      "editor.fontSize" = 16;
      # "files.autoSave" = "onWindowChange";
      "editor.formatOnSave" = true;
      "editor.formatOnPaste" = true;
      "window.titleBarStyle" = "custom";
      "editor.fontFamily" = "'JetBrainsMono NF', 'Droid Sans Mono', 'monospace', monospace";
      "workbench.colorTheme" = (import ./theme.nix).vscode.theme;
      "workbench.iconTheme" = "vscode-icons";
      "nix.serverPath" = "${pkgs.nixd}/bin/nixd";
      "nix.formatterPath" = "${pkgs.nixpkgs-fmt}/bin/nixpkgs-fmt";
      "git.autofetch" = true;
      "git.confirmSync" = false;
      "editor.wordWrap" = "wordWrapColumn";
      "editor.wordWrapColumn" = 150;
      "editor.defaultFormatter" = "esbenp.prettier-vscode";
      "[nix]" = {
        "editor.defaultFormatter" = "jnoortheen.nix-ide";
      };
      "[rust]" = {
        "editor.defaultFormatter" = "rust-lang.rust-analyzer";
      };
      "[python]" = {
        "editor.defaultFormatter" = "mikoz.black-py";
      };
      "[c]" = {
        "editor.defaultFormatter" = "ccls-project.ccls";
      };
      "[cpp]" = {
        "editor.defaultFormatter" = "ccls-project.ccls";
      };
      "[toml]" = {
        "editor.defaultFormatter" = "tamasfe.even-better-toml";
      };
      "svelte.enable-ts-plugin" = true;
      "editor.tabSize" = 2;
      "prettier.tabWidth" = 2;
      "tabnine.experimentalAutoImports" = true;
    };
  };
}
