{ pkgs
, ...
}:

{
  imports = [
    ../home.nix
    ../../modules/servers/seanime/home.nix
    ../../modules/system/opentabletdriver/home.nix
    ../../modules/games/steam/home.nix
    ../../modules/games/heroic/home.nix
    ../../modules/games/r2modman/home.nix
    ../../modules/games/uzdoom/home.nix
    ../../modules/games/airshipper/home.nix
    ../../modules/emulators/slippi/home.nix
    ../../modules/emulators/yuzu/home.nix
  ];

  home.packages = with pkgs; [
    # Utilities
    alsa-scarlett-gui
    mangohud
    # Emulators
    rpcs3
    pcsx2
    dolphin-emu
    azahar
    xenia-canary
    shadps4
    # Launchers
    prismlauncher
    deadlock-mod-manager
    # Games
    osu-lazer-bin
    tetrio-desktop
    vintagestory
    # sm64coopdx
  ];
}
