{ config, pkgs, ... }:

{
  imports = [
    ../home.nix
  ];

  home.packages = with pkgs; [
    # Entertainment
    steam
    retroarch
    yuzu-mainline
    pcsx2
    rpcs3
    osu-lazer-bin
    zandronum
    prismlauncher
  ];
}
