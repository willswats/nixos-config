{ host, ... }:

let
  halfLifeDirectory = "${host.directories.steamLibrary}/Half-Life";

  config = ''
    bind mwheelup +jump
    bind mwheeldown +jump
    bind space +jump
      
    bind F1 "save quick"
    bind F4 "load quick"

    default_fov 110
    fps_override 1
    fps_max 300
  '';
in
{
  environment.etc."${halfLifeDirectory}/valve/userconfig.cfg".text = config;
  environment.etc."${halfLifeDirectory}/gearbox/userconfig.cfg".text = config;
  environment.etc."${halfLifeDirectory}/bshift/userconfig.cfg".text = config;
}
