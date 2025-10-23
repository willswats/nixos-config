{ ... }:

{
  home.file.".steam/steam/steamapps/common/Team Fortress 2/tf/cfg/autoexec.cfg".text = ''
    echo "autoexec.cfg executed"

    // -- UNBIND DEFAULTS --

    // Voice menu 1
    unbind z

    // Voice chat
    unbind k 

    // Change weapons
    unbind mwheelup
    unbind mwheeldown

    // -- BINDS --
    exec movement_reload
    exec show_chat

    bindtoggle - voice_enable

    bind mwheeldown +jump
    bind mwheelup +jump      
    bind mouse4 +left
    bind mouse5 +right

    alias +chargejump "+jump; +attack2"
    alias -chargejump "-jump; -attack2"

    bind x noclip
    bind c "+chargejump"
    bind v +voicerecord

    bind [ kill
    bind ] explode
    bind . "exec practice"

    bind f1 voice_menu_1
    bind f2 voice_menu_2
    bind f3 voice_menu_3

    // -- SETTINGS --

    // Quick switch loadout
    bind leftarrow "load_itempreset 0"
    bind uparrow "load_itempreset 1"
    bind downarrow "load_itempreset 2"
    bind rightarrow "load_itempreset 3"

    // Game
    cl_yawspeed 230
    fov_desired 90.000000
    cl_autorezoom 0 # Disable autorezoom sniper

    // Crosshair
    cl_crosshair_red 0.000000
    cl_crosshair_green 255.000000
    cl_crosshair_blue 0.000000
    cl_crosshair_file crosshair7
    cl_crosshair_scale 19.029999

    // Sound
    tf_dingalingaling 1
    tf_dingaling_volume "0.490000"
    tf_dingaling_pitchmindmg "128.259995"
    tf_dingaling_pitchmaxdmg "28.500000"
    tf_dingalingaling_lasthit 1
    tf_dingaling_lasthit_volume "0.490000"
    tf_dingaling_lasthit_pitchmindmg "128.529999"
    tf_dingaling_lasthit_pitchmaxdmg "27.570000"         
    tf_sniper_fullcharge_bell 1

    // Viewmodel
    tf_use_min_viewmodels 1
    viewmodel_fov 70.000000

    // Hud
    hud_fastswitch 1
    hud_combattext_batching 1
    hud_combattext_red 255.000000
    hud_combattext_green 1.000000
    hud_combattext_blue 1.000000
    tf_scoreboard_ping_as_text "1"

    // Hints
    tf_find_a_match_hint_viewed 1
    tf_training_has_prompted_for_training 1
    tf_training_has_prompted_for_offline_practice 1
    tf_training_has_prompted_for_forums 1
    tf_training_has_prompted_for_options 1
    tf_training_has_prompted_for_loadout 1
    tf_show_preset_explanation_in_class_loadout 0
    tf_show_taunt_explanation_in_class_loadout 0
    tf_explanations_store 1
    tf_explanations_charinfopanel 1
    cl_hud_playerclass_playermodel_showed_confirm_dialog 1

    // Other
    con_enable 1  
    cl_spraydisable 0
    cl_disablehtmlmotd 1

    host_writeconfig
  '';

  # Practice commands
  home.file.".steam/steam/steamapps/common/Team Fortress 2/tf/cfg/practice.cfg".text = ''
    sv_cheats 1; buddha; ent_fire team_round_timer disable; sv_allow_point_servercommand always; mp_teams_unbalance_limit 0
  '';

  # Switch between reload and restart
  home.file.".steam/steam/steamapps/common/Team Fortress 2/tf/cfg/movement_reload.cfg".text = ''
    bind r +reload; bind / "exec movement_restart"
  '';
  home.file.".steam/steam/steamapps/common/Team Fortress 2/tf/cfg/movement_restart.cfg".text = ''
    bind r "say !r"; bind / "exec movement_reload"
  '';

  # Hide and show chat
  home.file.".steam/steam/steamapps/common/Team Fortress 2/tf/cfg/hide_chat.cfg".text = ''
    hud_saytext_time 0; bind = "exec show_chat"
  '';
  home.file.".steam/steam/steamapps/common/Team Fortress 2/tf/cfg/show_chat.cfg".text = ''
    hud_saytext_time 100; bind = "exec hide_chat"
  '';
}
