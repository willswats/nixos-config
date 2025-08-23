{ pkgs
, host
, globals
, ...
}:

{
  home.packages = with pkgs; [
    mpc
    mpris-scrobbler
  ];

  services.mpd =
    let
      driveDir = host.directories.drive;
    in
    {
      enable = true;
      musicDirectory = "${driveDir}/Entertainment/Music/Albums";
      playlistDirectory = "${driveDir}/Entertainment/Music/Playlists";
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

  services.mpdscribble = {
    enable = true;
    endpoints = {
      "listenbrainz" = {
        username = "XenBad";
        passwordFile = "${globals.directories.home}/.local/share/mpris-scrobbler/listenbrainz-token";
      };
    };
  };

  services.mpd-discord-rpc.enable = true;
}
