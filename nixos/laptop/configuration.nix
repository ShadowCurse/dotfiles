{ config, pkgs, lib, ... }:

{
  imports =
    [
      ./hardware-configuration.nix
    ];

  #==========================#
  ## Bootloader
  #==========================#
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;
  boot.loader.efi.efiSysMountPoint = "/boot/efi";

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
    #networkmanager.dns = "unbound";
  };
  # networking.wireless.enable = true;

  networking.firewall.allowedTCPPorts = [ 53 80 443 ];
  networking.firewall.allowedUDPPorts = [ 53 67 ];
  #networking.enableIPv6 = false;
  # Configure network proxy if necessary
  # networking.proxy.default = "http://user:password@proxy:port/";
  # networking.proxy.noProxy = "127.0.0.1,localhost,internal.domain";

  #==========================#
  ## Power managment
  #==========================#
  powerManagement = {
    enable = true;
    cpuFreqGovernor = "powersave";
  };

  #==========================#
  ## Virtualisation
  #==========================#
  virtualisation = {
    podman = {
        enable = true;
        dockerCompat = true;
    };
  };
  virtualisation.oci-containers.backend = "podman";
  virtualisation.oci-containers.containers.pihole = {
    image = "pihole/pihole:latest";
    autoStart = true;
    ports = [
      "53:53/udp"
      "53:53/tcp"
      "67:67/udp"
      "80:80/tcp"
      "443:443/tcp"
    ];
    environment = {
      TZ = config.time.timeZone;
      DNSSEC = "true";
      WEBPASSWORD = "password";
      PIHOLE_DNS_ = "127.0.0.1#5335";
      #DNSMASQ_LISTENING = "local";
    };
    extraOptions = [
      "--network=host"
    ];
  };

  #==========================#
  ## Additional services
  #==========================#
  services.openssh.enable = true;
  services.unbound = {
    enable = true;
    settings = {
      server = {
        verbosity = 0;
        interface = [ "127.0.0.1" ];
        port = "5335";
        do-ip4 = true;
        do-udp = true;
        do-tcp = true;
        do-ip6 = false;
        prefer-ip6 = false;

        # Use this only when you downloaded the list of primary root servers!
        # If you use the default dns-root-data package, unbound will find it automatically
        #root-hints: "/var/lib/unbound/root.hints"

        # Trust glue only if it is within the server's authority
        harden-glue = true;

        # Require DNSSEC data for trust-anchored zones, if such data is absent, the zone becomes BOGUS
        harden-dnssec-stripped = true;

        # Don't use Capitalization randomization as it known to cause DNSSEC issues sometimes
        # see https://discourse.pi-hole.net/t/unbound-stubby-or-dnscrypt-proxy/9378 for further details
        use-caps-for-id = false;
        edns-buffer-size = 1232;

        # Perform prefetching of close to expired message cache entries
        # This only applies to domains that have been frequently queried
        prefetch = true;

        # One thread should be sufficient, can be increased on beefy machines. In reality for most users running on small networks or on a single machine, it should be unnecessary to seek performance enhancement by increasing num-threads above 1.
        num-threads = 1;

        # Ensure kernel buffer is large enough to not lose messages in traffic spikes
        so-rcvbuf = "1m";

        # Ensure privacy of local IP ranges
        private-address = [ 
	  "192.168.0.0/16"
          "169.254.0.0/16"
          "172.16.0.0/12"
          "10.0.0.0/8"
          "fd00::/8"
          "fe80::/10"
	];
      };
    };
  };

  #==========================#
  # Set your time zone and locale
  #==========================#
  time.timeZone = "Europe/London";
  i18n.defaultLocale = "en_US.UTF-8";

  hardware.enableRedistributableFirmware = true;

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
    neovim
    tmux
    git
  ];

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
  console.keyMap = "us";

  #==========================#
  ## nix-ld
  #==========================#
  programs.nix-ld.enable = true;

  #==========================#
  ## Initial system version
  #==========================#
  system.stateVersion = "22.05";
}

