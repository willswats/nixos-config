{ ... }:

{
  home.file.".steam/steam/steamapps/common/Team Fortress 2/tf/cfg/autoexec.cfg".text =
    ''
      # Unbind defaults
      unbind k # voice chat
      unbind mwheelup
      unbind mwheeldown

      # Binds
      bind mwheeldown +jump
      bind mwheelup +jump      
      bind mouse5 +left
      bind mouse4 +right

      bind h "impulse 101; say !r"
      bind semicolon show_quest_log 

      bind [ kill
      bind ] explode
      bind alt noclip
      bind / "exec practice"

      # Crosshair
      cl_crosshair_red 0.000000
      cl_crosshair_green 255.000000
      cl_crosshair_blue 0.000000
      cl_crosshair_file crosshair7
      cl_crosshair_scale 19.029999

      
      # Sound
      tf_dingalingaling 1
      tf_dingalingaling_lasthit 1
      tf_sniper_fullcharge_bell 1

      # Viewmodel
      tf_use_min_viewmodels 1
      viewmodel_fov 70.000000

      # Game
      hud_fastswitch 1


      # Hints
      tf_find_a_match_hint_viewed 1
      tf_training_has_prompted_for_training 1
      cl_hud_playerclass_playermodel_showed_confirm_dialog 1

      # Other
      fov_desired 90.000000
      cl_yawspeed 230
      cl_spraydisable 0
      con_enable 1  

      host_writeconfig
    '';


  home.file.".steam/steam/steamapps/common/Team Fortress 2/tf/cfg/practice.cfg".text =
    ''
      sv_cheats 1; ent_fire team_round_timer disable
    '';
}
