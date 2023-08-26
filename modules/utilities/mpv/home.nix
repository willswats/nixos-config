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
}
