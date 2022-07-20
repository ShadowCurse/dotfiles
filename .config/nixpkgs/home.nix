{ config, pkgs, ... }:

{
  # Home Manager needs a bit of information about you and the
  # paths it should manage.
  home.username = "antaraz";
  home.homeDirectory = "/home/antaraz";

  home.packages = with pkgs; [
    ## gui
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

    ## maybe 
    # bless # hex editor
    # piper # mouce config
    # emacs
    # telegram
    # mypaint
    # blender
    # gimp
    # aseprite

    ## terminal
    htop
    tmux
    neovim
    fish
    starship
    exa
    bat
    neofetch
    flameshot
    
    ## utils
    powerline-fonts
    ripgrep
    strace
    gnumake
    cmake
    unzip
    gdb

    ## camera
    droidcam
    
    ## langs
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
  home.file.".config/nvim/".source = ../nvim;
  home.file.".config/tmux/".source = ../tmux;
  home.file.".config/rofi/".source = ../rofi;

  home.keyboard.layout = "us";

  # This value determines the Home Manager release that your
  # configuration is compatible with. This helps avoid breakage
  # when a new Home Manager release introduces backwards
  # incompatible changes.
  #
  # You can update Home Manager without changing this value. See
  # the Home Manager release notes for a list of state version
  # changes in each release.
  home.stateVersion = "22.05";

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;
}
