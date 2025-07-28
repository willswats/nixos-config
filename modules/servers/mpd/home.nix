{ ... }:

{
  services.mpd = {
    enable = true;
    musicDirectory = "/home/will/Downloads/Music";
    extraConfig = ''
      audio_output {
        type "pipewire"
        name "My PipeWire Output"
      }
    '';
  };
}
