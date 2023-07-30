{ ... }:

let
  blue = "#89b4fa";
  base = "#1e1e2e";
in
{
  services.flameshot = {
    enable = true;
    settings = {
      General = {
        uiColor = base;
        contrastUiColor = blue;
        showStartupLaunchMessage = false;
      };
    };
  };
}
