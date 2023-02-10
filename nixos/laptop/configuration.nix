{ config, pkgs, lib, ... }:

{
  imports =
    [
      ./hardware-configuration.nix
    ];

  #==========================#
  ## GRUB 2
  #==========================#
  # boot =
  #   {
  #     cleanTmpDir = true;
  #     loader = {
  #       grub = {
  #         enable = true;
  #         version = 2;
  #         efiSupport = true;
  #         device = "nodev";
  #         useOSProber = true;
  #       };
  #       efi = {
  #         canTouchEfiVariables = true;
  #         efiSysMountPoint = "/boot/efi";
  #       };
  #     };
  #   };

  #==========================#
  ## Kernel
  #==========================#
  boot = {
    kernelPackages = pkgs.linuxPackages_latest;
  };

  #==========================#
  ## Network
  #==========================#
  networking = {
    hostName = "archer";
    nameservers = [ "127.0.0.1" "::1" ];
    networkmanager.enable = true;
    networkmanager.dns = "none";
  };
  # networking.wireless.enable = true;

  networking.firewall.allowedTCPPorts = [ 53 80 ];
  networking.firewall.allowedUDPPorts = [ 53 ];
  networking.enableIPv6 = false;

  #==========================#
  ## Virtualisation
  #==========================#
  virtualisation.oci-containers.backend = "podman";
  virtualisation.oci-containers.containers.pihole = {
    image = "pihole/pihole:latest";
    ports = [
      "53:53/udp"
      "53:53/tcp"
      "80:80/tcp"
    ];
    environment = {
      TZ = config.time.timeZone;
      WEB_PORT = "80";
      WEBPASSWORD = "password";
      #VIRTUAL_HOST = "192.168.1.114";
      PIHOLE_DNS_ = "127.0.0.1#5353";
      REV_SERVER = "true";
      REV_SERVER_DOMAIN = "router.lan";
      REV_SERVER_TARGET = "192.168.1.1";
      REV_SERVER_CIDR = "192.168.1.0/16";
      DNSMASQ_LISTENING = "local";
    };
    extraOptions = [
      "--network=host"
    ];
  };

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
  # OpenGl
  hardware.opengl = {
    enable = true;
    driSupport = true;
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
  ## Nix and system settings, auto cleanup and enable flakes
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

  system.autoUpgrade = {
    enable = true;
    allowReboot = true;

    # Prevent silencing of build output
    flags = lib.mkForce [ ];
  };

  #==========================#
  ## System packages 
  #==========================#
  environment.defaultPackages = [ ];
  environment.systemPackages = with pkgs; [
    vim
    git
  ];

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
    extraGroups = [ "wheel" "networkmanager" ];
  };

  #==========================#
  ## Unfree
  #==========================#
  nixpkgs.config.allowUnfree = true;

  #==========================#
  ## Shell
  #==========================#
  programs.fish.enable = true;
  users.users.antaraz.shell = pkgs.fish;
  console.keyMap = "uk";

  #==========================#
  ## nix-ld
  #==========================#
  programs.nix-ld.enable = true;

  #==========================#
  ## Initial system version
  #==========================#
  system.stateVersion = "22.05";
}

