{ host, ... }:

let
  steamDir = host.directories.steamLibrary;
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
