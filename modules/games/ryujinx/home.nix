{ globals, pkgs, ... }:

{
  home.packages = with pkgs; [
    ryujinx
    (callPackage ../../../pkgs/evdevhook2 { })
  ];

  # The default Ryujinx.desktop launches Ryujinx.sh which does not exist
  # The pull request to fix Ryujinx.desktop is here: https://github.com/NixOS/nixpkgs/pull/278605
  # https://github.com/Ryujinx/Ryujinx/blob/master/distribution/linux/Ryujinx.desktop
  home.file.".local/share/applications/Ryujinx.desktop".text =
    ''
      [Desktop Entry]
      Version=1.0
      Name=Ryujinx
      Type=Application
      Icon=Ryujinx
      Exec=ryujinx %f
      Comment=A Nintendo Switch Emulator
      GenericName=Nintendo Switch Emulator
      Terminal=false
      Categories=Game;Emulator;
      MimeType=application/x-nx-nca;application/x-nx-nro;application/x-nx-nso;application/x-nx-nsp;application/x-nx-xci;
      Keywords=Switch;Nintendo;Emulator;
      StartupWMClass=Ryujinx
      PrefersNonDefaultGPU=true
    '';

  xdg.configFile."Ryujinx/Config.json" =
    let
      gameDir = "${globals.homeDir}/Dropbox/Games/Emulation/ROMs/Switch";
    in
    {
      text = ''
        {
          "version": 48,
          "enable_file_log": true,
          "backend_threading": "Auto",
          "res_scale": 1,
          "res_scale_custom": 1,
          "max_anisotropy": -1,
          "aspect_ratio": "Fixed16x9",
          "anti_aliasing": "None",
          "scaling_filter": "Fsr",
          "scaling_filter_level": 80,
          "graphics_shaders_dump_path": "",
          "logging_enable_debug": false,
          "logging_enable_stub": true,
          "logging_enable_info": true,
          "logging_enable_warn": true,
          "logging_enable_error": true,
          "logging_enable_trace": false,
          "logging_enable_guest": true,
          "logging_enable_fs_access_log": false,
          "logging_filtered_classes": [],
          "logging_graphics_debug_level": "None",
          "system_language": "AmericanEnglish",
          "system_region": "USA",
          "system_time_zone": "UTC",
          "system_time_offset": 0,
          "docked_mode": true,
          "enable_discord_integration": true,
          "check_updates_on_start": true,
          "show_confirm_exit": true,
          "hide_cursor": 1,
          "enable_vsync": true,
          "enable_shader_cache": true,
          "enable_texture_recompression": false,
          "enable_macro_hle": true,
          "enable_color_space_passthrough": false,
          "enable_ptc": true,
          "enable_internet_access": false,
          "enable_fs_integrity_checks": true,
          "fs_global_access_log_mode": 0,
          "audio_backend": "SDL2",
          "audio_volume": 0.1,
          "memory_manager_mode": "HostMappedUnsafe",
          "expand_ram": false,
          "ignore_missing_services": false,
          "gui_columns": {
            "fav_column": true,
            "icon_column": true,
            "app_column": true,
            "dev_column": true,
            "version_column": true,
            "time_played_column": true,
            "last_played_column": true,
            "file_ext_column": true,
            "file_size_column": true,
            "path_column": true
          },
          "column_sort": {
            "sort_column_id": 2,
            "sort_ascending": true
          },
          "game_dirs": [
            "${gameDir}"
          ],
          "shown_file_types": {
            "nsp": true,
            "pfs0": true,
            "xci": true,
            "nca": true,
            "nro": true,
            "nso": true
          },
          "window_startup": {
            "window_size_width": 941,
            "window_size_height": 1016,
            "window_position_x": 12,
            "window_position_y": 52,
            "window_maximized": false
          },
          "language_code": "en_US",
          "enable_custom_theme": false,
          "custom_theme_path": "",
          "base_style": "Dark",
          "game_list_view_mode": 0,
          "show_names": true,
          "grid_size": 2,
          "application_sort": 0,
          "is_ascending_order": true,
          "start_fullscreen": false,
          "show_console": true,
          "enable_keyboard": false,
          "enable_mouse": false,
          "hotkeys": {
            "toggle_vsync": "F1",
            "screenshot": "F8",
            "show_ui": "F4",
            "pause": "F5",
            "toggle_mute": "F2",
            "res_scale_up": "Unbound",
            "res_scale_down": "Unbound",
            "volume_up": "Unbound",
            "volume_down": "Unbound"
          },
          "keyboard_config": [],
          "controller_config": [],
          "input_config": [
            {
              "left_joycon_stick": {
                "joystick": "Left",
                "invert_stick_x": false,
                "invert_stick_y": false,
                "rotate90_cw": false,
                "stick_button": "LeftStick"
              },
              "right_joycon_stick": {
                "joystick": "Right",
                "invert_stick_x": false,
                "invert_stick_y": false,
                "rotate90_cw": false,
                "stick_button": "RightStick"
              },
              "deadzone_left": 0.1,
              "deadzone_right": 0.1,
              "range_left": 1,
              "range_right": 1,
              "trigger_threshold": 0.5,
              "motion": {
                "slot": 0,
                "alt_slot": 0,
                "mirror_input": false,
                "dsu_server_host": "127.0.0.1",
                "dsu_server_port": 26760,
                "motion_backend": "CemuHook",
                "sensitivity": 100,
                "gyro_deadzone": 1,
                "enable_motion": true
              },
              "rumble": {
                "strong_rumble": 1,
                "weak_rumble": 1,
                "enable_rumble": false
              },
              "left_joycon": {
                "button_minus": "Back",
                "button_l": "LeftShoulder",
                "button_zl": "LeftTrigger",
                "button_sl": "Unbound",
                "button_sr": "Unbound",
                "dpad_up": "DpadUp",
                "dpad_down": "DpadDown",
                "dpad_left": "DpadLeft",
                "dpad_right": "DpadRight"
              },
              "right_joycon": {
                "button_plus": "Start",
                "button_r": "RightShoulder",
                "button_zr": "RightTrigger",
                "button_sl": "Unbound",
                "button_sr": "Unbound",
                "button_x": "Y",
                "button_b": "A",
                "button_y": "X",
                "button_a": "B"
              },
              "version": 1,
              "backend": "GamepadSDL2",
              "id": "0-56570005-054c-0000-e60c-000000810000",
              "controller_type": "JoyconPair",
              "player_index": "Player1"
            }
          ],
          "graphics_backend": "Vulkan",
          "preferred_gpu": "0x1002_0x73DF",
          "multiplayer_mode": 0,
          "multiplayer_lan_interface_id": "0",
          "use_hypervisor": true
        }
      '';
    };
}
