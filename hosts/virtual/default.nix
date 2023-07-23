{ config, pkgs, ... }:

{
  imports = [
    ../configuration.nix
    ./hardware-configuration.nix
  ];

  boot.loader.grub = {
    enable = true;
    useOSProber = true;
    device = "/dev/vda";
  };

  networking.hostName = "will-virtual";
}
