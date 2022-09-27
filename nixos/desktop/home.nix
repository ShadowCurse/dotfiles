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
    waybar
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
    xivlauncher
    tdesktop

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
    # neovide

    #==========================#
    ## terminal
    #==========================#
    fish
    exa
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

    #==========================#
    ## lsp servers
    #==========================#
    rust-analyzer
    sumneko-lua-language-server
    zls
    rnix-lsp
  ];

  home.file.".config/alacritty/".source = ../../.config/alacritty;
  home.file.".config/dwm/" = { source = ../../.config/dwm; executable = true; };
  home.file.".config/fish/" = {
    source = ../../.config/fish;
    recursive = true;
  };
  home.file.".config/nvim/" = {
    source = ../../.config/nvim;
    recursive = true;
  };
  home.file.".config/tmux/".source = ../../.config/tmux;
  home.file.".config/rofi/".source = ../../.config/rofi;

  programs.direnv.enable = true;
  programs.direnv.nix-direnv.enable = true;

  programs.fish.enable = true;

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
