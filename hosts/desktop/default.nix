{ config, pkgs, ... }:

{
  imports = [
    ../configuration.nix
    ./hardware-configuration.nix
  ];

  networking.hostName = "will-desktop";

  boot = {
    loader.grub = {
      # Enable grub cryptodisk
      enableCryptodisk = true;
    };

    initrd = {
      # Setup keyfile
      secrets = {
        "/crypto_keyfile.bin" = null;
      };
      luks.devices."luks-2cc37e3f-d240-45a0-8a2b-b511cc7a1f1e".keyFile = "/#crypto_keyfile.bin";
    };
  };
}
