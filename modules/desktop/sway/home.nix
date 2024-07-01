{ lib, config, pkgs, inputs, host, globals, ... }:

{
  imports = [
    ./swayidle/home.nix
    ./swaylock/home.nix
    ./waybar/home.nix
    ./grimshot/home.nix
    ../wayland/waybar/home.nix
    ../wayland/fuzzel/home.nix
    ../wayland/mako/home.nix
    ../wayland/gammastep/home.nix
  ];

  home.packages = with pkgs; [
    # Utilities
    ## GUI
    waypaper
    pavucontrol
    ## CLI
    wl-clipboard
    swaybg
    wev
  ];

  services.network-manager-applet.enable = true;

  wayland.windowManager.sway =
    let
      mod = config.wayland.windowManager.sway.config.modifier;

      wallpaper = globals.wallpaper;
      monitorCenter = host.monitors.center;
      monitorLeft = host.monitors.left;

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

      xrandr = "${pkgs.xorg.xrandr}/bin/xrandr";

      fuzzel = "${pkgs.fuzzel}/bin/fuzzel";
      swaylock = "${pkgs.swaylock-effects}/bin/swaylock";
      waybar = "${pkgs.waybar}/bin/waybar";

      firefox = "${pkgs.firefox}/bin/firefox";
      pavucontrol = "${pkgs.pavucontrol}/bin/pavucontrol";
      bitwarden = "${pkgs.bitwarden}/bin/bitwarden";
      spotify = "${pkgs.spotify}/bin/spotify";
      pcmanfm = "${pkgs.pcmanfm}/bin/pcmanfm";

      kitty = "${pkgs.kitty}/bin/kitty";
      yazi = "${inputs.yazi.packages.${pkgs.system}.yazi}/bin/yazi";
      btm = "${pkgs.bottom}/bin/btm";
      bluetuith = "${pkgs.bluetuith}/bin/bluetuith";
      grimshot = "${pkgs.sway-contrib.grimshot}/bin/grimshot";

      lxpolkit = "${pkgs.lxde.lxsession}/bin/lxpolkit";
      mullvadGui = "${pkgs.mullvad-vpn}/bin/mullvad-gui";
      dropbox = "${pkgs.dropbox}/bin/dropbox";
      autotiling = "${pkgs.autotiling}/bin/autotiling";

      wpctl = "${pkgs.wireplumber}/bin/wpctl";
      playerctl = "${pkgs.playerctl}/bin/playerctl";
      playerctld = "${pkgs.playerctl}/bin/playerctld";
      brightnessctl = "${pkgs.brightnessctl}/bin/brightnessctl";

      mullvad = "${pkgs.mullvad-vpn}/bin/mullvad";
      mullvadToggle = pkgs.writeShellScript "mullvadToggle.sh" ''
        if ${mullvad} status | grep 'Connected'; then
        	 ${mullvad} disconnect
        else
        	${mullvad} connect
        fi
      '';

      gammastep = "${pkgs.gammastep}/bin/gammastep";
      gammastepToggle = pkgs.writeShellScript "gammastepToggle.sh" ''
        if pgrep gammastep; then
          killall .gammastep-wrap
        else
          ${gammastep}
        fi
      '';

      # Prevent microphone from being auto adjusted to lower than 100 (Discord)
      # This uses the "node.name" from wpctl inspect ID with pw-cli, it does not use the ID from wpctl as it changes when unplugged.
      # The way to use the name with pw-cli was found here https://gitlab.freedesktop.org/pipewire/wireplumber/-/issues/395
      # If @DEFAULT_AUDIO_SOURCE@ is used instead, it sets the speakers to 100% volume when the microphone is unplugged.
      preventMicrophoneAutoAdjust = pkgs.writeShellScript "preventMicrophoneAutoAdjust.sh" ''
        while sleep 0.1; do ${wpctl} set-volume -l 1.0 $(pw-cli i alsa_input.usb-Blue_Microphones_Yeti_Stereo_Microphone_REV8-00.analog-stereo | grep -oP 'id: \K\w+') 100%; done
      '';

      # Create directories and symlinks from drive
      ensureExists =
        let
          directoriesToCreate = host.directoriesToCreate;
          drive = globals.directories.drive;

          desktopHostName = globals.hostNames.desktop;
          hostname = "${pkgs.hostname}/bin/hostname";

          compatDataDirectory = "~/.local/share/Steam/steamapps/compatdata/";
          saveDirectory = "/pfx/drive_c/users/steamuser/AppData/Roaming/";
          darkSouls3SaveDirectory = "${compatDataDirectory}374320${saveDirectory}DarkSoulsIII";
          eldenRingSeamlessCoopSaveDirectory = "${compatDataDirectory}4003086771${saveDirectory}EldenRing/"; # The ID for seamless co-op will change as it is added as a non-steam game
        in
        pkgs.writeShellScript "ensureExists.sh" ''
          mkdir -p ${directoriesToCreate}

          ln -s ${drive}/.dots/FreeTube/ ~/.config/

          host=$(${hostname})
          if [ "$host" = "${desktopHostName}" ]; then
            ln -s ${drive}/.dots/retroarch/ ~/.config/
            ln -s ${drive}/.dots/PCSX2/ ~/.config/
            ln -s ${drive}/.dots/rpcs3/ ~/.config/
            ln -s ${drive}/.dots/yuzu/ ~/.local/share/

            ln -s ${drive}/Games/Saves/DarkSouls3/* ${darkSouls3SaveDirectory}
            ln -s ${drive}/Games/Saves/EldenRingSeamlessCoop/* ${eldenRingSeamlessCoopSaveDirectory}
          fi
        '';

      mauve = "#${globals.colours.mauve}";
      blue = "#${globals.colours.blue}";
      text = "#${globals.colours.text}";
      overlay0 = "#${globals.colours.overlay0}";
      base = "#${globals.colours.base}";
    in
    {
      enable = true;
      wrapperFeatures.gtk = true;
      package = pkgs.swayfx;
      checkConfig = false; # workaround for https://github.com/nix-community/home-manager/issues/5307
      config = {
        modifier = "Mod4";
        terminal = kitty;
        menu = fuzzel;
        fonts = {
          names = [ "Hack Nerd Font" ];
          size = 14.0;
        };
        window.commands = [
          {
            command = "border pixel 2";
            criteria = { class = "^.*"; };
          }
          # Kitty
          {
            command = "opacity 0.9";
            criteria = { app_id = "kitty"; };
          }
          # Chatterino
          {
            command = "floating enable, opacity 0.9";
            criteria = { app_id = "com.chatterino."; };
          }
          # Steam
          {
            command = "floating enable";
            criteria = { class = "steam"; title = "Friends List"; };
          }
          {
            command = "floating enable";
            criteria = { class = "steam"; title = "Steam Settings"; };
          }
          {
            command = "floating enable";
            criteria = { class = "steam"; title = "Game Servers"; };
          }
          {
            command = "floating enable";
            criteria = { class = "steam"; title = "Screenshot Manager"; };
          }
        ];
        gaps = { inner = 10; };
        bars = [{ command = waybar; }];
        input = {
          "*" = {
            xkb_layout = "gb";
            accel_profile = "flat";
          };
          "type:touchpad" = {
            natural_scroll = "enabled";
            scroll_factor = "0.5";
            tap = "enabled";
            tap_button_map = "lrm";
          };
        };
        output = {
          "*" = {
            res = "1920x1080@144Hz";
            bg = "${wallpaper} fill";
          };
        };
        seat = {
          seat0 = {
            xcursor_theme = "catppuccin-mocha-dark-cursors 32";
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
            indicator = "${overlay0}";
            border = "${overlay0}";
            childBorder = "${overlay0}";
          };
          unfocused = {
            background = "${base}";
            text = "${text}";
            indicator = "${overlay0}";
            border = "${overlay0}";
            childBorder = "${overlay0}";
          };
          urgent = {
            background = "${base}";
            text = "${text}";
            indicator = "${overlay0}";
            border = "${overlay0}";
            childBorder = "${overlay0}";
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
          "${mod}+tab" = "layout tabbed"; # Toggle tabbed
          "${mod}+Shift+tab" = "layout toggle splith splitv"; # Toggle between splith and splitv

          "${mod}+f" = "fullscreen toggle";
          "${mod}+Shift+f" = "floating toggle";
          "${mod}+space" = "focus mode_toggle";

          "${mod}+Shift+minus" = "move scratchpad";
          "${mod}+minus" = "scratchpad show";

          "${mod}+q" = "kill";
          "${mod}+Shift+r" = "exec swaymsg reload";
          "${mod}+Shift+e" = "exec swaymsg exit";
          "${mod}+Shift+semicolon" = "exec ${swaylock}";

          "${mod}+d" = "exec ${fuzzel}";

          "${mod}+Return" = "exec ${kitty}"; # Terminal

          "${mod}+w" = "exec ${firefox}"; # Web browser
          "${mod}+a" = "exec ${pavucontrol}"; # Audio manager
          "${mod}+p" = "exec ${bitwarden}"; # Password manager
          "${mod}+m" = "exec mpv"; # Media player (not specifying the binary as it doesn't load plugins in the nix-store)
          "${mod}+Shift+m" = "exec ${spotify}"; # Music player

          "${mod}+e" = "exec ${kitty} ${yazi}"; # File explorer
          "${mod}+t" = "exec ${kitty} nvim"; # Text editor (not specifying the binary as it doesn't load my config)
          "${mod}+s" = "exec ${kitty} ${btm} -b"; # Process monitor
          "${mod}+b" = "exec ${kitty} ${bluetuith}"; # Bluetooth manager

          "${mod}+Shift+b" = "exec ${gammastepToggle}"; # Toggle Gammastep
          "${mod}+Shift+v" = "exec ${mullvadToggle}"; # VPN

          "${mod}+Print" = "exec ${grimshot} --notify save output";
          "${mod}+Shift+Print" = "exec ${grimshot} --notify save area";
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
            command = "${mullvadGui}";
            always = false;
          }
          {
            command = "${dropbox}";
            always = false;
          }
          # Misc
          {
            command = "${pcmanfm} --daemon-mode"; # Run as dameon to prevent pcmanfm from opening slowly on first launch (bug)
            always = false;
          }
          {
            command = "${ensureExists}";
            always = false;
          }
          {
            command = "${preventMicrophoneAutoAdjust}";
            always = false;
          }
          {
            command = "${xrandr} --output ${monitorCenter} --primary"; # Ensures that xwindows (especially steam games) use the center monitor
            always = false;
          }
          {
            command = "${autotiling}";
            always = false;
          }
          # All services related to sway should be added here - workaround for https://discourse.nixos.org/t/sway-via-home-manager-startup-and-tray-services/45930
          {
            command = "systemctl --user restart swayidle.service";
            always = false;
          }
          {
            command = "systemctl --user restart network-manager-applet.service";
            always = false;
          }
          {
            command = "systemctl --user restart gammastep.service";
            always = false;
          }
        ];
      };
      extraConfig =
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

          corner_radius 10
        '';
    };
}
