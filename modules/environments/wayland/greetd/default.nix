{ pkgs, config, ... }:

let
  cmd =
    if config.programs.sway.enable then
      "sway"
    else if config.programs.hyprland.enable then
      "Hyprland"
    else if config.programs.niri.enable then
      "niri-session"
    else "";
in
{
  services.greetd = {
    enable = true;
    settings.default_session.command = "${pkgs.tuigreet}/bin/tuigreet --time --remember --cmd ${cmd}";
  };

  # unlock GPG keyring on login
  security.pam.services.greetd.enableGnomeKeyring = true;
}
