{ pkgs, ... }:

{
  home.packages = with pkgs; [ lazygit ];

  catppuccin.lazygit.enable = true;
  programs.lazygit = {
    enable = true;
    settings = {
      git = {
        disableForcePushing = true; # To ensure that a force push is not fat fingered
        overrideGpg = true; # To not get booted to shell on each commit
      };
    };
  };
}
