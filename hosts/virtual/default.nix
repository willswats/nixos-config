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
    configurationLimit = 10; # Limit the amount of configurations
  };

  # Set resolution
  xserver.resolutions = [
    { x = 1920; y = 1080; }
  ];

  networking.hostName = "will-virtual";
}
