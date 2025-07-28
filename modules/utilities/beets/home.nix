{ ... }:

{
  programs.beets = {
    enable = true;
    mpdIntegration = {
      enableUpdate = true; # mpdupdate is a very simple plugin for beets that lets you automatically update MPD’s index whenever you change your beets library.
    };
  };
}
