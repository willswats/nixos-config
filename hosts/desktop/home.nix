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
    # Emulators
    rpcs3
    pcsx2
    # Launchers 
    prismlauncher
    # Games
    (callPackage ../../pkgs/osu-lazer-bin {
      ver = "2025.605.1"; # https://github.com/ppy/osu/releases 
      hash = "sha256-0F5AlnID8EHbk0H8G6Idm0WYMAsHhG3j7GxhG+6rNlQ=";
      nativeWayland = true;
    })
    # osu-lazer-bin
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
      ${monitorCenter} = { pos = "1920 0"; };
      ${monitorLeft} = { pos = "0 0"; };
    };

}
