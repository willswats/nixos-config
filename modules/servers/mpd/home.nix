{ pkgs
, host
, ...
}:

{
  home.packages = with pkgs; [
    mpc
  ];

  services.mpd =
    let
      driveDir = host.directories.drive;
    in
    {
      enable = true;
      musicDirectory = "${driveDir}/Entertainment/Music";
      playlistDirectory = "${driveDir}/Entertainment/Music/M3UPlaylists";
      network.listenAddress = "any";
      network.port = 6600;
      extraConfig = ''
        audio_output {
          type "pipewire"
          name "My PipeWire Output"
        }
      '';
    };

  services.mpdris2 = {
    enable = true;
    notifications = true;
  };
}
