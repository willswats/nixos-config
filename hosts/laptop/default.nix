{ ... }:

{
  imports = [
    ./hardware-configuration.nix
    ../../modules/utilities/virt-manager
  ];


  boot = {
    initrd = {
      systemd.enable = true; # Necessary for plymouth to prompt for encryption password (causes issues when used with Nvidia proprietary drivers)
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

  networking.hostName = "will-laptop";
}
