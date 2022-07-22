{ config, pkgs, ... }:

{
  # Home Manager needs a bit of information about you and the
  # paths it should manage.
  home.username = "antaraz";
  home.homeDirectory = "/home/antaraz";

  home.packages = with pkgs; [
    #==========================#
    ## gui
    #==========================#
    alacritty
    rofi
    nitrogen
    dmenu
    feh
    pavucontrol
    mupdf
    xfce.thunar-bare
    xfce.thunar-volman
    brave
    firefox
    discord
    steam

    #==========================#
    ## maybe 
    #==========================#
    # bless # hex editor
    # piper # mouce config
    # emacs
    # telegram
    # mypaint
    # blender
    # gimp
    # aseprite

    #==========================#
    ## terminal
    #==========================#
    fish
    exa
    bat
    htop
    tmux
    neovim
    starship
    neofetch
    ranger
    flameshot

    #==========================#
    ## utils
    #==========================#
    powerline-fonts
    noto-fonts
    noto-fonts-extra
    noto-fonts-emoji
    ripgrep
    strace
    gnumake
    cmake
    unzip
    gdb

    #==========================#
    ## camera
    #==========================#
    droidcam

    #==========================#
    ## langs
    #==========================#
    gcc
    rustup
    zig
    python3
  ];

  home.file.".config/alacritty/".source = ../../../.config/alacritty;
  home.file.".config/dwm/".source = ../../../.config/dwm;
  home.file.".config/fish/" = {
    source = ../../../.config/fish;
    recursive = true;
  };
  home.file.".config/nvim/" = {
    source = ../../../.config/nvim;
    recursive = true;
  };
  home.file.".config/tmux/".source = ../../../.config/tmux;
  home.file.".config/rofi/".source = ../../../.config/rofi;

  home.keyboard.layout = "us";

  gtk = {
    enable = true;
    theme = {
      name = "Materia-dark";
      package = pkgs.materia-theme;
    };
  };

  home.stateVersion = "22.05";

  programs.home-manager.enable = true;
}
