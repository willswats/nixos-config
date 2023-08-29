{ pkgs, ... }:

{
  programs.mpv = {
    enable = true;
    config = {
      volume = 50;
      keep-open = "yes"; # Keep mpv open when there is nothing left to play
      osc = "no"; # Requirement of uosc
      osd-bar = "no"; # Requirement of uosc
      border = "no"; # Requirement of uosc
    };
    bindings = {
      # mpv
      MBTN_LEFT = "cycle pause"; # Toggle pause/playback mode
      "-" = "no-osd add volume -5; script-message-to uosc flash-elements volume";
      "+" = "no-osd add volume 5; script-message-to uosc flash-elements volume";
      n = "playlist-next";
      p = "playlist-prev";
      l = "no-osd cycle-values loop-playlist yes no; script-message-to uosc flash-elements controls"; # Toggle loop-playlist
      L = "no-osd cycle-values loop-file yes no; script-message-to uosc flash-elements controls"; # Toggle loop-file
      # uosc
      MBTN_RIGHT = "script-binding uosc/menu";
      i = "script-binding uosc/items"; # Opens playlist menu when playlist exists, or open-file menu otherwise 
      s = "script-binding uosc/shuffle; script-message-to uosc flash-elements controls";
    };
    scripts = with pkgs; [
      (callPackage ../../../pkgs/mpv-user-input { })
      (callPackage ../../../pkgs/mpv-youtube-search {
        mpv-user-input = {
          src = {
            outPath = (callPackage ../../../pkgs/mpv-user-input { });
          };
        };
      })
      mpvScripts.uosc # Proximity-based UI
      mpvScripts.thumbfast # Required for thumbnails in uosc
      mpvScripts.mpris # Allows control of the player using standard media keys
    ];
    scriptOpts = {
      thumbfast = {
        network = "yes"; # Enable on network playback
      };
    };
  };

  xdg.configFile."mpv/scripts/paste.lua" = {
    text = ''
      local mp = require "mp"

      local opts = {
        -- Key used for pasting
        key_paste = "Ctrl+v",
        -- Duration of osd messages
        osd_message_duration = 5
      }

      local function paste()
        local clipboard = mp.command_native {
          name = "subprocess",
          playback_only = false,
          args = { "wl-paste", "--no-newline" },
          capture_stdout = true
        }.stdout
        mp.commandv("loadfile", clipboard)
        mp.osd_message("Pasted", opts.osd_message_duration)
      end

      mp.add_key_binding(opts.key_paste, "paste", paste)
    '';

  };
}
