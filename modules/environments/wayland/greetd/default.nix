{ pkgs, config, ... }:

let
  # NOTE: niri displays "Calling import environment without a list of variable names is deprecated.".
  # See the issue here for more details: https://github.com/niri-wm/niri/issues/254
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
    settings.default_session.command = "${pkgs.tuigreet}/bin/tuigreet --time --remember --background matrix --cmd ${cmd}";
  };

  # unlock GPG keyring on login
  security.pam.services.greetd.enableGnomeKeyring = true;
}
