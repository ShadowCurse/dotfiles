{ config, pkgs, ... }:

{
  imports =
    [
      ./hardware-configuration.nix
    ];

  #==========================#
  ## GRUB 2
  #==========================#
  boot =
    {
      cleanTmpDir = true;
      loader = {
        grub = {
          enable = true;
          version = 2;
          efiSupport = true;
          device = "nodev";
          useOSProber = true;
        };
        efi = {
          canTouchEfiVariables = true;
          efiSysMountPoint = "/boot/efi";
        };
      };
    };

  #==========================#
  ## Kernel
  #==========================#
  boot = {
    kernelPackages = pkgs.linuxPackages_latest;
    kernelModules = [ "v4l2loopback" ];
    extraModulePackages = [
      config.boot.kernelPackages.v4l2loopback.out
    ];
  };

  #==========================#
  ## Network
  #==========================#
  networking = {
    hostName = "archer";
    networkmanager.enable = true;
  };
  # networking.wireless.enable = true;

  # Configure network proxy if necessary
  # networking.proxy.default = "http://user:password@proxy:port/";
  # networking.proxy.noProxy = "127.0.0.1,localhost,internal.domain";

  # Open ports in the firewall.
  # networking.firewall.allowedTCPPorts = [ ... ];
  # networking.firewall.allowedUDPPorts = [ ... ];
  # Or disable the firewall altogether.
  # networking.firewall.enable = false;

  #==========================#
  # Set your time zone and locale
  #==========================#
  time.timeZone = "Europe/Moscow";
  i18n.defaultLocale = "en_US.UTF-8";
  # console = {
  #   font = "Lat2-Terminus16";
  #   keyMap = "us";
  # };

  #==========================#
  ## GPU
  #==========================#
  # OpenGl
  services.xserver.videoDrivers = [ "nvidia" ];
  hardware.opengl = {
    enable = true;
    driSupport32Bit = true;
  };

  #==========================#
  ## Sound
  #==========================#
  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
  };

  #==========================#
  ## Nix settings, auto cleanup and enable flakes
  #==========================#
  nix = {
    settings.auto-optimise-store = true;
    settings.allowed-users = [ "antaraz" ];
    gc = {
      automatic = true;
      dates = "weekly";
      options = "--delete-older-than 7d";
    };
    extraOptions = ''
      experimental-features = nix-command flakes
      keep-outputs = true
      keep-derivations = true
    '';
  };

  #==========================#
  ## System packages 
  #==========================#
  environment.systemPackages = with pkgs; [
    home-manager
    vim
  ];

  #==========================#
  ## Fonts
  #==========================#
  # fonts = {
  #   fonts = with pkgs; [
  #     cascadia-code
  #     hack-font
  #     google-fonts
  #     font-awesome
  #     noto-fonts
  #     noto-fonts-cjk
  #     noto-fonts-extra
  #     noto-fonts-emoji
  #     jetbrains-mono
  #     roboto
  #     (nerdfonts.override { fonts = [ "JetBrainsMono" ]; })
  #   ];
  #   fontconfig.hinting.autohint = true;
  # };

  #==========================#
  ## Additional services
  #==========================#
  services.openssh.enable = true;
  services.gvfs.enable = true;

  #==========================#
  ## User
  #==========================#
  users.users.antaraz = {
    isNormalUser = true;
    extraGroups = [ "wheel" "networkmanager" "adbusers" ];
  };

  #==========================#
  ## Unfree
  #==========================#
  nixpkgs.config.allowUnfree = true;

  #==========================#
  ## X11
  #==========================#
  services.xserver.enable = true;
  services.xserver.displayManager.lightdm.enable = true;
  services.xserver.windowManager.dwm.enable = true;

  services.xserver.layout = "us";
  # services.xserver.xkbOptions = "eurosign:e";

  #==========================#
  ## Custom dwm
  #==========================#
  nixpkgs.overlays = [
    (self: super: {
      dwm = super.dwm.overrideAttrs
        (old: {
          src = builtins.fetchGit
            {
              url = "https://github.com/ShadowCurse/dwm";
              ref = "master";
              rev = "62ba16ba760ab9fafad84718d9f262bd6c7e2d4d";
            };
        });
    })
  ];

  #==========================#
  ## For gtk themes
  #==========================#
  programs.dconf.enable = true;

  #==========================#
  ## Android
  #==========================#
  programs.adb.enable = true;

  #==========================#
  ## Shell
  #==========================#
  programs.fish.enable = true;
  users.users.antaraz.shell = pkgs.fish;

  #==========================#
  ## nix-ld
  #==========================#
  programs.nix-ld.enable = true;

  #==========================#
  ## Printers
  #==========================#
  # services.printing.enable = true;

  #==========================#
  ## Initial system version
  #==========================#
  system.stateVersion = "22.05";
}

