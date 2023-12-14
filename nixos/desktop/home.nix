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

  # needed for obsidian
  nixpkgs.config.permittedInsecurePackages = [
    "electron-25.9.0"
  ];

  home.packages = with pkgs; [
  # perl
  # libtool
  # libvterm
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

    #==========================#
    ## Other
    #==========================#
    firefox
    discord
    obsidian
    # tdesktop
    qbittorrent
    audacity
    vlc
    # bless # hex editor
    # piper # mouce config
    mypaint
    blender
    gimp

    # USES PYTHON 2.7
    # aseprite-unfree

    # lxappearance
    # neovide
    # easyeffects

    #==========================#
    ## Guitar
    #==========================#
    lingot # tuner

    #==========================#
    ## Games
    #==========================#
    steam
    # xivlauncher
    rpcs3
    yuzu-early-access 
    ## game engine
    godot_4

    # lutris
    # wine

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
    wl-clipboard
    
    #==========================#
    ## Screenshot 
    #==========================#
    grim ## screenshot with grim -g "$(slurp)"
    slurp
    #flameshot # currently does not work on wayland

    #==========================#
    ## terminal
    #==========================#
    # fish
    # nushell
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
    timer

    #==========================#
    ## nix
    #==========================#
    nix-tree

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
    # droidcam

    #==========================#
    ## dev
    #==========================#
    gdb
    gcc
    rustup
    zig
    python3
    mold

    #==========================#
    ## lsp servers
    #==========================#
    # rust-analyzer
    sumneko-lua-language-server
    zls
    # rnix-lsp
    # python311Packages.python-lsp-server
  ];

  # home.file.".config/dwm/" = { source = ../../.config/dwm; executable = true; };
  # home.file.".config/hypr/".source = ../../.config/hypr;
  home.file.".config/river/".source = ../../.config/river;
  home.file.".config/waybar/".source = ../../.config/waybar;
  home.file.".config/tofi/".source = ../../.config/tofi;
  home.file.".config/helix/".source = ../../.config/helix;

  home.file.".config/alacritty/".source = ../../.config/alacritty;
  home.file.".config/fish/" = {
    source = ../../.config/fish;
    recursive = true;
  };
  # home.file.".config/nushell/" = {
  #   source = ../../.config/nushell;
  #   recursive = true;
  # };
  # home.file.".config/nvim/" = {
  #   source = ../../.config/nvim;
  #   recursive = true;
  # };
  # home.file.".config/tmux/".source = ../../.config/tmux;
  home.file.".config/rofi/".source = ../../.config/rofi;

  # home.file.".cargo/config.toml".text = ''
  #   [target.x86_64-unknown-linux-gnu]
  #   linker = "clang"
  #   rustflags = ["-C", "link-arg=-fuse-ld=${pkgs.mold}/bin/mold"]
  # '';

  programs.direnv.enable = true;
  programs.direnv.nix-direnv.enable = true;

  # programs.fish.enable = true;
  # programs.nushell.enable = true;

  programs.obs-studio = {
    enable = true;
    plugins = with pkgs.obs-studio-plugins; [
      wlrobs
    ];
  };

  programs.emacs = {
    enable = true;
    package = pkgs.emacsNativeComp;
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

  home.stateVersion = "22.05";

  programs.home-manager.enable = true;
}
