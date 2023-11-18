{ ... }:

let
  halfLifeDirectory = ".local/share/Steam/steamapps/common/Half-Life";

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
  home.file."${halfLifeDirectory}/valve/userconfig.cfg" = {
    text = config;
  };

  home.file."${halfLifeDirectory}/gearbox/userconfig.cfg" = {
    text = config;
  };

  home.file."${halfLifeDirectory}/bshift/userconfig.cfg" = {
    text = config;
  };
}
