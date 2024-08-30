{ globals, pkgs, ... }:

let
  homeDirectory = globals.directories.home;
in
{
  home.packages = with pkgs; [ heroic ];

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
          "autoUpdateGames": true,
          "customWinePaths": [],
          "defaultInstallPath": "${homeDirectory}/Games/Heroic",
          "libraryTopSection": "disabled",
          "defaultSteamPath": "${homeDirectory}/.steam/steam",
          "defaultWinePrefix": "${homeDirectory}/Games/Heroic/Prefixes/default",
          "hideChangelogsOnStartup": false,
          "language": "en",
          "maxWorkers": 0,
          "minimizeOnLaunch": false,
          "nvidiaPrime": false,
          "enviromentOptions": [],
          "wrapperOptions": [],
          "showFps": false,
          "useGameMode": true,
          "wineCrossoverBottle": "Heroic",
          "winePrefix": "${homeDirectory}/Games/Heroic/Prefixes/default",
          "wineVersion": {
            "bin": "${homeDirectory}/.local/share/Steam/compatibilitytools.d/GE-Proton9-11/proton",
            "name": "Proton - GE-Proton9-11",
            "type": "proton"
          },
          "enableEsync": true,
          "enableFsync": true,
          "enableMsync": false,
          "eacRuntime": true,
          "battlEyeRuntime": true,
          "framelessWindow": false,
          "beforeLaunchScriptPath": "",
          "afterLaunchScriptPath": "",
          "exitToTray": false,
          "discordRPC": true,
          "darkTrayIcon": false,
          "useSteamRuntime": true
        },
        "version": "v0"
      }
    '';
  };
}
