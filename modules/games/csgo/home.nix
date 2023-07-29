{ ... }:
{

  home.file.".steam/steam/steamapps/common/Counter-Strike Global Offensive/csgo/cfg/autoexec.cfg".text = ''
    # Unbindings
    unbind k

    # Bindings
    bind mwheeldown +jump
    bind mwheelup +jump
    bind / "say !r"
    bindtoggle z voice_enable
    alias "+jumpthrow" "+jump;-attack"; alias "-jumpthrow" "-jump"; bind x "+jumpthrow"
    bind c player_ping
    bind v +voicerecord
    bind h slot12

    # Crosshair
    cl_crosshair_drawoutline "1"
    cl_crosshair_dynamic_maxdist_splitratio "0.0"
    cl_crosshair_dynamic_splitalpha_innermod "1"
    cl_crosshair_dynamic_splitalpha_outermod "0.300000"
    cl_crosshair_dynamic_splitdist "5"
    cl_crosshair_friendly_warning "1"
    cl_crosshair_outlinethickness "1"
    cl_crosshair_sniper_show_normal_inaccuracy "0"
    cl_crosshair_sniper_width "1"
    cl_crosshair_t "0"
    cl_crosshairalpha "255.000000"
    cl_crosshaircolor "5"
    cl_crosshaircolor_b "0"
    cl_crosshaircolor_g "255"
    cl_crosshaircolor_r "0"
    cl_crosshairdot "0"
    cl_crosshairgap "-2"
    cl_crosshairgap_useweaponvalue "0"
    cl_crosshairsize "1.5"
    cl_crosshairstyle "4"
    cl_crosshairthickness "0.5"
    cl_crosshairusealpha "1"
    cl_fixedcrosshairgap "-10"

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
