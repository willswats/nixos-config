{ pkgs, ... }:

{
  programs.mpv = {
    enable = true;
    config = {
      volume = 50;
      osc = "no"; # Requirement of uosc
      osd-bar = "no"; # Requirement of uosc
      border = "no"; # Requirement of uosc
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
      mpvScripts.uosc
      mpvScripts.thumbfast
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
