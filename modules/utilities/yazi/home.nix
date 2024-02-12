{ pkgs, ... }:

{
  home.packages = with pkgs; [
    ueberzugpp
  ];

  programs.yazi = {
    enable = true;
    enableFishIntegration = true;
  };

  xdg.configFile."yazi/keymap.toml" = {
    text = ''
      [[manager.prepend_keymap]]
      on   = [ "<C-s>" ]
      exec = 'shell "$SHELL" --block --confirm'
      desc = "Open shell here"

      [[manager.prepend_keymap]]
      on   = [ "y" ]
      exec = [ "yank", ''''
        shell --confirm 'for path in "$@"; do echo "file://$path"; done | wl-copy -t text/uri-list'
      '''' ]
    '';
  };
}
