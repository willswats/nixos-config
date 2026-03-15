{ pkgs, host, ... }:

{
  home.packages = with pkgs; [ rclone ];

  # TODO: uncomment and test when resync is finished
  # systemd.user.services.rclone-bisync =
  #   let
  #     driveDir = host.directories.drive;
  #     rclone = "${pkgs.rclone}/bin/rclone";
  #     rclone-bisync-command = pkgs.writeShellScript "rclone-bisync-command.sh" ''
  #       ${rclone} bisync filen: ${driveDir} \
  #         --create-empty-src-dirs \
  #         --resilient \
  #         --log-level INFO \
  #         --log-file "/home/will/.config/rclone/rclone.log" \
  #         --filters-file "/home/will/.config/rclone/bisync-filters.txt"
  #     '';
  #   in
  #   {
  #     Install = {
  #       WantedBy = [ "default.target" ];
  #     };

  #     Service = {
  #       Type = "oneshot";
  #       ExecStart = rclone-bisync-command.outPath;
  #     };

  #     Unit = {
  #       Description = "rclone bisync";
  #     };
  #   };
}
