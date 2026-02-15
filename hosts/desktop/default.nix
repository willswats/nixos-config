{ pkgs
, host
, globals
, ...
}:

{
  imports = [
    ../default.nix
    ./hardware-configuration.nix
    ../../modules/system/amd
    ../../modules/system/opentabletdriver
    ../../modules/system/wooting
    ../../modules/servers/komga
    ../../modules/servers/sunshine
    ../../modules/games/steam
    ../../modules/games/r2modman
  ];

  # Open ports for hosting games
  networking.firewall = {
    enable = true;
    allowedUDPPorts = [ 27015 ];
  };

  boot = {
    initrd.luks.devices = {
      "luks-418efaa8-2d4d-49f9-adb0-e8a37fb859ba".device =
        "/dev/disk/by-uuid/418efaa8-2d4d-49f9-adb0-e8a37fb859ba";
      "luks-908577b6-3ac9-4b67-ac70-cbfc3244a201".device =
        "/dev/disk/by-uuid/908577b6-3ac9-4b67-ac70-cbfc3244a201"; # Unlock 2TB M.2 drive at boot
      "luks-b1976cfe-f76b-44f3-8541-29a4bb168489".device =
        "/dev/disk/by-uuid/b1976cfe-f76b-44f3-8541-29a4bb168489"; # Unlock 2TB SSD drive at boot
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
    device = "/dev/disk/by-uuid/677867a5-7a72-482b-a007-cf359502d3bc"; # Mount 2TB M.2 drive
    fsType = "ext4";
  };

  fileSystems."/run/media/will/2TB-SSD" = {
    device = "/dev/disk/by-uuid/110c1df3-21ee-4419-93e1-c2f400b1fd36"; # Mount 2TB SSD drive
    fsType = "ext4";
  };

  programs.gamescope = {
    enable = true;
    # Fix gamescope blur - https://github.com/ValveSoftware/gamescope/issues/1622
    package = pkgs.gamescope.overrideAttrs (_: {
      NIX_CFLAGS_COMPILE = [ "-fno-fast-math" ];
    });
  };
  programs.gamemode.enable = true;
  users.users.${globals.user}.extraGroups = [ "gamemode" ];
}
