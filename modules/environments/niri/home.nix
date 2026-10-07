{ pkgs
, host
, globals
, ...
}:

{
  imports = [
    ../sway/swayidle/home.nix
    ../sway/swaylock/home.nix
    ../wayland/greetd/home.nix
    ../wayland/scripts/home.nix
    ../wayland/waybar/home.nix
    ../wayland/rofi/home.nix
    ../wayland/mako/home.nix
    ../wayland/wlsunset/home.nix
    ../wayland/wlogout/home.nix
  ];

  wayland.windowManager.niri = {
    enable = true;
    settings =
      let
        mod = "Mod";
        wallpaper = pkgs.fetchurl {
          url = globals.wallpaper.url;
          hash = globals.wallpaper.hash;
        };
        monitorCenter = host.monitors.center;

        xrandr = "${pkgs.xrandr}/bin/xrandr";
        rofi = "${pkgs.rofi}/bin/rofi";
        wlogout = "${pkgs.wlogout}/bin/wlogout";
        hyprpicker = "${pkgs.hyprpicker}/bin/hyprpicker";
        firefox = "${pkgs.firefox}/bin/firefox";
        pavucontrol = "${pkgs.pavucontrol}/bin/pavucontrol";
        freetube = "${pkgs.freetube}/bin/freetube";
        pear-desktop = "${pkgs.pear-desktop}/bin/pear-desktop";
        kitty = "${pkgs.kitty}/bin/kitty";
        yazi = "${pkgs.yazi}/bin/yazi";
        cantata = "${pkgs.cantata}/bin/cantata";
        btm = "${pkgs.bottom}/bin/btm";
        bluetuith = "${pkgs.bluetuith}/bin/bluetuith";
        equibop = "${pkgs.equibop}/bin/equibop";
        lxpolkit = "${pkgs.lxsession}/bin/lxpolkit";
        turntable = "${pkgs.turntable}/bin/dev.geopjr.Turntable";
        wlsunset = "${pkgs.wlsunset}/bin/wlsunset";
        dropbox = "${pkgs.dropbox}/bin/dropbox";
        easyEffects = "${pkgs.easyeffects}/bin/easyeffects";
        wpctl = "${pkgs.wireplumber}/bin/wpctl";
        playerctl = "${pkgs.playerctl}/bin/playerctl";
        playerctld = "${pkgs.playerctl}/bin/playerctld";
        brightnessctl = "${pkgs.brightnessctl}/bin/brightnessctl";
        waybar = "${pkgs.waybar}/bin/waybar";
        swaybg = "${pkgs.swaybg}/bin/swaybg";

        base = "#${globals.colours.base}";
        blue = "#${globals.colours.blue}";
        overlay0 = "#${globals.colours.overlay0}";
      in
      {
        input = {
          keyboard.xkb.layout = "gb";
          touchpad = {
            natural-scroll = { };
            scroll-factor = 0.5;
            tap = { };
            accel-profile = "flat";
          };
        };

        output = {
          _args = [ "${monitorCenter}" ];
          mode = "1920x1080@144";
          scale = 1;
        };

        overview = {
          backdrop-color = "${base}";
        };

        gestures = {
          hot-corners = { };
        };

        layout = {
          gaps = 0;
          border = {
            off = { };
            width = 2;
            active-color = blue;
            inactive-color = overlay0;
          };
          focus-ring = {
            width = 2;
            active-color = blue;
            inactive-color = overlay0;
          };

          default-column-width = { proportion = 0.5; };
          preset-column-widths._children = [
            { proportion = 0.33333; }
            { proportion = 0.5; }
            { proportion = 0.66667; }
            { proportion = 1.0; }
          ];
          preset-window-heights._children = [
            { proportion = 0.33333; }
            { proportion = 0.5; }
            { proportion = 0.66667; }
            { proportion = 1.0; }
          ];
        };


        screenshot-path = "~/Pictures/Screenshot from %Y-%m-%d %H-%M-%S.png";
        hotkey-overlay.skip-at-startup = { };

        prefer-no-csd = { };
        # animations.off = { };

        binds = {
          # Volume
          "XF86AudioRaiseVolume" = {
            _props.allow-when-locked = true;
            spawn = [ wpctl "set-volume" "-l" "1.0" "@DEFAULT_AUDIO_SINK@" "5%+" ];
          };
          "XF86AudioLowerVolume" = {
            _props.allow-when-locked = true;
            spawn = [ wpctl "set-volume" "-l" "1.0" "@DEFAULT_AUDIO_SINK@" "5%-" ];
          };
          "XF86AudioMute" = {
            _props.allow-when-locked = true;
            spawn = [ wpctl "set-mute" "@DEFAULT_AUDIO_SINK@" "toggle" ];
          };
          "XF86AudioMicMute" = {
            _props.allow-when-locked = true;
            spawn = [ wpctl "set-mute" "@DEFAULT_AUDIO_SOURCE@" "toggle" ];
          };
          "XF86Tools" = {
            _props.allow-when-locked = true;
            spawn = [ wpctl "set-mute" "@DEFAULT_AUDIO_SOURCE@" "toggle" ];
          };

          # Media
          "XF86AudioPlay" = {
            _props.allow-when-locked = true;
            spawn = [ playerctl "play-pause" ];
          };
          "XF86AudioPause" = {
            _props.allow-when-locked = true;
            spawn = [ playerctl "play-pause" ];
          };
          "XF86AudioNext" = {
            _props.allow-when-locked = true;
            spawn = [ playerctl "next" ];
          };
          "XF86AudioPrev" = {
            _props.allow-when-locked = true;
            spawn = [ playerctl "previous" ];
          };

          # Brightness
          "XF86MonBrightnessUp" = {
            _props.allow-when-locked = true;
            spawn = [ brightnessctl "set" "+5%" ];
          };
          "XF86MonBrightnessDown" = {
            _props.allow-when-locked = true;
            spawn = [ brightnessctl "set" "5%-" ];
          };

          # Focus
          "${mod}+j".focus-window-or-workspace-down = { };
          "${mod}+k".focus-window-or-workspace-up = { };
          "${mod}+h".focus-column-left = { };
          "${mod}+l".focus-column-right = { };

          # Move
          "${mod}+Shift+j".move-window-down-or-to-workspace-down = { };
          "${mod}+Shift+k".move-window-up-or-to-workspace-up = { };
          "${mod}+Shift+h".move-column-left = { };
          "${mod}+Shift+l".move-column-right = { };

          # Workspaces
          "${mod}+1".focus-workspace = 1;
          "${mod}+2".focus-workspace = 2;
          "${mod}+3".focus-workspace = 3;
          "${mod}+4".focus-workspace = 4;
          "${mod}+5".focus-workspace = 5;
          "${mod}+6".focus-workspace = 6;
          "${mod}+7".focus-workspace = 7;
          "${mod}+8".focus-workspace = 8;
          "${mod}+9".focus-workspace = 9;
          "${mod}+0".focus-workspace = 10;

          "${mod}+Shift+1".move-column-to-workspace = 1;
          "${mod}+Shift+2".move-column-to-workspace = 2;
          "${mod}+Shift+3".move-column-to-workspace = 3;
          "${mod}+Shift+4".move-column-to-workspace = 4;
          "${mod}+Shift+5".move-column-to-workspace = 5;
          "${mod}+Shift+6".move-column-to-workspace = 6;
          "${mod}+Shift+7".move-column-to-workspace = 7;
          "${mod}+Shift+8".move-column-to-workspace = 8;
          "${mod}+Shift+9".move-column-to-workspace = 9;
          "${mod}+Shift+0".move-column-to-workspace = 10;

          # Window management
          "${mod}+r".expand-column-to-available-width = { };
          "${mod}+x".switch-preset-column-width = { };
          "${mod}+z".switch-preset-window-height = { };

          "${mod}+o" = {
            _props.repeat = false;
            toggle-overview = { };
          };

          "${mod}+tab".toggle-column-tabbed-display = { };
          "${mod}+f".fullscreen-window = { };
          "${mod}+Shift+f".toggle-window-floating = { };
          "${mod}+space".switch-focus-between-floating-and-tiling = { };
          "${mod}+q".close-window = { };
          "${mod}+semicolon".spawn = [ wlogout ];

          # Launchers
          "${mod}+d".spawn = [ rofi "-show" "drun" ];
          "${mod}+Return".spawn = [ kitty ];
          "${mod}+w".spawn = [ firefox ];
          "${mod}+a".spawn = [ pavucontrol ];
          "${mod}+v".spawn = [ "mpv" ];
          "${mod}+Shift+v".spawn = [ freetube ];
          "${mod}+Shift+m".spawn = [ pear-desktop ];
          "${mod}+t".spawn = [ kitty "$EDITOR" ];
          "${mod}+e".spawn = [ kitty yazi ];
          "${mod}+m".spawn = [ cantata ];
          "${mod}+s".spawn = [ kitty btm "-b" ];
          "${mod}+b".spawn = [ kitty bluetuith ];
          "${mod}+p".spawn = [ hyprpicker "-a" ];

          # Screenshots
          "Print".screenshot._props.show-pointer = false;
          "Shift+Print".screenshot-screen._props.show-pointer = false;

          # Equibop
          "alt+v".spawn = [ equibop "--toggle-mic" ];
          "alt+m".spawn = [ equibop "--toggle-deafen" ];

          # TODO: Customise these
          "${mod}+Shift+Slash".show-hotkey-overlay = { };
          "${mod}+Escape" = {
            _props.allow-inhibiting = false;
            toggle-keyboard-shortcuts-inhibit = { };
          };
          "${mod}+Shift+e".quit = { };
          "${mod}+Shift+p".power-off-monitors = { };

          "${mod}+Shift+Ctrl+h".move-column-to-monitor-left = { };
          "${mod}+Shift+Ctrl+j".move-column-to-monitor-down = { };
          "${mod}+Shift+Ctrl+k".move-column-to-monitor-up = { };
          "${mod}+Shift+Ctrl+l".move-column-to-monitor-right = { };

          "${mod}+Home".focus-column-first = { };
          "${mod}+End".focus-column-last = { };
          "${mod}+Ctrl+Home".move-column-to-first = { };
          "${mod}+Ctrl+End".move-column-to-last = { };

          "${mod}+WheelScrollDown" = {
            _props.cooldown-ms = 150;
            focus-workspace-down = { };
          };
          "${mod}+WheelScrollUp" = {
            _props.cooldown-ms = 150;
            focus-workspace-up = { };
          };
          "${mod}+Ctrl+WheelScrollDown" = {
            _props.cooldown-ms = 150;
            move-column-to-workspace-down = { };
          };
          "${mod}+Ctrl+WheelScrollUp" = {
            _props.cooldown-ms = 150;
            move-column-to-workspace-up = { };
          };

          "${mod}+WheelScrollRight".focus-column-right = { };
          "${mod}+WheelScrollLeft".focus-column-left = { };
          "${mod}+Ctrl+WheelScrollRight".move-column-right = { };
          "${mod}+Ctrl+WheelScrollLeft".move-column-left = { };
          "${mod}+Shift+WheelScrollDown".focus-column-right = { };
          "${mod}+Shift+WheelScrollUp".focus-column-left = { };
          "${mod}+Ctrl+Shift+WheelScrollDown".move-column-right = { };
          "${mod}+Ctrl+Shift+WheelScrollUp".move-column-left = { };

          "${mod}+BracketLeft".consume-or-expel-window-left = { };
          "${mod}+BracketRight".consume-or-expel-window-right = { };
          "${mod}+Comma".consume-window-into-column = { };
          "${mod}+Period".expel-window-from-column = { };

          "${mod}+Shift+r".switch-preset-column-width-back = { };
          "${mod}+Ctrl+r".reset-window-height = { };
          "${mod}+Minus".set-column-width = "-10%";
          "${mod}+Equal".set-column-width = "+10%";
          "${mod}+Shift+Minus".set-window-height = "-10%";
          "${mod}+Shift+Equal".set-window-height = "+10%";

          # "${mod}+Ctrl+m".maximize-window-to-edges = { };
          "${mod}+c".center-column = { };
          "${mod}+Ctrl+c".center-visible-columns = { };
        };

        _children = [
          # Window rules
          {
            window-rule = {
              match._props = { app-id = "^firefox$"; title = "^Chat - Twitch$"; };
              open-floating = true;
              opacity = 0.9;
            };
          }
          {
            window-rule = {
              match._props = { app-id = "^steam$"; };
              open-floating = true;
            };
          }
          {
            window-rule = {
              match._props = { app-id = "^steam$"; title = "^Steam$"; };
              open-floating = false;
            };
          }
          {
            window-rule = {
              match._props = { app-id = "^yad$"; };
              open-floating = true;
            };
          }
          {
            window-rule = {
              match._props = { app-id = "^gamescope$"; };
              open-floating = true;
            };
          }
          {
            window-rule = {
              match._props = { app-id = "^pcmanfm$"; };
              open-floating = true;
            };
          }

          # Startup
          { spawn-at-startup._args = [ playerctld ]; }
          { spawn-at-startup._args = [ lxpolkit ]; }
          { spawn-at-startup._args = [ turntable "-c" "org.mpris.MediaPlayer2.mpd" ]; }
          { spawn-at-startup._args = [ turntable "-c" "org.mpris.MediaPlayer2.YoutubeMusic" ]; }
          { spawn-at-startup._args = [ wlsunset ]; }
          { spawn-at-startup._args = [ dropbox ]; }
          { spawn-at-startup._args = [ easyEffects "-w" ]; }
          { spawn-at-startup._args = [ xrandr "--output" monitorCenter "--primary" ]; }
          { spawn-at-startup._args = [ waybar ]; }
          { spawn-at-startup._args = [ swaybg "-i" "${wallpaper}" "-m" "fill" ]; }
        ];
      };
  };
}
