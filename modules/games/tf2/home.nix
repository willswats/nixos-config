{ ... }:

{
  home.file.".steam/steam/steamapps/common/Team Fortress 2/tf/cfg/autoexec.cfg".text =
    ''
      # Binds
      bind mwheeldown +jump
      bind mwheelup +jump
      
      bind mouse5 +left
      bind mouse4 +right

      alias +chargejump "+jump; +attack2"
      alias -chargejump "-jump; -attack2"
      bind alt "+chargejump"

      bind / kill # the funny one

      # Other
      cl_yawspeed 230
      tf_use_min_viewmodels 1
      hud_fastswitch 1
    '';
}
