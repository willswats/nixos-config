{ host, globals, pkgs, config, lib, ... }:

let
  # Prevent microphone from being auto adjusted to lower than 100 (Discord)
  # When the microphone is unplugged, this can set the speakers to 100% volume instead (not an issue for me due to my setup).
  # For an alternative way of setting the microphone to 100 see here https://gitlab.freedesktop.org/pipewire/wireplumber/-/issues/395
  wpctl = "${pkgs.wireplumber}/bin/wpctl";
  preventMicrophoneAutoAdjust = pkgs.writeShellScript "preventMicrophoneAutoAdjust.sh" ''
    while sleep 0.1; do ${wpctl} set-volume -l 1.0 @DEFAULT_AUDIO_SOURCE@ 100%; done
  '';

  # Create directories and symlinks from drive
  ensureExists =
    let
      directoriesToCreate = host.directoriesToCreate;
      drive = host.directories.drive;

      desktopHostName = globals.hostNames.desktop;
      hostname = "${pkgs.hostname}/bin/hostname";

      compatDataDirectory = "~/.local/share/Steam/steamapps/compatdata/";
      roamingDirectory = "/pfx/drive_c/users/steamuser/AppData/Roaming/";
      localDirectory = "/pfx/drive_c/users/steamuser/AppData/Local/";

      darkSouls3SaveDirectory = "${compatDataDirectory}374320${roamingDirectory}DarkSoulsIII";
      eldenRingSeamlessCoopSaveDirectory = "${compatDataDirectory}4003086771${roamingDirectory}EldenRing/"; # The ID for seamless co-op will change as it is added as a non-steam game
      kenshiSaveDirectory = "${compatDataDirectory}233860${localDirectory}kenshi/";
    in
    pkgs.writeShellScript "ensureExists.sh" ''
      mkdir -p ${directoriesToCreate}

      host=$(${hostname})
      if [ "$host" = "${desktopHostName}" ]; then
        ln -s ${drive}/.dots/retroarch/ ~/.config/
        ln -s ${drive}/.dots/PCSX2/ ~/.config/
        ln -s ${drive}/.dots/rpcs3/ ~/.config/
        ln -s ${drive}/.dots/yuzu/ ~/.local/share/

        ln -s ${drive}/Games/Saves/DarkSouls3/* ${darkSouls3SaveDirectory}
        ln -s ${drive}/Games/Saves/EldenRingSeamlessCoop/* ${eldenRingSeamlessCoopSaveDirectory}
        ln -s ${drive}/Games/Saves/Kenshi/* ${kenshiSaveDirectory}
      fi
    '';
in
{
  wayland.windowManager.sway.config = lib.mkIf config.wayland.windowManager.sway.enable {
    startup = [
      {
        command = "${ensureExists}";
        always = false;
      }
      {
        command = "${preventMicrophoneAutoAdjust}";
        always = false;
      }
    ];
  };

  wayland.windowManager.hyprland.settings = lib.mkIf config.wayland.windowManager.hyprland.enable {
    exec-once = [
      "${ensureExists}"
      "${preventMicrophoneAutoAdjust}"
    ];
  };
}
