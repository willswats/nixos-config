{ globals, ... }:

{
  services.mako =
    let
      fontName = globals.font.name;

      peach = "#${globals.colours.peach}";
      blue = "#${globals.colours.blue}";
      text = "#${globals.colours.text}";
      surface0 = "#${globals.colours.surface0}";
      base = "#${globals.colours.base}e6"; # 0.9
    in
    {
      enable = true;
      font = fontName;
      defaultTimeout = 5000; # Milliseconds
      borderSize = 2;
      textColor = text;
      backgroundColor = base;
      borderColor = blue;
      # To draw the progress indicator on top of the background color, use the over attribute. 
      # To replace the background color, use the source attribute.
      progressColor = "over ${surface0}";
      extraConfig = '' 
      [urgency=high]
      border-color=${peach}
    '';
    };
}
