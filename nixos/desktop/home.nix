{ config, pkgs, ... }:

{
  home.username = "antaraz";
  home.homeDirectory = "/home/antaraz";

  nixpkgs.config = {
    allowUnfree = true;
    # allowBroken = true;
  };

  nixpkgs.overlays = [
    (self: super: {
      waybar = super.waybar.overrideAttrs (oldAttrs: {
        mesonFlags = oldAttrs.mesonFlags ++ [ "-Dexperimental=true" ];
      });
    })
  ];

  home.packages = with pkgs; [
    #==========================#
    ## gui
    #==========================#
    alacritty
    feh
    pavucontrol
    mupdf
    xfce.xfconf
    xfce.thunar-bare
    xfce.thunar-volman
    brave
    ## additional
    firefox
    discord
    obsidian
    tdesktop
    flameshot # currently does not work on wayland
    qbittorrent
    audacity
    ## gaming
    steam
    # xivlauncher
    rpcs3

    #==========================#
    ## X11
    #==========================#
    # rofi
    # dmenu
    # nitrogen

    #==========================#
    ## Wayland
    #==========================#
    tofi
    waybar
    hyprpaper
    wlr-randr
    
    grim ## screenshot with grim -g "$(slurp)"
    slurp

    #==========================#
    ## maybe 
    #==========================#
    # bless # hex editor
    # piper # mouce config
    # emacs
    mypaint
    # obs-studio
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

  home.file.".config/dwm/" = { source = ../../.config/dwm; executable = true; };
  home.file.".config/hypr/".source = ../../.config/hypr;
  home.file.".config/river/".source = ../../.config/river;
  home.file.".config/waybar/".source = ../../.config/waybar;
  home.file.".config/tofi/".source = ../../.config/tofi;
  home.file.".config/helix/".source = ../../.config/helix;

  home.file.".config/alacritty/".source = ../../.config/alacritty;
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

  programs.obs-studio = {
    enable = true;
    plugins = with pkgs.obs-studio-plugins; [
      wlrobs
    ];
  };

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
