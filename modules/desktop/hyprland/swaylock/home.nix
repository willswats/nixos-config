{ pkgs, ... }:

let
  base = "#1e1e2e";
  blue = "#89b4fa";
  overlay0 = "#6c7086";
in
{
  programs.swaylock = {
    enable = true;
    package = pkgs.swaylock-effects;
    settings = {
      # swaylock settings
      color = base;
      font-size = 40;
      indicator-radius = 125;
      daemonize = true; # Fix screen locking multiple times - https://github.com/swaywm/swaylock/issues/86
      # swaylock-effects settings
      clock = true;
      indicator = true; # Always show indicator
      # See https://strftime.org/
      timestr = "%H:%M";
      datestr = "%a %d %b";
      ring-color = overlay0;
      key-hl-color = blue;
    };
  };
}
