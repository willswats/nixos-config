{ pkgs, globals, ... }:

{
  home.packages = with pkgs; [
    gpu-screen-recorder-gtk
  ];

  xdg.configFile."gpu-screen-recorder/config" =
    let
      saveDir = "${globals.directories.home}/Videos";
    in
    {
      text = ''
        main.advanced_view true
        main.audio_codec opus
        main.audio_input Default input
        main.audio_input Default output
        main.codec auto
        main.color_range full
        main.fps 60
        main.framerate_mode cfr
        main.hide_window_when_recording false
        main.merge_audio_tracks false
        main.overclock false
        main.quality ultra
        main.record_area_height 1080
        main.record_area_option DP-1
        main.record_area_width 1920
        main.record_cursor false
        main.show_notifications true
        record.container mp4
        record.pause_recording_hotkey 0 0
        record.save_directory ${saveDir}
        record.start_recording_hotkey 0 0
        replay.container mp4
        replay.save_directory ${saveDir}
        replay.save_recording_hotkey 0 0
        replay.start_recording_hotkey 0 0
        replay.time 120
        streaming.custom.container flv
        streaming.custom.url 
        streaming.service twitch
        streaming.start_recording_hotkey 0 0
        streaming.twitch.key 
        streaming.youtube.key 
      '';
    };
}
