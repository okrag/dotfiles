{ pkgs, ... }: {
  programs.neovim = {
    enable = true;

    defaultEditor = true;

    viAlias = true;
    vimAlias = true;
    vimdiffAlias = true;

    extraPackages = with pkgs; [
      lua-language-server
      nodePackages.typescript-language-server
      ripgrep
    ];
    plugins = with pkgs.vimPlugins; [
      (nvim-treesitter.withPlugins (p: [
        p.tree-sitter-nix
        p.tree-sitter-vim
        p.tree-sitter-bash
        p.tree-sitter-lua
        p.tree-sitter-c
        p.tree-sitter-rust
        p.tree-sitter-json
        p.tree-sitter-typescript
        p.tree-sitter-javascript
      ]))
      {
        plugin = telescope-nvim;
        type = "lua";
        config = builtins.readFile ./telescope.lua;
      }
      {
        plugin = harpoon;
        type = "lua";
        config = builtins.readFile ./harpoon.lua;
      }
      {
        plugin = tokyonight-nvim;
        type = "lua";
        config = builtins.readFile ./colors.lua;
      }
      {
        plugin = lsp-zero-nvim;
        type = "lua";
        config = builtins.readFile ./lsp.lua;
      }

      nvim-cmp
      cmp-buffer
      cmp-path
      cmp_luasnip
      cmp-nvim-lsp
      cmp-nvim-lua

      luasnip
      friendly-snippets

      nvim-lspconfig
    ];

    extraLuaConfig = ''
      
      ${builtins.readFile ./remap.lua}
      ${builtins.readFile ./set.lua}
      ${builtins.readFile ./treesitter.lua}
    '';
  };
}
