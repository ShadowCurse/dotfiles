{ pkgs, config, lib, ... }:
{

  #==========================#
  ## RP4
  #==========================#

  # This causes an overlay which causes a lot of rebuilding
  environment.noXlibs = lib.mkForce false;
  # "${nixpkgs}/nixos/modules/installer/sd-card/sd-image-aarch64.nix" creates a
  # disk with this label on first boot. Therefore, we need to keep it. It is the
  # only information from the installer image that we need to keep persistent
  fileSystems."/" =
    { device = "/dev/disk/by-label/NIXOS_SD";
      fsType = "ext4";
    };

  #==========================#
  ## Boot
  #==========================#
  boot = {
    tmp.cleanOnBoot = true;
    kernelPackages = lib.mkForce pkgs.linuxPackages_latest;
    loader = {
      generic-extlinux-compatible.enable = lib.mkDefault true;
      grub.enable = lib.mkDefault false;
    };
  };

  #==========================#
  ## Network
  #==========================#
  networking = {
    hostName = "rp4";
    networkmanager.enable = true;
    wireless.enable = false;
  };

  #==========================#
  # Set your time zone and locale
  #==========================#
  time.timeZone = "Europe/London";
  i18n.defaultLocale = "en_US.UTF-8";

  #==========================#
  ## Nix settings, auto cleanup and enable flakes
  #==========================#
  nix = {
    settings.auto-optimise-store = true;
    settings.allowed-users = [ "rp4" ];
    settings.trusted-users = [ "root" "@wheel" ];
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
    git
  ];

  #==========================#
  ## Additional services
  #==========================#
  services.openssh.enable = true;

  #==========================#
  ## User
  #==========================#
  users.users.rp4 = {
    isNormalUser = true;
    extraGroups = [ "wheel" "networkmanager" "adbusers" "docker" ];
  };

  #==========================#
  ## Virtualization
  #==========================#
  virtualisation.docker = {
    enable = true;
    storageDriver = "overlay2";
    daemon.settings = {
      data-root = "/home/rp4/.docker";
    };
  };

  #==========================#
  ## Android
  #==========================#
  programs.adb.enable = true;

  #==========================#
  ## Shell
  #==========================#
  programs.fish.enable = true;
  users.users.rp4.shell = pkgs.fish;

  #==========================#
  ## nix-ld
  #==========================#
  programs.nix-ld.enable = true;

  #==========================#
  ## Initial system version
  #==========================#
  system.stateVersion = "23.05";
}
