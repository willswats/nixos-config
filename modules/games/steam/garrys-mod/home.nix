{ ... }:

{
  home.file.".steam/steam/steamapps/common/GarrysMod/garrysmod/cfg/autoexec.cfg".text = ''
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

    bind x noclip
    bind v +voicerecord

    bind [ kill

    // -- SETTINGS --
    cl_yawspeed 230
    physgun_wheelspeed 50
    npc_citizen_auto_player_squad 0
    npc_citizen_auto_player_squad_allow_use 1
    vmanip_kick_bind mouse3

    host_writeconfig
  '';

  # Switch between reload and restart (numpad 1)
  home.file.".steam/steam/steamapps/common/GarrysMod/garrysmod/cfg/movement_reload.cfg".text = ''
    bind r +reload; bind KP_END "exec movement_restart"
  '';
  home.file.".steam/steam/steamapps/common/GarrysMod/garrysmod/cfg/movement_restart.cfg".text = ''
    bind r "say !r"; bind KP_END "exec movement_reload"
  '';

  # Switch between mwheel jump and mwheel scroll inv (numpad 2)
  home.file.".steam/steam/steamapps/common/GarrysMod/garrysmod/cfg/mwheel_jump.cfg".text = ''
    bind mwheelup +jump; bind mwheeldown +jump; bind KP_DOWNARROW "exec mwheel_inv"
  '';
  home.file.".steam/steam/steamapps/common/GarrysMod/garrysmod/cfg/mwheel_inv.cfg".text = ''
    bind mwheelup invnext; bind mwheeldown invprev; bind KP_DOWNARROW "exec mwheel_jump"
  '';

  # Switch between lean and turn binds (numpad 3)
  home.file.".steam/steam/steamapps/common/GarrysMod/garrysmod/cfg/mouse_buttons_turn.cfg".text = ''
    bind mouse4 +left; bind mouse5 +right; bind KP_PGDN "exec mouse_buttons_lean"
  '';
  home.file.".steam/steam/steamapps/common/GarrysMod/garrysmod/cfg/mouse_buttons_lean.cfg".text = ''
    bind mouse4 +leanleft; bind mouse5 +leanright; bind KP_PGDN "exec mouse_buttons_turn"
  '';

  # Hide and show chat
  home.file.".steam/steam/steamapps/common/GarrysMod/garrysmod/cfg/hide_chat.cfg".text = ''
    hud_saytext_time 0; bind = "exec show_chat"
  '';
  home.file.".steam/steam/steamapps/common/GarrysMod/garrysmod/cfg/show_chat.cfg".text = ''
    hud_saytext_time 100; bind = "exec hide_chat"
  '';
}
