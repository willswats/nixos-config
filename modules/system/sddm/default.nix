{ pkgs, host, globals, ... }:

{
  environment.systemPackages = with pkgs; [
    (libsForQt5.callPackage ../../../pkgs/catppuccin-sddm {
      themeConfig = {
        CustomBackground = true;
        Background = globals.wallpaper;
      };
    })
    catppuccin-cursors.mochaDark
  ];

  services.xserver = {
    enable = true;
    layout = "gb";
    libinput = {
      enable = true;
      mouse = { accelProfile = "flat"; };
      touchpad = { accelProfile = "flat"; };
    };
    excludePackages = [ pkgs.xterm ];
    displayManager = {
      setupCommands = ''
        ${pkgs.xorg.xrandr}/bin/xrandr --output ${host.monitors.center} --primary --mode 1920x1080 --rate 144.00 --rotate normal --output ${host.monitors.left} --mode 1920x1080 --rate 144.00 --rotate right --left-of ${host.monitors.center}
      '';
      sddm = {
        enable = true;
        theme = "catppuccin-mocha";
        settings = {
          Theme = {
            CursorTheme = "Catppuccin-Mocha-Dark-Cursors";
          };
        };
      };
    };
  };
}
