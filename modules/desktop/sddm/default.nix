{ pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    (callPackage ./catppuccin-sddm.nix { })
  ];

  services.xserver = {
    enable = true;
    layout = "gb";
    excludePackages = [ pkgs.xterm ];
    displayManager.sddm = {
      enable = true;
      theme = "catppuccin-mocha";
    };
  };
}
