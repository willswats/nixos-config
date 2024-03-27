{ pkgs, globals, ... }:

{
  home.packages = with pkgs; [
    (callPackage ../../../pkgs/quick-backup-cli { })
  ];

  xdg.configFile."quick-backup-cli/programs.csv" =
    let
      homeDir = "${globals.directories.home}/";
      backupsDir = "${globals.directories.drive}/Games/Backups/";
    in
    {
      text = ''
        Retroarch,${homeDir}.config/retroarch/,${backupsDir}retroarch/
        Yuzu,${homeDir}.config/yuzu/,${backupsDir}yuzu/
        RPCS3,${homeDir}.config/rpcs3/,${backupsDir}rpcs3/
        osu!,${homeDir}.local/share/osu/,${backupsDir}osu/
      '';
    };
}
