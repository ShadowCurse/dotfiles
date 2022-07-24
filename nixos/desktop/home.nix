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
    # lxappearance

    #==========================#
    ## terminal
    #==========================#
    fish
    exa
    bat
    htop
    tmux
    neovim
    neovide
    starship
    neofetch
    ranger
    flameshot

    #==========================#
    ## fonts
    #==========================#
    cascadia-code
    nerdfonts
    google-fonts
    font-awesome
    noto-fonts
    noto-fonts-cjk
    noto-fonts-extra
    noto-fonts-emoji

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
    ntfs3g
    fuse
    killall

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
      name = "Matcha-dark-azul";
      package = pkgs.matcha-gtk-theme;
    };
    iconTheme = {
      name = "Papirus-Dark";
      package = pkgs.papirus-icon-theme;
    };
  };

  # home.pointerCursor = {
  #   name = "Vimix-cursors";
  #   package = pkgs.nordzy-cursor-theme;
  #   size = 40;
  #   gtk.enable = true;
  #   x11.enable = true;
  # };

  home.stateVersion = "22.05";

  programs.home-manager.enable = true;
}
