{ pkgs, ... }:

{
  imports = [
    ../waybar/home.nix
    ../rofi/home.nix
    ../dunst/home.nix
    ../blueman/home.nix
  ];

  home.packages = with pkgs; [
    wl-clipboard
  ];

  wayland.windowManager.hyprland = {
    enable = true;
    enableNvidiaPatches = true;
    xwayland.enable = true;
    settings = {
      general = {
        gaps_in = 5;
        gaps_out = 10;
        border_size = 1;
        layout = "dwindle";
      };

      "$mod" = "SUPER";

      bind = [
        # Applications
        "$mod, d, exec, rofi -show drun"
        "$mod, return, exec, alacritty"
        "$mod, w, exec, firefox"
        "$mod, e, exec, pcmanfm"
        "$mod, t, exec, neovim"
        "$mod, s, exec, btm -b"
        "$mod, m, exec, spotify_player"

        # Hyprland
        "$mod, q, killactive"
        "$mod, f, fullscreen"
        "$mod SHIFT, f, togglefloating"
        "$mod SHIFT, s, togglesplit"
        "$mod SHIFT, g, togglegroup"
        "$mod, x, layoutmsg, preselect l"
        "$mod, z, layoutmsg, preselect u"

        # Move focus with mainMod + arrow keys
        "$mod, h, movefocus, l"
        "$mod, l, movefocus, r"
        "$mod, k, movefocus, u"
        "$mod, j, movefocus, d"

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
    extraConfig = ''
      # See https://wiki.hyprland.org/Configuring/Monitors/
      monitor=DP-1, 1920x1080@144, 1920x0, 1, transform, 3
      monitor=DP-2, 1920x1080@144, 0x0, 1

      # Some default env vars.
      env = XCURSOR_SIZE,24
      env = LIBVA_DRIVER_NAME,nvidia
      env = XDG_SESSION_TYPE,wayland
      env = GBM_BACKEND,nvidia-drm
      env = __GLX_VENDOR_LIBRARY_NAME,nvidia
      env = WLR_NO_HARDWARE_CURSORS,1

      # For all categories, see https://wiki.hyprland.org/Configuring/Variables/
      input {
          kb_layout = gb
          kb_variant =
          kb_model =
          kb_options =
          kb_rules =

          follow_mouse = 1

          touchpad {
              natural_scroll = false
          }

          sensitivity = 0 # -1.0 - 1.0, 0 means no modification.
      }

      decoration {
          # See https://wiki.hyprland.org/Configuring/Variables/ for more

          rounding = 10

          blur {
              enabled = true
              size = 3
              passes = 1
          }

          drop_shadow = true
          shadow_range = 4
          shadow_render_power = 3
          col.shadow = rgba(1a1a1aee)
      }
 

      dwindle {
          # See https://wiki.hyprland.org/configuring/dwindle-layout/ for more
          pseudotile = true # master switch for pseudotiling. Enabling is bound to mainMod + P in the keybinds section below
          preserve_split = true # you probably want this
      }

    '';
  };
}
