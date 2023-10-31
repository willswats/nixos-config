{ pkgs, ... }:

{
  home.packages = with pkgs; [
    heroic
  ];

  xdg.configFile."heroic/config.json" = {
    text = ''
      {
        "defaultSettings": {
          "checkUpdatesInterval": 10,
          "enableUpdates": false,
          "addDesktopShortcuts": false,
          "addStartMenuShortcuts": false,
          "autoInstallDxvk": true,
          "autoInstallVkd3d": true,
          "autoInstallDxvkNvapi": false,
          "addSteamShortcuts": false,
          "preferSystemLibs": false,
          "checkForUpdatesOnStartup": true,
          "autoUpdateGames": false,
          "customWinePaths": [],
          "defaultInstallPath": "/home/will/Games/Heroic",
          "libraryTopSection": "disabled",
          "defaultSteamPath": "/home/will/.steam/steam",
          "defaultWinePrefix": "/home/will/Games/Heroic/Prefixes/default",
          "hideChangelogsOnStartup": false,
          "language": "en",
          "maxWorkers": 0,
          "minimizeOnLaunch": false,
          "nvidiaPrime": false,
          "enviromentOptions": [],
          "wrapperOptions": [],
          "showFps": false,
          "useGameMode": false,
          "userInfo": {
            "name": "will"
          },
          "wineCrossoverBottle": "Heroic",
          "winePrefix": "/home/will/Games/Heroic/Prefixes/default",
          "wineVersion": {
            "bin": "/home/will/.local/share/Steam/steamapps/common/Proton - Experimental/proton",
            "name": "Proton - Proton - Experimental",
            "type": "proton"
          },
          "enableEsync": true,
          "enableFsync": true
        },
        "version": "v0"
      }
    '';
  };
}
