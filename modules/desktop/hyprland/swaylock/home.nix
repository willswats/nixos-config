{ pkgs, ... }:

let
  base = "#1e1e2e";
  blue = "#89b4fa";
  overlay0 = "#6c7086";
  green = "#a6e3a1";
  peach = "#fab387";
  red = "#f38ba8";
in
{
  programs.swaylock = {
    enable = true;
    package = pkgs.swaylock-effects;
    settings = {
      color = base;

      font = "Hack Nerd Font";
      font-size = 40;

      indicator-radius = 125;

      daemonize = true; # Fix screen locking multiple times - https://github.com/swaywm/swaylock/issues/86

      ignore-empty-password = true; # Don't allow empty password
      disable-caps-lock-text = true; # Disable caps lock

      clock = true;
      indicator = true; # Always show indicator

      # See https://strftime.org/
      timestr = "%H:%M";
      datestr = "%a %d %b";

      # Get rid of ring borders
      line-uses-inside = true;
      line-uses-ring = true;

      # Remove separator border
      separator-color = overlay0;

      # Key and backspace highlight colors
      key-hl-color = blue;
      bs-hl-color = red;

      # Default
      text-color = blue;
      ring-color = overlay0;
      inside-color = base;

      # Caps lock
      text-caps-lock-color = peach;
      ring-caps-lock-color = overlay0;
      inside-caps-lock-color = base;

      # Wrong
      text-wrong-color = red;
      ring-wrong-color = red;
      inside-wrong-color = base;

      # Clear
      text-clear-color = green;
      ring-clear-color = green;
      inside-clear-color = base;

      # Verifying
      text-ver-color = peach;
      ring-ver-color = peach;
      inside-ver-color = base;
    };
  };
}
