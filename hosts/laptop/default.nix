{ ... }:

{
  imports = [
    ./hardware-configuration.nix
    ../../modules/desktop/hyprland
    ../../modules/utilities/virt-manager
    ../../modules/system/plymouth
  ];

  boot = {
    initrd = {
      secrets = { "/crypto_keyfile.bin" = null; }; # Setup keyfile
      luks.devices."luks-c82679d7-a63e-4e85-959d-325632f2bc7e".device = "/dev/disk/by-uuid/c82679d7-a63e-4e85-959d-325632f2bc7e";
      luks.devices."luks-c82679d7-a63e-4e85-959d-325632f2bc7e".keyFile = "/crypto_keyfile.bin";
    };
    loader = {
      systemd-boot = {
        enable = true;
        configurationLimit = 20; # Limit the amount of configurations
      };
      efi.canTouchEfiVariables = true;
    };
  };

  # Power management
  services.thermald.enable = true; # Prevents overheating on intel cpus
  services.auto-cpufreq.enable = true; # Automatic CPU speed & power optimizer
}
