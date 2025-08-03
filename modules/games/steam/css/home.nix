{ ... }:

{
  home.file.".steam/steam/steamapps/common/Counter-Strike Source/cstrike/cfg/autoexec.cfg".text = ''
    echo "autoexec.cfg executed"

    // -- UNBIND DEFAULTS --

    unbind mwheelup
    unbind mwheeldown

    // -- BINDS --
    alias hidechat "hud_saytext_time 0; bind = showchat"
    alias showchat "hud_saytext_time 500; bind = hidechat"
    bind = showchat
    showchat

    bind mwheeldown +jump
    bind mwheelup +jump

    bind q +left
    bind e +right
    bind f +use

    bind mouse4 "impulse 100"

    bind z "say /specbot"
    bind x "say /noclip"
    bind c "say /r"
    bind v +voicerecord

    bind alt sm_teleport
    bindtoggle - voice_enable

    bind f1 "say /m"
    bind f2 "say /mrank"
    bind f3 "say /rank"
    bind f4 "say /nvgs"

    // -- SETTINGS --

    // Game
    cl_yawspeed 230

    host_writeconfig
  '';
}
