{ config, lib, pkgs, ... }:

{
  # nixos-raspberrypi modules and nixpkgs come from flake.nix
  nix.channel.enable = false;
  nix.settings.experimental-features = [ "nix-command" "flakes" ];
  nix.settings.trusted-users = [ "root" "@wheel" ];

  boot.loader.raspberry-pi.bootloader = "kernel";

  # PCIe Gen 3 for the NVMe
  hardware.raspberry-pi.config.all.base-dt-params = {
    pciex1     = { enable = true; value = "on"; };
    pciex1_gen = { enable = true; value = "3"; };
  };

  fileSystems = {
    "/boot/firmware" = {
      device = "/dev/disk/by-label/FIRMWARE";
      fsType = "vfat";
      options = [ "noatime" "noauto" "x-systemd.automount" "x-systemd.idle-timeout=1min" ];
    };
    "/" = {
      device = "/dev/disk/by-label/NIXOS_SD";
      fsType = "ext4";
      options = [ "noatime" ];
    };
    # NVMe SSD (whole-disk ext4, existing data)
    "/mnt/ssd" = {
      device = "/dev/disk/by-uuid/ead4d0dc-b3e3-46c1-a529-76972c60fca5";
      fsType = "ext4";
      options = [ "noatime" "nofail" "x-systemd.device-timeout=10s" ];
      neededForBoot = true;
    };
    "/nix" = {
      device = "/mnt/ssd/nix";
      fsType = "none";
      options = [ "bind" ];
      neededForBoot = true;
      depends = [ "/mnt/ssd" ];
    };
  };
  # Keep the old Debian path working
  systemd.tmpfiles.rules = [ "L+ /home/rp5/ssd - - - - /mnt/ssd" ];

  #==========================#
  ## Network
  #==========================#
  networking = {
    hostName = "rp5";
    networkmanager.enable = true;
  };

  #==========================#
  # Set your time zone and locale
  #==========================#
  time.timeZone = "Europe/London";
  i18n.defaultLocale = "en_US.UTF-8";

  #==========================#
  ## GPU
  #==========================#
  hardware.graphics = {
    enable = true;
    extraPackages = with pkgs; [];
  };

  #==========================#
  ## Additional services
  #==========================#
  services.openssh = {
    enable = true;
    settings.PermitRootLogin = "no";
    settings.PasswordAuthentication = false;
  };

  # rp5 is the only user. uid/gid 1000 match the file ownership on the SSD.
  users.mutableUsers = true;
  users.groups.rp5.gid = 1000;
  users.users.rp5 = {
    isNormalUser = true;
    uid = 1000;
    group = "rp5";
    extraGroups = [ "wheel" "networkmanager" ];
  };

  # Sway
  programs.sway.enable = true;

  # Misc
  programs.xwayland.enable = true;
  xdg.portal = {
    enable = true;
    wlr.enable = true;
  };

  #==========================#
  ## Shell
  #==========================#
  programs.fish.enable = true;
  users.users.rp5.shell = pkgs.fish;
  console.keyMap = "us";

  #==========================#
  ## nix-ld
  #==========================#
  programs.nix-ld.enable = true;

  environment.systemPackages = with pkgs; [ neovim git htop tmux ];

  system.stateVersion = "26.05";
}
