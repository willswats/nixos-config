{ ... }:

{
  home.file.".steam/steam/steamapps/common/Counter-Strike Source/cstrike/cfg/autoexec.cfg".text =
    ''
      echo "autoexec.cfg executed"

      # -- UNBIND DEFAULTS --

      unbind mwheelup
      unbind mwheeldown

      # -- BINDS --

      bind mwheeldown +jump
      bind mwheelup +jump
      bind mouse5 +left
      bind mouse4 +right

      bind z "say /specbot"
      bind x "say /noclip"
      bind c sm_teleport
      bind alt "say /r"
      bind ralt "say /nvgs"
      bind v +voicerecord

      # -- SETTINGS --

      # Game
      cl_yawspeed 230
      hud_saytext_time 0

 
      host_writeconfig
    '';
}
