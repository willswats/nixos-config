{ pkgs, globals, ... }:

let
  user = globals.user;
in
{
  systemd.timers."hyprshade" = {
    wantedBy = [ "timers.target" ];
    timerConfig = {
      OnCalendar = [
        "*-*-* 09:00:00"
        "*-*-* 18:00:00"
      ];
      Unit = "hyprshade.service";
    };
  };

  systemd.services."hyprshade" = {
    script = ''
      export HYPRLAND_INSTANCE_SIGNATURE=$(cat /home/${user}/.hyprland-instance-signature)
      ${pkgs.hyprshade}/bin/hyprshade auto
    '';
    path = with pkgs; [ hyprland ];
    serviceConfig = {
      Type = "oneshot";
      User = "${user}";
    };
  };
}
