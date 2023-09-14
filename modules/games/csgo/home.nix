{ ... }:

{
  home.file.".steam/steam/steamapps/common/Counter-Strike Global Offensive/csgo/cfg/autoexec.cfg".text =
    ''
      # Unbindings
      unbind k

      # Bindings
      bind mwheeldown +jump
      bind mwheelup +jump
      bind mouse5 slot12
      bind mouse4 "say !r"
        
      bindtoggle z voice_enable
      alias "+jumpthrow" "+jump;-attack"; alias "-jumpthrow" "-jump"; bind x "+jumpthrow"
      bind c player_ping
      bind v +voicerecord

      bind alt noclip
      bind [ "sv_cheats 1; bot_kick; mp_warmup_end; mp_freezetime 0; mp_roundtime_defuse 60; sv_grenade_trajectory 1; sv_grenade_trajectory_time 10; sv_showimpacts 1; ammo_grenade_limit_total 5; sv_infinite_ammo 1;"
      bind ] "mp_buy_anywhere 1; mp_maxmoney 50000; mp_startmoney 50000; mp_buytime 9999; mp_restartgame 1;"

      # Crosshair
      cl_crosshair_drawoutline "1"
      cl_crosshair_dynamic_maxdist_splitratio "0.35"
      cl_crosshair_dynamic_splitalpha_innermod "1"
      cl_crosshair_dynamic_splitalpha_outermod "0.5"
      cl_crosshair_dynamic_splitdist "7"
      cl_crosshair_friendly_warning "1"
      cl_crosshair_outlinethickness "1"
      cl_crosshair_sniper_show_normal_inaccuracy "0"
      cl_crosshair_sniper_width "1"
      cl_crosshair_t "0"
      cl_crosshairalpha "255"
      cl_crosshaircolor "1"
      cl_crosshaircolor_b "50"
      cl_crosshaircolor_g "250"
      cl_crosshaircolor_r "50"
      cl_crosshairdot "0"
      cl_crosshairgap "-1"
      cl_crosshairgap_useweaponvalue "0"
      cl_crosshairsize "2"
      cl_crosshairstyle "4"
      cl_crosshairthickness "1"
      cl_crosshairusealpha "1"
      cl_fixedcrosshairgap "-1"

      # Viewmodel
      cl_viewmodel_shift_left_amt "1.5"
      cl_viewmodel_shift_right_amt "0.75"
      viewmodel_fov "68"
      viewmodel_offset_x "0.000000"
      viewmodel_offset_y "2.0"
      viewmodel_offset_z "-2.0"
      viewmodel_presetpos "0"
      viewmodel_recoil "1.0"
      cl_bob_lower_amt "21"
      cl_bobamt_lat "0.4"
      cl_bobamt_vert "0.25"
      cl_bobcycle "0.98"

      # Other Options
      gameinstructor_enable 0 
      cl_autowepswitch 0
      cl_radar_scale 0.25

      host_writeconfig
    '';
}
