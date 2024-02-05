{ pkgs, globals, host, ... }:


let
  swaylock = "${pkgs.swaylock-effects}/bin/swaylock";
  hyprctl = "${pkgs.hyprland}/bin/hyprctl";
in
{
  imports = [
    ./swaybg/home.nix
    ./swaylock/home.nix
    ./waybar/home.nix
    ./rofi/home.nix
    ./mako/home.nix
    ./grimblast/home.nix
    ./hyprshade/home.nix
  ];

  home.packages = with pkgs; [
    wl-clipboard
    pavucontrol
    networkmanagerapplet
    playerctl
    brightnessctl
    lxde.lxsession
  ];

  services = {
    swayidle = {
      enable = true;
      systemdTarget = "hyprland-session.target";
      timeouts = [
        {
          timeout = 3600; # 3600 seconds = 1 hour
          command = swaylock;
        }
        {
          timeout = 3600; # 3600 seconds = 1 hour
          command = "${hyprctl} dispatch dpms off";
          resumeCommand = "${hyprctl} dispatch dpms on";
        }
      ];
      events = [
        { event = "before-sleep"; command = swaylock; }
        { event = "lock"; command = swaylock; }
      ];
    };
  };

  wayland.windowManager.hyprland =
    let
      wallpaper = globals.wallpaper;

      monitorCenter = host.monitors.center;
      monitorLeft = host.monitors.left;
      directories = host.directories;

      waybar = "${pkgs.waybar}/bin/waybar";
      lxpolkit = "${pkgs.lxde.lxsession}/bin/lxpolkit";
      swaybg = "${pkgs.swaybg}/bin/swaybg";
      xrandr = "${pkgs.xorg.xrandr}/bin/xrandr";
      nm-applet = "${pkgs.networkmanagerapplet}/bin/nm-applet";
      dropbox = "${pkgs.dropbox}/bin/dropbox";
      hyprshade = "${pkgs.hyprshade}/bin/hyprshade";
      grimblast = "${pkgs.grimblast}/bin/grimblast";
      firefox = "${pkgs.firefox}/bin/firefox";
      pcmanfm = "${pkgs.pcmanfm}/bin/pcmanfm";
      alacritty = "${pkgs.alacritty}/bin/alacritty";
      rofi = "${pkgs.rofi-wayland}/bin/rofi";
      nvim = "nvim"; # This is broken (nixvim): "${pkgs.neovim}/bin/nvim";
      btm = "${pkgs.bottom}/bin/btm";
      spotify = "${pkgs.spotify}/bin/spotify";

      wpctl = "${pkgs.wireplumber}/bin/wpctl";
      playerctl = "${pkgs.playerctl}/bin/playerctl";
      playerctld = "${pkgs.playerctl}/bin/playerctld";
      brightnessctl = "${pkgs.brightnessctl}/bin/brightnessctl";

      # Temporary exit script
      exit = "kill -9 $(pidof Hyprland)";

      colours_start = "0xff";
      mauve = "${colours_start}${globals.colours.mauve}";
      blue = "${colours_start}${globals.colours.blue}";
      overlay0 = "${colours_start}${globals.colours.overlay0}";
    in
    {
      enable = true;
      xwayland.enable = true;
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
          animation = "global, 1, 3, default"; # Speed up animations
        };

        group = {
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
          enable_swallow = true;
          swallow_regex = "^(Alacritty)$";
        };

        windowrulev2 = [
          "float, class:steam, title:Friends List"
          "float, class:steam, title:Steam Settings"
          "float, class:steam, title:Game Servers"
          "float, class:steam, title:Screenshot Manager"
          # https://github.com/hyprwm/Hyprland/issues/2661
          "stayfocused, title:^()$,class:^(steam)$" # Fix steam context menus
          "minsize 1 1, title:^()$,class:^(steam)$" # Fix steam context menus
          "idleinhibit fullscreen, class:Apprun, title:Dolphin" # Prevent Ishiiruka swayidle lock
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
          "${swaybg} --i ${wallpaper} -m fill"
          "${playerctld}"
          "${lxpolkit}"
          "${xrandr} --output ${monitorCenter} --primary" # Ensures that xwindows (especially steam games) use the center monitor
          "${nm-applet} --indicator"
          "${pcmanfm} --daemon-mode" # Run as dameon to prevent pcmanfm from opening slowly on first launch (bug)
          "${dropbox}"
          "while sleep 0.1; do ${wpctl} set-volume -l 1.0 @DEFAULT_AUDIO_SOURCE@ 100%; done" # Prevent microphone from being auto adjusted to lower than 100
          "mkdir -p ${directories}"
        ];

        "$mod" = "SUPER";

        bind = [
          # Applications
          "$mod, d, exec, ${rofi} -show drun"

          "$mod, return, exec, ${alacritty}"
          "$mod, w, exec, ${firefox}" # Web browser
          "$mod, e, exec, ${pcmanfm}" # File explorer
          "$mod, t, exec, ${alacritty} -e ${nvim}" # Text editor
          "$mod, s, exec, ${alacritty} -e ${btm} -b" # Process monitor
          "$mod, m, exec, ${spotify}" # Music player

          ", print, exec, ${hyprshade} off; ${grimblast} save output; ${hyprshade} auto" # Screenshot active monitor
          "SHIFT, print, exec, ${hyprshade} off; ${grimblast} --freeze save area; ${hyprshade} auto" # Screenshot manually selected area

          "$mod, bracketright, exec, ${hyprshade} on blue-light-filter"
          "$mod, bracketleft, exec, ${hyprshade} off"

          "$mod SHIFT, semicolon, exec, ${swaylock}"

          # Special
          "$mod, q, killactive"
          "$mod, f, fullscreen"

          # Temporary exit script instead of "$mod shift, e, exit" until this issue is fixed: https://github.com/hyprwm/Hyprland/issues/3558
          "$mod shift, e, exec, ${exit}"
          "$mod shift, r, exec, ${hyprctl} reload"

          "$mod shift, f, togglefloating"
          "$mod shift, s, togglesplit"

          "$mod, p, togglespecialworkspace"
          "$mod shift, minus, movetoworkspacesilent, special"
          "$mod, minus, movetoworkspacesilent, m+0"

          # Group
          "$mod shift, g, togglegroup"
          "$mod, g, lockactivegroup, toggle"
          "$mod, o, moveoutofgroup"

          "$mod, tab, changegroupactive, f"
          "$mod shift, tab, changegroupactive, b"
          "$mod, Next, changegroupactive, f"
          "$mod, Prior, changegroupactive, b"
          "$mod shift, Next, movegroupwindow, f"
          "$mod shift, Prior, movegroupwindow, b"

          # Could remove this by using movewindoworgroup instead of movewindow below, but it's currently buggy
          "$mod, Left, moveintogroup, l"
          "$mod, Right, moveintogroup, r"
          "$mod, Up, moveintogroup, u"
          "$mod, Down, moveintogroup, d"

          # General
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
          # Raise and lower volume (limit to 100%)
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
      # Virtual submap for passing keyboard into virtual machine - https://github.com/hyprwm/Hyprland/issues/501
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

        bind=$mod,v,submap,virtual
        submap=virtual

        bind=$mod,v,submap,reset
        submap=reset
      '';
    };
}
