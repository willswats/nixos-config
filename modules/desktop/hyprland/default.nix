{ ... }:

{
  imports = [
    ../blueman
    ../swaylock
  ];

  services.xserver = {
    enable = true;
    displayManager.sddm = {
      enable = true;
    };
  };

  programs.hyprland = {
    enable = true;
    xwayland.enable = true;
    enableNvidiaPatches = true;
  };
}
