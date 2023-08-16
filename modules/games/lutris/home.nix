{ pkgs, globals, ... }:

{
  home.packages = with pkgs; [
    lutris
  ];

  xdg.configFile."lutris/lutris.conf" = {
    text = ''
      [services]
      lutris = False
      gog = True
      egs = False
      origin = False
      ubisoft = False
      steam = False
      amazon = False

      [lutris]
      library_ignores = 
      migration_version = 12
    '';
  };

  xdg.configFile."lutris/system.yml" =
    let
      homeDir = globals.homeDir;
    in
    {
      text = ''
        system:
          game_path: ${homeDir}Games/Lutris
      '';
    };
}
