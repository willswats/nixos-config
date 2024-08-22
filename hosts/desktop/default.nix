{ host, ... }:

{
  imports = [
    ../default.nix
    ./hardware-configuration.nix
    ../../modules/system/amd
    ../../modules/system/opentabletdriver
    ../../modules/system/wooting
    ../../modules/servers/jellyfin
    ../../modules/servers/komga
    ../../modules/games/steam
    ../../modules/games/r2modman
  ];

  boot = {
    initrd = {
      luks.devices."luks-418efaa8-2d4d-49f9-adb0-e8a37fb859ba".device = "/dev/disk/by-uuid/418efaa8-2d4d-49f9-adb0-e8a37fb859ba";
    };
    loader = {
      systemd-boot = {
        enable = true;
        configurationLimit = 20; # Limit the amount of configurations
      };
      efi.canTouchEfiVariables = true;
    };
    kernelParams =
      let
        monitorCenter = host.monitors.center;
        monitorLeft = host.monitors.left;
      in
      [
        "video=${monitorCenter}:1920x1080@144"
        "video=${monitorLeft}:1920x1080@144"
      ];
  };

  programs.gamemode.enable = true;
  programs.gamescope.enable = true;
}
