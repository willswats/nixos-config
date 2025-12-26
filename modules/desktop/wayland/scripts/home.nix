{ host
, globals
, pkgs
, ...
}:

{
  systemd.user.services.ensureDirsExist =
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

      ensureDirsExist = pkgs.writeShellScript "ensureDirsExist.sh" ''
        mkdir -p ${directoriesToCreate}
        ln -s ${drive}/.dots/FreeTube ~/.config/
        ln -s ${drive}/.dots/Youtube\ Music ~/.config/

        host=$(${hostname})
        if [ "$host" = "${desktopHostName}" ]; then
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
      Install = {
        WantedBy = [ "default.target" ];
      };

      Service = {
        Type = "oneshot";
        ExecStart = ensureDirsExist.outPath;
        Environment = "PATH=${pkgs.git}/bin:${pkgs.coreutils}/bin:$PATH";
      };

      Unit = {
        Description = "Ensure certain directories exist";
      };
    };
}
