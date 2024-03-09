{ config, pkgs, ... }:

{
  home.username = "antaraz";
  home.homeDirectory = "/home/antaraz";

  nixpkgs.config = {
    allowUnfree = true;
    # allowBroken = true;
  };

  home.packages = with pkgs; [
    #==========================#
    ## terminal
    #==========================#
    fish
    eza
    fd
    bat
    htop
    bottom
    tmux
    neovim
    helix
    starship
    neofetch
    ranger

    #==========================#
    ## utils
    #==========================#
    wget
    git
    ripgrep
    strace
    gnumake
    cmake
    unzip
    gd
    killall

    #==========================#
    ## langs
    #==========================#
    gcc
    rustup
    zig
    python3

    #==========================#
    ## lsp servers
    #==========================#
    rust-analyzer
    sumneko-lua-language-server
    zls
    rnix-lsp
  ];

  home.file.".config/helix/".source = ../../.config/helix;
  home.file.".config/fish/" = {
    source = ../../.config/fish;
    recursive = true;
  };
  home.file.".config/nvim/" = {
    source = ../../.config/nvim;
    recursive = true;
  };
  home.file.".config/tmux/".source = ../../.config/tmux;

  programs.direnv.enable = true;
  programs.direnv.nix-direnv.enable = true;
  programs.fish.enable = true;
  programs.home-manager.enable = true;

  home.keyboard.layout = "us";

  home.stateVersion = "22.05";
}
