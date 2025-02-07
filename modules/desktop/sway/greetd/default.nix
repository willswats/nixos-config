{ pkgs, ... }:

{
  imports = [ ../../wayland/greetd ];

  services.greetd.settings.default_session.command = "${pkgs.greetd.tuigreet}/bin/tuigreet --time --remember --cmd sway";
}
