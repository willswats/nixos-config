{ host, globals, pkgs, config, lib, ... }:

let
  gammastep = "${pkgs.gammastep}/bin/gammastep";
  gammastepToggle = pkgs.writeShellScript "gammastepToggle.sh" ''
    if pgrep gammastep; then
      killall .gammastep-wrap
    else
      ${gammastep}
    fi
  '';

  mullvad = "${pkgs.mullvad-vpn}/bin/mullvad";
  mullvadToggle = pkgs.writeShellScript "mullvadToggle.sh" ''
    if ${mullvad} status | grep 'Connected'; then
    	 ${mullvad} disconnect
    else
    	${mullvad} connect
    fi
  '';

  # Prevent microphone from being auto adjusted to lower than 100 (Discord)
  # This uses the "node.name" from wpctl inspect ID with pw-cli, it does not use the ID from wpctl as it changes when unplugged.
  # The way to use the name with pw-cli was found here https://gitlab.freedesktop.org/pipewire/wireplumber/-/issues/395
  # If @DEFAULT_AUDIO_SOURCE@ is used instead, it sets the speakers to 100% volume when the microphone is unplugged.
  wpctl = "${pkgs.wireplumber}/bin/wpctl";
  preventMicrophoneAutoAdjust = pkgs.writeShellScript "preventMicrophoneAutoAdjust.sh" ''
    while sleep 0.1; do ${wpctl} set-volume -l 1.0 $(pw-cli i alsa_input.usb-Blue_Microphones_Yeti_Stereo_Microphone_REV8-00.analog-stereo | grep -oP 'id: \K\w+') 100%; done
  '';

  # Create directories and symlinks from drive
  ensureExists =
    let
      directoriesToCreate = host.directoriesToCreate;
      drive = globals.directories.drive;

      desktopHostName = globals.hostNames.desktop;
      hostname = "${pkgs.hostname}/bin/hostname";

      compatDataDirectory = "~/.local/share/Steam/steamapps/compatdata/";
      saveDirectory = "/pfx/drive_c/users/steamuser/AppData/Roaming/";
      darkSouls3SaveDirectory = "${compatDataDirectory}374320${saveDirectory}DarkSoulsIII";
      eldenRingSeamlessCoopSaveDirectory = "${compatDataDirectory}4003086771${saveDirectory}EldenRing/"; # The ID for seamless co-op will change as it is added as a non-steam game
    in
    pkgs.writeShellScript "ensureExists.sh" ''
      mkdir -p ${directoriesToCreate}

      ln -s ${drive}/.dots/FreeTube/ ~/.config/

      host=$(${hostname})
      if [ "$host" = "${desktopHostName}" ]; then
        ln -s ${drive}/.dots/retroarch/ ~/.config/
        ln -s ${drive}/.dots/PCSX2/ ~/.config/
        ln -s ${drive}/.dots/rpcs3/ ~/.config/
        ln -s ${drive}/.dots/yuzu/ ~/.local/share/

        ln -s ${drive}/Games/Saves/DarkSouls3/* ${darkSouls3SaveDirectory}
        ln -s ${drive}/Games/Saves/EldenRingSeamlessCoop/* ${eldenRingSeamlessCoopSaveDirectory}
      fi
    '';
in
{
  wayland.windowManager.sway.config = {
    keybindings =
      let
        mod = config.wayland.windowManager.sway.config.modifier;
      in
      lib.mkOptionDefault
        {
          "${mod}+Shift+b" = "exec ${gammastepToggle}";
          "${mod}+Shift+v" = "exec ${mullvadToggle}";
        };
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

  wayland.windowManager.hyprland.settings = {
    bind = [
      "$mod shift, b, exec, ${gammastepToggle}"
      "$mod shift, v, exec, ${mullvadToggle}"
    ];
    exec-once = [
      "${ensureExists}"
      "${preventMicrophoneAutoAdjust}"
    ];
  };
}
