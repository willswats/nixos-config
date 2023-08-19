{ pkgs, host, ... }:

let
  directories = host.directories;

  waybar = "${pkgs.waybar}/bin/waybar";
  lxpolkit = "${pkgs.lxde.lxsession}/bin/lxpolkit";
  hyprpaper = "${pkgs.hyprpaper}/bin/hyprpaper";
  rclone = "${pkgs.rclone}/bin/rclone";

  swaylock = "${pkgs.swaylock}/bin/swaylock";
  firefox = "${pkgs.firefox}/bin/firefox";
  pcmanfm = "${pkgs.pcmanfm}/bin/pcmanfm";
  alacritty = "${pkgs.alacritty}/bin/alacritty";
  rofi = "${pkgs.rofi-wayland}/bin/rofi";
  nvim = "nvim"; # This is broken: "${pkgs.neovim}/bin/nvim";
  btm = "${pkgs.bottom}/bin/btm";
  spotify_player = "${pkgs.spotify-player}/bin/spotify_player";
in
{
  imports = [
    ../hyprpaper/home.nix
    ../swaylock/home.nix
    ../waybar/home.nix
    ../rofi/home.nix
    ../mako/home.nix
    # ../gammastep/home.nix
    # ../blueman/home.nix
  ];

  home.packages = with pkgs; [
    wl-clipboard
    pavucontrol
    # playerctl
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
    settings = {
      source = "~/.config/hypr/mocha.conf";

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
        "$mod, w, exec, ${firefox}"
        "$mod, e, exec, ${pcmanfm}"
        "$mod, t, exec, ${alacritty} -e ${nvim}"
        "$mod, s, exec, ${alacritty} -e ${btm} -b"
        "$mod, m, exec, ${alacritty} -e ${spotify_player}"
        "$mod SHIFT, semicolon, exec, ${swaylock}"

        # Hyprland
        "$mod, q, killactive"
        "$mod, f, fullscreen"
        "$mod SHIFT, e, exit"
        "$mod SHIFT, s, togglesplit"
        "$mod SHIFT, tab, togglegroup"
        "$mod SHIFT, space, togglefloating"
        "$mod, x, layoutmsg, preselect r"
        "$mod, z, layoutmsg, preselect d"

        # Move focus with mainMod + arrow keys
        "$mod, h, movefocus, l"
        "$mod, l, movefocus, r"
        "$mod, k, movefocus, u"
        "$mod, j, movefocus, d"

        "$mod SHIFT, h, movewindow, l"
        "$mod SHIFT, l, movewindow, r"
        "$mod SHIFT, k, movewindow, u"
        "$mod SHIFT, j, movewindow, d"

        # Switch workspaces with mod + [0-9]
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

        # Move active window to a workspace with mod + SHIFT + [0-9]
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

      bindm = [
        # Move/resize windows with mod + LMB/RMB and dragging
        "$mod, mouse:272, movewindow"
        "$mod, mouse:273, resizewindow"
      ];
    };
  };

  xdg.configFile."hypr/mocha.conf" = {
    text = ''
      $rosewaterAlpha = f5e0dc
      $flamingoAlpha  = f2cdcd
      $pinkAlpha      = f5c2e7
      $mauveAlpha     = cba6f7
      $redAlpha       = f38ba8
      $maroonAlpha    = eba0ac
      $peachAlpha     = fab387
      $yellowAlpha    = f9e2af
      $greenAlpha     = a6e3a1
      $tealAlpha      = 94e2d5
      $skyAlpha       = 89dceb
      $sapphireAlpha  = 74c7ec
      $blueAlpha      = 89b4fa
      $lavenderAlpha  = b4befe

      $textAlpha      = cdd6f4
      $subtext1Alpha  = bac2de
      $subtext0Alpha  = a6adc8

      $overlay2Alpha  = 9399b2
      $overlay1Alpha  = 7f849c
      $overlay0Alpha  = 6c7086

      $surface2Alpha  = 585b70
      $surface1Alpha  = 45475a
      $surface0Alpha  = 313244

      $baseAlpha      = 1e1e2e
      $mantleAlpha    = 181825
      $crustAlpha     = 11111b

      $rosewater = 0xfff5e0dc
      $flamingo  = 0xfff2cdcd
      $pink      = 0xfff5c2e7
      $mauve     = 0xffcba6f7
      $red       = 0xfff38ba8
      $maroon    = 0xffeba0ac
      $peach     = 0xfffab387
      $yellow    = 0xfff9e2af
      $green     = 0xffa6e3a1
      $teal      = 0xff94e2d5
      $sky       = 0xff89dceb
      $sapphire  = 0xff74c7ec
      $blue      = 0xff89b4fa
      $lavender  = 0xffb4befe

      $text      = 0xffcdd6f4
      $subtext1  = 0xffbac2de
      $subtext0  = 0xffa6adc8

      $overlay2  = 0xff9399b2
      $overlay1  = 0xff7f849c
      $overlay0  = 0xff6c7086

      $surface2  = 0xff585b70
      $surface1  = 0xff45475a
      $surface0  = 0xff313244

      $base      = 0xff1e1e2e
      $mantle    = 0xff181825
      $crust     = 0xff11111b
    '';
  };
}
