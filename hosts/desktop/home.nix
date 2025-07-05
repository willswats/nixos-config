{ pkgs, host, ... }:

{
  imports = [
    ../home.nix
    ../../modules/system/opentabletdriver/home.nix
    ../../modules/games/steam/home.nix
    ../../modules/games/heroic/home.nix
    ../../modules/games/r2modman/home.nix
    ../../modules/games/gzdoom/home.nix
    ../../modules/games/airshipper/home.nix
    ../../modules/emulators/slippi/home.nix
    ../../modules/emulators/retroarch/home.nix
    ../../modules/emulators/yuzu/home.nix
  ];

  home.packages = with pkgs; [
    # Utilities
    alsa-scarlett-gui
    easyeffects
    mangohud
    protonplus
    protontricks
    # Emulators
    rpcs3
    pcsx2
    # Launchers
    lutris
    prismlauncher
    # Games
    (osu-lazer-bin.override { nativeWayland = true; })
    tetrio-desktop
    sm64coopdx
  ];

  wayland.windowManager.hyprland.settings.monitor =
    let
      monitorCenter = host.monitors.center;
      monitorLeft = host.monitors.left;
    in
    [
      "${monitorCenter}, 1920x1080@144, 1920x0, 1"
      "${monitorLeft}, 1920x1080@144, 0x0, 1"
    ];

  wayland.windowManager.sway.config.output =
    let
      monitorCenter = host.monitors.center;
      monitorLeft = host.monitors.left;
    in
    {
      ${monitorCenter} = {
        pos = "1920 0";
      };
      ${monitorLeft} = {
        pos = "0 0";
      };
    };

}
