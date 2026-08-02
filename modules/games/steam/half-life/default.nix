{ host, pkgs, ... }:

let
  halfLifeDirectory = "${host.directories.steamLibrary}/Half-Life";

  userconfig = pkgs.writeText "half-life-userconfig.cfg" ''
    bind mwheelup +jump
    bind mwheeldown +jump
    bind space +jump
      
    bind F1 "save quick"
    bind F4 "load quick"

    default_fov 110
    fps_override 1
    fps_max 300
  '';

  mkSymlink = target: linkPath:
    "L+ \"${linkPath}\" - - - - ${target}";
in
{
  systemd.tmpfiles.rules = [
    (mkSymlink "${userconfig}" "${halfLifeDirectory}/valve/userconfig.cfg")
    (mkSymlink "${userconfig}" "${halfLifeDirectory}/gearbox/userconfig.cfg")
    (mkSymlink "${userconfig}" "${halfLifeDirectory}/bshift/userconfig.cfg")
  ];
}
