{ host, globals, ... }:

let
  user = globals.user;
in
{
  imports = [
    ../default.nix
    ./hardware-configuration.nix
    ../../modules/system/amd
    ../../modules/system/opentabletdriver
    ../../modules/system/wooting
    ../../modules/servers/jellyfin
    ../../modules/servers/komga
    ../../modules/servers/sunshine
    ../../modules/games/steam
    ../../modules/games/r2modman
  ];

  boot = {
    initrd = {
      luks.devices = {
        "luks-418efaa8-2d4d-49f9-adb0-e8a37fb859ba".device = "/dev/disk/by-uuid/418efaa8-2d4d-49f9-adb0-e8a37fb859ba";
        "luks-908577b6-3ac9-4b67-ac70-cbfc3244a201".device = "/dev/disk/by-uuid/908577b6-3ac9-4b67-ac70-cbfc3244a201"; # Unlock 2TB drive at boot
      };
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

  fileSystems."/run/media/will/2TB" = {
    device = "/dev/disk/by-uuid/677867a5-7a72-482b-a007-cf359502d3bc"; # Mount 2TB drive
    fsType = "ext4";
  };

  programs.gamescope.enable = true;
}
