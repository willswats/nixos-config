{ pkgs, host, ... }:


let
  swaylock = "${pkgs.swaylock}/bin/swaylock";
in
{
  imports = [
    ../hyprpaper/home.nix
    ../swaylock/home.nix
    ../waybar/home.nix
    ../rofi/home.nix
    ../mako/home.nix
    ../grim/home.nix
  ];

  home.packages = with pkgs; [
    wl-clipboard
    pavucontrol
    playerctl
    brightnessctl
    lxde.lxsession
  ];

  services = {
    swayidle = {
      enable = true;
      systemdTarget = "hyprland-session.target";
      timeouts = [{
        timeout = 600; # Seconds
        command = swaylock;
      }];
      events = [
        { event = "before-sleep"; command = swaylock; }
        { event = "lock"; command = swaylock; }
      ];
    };
  };

  wayland.windowManager.hyprland =
    let
      monitorCenter = host.monitors.center;
      monitorLeft = host.monitors.left;
      directories = host.directories;

      lxpolkit = "${pkgs.lxde.lxsession}/bin/lxpolkit";
      hyprpaper = "${pkgs.hyprpaper}/bin/hyprpaper";
      rclone = "${pkgs.rclone}/bin/rclone";
      hyprctl = "${pkgs.hyprland}/bin/hyprctl";

      firefox = "${pkgs.firefox}/bin/firefox";
      pcmanfm = "${pkgs.pcmanfm}/bin/pcmanfm";
      alacritty = "${pkgs.alacritty}/bin/alacritty";
      rofi = "${pkgs.rofi-wayland}/bin/rofi";
      nvim = "nvim"; # This is broken: "${pkgs.neovim}/bin/nvim";
      btm = "${pkgs.bottom}/bin/btm";
      spotify_player = "${pkgs.spotify-player}/bin/spotify_player";
      fish = "${pkgs.fish}/bin/fish";
      grim = "${pkgs.grim}/bin/grim";
      slurp = "${pkgs.slurp}/bin/slurp";
      wpctl = "${pkgs.wireplumber}/bin/wpctl";
      playerctl = "${pkgs.playerctl}/bin/playerctl";
      playerctld = "${pkgs.playerctl}/bin/playerctld";
      brightnessctl = "${pkgs.brightnessctl}/bin/brightnessctl";
    in
    {
      enable = true;
      xwayland.enable = true;
      settings = {
        general =
          let
            overlay0 = "0xff6c7086";
            blue = "0xff89b4fa";
          in
          {
            gaps_in = 5;
            gaps_out = 10;
            border_size = 1;
            "col.inactive_border" = overlay0;
            "col.active_border" = blue;
            "col.group_border" = overlay0;
            "col.group_border_active" = blue;
            "col.group_border_locked" = overlay0;
            "col.group_border_locked_active" = blue;
            layout = "dwindle";
          };

        input = {
          kb_layout = "gb";
          accel_profile = "flat";
        };

        dwindle = {
          preserve_split = true;
        };

        gestures = {
          workspace_swipe = true;
        };

        misc = {
          groupbar_titles_font_size = 14;
          # Fix Firefox flashing default hyprland wallpaper on resize (still occurs, but it's less noticeable)
          # https://github.com/hyprwm/Hyprland/issues/2817
          disable_hyprland_logo = true;
        };

        windowrulev2 = [
          "float, class:steam, title:Friends List"
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

        exec-once = [
          "${hyprpaper}"
          "${playerctld}"
          "${lxpolkit}"
          "${rclone} mount --vfs-cache-mode writes google-drive: ~/Drive"
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
          "$mod, s, exec, ${alacritty} -e ${btm} -b" # System monitor
          "$mod, m, exec, ${alacritty} -e ${spotify_player}" # Music player
          ", print, exec, ${fish} -c '${grim} -g (${slurp})'" # Screenshot utility
          "$mod SHIFT, semicolon, exec, ${swaylock}"

          # Hyprland
          "$mod, q, killactive"
          "$mod, f, fullscreen"
          "$mod shift, e, exit"
          "$mod shift, r, exec, ${hyprctl} reload"
          "$mod, minus, togglespecialworkspace"
          "$mod shift, minus, movetoworkspacesilent, special"
          "$mod shift, p, movetoworkspacesilent, m+0"
          "$mod shift, s, togglesplit"
          "$mod shift, g, togglegroup"
          "$mod shift, f, togglefloating"
          "$mod, tab, changegroupactive, f"
          "$mod shift, tab, changegroupactive, b"
          "$mod, bracketleft, exec, ${hyprctl} keyword decoration:screen_shader ~/.config/hypr/shaders/blank.glsl"
          "$mod, bracketright, exec, ${hyprctl} keyword decoration:screen_shader ~/.config/hypr/shaders/temperature.glsl"

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
      extraConfig = ''
        bind=$mod,R,submap,resize

        submap=resize

        binde=,h,resizeactive,10 0
        binde=,l,resizeactive,-10 0
        binde=,j,resizeactive,0 -10
        binde=,k,resizeactive,0 10

        bind=,escape,submap,reset 
        bind=$mod,R,submap,reset 

        submap=reset
      '';
    };


  xdg.configFile."hypr/shaders/blank.glsl" = {
    # https://github.com/hyprwm/Hyprland/issues/1140#issuecomment-1622495967
    text = ''
      precision mediump float;
      varying vec2 v_texcoord;
      uniform sampler2D tex;

      void main() {
          vec4 pixColor = texture2D(tex, v_texcoord);
          gl_FragColor = pixColor;
      }
    '';
  };

  xdg.configFile."hypr/shaders/temperature.glsl" = {
    # https://github.com/hyprwm/Hyprland/issues/1140#issuecomment-1335128437
    text = ''
      precision mediump float;
      varying vec2 v_texcoord;
      uniform sampler2D tex;

      const float temperature = 2600.0;
      const float temperatureStrength = 1.0;

      #define WithQuickAndDirtyLuminancePreservation
      const float LuminancePreservationFactor = 1.0;

      // function from https://www.shadertoy.com/view/4sc3D7
      // valid from 1000 to 40000 K (and additionally 0 for pure full white)
      vec3 colorTemperatureToRGB(const in float temperature){
          // values from: http://blenderartists.org/forum/showthread.php?270332-OSL-Goodness&p=2268693&viewfull=1#post2268693
          mat3 m = (temperature <= 6500.0) ? mat3(vec3(0.0, -2902.1955373783176, -8257.7997278925690),
                                                  vec3(0.0, 1669.5803561666639, 2575.2827530017594),
                                                  vec3(1.0, 1.3302673723350029, 1.8993753891711275)) :
                                             mat3(vec3(1745.0425298314172, 1216.6168361476490, -8257.7997278925690),
                                                  vec3(-2666.3474220535695, -2173.1012343082230, 2575.2827530017594),
                                                  vec3(0.55995389139931482, 0.70381203140554553, 1.8993753891711275));
          return mix(
              clamp(vec3(m[0] / (vec3(clamp(temperature, 1000.0, 40000.0)) + m[1]) + m[2]), vec3(0.0), vec3(1.0)),
              vec3(1.0),
              smoothstep(1000.0, 0.0, temperature)
          );
      }

      void main() {
          vec4 pixColor = texture2D(tex, v_texcoord);

          // RGB
          vec3 color = vec3(pixColor[0], pixColor[1], pixColor[2]);

      #ifdef WithQuickAndDirtyLuminancePreservation
          color *= mix(1.0,
                       dot(color, vec3(0.2126, 0.7152, 0.0722)) / max(dot(color, vec3(0.2126, 0.7152, 0.0722)), 1e-5),
                       LuminancePreservationFactor);
      #endif

          color = mix(color, color * colorTemperatureToRGB(temperature), temperatureStrength);

          vec4 outCol = vec4(color, pixColor[3]);

          gl_FragColor = outCol;
      }
    '';
  };
}
