{ config, pkgs, ... }:

{
  imports =
    [
      ./hardware-configuration.nix
    ];

  #==========================#
  ## GRUB 2
  #==========================#
  boot.loader.grub.enable = true;
  boot.loader.grub.version = 2;
  # boot.loader.grub.efiSupport = true;
  # boot.loader.grub.efiInstallAsRemovable = true;
  # boot.loader.efi.efiSysMountPoint = "/boot/efi";
  # Define on which hard drive you want to install Grub.
  boot.loader.grub.device = "/dev/sda"; # or "nodev" for efi only
  boot.cleanTmpDir = true;

  #==========================#
  ## Kernel
  #==========================#
  boot.kernelPackages = pkgs.linuxPackages_latest;
  boot.kernelModules = [ "v4l2loopback" ];
  boot.extraModulePackages = [
    config.boot.kernelPackages.v4l2loopback.out
  ];

  #==========================#
  ## Network
  #==========================#
  networking.hostName = "archer";
  networking.networkmanager.enable = true;
  # networking.wireless.enable = true;
  networking.useDHCP = false;
  networking.interfaces.enp4s0.useDHCP = true;
  # networking.interfaces.wlp5s0.useDHCP = true;

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
  hardware.opengl = {
    enable = true;
    extraPackages = with pkgs; [
      intel-media-driver
      vaapiIntel
      vaapiVdpau
      libvdpau-va-gl
    ];
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
    vim
    wget
    git
  ];

  #==========================#
  ## Additional services
  #==========================#
  services.openssh.enable = true;
  # gvfs for thunar
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

