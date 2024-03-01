{ lib, config, pkgs, host, globals, ... }:


let
  swaylock = "${pkgs.swaylock-effects}/bin/swaylock";
  swaymsg = "${pkgs.sway}/bin/swaymsg";
in
{
  imports = [
    ./waybar/home.nix
    ../wayland/swaylock/home.nix
    ../wayland/rofi/home.nix
    ../wayland/mako/home.nix
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
      timeouts = [
        {
          timeout = 1800; # 1800 seconds = 30 minutes
          command = swaylock;
        }
        {
          timeout = 600; # 600 seconds = 10 minutes
          command = "${swaymsg} 'output * power off'";
          resumeCommand = "${swaymsg} 'output * power on'";
        }
      ];
      events = [
        { event = "before-sleep"; command = swaylock; }
        { event = "lock"; command = swaylock; }
      ];
    };
  };

  wayland.windowManager.sway =
    let
      mod = config.wayland.windowManager.sway.config.modifier;

      wallpaper = globals.wallpaper;
      monitorLeft = host.monitors.left;
      directories = host.directories;

      ws1 = "1";
      ws2 = "2";
      ws3 = "3";
      ws4 = "4";
      ws5 = "5";
      ws6 = "6";
      ws7 = "7";
      ws8 = "8";
      ws9 = "9";
      ws10 = "10";

      waybar = "${pkgs.waybar}/bin/waybar";
      lxpolkit = "${pkgs.lxde.lxsession}/bin/lxpolkit";
      nm-applet = "${pkgs.networkmanagerapplet}/bin/nm-applet";
      dropbox = "${pkgs.dropbox}/bin/dropbox";
      firefox = "${pkgs.firefox}/bin/firefox";
      yazi = "${pkgs.yazi}/bin/yazi";
      wezterm = "${pkgs.wezterm}/bin/wezterm";
      rofi = "${pkgs.rofi-wayland}/bin/rofi";
      nvim = "nvim"; # Both of these break neovim (nixvim): "${pkgs.neovim}/bin/nvim" "${config.programs.nixvim.package}/bin/nvim"
      btm = "${pkgs.bottom}/bin/btm";
      bluetuith = "${pkgs.bluetuith}/bin/bluetuith";
      spotify = "${pkgs.spotify}/bin/spotify";
      mullvad = "${pkgs.mullvad-vpn}/bin/mullvad";
      mullvad-gui = "${pkgs.mullvad-vpn}/bin/mullvad-gui";
      mullvadToggle = "if ${mullvad} status | grep 'Connected'; then ${mullvad} disconnect; else ${mullvad} connect; fi";

      wpctl = "${pkgs.wireplumber}/bin/wpctl";
      playerctl = "${pkgs.playerctl}/bin/playerctl";
      playerctld = "${pkgs.playerctl}/bin/playerctld";
      brightnessctl = "${pkgs.brightnessctl}/bin/brightnessctl";

      mauve = "#${globals.colours.mauve}";
      red = "#${globals.colours.red}";
      blue = "#${globals.colours.blue}";
      text = "#${globals.colours.text}";
      overlay0 = "#${globals.colours.overlay0}";
      base = "#${globals.colours.base}";
    in
    {
      enable = true;
      config = {
        modifier = "Mod4";
        terminal = wezterm;
        menu = rofi;
        fonts = {
          names = [ "Hack Nerd Font" ];
          size = 14.0;
        };
        window.commands = [{
          command = "border pixel 2";
          criteria = { class = "^.*"; };
        }];
        gaps = { inner = 10; };
        bars = [{ command = waybar; }];
        input = {
          "*" = {
            xkb_layout = "gb";
            accel_profile = "flat";
          };
        };
        output = {
          "*" = {
            res = "1920x1080@144Hz";
            bg = "${wallpaper} fill";
          };
          ${monitorLeft} = {
            pos = "1080 0";
            transform = "90";
          };
        };
        seat = {
          seat0 = {
            xcursor_theme = "Catppuccin-Mocha-Dark-Cursors 32";
          };
        };
        colors = {
          focused = {
            background = "${base}";
            text = "${text}";
            indicator = "${mauve}";
            border = "${blue}";
            childBorder = "${blue}";
          };
          focusedInactive = {
            background = "${base}";
            text = "${text}";
            indicator = "${base}";
            border = "${base}";
            childBorder = "${base}";
          };
          unfocused = {
            background = "${base}";
            text = "${text}";
            indicator = "${base}";
            border = "${base}";
            childBorder = "${base}";
          };
          urgent = {
            background = "${base}";
            text = "${red}";
            indicator = "${overlay0}";
            border = "${red}";
            childBorder = "${red}";
          };
          placeholder = {
            background = "${base}";
            text = "${text}";
            indicator = "${overlay0}";
            border = "${overlay0}";
            childBorder = "${overlay0}";
          };
        };
        keybindings = lib.mkOptionDefault {
          # Raise and lower volume 
          "XF86AudioRaiseVolume" = "exec ${wpctl} set-volume -l 1.0 @DEFAULT_AUDIO_SINK@ 5%+";
          "XF86AudioLowerVolume" = "exec ${wpctl} set-volume -l 1.0 @DEFAULT_AUDIO_SINK@ 5%-";
          # Mute audio and mic mute
          "XF86AudioMute" = "exec ${wpctl} set-mute @DEFAULT_AUDIO_SINK@ toggle";
          "XF86AudioMicMute" = "exec ${wpctl} set-mute @DEFAULT_AUDIO_SOURCE@ toggle";

          # Setup play, pause, next and previous keys
          "XF86AudioPlay" = "exec ${playerctl} play-pause";
          "XF86AudioPause" = "exec ${playerctl} play-pause";
          "XF86AudioNext" = "exec ${playerctl} next";
          "XF86AudioPrev" = "exec ${playerctl} previous";

          # Set brightness
          "XF86MonBrightnessUp" = "exec ${brightnessctl} set +5%";
          "XF86MonBrightnessDown" = "exec ${brightnessctl} set 5%-";

          # change focus
          "${mod}+h" = "focus left";
          "${mod}+j" = "focus down";
          "${mod}+k" = "focus up";
          "${mod}+l" = "focus right";

          # move focused window
          "${mod}+Shift+h" = "move left";
          "${mod}+Shift+j" = "move down";
          "${mod}+Shift+k" = "move up";
          "${mod}+Shift+l" = "move right";

          # switch to workspace
          "${mod}+1" = "workspace number ${ws1}";
          "${mod}+2" = "workspace number ${ws2}";
          "${mod}+3" = "workspace number ${ws3}";
          "${mod}+4" = "workspace number ${ws4}";
          "${mod}+5" = "workspace number ${ws5}";
          "${mod}+6" = "workspace number ${ws6}";
          "${mod}+7" = "workspace number ${ws7}";
          "${mod}+8" = "workspace number ${ws8}";
          "${mod}+9" = "workspace number ${ws9}";
          "${mod}+0" = "workspace number ${ws10}";

          # move focused container to workspace
          "${mod}+Shift+1" = "move container to workspace number ${ws1}";
          "${mod}+Shift+2" = "move container to workspace number ${ws2}";
          "${mod}+Shift+3" = "move container to workspace number ${ws3}";
          "${mod}+Shift+4" = "move container to workspace number ${ws4}";
          "${mod}+Shift+5" = "move container to workspace number ${ws5}";
          "${mod}+Shift+6" = "move container to workspace number ${ws6}";
          "${mod}+Shift+7" = "move container to workspace number ${ws7}";
          "${mod}+Shift+8" = "move container to workspace number ${ws8}";
          "${mod}+Shift+9" = "move container to workspace number ${ws9}";
          "${mod}+Shift+0" = "move container to workspace number ${ws10}";

          "${mod}+r" = "mode resize";

          "${mod}+z" = "split v"; # Move split to vertical
          "${mod}+x" = "split h"; # Move split to horizontal
          "${mod}+Shift+t" = "layout tabbed"; # Toggle tabbed
          "${mod}+Shift+s" = "layout toggle splith splitv"; # Toggle between splith and splitv

          "${mod}+f" = "fullscreen toggle";
          "${mod}+Shift+f" = "floating toggle";
          "${mod}+space" = "focus mode_toggle";

          "${mod}+Shift+minus" = "move scratchpad";
          "${mod}+minus" = "scratchpad show";

          "${mod}+q" = "kill";
          "${mod}+Shift+r" = "exec swaymsg reload";
          "${mod}+Shift+e" = "exec swaymsg exit";
          "${mod}+Shift+semicolon" = "exec ${swaylock}";

          "${mod}+d" = "exec ${rofi} -show drun";
          "${mod}+Return" = "exec ${wezterm}"; # Terminal
          "${mod}+w" = "exec ${firefox}"; # Web browser
          "${mod}+e" = "exec ${wezterm} start -- ${yazi}"; # File explorer
          "${mod}+t" = "exec ${wezterm} start -- ${nvim}"; # Text editor
          "${mod}+s" = "exec ${wezterm} start -- ${btm} -b"; # Process monitor
          "${mod}+b" = "exec ${wezterm} start -- ${bluetuith}"; # Bluetooth manager
          "${mod}+m" = "exec ${spotify}"; # Music player
          "${mod}+Shift+v" = "exec ${mullvadToggle}"; # VPN
        };
        modes = {
          resize = {
            "h" = "resize shrink width 10 px or 10 ppt";
            "j" = "resize grow height 10 px or 10 ppt";
            "k" = "resize shrink height 10 px or 10 ppt";
            "l" = "resize grow width 10 px or 10 ppt";

            Down = "resize grow height 10 px or 10 ppt";
            Left = "resize shrink width 10 px or 10 ppt";
            Right = "resize grow width 10 px or 10 ppt";
            Up = "resize shrink height 10 px or 10 ppt";

            "Escape" = "mode default";
            "Return" = "mode default";
            "${mod}+r" = "mode default";
          };
        };
        startup = [
          # Daemons
          {
            command = "${playerctld}";
            always = false;
          }
          {
            command = "${lxpolkit}";
            always = false;
          }
          # Applets
          {
            command = "${nm-applet} --indicator";
            always = false;
          }
          {
            command = "${mullvad-gui}";
            always = false;
          }
          {
            command = "${dropbox}";
            always = false;
          }
          # Misc
          {
            command = "mkdir -p ${directories}";
            always = false;
          }
          {
            # Prevent microphone from being auto adjusted to lower than 100 (by Discord)
            command = "while sleep 0.1; do ${wpctl} set-volume -l 1.0 @DEFAULT_AUDIO_SOURCE@ 100%; done";
            always = false;
          }
        ];
      };
      extraConfig =
        let
          monitorCenter = host.monitors.center;
          monitorLeft = host.monitors.left;
        in
        # Fixes sway starting on ws10 - https://github.com/nix-community/home-manager/issues/695
        ''
          workspace ${ws1} output ${monitorLeft}
          workspace ${ws2} output ${monitorCenter}
          workspace ${ws3} output ${monitorCenter}
          workspace ${ws4} output ${monitorCenter}
          workspace ${ws5} output ${monitorCenter}
          workspace ${ws6} output ${monitorCenter}
          workspace ${ws7} output ${monitorCenter}
          workspace ${ws8} output ${monitorCenter}
          workspace ${ws9} output ${monitorCenter}
          workspace ${ws10} output ${monitorCenter}
        '';
    };
}
