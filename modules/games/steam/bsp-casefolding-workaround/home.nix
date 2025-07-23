{ globals, ... }:

let
  homeDir = globals.directories.home;
  steamDir = "${homeDir}/.local/share/Steam/steamapps/common";
in
{
  services.bsp-casefolding-workaround = {
    enable = true;
    watch_dirs = [
      "${steamDir}/Counter-Strike Source/cstrike/download"
      "${steamDir}/Team Fortress 2/tf/download"
    ];
  };
}
