{ config, pkgs, ... }:
let
  # yuzuPackages = pkgs.callPackage ./yuzu {};
in
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
  # nixpkgs.config.permittedInsecurePackages = [
  #   "electron-25.9.0"
  # ];

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

    #==========================#
    ## Other
    #==========================#
    firefox
    discord
    obsidian
    tdesktop
    # qbittorrent
    # audacity
    vlc
    # bless # hex editor
    # imhex # hex editor
    # piper # mouce config
    lorien
    blender
    # gimp
    keymapp

    aseprite

    # lxappearance
    # neovide
    # easyeffects

    # lact # AMDGPU control usage: sudo lact deamon -> lact

    #==========================#
    ## Guitar
    #==========================#
    lingot # tuner

    #==========================#
    ## Games
    #==========================#
    steam
    # xivlauncher
    # rpcs3
    # pcsx2
    # yuzuPackages.mainline
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
    # rofi
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
    du-dust
    bottom
    tmux
    neovim
    # helix
    starship
    neofetch
    # ranger
    timer

    #==========================#
    ## nix
    #==========================#
    nix-tree

    #==========================#
    ## fonts
    #==========================#
    cascadia-code
    # nerdfonts
    google-fonts
    font-awesome
    noto-fonts
    noto-fonts-cjk-sans
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
    moreutils

    # hyperfine
    # inferno

    # scanmem # gui -> gameconqueror

    #==========================#
    ## camera
    #==========================#
    # droidcam

    #==========================#
    ## dev
    #==========================#
    gdb
    # lldb
    clang
    # clang-tools
    rustup
    zig
    python3
    mold
    # sccache

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
  # home.file.".config/river/".source = ../../.config/river;
  # home.file.".config/waybar/".source = ../../.config/waybar;
  # home.file.".config/tofi/".source = ../../.config/tofi;
  # home.file.".config/helix/".source = ../../.config/helix;
  # home.file.".config/alacritty/".source = ../../.config/alacritty;
  # home.file.".config/fish/" = {
  #   source = ../../.config/fish;
  #   recursive = true;
  # };
  # home.file.".config/nushell/" = {
  #   source = ../../.config/nushell;
  #   recursive = true;
  # };
  # home.file.".config/nvim/" = {
  #   source = ../../.config/nvim;
  #   recursive = true;
  # };
  # home.file.".config/tmux/".source = ../../.config/tmux;
  # home.file.".config/rofi/".source = ../../.config/rofi;

  # home.file.".cargo/config.toml".text = ''
  #   [target.x86_64-unknown-linux-gnu]
  #   linker = "clang"
  #   rustflags = ["-C", "link-arg=-fuse-ld=${pkgs.mold}/bin/mold", "-C", "target-cpu=native"]
  #
  #   [build]
  #   rustc-wrapper = "${pkgs.sccache}/bin/sccache"
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

  # programs.emacs = {
  #   enable = true;
  #   package = pkgs.emacsNativeComp;
  # };

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

  home.stateVersion = "25.05";

  programs.home-manager.enable = true;
}
