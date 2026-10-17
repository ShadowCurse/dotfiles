{ config, pkgs, ... }:

{
  home.username = "rp5";
  home.homeDirectory = "/home/rp5";

  nixpkgs.config = {
    allowUnfree = true;
    # allowBroken = true;
  };

  home.packages = with pkgs; [
    foot
    wmenu

    eza
    fd
    bat
    htop
    dust
    delta
    btop
    lazygit
    starship
    fastfetch

    wget
    ripgrep
    strace
    gnumake
    cmake
    unzip
    gd
    killall
    moreutils

    perf
    gdb
    lldb
    clang
    zig
    python3
    mold

    zls
  ];

  # sway itself is installed by `programs.sway.enable` in configuration.nix
  wayland.windowManager.sway = {
    enable = true;
    package = null;
    checkConfig = false;
    config = {
      modifier = "Mod4";
      terminal = "foot";
      menu = "wmenu-run";
    };
  };

  programs = {
    direnv = {
      enable = true;
      enableFishIntegration = true;
      nix-direnv.enable = true;
    };
  };
  # Manual fix for 3.1.2 since it has a bug. Already fixed upstream, wait for 3.1.3
  programs.direnv.nix-direnv.package = pkgs.nix-direnv.overrideAttrs (oldAttrs: {
    postFixup = (oldAttrs.postFixup or "") + ''
      sed -i 's/  watch_file files_to_watch$/  watch_file "''${files_to_watch[@]}"/' \
        $out/share/nix-direnv/direnvrc
    '';
  });

  home.stateVersion = "26.05";
}
