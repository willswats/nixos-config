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

      # Binds
      bind mwheeldown +jump
      bind mwheelup +jump
        
      bind z voice_modenable_toggle
      bind c player_ping
      bind v +voicerecord

      bind alt noclip
      bind hash "exec nade"
 
      # Music
      snd_roundstart_volume 0
      snd_roundaction_volume 0
      snd_roundend_volume 0
      snd_mvp_volume 0.5
      snd_mapobjective_volume 0
      snd_tensecondwarning_volume 0.5
      snd_deathcamera_volume 0
      snd_mute_mvp_music_live_players true

      # Game
      mm_dedicated_search_maxping 100

      # Hud
      cl_hud_color 9

      # Item
      cl_sniper_auto_rezoom false
      viewmodel_presetpos 3 # Viewmodel Position Classic

      # Radar
      cl_radar_scale 0.25

      # Crosshair
      cl_crosshair_drawoutline 1
      cl_crosshair_dynamic_maxdist_splitratio 0.35
      cl_crosshair_dynamic_splitalpha_innermod 1
      cl_crosshair_dynamic_splitalpha_outermod 0.5
      cl_crosshair_dynamic_splitdist 7
      cl_crosshair_friendly_warning 0
      cl_crosshair_outlinethickness 1
      cl_crosshair_sniper_show_normal_inaccuracy 0
      cl_crosshair_sniper_width 1
      cl_crosshair_t 0
      cl_crosshairalpha 255
      cl_crosshaircolor 5
      cl_crosshaircolor_b 0
      cl_crosshaircolor_g 255
      cl_crosshaircolor_r 0
      cl_crosshairdot 0
      cl_crosshairgap -2
      cl_crosshairgap_useweaponvalue 0
      cl_crosshairsize 1.5
      cl_crosshairstyle 4
      cl_crosshairthickness 0.8
      cl_crosshairusealpha 1
      cl_fixedcrosshairgap -1

      host_writeconfig
    '';

  home.file.".steam/steam/steamapps/common/Counter-Strike Global Offensive/game/csgo/cfg/nade.cfg".text =
    ''
      sv_cheats 1; bot_kick; mp_warmup_end; mp_freezetime 0; mp_roundtime_defuse 60; sv_grenade_trajectory 1; sv_grenade_trajectory_time 10; sv_showimpacts 1; ammo_grenade_limit_total 5; sv_infinite_ammo 1;
      mp_buy_anywhere 1; mp_maxmoney 50000; mp_startmoney 50000; mp_buytime 9999; mp_restartgame 1; sv_grenade_trajectory_prac_pipreview true;
    '';
}
