{ pkgs, host, ... }:

{
  home.packages = with pkgs; [ rclone ];

  systemd.user.services.rclone-bisync =
    let
      driveDir = host.directories.drive;
      rclone = "${pkgs.rclone}/bin/rclone";
      rclone-bisync-command = pkgs.writeShellScript "rclone-bisync-command.sh" ''
        ${rclone} bisync filen: ${driveDir} \
          --create-empty-src-dirs \
          --compare size,modtime,checksum \
          --slow-hash-sync-only \
          --log-level INFO \
          --log-file "/home/will/.config/rclone/rclone.log" \
          --filters-file "/home/will/.config/rclone/bisync-filters.txt"
      '';
    in
    {
      Install = {
        WantedBy = [ "default.target" ];
      };

      Service = {
        Type = "oneshot";
        ExecStart = rclone-bisync-command.outPath;
      };

      Unit = {
        Description = "rclone bisync";
      };
    };
}
