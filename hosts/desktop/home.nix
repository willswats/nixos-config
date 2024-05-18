{ pkgs, host, ... }:

{
  imports = [
    ../home.nix
    ../../modules/system/opentabletdriver/home.nix
    ../../modules/games/steam/home.nix
    ../../modules/games/heroic/home.nix
    ../../modules/games/r2modman/home.nix
    ../../modules/games/osu/home.nix
    ../../modules/games/gzdoom/home.nix
    ../../modules/emulators/ishiiruka/home.nix
    ../../modules/emulators/retroarch/home.nix
  ];

  home.packages = with pkgs; [
    # Utilities
    mangohud
    # Games
    (callPackage ../../pkgs/airshipper { })
    prismlauncher
    # Emulators
    (callPackage ../../pkgs/ryujinx { })
    rpcs3
    pcsx2
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
