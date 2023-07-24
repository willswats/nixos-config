{ config, pkgs, ... }:

{
  imports = [
    ../configuration.nix
    ./hardware-configuration.nix
  ];

  # Bootloader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  # Setup keyfile
  boot.initrd.secrets = {
    "/crypto_keyfile.bin" = null;
  };

  # Enable swap on luks
  boot.initrd.luks.devices."luks-1bb26d75-1e56-449f-9a51-bb94ea8183e7".device = "/dev/disk/by-uuid/1bb26d75-1e56-449f-9a51-bb94ea8183e7";
  boot.initrd.luks.devices."luks-1bb26d75-1e56-449f-9a51-bb94ea8183e7".keyFile = "/crypto_keyfile.bin";

  networking.hostName = "will-desktop";
}
