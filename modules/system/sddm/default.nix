{ pkgs, host, globals, ... }:

let
  fontName = globals.font.name;
  wallpaper = globals.wallpaper;
in
{
  environment.systemPackages = with pkgs; [
    # When changing SDDM themes, keep in mind that some of them don't seem to
    # apply until after a reboot
    (catppuccin-sddm.override {
      flavor = "mocha";
      font = fontName;
      fontSize = "10";
      background = "${wallpaper}";
      loginBackground = false;
    })
    catppuccin-cursors.mochaDark
  ];

  services.xserver = {
    enable = true;
    xkb.layout = "gb";
    excludePackages = [ pkgs.xterm ];
    displayManager.setupCommands = ''
      ${pkgs.xorg.xrandr}/bin/xrandr --output ${host.monitors.center} --primary --mode 1920x1080 --rate 144.00 --rotate normal --output ${host.monitors.left} --mode 1920x1080 --rate 144.00 --rotate right --left-of ${host.monitors.center}
    '';
  };

  services.libinput = {
    enable = true;
    mouse = { accelProfile = "flat"; };
    touchpad = { accelProfile = "flat"; };
  };

  services.displayManager = {
    sddm = {
      enable = true;
      package = pkgs.kdePackages.sddm; # pkgs.kdePackages.sddm is needed for catppuccin-sddm as it needs sddm-greeter-qt6
      theme = "catppuccin-mocha";
      settings = {
        Theme = {
          CursorTheme = "Catppuccin-Mocha-Dark-Cursors";
        };
      };
    };
  };
}
