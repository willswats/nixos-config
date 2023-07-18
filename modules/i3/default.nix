{ lib, config, pkgs, ... }:

{
  imports = [ ../dunst ../rofi ../polybar ];

  home.packages = with pkgs; [
    i3status
    i3lock
    feh
    pavucontrol
    brightnessctl
    redshift
    networkmanagerapplet
    lxde.lxsession
  ];

  services = {
    gnome-keyring.enable = true;
    picom.enable = true;
    network-manager-applet.enable = true;
    blueman-applet.enable = true;
    redshift = {
      enable = true;
      tray = true;
      provider = "geoclue2";
    };
  };

  xsession = {
    enable = true;
    scriptPath = ".hm-xsession";
    windowManager.i3 = {
      enable = true;
      config = {
        modifier = "Mod4";
        fonts = {
          names = [ "Hack Nerd Font" ];
          size = 14.0;
        };
        window.commands = [
          {
            command = "border pixel 1";
            criteria = { class = "^.*"; };
          }
        ];
        gaps = {
          inner = 10;
        };
        colors =
          let
            rosewater = "#f5e0dc";
            flamingo = "#f2cdcd";
            pink = "#f5c2e7";
            mauve = "#cba6f7";
            red = "#f38ba8";
            maroon = "#eba0ac";
            peach = "#fab387";
            green = "#a6e3a1";
            teal = "#94e2d5";
            sky = "#89dceb";
            sapphire = "#74c7ec";
            blue = "#89b4fa";
            lavender = "#b4befe";
            text = "#cdd6f4";
            subtext1 = "#bac2de";
            subtext0 = "#a6adc8";
            overlay2 = "#9399b2";
            overlay1 = "#7f849c";
            overlay0 = "#6c7086";
            surface2 = "#585b70";
            surface1 = "#45475a";
            surface0 = "#313244";
            base = "#1e1e2e";
            mantle = "#181825";
            crust = "#11111b";
          in
          {
            focused = {
              childBorder = "${blue}";
              background = "${base}";
              text = "${text}";
              indicator = "${mauve}";
              border = "${blue}";
            };
            focusedInactive = {
              childBorder = "${base}";
              background = "${base}";
              text = "${text}";
              indicator = "${base}";
              border = "${base}";
            };
            unfocused = {
              childBorder = "${base}";
              background = "${base}";
              text = "${text}";
              indicator = "${base}";
              border = "${base}";
            };
            urgent = {
              childBorder = "${red}";
              background = "${base}";
              text = "${red}";
              indicator = "${overlay0}";
              border = "${red}";
            };
            placeholder = {
              childBorder = "${overlay0}";
              background = "${base}";
              text = "${text}";
              indicator = "${overlay0}";
              border = "${overlay0}";
            };
          };
        bars = [ ];
        keybindings =
          let
            mod = config.xsession.windowManager.i3.config.modifier;
            exec = "exec --no-startup-id";
            monitor_left = "Virtual-1 ";
            monitor_center = "Virtual-1 ";
            refresh_i3status = "killall - SIGUSR1 i3status ";
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
          in
          lib.mkOptionDefault {

            # "XF86AudioRaiseVolume " = "${exec} pactl set-sink-volume @DEFAULT_SINK@ +10% && ${refresh_i3status}";
            # "XF86AudioLowerVolume" = "${exec} pactl set-sink-volume @DEFAULT_SINK@ -10% && ${refresh_i3status}";
            # "XF86AudioMute" = "${exec} pactl set-sink-mute @DEFAULT_SINK@ toggle && ${refresh_i3status}";
            # "XF86AudioMicMute" = "${exec} pactl set-source-mute @DEFAULT_SOURCE@ toggle && ${refresh_i3status}";

            # "XF86AudioPlay" = "${exec} playerctl play";
            # "XF86AudioPause" = "${exec} playerctl pause";
            # "XF86AudioNext" = "${exec} playerctl next";
            # "XF86AudioPrev" = "${exec} playerctl previous";

            # "XF86MonBrightnessUp" = "${exec} brightnessctl set +5%";
            # "XF86MonBrightnessDown" = "${exec} brightnessctl set 5%-";

            # Use Mouse+$mod to drag floating windows to their wanted position
            "floating_modifier" = "${mod}";

            # move tiling windows via drag & drop by left-clicking into the title bar,
            # or left-clicking anywhere into the window while holding the floating modifier.
            # tiling_drag modifier titlebar

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

            "${mod}+z" = "split v";
            "${mod}+x" = "split h";

            # toggle between all layouts
            "${mod}+Tab" = "layout toggle all";

            "${mod}+f" = "fullscreen toggle";

            # toggle tiling / floating
            "${mod}+Shift+space" = "floating toggle";

            # change focus between tiling / floating windows
            "${mod}+space" = "focus mode_toggle";

            # focus the parent or child container
            "${mod}+p" = "focus parent";
            "${mod}+shift+p" = "focus child";

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

            # assign workspaces to monitors
            # "workspace ${ws1}" = "output ${monitor_left}";
            # "workspace ${ws2}" = "output ${monitor_center}";
            # "workspace ${ws3}" = "output ${monitor_center}";
            # "workspace ${ws4}" = "output ${monitor_center}";
            # "workspace ${ws5}" = "output ${monitor_center}";
            # "workspace ${ws6}" = "output ${monitor_center}";
            # "workspace ${ws7}" = "output ${monitor_center}";
            # "workspace ${ws8}" = "output ${monitor_center}";
            # "workspace ${ws9}" = "output ${monitor_center}";
            # "workspace ${ws10}" = "output ${monitor_center}";

            # rofi
            "${mod}+d" = "${exec} rofi -modes 'run' -show drun";

            # lock i3
            "${mod}+semicolon" = "${exec} i3lock -c 1e1e2e";

            # kill focused window
            "${mod}+q" = "kill";

            # make the currently focused window a scratchpad
            "${mod}+minus" = "move scratchpad";

            # Show the first scratchpad window
            "${mod}+Shift+minus" = "scratchpad show";

            # restart i3 inplace (preserves your layout/session, can be used to upgrade i3)
            "${mod}+Shift+r" = "restart";

            # exit i3 (logs you out of your X session)
            "${mod}+Shift+e" = "${exec} i3-msg exit";

            # resize window (you can also use the mouse for that)
            #"mode" = "resize" {
            # These bindings trigger as soon as you enter the resize mode

            # Pressing left will shrink the window’s width.
            # Pressing right will grow the window’s width.
            # Pressing up will shrink the window’s height.
            # Pressing down will grow the window’s height.
            # "h" = "resize shrink width 10 px or 10 ppt";
            # "j" = "resize grow height 10 px or 10 ppt";
            # "k" = "resize shrink height 10 px or 10 ppt";
            # "l" = "resize grow width 10 px or 10 ppt";
            #
            # back to normal: Enter or Escape or "${mod}+r
            #   "Return" = "mode 'default'";
            #   "Escape" = "mode 'default'";
            #   "${mod}+r" = "mode 'default'";
            # };

            "${mod}+r" = "mode 'resize'";

            # programs
            "${mod}+Return" = "${exec} $TERMINAL";
            "${mod}+w" = "${exec} firefox"; # web browser
            "${mod}+e" = "${exec} pcmanfm"; # explorer
            "${mod}+t" = "${exec} alacritty -e nvim"; # text editor
            "${mod}+s" = "${exec} alacritty -e btm -b"; # system monitor 
          };

        startup = [
          {
            command = "feh --no-fehbg --bg-fill ~/nixos-config/wallpapers/minimal-desert.png ~/nixos-config/wallpapers/minimal-desert.png";
            always = false;
            notification = false;
          }
          {
            command = "killall polybar;polybar -r";
            always = true;
            notification = false;
          }
          {

            command = "lxpolkit";
            always = false;
            notification = false;
          }
          {
            command = "rclone mount --vfs-cache-mode writes google-drive: ~/Drive";
            always = false;
            notification = false;
          }
          {
            command = "otd-daemon";
            always = false;
            notification = false;
          }
        ];
      };
    };
  };
}
