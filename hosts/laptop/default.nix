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
  boot.initrd.luks.devices."luks-3cda00c0-e50f-4776-98b6-3760ff91f791".device = "/dev/disk/by-uuid/3cda00c0-e50f-4776-98b6-3760ff91f791";
  boot.initrd.luks.devices."luks-3cda00c0-e50f-4776-98b6-3760ff91f791".keyFile = "/crypto_keyfile.bin";

  networking.hostName = "will-laptop";
}
