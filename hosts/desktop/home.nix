{ pkgs, host, ... }:

{
  imports = [
    ../home.nix
    ../../modules/system/opentabletdriver/home.nix
    ../../modules/games/steam/home.nix
    ../../modules/games/r2modman/home.nix
    ../../modules/games/osu/home.nix
    ../../modules/games/gzdoom/home.nix
    ../../modules/emulators/ishiiruka/home.nix
    ../../modules/emulators/retroarch/home.nix
    ../../modules/emulators/yuzu/home.nix
  ];

  home.packages = with pkgs; [
    # Utilities
    mangohud
    # Emulators
    rpcs3
    pcsx2
    # Launchers 
    (callPackage ../../pkgs/airshipper { })
    prismlauncher
    heroic
    # Games
    nxengine-evo
  ];

  wayland.windowManager.hyprland =
    let
      monitorCenter = host.monitors.center;
      monitorLeft = host.monitors.left;
    in
    {
      settings = {
        monitor = [
          "${monitorCenter}, 1920x1080@144, 1920x0, 1"
          "${monitorLeft}, 1920x1080@144, 0x0, 1"
        ];
      };
    };
}
