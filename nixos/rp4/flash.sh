 zstdcat result/sd-image/nixos-sd-image-23.11.20230718.684c17c-aarch64-linux.img.zst | sudo dd of=/dev/sdb status=progress iflag=fullblock oflag=direct conv=fsync,noerror bs=64k
