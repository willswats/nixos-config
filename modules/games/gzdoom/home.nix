{
  pkgs,
  globals,
  host,
  ...
}:

{
  home.packages = with pkgs; [ gzdoom ];

  xdg.configFile."gzdoom/gzdoom.ini" = {
    text =
      let
        homeDir = globals.directories.home;
        wadDirectory = "${host.directories.drive}/Games/Doom/WADs";

        player = ''
          autoaim=0
          classicflight=false
          color=40 cf 00
          colorset=0
          fov=120
          gender=male
          movebob=0.25
          name=Player
          neverswitchonpickup=false
          playerclass=Fighter
          skin=base
          stillbob=0
          team=255
          vertspread=false
          wbobfire=0
          wbobspeed=1
          wi_noautostartmap=false
        '';

        consoleVariables = ''
          addrocketexplosion=false
          adl_bank=14
          adl_custom_bank=
          adl_use_custom_bank=false
          allcheats=false
          am_backcolor=6c 54 40
          am_cdwallcolor=4c 38 20
          am_colorset=0
          am_customcolors=true
          am_drawmapback=1
          am_efwallcolor=66 55 55
          am_emptyspacemargin=0
          am_fdwallcolor=88 70 58
          am_followplayer=true
          am_gridcolor=8b 5a 2b
          am_interlevelcolor=ff 00 00
          am_intralevelcolor=00 00 ff
          am_linealpha=1
          am_linethickness=1
          am_lockedcolor=00 78 00
          am_map_secrets=1
          am_markcolor=2
          am_markfont=AMMNUMx
          am_notseencolor=6c 6c 6c
          am_ovcdwallcolor=00 88 44
          am_ovefwallcolor=00 88 44
          am_overlay=0
          am_ovfdwallcolor=00 88 44
          am_ovinterlevelcolor=ff ff 00
          am_ovlockedcolor=00 88 44
          am_ovotherwallscolor=00 88 44
          am_ovportalcolor=00 40 22
          am_ovsecretsectorcolor=00 ff ff
          am_ovsecretwallcolor=00 88 44
          am_ovspecialwallcolor=ff ff ff
          am_ovtelecolor=ff ff 00
          am_ovthingcolor=e8 88 00
          am_ovthingcolor_citem=e8 88 00
          am_ovthingcolor_friend=e8 88 00
          am_ovthingcolor_item=e8 88 00
          am_ovthingcolor_monster=e8 88 00
          am_ovthingcolor_ncmonster=e8 88 00
          am_ovunexploredsecretcolor=00 ff ff
          am_ovunseencolor=00 22 6e
          am_ovwallcolor=00 ff 00
          am_ovyourcolor=fc e8 d8
          am_portalcolor=40 40 40
          am_portaloverlay=true
          am_rotate=0
          am_secretsectorcolor=ff 00 ff
          am_secretwallcolor=00 00 00
          am_showcluster=false
          am_showepisode=false
          am_showgrid=false
          am_showitems=false
          am_showkeys=true
          am_showkeys_always=false
          am_showmaplabel=2
          am_showmonsters=true
          am_showsecrets=true
          am_showthingsprites=0
          am_showtime=true
          am_showtotaltime=false
          am_showtriggerlines=0
          am_specialwallcolor=ff ff ff
          am_textured=false
          am_thingcolor=fc fc fc
          am_thingcolor_citem=fc fc fc
          am_thingcolor_friend=fc fc fc
          am_thingcolor_item=fc fc fc
          am_thingcolor_monster=fc fc fc
          am_thingcolor_ncmonster=fc fc fc
          am_thingrenderstyles=true
          am_tswallcolor=88 88 88
          am_unexploredsecretcolor=ff 00 ff
          am_wallcolor=2c 18 08
          am_xhaircolor=80 80 80
          am_yourcolor=fc e8 d8
          am_zoomdir=0
          blood_fade_scalar=1
          chat_substitution=false
          chatmacro0=No
          chatmacro1=I'm ready to kick butt!
          chatmacro2=I'm OK.
          chatmacro3=I'm not looking too good!
          chatmacro4=Help!
          chatmacro5=You suck!
          chatmacro6=Next time, scumbag...
          chatmacro7=Come here!
          chatmacro8=I'll take care of it.
          chatmacro9=Yes
          cl_bbannounce=false
          cl_bloodsplats=true
          cl_bloodtype=0
          cl_custominvulmapcolor1=00 00 1a
          cl_custominvulmapcolor2=a6 a6 7a
          cl_customizeinvulmap=false
          cl_doautoaim=false
          cl_gfxlocalization=3
          cl_maxdecals=1024
          cl_missiledecals=true
          cl_nointros=false
          cl_pufftype=0
          cl_rockettrails=1
          cl_showmultikills=true
          cl_showsecretmessage=true
          cl_showsprees=true
          cl_spreaddecals=true
          classic_scaling_factor=1
          classic_scaling_pixelaspect=1.2000000476837158
          compatmode=0
          con_alpha=0.75
          con_centernotify=false
          con_midtime=3
          con_notablist=false
          con_notifytime=3
          con_pulsetext=false
          con_scale=0
          con_scaletext=0
          crosshair=1
          crosshaircolor=ff 00 00
          crosshairforce=false
          crosshairgrow=false
          crosshairhealth=2
          crosshairon=true
          crosshairscale=0.19999995827674866
          dehload=0
          dimamount=-1
          dimcolor=ff d7 00
          displaynametags=0
          dlg_musicvolume=1
          dlg_vgafont=false
          gl_aalines=false
          gl_bandedswlight=false
          gl_bloom=false
          gl_bloom_amount=1.399999976158142
          gl_brightfog=false
          gl_coronas=true
          gl_enhanced_nightvision=true
          gl_exposure_base=0.3499999940395355
          gl_exposure_min=0.3499999940395355
          gl_exposure_scale=1.2999999523162842
          gl_exposure_speed=0.05000000074505806
          gl_fogmode=2
          gl_fuzztype=0
          gl_interpolate_model_frames=true
          gl_light_models=true
          gl_lightadditivesurfaces=false
          gl_lightmode=1
          gl_menu_blur=-1
          gl_paltonemap_powtable=2
          gl_paltonemap_reverselookup=true
          gl_precache=false
          gl_scale_viewport=true
          gl_sclipfactor=1.7999999523162842
          gl_sclipthreshold=10
          gl_spriteclip=1
          gl_tonemap=0
          gl_weaponlight=8
          hud_althud=false
          hud_althud_forceinternal=false
          hud_althudscale=0
          hud_ammo_order=0
          hud_ammo_red=25
          hud_ammo_yellow=50
          hud_armor_green=100
          hud_armor_red=25
          hud_armor_yellow=50
          hud_aspectscale=true
          hud_berserk_health=true
          hud_health_green=100
          hud_health_red=25
          hud_health_yellow=50
          hud_oldscale=true
          hud_scale=0
          hud_scalefactor=1
          hud_showammo=0
          hud_showangles=false
          hud_showitems=false
          hud_showlag=0
          hud_showmonsters=true
          hud_showscore=false
          hud_showsecrets=true
          hud_showstats=false
          hud_showtime=0
          hud_showtimestat=0
          hud_showweapons=true
          hud_timecolor=5
          hudcolor_ltim=8
          hudcolor_statnames=6
          hudcolor_stats=3
          hudcolor_time=6
          hudcolor_titl=10
          hudcolor_ttim=5
          hudcolor_xyco=3
          inter_classic_scaling=true
          log_vgafont=false
          lookspring=true
          m_quickexit=false
          msg=0
          msg0color=11
          msg1color=5
          msg2color=2
          msg3color=3
          msg4color=3
          msgmidcolor=11
          msgmidcolor2=4
          nametagcolor=5
          nocheats=false
          opn_custom_bank=
          opn_use_custom_bank=false
          paletteflash=0
          pickup_fade_scalar=1
          r_deathcamera=false
          r_drawfuzz=1
          r_maxparticles=4000
          r_portal_recursions=4
          r_rail_smartspiral=false
          r_rail_spiralsparsity=1
          r_rail_trailsparsity=1
          r_skymode=2
          r_vanillatrans=0
          sb_cooperative_enable=true
          sb_cooperative_headingcolor=6
          sb_cooperative_otherplayercolor=2
          sb_cooperative_yourplayercolor=3
          sb_deathmatch_enable=true
          sb_deathmatch_headingcolor=6
          sb_deathmatch_otherplayercolor=2
          sb_deathmatch_yourplayercolor=3
          sb_teamdeathmatch_enable=true
          sb_teamdeathmatch_headingcolor=6
          screenblocks=11
          setslotstrict=true
          show_obituaries=true
          snd_menuvolume=0.6000000238418579
          snd_pitched=false
          st_oldouch=false
          st_scale=0
          transsouls=0.75
          ui_screenborder_classic_scaling=true
          uiscale=0
          underwater_fade_scalar=1
          vid_allowtrueultrawide=1
          vid_cursor=-
          vid_nopalsubstitutions=false
          wi_cleantextscale=false
          wi_percents=true
          wi_showtotaltime=true
          wipetype=1
        '';

        localServerInfo = ''
          compatflags=0
          compatflags2=0
          forcewater=false
          maxviewpitch=90
          sv_corpsequeuesize=64
          sv_disableautohealth=false
          sv_dropstyle=0
          sv_portal_recursions=4
          sv_smartaim=0
        '';

        bindings = ''
          1=slot 1
          2=slot 2
          3=slot 3
          4=slot 4
          5=slot 5
          6=slot 6
          7=slot 7
          8=slot 8
          9=slot 9
          0=slot 0
          -=sizedown
          Equals=sizeup
          Tab=togglemap
          W=+forward
          E=+use
          R=+reload
          LeftBracket=invprev
          RightBracket=invnext
          Enter=invuse
          Ctrl=+crouch
          A=+moveleft
          S=+back
          D=+moveright
          `=toggleconsole
          Shift=+speed
          Space=+jump
          F1=quicksave
          F4=quickload
          F12=screenshot
          Mouse1=+attack
          Mouse2=+altattack
          MWheelUp=weapprev
          MWheelDown=weapnext
          Pad_Back=menu_main
        '';

        automapBindings = ''
          0=am_gobig
          -=+am_zoomout
          Equals=+am_zoomin
          P=am_toggletexture
          F=am_togglefollow
          G=am_togglegrid
          C=am_clearmarks
          M=am_setmark
          UpArrow=+am_panup
          LeftArrow=+am_panleft
          RightArrow=+am_panight
          DownArrow=+am_pandown
          MWheelUp=am_zoom 1.2
          MWheelDown=am_zoom -1.2
        '';
      in
      ''
        # This file was generated by GZDoom <unknown version> on 2023-07-31 15:19:25
        # These are the directories to automatically search for IWADs.
        # Each directory should be on a separate line, preceded by Path=
        [IWADSearch.Directories]
        Path=.
        Path=$DOOMWADDIR
        Path=$HOME/.config/gzdoom
        Path=$HOME/.local/share/games/doom
        Path=/usr/local/share/doom
        Path=/usr/local/share/games/doom
        Path=/usr/share/doom
        Path=/usr/share/games/doom
        Path=${wadDirectory}

        # These are the directories to search for wads added with the -file
        # command line parameter, if they cannot be found with the path
        # as-is. Layout is the same as for IWADSearch.Directories
        [FileSearch.Directories]
        Path=$HOME/.config/gzdoom
        Path=$HOME/.local/share/games/doom
        Path=/usr/local/share/
        Path=/usr/local/share/doom
        Path=/usr/local/share/games/doom
        Path=/usr/share/doom
        Path=/usr/share/games/doom
        Path=$DOOMWADDIR

        # These are the directories to search for soundfonts that let listed in the menu.
        # Layout is the same as for IWADSearch.Directories
        [SoundfontSearch.Directories]
        Path=$HOME/.config/gzdoom/soundfonts
        Path=$HOME/.config/gzdoom/fm_banks
        Path=$HOME/.local/share/games/doom/soundfonts
        Path=$HOME/.local/share/games/doom/fm_banks
        Path=/usr/local/share/doom/soundfonts
        Path=/usr/local/share/doom/fm_banks
        Path=/usr/local/share/games/doom/soundfonts
        Path=/usr/local/share/games/doom/fm_banks
        Path=/usr/share/doom/soundfonts
        Path=/usr/share/doom/fm_banks
        Path=/usr/share/games/doom/soundfonts
        Path=/usr/share/games/doom/fm_banks

        # Files to automatically execute when running the corresponding game.
        # Each file should be on its own line, preceded by Path=

        [Doom.AutoExec]
        Path=${homeDir}/.config/gzdoom/autoexec.cfg

        [Heretic.AutoExec]
        Path=${homeDir}/.config/gzdoom/autoexec.cfg

        [Hexen.AutoExec]
        Path=${homeDir}/.config/gzdoom/autoexec.cfg

        [Strife.AutoExec]
        Path=${homeDir}/.config/gzdoom/autoexec.cfg

        [Chex.AutoExec]
        Path=${homeDir}/.config/gzdoom/autoexec.cfg

        # WAD files to always load. These are loaded after the IWAD but before
        # any files added with -file. Place each file on its own line, preceded
        # by Path=
        [Global.Autoload]

        # Wad files to automatically load depending on the game and IWAD you are
        # playing.  You may have have files that are loaded for all similar IWADs
        # (the game) and files that are only loaded for particular IWADs. For example,
        # any files listed under 'doom.Autoload' will be loaded for any version of Doom,
        # but files listed under 'doom.doom2.Autoload' will only load when you are
        # playing a Doom 2 based game (doom2.wad, tnt.wad or plutonia.wad), and files listed under
        # 'doom.doom2.commercial.Autoload' only when playing doom2.wad.

        [doom.Autoload]

        [doom.id.Autoload]

        [doom.id.doom2.Autoload]

        [doom.id.doom2.commercial.Autoload]

        [doom.id.doom2.commercial.french.Autoload]

        [doom.id.doom2.commercial.xbox.Autoload]

        [doom.id.doom2.unity.Autoload]

        [doom.id.doom2.bfg.Autoload]

        [doom.id.doom2.plutonia.Autoload]

        [doom.id.doom2.plutonia.unity.Autoload]

        [doom.id.doom2.tnt.Autoload]

        [doom.id.doom2.tnt.unity.Autoload]

        [doom.id.doom1.Autoload]

        [doom.id.doom1.registered.Autoload]

        [doom.id.doom1.ultimate.Autoload]

        [doom.id.doom1.ultimate.xbox.Autoload]

        [doom.id.wadsmoosh.Autoload]

        [doom.id.doom1.unity.Autoload]

        [doom.id.doom1.bfg.Autoload]

        [doom.freedoom.Autoload]

        [doom.freedoom.demo.Autoload]

        [doom.freedoom.phase1.Autoload]

        [doom.freedoom.phase2.Autoload]

        [doom.freedoom.freedm.Autoload]

        [heretic.Autoload]

        [heretic.heretic.Autoload]

        [heretic.shadow.Autoload]

        [blasphemer.Autoload]

        [hexen.Autoload]

        [hexen.deathkings.Autoload]

        [hexen.hexen.Autoload]

        [strife.Autoload]

        [strife.strife.Autoload]

        [strife.veteran.Autoload]

        [chex.Autoload]

        [chex.chex1.Autoload]

        [chex.chex3.Autoload]

        [urbanbrawl.Autoload]

        [hacx.Autoload]

        [hacx.hacx1.Autoload]

        [hacx.hacx2.Autoload]

        [harmony.Autoload]

        [square.Autoload]

        [square.squareware.Autoload]

        [square.square.Autoload]

        [delaweare.Autoload]

        [woolball.Autoload]

        [woolball.rotwb.Autoload]

        [LastRun]
        Version=223

        [GlobalSettings]
        I_FriendlyWindowTitle=1
        adl_chips_count=6
        adl_emulator_id=0
        adl_fullpan=true
        adl_run_at_pcm_rate=false
        adl_volume_model=0
        autoloadbrightmaps=false
        autoloadlights=false
        autoloadwidescreen=true
        autosavecount=4
        autosavenum=0
        chase_dist=90
        chase_height=-8
        cl_capfps=false
        cl_defaultconfiguration=0
        cl_noprediction=false
        cl_oldfreelooklimit=false
        cl_predict_lerpscale=0.05000000074505806
        cl_predict_lerpthreshold=2
        cl_predict_specials=true
        cl_run=true
        cl_scaleweaponfov=1
        cl_waitforsave=true
        con_4bitansi=false
        con_buffersize=-1
        con_ctrl_d=
        con_notifylines=4
        con_printansi=true
        defaultiwad=The Ultimate DOOM
        demo_compress=true
        developer=0
        disableautoload=false
        disableautosave=0
        enablescriptscreenshot=false
        fluid_chorus=false
        fluid_chorus_depth=8
        fluid_chorus_level=1
        fluid_chorus_speed=0.30000001192092896
        fluid_chorus_type=0
        fluid_chorus_voices=3
        fluid_gain=0.5
        fluid_interp=1
        fluid_lib=
        fluid_patchset=gzdoom
        fluid_reverb=false
        fluid_reverb_damping=0.23000000417232513
        fluid_reverb_level=0.5699999928474426
        fluid_reverb_roomsize=0.6100000143051147
        fluid_reverb_width=0.7599999904632568
        fluid_samplerate=0
        fluid_threads=1
        fluid_voices=128
        freelook=true
        gl_billboard_faces_camera=false
        gl_billboard_mode=0
        gl_billboard_particles=true
        gl_cachenodes=true
        gl_cachetime=0.6000000238418579
        gl_debug=false
        gl_debug_breakpoint=false
        gl_debug_level=0
        gl_distfog=70
        gl_dither_bpc=0
        gl_enhanced_nv_stealth=3
        gl_es=false
        gl_finishbeforeswap=false
        gl_fxaa=0
        gl_lens=false
        gl_lens_chromatic=1.1200000047683716
        gl_lens_k=-0.11999999731779099
        gl_lens_kcube=0.10000000149011612
        gl_light_particles=true
        gl_light_shadowmap=false
        gl_light_sprites=true
        gl_lights=true
        gl_mask_sprite_threshold=0.5
        gl_mask_threshold=0.5
        gl_mirror_envmap=true
        gl_multisample=1
        gl_multithread=true
        gl_no_skyclear=false
        gl_particles_style=2
        gl_pipeline_depth=0
        gl_plane_reflection=true
        gl_satformula=1
        gl_seamless=false
        gl_shadowmap_filter=1
        gl_shadowmap_quality=512
        gl_sort_textures=false
        gl_sprite_blend=false
        gl_ssao=0
        gl_ssao_portals=1
        gl_ssao_strength=0.699999988079071
        gl_texture_filter=0
        gl_texture_filter_anisotropic=16
        gl_texture_hqresize_maxinputsize=512
        gl_texture_hqresize_mt_height=4
        gl_texture_hqresize_mt_width=16
        gl_texture_hqresize_multithread=true
        gl_texture_hqresize_targets=15
        gl_texture_hqresizemode=0
        gl_texture_hqresizemult=1
        gl_usecolorblending=true
        gme_stereodepth=0
        gus_memsize=0
        gus_patchdir=
        i_discordrpc=false
        i_pauseinbackground=true
        i_soundinbackground=false
        inter_subtitles=false
        invertmouse=false
        invertmousex=false
        language=auto
        longsavemessages=false
        lookstrafe=false
        m_blockcontrollers=false
        m_cleanscale=false
        m_forward=1
        m_pitch=1
        m_sensitivity_x=1.0390625
        m_sensitivity_y=0.5
        m_show_backbutton=0
        m_showinputgrid=0
        m_side=2
        m_simpleoptions=true
        m_use_mouse=2
        m_yaw=1
        map_point_coordinates=true
        midi_config=
        midi_dmxgus=false
        midi_voices=32
        mod_autochip=false
        mod_autochip_scan_threshold=12
        mod_autochip_size_force=100
        mod_autochip_size_scan=500
        mod_dumb_mastervolume=1
        mod_interp=2
        mod_samplerate=0
        mod_volramp=2
        mouse_capturemode=1
        mus_calcgain=true
        mus_enabled=true
        mus_gainoffset=0
        mus_usereplaygain=false
        nointerscrollabort=false
        nomonsterinterpolation=false
        opl_core=0
        opl_fullpan=true
        opl_numchips=2
        opn_chips_count=8
        opn_emulator_id=0
        opn_fullpan=true
        opn_run_at_pcm_rate=false
        os_isanyof=true
        png_gamma=0
        png_level=5
        queryiwad=true
        quicksavenum=-1
        quicksaverotation=false
        quicksaverotationcount=4
        r_actorspriteshadow=1
        r_actorspriteshadowdist=1500
        r_blendmethod=false
        r_dynlights=true
        r_fakecontrast=1
        r_fullbrightignoresectorcolor=true
        r_fuzzscale=true
        r_line_distance_cull=0
        r_linearsky=false
        r_magfilter=false
        r_minfilter=true
        r_mipmap=true
        r_mirror_recursions=4
        r_models=true
        r_multithreaded=1
        r_noaccel=false
        r_quakeintensity=1
        r_skipmats=false
        r_sprite_distance_cull=0
        r_spriteadjust=2
        r_ticstability=true
        save_dir=
        save_formatted=false
        saveloadconfirmation=true
        savestatistics=0
        screenshot_dir=
        screenshot_quiet=false
        screenshot_type=png
        show_messages=true
        showendoom=1
        snd_aldevice=Default
        snd_alresampler=Default
        snd_backend=openal
        snd_buffersize=0
        snd_channels=128
        snd_efx=true
        snd_enabled=true
        snd_hrtf=-1
        snd_mastervolume=0.1
        snd_mididevice=-5
        snd_midiprecache=false
        snd_musicvolume=0.5
        snd_samplerate=0
        snd_sfxvolume=1
        snd_streambuffersize=64
        snd_waterreverb=true
        statfile=zdoomstat.txt
        storesavepic=true
        strictdecorate=false
        telezoom=true
        timidity_channel_pressure=false
        timidity_chorus=0
        timidity_config=gzdoom
        timidity_drum_effect=false
        timidity_drum_power=1
        timidity_key_adjust=0
        timidity_lpf_def=1
        timidity_min_sustain_time=5000
        timidity_modulation_envelope=true
        timidity_modulation_wheel=true
        timidity_overlap_voice_allow=true
        timidity_pan_delay=false
        timidity_portamento=true
        timidity_reverb=0
        timidity_reverb_level=0
        timidity_surround_chorus=false
        timidity_temper_control=true
        timidity_tempo_adjust=1
        turnspeedsprintfast=1280
        turnspeedsprintslow=320
        turnspeedwalkfast=640
        turnspeedwalkslow=320
        use_joystick=false
        use_mouse=true
        vid_activeinbackground=false
        vid_adapter=0
        vid_aspect=0
        vid_brightness=0
        vid_contrast=1
        vid_cropaspect=false
        vid_defheight=480
        vid_defwidth=640
        vid_fullscreen=true
        vid_gamma=1
        vid_hdr=false
        vid_maxfps=200
        vid_preferbackend=1
        vid_rendermode=4
        vid_saturation=1
        vid_scale_customheight=200
        vid_scale_custompixelaspect=1
        vid_scale_customwidth=320
        vid_scale_linear=false
        vid_scalefactor=1
        vid_scalemode=0
        vid_sdl_render_driver=
        vid_vsync=false
        vk_debug=false
        vk_debug_callstack=true
        vk_device=0
        vk_hdr=false
        vr_hunits_per_meter=41
        vr_ipd=0.06199999898672104
        vr_mode=0
        vr_screendist=0.800000011920929
        vr_swap_eyes=false
        wildmidi_config=
        wildmidi_enhanced_resampling=true
        wildmidi_reverb=false
        win_h=864
        win_maximized=false
        win_w=1536
        win_x=-1
        win_y=-1
        xbrz_centerdirectionbias=4
        xbrz_colorformat=0
        xbrz_dominantdirectionthreshold=3.5999999046325684
        xbrz_equalcolortolerance=30
        xbrz_luminanceweight=1
        xbrz_steepdirectionthreshold=2.200000047683716

        [Doom.Player]
        ${player}

        [Doom.ConsoleVariables]
        ${consoleVariables}

        [Doom.LocalServerInfo]
        ${localServerInfo}

        [Doom.Bindings]
        ${bindings}

        [Doom.AutomapBindings]
        ${automapBindings}

        [Hexen.Player]
        ${player}

        [Hexen.ConsoleVariables]
        ${consoleVariables}

        [Hexen.LocalServerInfo]
        ${localServerInfo}

        [Hexen.Bindings]
        ${bindings}

        [Hexen.AutomapBindings]
        ${automapBindings}

        [Heretic.Player]
        ${player}

        [Heretic.ConsoleVariables]
        ${consoleVariables}

        [Heretic.LocalServerInfo]
        ${localServerInfo}

        [Heretic.Bindings]
        ${bindings}

        [Heretic.AutomapBindings]
        ${automapBindings}
      '';
  };
}
