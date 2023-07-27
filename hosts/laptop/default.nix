{ config, pkgs, ... }:

{
  imports = [
    ../configuration.nix
    ./hardware-configuration.nix
    ../../modules/virt-manager
  ];

  # Bootloader.
  boot.loader.systemd-boot = {
    enable = true;
    configurationLimit = 10; # Limit the amount of configurations
  };
  boot.loader.efi.canTouchEfiVariables = true;

  # Setup keyfile
  boot.initrd.secrets = {
    "/crypto_keyfile.bin" = null;
  };

  # Enable swap on luks
  boot.initrd.luks.devices."luks-f55790ec-c751-45ce-ba3e-113ca37dc927".device = "/dev/disk/by-uuid/f55790ec-c751-45ce-ba3e-113ca37dc927";
  boot.initrd.luks.devices."luks-f55790ec-c751-45ce-ba3e-113ca37dc927".keyFile = "/crypto_keyfile.bin";

  networking.hostName = "will-laptop";
}
