{ lib, config, pkgs, ... }:

{
  imports = [ ../dunst ../rofi ../polybar ];

  home.packages = with pkgs; [
    feh
    pavucontrol
    playerctl
    brightnessctl
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
    betterlockscreen = {
      enable = true;
      inactiveInterval = 60; # minutes (maximum 1 hour)
    };
  };

  xsession = {
    enable = true;
    scriptPath = ".hm-xsession";
    profileExtra = ''
      eval $(${pkgs.gnome3.gnome-keyring}/bin/gnome-keyring-daemon --daemonize --components=ssh,secrets)
      export SSH_AUTH_SOCK
    '';
    windowManager.i3 =
      let
        mod = config.xsession.windowManager.i3.config.modifier;
        exec = "exec --no-startup-id";
        refresh_i3status = "${pkgs.killall}/bin/killall - SIGUSR1 ${pkgs.i3status}/bin/i3status";

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

        # https://github.com/catppuccin/i3
        mauve = "#cba6f7";
        red = "#f38ba8";
        blue = "#89b4fa";
        text = "#cdd6f4";
        overlay0 = "#6c7086";
        base = "#1e1e2e";
      in
      {
        enable = true;
        config = {
          modifier = "Mod4";
          floating.modifier = "Mod4";
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
          bars = [ ];
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
            "XF86AudioRaiseVolume " = "${exec} ${pkgs.pulseaudio}/bin/pactl set-sink-volume @DEFAULT_SINK@ +10% && ${refresh_i3status}";
            "XF86AudioLowerVolume" = "${exec} ${pkgs.pulseaudio}/bin/pactl set-sink-volume @DEFAULT_SINK@ -10% && ${refresh_i3status}";
            # Mute audio and mic mute
            "XF86AudioMute" = "${exec} ${pkgs.pulseaudio}/bin/pactl set-sink-mute @DEFAULT_SINK@ toggle && ${refresh_i3status}";
            "XF86AudioMicMute" = "${exec} ${pkgs.pulseaudio}/bin/pactl set-source-mute @DEFAULT_SOURCE@ toggle && ${refresh_i3status}";

            # Setup play, pause, next and previous keys
            "XF86AudioPlay" = "${exec} ${pkgs.playerctl}/bin/playerctl play";
            "XF86AudioPause" = "${exec} ${pkgs.playerctl}/bin/playerctl pause";
            "XF86AudioNext" = "${exec} ${pkgs.playerctl}/bin/playerctl next";
            "XF86AudioPrev" = "${exec} ${pkgs.playerctl}/bin/playerctl previous";

            # Set brightness
            "XF86MonBrightnessUp" = "${exec} ${pkgs.brightnessctl}/bin/brightnessctl set +5%";
            "XF86MonBrightnessDown" = "${exec} ${pkgs.brightnessctl}/bin/brightnessctl set 5%-";

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
            "${mod}+Tab" = "layout toggle all"; # Toggle between layouts

            "floating_modifier" = "${mod}"; # Use Mouse+$mod to drag floating windows to their wanted position

            "${mod}+f" = "fullscreen toggle";
            "${mod}+space" = "floating toggle"; # Toggle floating window
            "${mod}+Shift+space" = "focus mode_toggle"; # Focus floating window

            "${mod}+minus" = "move scratchpad";
            "${mod}+Shift+minus" = "scratchpad show";

            "${mod}+q" = "kill";
            "${mod}+Shift+r" = "restart";
            "${mod}+Shift+e" = "${exec} ${pkgs.i3}/bin/i3-msg exit";
            "${mod}+semicolon" = "${exec} betterlockscreen --lock";

            "${mod}+d" = "${exec} ${pkgs.rofi}/bin/rofi -show drun";
            "${mod}+Return" = "${exec} ${pkgs.alacritty}/bin/alacritty";
            "${mod}+w" = "${exec} ${pkgs.firefox}/bin/firefox";
            "${mod}+e" = "${exec} ${pkgs.pcmanfm}/bin/pcmanfm";
            "${mod}+t" = "${exec} ${pkgs.alacritty}/bin/alacritty -e ${pkgs.neovim}/bin/nvim";
            "${mod}+s" = "${exec} ${pkgs.alacritty}/bin/alacritty -e ${pkgs.bottom}/bin/btm -b";
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
            {
              command = "${pkgs.feh}/bin/feh --no-fehbg --bg-fill ~/nixos-config/wallpapers/minimal-desert.png ~/nixos-config/wallpapers/minimal-desert.png";
              always = false;
              notification = false;
            }
            {
              command = "systemctl --user restart polybar";
              always = true;
              notification = false;
            }
            {
              command = "${pkgs.lxde.lxsession}/bin/lxpolkit";
              always = false;
              notification = false;
            }
            {
              command = "${pkgs.opentabletdriver}/bin/otd-daemon";
              always = false;
              notification = false;
            }
            {
              command = "${pkgs.rclone}/bin/rclone mount --vfs-cache-mode writes google-drive: ~/Drive";
              always = false;
              notification = false;
            }
          ];
        };
      };
  };
}
