{ pkgs, ... }:

{
  home.packages = with pkgs; [ lazygit ];

  programs.lazygit = {
    enable = true;
    catppuccin.enable = true;
    settings = {
      git = {
        disableForcePushing = true; # To ensure that a force push is not fat fingered
        overrideGpg = true; # To not get booted to shell on each commit
      };
    };
  };
}
