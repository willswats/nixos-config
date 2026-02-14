{ host, pkgs, ... }:

let
  gameDrive = host.directories.gameDrive;
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
          "defaultInstallPath": "${gameDrive}/Games/Heroic",
          "libraryTopSection": "disabled",
          "defaultSteamPath": "${gameDrive}/.steam/steam",
          "defaultWinePrefix": "${gameDrive}/Games/Heroic/Prefixes/default",
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
          "winePrefix": "${gameDrive}/Games/Heroic/Prefixes/default",
          "wineVersion": {
            "bin": "${gameDrive}/.config/heroic/tools/proton/GE-Proton-latest/proton",
            "name": "Proton - GE-Proton-latest",
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
