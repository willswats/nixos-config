{ pkgs, ... }:

{
  imports = [
    ../home.nix
    ../../modules/system/opentabletdriver/home.nix
    ../../modules/games/lutris/home.nix
    ../../modules/games/csgo/home.nix
    ../../modules/games/osu/home.nix
    ../../modules/games/slippi/home.nix
    ../../modules/games/doom/home.nix
    ../../modules/games/retroarch/home.nix
  ];

  home.packages = with pkgs; [
    # Games
    steam
    yuzu-mainline
    pcsx2
    rpcs3
  ];
}
