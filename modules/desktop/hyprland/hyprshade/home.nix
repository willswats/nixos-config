{ pkgs, inputs, ... }:

{
  home.packages = with pkgs; [
    (hyprshade.override {
      hyprland = inputs.hyprland.packages.${pkgs.system}.hyprland;
    })
  ];

  xdg.configFile."hyprshade/config.toml" = {
    text = ''
      [[shades]]
      name = "blue-light-filter"
      start_time = 18:00:00
      end_time = 08:00:00 
    '';
  };

  # Required by the hyprshade service
  wayland.windowManager.hyprland.settings.exec-once = [ "dbus-update-activation-environment --systemd HYPRLAND_INSTANCE_SIGNATURE" ];

  # Keeps the systemd service in sync with the config.toml
  wayland.windowManager.hyprland.settings.exec = [
    "hyprshade install"
    "systemctl --user enable --now hyprshade.timer"
  ];
}
