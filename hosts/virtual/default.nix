{ ... }:

{
  imports =
    [
      ../../modules/desktop/i3
      ../../modules/system/spice
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
