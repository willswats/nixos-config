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

  # Set resolution
  xserver.resolutions = [
    { x = 1920; y = 1080; }
  ];

  networking.hostName = "will-virtual";
}
