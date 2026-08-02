{ host, pkgs, ... }:

let
  steamDir = host.directories.steamLibrary;

  autoexec = pkgs.writeText "css-autoexec.cfg" ''
    echo "autoexec.cfg executed"

    // -- UNBIND DEFAULTS --

    unbind mwheelup
    unbind mwheeldown

    // -- BINDS --
    exec movement_restart
    exec show_chat

    bindtoggle - voice_enable

    bind mwheeldown +jump
    bind mwheelup +jump
    bind mouse4 +left
    bind mouse5 +right

    bind v +voicerecord

    bind f1 "say /noclip"
    bind f2 "say /specbot"
    bind f3 "say /m"
    bind f4 "say /mrank"
    bind f5 "say /rank"
    bind f6 "say /nvgs"

    // -- SETTINGS --

    // Game
    cl_yawspeed 230

    host_writeconfig
  '';

  movement_reload = pkgs.writeText "css-movement_reload.cfg" ''
    bind r +reload; bind t +spray; bind KP_END "exec movement_restart"
  '';

  movement_restart = pkgs.writeText "css-movement_restart.cfg" ''
    bind r sm_teleport; bind t "say /r"; bind KP_END "exec movement_reload"
  '';

  hide_chat = pkgs.writeText "css-hide_chat.cfg" ''
    hud_saytext_time 0; bind = "exec show_chat"
  '';

  show_chat = pkgs.writeText "css-show_chat.cfg" ''
    hud_saytext_time 12; bind = "exec hide_chat"
  '';

  mkSymlink = target: linkPath:
    "L+ \"${linkPath}\" - - - - ${target}";

in
{
  systemd.tmpfiles.rules = [
    # Main autoexec
    (mkSymlink "${autoexec}" "${steamDir}/Counter-Strike Source/cstrike/cfg/autoexec.cfg")

    # Movement reload/restart
    (mkSymlink "${movement_reload}" "${steamDir}/Counter-Strike Source/cstrike/cfg/movement_reload.cfg")
    (mkSymlink "${movement_restart}" "${steamDir}/Counter-Strike Source/cstrike/cfg/movement_restart.cfg")

    # Hide and show chat
    (mkSymlink "${hide_chat}" "${steamDir}/Counter-Strike Source/cstrike/cfg/hide_chat.cfg")
    (mkSymlink "${show_chat}" "${steamDir}/Counter-Strike Source/cstrike/cfg/show_chat.cfg")
  ];
}
