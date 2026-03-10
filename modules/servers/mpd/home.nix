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

        audio_output {
          type "httpd"
          name "My HTTP Stream"
          encoder "vorbis"
          quality "5.0"
          bind_to_address "0.0.0.0"
          port "8000"
        }
      '';
    };

  services.mpdris2 = {
    enable = true;
    notifications = true;
  };
}
