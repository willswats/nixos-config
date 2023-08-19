{ ... }:

{
  imports =
    [
      ./hardware-configuration.nix
      ../../modules/system/spice
      ../../modules/system/plymouth
    ];

  boot.loader.grub = {
    enable = true;
    useOSProber = true;
    device = "/dev/vda";
    configurationLimit = 20; # Limit the amount of configurations
  };

  # Set resolution
  services.xserver.resolutions = [{
    x = 1920;
    y = 1080;
  }];
}
