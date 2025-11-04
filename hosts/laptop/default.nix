{ ... }:

{
  imports = [
    ../default.nix
    ./hardware-configuration.nix
  ];
  boot = {
    initrd.luks.devices."luks-6a022660-731b-4890-8d6d-aba86801525b".device = "/dev/disk/by-uuid/6a022660-731b-4890-8d6d-aba86801525b";
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
