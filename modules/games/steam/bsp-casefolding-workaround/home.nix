{ globals, ... }:

let
  homeDir = globals.directories.home;
in
{
  services.bsp-casefolding-workaround = {
    enable = true;
    watch_dirs = [
      "${homeDir}/.local/share/Steam/steamapps/common/Counter-Strike Source/cstrike/download"
    ];
  };
}
