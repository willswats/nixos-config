{ ... }:

{
  home.file.".steam/steam/steamapps/common/Counter-Strike Source/cstrike/cfg/autoexec.cfg".text = ''
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

    bind alt "say /noclip"
    bind v +voicerecord

    bind f1 "say /m"
    bind f2 "say /mrank"
    bind f3 "say /rank"
    bind f4 "say /nvgs"
    bind f5 "say /specbot"

    // -- SETTINGS --

    // Game
    cl_yawspeed 230

    host_writeconfig
  '';

  # Switch between reload and restart (numpad 1)
  home.file.".steam/steam/steamapps/common/Counter-Strike Source/cstrike/cfg/movement_reload.cfg".text = ''
    bind r +reload; bind t +spray; bind KP_END "exec movement_restart"
  '';
  home.file.".steam/steam/steamapps/common/Counter-Strike Source/cstrike/cfg/movement_restart.cfg".text = ''
    bind r sm_teleport; bind t "say /r"; bind KP_END "exec movement_reload"
  '';

  # Hide and show chat
  home.file.".steam/steam/steamapps/common/Counter-Strike Source/cstrike/cfg/hide_chat.cfg".text = ''
    hud_saytext_time 0; bind = "exec show_chat"
  '';
  home.file.".steam/steam/steamapps/common/Counter-Strike Source/cstrike/cfg/show_chat.cfg".text = ''
    hud_saytext_time 12; bind = "exec hide_chat"
  '';
}
