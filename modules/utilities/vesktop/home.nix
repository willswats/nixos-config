{ pkgs, ... }:

{
  home.packages = with pkgs; [ vesktop ];

  xdg.configFile."vesktop/settings.json" = {
    text = ''
      {
        "tray": false,
        "minimizeToTray": false,
        "checkUpdates": false,
        "appBadge": false,
        "arRPC": true,
        "splashColor": "oklab(0.899401 -0.00192499 -0.00481987)",
        "splashBackground": "oklab(0.242856 0.00730695 -0.0294512)",
        "splashTheming": true
      }
    '';
  };
}
