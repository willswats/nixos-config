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

    bind x "say /noclip"
    bind c "say /specbot"
    bind v +voicerecord

    bind f1 "say /m"
    bind f2 "say /mrank"
    bind f3 "say /rank"
    bind f4 "say /nvgs"

    // -- SETTINGS --

    // Game
    cl_yawspeed 230

    host_writeconfig
  '';

  # Switch between reload and restart
  home.file.".steam/steam/steamapps/common/Counter-Strike Source/cstrike/cfg/movement_reload.cfg".text = ''
    bind r +reload; bind t +spray; bind / "exec movement_restart"
  '';
  home.file.".steam/steam/steamapps/common/Counter-Strike Source/cstrike/cfg/movement_restart.cfg".text = ''
    bind r sm_teleport; bind t "!say r"; bind / "exec movement_reload"
  '';

  # Hide and show chat
  home.file.".steam/steam/steamapps/common/Counter-Strike Source/cstrike/cfg/hide_chat.cfg".text = ''
    hud_saytext_time 0; bind = "exec show_chat"
  '';
  home.file.".steam/steam/steamapps/common/Counter-Strike Source/cstrike/cfg/show_chat.cfg".text = ''
    hud_saytext_time 100; bind = "exec hide_chat"
  '';
}
