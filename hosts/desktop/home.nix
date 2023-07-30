{ config, pkgs, ... }:

{
  imports = [
    ../home.nix
    ../../modules/opentabletdriver/home.nix
    ../../modules/games/csgo/home.nix
    ../../modules/games/osu/home.nix
    ../../modules/games/slippi/home.nix
    ../../modules/games/gzdoom/home.nix
    ../../modules/games/retroarch/home.nix
  ];

  home.packages = with pkgs; [
    # Games
    steam
    osu-lazer-bin
    yuzu-mainline
    pcsx2
    rpcs3
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

      directories = "~/Games/WADs ~/Games/ROMs ~/Games/pk3";
    in
    {
      config.startup =
        [
          {
            command = "mkdir -p ${directories}";
            always = false;
            notification = false;
          }
        ];
      # Set specific monitors to workspaces
      # Also fixes i3 starting on ws10 - https://github.com/nix-community/home-manager/issues/695
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

  programs.alacritty.settings.font.size = 14;
}
