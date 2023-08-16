{ pkgs, host, ... }:

{
  imports = [
    ./hardware-configuration.nix
    ../../modules/utilities/virt-manager
    ../../modules/system/opentabletdriver
    ../../modules/system/nvidia
  ];

  boot = {
    initrd = {
      secrets = { "/crypto_keyfile.bin" = null; }; # Setup keyfile
      luks.devices."luks-1bb26d75-1e56-449f-9a51-bb94ea8183e7".device = "/dev/disk/by-uuid/1bb26d75-1e56-449f-9a51-bb94ea8183e7";
      luks.devices."luks-1bb26d75-1e56-449f-9a51-bb94ea8183e7".keyFile = "/crypto_keyfile.bin";
    };
    loader = {
      systemd-boot = {
        enable = true;
        configurationLimit = 20; # Limit the amount of configurations
      };
      efi.canTouchEfiVariables = true;
    };
  };

  # Setup displays
  services.xserver.displayManager.setupCommands =
    let
      monitorCenter = host.monitors.center;
      monitorLeft = host.monitors.left;
    in
    ''
      ${pkgs.xorg.xrandr}/bin/xrandr --output ${monitorCenter} --primary --mode 1920x1080 --rate 144.00 --rotate normal --output ${monitorLeft} --mode 1920x1080 --rate 144.00 --rotate right --left-of ${monitorCenter}
    '';
}
