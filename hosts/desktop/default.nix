{ ... }:

{
  imports = [
    ./hardware-configuration.nix
    ../../modules/desktop/hyprland
    ../../modules/utilities/virt-manager
    ../../modules/system/opentabletdriver
    ../../modules/system/amd
    ../../modules/games/steam
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
}
