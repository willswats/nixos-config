{ config, pkgs, ... }:

{
  imports = [
    ../configuration.nix
    ./hardware-configuration.nix
    ../../modules/opentabletdriver
    # ../../modules/nvidia
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

  # Setup displays
  services.xserver.displayManager.setupCommands =
    let
      monitor-center = "DP-2";
      monitor-left = "DP-3";
    in
    ''
      ${pkgs.xorg.xrandr}/bin/xrandr --output ${monitor-center} --primary --mode 1920x1080 --rate 144.00 --rotate normal --output ${monitor-left} --mode 1920x1080 --rate 144.00 --rotate right --left-of ${monitor-center}
    '';

  networking.hostName = "will-desktop";
}
