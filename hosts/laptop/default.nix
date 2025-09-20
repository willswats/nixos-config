{ ... }:

{
  imports = [
    ../default.nix
    ./hardware-configuration.nix
  ];

  boot = {
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
