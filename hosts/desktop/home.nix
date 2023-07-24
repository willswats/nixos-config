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


  xsession.windowManager.i3 =
    let
      monitor-center = "DP-2";
      monitor-left = "DP-3";

      ws1 = "1";
      ws2 = "2";
      ws3 = "3";
      ws4 = "4";
      ws5 = "5";
      ws6 = "6";
      ws7 = "7";
      ws8 = "8";
      ws9 = "9";
      ws10 = "10";

      otd-daemon = "${pkgs.opentabletdriver}/bin/otd-daemon";
      directories = "~/Games/WADs ~/Games/ROMs";
    in
    {
      config.startup =
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
      extraConfig = ''
        workspace ${ws1} output ${monitor-left}
        workspace ${ws2} output ${monitor-center}
        workspace ${ws3} output ${monitor-center}
        workspace ${ws4} output ${monitor-center}
        workspace ${ws5} output ${monitor-center}
        workspace ${ws6} output ${monitor-center}
        workspace ${ws7} output ${monitor-center}
        workspace ${ws8} output ${monitor-center}
        workspace ${ws9} output ${monitor-center}
        workspace ${ws10} output ${monitor-center}
      '';
    };


  gtk.gtk3.bookmarks =
    let
      bookmarkStart = "file:///home/will/";
    in
    [
      "${bookmarkStart}Games Games"
    ];
}
