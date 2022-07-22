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

  home.file.".config/alacritty/".source = ../alacritty;
  home.file.".config/dwm/".source = ../dwm;
  home.file.".config/fish/" = {
    source = ../fish;
    recursive = true;
  };
  home.file.".config/nvim/" = {
    source = ../nvim;
    recursive = true;
  };
  home.file.".config/tmux/".source = ../tmux;
  home.file.".config/rofi/".source = ../rofi;

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
