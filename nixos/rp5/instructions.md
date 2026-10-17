# Installing NixOS on the Raspberry Pi 5 (`ssh rp5`)

Goal: NixOS runs from the **SD card**. The NVMe SSD keeps its existing data and also holds `/nix`.

## If building on x86_64 machine

In `/etc/nixos/configuration.nix` (the binfmt line already exists, commented out):

```nix
boot.binfmt.emulatedSystems = [ "aarch64-linux" ];

nix.settings = {
  extra-substituters = [ "https://nixos-raspberrypi.cachix.org" ];
  extra-trusted-public-keys = [
    "nixos-raspberrypi.cachix.org-1:4iMO9LXa8BqhU+Rpg6LQKiGa2lsNh/j2oiYLNOQ5sPI="
  ];
};
```

## Build the SD image with your SSH key

```sh
git clone https://github.com/nvmd/nixos-raspberrypi
cd nixos-raspberrypi
vim flake.nix
#   in `custom-user-config` (~line 267), replace both
#   `# YOUR SSH PUB KEY HERE #` lines with the contents of ~/.ssh/id_ed25519.pub
nix --accept-flake-config build .#installerImages.rpi5
ls result/sd-image/          # -> nixos-*.img.zst
```

## Write the image to the SD card

```sh
zstdcat result/sd-image/nixos-*.img.zst | sudo dd of=/dev/sdX bs=4M conv=fsync status=progress
```

### Install

The installer image already has flakes enabled. `nixos-rebuild` picks up `/etc/nixos/flake.nix` on its own and builds `nixosConfigurations.<hostname>`. On the first run the hostname is still `nixos-installer`, so name the config explicitly:

```sh
cd /etc/nixos
# optional: lock to the commit the installer image was built from (kernel already on disk)
sudo nix flake lock --override-input nixos-raspberrypi github:nvmd/nixos-raspberrypi/d21b6b567498698aad146f2903ac9c3bcc78200e
sudo nixos-rebuild switch --flake /etc/nixos#rp5
```

Without the `--override-input`, the first `nixos-rebuild` locks to the current `main`.

### Updates

Nothing changes until you update `flake.lock`:

```sh
cd /etc/nixos
sudo nix flake update                 # move nixos-raspberrypi (+ the nixpkgs it pins) and home-manager to latest
sudo nixos-rebuild dry-build          # optional: linux_rpi-* or rustc in "will be built" = not cached yet, wait
sudo nixos-rebuild switch
sudo reboot                           # only if the kernel changed: compare `uname -r` with readlink /run/current-system/kernel
```

## Move `/nix` to the SSD

### Add the mounts to `configuration.nix`

`/mnt/ssd` is already mounted by the config from step 8. Make it `neededForBoot`, drop `nofail` (the system can't boot without it any more), and add the `/nix` bind mount. `raspberry-pi-5.base` already puts `nvme` in the initrd.

```nix
  fileSystems."/mnt/ssd" = {
    device = "/dev/disk/by-uuid/ead4d0dc-b3e3-46c1-a529-76972c60fca5";
    fsType = "ext4";
    options = [ "noatime" ];
    neededForBoot = true;
  };

  fileSystems."/nix" = {
    device = "/mnt/ssd/nix";
    fsType = "none";
    options = [ "bind" ];
    neededForBoot = true;
    depends = [ "/mnt/ssd" ];
  };
```

### Build the new generation, copy the store, reboot

Order matters. Build first, so the generation that mounts `/nix` from the SSD is already in the store you copy:

```sh
sudo nixos-rebuild boot             # "boot", not "switch": don't activate the mounts yet

sudo systemctl stop nix-daemon.socket nix-daemon.service
sudo rsync -aHAX --info=progress2 /nix/ /mnt/ssd/nix/
sudo reboot
```

### Verify

```sh
findmnt /nix                 # SOURCE should be /dev/nvme0n1[/nix]
findmnt /mnt/ssd
df -h / /nix
nix-store --verify --check-contents   # optional, slow
```

### 9.4 Free the old store on the SD card (optional)

The old `/nix` on the SD card is now hidden under the bind mount. Reach it through a second bind mount of `/`:

```sh
mkdir /mnt/sdroot && mount --bind / /mnt/sdroot
ls /mnt/sdroot/nix              # make sure this is the SD copy, NOT the SSD one
rm -rf /mnt/sdroot/nix/store /mnt/sdroot/nix/var
umount /mnt/sdroot && rmdir /mnt/sdroot
```
