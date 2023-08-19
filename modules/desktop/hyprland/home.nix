{ pkgs, host, ... }:

let
  directories = host.directories;

  waybar = "${pkgs.waybar}/bin/waybar";
  lxpolkit = "${pkgs.lxde.lxsession}/bin/lxpolkit";
  hyprpaper = "${pkgs.hyprpaper}/bin/hyprpaper";
  rclone = "${pkgs.rclone}/bin/rclone";
  hyprctl = "${pkgs.hyprland}/bin/hyprctl";

  swaylock = "${pkgs.swaylock}/bin/swaylock";
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
in
{
  imports = [
    ../hyprpaper/home.nix
    ../swaylock/home.nix
    ../waybar/home.nix
    ../rofi/home.nix
    ../mako/home.nix
    ../grim/home.nix
    ../shaders/home.nix
    # ../blueman/home.nix
  ];

  home.packages = with pkgs; [
    wl-clipboard
    pavucontrol
    # brightnessctl
    lxde.lxsession
  ];

  services = {
    # network-manager-applet.enable = true;
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

  wayland.windowManager.hyprland = {
    enable = true;
    xwayland.enable = true;
    extraConfig = ''
      dwindle {
        preserve_split = true 
      }
    '';
    settings = {
      general = {
        gaps_in = 5;
        gaps_out = 10;
        border_size = 1;
        layout = "dwindle";
      };

      input = {
        kb_layout = "gb";
        accel_profile = "flat";
      };

      exec = [
        "killall .waybar-wrapped; ${waybar}"
        "${hyprctl} keyword decoration:screen_shader ~/.config/hypr/shaders/temperature.glsl"
      ];

      exec-once = [
        "${hyprpaper}"
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
        "$mod SHIFT, e, exit"
        "$mod SHIFT, r, exec, hyprctl reload"
        "$mod SHIFT, s, togglesplit"
        "$mod SHIFT, space, togglefloating"
        "$mod SHIFT, tab, togglegroup"
        "$mod ALT, h, changegroupactive, f"
        "$mod ALT, l , changegroupactive, b"
        "$mod, bracketleft, exec, ${hyprctl} keyword decoration:screen_shader ~/.config/hypr/shaders/blank.glsl"
        "$mod, bracketright, exec, ${hyprctl} keyword decoration:screen_shader ~/.config/hypr/shaders/temperature.glsl"

        "$mod, h, movefocus, l"
        "$mod, l, movefocus, r"
        "$mod, k, movefocus, u"
        "$mod, j, movefocus, d"

        "$mod SHIFT, h, movewindow, l"
        "$mod SHIFT, l, movewindow, r"
        "$mod SHIFT, k, movewindow, u"
        "$mod SHIFT, j, movewindow, d"

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
      ];

      binde = [
        # Raise and lower volume (limit to 100%)
        ", XF86AudioRaiseVolume, exec, ${wpctl} set-volume -l 1.0 @DEFAULT_AUDIO_SINK@ 5%+"
        ", XF86AudioLowerVolume, exec, ${wpctl} set-volume -l 1.0 @DEFAULT_AUDIO_SINK@ 5%-"
        # Mute volume and microphone
        ", XF86AudioMute, exec, ${wpctl} set-mute @DEFAULT_AUDIO_SINK@ toggle"
        ", XF86AudioMicMute, exec, ${wpctl} set-mute @DEFAULT_AUDIO_SOURCE@ toggle"
      ];

      bindm = [
        # Move/resize windows with mod + LMB/RMB and dragging
        "$mod, mouse:272, movewindow"
        "$mod, mouse:273, resizewindow"
      ];
    };
  };
}
