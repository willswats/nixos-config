{ lib, config, pkgs, ... }:

{
  imports = [
    ../dunst/home.nix
    ../rofi/home.nix
    ../polybar/home.nix
    ../redshift/home.nix
    ../gnome-keyring/home.nix
  ];

  home.packages = with pkgs; [
    feh
    pavucontrol
    playerctl
    brightnessctl
    lxde.lxsession
  ];

  services = {
    picom.enable = true;
    network-manager-applet.enable = true;
    blueman-applet.enable = true;
    betterlockscreen = {
      enable = true;
      inactiveInterval = 60; # minutes (maximum 1 hour)
    };
  };

  xsession = {
    enable = true;
    scriptPath = ".hm-xsession";
    windowManager.i3 =
      let
        mod = config.xsession.windowManager.i3.config.modifier;
        exec = "exec --no-startup-id";
        refresh_i3status = "${pkgs.killall}/bin/killall - SIGUSR1 ${pkgs.i3status}/bin/i3status";

        directories = "~/AppImages ~/Drive ~/Code";
        image = "~/Code/nixos-config/wallpapers/minimal-desert.png";

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

        menu = "${pkgs.rofi}/bin/rofi";
        feh = "${pkgs.feh}/bin/feh";
        lockscreen = "${pkgs.betterlockscreen}/bin/betterlockscreen";
        terminal = "${pkgs.alacritty}/bin/alacritty";
        editor = "${pkgs.neovim}/bin/nvim";
        web_browser = "${pkgs.firefox}/bin/firefox";
        file_explorer = "${pkgs.pcmanfm}/bin/pcmanfm";
        system_monitor = "${pkgs.bottom}/bin/btm";
        pactl = "${pkgs.pulseaudio}/bin/pactl";
        playerctl = "${pkgs.playerctl}/bin/playerctl";
        brightnessctl = "${pkgs.brightnessctl}/bin/brightnessctl";
        lxpolkit = "${pkgs.lxde.lxsession}/bin/lxpolkit";
        rclone = "${pkgs.rclone}/bin/rclone";

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
          terminal = terminal;
          menu = menu;
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
            "XF86AudioRaiseVolume " = "${exec} ${pactl} set-sink-volume @DEFAULT_SINK@ +10% && ${refresh_i3status}";
            "XF86AudioLowerVolume" = "${exec} ${pactl} set-sink-volume @DEFAULT_SINK@ -10% && ${refresh_i3status}";
            # Mute audio and mic mute
            "XF86AudioMute" = "${exec} ${pactl} set-sink-mute @DEFAULT_SINK@ toggle && ${refresh_i3status}";
            "XF86AudioMicMute" = "${exec} ${pactl} set-source-mute @DEFAULT_SOURCE@ toggle && ${refresh_i3status}";

            # Setup play, pause, next and previous keys
            "XF86AudioPlay" = "${exec} ${playerctl} play";
            "XF86AudioPause" = "${exec} ${playerctl} pause";
            "XF86AudioNext" = "${exec} ${playerctl} next";
            "XF86AudioPrev" = "${exec} ${playerctl} previous";

            # Set brightness
            "XF86MonBrightnessUp" = "${exec} ${brightnessctl} set +5%";
            "XF86MonBrightnessDown" = "${exec} ${brightnessctl} set 5%-";

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

            "${mod}+f" = "fullscreen toggle";
            "${mod}+space" = "floating toggle"; # Toggle floating window
            "${mod}+Shift+space" = "focus mode_toggle"; # Focus floating window

            "${mod}+minus" = "move scratchpad";
            "${mod}+Shift+minus" = "scratchpad show";

            "${mod}+q" = "kill";
            "${mod}+Shift+r" = "restart";
            "${mod}+Shift+e" = "${exec} i3-msg exit";
            "${mod}+semicolon" = "${exec} ${lockscreen} -l";

            "${mod}+d" = "${exec} ${menu} -show drun";
            "${mod}+Return" = "${exec} ${terminal}";
            "${mod}+w" = "${exec} ${web_browser}";
            "${mod}+e" = "${exec} ${file_explorer}";
            "${mod}+t" = "${exec} ${terminal} -e ${editor}";
            "${mod}+s" = "${exec} ${terminal} -e ${system_monitor} -b";
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
              command = "${lockscreen} -u ${image}";
              always = false;
              notification = false;
            }
            {
              command = "${feh} --bg-fill ${image} --bg-fill ${image}";
              always = false;
              notification = false;
            }
            {
              command = "systemctl --user restart polybar";
              always = true;
              notification = false;
            }
            {
              command = "${lxpolkit}";
              always = false;
              notification = false;
            }
            {
              command = "${rclone} mount --vfs-cache-mode writes google-drive: ~/Drive";
              always = false;
              notification = false;
            }
            {
              command = "mkdir -p ${directories}";
              always = false;
              notification = false;
            }
          ];
        };
      };
  };
}