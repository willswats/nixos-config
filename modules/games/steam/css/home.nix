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

      bind [ "say /noclip"
      bind ] "say /specbot"
      bind alt "say /r"
      bind ralt sm_teleport

      # -- SETTINGS --

      # Game
      cl_yawspeed 230
 
      host_writeconfig
    '';
}
