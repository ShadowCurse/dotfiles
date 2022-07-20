{ config, pkgs, ... }:

{
  imports =
    [
      ./hardware-configuration.nix
    ];

  ## GRUB 2
  boot.loader.grub.enable = true;
  boot.loader.grub.version = 2;
  # boot.loader.grub.efiSupport = true;
  # boot.loader.grub.efiInstallAsRemovable = true;
  # boot.loader.efi.efiSysMountPoint = "/boot/efi";
  # Define on which hard drive you want to install Grub.
  boot.loader.grub.device = "/dev/sda"; # or "nodev" for efi only

  ## Network
  networking.hostName = "archer"; # Define your hostname.
  # networking.wireless.enable = true;  # Enables wireless support via wpa_supplicant.

  # The global useDHCP flag is deprecated, therefore explicitly set to false here.
  # Per-interface useDHCP will be mandatory in the future, so this generated config
  # replicates the default behaviour.
  networking.useDHCP = false;
  networking.interfaces.enp4s0.useDHCP = true;
  networking.interfaces.wlp5s0.useDHCP = true;

  # Configure network proxy if necessary
  # networking.proxy.default = "http://user:password@proxy:port/";
  # networking.proxy.noProxy = "127.0.0.1,localhost,internal.domain";

  # Set your time zone.
  time.timeZone = "Europe/Moscow";

  # Select internationalisation properties.
  # i18n.defaultLocale = "en_US.UTF-8";
  # console = {
  #   font = "Lat2-Terminus16";
  #   keyMap = "us";
  # };

  ## Kernel
  boot.kernelPackages = pkgs.linuxPackages_latest;
  boot.kernelModules = [ "v4l2loopback" ];
  boot.extraModulePackages = [
      config.boot.kernelPackages.v4l2loopback.out
  ];

  ## Unfree
  nixpkgs.config.allowUnfree = true;

  ## GPU
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

  ## X11
  # Enable the X11 windowing system.
  services.xserver.enable = true;
  services.xserver.displayManager.lightdm.enable = true;
  services.xserver.windowManager.dwm.enable = true;

  # Configure keymap in X11
  services.xserver.layout = "us";
  # services.xserver.xkbOptions = "eurosign:e";
  
  # custom dwm
  nixpkgs.overlays = [
      (self: super: {
        dwm = super.dwm.overrideAttrs (old: {
          src = builtins.fetchGit { url = "https://github.com/ShadowCurse/dotfiles"; } + "/dwm-6.2";
        });
      })
  ];

  ## Android
  programs.adb.enable = true;
  
  ## Shell
  programs.fish.enable = true;
  users.users.antaraz.shell = pkgs.fish;

  ## gvfs for thunar
  services.gvfs.enable = true;

  ## nix-ld
  programs.nix-ld.enable = true;

  # Enable CUPS to print documents.
  # services.printing.enable = true;

  ## Sound
  # sound.enable = true;
  # hardware.pulseaudio.enable = true;
  # rtkit is optional but recommended
  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
    # If you want to use JACK applications, uncomment this
    #jack.enable = true;
  };

  # Enable touchpad support (enabled default in most desktopManager).
  # services.xserver.libinput.enable = true;

  ## User
  users.users.antaraz = {
    isNormalUser = true;
    extraGroups = [ "wheel" "adbusers" ]; # Enable ‘sudo’ for the user.
  };

  ## System packages 
  environment.systemPackages = with pkgs; [
    vim
    wget
    git
  ];

  # Some programs need SUID wrappers, can be configured further or are
  # started in user sessions.
  # programs.mtr.enable = true;
  # programs.gnupg.agent = {
  #   enable = true;
  #   enableSSHSupport = true;
  # };

  # List services that you want to enable:

  ## Services
  services.openssh.enable = true;

  # Open ports in the firewall.
  # networking.firewall.allowedTCPPorts = [ ... ];
  # networking.firewall.allowedUDPPorts = [ ... ];
  # Or disable the firewall altogether.
  # networking.firewall.enable = false;

  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "22.05"; # Did you read the comment?

}

