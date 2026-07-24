{ pkgs, ... }:

{
  systemd.user.services.seanime =
    let
      seanime = "${pkgs.seanime}/bin/seanime";
    in
    {
      Install = {
        WantedBy = [ "default.target" ];
      };

      Service = {
        Type = "simple";
        ExecStart = seanime;
        Restart = "always";
        RestartSec = "5";
      };

      Unit = {
        Description = "seanime";
        Requires = [ "dbus.socket" ];
        After = [ "dbus.socket" ];
      };
    };
}
