{ config, lib, pkgs, ... }:

{
  boot.initrd = {
    supportedFilesystems = ["zfs"];
boot.supportedFilesystems = [ "zfs" ];
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
}
