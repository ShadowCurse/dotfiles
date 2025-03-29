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
    hostName = "dns-box";
    nameservers = [ "127.0.0.1" "::1" ];
    networkmanager.enable = true;
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

  #==========================#
  ## Pihole
  #==========================#
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
      FTLCONF_webserver_api_password = "password";
      FTLCONF_dns_upstreams = "127.0.0.1#5335";
      FTLCONF_dns_dnssec = "true";
    };
    extraOptions = [
      "--network=host"
      "--pull=newer"
      "--dns=1.1.1.1"
    ];
  };

  systemd.services."podman-pihole".postStart = ''
    sleep 300s

    podman exec pihole pihole-FTL sqlite3 /etc/pihole/gravity.db "INSERT INTO adlist (address, enabled) VALUES \
        ('https://raw.githubusercontent.com/PolishFiltersTeam/KADhosts/master/KADhosts.txt', 1), \
        ('https://raw.githubusercontent.com/FadeMind/hosts.extras/master/add.Spam/hosts', 1), \
        ('https://v.firebog.net/hosts/static/w3kbl.txt', 1), \
        ('https://adaway.org/hosts.txt', 1), \
        ('https://v.firebog.net/hosts/AdguardDNS.txt', 1), \
        ('https://v.firebog.net/hosts/Admiral.txt', 1), \
        ('https://raw.githubusercontent.com/anudeepND/blacklist/master/adservers.txt', 1), \
        ('https://s3.amazonaws.com/lists.disconnect.me/simple_ad.txt', 1), \
        ('https://v.firebog.net/hosts/Easylist.txt', 1), \
        ('https://pgl.yoyo.org/adservers/serverlist.php?hostformat=hosts&showintro=0&mimetype=plaintext', 1), \
        ('https://raw.githubusercontent.com/FadeMind/hosts.extras/master/UncheckyAds/hosts', 1), \
        ('https://raw.githubusercontent.com/bigdargon/hostsVN/master/hosts', 1), \
        ('https://v.firebog.net/hosts/Easyprivacy.txt', 1), \
        ('https://v.firebog.net/hosts/Prigent-Ads.txt', 1), \
        ('https://raw.githubusercontent.com/FadeMind/hosts.extras/master/add.2o7Net/hosts', 1), \
        ('https://raw.githubusercontent.com/crazy-max/WindowsSpyBlocker/master/data/hosts/spy.txt', 1), \
        ('https://hostfiles.frogeye.fr/firstparty-trackers-hosts.txt', 1), \
        ('https://raw.githubusercontent.com/DandelionSprout/adfilt/master/Alternate%20versions%20Anti-Malware%20List/AntiMalwareHosts.txt', 1), \
        ('https://osint.digitalside.it/Threat-Intel/lists/latestdomains.txt', 1), \
        ('https://s3.amazonaws.com/lists.disconnect.me/simple_malvertising.txt', 1), \
        ('https://v.firebog.net/hosts/Prigent-Crypto.txt', 1), \
        ('https://raw.githubusercontent.com/FadeMind/hosts.extras/master/add.Risk/hosts', 1), \
        ('https://bitbucket.org/ethanr/dns-blacklists/raw/8575c9f96e5b4a1308f2f12394abd86d0927a4a0/bad_lists/Mandiant_APT1_Report_Appendix_D.txt', 1), \
        ('https://phishing.army/download/phishing_army_blocklist_extended.txt', 1), \
        ('https://gitlab.com/quidsup/notrack-blocklists/raw/master/notrack-malware.txt', 1), \
        ('https://v.firebog.net/hosts/RPiList-Malware.txt', 1), \
        ('https://v.firebog.net/hosts/RPiList-Phishing.txt', 1), \
        ('https://raw.githubusercontent.com/Spam404/lists/master/main-blacklist.txt', 1), \
        ('https://raw.githubusercontent.com/AssoEchap/stalkerware-indicators/master/generated/hosts', 1), \
        ('https://urlhaus.abuse.ch/downloads/hostfile/', 1), \
        ('https://zerodot1.gitlab.io/CoinBlockerLists/hosts_browser', 1); \
    "

    podman exec pihole pihole -g
  '';

  #==========================#
  ## Unbound
  #==========================#
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
        # root-hints = "/var/lib/unbound/root.hints";

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
  ## Additional services
  #==========================#
  services.openssh.enable = true;
  services.logind.lidSwitch = "ignore";

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
    dates = "daily";

    # Prevent silencing of build output
    flags = lib.mkForce [ ];
  };

  #==========================#
  ## System packages 
  #==========================#
  environment.defaultPackages = [ ];
  environment.systemPackages = with pkgs; [
    dns-root-data
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
  system.stateVersion = "24.05";
}

