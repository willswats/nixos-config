{ pkgs, ... }:

{
  home.packages = with pkgs; [
    (callPackage ../../../pkgs/mpv-youtube-search { })
  ];

  programs.mpv = {
    enable = true;
    config = { volume = 50; };
    scripts = with pkgs; [
      # (callPackage ../../../pkgs/mpv-user-input { })
      (callPackage ../../../pkgs/mpv-youtube-search { })
      mpvScripts.mpv-playlistmanager
    ];
  };
}
