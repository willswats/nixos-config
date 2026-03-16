{ pkgs, ... }:

{
  home.packages = with pkgs; [ filen-cli ];


  systemd.user.services.filen-sync =
    let
      filen = "${pkgs.filen-cli}/bin/filen";
    in
    {
      Install = {
        WantedBy = [ "default.target" ];
      };

      Service = {
        Type = "simple";
        ExecStart = "${filen} sync --continuous";
      };

      Unit = {
        Description = "filen sync";
      };
    };
}
