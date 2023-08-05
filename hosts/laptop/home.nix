{ ... }:

{
  imports = [ ../home.nix ];

  xsession.windowManager.i3 = let
    monitor = "eDP-1";

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
  in {
    # Fixes i3 starting on ws10 - https://github.com/nix-community/home-manager/issues/695
    extraConfig = ''
      workspace ${ws1} output ${monitor}
      workspace ${ws2} output ${monitor}
      workspace ${ws3} output ${monitor}
      workspace ${ws4} output ${monitor}
      workspace ${ws5} output ${monitor}
      workspace ${ws6} output ${monitor}
      workspace ${ws7} output ${monitor}
      workspace ${ws8} output ${monitor}
      workspace ${ws9} output ${monitor}
      workspace ${ws10} output ${monitor}
    '';
  };

  programs.alacritty.settings.font.size = 10;
}
