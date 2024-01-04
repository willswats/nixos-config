{ pkgs, globals, ... }:

{
  home.packages = with pkgs; [
    lutris
    wine
  ];

  xdg.configFile."lutris/system.yml" =
    let
      homeDir = globals.homeDir;
    in
    {
      text = ''
        system:
          game_path: ${homeDir}/Games/Lutris
      '';
    };
}
