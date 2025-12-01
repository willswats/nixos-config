{ pkgs
, globals
, host
, ...
}:

{
  imports = [
    ./hypridle/home.nix
    ./hyprlock/home.nix
    ./grimblast/home.nix
    ../wayland/greetd/home.nix
    ../wayland/scripts/home.nix
    ../wayland/waybar/home.nix
    ../wayland/rofi/home.nix
    ../wayland/mako/home.nix
    ../wayland/wlsunset/home.nix
    ../wayland/wlogout/home.nix
  ];

  home.packages = with pkgs; [
    # Utilities
    ## GUI
    waypaper
    pavucontrol
    ## CLI
    wl-clipboard
    wev
    swaybg
  ];

  services.network-manager-applet.enable = true;

  wayland.windowManager.hyprland =
    let
      wallpaper = pkgs.fetchurl {
        url = globals.wallpaper.url;
        hash = globals.wallpaper.hash;
      };

      monitorCenter = host.monitors.center;
      monitorLeft = host.monitors.left;

      xrandr = "${pkgs.xorg.xrandr}/bin/xrandr";

      swaybg = "${pkgs.swaybg}/bin/swaybg";

      hyprctl = "${pkgs.hyprland}/bin/hyprctl";

      rofi = "${pkgs.rofi}/bin/rofi";
      wlogout = "${pkgs.wlogout}/bin/wlogout";
      waybar = "${pkgs.waybar}/bin/waybar";
      hyprpicker = "${pkgs.hyprpicker}/bin/hyprpicker";

      firefox = "${pkgs.firefox}/bin/firefox";
      pavucontrol = "${pkgs.pavucontrol}/bin/pavucontrol";
      freetube = "${pkgs.freetube}/bin/freetube";
      youtube-music = "${pkgs.youtube-music}/bin/youtube-music";

      kitty = "${pkgs.kitty}/bin/kitty";
      yazi = "${pkgs.yazi}/bin/yazi";
      termusic = "${pkgs.termusic}/bin/termusic";
      btm = "${pkgs.bottom}/bin/btm";
      bluetuith = "${pkgs.bluetuith}/bin/bluetuith";
      nyaa = "${pkgs.nyaa}/bin/nyaa";
      grimblast = "${pkgs.grimblast}/bin/grimblast";

      lxpolkit = "${pkgs.lxsession}/bin/lxpolkit";
      rescrobbled = "${pkgs.rescrobbled}/bin/rescrobbled";
      mullvadGui = "${pkgs.mullvad-vpn}/bin/mullvad-gui";
      dropbox = "${pkgs.dropbox}/bin/dropbox";

      wpctl = "${pkgs.wireplumber}/bin/wpctl";
      playerctl = "${pkgs.playerctl}/bin/playerctl";
      playerctld = "${pkgs.playerctl}/bin/playerctld";
      brightnessctl = "${pkgs.brightnessctl}/bin/brightnessctl";

      coloursStart = "0xff";
      mauve = "${coloursStart}${globals.colours.mauve}";
      blue = "${coloursStart}${globals.colours.blue}";
      overlay0 = "${coloursStart}${globals.colours.overlay0}";
      crust = "${coloursStart}${globals.colours.crust}";
    in
    {
      enable = true;
      xwayland.enable = true;
      settings = {
        general = {
          gaps_in = 0;
          gaps_out = 0;
          border_size = 2;
          "col.active_border" = blue;
          "col.inactive_border" = overlay0;
          layout = "dwindle";
        };

        dwindle = {
          force_split = 2; # always split right or bottom
        };

        decoration = {
          rounding = 0;
          # Disable blur and shadow for battery life / performance
          blur.enabled = false;
          shadow.enabled = false;
        };

        monitor = [
          "${monitorCenter}, highrr, auto, 1"
        ];

        input = {
          kb_layout = "gb";
          accel_profile = "flat";
          touchpad = {
            natural_scroll = true;
            scroll_factor = 0.5;
          };
        };

        dwindle = {
          preserve_split = true;
        };

        animations = {
          enabled = false;
          animation = [
            # NAME,ONOFF,SPEED,CURVE[,STYLE]
            "global, 1, 3, default"
          ];
        };

        group = {
          insert_after_current = false;
          "col.border_active" = blue;
          "col.border_inactive" = overlay0;
          "col.border_locked_active" = mauve;
          "col.border_locked_inactive" = overlay0;
          groupbar = {
            font_size = 18;
            height = 18;
            gradients = true;
            gaps_in = 0;
            gaps_out = 0;
            text_offset = -1;
            "col.active" = blue;
            "col.inactive" = overlay0;
            "col.locked_active" = mauve;
            "col.locked_inactive" = overlay0;
          };
        };

        # Disable update messages and nag messages
        ecosystem = {
          no_update_news = true;
          no_donation_nag = false;
        };

        misc = {
          # Disable app not responding dialog
          enable_anr_dialog = false;
          # Fix Firefox flashing default hyprland wallpaper on resize (still occurs, but it's less noticeable)
          # https://github.com/hyprwm/Hyprland/issues/2817
          disable_hyprland_logo = true;
          background_color = crust;
        };

        windowrulev2 = [
          # Chatterino
          "opacity 0.9, class:com.chatterino."
          "noblur, class:com.chatterino."
          "float, class:com.chatterino."
          "size 400 600, class:com.chatterino."
          # Steam
          "float, class:steam"
          "tile, class:steam, title:^Steam$" # Strict regex check for only the "Steam" window
          "suppressevent maximize, class:steam" # Fix Steam maximizing certain windows (Friends List)
          # SteamTinkerLaunch
          "float, class:yad"
          # gamescope
          "float, class:gamescope"
          # pcmanfm
          "float, class:pcmanfm"
          # firefox
          "suppressevent maximize, class:firefox" # Fix firefox maximizing certain windows (extensions)
          # Godot
          "tile, class:Godot" # Fix Godot starting as float
          # MPV
          "suppressevent maximize, class:mpv" # Stop mpv from maximizing when adding a video
        ];

        # Disable hyprcursor as it doesn't make a difference for me and will require gsettings
        # to make it not go invisible on GTK (file dialog)
        cursor = {
          enable_hyprcursor = false;
        };

        workspace = [
          "1, monitor:${monitorLeft}"
          "2, monitor:${monitorCenter}"
          "3, monitor:${monitorCenter}"
          "4, monitor:${monitorCenter}"
          "5, monitor:${monitorCenter}"
          "6, monitor:${monitorCenter}"
          "7, monitor:${monitorCenter}"
          "8, monitor:${monitorCenter}"
          "9, monitor:${monitorCenter}"
          "10, monitor:${monitorCenter}"
        ];

        exec = [
          "killall .waybar-wrapped; ${waybar}"
        ];

        exec-once = [
          # Wallpaper
          "${swaybg} --image ${wallpaper} --mode fill"
          # Daemons
          "${playerctld}" # The home manager service doesn't seem to start playerctld
          "${lxpolkit}"
          "${rescrobbled}"
          # Applets
          "${mullvadGui}"
          "${dropbox}"
          # Misc
          "${xrandr} --output ${monitorCenter} --primary" # Ensures that xwindows (especially steam games) use the center monitor
        ];

        "$mod" = "SUPER";

        bind = [
          "$mod, d, exec, ${rofi} -show drun"

          "$mod, return, exec, ${kitty}"

          "$mod, w, exec, ${firefox}" # Web browser
          "$mod, a, exec, ${pavucontrol}" # Audio manager
          "$mod, v, exec, mpv" # Media player (not specifying the binary as it doesn't load plugins in the nix-store)
          "$mod shift, v, exec, ${freetube}" # Freetube
          "$mod shift, m, exec, ${youtube-music}" # Youtube Music

          "$mod, t, exec, ${kitty} $EDITOR" # Text editor
          "$mod, e, exec, ${kitty} ${yazi}" # File explorer
          "$mod, m, exec, ${kitty} ${termusic}" # Music player
          "$mod, s, exec, ${kitty} ${btm} -b" # Process monitor
          "$mod, b, exec, ${kitty} ${bluetuith}" # Bluetooth manager
          "$mod, n, exec, ${kitty} ${nyaa}" # Nyaa

          "$mod, p, exec, ${hyprpicker} -a" # Colour picker
          ", print, exec, ${grimblast} --notify copysave output" # Screenshot active monitor
          "shift, print, exec, killall slurp; ${grimblast} --notify --freeze copysave area" # Screenshot manually selected area - killall to prevent overlap

          "$mod, semicolon, exec, ${wlogout}"

          "$mod, q, killactive"
          "$mod, f, fullscreen"

          "$mod shift, r, exec, ${hyprctl} reload"

          "$mod shift, f, togglefloating"
          "$mod shift, s, togglesplit"

          "$mod, equal, togglespecialworkspace"
          "$mod shift, equal, movetoworkspacesilent, m+0"
          "$mod shift, minus, movetoworkspacesilent, special"

          "$mod shift, g, togglegroup"
          "$mod, g, lockactivegroup, toggle"
          "$mod, o, moveoutofgroup"

          "$mod, tab, changegroupactive, f"
          "$mod shift, tab, changegroupactive, b"
          "$mod, Next, changegroupactive, f"
          "$mod, Prior, changegroupactive, b"
          "$mod shift, Next, movegroupwindow, f"
          "$mod shift, Prior, movegroupwindow, b"

          "$mod, space, cyclenext" # To select floating windows

          "$mod, h, movefocus, l"
          "$mod, l, movefocus, r"
          "$mod, k, movefocus, u"
          "$mod, j, movefocus, d"

          "$mod shift, h, movewindoworgroup, l"
          "$mod shift, l, movewindoworgroup, r"
          "$mod shift, k, movewindoworgroup, u"
          "$mod shift, j, movewindoworgroup, d"

          "$mod, 1, workspace, 1"
          "$mod, 2, workspace, 2"
          "$mod, 3, workspace, 3"
          "$mod, 4, workspace, 4"
          "$mod, 5, workspace, 5"
          "$mod, 6, workspace, 6"
          "$mod, 7, workspace, 7"
          "$mod, 8, workspace, 8"
          "$mod, 9, workspace, 9"
          "$mod, 0, workspace, 10"

          "$mod shift, 1, movetoworkspace, 1"
          "$mod shift, 2, movetoworkspace, 2"
          "$mod shift, 3, movetoworkspace, 3"
          "$mod shift, 4, movetoworkspace, 4"
          "$mod shift, 5, movetoworkspace, 5"
          "$mod shift, 6, movetoworkspace, 6"
          "$mod shift, 7, movetoworkspace, 7"
          "$mod shift, 8, movetoworkspace, 8"
          "$mod shift, 9, movetoworkspace, 9"
          "$mod shift, 0, movetoworkspace, 10"

          # Mute volume and microphone
          ", XF86AudioMute, exec, ${wpctl} set-mute @DEFAULT_AUDIO_SINK@ toggle"
          ", XF86AudioMicMute, exec, ${wpctl} set-mute @DEFAULT_AUDIO_SOURCE@ toggle"

          # Setup play, pause, next and previous keys
          ", XF86AudioPlay, exec, ${playerctl} play-pause"
          ", XF86AudioPause, exec, ${playerctl} play-pause"
          ", XF86AudioNext, exec, ${playerctl} next"
          ", XF86AudioPrev, exec, ${playerctl} previous"
        ];

        binde = [
          # Raise and lower
          ", XF86AudioRaiseVolume, exec, ${wpctl} set-volume -l 1.0 @DEFAULT_AUDIO_SINK@ 5%+"
          ", XF86AudioLowerVolume, exec, ${wpctl} set-volume -l 1.0 @DEFAULT_AUDIO_SINK@ 5%-"

          # Set brightness
          ", XF86MonBrightnessUp, exec, ${brightnessctl} set +5%"
          ", XF86MonBrightnessDown, exec, ${brightnessctl} set 5%-"
        ];

        bindm = [
          # Move/resize windows with mod + LMB/RMB and dragging
          "$mod, mouse:272, movewindow"
          "$mod, mouse:273, resizewindow"
        ];
      };
      # virtual submap for passing keyboard into virtual machine - https://github.com/hyprwm/Hyprland/issues/501
      extraConfig = ''
        # Smart gaps - https://wiki.hyprland.org/Configuring/Workspace-Rules/#smart-gaps 
        workspace = w[tv1], gapsout:0, gapsin:0
        workspace = f[1], gapsout:0, gapsin:0
        windowrulev2 = bordersize 0, floating:0, onworkspace:w[tv1]
        windowrulev2 = rounding 0, floating:0, onworkspace:w[tv1]
        windowrulev2 = bordersize 0, floating:0, onworkspace:f[1]
        windowrulev2 = rounding 0, floating:0, onworkspace:f[1]

        bind=$mod,r,submap,resize
        submap=resize
        binde=,h,resizeactive,10 0
        binde=,l,resizeactive,-10 0
        binde=,j,resizeactive,0 -10
        binde=,k,resizeactive,0 10

        bind=,escape,submap,reset 
        bind=$mod,r,submap,reset 
        submap=reset

        bind=$mod,x,submap,virtual
        submap=virtual

        bind=$mod,x,submap,reset
        submap=reset
      '';
    };
}
