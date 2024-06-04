{ globals, ... }:

{
  services.mako =
    let
      fontName = globals.font.name;
    in
    {
      enable = true;
      catppuccin.enable = true;
      font = fontName;
      defaultTimeout = 5000; # Milliseconds
      borderSize = 2;
    };
}
