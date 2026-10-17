{
  description = "rp5: Raspberry Pi 5";

  inputs = {
    # nixpkgs comes from nixos-raspberrypi (its kernel is only cached for the nixpkgs it pins)
    nixos-raspberrypi.url = "github:nvmd/nixos-raspberrypi/main";

    home-manager = {
      url = "github:nix-community/home-manager/release-26.05";
      inputs.nixpkgs.follows = "nixos-raspberrypi/nixpkgs";
    };
  };

  outputs = { nixos-raspberrypi, home-manager, ... }@inputs: {
    nixosConfigurations.rp5 = nixos-raspberrypi.lib.nixosSystem {
      specialArgs = inputs;
      modules = [
        ({ nixos-raspberrypi, pkgs, ... }: {
          imports = with nixos-raspberrypi.nixosModules; [
            raspberry-pi-5.base
          ];

          # 4K-page kernel (bcm2711_defconfig, Raspberry Pi OS's kernel8.img) instead of
          # the default 16K-page bcm2712 one. It supports the Pi 5 and is in the cache.
          boot.kernelPackages =
            nixos-raspberrypi.packages.${pkgs.stdenv.hostPlatform.system}.linuxPackages_rpi4;
        })
        ./configuration.nix

        home-manager.nixosModules.home-manager
        {
          home-manager.useGlobalPkgs = true;
          home-manager.useUserPackages = true;
          home-manager.backupFileExtension = "hm-backup";
          home-manager.users.rp5 = ./home.nix;
        }
      ];
    };
  };
}
