{ pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    nautilus
    file-roller
  ];

  programs.nautilus-open-any-terminal = {
    enable = true;
    terminal = "kitty";
  };

  programs.dconf.enable = true; # gnome settings
  services.gvfs.enable = true; # wastebasket
}
