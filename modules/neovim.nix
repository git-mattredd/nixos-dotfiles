{ config, pkgs, lib, ... }:

{
  # Install Neovim and dependencies
  home.packages = with pkgs; [
    # Tools required for Telescope
    ripgrep
    fd
    fzf

    # Language Servers
    lua-language-server
    nil # nix language server
    nixpkgs-fmt # nix formatter

    # Needed for lazy.nvim
    nodejs
  ];

  programs.neovim = {
    enable = true;
    viAlias = true;
    vimAlias = true;

    # optional: If you want to manage your plugins with nix, instead of with lazy.nvim,
    # you can do it with the plugins key.
    # plugins = with pkgs.vimPlugins; [
    #     telescope-nvim
    #     nvim-treesitter
    #     nvim-lspconfig
    #     # Any other packages you want pinned at.
    # ];
  };

}
