{ ... }:

{
  imports =
    [
      ./hardware-configuration.nix
      ../../modules/system/spice
    ];

  boot.loader.grub = {
    enable = true;
    useOSProber = true;
    device = "/dev/vda";
    configurationLimit = 20; # Limit the amount of configurations
  };

  # Needed for plymouth to work at startup (broken on nvidia)
  boot.initrd.systemd.enable = true;

  # Set resolution
  services.xserver.resolutions = [{
    x = 1920;
    y = 1080;
  }];
}
