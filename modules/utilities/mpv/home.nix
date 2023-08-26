{ pkgs, ... }:

{
  programs.mpv = {
    enable = true;
    config = { volume = 50; };
    scripts = with pkgs; [
      (callPackage ../../../pkgs/mpv-user-input { })
      (callPackage ../../../pkgs/mpv-youtube-search {
        mpv-user-input = {
          src = {
            outPath = (callPackage ../../../pkgs/mpv-user-input { });
          };
        };
      })
      mpvScripts.mpv-playlistmanager
    ];
  };
}
