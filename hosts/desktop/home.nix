{ pkgs, host, ... }:

{
  imports = [
    ../home.nix
    ../../modules/system/opentabletdriver/home.nix
    ../../modules/games/steam/home.nix
    ../../modules/games/heroic/home.nix
    ../../modules/games/lutris/home.nix
    ../../modules/games/r2modman/home.nix
    ../../modules/games/osu/home.nix
    ../../modules/games/ishiiruka/home.nix
    ../../modules/games/doom/home.nix
    ../../modules/games/theforceengine/home.nix
    ../../modules/games/retroarch/home.nix
  ];

  home.packages = with pkgs; [
    # Utilities
    mangohud
    soundux
    # Games
    airshipper
    prismlauncher
    # Emulators
    yuzu-mainline
    pcsx2
    rpcs3
  ];

  wayland.windowManager.hyprland =
    let
      monitorCenter = host.monitors.center;
      monitorLeft = host.monitors.left;
    in
    {
      settings = {
        monitor = [
          "${monitorCenter}, 1920x1080@144, 1080x0, 1"
          "${monitorLeft}, 1920x1080@144, 0x0, 1, transform, 3"
        ];
      };
    };
}
