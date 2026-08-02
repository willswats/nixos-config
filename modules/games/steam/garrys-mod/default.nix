{ host, pkgs, ... }:

let
  steamDir = host.directories.steamLibrary;

  autoexec = pkgs.writeText "garrysmod-autoexec.cfg" ''
    echo "autoexec.cfg executed"

    // -- UNBIND DEFAULTS --
    // Voice chat
    unbind k 

    // Noclip
    unbind v 

    // Change weapons
    unbind mwheelup
    unbind mwheeldown

    // -- BINDS --
    exec mouse_buttons_turn
    exec mwheel_jump
    exec movement_reload
    exec show_chat

    bindtoggle - voice_enable

    bind g +drop
    bind mouse3 mightyfootengaged

    bind f1 noclip

    bind v +voicerecord

    bind [ kill

    // -- SETTINGS --
    cl_yawspeed 230
    physgun_wheelspeed 50
    npc_citizen_auto_player_squad 0
    npc_citizen_auto_player_squad_allow_use 1

    host_writeconfig
  '';

  movement_reload = pkgs.writeText "garrysmod-movement_reload.cfg" ''
    bind r +reload; bind KP_END "exec movement_restart"
  '';

  movement_restart = pkgs.writeText "garrysmod-movement_restart.cfg" ''
    bind r "say !r"; bind KP_END "exec movement_reload"
  '';

  mwheel_jump = pkgs.writeText "garrysmod-mwheel_jump.cfg" ''
    bind mwheelup +jump; bind mwheeldown +jump; bind KP_DOWNARROW "exec mwheel_inv"
  '';

  mwheel_inv = pkgs.writeText "garrysmod-mwheel_inv.cfg" ''
    bind mwheelup invnext; bind mwheeldown invprev; bind KP_DOWNARROW "exec mwheel_jump"
  '';

  mouse_buttons_turn = pkgs.writeText "garrysmod-mouse_buttons_turn.cfg" ''
    bind mouse4 +left; bind mouse5 +right; bind KP_PGDN "exec mouse_buttons_lean"
  '';

  mouse_buttons_lean = pkgs.writeText "garrysmod-mouse_buttons_lean.cfg" ''
    bind mouse4 +leanleft; bind mouse5 +leanright; bind KP_PGDN "exec mouse_buttons_turn"
  '';

  hide_chat = pkgs.writeText "garrysmod-hide_chat.cfg" ''
    hud_saytext_time 0; bind = "exec show_chat"
  '';

  show_chat = pkgs.writeText "garrysmod-show_chat.cfg" ''
    hud_saytext_time 12; bind = "exec hide_chat"
  '';

  mkSymlink = target: linkPath:
    "L+ \"${linkPath}\" - - - - ${target}";
in
{
  systemd.tmpfiles.rules = [
    # Main autoexec
    (mkSymlink "${autoexec}" "${steamDir}/GarrysMod/garrysmod/cfg/autoexec.cfg")

    # Movement reload/restart
    (mkSymlink "${movement_reload}" "${steamDir}/GarrysMod/garrysmod/cfg/movement_reload.cfg")
    (mkSymlink "${movement_restart}" "${steamDir}/GarrysMod/garrysmod/cfg/movement_restart.cfg")

    # Mouse wheel jump/inventory
    (mkSymlink "${mwheel_jump}" "${steamDir}/GarrysMod/garrysmod/cfg/mwheel_jump.cfg")
    (mkSymlink "${mwheel_inv}" "${steamDir}/GarrysMod/garrysmod/cfg/mwheel_inv.cfg")

    # Mouse buttons turn/lean
    (mkSymlink "${mouse_buttons_turn}" "${steamDir}/GarrysMod/garrysmod/cfg/mouse_buttons_turn.cfg")
    (mkSymlink "${mouse_buttons_lean}" "${steamDir}/GarrysMod/garrysmod/cfg/mouse_buttons_lean.cfg")

    # Hide and show chat
    (mkSymlink "${hide_chat}" "${steamDir}/GarrysMod/garrysmod/cfg/hide_chat.cfg")
    (mkSymlink "${show_chat}" "${steamDir}/GarrysMod/garrysmod/cfg/show_chat.cfg")
  ];
}
