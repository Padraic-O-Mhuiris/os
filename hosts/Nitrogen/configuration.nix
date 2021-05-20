{ config, lib, pkgs, ... }:

{
  imports = [
    ./hardware-configuration.nix
    ./fonts.nix
    ./luks.nix
    ./boot.nix
  ];
  networking = {
    hostName = "Nitrogen";
    networkmanager.enable = true;
    useDHCP = false;
    interfaces = {
      enp5s0.useDHCP = true;
      wlp4s0.useDHCP = true;
    };
    hostId = "deadbeef";
  };

  i18n = { defaultLocale = "en_IE.UTF-8"; };
  console = {
    font = "latarcyrheb-sun32";
    keyMap = "uk";
  };

  environment.systemPackages = with pkgs; [
    coreutils
    binutils
    nixfmt
    wget
    vim
    htop
    git
    git-crypt
    acpi
    xclip
    clang
    usbutils
    powertop
    xorg.libxcb
    bc
    cachix
    i7z
    unzip
    tree
    openssl
    glxinfo
    xdotool
    clang
    lm_sensors
    dmidecode
    mtools
    xorg.xbacklight
    jq
  ];

  users.users.padraic = {
    uid = 1000;
    isNormalUser = true;
    group = "users";
    extraGroups = [ "wheel" "audio" "networkmanager" "video" "docker" ];
  };

  users.mutableUsers = false;

}
