{ host, ... }:

{
  services.mpd =
    let
      driveDir = host.directories.drive;
    in
    {
      enable = true;
      musicDirectory = "${driveDir}/Entertainment/Music/Albums";
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
        passwordFile = "/run/secrets/listenbrainz_password";
      };
    };
  };

  services.mpd-discord-rpc.enable = true;
}
