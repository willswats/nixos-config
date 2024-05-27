{ pkgs, ... }:

{
  home.packages = with pkgs; [
    streamlink-twitch-gui-bin
    chatterino2
  ];

  xdg.configFile."streamlink/config" = {
    text = ''
      player=mpv
    '';
  };
}
