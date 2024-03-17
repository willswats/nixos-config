{ inputs, pkgs, globals, host, ... }:

{
  imports = [
    ./hypridle/home.nix
    ./hyprlock/home.nix
    ./hyprshade/home.nix
    ./grimblast/home.nix
    ./waybar/home.nix
    ../wayland/rofi/home.nix
    ../wayland/mako/home.nix
  ];

  home.packages = with pkgs; [
    swaybg
    wl-clipboard
    networkmanagerapplet
    playerctl
    brightnessctl
    lxde.lxsession
    pavucontrol
  ];

  wayland.windowManager.hyprland =
    let
      wallpaper = globals.wallpaper;

      monitorCenter = host.monitors.center;
      monitorLeft = host.monitors.left;
      directoriesToCreate = host.directoriesToCreate;

      xrandr = "${pkgs.xorg.xrandr}/bin/xrandr";

      swaybg = "${pkgs.swaybg}/bin/swaybg";

      hyprctl = "${inputs.hyprland.packages.${pkgs.system}.hyprland}/bin/hyprctl";
      hypridle = "${inputs.hypridle.packages.${pkgs.system}.hypridle}/bin/hypridle";
      hyprlock = "${inputs.hyprlock.packages.${pkgs.system}.hyprlock}/bin/hyprlock";
      hyprshade = "${pkgs.hyprshade}/bin/hyprshade";

      rofi = "${pkgs.rofi-wayland}/bin/rofi";
      waybar = "${pkgs.waybar}/bin/waybar";

      firefox = "${pkgs.firefox}/bin/firefox";
      pavucontrol = "${pkgs.pavucontrol}/bin/pavucontrol";
      bitwarden = "${pkgs.bitwarden}/bin/bitwarden";
      pcmanfm = "${pkgs.pcmanfm}/bin/pcmanfm";
      spotify = "${pkgs.spotify}/bin/spotify";

      kitty = "${pkgs.kitty}/bin/kitty";
      yazi = "${pkgs.yazi}/bin/yazi";
      btm = "${pkgs.bottom}/bin/btm";
      bluetuith = "${pkgs.bluetuith}/bin/bluetuith";

      lxpolkit = "${pkgs.lxde.lxsession}/bin/lxpolkit";
      nmApplet = "${pkgs.networkmanagerapplet}/bin/nm-applet";
      mullvadGui = "${pkgs.mullvad-vpn}/bin/mullvad-gui";
      dropbox = "${pkgs.dropbox}/bin/dropbox";

      wpctl = "${pkgs.wireplumber}/bin/wpctl";
      playerctl = "${pkgs.playerctl}/bin/playerctl";
      playerctld = "${pkgs.playerctl}/bin/playerctld";
      brightnessctl = "${pkgs.brightnessctl}/bin/brightnessctl";

      mullvad = "${pkgs.mullvad-vpn}/bin/mullvad";
      mullvadToggle = pkgs.writeShellScript "mullvadToggle.sh" ''
        if ${mullvad} status | grep 'Connected'; then
        	 ${mullvad} disconnect
        else
        	${mullvad} connect
        fi
      '';

      grimblast = "${inputs.hyprland-contrib.packages.${pkgs.system}.grimblast}/bin/grimblast";
      grimblastSaveOutput = pkgs.writeShellScript "grimblastSaveOutput.sh" ''
        ${hyprshade} off
        ${grimblast} save output
        ${hyprshade} auto
      '';
      grimblastSaveArea = pkgs.writeShellScript "grimblastScreenshotArea.sh" ''
        ${hyprshade} off
        killall slurp # Prevent overlapping slurp windows
        ${grimblast} --freeze save area
        ${hyprshade} auto
      '';

      # Prevent microphone from being auto adjusted to lower than 100
      preventMicrophoneAutoAdjust = pkgs.writeShellScript "preventMicrophoneAutoAdjust.sh" ''
        while sleep 0.1; do ${wpctl} set-volume -l 1.0 @DEFAULT_AUDIO_SOURCE@ 100%; done
      '';

      coloursStart = "0xff";
      mauve = "${coloursStart}${globals.colours.mauve}";
      blue = "${coloursStart}${globals.colours.blue}";
      overlay0 = "${coloursStart}${globals.colours.overlay0}";
    in
    {
      enable = true;
      xwayland.enable = true;
      package = inputs.hyprland.packages.${pkgs.system}.hyprland;
      settings = {
        general = {
          gaps_in = 5;
          gaps_out = 10;
          border_size = 2;
          "col.active_border" = blue;
          "col.inactive_border" = overlay0;
          layout = "dwindle";
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

        gestures = {
          workspace_swipe = true;
        };

        animations = {
          animation = "global, 0"; # Disable animations
        };

        group = {
          insert_after_current = false;
          "col.border_active" = blue;
          "col.border_inactive" = overlay0;
          "col.border_locked_active" = mauve;
          "col.border_locked_inactive" = overlay0;
          groupbar = {
            font_size = 14;
            "col.active" = blue;
            "col.inactive" = overlay0;
            "col.locked_active" = mauve;
            "col.locked_inactive" = overlay0;
          };
        };

        misc = {
          # Fix Firefox flashing default hyprland wallpaper on resize (still occurs, but it's less noticeable)
          # https://github.com/hyprwm/Hyprland/issues/2817
          disable_hyprland_logo = true;
        };

        windowrulev2 = [
          "tile, class:ONLYOFFICE Desktop Editors" # Fix onlyoffice starting as float
          "float, class:steam, title:Friends List"
          "float, class:steam, title:Steam Settings"
          "float, class:steam, title:Game Servers"
          "float, class:steam, title:Screenshot Manager"
          "suppressevent maximize, class:steam" # Fix Steam maximizing certain windows (Friends List)
          "suppressevent maximize, class:firefox" # Fix Firefox maximizing certain windows (extensions)
        ];

        env = [
          "HYPRCURSOR_SIZE,32"
        ];

        workspace = [
          "${monitorLeft},1"
          "${monitorCenter},2"
          "${monitorCenter},3"
          "${monitorCenter},4"
          "${monitorCenter},5"
          "${monitorCenter},6"
          "${monitorCenter},7"
          "${monitorCenter},8"
          "${monitorCenter},9"
          "${monitorCenter},10"
        ];

        exec = [
          "killall .waybar-wrapped; ${waybar}"
          "${hyprshade} auto"
        ];

        exec-once = [
          # Wallpaper
          "${swaybg} --image ${wallpaper} --mode fill"
          # Daemons
          "${hypridle}"
          "${playerctld}"
          "${lxpolkit}"
          # Applets
          "${nmApplet} --indicator"
          "${mullvadGui}"
          "${pcmanfm} --daemon-mode" # Run as dameon to prevent pcmanfm from opening slowly on first launch (bug)
          "${dropbox}"
          # Misc
          "mkdir -p ${directoriesToCreate}"
          "${preventMicrophoneAutoAdjust}"
          "${xrandr} --output ${monitorCenter} --primary" # Ensures that xwindows (especially steam games) use the center monitor
        ];

        "$mod" = "SUPER";

        bind = [
          "$mod, d, exec, ${rofi} -show drun"

          "$mod, return, exec, ${kitty}"

          "$mod, w, exec, ${firefox}" # Web browser
          "$mod, a, exec, ${pavucontrol}" # Audio manager 
          "$mod, p, exec, ${bitwarden}" # Password manager
          "$mod, m, exec, ${spotify}" # Music player

          "$mod, e, exec, ${kitty} ${yazi}" # File explorer
          "$mod, t, exec, ${kitty} nvim" # Text editor (not specifying the binary as it doesn't load my config)
          "$mod, s, exec, ${kitty} ${btm} -b" # Process monitor
          "$mod, b, exec, ${kitty} ${bluetuith}" # Bluetooth manager

          ", print, exec, ${grimblastSaveOutput}" # Screenshot active monitor
          "SHIFT, print, exec, ${grimblastSaveArea}" # Screenshot manually selected area

          "$mod shift, b, exec, ${hyprshade} toggle blue-light-filter" # Toggle blue light filter
          "$mod shift, v, exec, ${mullvadToggle}" # Toggle VPN

          "$mod SHIFT, semicolon, exec, ${playerctl} --all-players pause; ${hyprlock}"

          "$mod, q, killactive"
          "$mod, f, fullscreen"

          "$mod shift, e, exec, ${hyprctl} dispatch exit"
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

          # Could remove this by using movewindoworgroup instead of movewindow below, however,
          # both are currently buggy, therefore, it's on a seperate key for now
          # https://github.com/hyprwm/Hyprland/issues/4205
          "$mod, Left, moveintogroup, l"
          "$mod, Right, moveintogroup, r"
          "$mod, Up, moveintogroup, u"
          "$mod, Down, moveintogroup, d"

          "$mod, space, cyclenext" # To select floating windows

          "$mod, h, movefocus, l"
          "$mod, l, movefocus, r"
          "$mod, k, movefocus, u"
          "$mod, j, movefocus, d"

          "$mod shift, h, movewindow, l"
          "$mod shift, l, movewindow, r"
          "$mod shift, k, movewindow, u"
          "$mod shift, j, movewindow, d"

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

          "$mod SHIFT, 1, movetoworkspace, 1"
          "$mod SHIFT, 2, movetoworkspace, 2"
          "$mod SHIFT, 3, movetoworkspace, 3"
          "$mod SHIFT, 4, movetoworkspace, 4"
          "$mod SHIFT, 5, movetoworkspace, 5"
          "$mod SHIFT, 6, movetoworkspace, 6"
          "$mod SHIFT, 7, movetoworkspace, 7"
          "$mod SHIFT, 8, movetoworkspace, 8"
          "$mod SHIFT, 9, movetoworkspace, 9"
          "$mod SHIFT, 0, movetoworkspace, 10"

          # Scroll through existing workspaces with mod + scroll
          "$mod, mouse_down, workspace, e+1"
          "$mod, mouse_up, workspace, e-1"

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
      # virtualmachine submap for passing keyboard into virtual machine - https://github.com/hyprwm/Hyprland/issues/501
      extraConfig = ''
        bind=$mod,r,submap,resize
        submap=resize
        binde=,h,resizeactive,10 0
        binde=,l,resizeactive,-10 0
        binde=,j,resizeactive,0 -10
        binde=,k,resizeactive,0 10

        bind=,escape,submap,reset 
        bind=$mod,r,submap,reset 
        submap=reset

        bind=$mod SHIFT,m,submap,virtualmachine
        submap=virtualmachine

        bind=$mod SHIFT,m,submap,reset
        submap=reset
      '';
    };
}
