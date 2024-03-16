{ pkgs, globals, ... }:

{
  home.packages = with pkgs; [
    lutris
    wine
  ];

  xdg.configFile."lutris/system.yml" =
    let
      homeDir = globals.directories.home;
    in
    {
      text = ''
        system:
          game_path: ${homeDir}/Games/Lutris
      '';
    };
}
