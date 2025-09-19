{ config, pkgs, ... }:

let
  dotfiles = "${config.home.homeDirectory}/nixos-dotfiles/config";
  create_symlink = path: config.lib.file.mkOutOfStoreSymlink path;

  # Standard .config/directory
  configs = {
    qtile = "qtile";
    nvim = "nvim";
    rofi = "rofi";
    alacritty = "alacritty";
    eza = "eza";
    # picom = "picom";
  };
in
{
  home.username = "matt";
  home.homeDirectory = "/home/matt";
  # programs.git.enable = true;
  home.stateVersion = "25.05";
  programs.bash = {
    enable = true;
    shellAliases = {
      btw = "echo I use NixOS, btw";
      monitor = "xrandr --output DP-2 --primary --mode 1920x1080 --rate 239.76 --right-of DP-0 --output DP-0 --mode 1920x1080 --rate 165";
      ls = "eza -a --icons";
      sls = "eza";
    };
    initExtra = ''
      	  export PS1="\[\e[38;5;75m\]\u@\h \[\e[38;5;113m\]\w \[\e[38;5;189m\]\$ \[\e[0m\]"
      	'';
  };
  # home.file.".config/qtile".source = ./config/qtile;
  # home.file.".config/nvim".source = ./config/nvim;
  # home.file.".config/alacritty".source = ./config/alacritty;
  xdg.configFile = builtins.mapAttrs
    (name: subpath: {
      source = create_symlink "${dotfiles}/${subpath}";
      recursive = true;
    })
    configs;

  imports = [
    ./modules/neovim.nix
  ];

  programs.git = {
    enable = true;
    userName = "Matt Redd";
    userEmail = "matt.redd.nix@gmail.com";
  };
  home.packages = with pkgs;
    [
      # gcc moved to ./configuration.nix
      rofi
      fastfetch
      eza
      xwallpaper
      cava
      tmux
      cmatrix
      termusic
      mdcat
    ];
}

# * * * FILES MOVED * * *
# ./modules/neovim.nix
# ripgrep
# fd
# fzf
# lua-language-server
# nil
# nixpkgs-fmt
# nodejs
# neovim

