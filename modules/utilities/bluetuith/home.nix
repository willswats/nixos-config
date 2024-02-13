{ pkgs, ... }:

{
  home.packages = with pkgs; [ bluetuith ];

  xdg.configFile."bluetuith/bluetuith.conf" = {
    text = ''
      keybindings: { 
          # Vim navigation
          NavigateUp: k
          NavigateDown: j
          NavigateRight: l
          NavigateLeft: h
          NavigateTop: g
          NavigateBottom: G

          # Menu with m instead of Alt+m
          Menu: m

          # Quit with q instead of Q
          Quit: q
      }
    '';
  };

}
