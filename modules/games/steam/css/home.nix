{ ... }:

{
  home.file.".steam/steam/steamapps/common/Counter-Strike Source/cstrike/cfg/autoexec.cfg".text =
    ''
      echo "autoexec.cfg executed"

      # -- UNBIND DEFAULTS --

      unbind mwheelup
      unbind mwheeldown

      # -- BINDS --
      alias hidechat "hud_saytext_time 0; bind = showchat"
      alias showchat "hud_saytext_time 500; bind = hidechat"
      bind = showchat
      showchat

      bind mwheeldown +jump
      bind mwheelup +jump
      bind mouse5 +left
      bind mouse4 +right

      bind z "say /specbot"
      bind x "say /noclip"
      bind c "say /r"
      bind v +voicerecord
      bind alt sm_teleport
      bindtoggle - voice_enable

      bind g "say /nvgs"
      bind h "say /m"
      bind j "say /mrank"
      bind k "say /rank"

      bind f1 voice_menu_1
      bind f2 voice_menu_2
      bind f3 voice_menu_3

      # -- SETTINGS --

      # Game
      cl_yawspeed 230
 
      host_writeconfig
    '';
}
