{ globals, ... }:

{
  services.mako =
    let
      fontName = globals.font.name;

      blue = "#${globals.colours.blue}";
      text = "#${globals.colours.text}";
      surface0 = "#${globals.colours.surface0}";
      base = "#${globals.colours.base}e6"; # 0.9
    in
    {
      enable = true;
      settings = {
        font = fontName;
        default-timeout = 5000; # Milliseconds
        border-size = 2;
        text-color = text;
        background-color = base;
        border-color = blue;
        border-radius = 0;
        margin = "0"; # css-like margin
        progress-color = "over ${surface0}";
      };
    };
}
