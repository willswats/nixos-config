{ pkgs, config, ... }:

let
  cmd = if config.programs.sway.enable == true then "sway" else "Hyprland";
in
{
  services.greetd = {
    enable = true;
    settings.default_session.command = "${pkgs.greetd.tuigreet}/bin/tuigreet --time --remember --cmd ${cmd}";
    vt = 1;
  };

  # unlock GPG keyring on login
  security.pam.services.greetd.enableGnomeKeyring = true;
}
