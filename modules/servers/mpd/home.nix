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
      musicDirectory = "${driveDir}/Entertainment/Music/Albums";
      playlistDirectory = "${driveDir}/Entertainment/Music/Playlists";
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


  systemd.user.services.mpdris2-rs =
    let
      mpdris2-rs = "${pkgs.mpdris2-rs}/bin/mpdris2-rs";
    in
    {
      Install = {
        WantedBy = [ "default.target" ];
      };

      Service = {
        Type = "simple";
        ExecStart = mpdris2-rs;
        Restart = "always";
        RestartSec = "5";
      };

      Unit = {
        Description = "mpdris2-rs";
        Requires = [ "dbus.socket" ];
        After = [ "dbus.socket" ];
      };
    };
}
