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

      ensureDirsExist = pkgs.writeShellScript "ensureDirsExist.sh" ''
        mkdir -p ${directoriesToCreate}
        ln -sf ${drive}/.dots/FreeTube ~/.config/
        ln -sf ${drive}/.dots/YouTube\ Music ~/.config/

        host=$(${hostname})
        if [ "$host" = "${desktopHostName}" ]; then          
          ln -sf ${drive}/.dots/PCSX2/ ~/.config/
          ln -sf ${drive}/.dots/rpcs3/ ~/.config/
          ln -sf ${drive}/.dots/yuzu/ ~/.local/share/
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
