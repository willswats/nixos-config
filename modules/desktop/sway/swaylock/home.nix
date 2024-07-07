{ globals, ... }:

let
  fontName = globals.font.name;

  red = "#${globals.colours.red}";
  peach = "#${globals.colours.peach}";
  green = "#${globals.colours.green}";
  blue = "#${globals.colours.blue}";
  overlay0 = "#${globals.colours.overlay0}";
  base = "#${globals.colours.base}";

in
{
  programs.swaylock = {
    enable = true;
    settings = {
      color = base;

      font = fontName;
      font-size = 40;

      indicator-radius = 125;

      daemonize = true; # Fix screen locking multiple times - https://github.com/swaywm/swaylock/issues/86

      ignore-empty-password = true; # Don't allow empty password

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
