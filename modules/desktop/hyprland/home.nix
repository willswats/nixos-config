{ pkgs, host, ... }:

let
  directories = host.directories;
in
{
  imports = [
    ../hyprpaper/home.nix
    ../waybar/home.nix
    ../rofi/home.nix
    ../dunst/home.nix
    ../blueman/home.nix
  ];

  home.packages = with pkgs; [
    wl-clipboard
    pavucontrol
    playerctl
    brightnessctl
    lxde.lxsession
  ];

  services = {
    network-manager-applet.enable = true;
  };

  wayland.windowManager.hyprland = {
    enable = true;
    enableNvidiaPatches = true;
    xwayland.enable = true;
    settings = {
      source = "~/.config/hypr/mocha.conf";

      env = [
        "XCURSOR_SIZE,32"
        "LIBVA_DRIVER_NAME,nvidia"
        "XDG_SESSION_TYPE,wayland"
        "GBM_BACKEND,nvidia-drm"
        "GLX_VENDOR_LIBRARY_NAME,nvidia"
        "WLR_NO_HARDWARE_CURSORS,1"
      ];

      general = {
        gaps_in = 5;
        gaps_out = 10;
        border_size = 1;
        layout = "dwindle";
      };

      input = {
        kb_layout = "gb";
      };

      monitor = [
        "DP-1, 1920x1080@144, 1920x0, 1, transform, 3"
        "DP-2, 1920x1080@144, 0x0, 1"
      ];

      exec = [
        "killall hyprpaper; hyprpaper"
        "killall .waybar-wrapped; waybar"
      ];

      exec-once = [
        "lxpolkit"
        "rclone mount --vfs-cache-mode writes google-drive: ~/Drive"
        "mkdir -p ${directories}"
      ];

      "$mod" = "SUPER";

      bind = [
        # Applications
        "$mod, d, exec, rofi -show drun"
        "$mod, return, exec, alacritty"
        "$mod, w, exec, firefox"
        "$mod, e, exec, pcmanfm"
        "$mod, t, exec, alacritty -e nvim"
        "$mod, s, exec, alacritty -e btm -b"
        "$mod, m, exec, alacritty -e spotify_player"

        # Hyprland
        "$mod, q, killactive"
        "$mod, f, fullscreen"
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
