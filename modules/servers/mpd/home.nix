{ host, ... }:

{
  services.mpd =
    let
      driveDir = host.directories.drive;
    in
    {
      enable = true;
      musicDirectory = "${driveDir}/Entertainment/Music";
      extraConfig = ''
        audio_output {
          type "pipewire"
          name "My PipeWire Output"
        }
      '';
    };
}
