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
  boot.initrd.luks.devices."luks-c82679d7-a63e-4e85-959d-325632f2bc7e".device = "/dev/disk/by-uuid/c82679d7-a63e-4e85-959d-325632f2bc7e";
  boot.initrd.luks.devices."luks-c82679d7-a63e-4e85-959d-325632f2bc7e".keyFile = "/crypto_keyfile.bin";

  networking.hostName = "will-laptop";
}
