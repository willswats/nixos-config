{ pkgs
, globals
, host
, inputs
, ...
}:

{
  xdg.mimeApps = {
    defaultApplications = {
      "audio/mpeg" = [ "mpv.desktop" ]; # mp3
      "video/mp4" = [ "mpv.desktop" ]; # mp4
      "application/x-matroska" = [ "mpv.desktop" ]; # mkv
    };
  };

  programs.mpv = {
    enable = true;
    config = {
      volume = 100;
      keep-open = "yes"; # Keep mpv open when there is nothing left to play
      player-operation-mode = "pseudo-gui"; # Always open mpv as GUI (prevents mpv opening in terminal when using yazi)
      no-input-default-bindings = ""; # Disable default bindings, see https://github.com/mpv-player/mpv/blob/master/etc/input.conf for defaults
      screenshot-directory = "~/Pictures"; # Screenshot dir
      watch-later-dir = "${host.directories.drive}/.mpv/watch_later/"; # The directory in which to store the "watch later" temporary files.
      osd-font-size = 40;
      sub-font-size = 40;
      alang = "jpn"; # Preffer Japanese audio
      slang = "en"; # Preffer English subtitles
      osd-bar = "no"; # Replaced by uosc
      border = "no"; # Replaced by uosc
    };
    bindings =
      let
        uoscFlashTimeline = "script-binding uosc/flash-timeline;";
        uoscFlashVolume = "script-binding uosc/flash-volume";
        uoscFlashSpeed = "script-binding uosc/flash-speed";
        uoscFlashElementsControls = "script-message-to uosc flash-elements controls";
      in
      {
        # mpv
        q = "quit";
        Q = "quit-watch-later";

        f = "cycle fullscreen";
        "ESC" = "set fullscreen no";

        z = "add sub-delay -0.1";
        x = "add sub-delay +0.1";
        Z = "add sub-scale +0.1";
        X = "add sub-scale -0.1";
        "Ctrl+u" = "add sub-pos -1";
        "Ctrl+d" = "add sub-pos +1";

        "`" = "script-binding console/enable";

        MBTN_LEFT = "cycle pause; ${uoscFlashTimeline}";
        space = "cycle pause; ${uoscFlashTimeline}";

        "Ctrl+s" = "screenshot"; # Screenshot with subtitles
        "Shift+s" = "screenshot video"; # Screenshot without subtitles

        # uosc
        "+" = "no-osd add volume 5; ${uoscFlashVolume}";
        "-" = "no-osd add volume -5; ${uoscFlashVolume}";

        m = "no-osd cycle mute; ${uoscFlashVolume}";
        l = "no-osd cycle-values loop-playlist yes no; ${uoscFlashElementsControls}";
        L = "no-osd cycle-values loop-file yes no; ${uoscFlashElementsControls}";

        RIGHT = "seek 5 exact; ${uoscFlashTimeline}";
        LEFT = "seek -5 exact; ${uoscFlashTimeline}";
        "Shift+RIGHT" = "seek 1 exact; ${uoscFlashTimeline}";
        "Shift+LEFT" = "seek -1 exact; ${uoscFlashTimeline}";
        "Ctrl+RIGHT" = "seek 30; ${uoscFlashTimeline}";
        "Ctrl+LEFT" = "seek -30; ${uoscFlashTimeline}";

        "[" = "no-osd add speed -0.10; ${uoscFlashSpeed}";
        "]" = "no-osd add speed  0.10; ${uoscFlashSpeed}";

        MBTN_RIGHT = "script-binding uosc/menu";
        tab = "script-binding uosc/menu";
        t = "script-binding uosc/toggle-ui";
        i = "script-binding uosc/items"; # Opens playlist menu when playlist exists, or open-file menu otherwise
        s = "script-binding uosc/shuffle; ${uoscFlashElementsControls}";
        c = "script-binding uosc/subtitles";
        v = "script-binding uosc/stream-quality";
        n = "script-binding uosc/next;";
        p = "script-binding uosc/prev;";
        a = "no-osd cycle-values script-opts uosc-autoload=yes uosc-autoload=no; ${uoscFlashElementsControls}"; # Switch between autoplaying the next file or not using uosc autoload

        # memo
        h = "script-binding memo/memo-history";
        "Alt+RIGHT" = "script-binding memo/memo-next"; # Next history page
        "Alt+LEFT" = "script-binding memo/memo-prev"; # Prev history page

        # autosubsync
        C = "script-binding autosubsync-menu";

        # webtorrent-mpv-hook
        w = "script-binding webtorrent/toggle-info";

        # mpv-youtube-search
        "Alt+s" = "script-binding youtube_search/youtube_search_replace";
        "Alt+S" = "script-binding youtube_search/youtube_music_search_replace";
        "Alt+a" = "script-binding youtube_search/youtube_search_append";
        "Alt+A" = "script-binding youtube_search/youtube_music_search_append";
        "Alt+r" = "script-binding youtube_search/search_results_update";

        # reload
        "Ctrl+r" = "script-binding reload/reload_resume";

        # paste
        "Ctrl+v" = "script-binding paste/paste";
        "Ctrl+Shift+v" = "script-binding paste/paste_into_playlist";
      };
    scripts = with pkgs; [
      inputs.mpv-youtube-search.packages.${pkgs.system}.mpv-youtube-search
      mpvScripts.uosc # Proximity-based UI
      mpvScripts.thumbfast # Required for thumbnails in uosc
      mpvScripts.mpris # Allows control of the player using standard media keys
      mpvScripts.sponsorblock # Script for mpv to skip sponsored segments of YouTube videos
      mpvScripts.memo # Remember history
      mpvScripts.autosubsync-mpv # Auto sync subtitles
      mpvScripts.webtorrent-mpv-hook # Adds a hook that allows mpv to stream torrents
      mpvScripts.reload # Manual & automatic reloading of videos
      mpvScripts.builtins.autocrop # Auto crop black borders on videos
    ];
    scriptOpts = {
      uosc = {
        controls = "menu,gap,<video,audio>subtitles,<has_many_audio>audio,<has_many_video>video,<has_many_edition>editions,<stream>stream-quality,gap,space,<video,audio>speed,space,shuffle,loop-playlist,loop-file,toggle:hdr_auto:autoload@uosc,gap,prev,items,next,gap,fullscreen";
      };
      thumbfast = {
        network = "yes"; # Enable on network playback
      };
      sponsorblock = {
        skip_categories = "sponsor,interaction,selfpromo";
      };
      memo = {
        history_path = "${host.directories.drive}/.mpv/memo.log"; # Where the history is stored
      };
      webtorrent = {
        path = "${globals.directories.home}/Downloads/"; # Path to save downloaded files in. Can be set to "memory" to store all files in RAM.
      };
      youtube-search = {
        osd_message_duration = 0;
      };
      autocrop = {
        suppress_osd = true;
      };
    };
  };

  xdg.configFile."mpv/scripts/paste.lua".source = ./paste.lua;
}
