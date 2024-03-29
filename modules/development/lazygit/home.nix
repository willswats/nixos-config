{ pkgs, ... }:

{
  home.packages = with pkgs; [ lazygit ];

  programs.lazygit = {
    enable = true;
    settings = {
      git = {
        disableForcePushing = true; # To ensure that a force push is not fat fingered
        overrideGpg = true; # To not get booted to shell on each commit
      };
      gui.theme = {
        lightTheme = false;
        activeBorderColor = [ "#a6e3a1" "bold" ];
        inactiveBorderColor = [ "#cdd6f4" ];
        optionsTextColor = [ "#89b4fa" ];
        selectedLineBgColor = [ "#313244" ];
        selectedRangeBgColor = [ "#313244" ];
        cherryPickedCommitBgColor = [ "#94e2d5" ];
        cherryPickedCommitFgColor = [ "#89b4fa" ];
        unstagedChangesColor = [ "red" ];
      };
    };
  };
}
