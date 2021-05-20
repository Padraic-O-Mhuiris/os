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
    kernelPackages = pkgs.linuxPackages_latest;
  };
}
