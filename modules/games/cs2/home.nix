{ ... }:

{
  home.file.".steam/steam/steamapps/common/Counter-Strike Global Offensive/game/csgo/cfg/autoexec.cfg".text =
    ''
      # Unbind defaults
      unbind z # Radio Message
      unbind c # Chat Wheel 1
      unbind v # Chat Wheel 2
      unbind mouse3 # Player Ping
      unbind mouse4 # Use Mic
      unbind mwheelup
      unbind mwheeldown

      # Binds
      bind mwheeldown +jump
      bind mwheelup +jump
      bind mouse5 +turnleft
      bind mouse4 +turnright
        
      bind c player_ping
      bind v +voicerecord
      bind semicolon "say !r"
      bind - voice_modenable_toggle

      bind alt noclip      
      bind / "exec nade"
 
      # Music
      snd_menumusic_volume 0
      snd_roundstart_volume 0
      snd_roundaction_volume 0
      snd_roundend_volume 0
      snd_mvp_volume 0.5
      snd_mapobjective_volume 0
      snd_tensecondwarning_volume 0.5
      snd_deathcamera_volume 0
      snd_mute_mvp_music_live_players true

      # Game
      con_enable true
      mm_dedicated_search_maxping 50

      # Hud
      cl_hud_color 9

      # Radar
      cl_radar_scale 0.25

      # Viewmodel
      viewmodel_fov	68
      viewmodel_offset_x 0
      viewmodel_offset_y 2
      viewmodel_offset_z -2
      viewmodel_presetpos	0

      # Crosshair
      cl_crosshair_recoil false
      cl_crosshair_friendly_warning 0
      cl_crosshair_drawoutline 1
      cl_crosshair_dynamic_maxdist_splitratio 0.3
      cl_crosshair_dynamic_splitalpha_innermod 1
      cl_crosshair_dynamic_splitalpha_outermod 0.5
      cl_crosshair_dynamic_splitdist 7
      cl_crosshair_outlinethickness 1
      cl_crosshair_sniper_show_normal_inaccuracy 0
      cl_crosshair_sniper_width 1
      cl_crosshair_t 0
      cl_crosshairalpha 255
      cl_crosshaircolor 1
      cl_crosshaircolor_r 0
      cl_crosshaircolor_g 255
      cl_crosshaircolor_b 0
      cl_crosshairdot 0
      cl_crosshairgap -3
      cl_crosshairgap_useweaponvalue 0
      cl_crosshairsize 1.5
      cl_crosshairstyle 4
      cl_crosshairthickness 0.5
      cl_crosshairusealpha 1
      cl_fixedcrosshairgap -4.5

      host_writeconfig
    '';

  home.file.".steam/steam/steamapps/common/Counter-Strike Global Offensive/game/csgo/cfg/nade.cfg".text =
    ''
      sv_cheats 1; bot_kick; mp_warmup_end; mp_freezetime 0; mp_roundtime_defuse 60; sv_grenade_trajectory 1; sv_grenade_trajectory_time 10; sv_showimpacts 1; ammo_grenade_limit_total 5; sv_infinite_ammo 1;
      mp_buy_anywhere 1; mp_maxmoney 50000; mp_startmoney 50000; mp_buytime 9999; mp_restartgame 1; sv_grenade_trajectory_prac_pipreview true;
    '';
}
