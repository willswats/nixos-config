{ config, pkgs, ... }:

{
  imports = [
    ../home.nix
  ];

  home.packages = with pkgs; [
    # Utilities
    opentabletdriver
    # Games
    steam
    retroarch
    yuzu-mainline
    pcsx2
    rpcs3
    osu-lazer-bin
    zandronum
    prismlauncher
  ];

  xsession.windowManager.i3.config.startup =
    let
      otd-daemon = "${pkgs.opentabletdriver}/bin/otd-daemon";
      directories = "~/Games/WADs ~/Games/ROMs";
    in
    [
      {
        command = "${otd-daemon}";
        always = false;
        notification = false;
      }
      {
        command = "mkdir -p ${directories}";
        always = false;
        notification = false;
      }
    ];

  gtk.gtk3.bookmarks =
    let
      bookmarkStart = "file:///home/will/";
    in
    [
      "${bookmarkStart}Games Games"
    ];
}
