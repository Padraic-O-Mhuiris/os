{ config, pkgs, lib, ... }:

let
  inherit (builtins) toPath;
in {
  boot = {
    supportedFilesystems = [ "zfs" ];
    cleanTmpDir = true;
    # kernel.sysctl = {
    #   "fs.file-max" = 100000;
    #   "fs.inotify.max_user_instances" = 256;
    #   "fs.inotify.max_user_watches" = 500000;
    # };
    loader = {
      efi.canTouchEfiVariables = true;
      grub = {
        enable = true;
        version = 2;
        efiSupport = true;
        enableCryptodisk = true;
        device = "nodev";
        font = "${toPath pkgs.iosevka}/share/fonts/truetype/iosevka-regular.ttf";
        fontSize = 30;
        gfxmodeEfi = "1280x800";
        gfxmodeBios = "1280x800";
      };
    };

    initrd = {
      luks.devices = {
        "CRYPTED-0" = {
          device = "/dev/disk/by-uuid/3ec29e49-3213-46ec-a059-3296498f3711";
          preLVM = true;
        };
        "CRYPTED-1" = {
          device = "/dev/disk/by-uuid/113a57bf-2d87-4ee6-9a4f-2929e17562ca";
          preLVM = true;
        };
      };
    };
    kernelPackages = pkgs.linuxPackages_latest;
  };
}
