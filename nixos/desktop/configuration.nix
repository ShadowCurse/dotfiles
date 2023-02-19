{ config, pkgs, ... }:
let
  flake-compat = builtins.fetchTarball "https://github.com/edolstra/flake-compat/archive/master.tar.gz";
  hyprland = (import flake-compat {
    src = builtins.fetchTarball "https://github.com/hyprwm/Hyprland/archive/master.tar.gz";
  }).defaultNix;
in
{
  imports =
    [
      ./hardware-configuration.nix
      hyprland.nixosModules.default
      ./river.nix
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
    # AMD
    initrd.kernelModules = [ "amdgpu" ];
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
  time.timeZone = "Europe/London";
  i18n.defaultLocale = "en_US.UTF-8";

  #==========================#
  ## GPU
  #==========================#
  hardware.enableRedistributableFirmware = true;
  # Nvidia
  # services.xserver.videoDrivers = [ "nvidia" ];
  # AMD
  services.xserver.videoDrivers = [ "amdgpu" ];
  # OpenGl
  hardware.opengl = {
    enable = true;
    driSupport = true;
    driSupport32Bit = true;
  };
  hardware.opengl.extraPackages = with pkgs; [
    amdvlk
    # OpenCL
    rocm-opencl-icd
    rocm-opencl-runtime
  ];
  hardware.opengl.extraPackages32 = with pkgs; [
    driversi686Linux.amdvlk
  ];

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
  environment.defaultPackages = [ ];
  # services.xserver.desktopManager.xterm.enable = false;
  environment.systemPackages = with pkgs; [
    vim
    ntfs3g
    fuse
    git
    gnupg
  ];

  #==========================#
  ## Additional services
  #==========================#
  services.openssh.enable = true;
  services.gvfs.enable = true;
  services.pcscd.enable = true;

  #==========================#
  ## GPG
  #==========================#
  programs.gnupg.agent = {
    enable = true;
    enableSSHSupport = true;
  };

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
  # nixpkgs.config.allowUnfree = true;

  #==========================#
  ## Desktop Manager
  #==========================#
  # Wayland
  services.xserver.displayManager.gdm.wayland = true;
  services.xserver.displayManager.gdm.enable = true;
  # X11
  # services.xserver.displayManager.lightdm.enable = true;

  #==========================#
  ## X11
  #==========================#
  services.xserver.enable = true;
  # Window manager
  # DWM
  # services.xserver.windowManager.dwm.enable = true;
  services.xserver.layout = "us";
  # services.xserver.xkbOptions = "eurosign:e";

  #==========================#
  ## Wayland
  #==========================#
  # Hyprland
  programs.hyprland = {
    enable = true;
    package = hyprland.packages.${pkgs.system}.default;
  };
  # River 
  programs.river.enable = true;
  # Misc
  programs.xwayland.enable = true;
  xdg.portal = { 
    enable = true;
    wlr.enable = true;
  };

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

